@implementation AIASRequest

- (AIASRequest)initWithURL:(id)a3 data:(__CFDictionary *)a4 clientInfo:(id)a5 proxiedClientInfo:(id)a6 companionClientInfo:(id)a7 appleITeamId:(id)a8 appleIClientId:(id)a9 additionalHeaders:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  AIASRequest *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  AIASRequest *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  dispatch_semaphore_t v41;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  AIASRequest *v47;
  objc_super v48;
  _QWORD v49[2];
  _QWORD v50[2];
  const __CFString *v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v45 = a8;
  v20 = a9;
  v21 = a10;
  v48.receiver = self;
  v48.super_class = (Class)AIASRequest;
  v22 = -[AIASRequest init](&v48, sel_init);
  if (v22)
  {
    v44 = v16;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7458]), "initWithURL:", v16);
    -[AIASRequest setURLRequest:](v22, "setURLRequest:", v23);

    v51 = CFSTR("Version");
    v52[0] = CFSTR("1.0.1");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v24 = objc_claimAutoreleasedReturnValue();
    v49[0] = CFSTR("Header");
    v49[1] = CFSTR("Request");
    v43 = (void *)v24;
    v50[0] = v24;
    v50[1] = a4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v17;
    if (!v17)
    {
      AppleIDAuthSupportGetClientInfo();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v25, 100, 0, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      -[AIASRequest URLRequest](v22, "URLRequest");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setHTTPMethod:", CFSTR("POST"));

      -[AIASRequest URLRequest](v22, "URLRequest");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setHTTPBody:", v27);

      -[AIASRequest URLRequest](v22, "URLRequest");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setValue:forHTTPHeaderField:", CFSTR("text/x-xml-plist"), CFSTR("Content-Type"));

      -[AIASRequest URLRequest](v22, "URLRequest");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v17)
      {
        v33 = CFSTR("X-MMe-Client-Info");
      }
      else
      {
        objc_msgSend(v31, "setValue:forHTTPHeaderField:", v26, CFSTR("User-Agent"));

        -[AIASRequest URLRequest](v22, "URLRequest");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        v33 = CFSTR("X-GS-Client-Info");
      }
      objc_msgSend(v31, "setValue:forHTTPHeaderField:", v26, v33);
      v35 = v45;

      if (v18)
      {
        -[AIASRequest URLRequest](v22, "URLRequest");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setValue:forHTTPHeaderField:", v18, CFSTR("X-MMe-Proxied-Client-Info"));

      }
      if (v19)
      {
        -[AIASRequest URLRequest](v22, "URLRequest");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setValue:forHTTPHeaderField:", v19, CFSTR("X-MMe-Companion-Client-Info"));

      }
      if (v45)
      {
        -[AIASRequest URLRequest](v22, "URLRequest");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setValue:forHTTPHeaderField:", v45, CFSTR("X-Apple-I-Team-Id"));

      }
      if (v20)
      {
        -[AIASRequest URLRequest](v22, "URLRequest");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setValue:forHTTPHeaderField:", v20, CFSTR("X-Apple-I-Client-Id"));

      }
      if (v21)
      {
        v46[0] = MEMORY[0x24BDAC760];
        v46[1] = 3221225472;
        v46[2] = __127__AIASRequest_initWithURL_data_clientInfo_proxiedClientInfo_companionClientInfo_appleITeamId_appleIClientId_additionalHeaders___block_invoke;
        v46[3] = &unk_24BFE0CD8;
        v47 = v22;
        objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v46);

      }
      objc_msgSend(MEMORY[0x24BDBCEC8], "data");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[AIASRequest setData:](v22, "setData:", v40);

      -[AIASRequest setDone:](v22, "setDone:", 0);
      -[AIASRequest setSuccess:](v22, "setSuccess:", 0);
      v41 = dispatch_semaphore_create(0);
      -[AIASRequest setSema:](v22, "setSema:", v41);

      -[AIASRequest setError:](v22, "setError:", 0);
      -[AIASRequest setNetworkTaskDescription:](v22, "setNetworkTaskDescription:", 0);
      v34 = v22;
    }
    else
    {
      v34 = 0;
      v35 = v45;
    }

    v16 = v44;
  }
  else
  {
    v34 = 0;
    v26 = v17;
    v35 = v45;
  }

  return v34;
}

void __127__AIASRequest_initWithURL_data_clientInfo_proxiedClientInfo_companionClientInfo_appleITeamId_appleIClientId_additionalHeaders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ((unint64_t)objc_msgSend(v5, "length") < 2
      || (objc_msgSend(v5, "substringToIndex:", 2),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("X-")),
          v7,
          v8))
    {
      _AIDASOSLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v5;
        v10 = "Rejecting additional header %@: key must begin with X-";
LABEL_9:
        _os_log_impl(&dword_2067E5000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "URLRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "valueForHTTPHeaderField:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "URLRequest");
        v9 = objc_claimAutoreleasedReturnValue();
        -[NSObject setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", v6, v5);
        goto LABEL_10;
      }
      _AIDASOSLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v5;
        v10 = "Rejecting additional header %@: key is already set via other options";
        goto LABEL_9;
      }
    }
  }
  else
  {
    _AIDASOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v5;
      v10 = "Rejecting additional header %@: key and value must be strings";
      goto LABEL_9;
    }
  }
LABEL_10:

}

- (void)resume
{
  id v2;

  -[AIASRequest task](self, "task");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (NSMutableURLRequest)URLRequest
{
  return (NSMutableURLRequest *)objc_getProperty(self, a2, 16, 1);
}

- (void)setURLRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)done
{
  return self->_done;
}

- (void)setDone:(BOOL)a3
{
  self->_done = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (__AppleIDAuthSupportData)context
{
  return self->_context;
}

- (void)setContext:(__AppleIDAuthSupportData *)a3
{
  self->_context = a3;
}

- (OS_dispatch_semaphore)sema
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSema:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSURLSessionDataTask)task
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)networkTaskDescription
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNetworkTaskDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkTaskDescription, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sema, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_URLRequest, 0);
}

@end
