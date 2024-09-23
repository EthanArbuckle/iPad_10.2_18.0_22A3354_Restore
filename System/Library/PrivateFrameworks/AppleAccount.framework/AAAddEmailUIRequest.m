@implementation AAAddEmailUIRequest

- (AAAddEmailUIRequest)initWithAccount:(id)a3
{
  id v4;
  AAAddEmailUIRequest *v5;
  AAAddEmailUIRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AAAddEmailUIRequest;
  v5 = -[AAAddEmailUIRequest init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AAAddEmailUIRequest setAccount:](v5, "setAccount:", v4);

  return v6;
}

- (AAAddEmailUIRequest)initWithURLString:(id)a3 account:(id)a4
{
  id v6;
  AAAddEmailUIRequest *v7;
  AAAddEmailUIRequest *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AAAddEmailUIRequest;
  v7 = -[AARequest initWithURLString:](&v10, sel_initWithURLString_, a3);
  v8 = v7;
  if (v7)
    -[AAAddEmailUIRequest setAccount:](v7, "setAccount:", v6);

  return v8;
}

- (id)urlString
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAAddEmailUIRequest;
  -[AARequest urlString](&v5, sel_urlString);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEmailURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAAddEmailUIRequest;
  -[AARequest urlRequest](&v7, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", CFSTR("application/xml"), CFSTR("Content-Type"));
  -[AAAddEmailUIRequest account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v5, 0);

  return v4;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
