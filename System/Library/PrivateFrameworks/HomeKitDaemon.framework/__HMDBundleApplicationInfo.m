@implementation __HMDBundleApplicationInfo

- (BOOL)isEntitledForSPIAccess
{
  void *v3;
  char v4;
  void *v6;
  char v7;

  -[LSPropertyList objectForKey:ofClass:](self->_entitlements, "objectForKey:ofClass:", CFSTR("com.apple.private.homekit"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) != 0)
    return 1;
  -[LSPropertyList objectForKey:ofClass:](self->_entitlements, "objectForKey:ofClass:", CFSTR("com.apple.homekit.private-spi-access"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
}

- (__HMDBundleApplicationInfo)initWithBundleIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  __HMDBundleApplicationInfo *v7;

  v4 = (objc_class *)MEMORY[0x24BDC1540];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v5, 0, 0);

  v7 = -[__HMDBundleApplicationInfo initWithRecord:](self, "initWithRecord:", v6);
  return v7;
}

- (__HMDBundleApplicationInfo)initWithRecord:(id)a3
{
  id v4;
  void *v5;
  __HMDBundleApplicationInfo *v6;
  void *v7;
  void *v8;
  __HMDBundleApplicationInfo *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  LSPropertyList *entitlements;
  objc_super v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (__HMDBundleApplicationInfo *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17.receiver = self;
      v17.super_class = (Class)__HMDBundleApplicationInfo;
      v9 = -[HMDApplicationInfo initWithBundleIdentifier:bundleURL:](&v17, sel_initWithBundleIdentifier_bundleURL_, v7, v8);

      if (v9)
      {
        objc_msgSend(v5, "entitlements");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x24BDBCF20];
        v18[0] = CFSTR("com.apple.developer.homekit");
        v18[1] = CFSTR("com.apple.private.homekit");
        v18[2] = CFSTR("com.apple.homekit.private-spi-access");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setWithArray:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectsForKeys:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        entitlements = v9->_entitlements;
        v9->_entitlements = (LSPropertyList *)v14;

      }
      self = v9;
      v6 = self;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEntitledForAPIAccess
{
  void *v2;
  char v3;

  -[LSPropertyList objectForKey:ofClass:](self->_entitlements, "objectForKey:ofClass:", CFSTR("com.apple.developer.homekit"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

@end
