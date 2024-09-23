@implementation SecExperiment

- (SecExperiment)initWithName:(const char *)a3
{
  SecExperiment *v3;
  SecExperiment *v4;
  void *v5;
  objc_super v7;

  v3 = (SecExperiment *)a3;
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SecExperiment;
    self = -[SecExperiment init](&v7, sel_init);
    if (self)
    {
      v4 = self;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SecExperiment setName:](v4, "setName:", v5);

      self = v4;
      v3 = self;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (BOOL)experimentIsAllowedForProcess
{
  char v2;
  _QWORD block[5];
  _QWORD v5[5];
  id v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy_;
  v5[4] = __Block_byref_object_dispose_;
  v6 = &unk_1E1FFEE18;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SecExperiment_experimentIsAllowedForProcess__block_invoke;
  block[3] = &unk_1E1FD8CF0;
  block[4] = v5;
  if (experimentIsAllowedForProcess_onceToken != -1)
    dispatch_once(&experimentIsAllowedForProcess_onceToken, block);
  v2 = experimentIsAllowedForProcess_isAllowed;
  _Block_object_dispose(v5, 8);

  return v2;
}

- (BOOL)isSamplingDisabledWithDefault:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", kSecExperimentDefaultsDomain);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentDomainForName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableSampling");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        a3 = objc_msgSend(v10, "BOOLValue");

      }
    }

  }
  return a3;
}

- (BOOL)isSamplingDisabled
{
  return -[SecExperiment isSamplingDisabledWithDefault:](self, "isSamplingDisabledWithDefault:", -[SecExperiment samplingDisabled](self, "samplingDisabled"));
}

- (id)copyExperimentConfigurationFromUserDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", kSecExperimentDefaultsDomain);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "persistentDomainForName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    if (v6)
    {
      -[SecExperiment name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyRemoteExperimentAsset
{
  void *v3;
  void *v4;
  void *v5;
  CFTypeRef v6;
  CFTypeRef cf;

  cf = 0;
  v3 = (void *)SecTrustOTASecExperimentCopyAsset(&cf);
  if (v3)
  {
    -[SecExperiment name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  v6 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v6);
  }

  return v5;
}

- (id)copyRandomExperimentConfigurationFromAsset:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "valueForKey:", CFSTR("ConfigArray"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)copyExperimentConfiguration
{
  void *v3;
  void *v4;
  id v5;
  SecExperimentConfig *v6;
  id v7;
  id v8;
  SecExperimentConfig *v9;

  -[SecExperiment cachedConfig](self, "cachedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SecExperiment cachedConfig](self, "cachedConfig");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = -[SecExperiment copyExperimentConfigurationFromUserDefaults](self, "copyExperimentConfigurationFromUserDefaults");
    if (v5)
    {
      v6 = -[SecExperimentConfig initWithConfiguration:]([SecExperimentConfig alloc], "initWithConfiguration:", v5);
      -[SecExperiment setCachedConfig:](self, "setCachedConfig:", v6);

      -[SecExperiment cachedConfig](self, "cachedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = -[SecExperiment copyRemoteExperimentAsset](self, "copyRemoteExperimentAsset");
      if (v7)
      {
        v8 = -[SecExperiment copyRandomExperimentConfigurationFromAsset:](self, "copyRandomExperimentConfigurationFromAsset:", v7);
        v9 = -[SecExperimentConfig initWithConfiguration:]([SecExperimentConfig alloc], "initWithConfiguration:", v8);
        -[SecExperiment setCachedConfig:](self, "setCachedConfig:", v9);

        -[SecExperiment cachedConfig](self, "cachedConfig");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v4 = 0;
      }

    }
  }
  return v4;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;

  -[SecExperiment cachedConfig](self, "cachedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SecExperiment cachedConfig](self, "cachedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)samplingDisabled
{
  return self->_samplingDisabled;
}

- (void)setSamplingDisabled:(BOOL)a3
{
  self->_samplingDisabled = a3;
}

- (SecExperimentConfig)cachedConfig
{
  return (SecExperimentConfig *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachedConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConfig, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __46__SecExperiment_experimentIsAllowedForProcess__block_invoke()
{
  getpid();
  if (!csops())
    experimentIsAllowedForProcess_isAllowed = 1;
}

uint64_t __46__SecExperiment_experimentIsAllowedForProcess__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    experimentIsAllowedForProcess_isAllowed = 1;
    *a4 = 1;
  }
  return result;
}

@end
