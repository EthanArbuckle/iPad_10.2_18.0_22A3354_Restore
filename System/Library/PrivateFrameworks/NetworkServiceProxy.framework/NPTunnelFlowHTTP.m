@implementation NPTunnelFlowHTTP

- (NPTunnelFlowHTTP)initWithTunnel:(id)a3 URL:(id)a4 extraFlowProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  NPTunnelFlowHTTP *v11;
  id *p_isa;
  NPTunnelFlowHTTP *v13;
  NSObject *v14;
  int *v16;
  char *v17;
  objc_super v18;
  unsigned int bytes;
  uint8_t buf[4];
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  bytes = 0;
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 4uLL, &bytes) < 0)
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = __error();
      v17 = strerror(*v16);
      *(_DWORD *)buf = 136315138;
      v21 = v17;
      _os_log_error_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_ERROR, "SecRandomCopyBytes failed: %s", buf, 0xCu);
    }

    v13 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)NPTunnelFlowHTTP;
    v11 = -[NPTunnelFlow initWithTunnel:appRule:hashKey:extraFlowProperties:](&v18, sel_initWithTunnel_appRule_hashKey_extraFlowProperties_, v8, 0, bytes, v10);
    p_isa = (id *)&v11->super.super.isa;
    if (v11)
    {
      -[NPTunnelFlow setFallbackDisabled:](v11, "setFallbackDisabled:", 1);
      objc_storeStrong(p_isa + 20, a4);
    }
    self = p_isa;
    v13 = self;
  }

  return v13;
}

- (void)postData:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  __CFString *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  dispatch_data_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[NPTunnelFlowHTTP url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[NPTunnelFlowHTTP postCompletionHandler](self, "postCompletionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v7[2](v7, 0);
  }
  else
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v6, "length");
      -[NPTunnelFlowHTTP url](self, "url");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      _os_log_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_DEFAULT, "Posting %lu bytes of data to %@", buf, 0x16u);

    }
    -[NPTunnelFlowHTTP setPostCompletionHandler:](self, "setPostCompletionHandler:", v7);
    if (!-[__CFString length](v9, "length"))
    {

      v9 = CFSTR("/");
    }
    v14 = objc_msgSend(v6, "length");
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NPTunnelFlowHTTP url](self, "url");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v14)
    {
      objc_msgSend(v16, "host");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("POST %@ HTTP/1.1\r\nHost: %@\r\nContent-Length: %lu\r\n\r\n"), v9, v18, objc_msgSend(v6, "length"));
    }
    else
    {
      objc_msgSend(v16, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTunnelFlowHTTP url](self, "url");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "host");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("GET %@ HTTP/1.1\r\nHost: %@\r\n\r\n"), v18, v21);

    }
    v22 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    objc_msgSend(v19, "dataUsingEncoding:", 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v22, "appendData:", v23);
      if (objc_msgSend(v6, "length"))
        objc_msgSend(v22, "appendData:", v6);
      v24 = objc_retainAutorelease(v22);
      v25 = dispatch_data_create((const void *)objc_msgSend(v24, "bytes"), objc_msgSend(v24, "length"), 0, 0);
      -[NPTunnelFlow handleAppData:](self, "handleAppData:", v25);

    }
  }

}

