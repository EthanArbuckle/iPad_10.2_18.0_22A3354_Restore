@implementation SUUIJSFakeXMLHTTPRequest

- (SUUIJSFakeXMLHTTPRequest)initWithAppContext:(id)a3 data:(id)a4 URLResponse:(id)a5 performanceMetrics:(id)a6
{
  id v11;
  id v12;
  id v13;
  SUUIJSFakeXMLHTTPRequest *v14;
  SUUIJSFakeXMLHTTPRequest *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SUUIJSFakeXMLHTTPRequest;
  v14 = -[IKJSObject initWithAppContext:](&v17, sel_initWithAppContext_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_data, a4);
    objc_storeStrong((id *)&v15->_performanceMetrics, a6);
    objc_storeStrong((id *)&v15->_response, a5);
  }

  return v15;
}

- (id)getAllResponseHeaders
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPURLResponse allHeaderFields](self->_response, "allHeaderFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SUUIJSFakeXMLHTTPRequest_getAllResponseHeaders__block_invoke;
  v7[3] = &unk_2511FB6B0;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

uint64_t __49__SUUIJSFakeXMLHTTPRequest_getAllResponseHeaders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@: %@\r\n"), a2, a3);
}

- (id)getResponseHeader:(id)a3
{
  NSHTTPURLResponse *response;
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    response = self->_response;
    v4 = a3;
    -[NSHTTPURLResponse allHeaderFields](response, "allHeaderFields");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSDictionary)metrics
{
  return self->_performanceMetrics;
}

- (unsigned)readyState
{
  return 4;
}

- (NSString)responseText
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", self->_data, 4);
}

- (IKJSXMLDocument)responseXML
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(NSClassFromString(CFSTR("IKJSXMLDOMImplementation")));
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithAppContext:", v4);

  objc_msgSend(v5, "createLSInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByteStream:", self->_data);
  objc_msgSend(v5, "createLSParser::", 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parse:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKJSXMLDocument *)v8;
}

- (unsigned)responseType
{
  return 3;
}

- (unsigned)status
{
  return -[NSHTTPURLResponse statusCode](self->_response, "statusCode");
}

- (NSString)statusText
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDB7450], "localizedStringForStatusCode:", -[NSHTTPURLResponse statusCode](self->_response, "statusCode"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
