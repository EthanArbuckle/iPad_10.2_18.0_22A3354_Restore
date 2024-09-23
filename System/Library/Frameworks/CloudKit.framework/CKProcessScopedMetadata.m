@implementation CKProcessScopedMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameworkFingerprint, 0);
}

- (void)setIsClientMainBundleAppleExecutable:(BOOL)a3
{
  self->_isClientMainBundleAppleExecutable = a3;
}

- (void)setFrameworkFingerprint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setClientSDKVersion:(unsigned int)a3
{
  self->_clientSDKVersion = a3;
}

- (BOOL)isClientMainBundleAppleExecutable
{
  return self->_isClientMainBundleAppleExecutable;
}

- (CKProcessScopedMetadata)initWithCoder:(id)a3
{
  id v4;
  CKProcessScopedMetadata *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  CKFrameworkFingerprint *frameworkFingerprint;
  void *v14;
  const char *v15;
  uint64_t v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKProcessScopedMetadata;
  v5 = -[CKProcessScopedMetadata init](&v18, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_clientSDKVersion);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_clientSDKVersion = objc_msgSend_decodeInt64ForKey_(v4, v7, (uint64_t)v6, v8);

    v9 = objc_opt_class();
    NSStringFromSelector(sel_frameworkFingerprint);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v9, (uint64_t)v10);
    v12 = objc_claimAutoreleasedReturnValue();
    frameworkFingerprint = v5->_frameworkFingerprint;
    v5->_frameworkFingerprint = (CKFrameworkFingerprint *)v12;

    NSStringFromSelector(sel_isClientMainBundleAppleExecutable);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isClientMainBundleAppleExecutable = objc_msgSend_decodeBoolForKey_(v4, v15, (uint64_t)v14, v16);

  }
  return v5;
}

- (CKFrameworkFingerprint)frameworkFingerprint
{
  return self->_frameworkFingerprint;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t isClientMainBundleAppleExecutable;
  const char *v21;
  id v22;

  v4 = a3;
  v8 = objc_msgSend_clientSDKVersion(self, v5, v6, v7);
  NSStringFromSelector(sel_clientSDKVersion);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInt64_forKey_(v4, v10, v8, (uint64_t)v9);

  objc_msgSend_frameworkFingerprint(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_frameworkFingerprint);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);

  isClientMainBundleAppleExecutable = objc_msgSend_isClientMainBundleAppleExecutable(self, v17, v18, v19);
  NSStringFromSelector(sel_isClientMainBundleAppleExecutable);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v4, v21, isClientMainBundleAppleExecutable, (uint64_t)v22);

}

- (unsigned)clientSDKVersion
{
  return self->_clientSDKVersion;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
