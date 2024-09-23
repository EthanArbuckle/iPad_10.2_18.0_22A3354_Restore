@implementation DCSettings

- (DCSettings)init
{
  DCSettings *v2;
  uint64_t v3;
  NSUserDefaults *userDefaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DCSettings;
  v2 = -[DCSettings init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DocumentCamera"));
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

  }
  return v2;
}

+ (id)sharedSettings
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__DCSettings_sharedSettings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSettings_once != -1)
    dispatch_once(&sharedSettings_once, block);
  return (id)sharedSettings_sharedSettings;
}

void __28__DCSettings_sharedSettings__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedSettings_sharedSettings;
  sharedSettings_sharedSettings = (uint64_t)v1;

}

- (BOOL)enableViewService
{
  void *v2;
  void *v3;
  char v4;
  BOOL v5;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("EnableViewService"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = DCDebugInterfaceEnabled();
  v5 = v4;

  return v5;
}

- (BOOL)finishAfterFirstScan
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("DCFinishAfterFirstScan"));
}

- (BOOL)useDocumentSegmentationRequest
{
  void *v2;
  void *v3;
  char v4;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("UseDocumentSegmentationRequest"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (double)imageQuality
{
  NSUserDefaults *userDefaults;
  void *v4;
  double result;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  userDefaults = self->_userDefaults;
  v6 = CFSTR("DCImageQuality");
  v7[0] = &unk_24C5D7F50;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults registerDefaults:](userDefaults, "registerDefaults:", v4);

  -[NSUserDefaults doubleForKey:](self->_userDefaults, "doubleForKey:", CFSTR("DCImageQuality"));
  return result;
}

- (id)enableViewServiceBoxed
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DCSettings enableViewService](self, "enableViewService"));
}

- (void)setEnableViewServiceBoxed:(id)a3
{
  NSUserDefaults *userDefaults;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  userDefaults = self->_userDefaults;
  v5 = a3;
  -[NSUserDefaults setBool:forKey:](userDefaults, "setBool:forKey:", objc_msgSend(v5, "BOOLValue"), CFSTR("EnableViewService"));
  v6 = *MEMORY[0x24BDD0D70];
  -[NSUserDefaults persistentDomainForName:](self->_userDefaults, "persistentDomainForName:", *MEMORY[0x24BDD0D70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("EnableViewService"));
  -[NSUserDefaults setPersistentDomain:forName:](self->_userDefaults, "setPersistentDomain:forName:", v8, v6);

}

- (id)finishAfterFirstScanBoxed
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DCSettings finishAfterFirstScan](self, "finishAfterFirstScan"));
}

- (void)setFinishAfterFirstScanBoxed:(id)a3
{
  NSUserDefaults *userDefaults;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  userDefaults = self->_userDefaults;
  v5 = a3;
  -[NSUserDefaults setBool:forKey:](userDefaults, "setBool:forKey:", objc_msgSend(v5, "BOOLValue"), CFSTR("DCFinishAfterFirstScan"));
  v6 = *MEMORY[0x24BDD0D70];
  -[NSUserDefaults persistentDomainForName:](self->_userDefaults, "persistentDomainForName:", *MEMORY[0x24BDD0D70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("DCFinishAfterFirstScan"));
  -[NSUserDefaults setPersistentDomain:forName:](self->_userDefaults, "setPersistentDomain:forName:", v8, v6);

}

- (id)useDocumentSegmentationRequestBoxed
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DCSettings useDocumentSegmentationRequest](self, "useDocumentSegmentationRequest"));
}

- (void)setUseDocumentSegmentationRequestBoxed:(id)a3
{
  NSUserDefaults *userDefaults;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  userDefaults = self->_userDefaults;
  v5 = a3;
  -[NSUserDefaults setBool:forKey:](userDefaults, "setBool:forKey:", objc_msgSend(v5, "BOOLValue"), CFSTR("UseDocumentSegmentationRequest"));
  v6 = *MEMORY[0x24BDD0D70];
  -[NSUserDefaults persistentDomainForName:](self->_userDefaults, "persistentDomainForName:", *MEMORY[0x24BDD0D70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("UseDocumentSegmentationRequest"));
  -[NSUserDefaults setPersistentDomain:forName:](self->_userDefaults, "setPersistentDomain:forName:", v8, v6);

}

- (id)imageQualityBoxed
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[DCSettings imageQuality](self, "imageQuality");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (void)setImageQualityBoxed:(id)a3
{
  NSUserDefaults *userDefaults;
  uint64_t v5;
  void *v6;
  id v7;

  userDefaults = self->_userDefaults;
  objc_msgSend(a3, "doubleValue");
  -[NSUserDefaults setDouble:forKey:](userDefaults, "setDouble:forKey:", CFSTR("DCImageQuality"));
  v5 = *MEMORY[0x24BDD0D70];
  -[NSUserDefaults persistentDomainForName:](self->_userDefaults, "persistentDomainForName:", *MEMORY[0x24BDD0D70]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setObject:forKey:", CFSTR("DCImageQuality"), CFSTR("DCImageQuality"));
  -[NSUserDefaults setPersistentDomain:forName:](self->_userDefaults, "setPersistentDomain:forName:", v7, v5);

}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUserDefaults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
