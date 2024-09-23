@implementation MCVPNPayload

- (MCVPNPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCVPNPayload *v9;
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
  v14.super_class = (Class)MCVPNPayload;
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

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.vpn.managed"));
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

  return MCLocalizedFormat(CFSTR("VPN_SETTINGS_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("VPN_SETTINGS_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

@end
