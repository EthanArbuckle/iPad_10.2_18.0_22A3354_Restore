@implementation CKApplicationPermissionGroup

- (CKApplicationPermissionGroup)init
{
  CKApplicationPermissionGroup *v2;
  CKApplicationPermissionGroup *v3;
  NSArray *containerIDs;
  NSArray *v5;
  NSArray *applicationBundleIDs;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKApplicationPermissionGroup;
  v2 = -[CKApplicationPermissionGroup init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    containerIDs = v2->_containerIDs;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_containerIDs = (NSArray *)MEMORY[0x1E0C9AA60];

    applicationBundleIDs = v3->_applicationBundleIDs;
    v3->_applicationBundleIDs = v5;

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKApplicationPermissionGroup)initWithCoder:(id)a3
{
  id v4;
  CKApplicationPermissionGroup *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CKApplicationPermissionGroup;
  v5 = -[CKApplicationPermissionGroup init](&v33, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("containerIDs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContainerIDs_(v5, v15, (uint64_t)v14, v16);

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend_setWithObjects_(v17, v20, v18, v21, v19, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, (uint64_t)CFSTR("applicationBundleIDs"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setApplicationBundleIDs_(v5, v25, (uint64_t)v24, v26);

    v29 = objc_msgSend_decodeInt64ForKey_(v4, v27, (uint64_t)CFSTR("enabledPermissions"), v28);
    objc_msgSend_setEnabledPermissions_(v5, v30, v29, v31);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  id v20;

  v20 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_containerIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v20, v9, (uint64_t)v8, (uint64_t)CFSTR("containerIDs"));

  objc_msgSend_applicationBundleIDs(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v20, v14, (uint64_t)v13, (uint64_t)CFSTR("applicationBundleIDs"));

  v18 = objc_msgSend_enabledPermissions(self, v15, v16, v17);
  objc_msgSend_encodeInt64_forKey_(v20, v19, v18, (uint64_t)CFSTR("enabledPermissions"));
  objc_autoreleasePoolPop(v4);

}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_containerIDs(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_enabledPermissions(self, v7, v8, v9);
  objc_msgSend_applicationBundleIDs(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v15, (uint64_t)CFSTR("containerIDs=%@, enabledPermissions=%ld, applicationBundleIDs=%@"), v16, v6, v10, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)description
{
  return (id)((uint64_t (*)(CKApplicationPermissionGroup *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (NSArray)containerIDs
{
  return self->_containerIDs;
}

- (void)setContainerIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)applicationBundleIDs
{
  return self->_applicationBundleIDs;
}

- (void)setApplicationBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)enabledPermissions
{
  return self->_enabledPermissions;
}

- (void)setEnabledPermissions:(unint64_t)a3
{
  self->_enabledPermissions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIDs, 0);
  objc_storeStrong((id *)&self->_containerIDs, 0);
}

@end
