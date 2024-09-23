@implementation BMStoreConfig

+ (id)newRestrictedStreamWithSegmentSize:(unint64_t)a3 protectionClass:(unint64_t)a4 domain:(unint64_t)a5
{
  BMStoreConfig *v8;
  void *v9;
  BMStoreConfig *v10;

  v8 = [BMStoreConfig alloc];
  objc_msgSend(MEMORY[0x1E0D01D10], "pathForStreamType:domain:", 2, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BMStoreConfig initWithStoreBasePath:segmentSize:protectionClass:](v8, "initWithStoreBasePath:segmentSize:protectionClass:", v9, a3, a4);

  return v10;
}

- (NSString)remoteName
{
  return self->_remoteName;
}

- (BMAccount)account
{
  return self->_account;
}

- (id)copyWithRemoteName:(id)a3
{
  id v4;
  BMStoreConfig *v5;
  id v6;
  uint64_t v8;

  v4 = a3;
  v5 = [BMStoreConfig alloc];
  BYTE4(v8) = self->_isManaged;
  LODWORD(v8) = self->_uid;
  v6 = -[BMStoreConfig _initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:](v5, "_initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:", self->_configDatastoreVersion, self->_datastorePath, self->_segmentSize, self->_protectionClass, self->_storeLocationOption, self->_account, v4, self->_pruningPolicy, self->_streamType, self->_domain, v8, self->_streamIdentifierForLogging);

  return v6;
}

- (BMStoreConfig)initWithStoreBasePath:(id)a3 segmentSize:(unint64_t)a4 protectionClass:(unint64_t)a5
{
  id v8;
  int v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  BMStoreConfig *v17;
  uint64_t v19;
  uint64_t v20;

  v8 = a3;
  v9 = +[BMStoreConfig defaultStoreVersion](BMStoreConfig, "defaultStoreVersion");
  v20 = 0;
  v10 = objc_msgSend((id)objc_opt_class(), "_streamTypeFromStorePath:domain:", v8, &v20);
  v12 = v10 == 4 || (unint64_t)(v10 - 1) < 2;
  objc_msgSend(MEMORY[0x1E0D01D10], "_pathForTesting");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(MEMORY[0x1E0D01D10], "_pathForTesting");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "hasPrefix:", v15);

    v12 &= ~v16;
  }
  BYTE4(v19) = v12;
  LODWORD(v19) = 0;
  v17 = -[BMStoreConfig _initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:](self, "_initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:", v9, v8, a4, a5, 0, 0, 0, 0, v10, v20, v19, 0);

  return v17;
}

+ (id)newLibraryStoreConfigForStreamIdentifier:(id)a3 domain:(unint64_t)a4 segmentSize:(unint64_t)a5 protectionClass:(unint64_t)a6 pruningPolicy:(id)a7
{
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  void *v19;
  uint64_t v21;

  v11 = a7;
  v12 = a3;
  v13 = +[BMStoreConfig defaultStoreVersion](BMStoreConfig, "defaultStoreVersion");
  objc_msgSend(MEMORY[0x1E0D01D10], "_pathForLibraryStreamWithDomain:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01D10], "_pathForTesting");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D01D10], "_pathForTesting");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "hasPrefix:", v16);

    v18 = v17 ^ 1;
  }
  else
  {
    v18 = 1;
  }

  BYTE4(v21) = v18;
  LODWORD(v21) = 0;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:", v13, v14, a5, a6, 0, 0, 0, v11, 2, a4, v21, v12);

  return v19;
}

+ (int)defaultStoreVersion
{
  return 10;
}

+ (unint64_t)_streamTypeFromStorePath:(id)a3 domain:(unint64_t *)a4
{
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  unint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  id v18;

  v18 = 0;
  v4 = objc_msgSend(MEMORY[0x1E0D01D10], "getServiceDomain:subpath:forPath:", a4, &v18, a3);
  v5 = v18;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D01D38], "streams");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01D38], "public");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "hasPrefix:", v8);

    if ((v9 & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D01D38], "restricted");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingPathComponent:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v5, "hasPrefix:", v12);

      if ((v13 & 1) != 0)
      {
        v10 = 2;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D01D38], "private");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringByAppendingPathComponent:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v5, "hasPrefix:", v15);

        if (v16)
          v10 = 4;
        else
          v10 = 3;
      }
    }

  }
  else
  {
    v10 = 3;
  }

  return v10;
}

