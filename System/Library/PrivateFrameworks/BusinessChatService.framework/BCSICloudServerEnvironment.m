@implementation BCSICloudServerEnvironment

- (BCSICloudServerEnvironment)initWithUserDefaults:(id)a3 isInternalInstall:(BOOL)a4 type:(int64_t)a5
{
  id v9;
  BCSICloudServerEnvironment *v10;
  BCSICloudServerEnvironment *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCSICloudServerEnvironment;
  v10 = -[BCSICloudServerEnvironment init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_userDefaults, a3);
    v11->_type = a5;
    v11->_isInternalInstall = a4;
  }

  return v11;
}

- (NSString)containerID
{
  void *v3;
  unint64_t v4;
  __CFString **v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t v11[16];

  -[BCSICloudServerEnvironment _productionContainerID](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BCSICloudServerEnvironment isInternalInstall](self, "isInternalInstall"))
  {
    v4 = -[BCSICloudServerEnvironment type](self, "type") - 1;
    if (v4 <= 3
      && (v5 = off_24C39C680[v4],
          -[BCSICloudServerEnvironment userDefaults](self, "userDefaults"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "stringForKey:", *v5),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v7))
    {
      v8 = v7;

      v3 = v8;
    }
    else
    {
      ABSLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_error_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_ERROR, "No custom cloudKit containerID set in user defaults, using production", v11, 2u);
      }

      -[BCSICloudServerEnvironment _productionContainerID](self);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }

    v3 = v8;
  }
  return (NSString *)v3;
}

- (__CFString)_productionContainerID
{
  uint64_t v1;

  if (a1)
  {
    v1 = objc_msgSend(a1, "type");
    if ((unint64_t)(v1 - 1) <= 3)
      return *off_24C39C6A0[v1 - 1];
    a1 = 0;
  }
  return (__CFString *)a1;
}

- (int64_t)containerEnvironment
{
  if (-[BCSICloudServerEnvironment isInternalInstall](self, "isInternalInstall")
    && -[BCSICloudServerEnvironment isStagingMode](self, "isStagingMode"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (NSDictionary)additionalRequestHTTPHeaders
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v8;
  void *v9;
  __CFString **v10;
  char v11;
  NSObject *v12;
  uint8_t v13[8];
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (-[BCSICloudServerEnvironment isInternalInstall](self, "isInternalInstall"))
  {
    switch(-[BCSICloudServerEnvironment type](self, "type"))
    {
      case 1:
        -[BCSICloudServerEnvironment userDefaults](self, "userDefaults");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("BCSSkipEdgeCaching"));

        if (!v4)
          goto LABEL_4;
        goto LABEL_12;
      case 2:
        -[BCSICloudServerEnvironment userDefaults](self, "userDefaults");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = kBCSDefaultsLinkSkipEdgeCaching;
        goto LABEL_11;
      case 3:
        -[BCSICloudServerEnvironment userDefaults](self, "userDefaults");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = kBCSDefaultsBusinessCallerSkipEdgeCaching;
        goto LABEL_11;
      case 4:
        -[BCSICloudServerEnvironment userDefaults](self, "userDefaults");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = kBCSDefaultsBusinessEmailSkipEdgeCaching;
LABEL_11:
        v11 = objc_msgSend(v8, "BOOLForKey:", *v10);

        if ((v11 & 1) == 0)
          goto LABEL_4;
LABEL_12:
        ABSLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_20ACAD000, v12, OS_LOG_TYPE_DEFAULT, "Edge cache disabled", v13, 2u);
        }

        v14 = CFSTR("Cache-Control");
        v15[0] = CFSTR("max-age=0");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    ABSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "Edge cache enabled", v13, 2u);
    }

    v6 = 0;
  }
  return (NSDictionary *)v6;
}

- (id)pirEnvironmentForServerType:(int64_t)a3
{
  BCSPIRServerEnvironment *v5;
  void *v6;
  BCSPIRServerEnvironment *v7;

  if ((unint64_t)(-[BCSICloudServerEnvironment type](self, "type") - 3) > 1)
  {
    v7 = 0;
  }
  else
  {
    v5 = [BCSPIRServerEnvironment alloc];
    -[BCSICloudServerEnvironment userDefaults](self, "userDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BCSPIRServerEnvironment initWithUserDefaults:isInternalInstall:type:serverType:](v5, "initWithUserDefaults:isInternalInstall:type:serverType:", v6, -[BCSICloudServerEnvironment isInternalInstall](self, "isInternalInstall"), -[BCSICloudServerEnvironment type](self, "type"), a3);

  }
  return v7;
}

- (BOOL)isStagingMode
{
  unint64_t v3;
  __CFString **v4;
  void *v5;

  v3 = -[BCSICloudServerEnvironment type](self, "type") - 1;
  if (v3 > 3)
    return 0;
  v4 = off_24C39C6C0[v3];
  -[BCSICloudServerEnvironment userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "BOOLForKey:", *v4);

  return (char)v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BCSICloudServerEnvironment succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSICloudServerEnvironment containerID](self, "containerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("containerID"));

  -[BCSICloudServerEnvironment containerEnvironment](self, "containerEnvironment");
  CKContainerEnvironmentString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("containerEnvironment"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BCSICloudServerEnvironment descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BCSUserDefaultsProviding)userDefaults
{
  return self->_userDefaults;
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
