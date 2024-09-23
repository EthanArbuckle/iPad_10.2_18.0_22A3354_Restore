@implementation DADeviceAppAccessInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DADeviceAppAccessInfo)initWithBundleIdentifier:(id)a3 deviceIdentifier:(id)a4 accessoryOptions:(unint64_t)a5 state:(int64_t)a6
{
  id v10;
  id v11;
  DADeviceAppAccessInfo *v12;
  DADeviceAppAccessInfo *v13;
  DADeviceAppAccessInfo *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DADeviceAppAccessInfo;
  v12 = -[DADeviceAppAccessInfo init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v13->_deviceIdentifier, a4);
    v13->_state = a6;
    v14 = v13;
  }

  return v13;
}

- (DADeviceAppAccessInfo)initWithBundleIdentifier:(id)a3 deviceIdentifier:(id)a4 state:(int64_t)a5
{
  return -[DADeviceAppAccessInfo initWithBundleIdentifier:deviceIdentifier:accessoryOptions:state:](self, "initWithBundleIdentifier:deviceIdentifier:accessoryOptions:state:", a3, a4, 0, a5);
}

- (DADeviceAppAccessInfo)initWithPersistentDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  DADeviceAppAccessInfo *v7;
  void *v8;
  double v9;
  uint64_t v10;
  NSString *bundleIdentifier;
  uint64_t v12;
  NSString *deviceIdentifier;
  void *v14;
  uint64_t v15;
  DADiscoveryConfiguration *appDiscoveryConfiguration;
  void *v17;
  DADeviceAppAccessInfo *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;

  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)DADeviceAppAccessInfo;
  v7 = -[DADeviceAppAccessInfo init](&v27, sel_init);
  if (v7)
  {
    NSDictionaryGetNSNumber();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_accessoryOptions = objc_msgSend(v8, "unsignedIntegerValue");

    CFDictionaryGetDouble();
    v7->_approveTime = v9;
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v10 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v10;

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v12 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v7->_deviceIdentifier;
    v7->_deviceIdentifier = (NSString *)v12;

    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v14, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    appDiscoveryConfiguration = v7->_appDiscoveryConfiguration;
    v7->_appDiscoveryConfiguration = (DADiscoveryConfiguration *)v15;

    NSDictionaryGetNSNumber();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_state = objc_msgSend(v17, "integerValue");

    v18 = v7;
  }
  else if (a4)
  {
    v20 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ super init failed", v21, v22, v23, v24, v25, v26, v20);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)persistentDictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  NSString *bundleIdentifier;
  NSString *deviceIdentifier;
  DADiscoveryConfiguration *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_accessoryOptions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("accessoryOptions"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_approveTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("approveTime"));

  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", bundleIdentifier, CFSTR("deviceAppBundleID"));
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", deviceIdentifier, CFSTR("identifier"));
  v8 = self->_appDiscoveryConfiguration;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("configuration"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_state);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("deviceState"));

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  double approveTime;
  NSString *bundleIdentifier;
  id v7;
  const char *v8;
  NSString *deviceIdentifier;
  const char *v10;
  xpc_object_t xdict;

  v4 = a3;
  xpc_dictionary_set_uint64(v4, "dvAo", self->_accessoryOptions);
  approveTime = self->_approveTime;
  if (approveTime != 0.0)
    xpc_dictionary_set_double(v4, "apT", approveTime);
  bundleIdentifier = self->_bundleIdentifier;
  v7 = v4;
  v8 = -[NSString UTF8String](objc_retainAutorelease(bundleIdentifier), "UTF8String");
  if (v8)
    xpc_dictionary_set_string(v7, "bndI", v8);

  deviceIdentifier = self->_deviceIdentifier;
  xdict = v7;
  v10 = -[NSString UTF8String](objc_retainAutorelease(deviceIdentifier), "UTF8String");
  if (v10)
    xpc_dictionary_set_string(xdict, "id", v10);

  CUXPCEncodeObject();
  xpc_dictionary_set_int64(xdict, "dvSt", self->_state);

}

