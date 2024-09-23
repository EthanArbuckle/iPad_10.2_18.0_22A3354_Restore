@implementation GDFeatureKey

- (GDFeatureKey)initWithViewName:(id)a3 featureName:(id)a4 subidentifierName:(id)a5
{
  id v9;
  id v10;
  id v11;
  GDFeatureKey *v12;
  GDFeatureKey *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GDFeatureKey;
  v12 = -[GDFeatureKey init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_viewName, a3);
    objc_storeStrong((id *)&v13->_featureName, a4);
    objc_storeStrong((id *)&v13->_subidentifierName, a5);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *viewName;
  void *v5;
  const char *v6;
  NSString *featureName;
  void *v8;
  const char *v9;
  NSString *subidentifierName;
  void *v11;
  const char *v12;
  id v13;

  v13 = a3;
  viewName = self->_viewName;
  NSStringFromSelector(sel_viewName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v13, v6, (uint64_t)viewName, v5);

  featureName = self->_featureName;
  NSStringFromSelector(sel_featureName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v13, v9, (uint64_t)featureName, v8);

  subidentifierName = self->_subidentifierName;
  if (subidentifierName)
  {
    NSStringFromSelector(sel_subidentifierName);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v13, v12, (uint64_t)subidentifierName, v11);

  }
}

- (GDFeatureKey)initWithCoder:(id)a3
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
  GDFeatureKey *v13;
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
  NSStringFromSelector(sel_viewName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v5, v8, v6, v7, v4, 1, CFSTR("GDFeatureKeyError"), 9, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (objc_msgSend_error(v4, v10, v11), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    v14 = (void *)MEMORY[0x1E0D81610];
    v15 = objc_opt_class();
    NSStringFromSelector(sel_featureName);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v14, v17, v15, v16, v4, 1, CFSTR("GDFeatureKeyError"), 9, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18
      && (objc_msgSend_error(v4, v19, v20), v21 = (void *)objc_claimAutoreleasedReturnValue(), v21, !v21))
    {
      v22 = (void *)MEMORY[0x1E0D81610];
      v23 = objc_opt_class();
      NSStringFromSelector(sel_subidentifierName);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v22, v25, v23, v24, v4, 0, CFSTR("GDFeatureKeyError"), 9, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_error(v4, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        v13 = 0;
      }
      else
      {
        self = (GDFeatureKey *)(id)objc_msgSend_initWithViewName_featureName_subidentifierName_(self, v30, (uint64_t)v9, v18, v26);
        v13 = self;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  return (id)((uint64_t (*)(GDFeatureKey *, char *))MEMORY[0x1E0DE7D20])(self, sel_string);
}

- (NSString)string
{
  uint64_t v2;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;

  objc_msgSend_subidentifierName(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend_viewName(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_featureName(self, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v11;
  if (v4)
  {
    objc_msgSend_subidentifierName(self, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend_initWithFormat_(v5, v16, (uint64_t)CFSTR("%@%@%@%@%@"), v8, CFSTR("|::|"), v14, CFSTR("|::|"), v15);

  }
  else
  {
    v17 = (void *)objc_msgSend_initWithFormat_(v5, v12, (uint64_t)CFSTR("%@%@%@"), v8, CFSTR("|::|"), v11);
  }

  return (NSString *)v17;
}

- (NSString)diagnosticDataString
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;

  objc_msgSend_subidentifierName(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v4)
  {
    objc_msgSend_subidentifierName(self, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_featureName(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend_initWithFormat_(v7, v12, (uint64_t)CFSTR("%@%@%@"), v8, CFSTR("|::|"), v11);

  }
  else
  {
    objc_msgSend_featureName(self, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend_initWithFormat_(v7, v14, (uint64_t)CFSTR("%s%@%@"), "<no subidentifier>", CFSTR("|::|"), v8);
  }

  return (NSString *)v13;
}

- (NSString)viewName
{
  return self->_viewName;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (NSString)subidentifierName
{
  return self->_subidentifierName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subidentifierName, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_viewName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
