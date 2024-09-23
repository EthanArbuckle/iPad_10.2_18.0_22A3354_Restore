@implementation IDSCacheClearRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double v3;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_requestContexts, v3, CFSTR("RequestContextKey"));
}

- (IDSCacheClearRequest)initWithCoder:(id)a3
{
  id v4;
  IDSCacheClearRequest *v5;
  uint64_t v6;
  const char *v7;
  double v8;
  uint64_t v9;
  NSArray *requestContexts;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSCacheClearRequest;
  v5 = -[IDSCacheClearRequest init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v7, v6, v8, CFSTR("RequestContextKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    requestContexts = v5->_requestContexts;
    v5->_requestContexts = (NSArray *)v9;

  }
  return v5;
}

- (NSArray)requestContexts
{
  return self->_requestContexts;
}

- (void)setRequestContexts:(id)a3
{
  objc_storeStrong((id *)&self->_requestContexts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContexts, 0);
}

@end