- (void)setPruningPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_pruningPolicy, a3);
}

- (int64_t)storeLocationOption
{
  return self->_storeLocationOption;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (unint64_t)protectionClass
{
  return self->_protectionClass;
}

- (unint64_t)configDatastoreVersion
{
  return self->_configDatastoreVersion;
}

- (NSString)datastorePath
{
  return self->_datastorePath;
}

- (BMPruningPolicy)pruningPolicy
{
  return self->_pruningPolicy;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (unint64_t)segmentSize
{
  return self->_segmentSize;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_remoteName, 0);
  objc_storeStrong((id *)&self->_pruningPolicy, 0);
  objc_storeStrong((id *)&self->_datastorePath, 0);
  objc_storeStrong((id *)&self->_streamIdentifierForLogging, 0);
}

- (BMStoreConfig)initWithStoreBasePath:(id)a3 segmentSize:(unint64_t)a4
{
  return -[BMStoreConfig initWithStoreBasePath:segmentSize:protectionClass:](self, "initWithStoreBasePath:segmentSize:protectionClass:", a3, a4, 3);
}

+ (id)newStreamDefaultConfigurationForPublicStream:(BOOL)a3
{
  return (id)objc_msgSend(a1, "newStreamDefaultConfigurationForPublicStream:protectionClass:", a3, 3);
}

+ (id)newStreamDefaultConfigurationForPublicStream:(BOOL)a3 protectionClass:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "newStreamDefaultConfigurationForPublicStream:protectionClass:segmentSize:", a3, a4, 0x100000);
}

+ (id)newStreamDefaultConfigurationForPublicStream:(BOOL)a3 protectionClass:(unint64_t)a4 segmentSize:(unint64_t)a5
{
  uint64_t v7;
  void *v8;
  BMStoreConfig *v9;

  if (a3)
    v7 = 1;
  else
    v7 = 2;
  objc_msgSend(MEMORY[0x1E0D01D10], "pathForStreamType:domain:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BMStoreConfig initWithStoreBasePath:segmentSize:protectionClass:]([BMStoreConfig alloc], "initWithStoreBasePath:segmentSize:protectionClass:", v8, a5, a4);

  return v9;
}

+ (id)newPublicStreamDefaultConfiguration
{
  return (id)objc_msgSend(a1, "newPublicStreamDefaultConfigurationWithProtectionClass:", 3);
}

+ (id)newPublicStreamDefaultConfigurationWithProtectionClass:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "newStreamDefaultConfigurationForPublicStream:protectionClass:", 1, a3);
}

+ (id)newRestrictedStreamDefaultConfiguration
{
  return (id)objc_msgSend(a1, "newRestrictedStreamDefaultConfigurationWithProtectionClass:", 3);
}

+ (id)newRestrictedStreamDefaultConfigurationWithProtectionClass:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "newRestrictedStreamWithSegmentSize:protectionClass:", 0x100000, a3);
}

+ (id)newRestrictedStreamWithSegmentSize:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "newRestrictedStreamWithSegmentSize:protectionClass:", a3, 3);
}

+ (id)newRestrictedStreamWithSegmentSize:(unint64_t)a3 protectionClass:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "newRestrictedStreamWithSegmentSize:protectionClass:domain:", a3, a4, 0);
}

+ (id)newPrivateStreamDefaultConfigurationWithStoreBasePath:(id)a3
{
  return (id)objc_msgSend(a1, "newPrivateStreamDefaultConfigurationWithStoreBasePath:protectionClass:", a3, 3);
}

+ (id)newPrivateStreamDefaultConfigurationWithStoreBasePath:(id)a3 protectionClass:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0D01D10], "pathForStreamType:domain:", 4, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStoreBasePath:segmentSize:protectionClass:", v6, 0x100000, a4);

  return v7;
}

+ (id)newPrivateStreamDefaultConfigurationWithProtectionClass:(unint64_t)a3 segmentSize:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "newStreamDefaultConfigurationForPublicStream:protectionClass:segmentSize:", 0, a3, a4);
}

