@implementation HMFMutableHTTPRequest

- (HMFMutableHTTPRequest)initWithInternalRequest:(id)a3
{
  void *v4;
  HMFMutableHTTPRequest *v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("Test"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMFMutableHTTPRequest initWithURL:method:body:timeoutInterval:](self, "initWithURL:method:body:timeoutInterval:", v4, CFSTR("Test"), 0, 0.0);

  return v5;
}

- (HMFMutableHTTPRequest)initWithURL:(id)a3 method:(id)a4 body:(id)a5 timeoutInterval:(double)a6
{
  id v10;
  id v11;
  id v12;
  HMFHTTPRequestInternal *v13;
  HMFMutableHTTPRequest *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(HMFHTTPRequestInternal);
  v18.receiver = self;
  v18.super_class = (Class)HMFMutableHTTPRequest;
  v14 = -[HMFHTTPRequest initWithInternalRequest:](&v18, sel_initWithInternalRequest_, v13);

  if (v14)
  {
    -[HMFHTTPRequest internal](v14, "internal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setURL:", v10);

    -[HMFHTTPRequest internal](v14, "internal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMethod:", v11);

    -[HMFMutableHTTPRequest setBody:](v14, "setBody:", v12);
    -[HMFHTTPRequest setTimeoutInterval:](v14, "setTimeoutInterval:", a6);
  }

  return v14;
}

- (id)responseWithStatusCode:(int64_t)a3
{
  void *v5;
  void *v6;
  HMFHTTPResponse *v7;

  -[HMFHTTPRequest internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "responseWithStatusCode:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMFHTTPResponse initWithRequest:internalResponse:]([HMFHTTPResponse alloc], "initWithRequest:internalResponse:", self, v6);
  return v7;
}

- (void)setBody:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMFHTTPRequest internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBody:", v4);

}

- (void)setHeaderValue:(id)a3 forHeaderKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMFHTTPRequest internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHeaderValue:forHeaderKey:", v7, v6);

}

@end
