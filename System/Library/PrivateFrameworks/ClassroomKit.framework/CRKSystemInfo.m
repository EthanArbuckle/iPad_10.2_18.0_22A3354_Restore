@implementation CRKSystemInfo

+ (CRKSystemInfo)sharedSystemInfo
{
  if (sharedSystemInfo_onceToken != -1)
    dispatch_once(&sharedSystemInfo_onceToken, &__block_literal_global_71);
  return (CRKSystemInfo *)(id)sharedSystemInfo_info;
}

void __33__CRKSystemInfo_sharedSystemInfo__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedSystemInfo_info;
  sharedSystemInfo_info = v0;

}

- (void)populateVersions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[CRKMobileGestalt sharedGestalt](CRKMobileGestalt, "sharedGestalt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buildVersion");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[CRKMobileGestalt sharedGestalt](CRKMobileGestalt, "sharedGestalt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKSystemInfo setBuildVersion:](self, "setBuildVersion:", v6);
  -[CRKSystemInfo setSystemVersion:](self, "setSystemVersion:", v5);

}

- (NSString)buildVersion
{
  NSString *buildVersion;

  buildVersion = self->_buildVersion;
  if (!buildVersion)
  {
    -[CRKSystemInfo populateVersions](self, "populateVersions");
    buildVersion = self->_buildVersion;
  }
  return buildVersion;
}

- (NSString)systemVersion
{
  NSString *systemVersion;

  systemVersion = self->_systemVersion;
  if (!systemVersion)
  {
    -[CRKSystemInfo populateVersions](self, "populateVersions");
    systemVersion = self->_systemVersion;
  }
  return systemVersion;
}

- (unint64_t)platform
{
  return 1;
}

- (NSDate)bootDate
{
  void *v2;
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v7 = 0x1500000001;
  v5 = 0;
  v6 = 0;
  v4 = 16;
  if (sysctl(v7, 2u, &v5, &v4, 0, 0) == -1)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(int)v6 / 1000000.0 + (double)v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v2;
}

- (BOOL)isEphemeralMultiUser
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEphemeralMultiUser");

  return v3;
}

- (BOOL)cloudConfigEnablesEphemeralMultiUser
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userMode") == 1;

  return v3;
}

- (void)setBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setSystemVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end