- (id)_initWithStoreVersion:(unint64_t)a3 storeBasePath:(id)a4 segmentSize:(unint64_t)a5 protectionClass:(unint64_t)a6 storeLocationOption:(int64_t)a7 account:(id)a8 remoteName:(id)a9 pruningPolicy:(id)a10 streamType:(unint64_t)a11 domain:(unint64_t)a12 user:(unsigned int)a13 isManaged:(BOOL)a14 streamIdentifier:(id)a15
{
  id v18;
  id v19;
  id v20;
  id v21;
  BMStoreConfig *v22;
  BMStoreConfig *v23;
  unsigned int v24;
  void *v26;
  id v32;
  objc_super v33;

  v18 = a4;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v32 = a15;
  if (objc_msgSend(v18, "hasPrefix:", CFSTR("file://")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMStoreConfig.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![storeBasePath hasPrefix:@\"file://\"]"));

  }
  v33.receiver = self;
  v33.super_class = (Class)BMStoreConfig;
  v22 = -[BMStoreConfig init](&v33, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_configDatastoreVersion = a3;
    objc_storeStrong((id *)&v22->_datastorePath, a4);
    v23->_segmentSize = a5;
    v23->_storeLocationOption = a7 & 0xFFFFFFFFFFFFFFFELL | (v20 != 0);
    objc_storeStrong((id *)&v23->_account, a8);
    objc_storeStrong((id *)&v23->_remoteName, a9);
    objc_storeStrong((id *)&v23->_pruningPolicy, a10);
    v23->_protectionClass = a6;
    v23->_streamType = a11;
    v23->_domain = a12;
    if (a12 == 1)
    {
      v24 = 0;
    }
    else
    {
      v24 = a13;
      if (!a13)
        v24 = geteuid();
    }
    v23->_uid = v24;
    v23->_isManaged = a14;
    objc_storeStrong((id *)&v23->_streamIdentifierForLogging, a15);
  }

  return v23;
}

- (unint64_t)streamType
{
  return self->_streamType;
}

