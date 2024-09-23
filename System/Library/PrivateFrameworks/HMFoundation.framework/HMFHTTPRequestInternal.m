@implementation HMFHTTPRequestInternal

- (HMFHTTPRequestInternal)init
{
  HMFHTTPRequestInternal *v2;
  uint64_t v3;
  NSMutableDictionary *headerFields;
  HMFActivity *v5;
  HMFActivity *activity;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMFHTTPRequestInternal;
  v2 = -[HMFHTTPRequestInternal init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    headerFields = v2->_headerFields;
    v2->_headerFields = (NSMutableDictionary *)v3;

    v5 = -[HMFActivity initWithName:]([HMFActivity alloc], "initWithName:", CFSTR("HTTPRequest"));
    activity = v2->_activity;
    v2->_activity = v5;

  }
  return v2;
}

- (void)setHeaderValue:(id)a3 forHeaderKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_headerFields, "setObject:forKey:", a3, a4);
}

- (NSDictionary)headerFields
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_headerFields, "copy");
}

- (id)responseWithStatusCode:(int64_t)a3
{
  HMFActivity *v5;
  void *v6;
  HMFActivity *v7;
  HMFHTTPResponseInternal *v8;
  HMFHTTPResponseInternal *v9;

  v5 = [HMFActivity alloc];
  -[HMFHTTPRequestInternal activity](self, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMFActivity initWithName:parent:](v5, "initWithName:parent:", CFSTR("HTTPResponse"), v6);

  v8 = [HMFHTTPResponseInternal alloc];
  v9 = -[HMFHTTPResponseInternal initWithStatusCode:headerFields:body:activity:](v8, "initWithStatusCode:headerFields:body:activity:", a3, MEMORY[0x1E0C9AA70], 0, v7);

  return v9;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)method
{
  return self->_method;
}

- (void)setMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (HMFActivity)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_headerFields, 0);
}

@end
