@implementation ENTHTTPClient

- (ENTHTTPClient)initWithURL:(id)a3
{
  return -[ENTHTTPClient initWithURL:userAgent:timeout:](self, "initWithURL:userAgent:timeout:", a3, 0, 0);
}

- (ENTHTTPClient)initWithURL:(id)a3 userAgent:(id)a4 timeout:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  ENTHTTPClient *v10;
  ENTHTTPClient *v11;
  void *v12;
  objc_super v14;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ENTHTTPClient;
  v10 = -[ENTHTTPClient init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    -[ENTHTTPClient setTimeout:](v10, "setTimeout:", v5);
    -[ENTHTTPClient setUrl:](v11, "setUrl:", v8);
    -[ENTHTTPClient setUserAgent:](v11, "setUserAgent:", v9);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 1024);
    -[ENTHTTPClient setRequestData:](v11, "setRequestData:", v12);

  }
  return v11;
}

- (int)readAll:(char *)a3 offset:(int)a4 length:(int)a5
{
  uint64_t v9;
  void *v10;

  v9 = -[ENTHTTPClient responseDataOffset](self, "responseDataOffset");
  -[ENTHTTPClient responseData](self, "responseData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getBytes:range:", &a3[a4], v9, a5);

  -[ENTHTTPClient setResponseDataOffset:](self, "setResponseDataOffset:", -[ENTHTTPClient responseDataOffset](self, "responseDataOffset") + a5);
  return a5;
}

- (void)write:(const char *)a3 offset:(unsigned int)a4 length:(unsigned int)a5
{
  id v8;

  -[ENTHTTPClient requestData](self, "requestData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendBytes:length:", &a3[a4], a5);

}

- (id)newRequest
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;

  v3 = objc_alloc(MEMORY[0x24BDB7458]);
  -[ENTHTTPClient url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithURL:", v4);

  objc_msgSend(v5, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("application/x-thrift"), CFSTR("Content-Type"));
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("application/x-thrift"), CFSTR("Accept"));
  -[ENTHTTPClient userAgent](self, "userAgent");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = (__CFString *)v6;
  else
    v7 = CFSTR("Cocoa/THTTPClient");
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v7, CFSTR("User-Agent"));
  objc_msgSend(v5, "setCachePolicy:", 1);
  if (-[ENTHTTPClient timeout](self, "timeout"))
    objc_msgSend(v5, "setTimeoutInterval:", (double)-[ENTHTTPClient timeout](self, "timeout"));

  return v5;
}

- (void)flush
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v3 = -[ENTHTTPClient newRequest](self, "newRequest");
  -[ENTHTTPClient requestData](self, "requestData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHTTPBody:", v4);

  v17 = 0;
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDB7478], "sendSynchronousRequest:returningResponse:error:", v3, &v18, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  v7 = v17;
  -[ENTHTTPClient requestData](self, "requestData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLength:", 0);

  if (!v5)
  {
    +[ENTException exceptionWithName:reason:error:](ENTTransportException, "exceptionWithName:reason:error:", CFSTR("TTransportException"), CFSTR("Could not make HTTP request"), v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Unexpected NSURLResponse type: %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENTException exceptionWithName:reason:](ENTTransportException, "exceptionWithName:reason:", CFSTR("TTransportException"), v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v9 = v6;
  if (objc_msgSend(v9, "statusCode") != 200)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bad response from HTTP server: %ld"), objc_msgSend(v9, "statusCode"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENTException exceptionWithName:reason:](ENTTransportException, "exceptionWithName:reason:", CFSTR("TTransportException"), v16);
    v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
    objc_exception_throw(v15);
  }
  -[ENTHTTPClient setResponseData:](self, "setResponseData:", v5);
  -[ENTHTTPClient setResponseDataOffset:](self, "setResponseDataOffset:", 0);

}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSMutableData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
  objc_storeStrong((id *)&self->_requestData, a3);
}

- (NSData)responseData
{
  return self->_responseData;
}

- (void)setResponseData:(id)a3
{
  objc_storeStrong((id *)&self->_responseData, a3);
}

- (int)responseDataOffset
{
  return self->_responseDataOffset;
}

- (void)setResponseDataOffset:(int)a3
{
  self->_responseDataOffset = a3;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_storeStrong((id *)&self->_userAgent, a3);
}

- (int)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(int)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