- (void)sendDataToClient:(id)a3 fromTunnel:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;
  uint8_t buf[4];
  unint64_t v44;
  __int16 v45;
  unint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v4 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v44 = -[NPTunnelFlow hashKey](self, "hashKey");
    v45 = 2048;
    v46 = -[NPTunnelFlow identifier](self, "identifier");
    v47 = 2048;
    v48 = objc_msgSend(v6, "length");
    _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) received %lu bytes of HTTP response", buf, 0x20u);
  }

  v42.receiver = self;
  v42.super_class = (Class)NPTunnelFlowHTTP;
  -[NPTunnelFlow sendDataToClient:fromTunnel:](&v42, sel_sendDataToClient_fromTunnel_, v6, v4);
  -[NPTunnelFlowHTTP responseData](self, "responseData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NPTunnelFlowHTTP responseData](self, "responseData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendData:", v6);
  }
  else
  {
    v9 = (void *)objc_msgSend(v6, "mutableCopy");
    -[NPTunnelFlowHTTP setResponseData:](self, "setResponseData:", v9);
  }

  if (!-[NPTunnelFlowHTTP receivedHeaders](self, "receivedHeaders"))
  {
    objc_msgSend(CFSTR("\r\n\r\n"), "dataUsingEncoding:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "rangeOfData:options:range:", v10, 0, 0, objc_msgSend(v6, "length"));
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = v11;
      v14 = v12;
      -[NPTunnelFlowHTTP responseData](self, "responseData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "subdataWithRange:", 0, v13);
      v16 = objc_claimAutoreleasedReturnValue();

      v41 = (void *)v16;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v16, 4);
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(": \r\n"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v17;
      objc_msgSend(v17, "componentsSeparatedByCharactersInSet:", v39);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "filteredArrayUsingPredicate:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v20, "count") >= 2)
      {
        objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "integerValue");

        if (v22 == 200)
          -[NPTunnelFlowHTTP setResponseSuccess:](self, "setResponseSuccess:", 1);
      }
      v23 = objc_msgSend(v20, "indexOfObject:", CFSTR("Content-Length"));
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v24 = v23;
        if (v23 < objc_msgSend(v20, "count") - 1)
        {
          v25 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "objectAtIndexedSubscript:", v24 + 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "integerValue"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NPTunnelFlowHTTP setResponseContentLength:](self, "setResponseContentLength:", v27);

        }
      }
      -[NPTunnelFlowHTTP responseData](self, "responseData");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "length");
      v30 = v13 + v14;

      if (v29 <= v30)
      {
        -[NPTunnelFlowHTTP setResponseData:](self, "setResponseData:", 0);
      }
      else
      {
        -[NPTunnelFlowHTTP responseData](self, "responseData");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "replaceBytesInRange:withBytes:length:", 0, v30, 0, 0);

      }
      -[NPTunnelFlowHTTP setReceivedHeaders:](self, "setReceivedHeaders:", 1);

    }
  }
  -[NPTunnelFlowHTTP responseContentLength](self, "responseContentLength");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[NPTunnelFlowHTTP responseData](self, "responseData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "length");
    -[NPTunnelFlowHTTP responseContentLength](self, "responseContentLength");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "unsignedIntegerValue");

    if (v35 == v37)
    {
      -[NPTunnelFlow tunnel](self, "tunnel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "closeFlow:", self);

      -[NPTunnelFlow closeFromTunnel](self, "closeFromTunnel");
    }
  }

}

BOOL __48__NPTunnelFlowHTTP_sendDataToClient_fromTunnel___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)closeClientFlowWithError:(int)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  -[NPTunnelFlowHTTP postCompletionHandler](self, "postCompletionHandler", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NPTunnelFlowHTTP postCompletionHandler](self, "postCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, BOOL))v5)[2](v5, -[NPTunnelFlowHTTP responseSuccess](self, "responseSuccess"));

    -[NPTunnelFlowHTTP setPostCompletionHandler:](self, "setPostCompletionHandler:", 0);
  }
  -[NPTunnelFlow tunnel](self, "tunnel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFlow:", -[NPTunnelFlow identifier](self, "identifier"));

}

- (BOOL)isClientFlowClosed
{
  return 0;
}

- (NSMutableData)responseData
{
  return (NSMutableData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setResponseData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (id)postCompletionHandler
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setPostCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (BOOL)receivedHeaders
{
  return self->_receivedHeaders;
}

- (void)setReceivedHeaders:(BOOL)a3
{
  self->_receivedHeaders = a3;
}

- (NSNumber)responseContentLength
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setResponseContentLength:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (BOOL)responseSuccess
{
  return self->_responseSuccess;
}

- (void)setResponseSuccess:(BOOL)a3
{
  self->_responseSuccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseContentLength, 0);
  objc_storeStrong(&self->_postCompletionHandler, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
}

@end
