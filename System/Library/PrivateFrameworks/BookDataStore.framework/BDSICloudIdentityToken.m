@implementation BDSICloudIdentityToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

- (BDSICloudIdentityToken)initWithCurrentIdentity
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  BDSICloudIdentityToken *v19;

  objc_msgSend_sharedProvider(MEMORY[0x24BE0FBE8], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_iCloudIdentity(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__hashFor_(self, v12, (uint64_t)v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (BDSICloudIdentityToken *)objc_msgSend_initWithToken_(self, v16, (uint64_t)v15, v17, v18);

  return v19;
}

- (BDSICloudIdentityToken)initWithToken:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BDSICloudIdentityToken *v9;
  uint64_t v10;
  NSString *token;
  BDSICloudIdentityToken *v12;
  objc_super v14;

  v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)BDSICloudIdentityToken;
    v9 = -[BDSICloudIdentityToken init](&v14, sel_init);
    if (v9)
    {
      v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
      token = v9->_token;
      v9->_token = (NSString *)v10;

    }
    self = v9;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_hashFor:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_dataUsingEncoding_(a3, a2, 4, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bu_md5UpperCase(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)tokenForCurrentIdentityIfCloudKitEnabled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BDSICloudIdentityToken *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (objc_msgSend_isSignedIntoICloud(BDSSyncUserDefaults, a2, v2, v3, v4)
    && objc_msgSend_isCloudKitSyncOptedIn(BDSSyncUserDefaults, v5, v6, v7, v8))
  {
    v9 = [BDSICloudIdentityToken alloc];
    v14 = (void *)objc_msgSend_initWithCurrentIdentity(v9, v10, v11, v12, v13);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)initFromArchive:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  BDSICloudIdentityToken *v8;
  BDSICloudIdentityToken *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self = (BDSICloudIdentityToken *)objc_msgSend_initWithToken_(self, v5, (uint64_t)v4, v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

+ (id)tokenForCurrentIdentityIfICloudDriveEnabled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int isGlobalICloudDriveSyncOptedIn;
  BDSICloudIdentityToken *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  objc_msgSend_sharedProvider(MEMORY[0x24BE0FBE8], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isUserSignedInToiCloud(v5, v6, v7, v8, v9)
    || !objc_msgSend_isICloudDriveSyncOptedIn(BDSSyncUserDefaults, v10, v11, v12, v13))
  {

    goto LABEL_6;
  }
  isGlobalICloudDriveSyncOptedIn = objc_msgSend_isGlobalICloudDriveSyncOptedIn(BDSSyncUserDefaults, v14, v15, v16, v17);

  if (!isGlobalICloudDriveSyncOptedIn)
  {
LABEL_6:
    v24 = 0;
    return v24;
  }
  v19 = [BDSICloudIdentityToken alloc];
  v24 = (void *)objc_msgSend_initWithCurrentIdentity(v19, v20, v21, v22, v23);
  return v24;
}

- (BOOL)isEqual:(id)a3
{
  BDSICloudIdentityToken *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char isEqualToString;

  v4 = (BDSICloudIdentityToken *)a3;
  if (self == v4)
  {
    isEqualToString = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_token(self, v5, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_token(v4, v10, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v9, v15, (uint64_t)v14, v16, v17);

    }
    else
    {
      isEqualToString = 0;
    }
  }

  return isEqualToString;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_token(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_initWithToken_(v4, v10, (uint64_t)v9, v11, v12);

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@=%p %@>"), v7, v8, v5, self, self->_token);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
