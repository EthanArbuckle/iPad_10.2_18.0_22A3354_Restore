@implementation MTRApplicationLauncherClusterApplicationStruct

- (MTRApplicationLauncherClusterApplicationStruct)init
{
  MTRApplicationLauncherClusterApplicationStruct *v2;
  MTRApplicationLauncherClusterApplicationStruct *v3;
  NSNumber *catalogVendorID;
  NSString *applicationID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRApplicationLauncherClusterApplicationStruct;
  v2 = -[MTRApplicationLauncherClusterApplicationStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    catalogVendorID = v2->_catalogVendorID;
    v2->_catalogVendorID = (NSNumber *)&unk_250591B18;

    applicationID = v3->_applicationID;
    v3->_applicationID = (NSString *)&stru_2505249E8;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRApplicationLauncherClusterApplicationStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRApplicationLauncherClusterApplicationStruct);
  objc_msgSend_catalogVendorID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCatalogVendorID_(v4, v8, (uint64_t)v7);

  objc_msgSend_applicationID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setApplicationID_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: catalogVendorID:%@; applicationID:%@; >"),
    v5,
    self->_catalogVendorID,
    self->_applicationID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)catalogVendorID
{
  return self->_catalogVendorID;
}

- (void)setCatalogVendorID:(NSNumber *)catalogVendorID
{
  objc_setProperty_nonatomic_copy(self, a2, catalogVendorID, 8);
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (void)setApplicationID:(NSString *)applicationID
{
  objc_setProperty_nonatomic_copy(self, a2, applicationID, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_catalogVendorID, 0);
}

@end
