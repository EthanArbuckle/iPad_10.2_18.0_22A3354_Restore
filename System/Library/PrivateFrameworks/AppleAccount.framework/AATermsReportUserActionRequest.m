@implementation AATermsReportUserActionRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AATermsReportUserActionRequest)initWithAccount:(id)a3 urlRequest:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  AATermsReportUserActionRequest *v13;
  NSURLRequest *v14;
  NSURLRequest *urlRequest;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)AATermsReportUserActionRequest;
  v13 = -[AARequest initWithURLString:](&v17, sel_initWithURLString_, v12);

  if (v13)
  {
    v14 = (NSURLRequest *)objc_msgSend(v9, "mutableCopy");
    if (v10 && objc_msgSend(v10, "count"))
      -[NSURLRequest aa_setJSONBodyWithParameters:](v14, "aa_setJSONBodyWithParameters:", v10);
    -[NSURLRequest setHTTPMethod:](v14, "setHTTPMethod:", CFSTR("POST"));
    -[NSURLRequest ak_addClientInfoHeader](v14, "ak_addClientInfoHeader");
    -[NSURLRequest aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:](v14, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", v8, 1);
    urlRequest = v13->_urlRequest;
    v13->_urlRequest = v14;

  }
  return v13;
}

- (id)urlRequest
{
  return self->_urlRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlRequest, 0);
}

@end