- (DADeviceAppAccessInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DADeviceAppAccessInfo *v7;
  int v8;
  int v9;
  DADeviceAppAccessInfo *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;
  unint64_t v20;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DADeviceAppAccessInfo;
  v7 = -[DADeviceAppAccessInfo init](&v19, sel_init);
  if (!v7)
  {
    if (a4)
    {
      v12 = objc_opt_class();
      DAErrorF(350001, (uint64_t)"%@ super init failed", v13, v14, v15, v16, v17, v18, v12);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  v20 = 0;
  v8 = CUXPCDecodeUInt64RangedEx();
  if (v8 == 6)
  {
    v7->_accessoryOptions = v20;
  }
  else if (v8 == 5)
  {
    goto LABEL_15;
  }
  if (!CUXPCDecodeDouble()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString())
  {
    goto LABEL_15;
  }
  objc_opt_class();
  CUXPCDecodeObject();
  v20 = 0;
  v9 = CUXPCDecodeSInt64RangedEx();
  if (v9 != 6)
  {
    if (v9 != 5)
      goto LABEL_11;
LABEL_15:
    v10 = 0;
    goto LABEL_12;
  }
  v7->_state = v20;
LABEL_11:
  v10 = v7;
LABEL_12:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *bundleIdentifier;
  NSString *deviceIdentifier;
  DADiscoveryConfiguration *appDiscoveryConfiguration;
  int64_t state;
  unint64_t accessoryOptions;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_approveTime != 0.0)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("apT"));
    v4 = v10;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
  {
    objc_msgSend(v10, "encodeObject:forKey:", bundleIdentifier, CFSTR("bndI"));
    v4 = v10;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    objc_msgSend(v10, "encodeObject:forKey:", deviceIdentifier, CFSTR("id"));
    v4 = v10;
  }
  appDiscoveryConfiguration = self->_appDiscoveryConfiguration;
  if (appDiscoveryConfiguration)
  {
    objc_msgSend(v10, "encodeObject:forKey:", appDiscoveryConfiguration, CFSTR("dsCf"));
    v4 = v10;
  }
  state = self->_state;
  if (state)
  {
    objc_msgSend(v10, "encodeInteger:forKey:", state, CFSTR("dvSt"));
    v4 = v10;
  }
  accessoryOptions = self->_accessoryOptions;
  if (accessoryOptions)
  {
    objc_msgSend(v10, "encodeInteger:forKey:", accessoryOptions, CFSTR("dvFl"));
    v4 = v10;
  }

}

- (DADeviceAppAccessInfo)initWithCoder:(id)a3
{
  id v4;
  DADeviceAppAccessInfo *v5;
  id v6;
  double v7;
  id v8;
  id v9;
  id v10;
  id v11;
  DADeviceAppAccessInfo *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DADeviceAppAccessInfo;
  v5 = -[DADeviceAppAccessInfo init](&v22, sel_init);
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v6 = v4;
    if (objc_msgSend(v6, "containsValueForKey:", CFSTR("apT")))
    {
      objc_msgSend(v6, "decodeDoubleForKey:", CFSTR("apT"));
      v5->_approveTime = v7;
    }

    v8 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v10 = v9;
    if (objc_msgSend(v10, "containsValueForKey:", CFSTR("dvFl")))
      v5->_accessoryOptions = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("dvFl"));

    v11 = v10;
    if (objc_msgSend(v11, "containsValueForKey:", CFSTR("dvSt")))
      v5->_state = objc_msgSend(v11, "decodeIntegerForKey:", CFSTR("dvSt"));

    v12 = v5;
  }
  else
  {
    v14 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ init failed", v15, v16, v17, v18, v19, v20, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v21);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 40) = self->_accessoryOptions;
  v5 = -[DADiscoveryConfiguration copy](self->_appDiscoveryConfiguration, "copy");
  v6 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v5;

  *(double *)(v4 + 16) = self->_approveTime;
  v7 = -[NSString copy](self->_bundleIdentifier, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  v9 = -[NSString copy](self->_deviceIdentifier, "copy");
  v10 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v9;

  *(_QWORD *)(v4 + 48) = self->_state;
  return (id)v4;
}

- (id)description
{
  return -[DADeviceAppAccessInfo descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  NSString *bundleIdentifier;
  id v6;
  NSString *deviceIdentifier;
  id v8;
  void *v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  DADiscoveryConfiguration *appDiscoveryConfiguration;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  NSString *v18;
  NSString *v19;
  void *v20;
  void *v21;
  DADiscoveryConfiguration *v22;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v4 = 0;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
  {
    v18 = bundleIdentifier;
    CUAppendF();
    v6 = v4;

    v4 = v6;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    v19 = deviceIdentifier;
    CUAppendF();
    v8 = v4;

    v4 = v8;
  }
  DADeviceStateToString(self->_state);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  v10 = v4;

  DADeviceAccessorySetupOptionsToString(self->_accessoryOptions);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  v11 = (__CFString *)v10;

  if (self->_approveTime != 0.0)
  {
    CUPrintDateCF();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v12 = v11;

    v11 = v12;
  }
  appDiscoveryConfiguration = self->_appDiscoveryConfiguration;
  if (appDiscoveryConfiguration)
  {
    v22 = appDiscoveryConfiguration;
    CUAppendF();
    v14 = v11;

    v11 = v14;
  }
  v15 = &stru_24D169BB8;
  if (v11)
    v15 = v11;
  v16 = v15;

  return v16;
}

- (NSString)associationIdentifier
{
  DADeviceAppAccessInfo *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[DADeviceAppAccessInfo appDiscoveryConfiguration](v2, "appDiscoveryConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "associationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSString *)v4;
}

- (DADiscoveryConfiguration)appDiscoveryConfiguration
{
  return self->_appDiscoveryConfiguration;
}

- (void)setAppDiscoveryConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)approveTime
{
  return self->_approveTime;
}

- (void)setApproveTime:(double)a3
{
  self->_approveTime = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (unint64_t)accessoryOptions
{
  return self->_accessoryOptions;
}

- (void)setAccessoryOptions:(unint64_t)a3
{
  self->_accessoryOptions = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appDiscoveryConfiguration, 0);
}

@end
