@implementation CKMapShareURLsToInstalledBundleIDsOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  objc_super v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v11.receiver = self;
  v11.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperationInfo;
  -[CKOperationInfo encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend_shareURLs(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("shareURLs"));

  objc_autoreleasePoolPop(v5);
}

- (CKMapShareURLsToInstalledBundleIDsOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKMapShareURLsToInstalledBundleIDsOperationInfo *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSArray *shareURLs;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperationInfo;
  v5 = -[CKOperationInfo initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v18, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("shareURLs"));
    v14 = objc_claimAutoreleasedReturnValue();
    shareURLs = v5->_shareURLs;
    v5->_shareURLs = (NSArray *)v14;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperationInfo;
  v4 = -[CKOperationInfo copyWithZone:](&v11, sel_copyWithZone_, a3);
  objc_msgSend_shareURLs(self, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v4[17];
  v4[17] = v8;

  return v4;
}

- (NSArray)shareURLs
{
  return self->_shareURLs;
}

- (void)setShareURLs:(id)a3
{
  objc_storeStrong((id *)&self->_shareURLs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareURLs, 0);
}

@end
