@implementation GDViewAccessToken

- (GDViewAccessToken)initWithToken:(id)a3 url:(id)a4 tableName:(id)a5 alwaysAvailable:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  GDViewAccessToken *v15;
  uint64_t v16;
  NSData *token;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSURL *url;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *tableName;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v27.receiver = self;
  v27.super_class = (Class)GDViewAccessToken;
  v15 = -[GDViewAccessToken init](&v27, sel_init);
  if (v15)
  {
    v16 = objc_msgSend_copy(v10, v13, v14);
    token = v15->_token;
    v15->_token = (NSData *)v16;

    v20 = objc_msgSend_copy(v11, v18, v19);
    url = v15->_url;
    v15->_url = (NSURL *)v20;

    v24 = objc_msgSend_copy(v12, v22, v23);
    tableName = v15->_tableName;
    v15->_tableName = (NSString *)v24;

    v15->_alwaysAvailable = a6;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *token;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  id v9;

  token = self->_token;
  v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)token, CFSTR("token"));
  objc_msgSend_encodeObject_forKey_(v9, v6, (uint64_t)self->_url, CFSTR("url"));
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_tableName, CFSTR("tableName"));
  objc_msgSend_encodeBool_forKey_(v9, v8, self->_alwaysAvailable, CFSTR("alwaysAvailable"));

}

- (GDViewAccessToken)initWithCoder:(id)a3
{
  id v5;
  GDViewAccessToken *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  NSURL *v16;
  NSURL *url;
  NSURL *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSString *tableName;
  const char *v23;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)GDViewAccessToken;
  v6 = -[GDViewAccessToken init](&v29, sel_init);
  if (v6)
  {
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v5, v8, v7, CFSTR("token"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, v6, CFSTR("GDViewAccessToken.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

    }
    objc_storeStrong((id *)&v6->_token, v11);
    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v5, v13, v12, CFSTR("url"));
    v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, v6, CFSTR("GDViewAccessToken.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

    }
    url = v6->_url;
    v6->_url = v16;
    v18 = v16;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v5, v20, v19, CFSTR("tableName"));
    v21 = objc_claimAutoreleasedReturnValue();
    tableName = v6->_tableName;
    v6->_tableName = (NSString *)v21;

    v6->_alwaysAvailable = objc_msgSend_decodeBoolForKey_(v5, v23, (uint64_t)CFSTR("alwaysAvailable"));
  }

  return v6;
}

- (NSData)token
{
  return self->_token;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (BOOL)alwaysAvailable
{
  return self->_alwaysAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
