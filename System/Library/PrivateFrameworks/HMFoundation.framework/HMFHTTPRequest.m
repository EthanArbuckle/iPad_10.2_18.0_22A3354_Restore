@implementation HMFHTTPRequest

- (HMFHTTPRequest)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMFHTTPRequest)initWithInternalRequest:(id)a3
{
  id v5;
  HMFHTTPRequest *v6;
  HMFHTTPRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMFHTTPRequest;
  v6 = -[HMFHTTPRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_internal, a3);
    v7->_timeoutInterval = 60.0;
  }

  return v7;
}

- (id)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  void *v5;
  HMFAttributeDescription *v6;
  HMFAttributeDescription *v7;
  void *v8;
  HMFAttributeDescription *v9;
  HMFAttributeDescription *v10;
  void *v11;
  HMFAttributeDescription *v12;
  HMFAttributeDescription *v13;
  void *v14;
  HMFAttributeDescription *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  -[HMFHTTPRequest URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("URL"), v5);
  v18[0] = v6;
  v7 = [HMFAttributeDescription alloc];
  -[HMFHTTPRequest method](self, "method");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMFAttributeDescription initWithName:value:](v7, "initWithName:value:", CFSTR("Method"), v8);
  v18[1] = v9;
  v10 = [HMFAttributeDescription alloc];
  -[HMFHTTPRequest headerFields](self, "headerFields");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMFAttributeDescription initWithName:value:](v10, "initWithName:value:", CFSTR("Headers"), v11);
  v18[2] = v12;
  v13 = [HMFAttributeDescription alloc];
  -[HMFHTTPRequest body](self, "body");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMFAttributeDescription initWithName:value:options:formatter:](v13, "initWithName:value:options:formatter:", CFSTR("Body"), v14, 1, 0);
  v18[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
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

- (NSURL)URL
{
  void *v2;
  void *v3;

  -[HMFHTTPRequest internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSString)method
{
  void *v2;
  void *v3;

  -[HMFHTTPRequest internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "method");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)headerFields
{
  void *v2;
  void *v3;

  -[HMFHTTPRequest internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headerFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)body
{
  void *v2;
  void *v3;

  -[HMFHTTPRequest internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSURLRequest)urlRequest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0C92C28]);
  -[HMFHTTPRequest URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFHTTPRequest timeoutInterval](self, "timeoutInterval");
  v5 = (void *)objc_msgSend(v3, "initWithURL:cachePolicy:timeoutInterval:", v4, 1);

  -[HMFHTTPRequest body](self, "body");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHTTPBody:", v6);

  -[HMFHTTPRequest method](self, "method");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHTTPMethod:", v7);

  -[HMFHTTPRequest headerFields](self, "headerFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllHTTPHeaderFields:", v8);

  v9 = (void *)objc_msgSend(v5, "copy");
  return (NSURLRequest *)v9;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (HMFHTTPRequestInternal)internal
{
  return self->_internal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
