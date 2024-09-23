@implementation CKDContainerPrivacySettings

- (CKDContainerPrivacySettings)initWithContainerID:(id)a3 applicationBundleIDs:(id)a4 discoverable:(int64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  CKDContainerPrivacySettings *v12;
  uint64_t v13;
  CKContainerID *containerID;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSSet *applicationBundleIDs;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKDContainerPrivacySettings;
  v12 = -[CKDContainerPrivacySettings init](&v20, sel_init);
  if (v12)
  {
    v13 = objc_msgSend_copy(v8, v10, v11);
    containerID = v12->_containerID;
    v12->_containerID = (CKContainerID *)v13;

    v17 = objc_msgSend_copy(v9, v15, v16);
    applicationBundleIDs = v12->_applicationBundleIDs;
    v12->_applicationBundleIDs = (NSSet *)v17;

    v12->_discoverable = a5;
  }

  return v12;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_containerID(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIDs(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_discoverable(self, v9, v10);
  objc_msgSend_stringWithFormat_(v4, v12, (uint64_t)CFSTR("containerID=%@, applicationBundleIDs=%@, discoverable=%ld"), v5, v8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDContainerPrivacySettings *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (BOOL)isEqual:(id)a3
{
  CKDContainerPrivacySettings *v4;
  CKDContainerPrivacySettings *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  int v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  BOOL v25;

  v4 = (CKDContainerPrivacySettings *)a3;
  if (self == v4)
  {
    v25 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_containerID(self, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerID(v5, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CKObjectsAreBothNilOrEqual();

      if (v12
        && (objc_msgSend_applicationBundleIDs(self, v13, v14),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_applicationBundleIDs(v5, v16, v17),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = CKObjectsAreBothNilOrEqual(),
            v18,
            v15,
            v19))
      {
        v22 = objc_msgSend_discoverable(self, v20, v21);
        v25 = v22 == objc_msgSend_discoverable(v5, v23, v24);
      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }
  }

  return v25;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;

  objc_msgSend_containerID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v4, v5, v6);
  objc_msgSend_applicationBundleIDs(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;
  v16 = v13 ^ objc_msgSend_discoverable(self, v14, v15);

  return v16;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (NSSet)applicationBundleIDs
{
  return self->_applicationBundleIDs;
}

- (int64_t)discoverable
{
  return self->_discoverable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIDs, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

@end