- (id)subscriptionsConfig
{
  uint64_t v3;
  id v4;
  BMStoreConfig *v5;
  unint64_t domain;
  unsigned int uid;
  BOOL isManaged;
  NSString *datastorePath;
  void *v10;
  id v11;
  uint64_t v13;

  v3 = +[BMStoreConfig defaultStoreVersion](BMStoreConfig, "defaultStoreVersion");
  v4 = -[BMPruningPolicy initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:]([BMPruningPolicy alloc], "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 0, 0, 5242880, 604800.0);
  v5 = [BMStoreConfig alloc];
  domain = self->_domain;
  uid = self->_uid;
  isManaged = self->_isManaged;
  datastorePath = self->_datastorePath;
  -[NSString stringByAppendingString:](self->_streamIdentifierForLogging, "stringByAppendingString:", CFSTR(":subscriptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE4(v13) = isManaged;
  LODWORD(v13) = uid;
  v11 = -[BMStoreConfig _initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:](v5, "_initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:", v3, datastorePath, 0x20000, 4, 4, 0, 0, v4, 2, domain, v13, v10);

  return v11;
}

- (id)tombstonesConfig
{
  id v3;
  BMStoreConfig *v4;
  unint64_t protectionClass;
  BMAccount *account;
  NSString *remoteName;
  unint64_t domain;
  unsigned int uid;
  BOOL isManaged;
  NSString *datastorePath;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;

  v16 = +[BMStoreConfig defaultStoreVersion](BMStoreConfig, "defaultStoreVersion");
  v3 = -[BMPruningPolicy initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:]([BMPruningPolicy alloc], "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 0, 0, 10485760, 691200.0);
  v4 = [BMStoreConfig alloc];
  protectionClass = self->_protectionClass;
  remoteName = self->_remoteName;
  account = self->_account;
  domain = self->_domain;
  uid = self->_uid;
  isManaged = self->_isManaged;
  datastorePath = self->_datastorePath;
  -[NSString stringByAppendingString:](self->_streamIdentifierForLogging, "stringByAppendingString:", CFSTR(":tombstones"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE4(v15) = isManaged;
  LODWORD(v15) = uid;
  v13 = -[BMStoreConfig _initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:](v4, "_initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:", v16, datastorePath, 0x100000, protectionClass, 2, account, remoteName, v3, 2, domain, v15, v12);

  return v13;
}

- (id)copyWithStoreBasePath:(id)a3
{
  id v4;
  uint64_t v5;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v4 = a3;
  v15 = 0;
  v5 = objc_msgSend((id)objc_opt_class(), "_streamTypeFromStorePath:domain:", v4, &v15);
  v7 = v5 == 4 || (unint64_t)(v5 - 1) < 2;
  objc_msgSend(MEMORY[0x1E0D01D10], "_pathForTesting");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(MEMORY[0x1E0D01D10], "_pathForTesting");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "hasPrefix:", v10);

    v7 &= ~v11;
  }
  v12 = -[BMStoreConfig copy](self, "copy");
  v13 = *(void **)(v12 + 16);
  *(_QWORD *)(v12 + 16) = v4;

  *(_BYTE *)(v12 + 32) = v7;
  return (id)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BMStoreConfig *v4;
  unint64_t configDatastoreVersion;
  void *v6;
  unint64_t segmentSize;
  unint64_t protectionClass;
  BMAccount *account;
  NSString *remoteName;
  int64_t storeLocationOption;
  void *v12;
  id v13;
  uint64_t v15;

  v4 = [BMStoreConfig alloc];
  configDatastoreVersion = self->_configDatastoreVersion;
  v6 = (void *)-[NSString copy](self->_datastorePath, "copy");
  segmentSize = self->_segmentSize;
  protectionClass = self->_protectionClass;
  remoteName = self->_remoteName;
  account = self->_account;
  storeLocationOption = self->_storeLocationOption;
  v12 = (void *)-[BMPruningPolicy copy](self->_pruningPolicy, "copy");
  BYTE4(v15) = self->_isManaged;
  LODWORD(v15) = self->_uid;
  v13 = -[BMStoreConfig _initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:](v4, "_initWithStoreVersion:storeBasePath:segmentSize:protectionClass:storeLocationOption:account:remoteName:pruningPolicy:streamType:domain:user:isManaged:streamIdentifier:", configDatastoreVersion, v6, segmentSize, protectionClass, storeLocationOption, account, remoteName, v12, self->_streamType, self->_domain, v15, self->_streamIdentifierForLogging);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BMPruningPolicy *pruningPolicy;
  char v10;
  char v11;
  char v12;
  char v13;
  NSString *remoteName;
  char v15;
  char v16;
  BMAccount *account;
  char v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[NSString isEqualToString:](self->_datastorePath, "isEqualToString:", v5[2]);
    v7 = self->_segmentSize == v5[5] && v6;
    v8 = self->_protectionClass == v5[6] && v7;
    pruningPolicy = self->_pruningPolicy;
    if (pruningPolicy == (BMPruningPolicy *)v5[7])
      v10 = 1;
    else
      v10 = -[BMPruningPolicy isEqual:](pruningPolicy, "isEqual:");
    v12 = v8 & v10;
    if (self->_configDatastoreVersion != v5[8])
      v12 = 0;
    if (self->_storeLocationOption == v5[9])
      v13 = v12;
    else
      v13 = 0;
    remoteName = self->_remoteName;
    if (remoteName == (NSString *)v5[10])
      v15 = 1;
    else
      v15 = -[NSString isEqualToString:](remoteName, "isEqualToString:");
    v16 = v13 & v15;
    account = self->_account;
    if (account == (BMAccount *)v5[11])
      v18 = 1;
    else
      v18 = -[BMAccount isEqual:](account, "isEqual:");
    v11 = v16 & v18;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_datastorePath, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_configDatastoreVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_segmentSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

+ (unint64_t)streamTypeFromStorePath:(id)a3
{
  uint64_t v4;

  v4 = 0;
  return objc_msgSend(a1, "_streamTypeFromStorePath:domain:", a3, &v4);
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<BMStoreConfig datastorePath: %@ version: %lu>"), self->_datastorePath, self->_configDatastoreVersion);
}

- (id)resolvedPathWithStreamIdentifier:(id)a3
{
  void *v4;
  int64_t storeLocationOption;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[NSString stringByAppendingPathComponent:](self->_datastorePath, "stringByAppendingPathComponent:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  storeLocationOption = self->_storeLocationOption;
  if ((storeLocationOption & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D01D38], "remoteDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", self->_remoteName);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v7;
  }
  else
  {
    if ((storeLocationOption & 4) != 0)
      objc_msgSend(MEMORY[0x1E0D01D38], "subscriptions");
    else
      objc_msgSend(MEMORY[0x1E0D01D38], "localDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if ((self->_storeLocationOption & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D01D38], "tombstones");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  return v8;
}

- (void)setStoreLocationOption:(int64_t)a3
{
  self->_storeLocationOption = a3;
}

- (void)setRemoteName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

@end
