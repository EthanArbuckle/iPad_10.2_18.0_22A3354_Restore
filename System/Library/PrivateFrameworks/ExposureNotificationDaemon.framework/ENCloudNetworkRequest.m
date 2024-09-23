@implementation ENCloudNetworkRequest

+ (id)requestWithURL:(id)a3 httpMethod:(unint64_t)a4 headers:(id)a5 parameters:(id)a6 andBody:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  ENCloudNetworkRequest *v15;
  void *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = objc_alloc_init(ENCloudNetworkRequest);
  objc_msgSend(MEMORY[0x1E0CB3A30], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENCloudNetworkRequest setRequestID:](v15, "setRequestID:", v16);

  -[ENCloudNetworkRequest setUrl:](v15, "setUrl:", v14);
  -[ENCloudNetworkRequest setHeaders:](v15, "setHeaders:", v13);

  -[ENCloudNetworkRequest setParameters:](v15, "setParameters:", v12);
  -[ENCloudNetworkRequest setHttpMethod:](v15, "setHttpMethod:", a4);
  -[ENCloudNetworkRequest setBody:](v15, "setBody:", v11);

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3938];
  -[ENCloudNetworkRequest requestID](self, "requestID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENCloudNetworkRequest url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENCloudNetworkRequest httpMethodString](self, "httpMethodString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENCloudNetworkRequest headers](self, "headers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENCloudNetworkRequest body](self, "body");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ENCloudNetworkRequest[%@] - URL: %@, Method: %@, \n Headers - %@, body - %@"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)httpMethodString
{
  if (-[ENCloudNetworkRequest httpMethod](self, "httpMethod"))
    return CFSTR("POST");
  else
    return CFSTR("GET");
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)httpMethod
{
  return self->_httpMethod;
}

- (void)setHttpMethod:(unint64_t)a3
{
  self->_httpMethod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
