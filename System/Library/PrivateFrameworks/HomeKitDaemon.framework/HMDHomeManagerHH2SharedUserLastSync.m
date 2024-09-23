@implementation HMDHomeManagerHH2SharedUserLastSync

- (HMDHomeManagerHH2SharedUserLastSync)initWithArchivePath:(id)a3
{
  id v5;
  HMDHomeManagerHH2SharedUserLastSync *v6;
  HMDHomeManagerHH2SharedUserLastSync *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHomeManagerHH2SharedUserLastSync;
  v6 = -[HMDHomeManagerHH2SharedUserLastSync init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_archivePath, a3);

  return v7;
}

- (void)configure
{
  const char *v3;
  void *v4;
  id Property;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;

  v4 = (void *)MEMORY[0x227676638](self, a2);
  if (self)
    Property = objc_getProperty(self, v3, 40, 1);
  else
    Property = 0;
  +[HMDUser getSyncDataFromLocalDiskWithArchive:](HMDUser, "getSyncDataFromLocalDiskWithArchive:", Property);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("HMD.sync.data.homeUUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeManagerHH2SharedUserLastSync setHomeUUID:](self, "setHomeUUID:", v8);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HMD.sync.data.user"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeManagerHH2SharedUserLastSync setUser:](self, "setUser:", v9);

    objc_msgSend(v7, "hmf_dateForKey:", CFSTR("HMD.sync.data.timestamp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      objc_setProperty_atomic(self, v10, v11, 32);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HMD.sync.data.data"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      self->_valid = 1;
  }

  objc_autoreleasePoolPop(v4);
}

- (BOOL)isEqual:(id)a3
{
  HMDHomeManagerHH2SharedUserLastSync *v4;
  HMDHomeManagerHH2SharedUserLastSync *v5;
  HMDHomeManagerHH2SharedUserLastSync *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = (HMDHomeManagerHH2SharedUserLastSync *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6
      && (-[HMDHomeManagerHH2SharedUserLastSync homeUUID](self, "homeUUID"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMDHomeManagerHH2SharedUserLastSync homeUUID](v6, "homeUUID"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqual:", v8),
          v8,
          v7,
          v9))
    {
      -[HMDHomeManagerHH2SharedUserLastSync user](self, "user");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeManagerHH2SharedUserLastSync user](v6, "user");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqual:", v13);

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (NSData)archive
{
  const char *v3;
  void *v4;
  id Property;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x227676638](self, a2);
  if (self)
    Property = objc_getProperty(self, v3, 40, 1);
  else
    Property = 0;
  +[HMDUser getSyncDataFromLocalDiskWithArchive:](HMDUser, "getSyncDataFromLocalDiskWithArchive:", Property);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HMD.sync.data.data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return (NSData *)v7;
}

- (void)removeArchiveFromLocalDisk
{
  const char *v3;
  id v4;
  id Property;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDHomeManagerHH2SharedUserLastSync *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc(MEMORY[0x24BDBCF48]);
  if (self)
    Property = objc_getProperty(self, v3, 40, 1);
  else
    Property = 0;
  v6 = (void *)objc_msgSend(v4, "initFileURLWithPath:", Property);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v7, "removeItemAtURL:error:", v6, &v15);
  v8 = v15;

  if (v8)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
        v14 = objc_getProperty(v10, v12, 40, 1);
      else
        v14 = 0;
      *(_DWORD *)buf = 138543874;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while removing sync data file \"%@\" from disk : %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (id)shortDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeManagerHH2SharedUserLastSync homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("HomeUUID"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeManagerHH2SharedUserLastSync user](self, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("UserUUID"), v9);
  objc_msgSend(v3, "addObject:", v10);

  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeManagerHH2SharedUserLastSync user](self, "user");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("UserID"), v13);
  objc_msgSend(v3, "addObject:", v14);

  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeManagerHH2SharedUserLastSync creationDate](self, "creationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Created Date"), v16);
  objc_msgSend(v3, "addObject:", v17);

  v18 = (void *)objc_msgSend(v3, "copy");
  return v18;
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHomeUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HMDUser)user
{
  return (HMDUser *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)isValid
{
  return self->_valid;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivePath, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
