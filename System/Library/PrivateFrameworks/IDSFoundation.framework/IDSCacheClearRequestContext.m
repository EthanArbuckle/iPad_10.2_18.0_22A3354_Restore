@implementation IDSCacheClearRequestContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *uris;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  uris = self->_uris;
  v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)uris, v6, CFSTR("urisKey"));
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_service, v8, CFSTR("serviceKey"));

}

- (IDSCacheClearRequestContext)initWithCoder:(id)a3
{
  id v4;
  IDSCacheClearRequestContext *v5;
  uint64_t v6;
  const char *v7;
  double v8;
  uint64_t v9;
  NSArray *uris;
  uint64_t v11;
  const char *v12;
  double v13;
  uint64_t v14;
  NSString *service;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSCacheClearRequestContext;
  v5 = -[IDSCacheClearRequestContext init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v7, v6, v8, CFSTR("urisKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    uris = v5->_uris;
    v5->_uris = (NSArray *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, v13, CFSTR("serviceKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    service = v5->_service;
    v5->_service = (NSString *)v14;

  }
  return v5;
}

- (NSArray)uris
{
  return self->_uris;
}

- (void)setUris:(id)a3
{
  objc_storeStrong((id *)&self->_uris, a3);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_uris, 0);
}

@end
