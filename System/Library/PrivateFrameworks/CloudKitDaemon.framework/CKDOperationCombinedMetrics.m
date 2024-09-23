@implementation CKDOperationCombinedMetrics

- (CKDOperationCombinedMetrics)initWithCloudKitMetrics:(id)a3 andMMCSMetrics:(id)a4
{
  id v6;
  id v7;
  CKDOperationCombinedMetrics *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKDOperationMetrics *cloudKitMetrics;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CKDOperationMetrics *MMCSMetrics;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CKDOperationCombinedMetrics;
  v8 = -[CKDOperationCombinedMetrics init](&v19, sel_init);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1C3B83E24]();
    v12 = objc_msgSend_copy(v6, v10, v11);
    cloudKitMetrics = v8->_cloudKitMetrics;
    v8->_cloudKitMetrics = (CKDOperationMetrics *)v12;

    v16 = objc_msgSend_copy(v7, v14, v15);
    MMCSMetrics = v8->_MMCSMetrics;
    v8->_MMCSMetrics = (CKDOperationMetrics *)v16;

    objc_autoreleasePoolPop(v9);
  }

  return v8;
}

- (CKDOperationMetrics)cloudKitMetrics
{
  return self->_cloudKitMetrics;
}

- (CKDOperationMetrics)MMCSMetrics
{
  return self->_MMCSMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MMCSMetrics, 0);
  objc_storeStrong((id *)&self->_cloudKitMetrics, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  id v13;

  v13 = a3;
  v4 = (void *)MEMORY[0x1C3B83E24]();
  objc_msgSend_MMCSMetrics(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v13, v8, (uint64_t)v7, CFSTR("MMCSMetrics"));

  objc_msgSend_cloudKitMetrics(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v13, v12, (uint64_t)v11, CFSTR("CloudKitMetrics"));

  objc_autoreleasePoolPop(v4);
}

- (CKDOperationCombinedMetrics)initWithCoder:(id)a3
{
  id v4;
  CKDOperationCombinedMetrics *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  CKDOperationMetrics *MMCSMetrics;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  CKDOperationMetrics *cloudKitMetrics;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKDOperationCombinedMetrics;
  v5 = -[CKDOperationCombinedMetrics init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("MMCSMetrics"));
    v8 = objc_claimAutoreleasedReturnValue();
    MMCSMetrics = v5->_MMCSMetrics;
    v5->_MMCSMetrics = (CKDOperationMetrics *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("CloudKitMetrics"));
    v12 = objc_claimAutoreleasedReturnValue();
    cloudKitMetrics = v5->_cloudKitMetrics;
    v5->_cloudKitMetrics = (CKDOperationMetrics *)v12;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKDOperationCombinedMetrics *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKDOperationMetrics *cloudKitMetrics;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CKDOperationMetrics *MMCSMetrics;

  v4 = objc_alloc_init(CKDOperationCombinedMetrics);
  objc_msgSend_cloudKitMetrics(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_copy(v7, v8, v9);
  cloudKitMetrics = v4->_cloudKitMetrics;
  v4->_cloudKitMetrics = (CKDOperationMetrics *)v10;

  objc_msgSend_MMCSMetrics(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_copy(v14, v15, v16);
  MMCSMetrics = v4->_MMCSMetrics;
  v4->_MMCSMetrics = (CKDOperationMetrics *)v17;

  return v4;
}

- (id)CKPropertiesDescription
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;

  v3 = (void *)objc_opt_new();
  objc_msgSend_cloudKitMetrics(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_cloudKitMetrics(self, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v9, v11, (uint64_t)CFSTR("cloudKitMetrics=%@"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v13, (uint64_t)v12);

  }
  objc_msgSend_MMCSMetrics(self, v7, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_MMCSMetrics(self, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v17, v19, (uint64_t)CFSTR("MMCSMetrics=%@"), v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v21, (uint64_t)v20);

  }
  objc_msgSend_componentsJoinedByString_(v3, v15, (uint64_t)CFSTR(", "));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDOperationCombinedMetrics *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

@end
