@implementation AMSURLRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  AMSURLRequest *v5;
  id v6;
  void *v7;
  void *v8;
  AMSURLRequest *v9;
  objc_super v11;

  v5 = +[AMSURLRequest allocWithZone:](AMSURLRequest, "allocWithZone:");
  v11.receiver = self;
  v11.super_class = (Class)AMSURLRequest;
  v6 = -[AMSURLRequest mutableCopyWithZone:](&v11, sel_mutableCopyWithZone_, a3);
  -[AMSURLRequest properties](self, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);
  v9 = -[AMSURLRequest initWithRequest:properties:](v5, "initWithRequest:properties:", v6, v8);

  return v9;
}

- (AMSURLRequest)initWithRequest:(id)a3 properties:(id)a4
{
  id v7;
  id *v8;
  AMSURLRequest *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AMSURLRequest;
  v8 = -[AMSURLRequest _initWithCFURLRequest:](&v11, sel__initWithCFURLRequest_, objc_msgSend(objc_retainAutorelease(a3), "_CFURLRequest"));
  v9 = (AMSURLRequest *)v8;
  if (v8)
    objc_storeStrong(v8 + 2, a4);

  return v9;
}

- (AMSURLRequestProperties)properties
{
  return self->_properties;
}

- (AMSURLRequest)initWithURL:(id)a3 cachePolicy:(unint64_t)a4 timeoutInterval:(double)a5
{
  AMSURLRequest *v5;
  AMSURLRequestProperties *v6;
  AMSURLRequestProperties *properties;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AMSURLRequest;
  v5 = -[AMSURLRequest initWithURL:cachePolicy:timeoutInterval:](&v9, sel_initWithURL_cachePolicy_timeoutInterval_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(AMSURLRequestProperties);
    properties = v5->_properties;
    v5->_properties = v6;

  }
  return v5;
}

+ (id)logableDescriptionForRequest:(id)a3
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AMSLogableURL(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> { URL: %@ }"), v6, v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (AMSURLRequest)initWithRequest:(id)a3
{
  return (AMSURLRequest *)-[AMSURLRequest _initWithCFURLRequest:](self, "_initWithCFURLRequest:", objc_msgSend(objc_retainAutorelease(a3), "_CFURLRequest"));
}

- (id)_initWithCFURLRequest:(_CFURLRequest *)a3
{
  _QWORD *v3;
  AMSURLRequestProperties *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSURLRequest;
  v3 = -[AMSURLRequest _initWithCFURLRequest:](&v7, sel__initWithCFURLRequest_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(AMSURLRequestProperties);
    v5 = (void *)v3[2];
    v3[2] = v4;

  }
  return v3;
}

- (AMSURLRequest)initWithRequest:(id)a3 bag:(id)a4
{
  id v6;
  AMSURLRequest *v7;
  AMSURLRequest *v8;

  v6 = a4;
  v7 = -[AMSURLRequest initWithRequest:](self, "initWithRequest:", a3);
  v8 = v7;
  if (v7)
    -[AMSURLRequestProperties setBag:](v7->_properties, "setBag:", v6);

  return v8;
}

- (id)description
{
  return +[AMSURLRequest logableDescriptionForRequest:](AMSURLRequest, "logableDescriptionForRequest:", self);
}

- (NSURLRequest)urlRequest
{
  return (NSURLRequest *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C80]), "_initWithCFURLRequest:", -[AMSURLRequest _CFURLRequest](objc_retainAutorelease(self), "_CFURLRequest"));
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

@end
