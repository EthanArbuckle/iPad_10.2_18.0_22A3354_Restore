@implementation CKOperationMetrics

- (CKOperationMetrics)initWithCoder:(id)a3
{
  id v4;
  CKOperationMetrics *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  CKMetric *MMCSMetrics;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  CKMetric *cloudKitMetrics;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKOperationMetrics;
  v5 = -[CKOperationMetrics init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("MMCSMetrics"));
    v8 = objc_claimAutoreleasedReturnValue();
    MMCSMetrics = v5->_MMCSMetrics;
    v5->_MMCSMetrics = (CKMetric *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("CloudKitMetrics"));
    v12 = objc_claimAutoreleasedReturnValue();
    cloudKitMetrics = v5->_cloudKitMetrics;
    v5->_cloudKitMetrics = (CKMetric *)v12;

  }
  return v5;
}

- (id)CKPropertiesDescription
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;

  v3 = (void *)objc_opt_new();
  objc_msgSend_cloudKitMetrics(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_cloudKitMetrics(self, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v11, v13, (uint64_t)CFSTR("cloudKitMetrics=%@"), v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v16, (uint64_t)v15, v17);

  }
  objc_msgSend_MMCSMetrics(self, v8, v9, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_MMCSMetrics(self, v19, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v22, v24, (uint64_t)CFSTR("MMCSMetrics=%@"), v25, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v27, (uint64_t)v26, v28);

  }
  objc_msgSend_componentsJoinedByString_(v3, v19, (uint64_t)CFSTR(", "), v21);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (CKMetric)cloudKitMetrics
{
  return self->_cloudKitMetrics;
}

- (CKMetric)MMCSMetrics
{
  return self->_MMCSMetrics;
}

- (CKOperationMetrics)initWithCloudKitMetrics:(id)a3 MMCSMetrics:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKOperationMetrics *v11;
  uint64_t v12;
  CKMetric *cloudKitMetrics;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CKMetric *MMCSMetrics;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKOperationMetrics;
  v11 = -[CKOperationMetrics init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v6, v8, v9, v10);
    cloudKitMetrics = v11->_cloudKitMetrics;
    v11->_cloudKitMetrics = (CKMetric *)v12;

    v17 = objc_msgSend_copy(v7, v14, v15, v16);
    MMCSMetrics = v11->_MMCSMetrics;
    v11->_MMCSMetrics = (CKMetric *)v17;

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MMCSMetrics, 0);
  objc_storeStrong((id *)&self->_cloudKitMetrics, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v4 = a3;
  objc_msgSend_MMCSMetrics(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, (uint64_t)CFSTR("MMCSMetrics"));

  objc_msgSend_cloudKitMetrics(self, v10, v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v14, (uint64_t)CFSTR("CloudKitMetrics"));

}

- (id)description
{
  return (id)((uint64_t (*)(CKOperationMetrics *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
