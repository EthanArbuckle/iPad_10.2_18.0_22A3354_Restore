@implementation GDViewUpdateSourceResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_configIdentifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  GDSourceListenerConfigIdentifier *configIdentifier;
  id v5;
  void *v6;
  const char *v7;
  NSData *bookmark;
  void *v9;
  const char *v10;
  NSString *response;
  const char *v12;
  id v13;

  configIdentifier = self->_configIdentifier;
  v5 = a3;
  NSStringFromSelector(sel_configIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)configIdentifier, v6);

  bookmark = self->_bookmark;
  NSStringFromSelector(sel_bookmark);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)bookmark, v9);

  response = self->_response;
  NSStringFromSelector(sel_response);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)response, v13);

}

- (GDViewUpdateSourceResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  GDViewUpdateSourceResponse *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  NSStringFromSelector(sel_configIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v5, v8, v6, v7, v4, 1, CFSTR("GDViewUpdateSourceKeyError"), 9, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (objc_msgSend_error(v4, v10, v11), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    v14 = (void *)MEMORY[0x1E0D81610];
    v15 = objc_opt_class();
    NSStringFromSelector(sel_bookmark);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v14, v17, v15, v16, v4, 0, CFSTR("GDViewUpdateSourceKeyError"), 9, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_error(v4, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v13 = 0;
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0D81610];
      v23 = objc_opt_class();
      NSStringFromSelector(sel_response);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v22, v25, v23, v24, v4, 1, CFSTR("GDViewUpdateSourceKeyError"), 9, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26
        && (objc_msgSend_error(v4, v27, v28), v29 = (void *)objc_claimAutoreleasedReturnValue(), v29, !v29))
      {
        self = (GDViewUpdateSourceResponse *)(id)objc_msgSend_initWithConfigIdentifier_bookmark_response_(self, v30, (uint64_t)v9, v18, v26);
        v13 = self;
      }
      else
      {
        v13 = 0;
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (GDViewUpdateSourceResponse)initWithConfigIdentifier:(id)a3 bookmark:(id)a4 response:(id)a5
{
  id v9;
  id v10;
  id v11;
  GDViewUpdateSourceResponse *v12;
  GDViewUpdateSourceResponse *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSString *response;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)GDViewUpdateSourceResponse;
  v12 = -[GDViewUpdateSourceResponse init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configIdentifier, a3);
    objc_storeStrong((id *)&v13->_bookmark, a4);
    v16 = objc_msgSend_copy(v11, v14, v15);
    response = v13->_response;
    v13->_response = (NSString *)v16;

  }
  return v13;
}

- (NSString)response
{
  return self->_response;
}

- (GDSourceListenerConfigIdentifier)configIdentifier
{
  return self->_configIdentifier;
}

- (NSData)bookmark
{
  return self->_bookmark;
}

- (id)description
{
  id v3;
  const char *v4;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  return (id)objc_msgSend_initWithFormat_(v3, v4, (uint64_t)CFSTR("<GDViewUpdateSourceResponse configId: %@, response: %@>"), self->_configIdentifier, self->_response);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
