@implementation APPolicyData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APPolicyData)initWithCoder:(id)a3
{
  id v4;
  APPolicyData *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  NSString *creativeIdentifier;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  NSDictionary *policyValue;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)APPolicyData;
  v5 = -[APPolicyData init](&v30, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("creativeIdentifier"), v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    creativeIdentifier = v5->_creativeIdentifier;
    v5->_creativeIdentifier = (NSString *)v11;

    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend_setWithObjects_(v13, v17, v14, v18, v19, v20, v21, v15, v16, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, (uint64_t)CFSTR("policyValue"), v24, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    policyValue = v5->_policyValue;
    v5->_policyValue = (NSDictionary *)v27;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *creativeIdentifier;
  const char *v5;
  uint64_t v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  id v13;

  creativeIdentifier = self->_creativeIdentifier;
  v13 = a3;
  objc_msgSend_encodeObject_forKey_(v13, v5, (uint64_t)creativeIdentifier, (uint64_t)CFSTR("creativeIdentifier"), v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v13, v9, (uint64_t)self->_policyValue, (uint64_t)CFSTR("policyValue"), v10, v11, v12);

}

- (BOOL)isEqualToAPPolicyData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  char isEqualToDictionary;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_creativeIdentifier(self, v5, v6, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_creativeIdentifier(v4, v12, v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v11, v19, (uint64_t)v18, v20, v21, v22, v23))
    {
      objc_msgSend_policyValue(self, v24, v25, v26, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_policyValue(v4, v31, v32, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v30, v38, (uint64_t)v37, v39, v40, v41, v42);

    }
    else
    {
      isEqualToDictionary = 0;
    }

  }
  else
  {
    isEqualToDictionary = 0;
  }

  return isEqualToDictionary;
}

- (NSString)creativeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCreativeIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)policyValue
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPolicyValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyValue, 0);
  objc_storeStrong((id *)&self->_creativeIdentifier, 0);
}

@end
