@implementation AMSUIDCellularDataInquiry

- (AMSUIDCellularDataInquiry)initWithBundle:(id)a3
{
  id v5;
  AMSUIDCellularDataInquiry *v6;
  AMSUIDCellularDataInquiry *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIDCellularDataInquiry;
  v6 = -[AMSUIDCellularDataInquiry init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundle, a3);

  return v7;
}

- (AMSUIDCellularDataInquiry)init
{
  void *v3;
  AMSUIDCellularDataInquiry *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AMSUIDCellularDataInquiry initWithBundle:](self, "initWithBundle:", v3);

  return v4;
}

+ (NSURL)settingsURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0D80488], "preferencesURL");
}

- (BOOL)isSupported
{
  return objc_msgSend(MEMORY[0x1E0D80488], "deviceSupportsCellularData");
}

- (BOOL)isEnabledForDevice
{
  int v2;

  v2 = -[AMSUIDCellularDataInquiry isSupported](self, "isSupported");
  if (v2)
    LOBYTE(v2) = objc_msgSend(MEMORY[0x1E0D80488], "isEnabled");
  return v2;
}

- (BOOL)isEnabledForBundle
{
  _BOOL4 v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const __CFBoolean *Value;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[AMSUIDCellularDataInquiry isEnabledForDevice](self, "isEnabledForDevice");
  if (v3)
  {
    v4 = (const __CFDictionary *)_CTServerConnectionCreateOnTargetQueue();
    if (v4)
    {
      v5 = v4;
      -[AMSUIDCellularDataInquiry bundle](self, "bundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = _CTServerConnectionCopyCellularUsagePolicy();
      CFRelease(v5);
      if ((_DWORD)v8)
      {
        objc_msgSend(MEMORY[0x1E0CFDAF0], "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0CFDAF0], "sharedConfig");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "OSLogObject");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67240448;
          v14 = v8;
          v15 = 1026;
          v16 = HIDWORD(v8);
          _os_log_impl(&dword_1B9D3F000, v10, OS_LOG_TYPE_ERROR, "Could not determine cellular usage policy, reason: CTError(domain: %{public}d, error: %{public}d)", buf, 0xEu);
        }

        goto LABEL_12;
      }

      v4 = 0;
    }
    Value = (const __CFBoolean *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E0CA7340]);
    CFRelease(0);
    if (!Value)
    {
LABEL_12:
      LOBYTE(v3) = 1;
      return v3;
    }
    LOBYTE(v3) = CFBooleanGetValue(Value) != 0;
  }
  return v3;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
