@implementation MCAlwaysOnVPNPayload

- (MCAlwaysOnVPNPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCAlwaysOnVPNPayload *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MCAlwaysOnVPNPayload;
  v9 = -[MCVPNPayloadBase initWithDictionary:profile:outError:](&v14, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (v9)
  {
    if (objc_msgSend(v8, "count"))
    {
      v10 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v11 = v10;
        -[MCPayload friendlyName](v9, "friendlyName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v16 = v12;
        v17 = 2114;
        v18 = v8;
        _os_log_impl(&dword_19ECC4000, v11, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

      }
    }
  }

  return v9;
}

- (id)_validatePayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint8_t buf[16];

  v4 = a3;
  if (MCNEProfileIngestionClass())
  {
    v5 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("NEProfilePayloadAOVPN"))), "initWithPayload:", v4);
    -[MCVPNPayloadBase setNePayloadBase:](self, "setNePayloadBase:", v5);

    -[MCVPNPayloadBase nePayloadBase](self, "nePayloadBase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "validatePayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v8, OS_LOG_TYPE_ERROR, "MCAlwaysOnVPNPayload failed to load NE bundle", buf, 2u);
    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("ERROR_ALWAYS_ON_VPN_INTERNAL_ERROR"), v9, v10, v11, v12, v13, v14, v15, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPayloadErrorDomain"), 2005, v17, CFSTR("MCFatalError"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.vpn.managed.alwayson");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localizedSingularForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("ALWAYS_ON_VPN_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("ALWAYS_ON_VPN_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

@end
