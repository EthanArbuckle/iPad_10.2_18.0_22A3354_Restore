@implementation HMFHTTPResponse

- (HMFHTTPResponse)init
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

- (HMFHTTPResponse)initWithRequest:(id)a3 internalResponse:(id)a4
{
  id v7;
  id v8;
  HMFHTTPResponse *v9;
  HMFHTTPResponse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMFHTTPResponse;
  v9 = -[HMFHTTPResponse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_internal, a4);
  }

  return v10;
}

- (id)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  HMFAttributeDescription *v5;
  HMFAttributeDescription *v6;
  void *v7;
  HMFAttributeDescription *v8;
  HMFAttributeDescription *v9;
  void *v10;
  HMFAttributeDescription *v11;
  HMFAttributeDescription *v12;
  void *v13;
  HMFAttributeDescription *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMFHTTPResponse statusCode](self, "statusCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Status Code"), v4);
  v17[0] = v5;
  v6 = [HMFAttributeDescription alloc];
  -[HMFHTTPResponse headerFields](self, "headerFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMFAttributeDescription initWithName:value:](v6, "initWithName:value:", CFSTR("Headers"), v7);
  v17[1] = v8;
  v9 = [HMFAttributeDescription alloc];
  -[HMFHTTPResponse body](self, "body");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMFAttributeDescription initWithName:value:options:formatter:](v9, "initWithName:value:options:formatter:", CFSTR("Body"), v10, 1, 0);
  v17[2] = v11;
  v12 = [HMFAttributeDescription alloc];
  -[HMFHTTPResponse request](self, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMFAttributeDescription initWithName:value:options:formatter:](v12, "initWithName:value:options:formatter:", CFSTR("Request"), v13, 1, 0);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMFMutableHTTPResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  HMFMutableHTTPResponse *v8;

  v4 = +[HMFMutableHTTPResponse allocWithZone:](HMFMutableHTTPResponse, "allocWithZone:", a3);
  -[HMFHTTPResponse request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFHTTPResponse internal](self, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = -[HMFHTTPResponse initWithRequest:internalResponse:](v4, "initWithRequest:internalResponse:", v5, v7);

  return v8;
}

- (int64_t)statusCode
{
  void *v2;
  int64_t v3;

  -[HMFHTTPResponse internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusCode");

  return v3;
}

- (NSDictionary)headerFields
{
  void *v2;
  void *v3;

  -[HMFHTTPResponse internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headerFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)body
{
  void *v2;
  void *v3;

  -[HMFHTTPResponse internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (HMFHTTPRequest)request
{
  return self->_request;
}

- (HMFHTTPResponseInternal)internal
{
  return self->_internal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
