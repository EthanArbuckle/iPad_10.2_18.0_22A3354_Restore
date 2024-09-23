@implementation GTDeviceProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)hardwareUUID
{
  int v2;
  void *v3;
  timespec v5;
  uuid_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  memset(v6, 0, sizeof(v6));
  v5.tv_sec = 0;
  v5.tv_nsec = 0;
  v2 = gethostuuid(v6, &v5);
  v3 = 0;
  if (!v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v6);
  return v3;
}

+ (id)uniqueDeviceID
{
  return (id)MGCopyAnswer();
}

- (GTDeviceProperties)initWithXPCObject:(id)a3
{
  id v4;
  GTDeviceProperties *v5;
  void *v6;
  const char *string;
  const char *v8;
  uint64_t v9;
  NSString *OSVersion;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  NSString *BuildVersion;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  NSString *ProductType;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  NSString *HWModelStr;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  NSString *UniqueDeviceID;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  NSString *Reality;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  NSString *CPUArchitecture;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  NSString *DeviceClass;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  NSString *MobileDeviceMinimumVersion;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  NSString *ProductName;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  NSString *ReleaseType;
  objc_super v62;

  v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)GTDeviceProperties;
  v5 = -[GTDeviceProperties init](&v62, sel_init);
  if (v5)
  {
    v5->_LocationID = xpc_dictionary_get_uint64(v4, "LocationID");
    v6 = (void *)MEMORY[0x24BDD17C8];
    string = xpc_dictionary_get_string(v4, "OSVersion");
    if (string)
      v8 = string;
    else
      v8 = "";
    objc_msgSend(v6, "stringWithUTF8String:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    OSVersion = v5->_OSVersion;
    v5->_OSVersion = (NSString *)v9;

    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = xpc_dictionary_get_string(v4, "BuildVersion");
    if (v12)
      v13 = v12;
    else
      v13 = "";
    objc_msgSend(v11, "stringWithUTF8String:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    BuildVersion = v5->_BuildVersion;
    v5->_BuildVersion = (NSString *)v14;

    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = xpc_dictionary_get_string(v4, "ProductType");
    if (v17)
      v18 = v17;
    else
      v18 = "";
    objc_msgSend(v16, "stringWithUTF8String:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    ProductType = v5->_ProductType;
    v5->_ProductType = (NSString *)v19;

    v21 = (void *)MEMORY[0x24BDD17C8];
    v22 = xpc_dictionary_get_string(v4, "HWModel");
    if (v22)
      v23 = v22;
    else
      v23 = "";
    objc_msgSend(v21, "stringWithUTF8String:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    HWModelStr = v5->_HWModelStr;
    v5->_HWModelStr = (NSString *)v24;

    v26 = (void *)MEMORY[0x24BDD17C8];
    v27 = xpc_dictionary_get_string(v4, "UniqueDeviceID");
    if (v27)
      v28 = v27;
    else
      v28 = "";
    objc_msgSend(v26, "stringWithUTF8String:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    UniqueDeviceID = v5->_UniqueDeviceID;
    v5->_UniqueDeviceID = (NSString *)v29;

    v31 = (void *)MEMORY[0x24BDD17C8];
    v32 = xpc_dictionary_get_string(v4, "Reality");
    if (v32)
      v33 = v32;
    else
      v33 = "";
    objc_msgSend(v31, "stringWithUTF8String:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    Reality = v5->_Reality;
    v5->_Reality = (NSString *)v34;

    v5->_RemoteXPCVersionFlags = xpc_dictionary_get_uint64(v4, "RemoteXPCVersionFlags");
    v36 = (void *)MEMORY[0x24BDD17C8];
    v37 = xpc_dictionary_get_string(v4, "CPUArchitecture");
    if (v37)
      v38 = v37;
    else
      v38 = "";
    objc_msgSend(v36, "stringWithUTF8String:", v38);
    v39 = objc_claimAutoreleasedReturnValue();
    CPUArchitecture = v5->_CPUArchitecture;
    v5->_CPUArchitecture = (NSString *)v39;

    v41 = (void *)MEMORY[0x24BDD17C8];
    v42 = xpc_dictionary_get_string(v4, "DeviceClass");
    if (v42)
      v43 = v42;
    else
      v43 = "";
    objc_msgSend(v41, "stringWithUTF8String:", v43);
    v44 = objc_claimAutoreleasedReturnValue();
    DeviceClass = v5->_DeviceClass;
    v5->_DeviceClass = (NSString *)v44;

    v46 = (void *)MEMORY[0x24BDD17C8];
    v47 = xpc_dictionary_get_string(v4, "MobileDeviceMinimumVersion");
    if (v47)
      v48 = v47;
    else
      v48 = "";
    objc_msgSend(v46, "stringWithUTF8String:", v48);
    v49 = objc_claimAutoreleasedReturnValue();
    MobileDeviceMinimumVersion = v5->_MobileDeviceMinimumVersion;
    v5->_MobileDeviceMinimumVersion = (NSString *)v49;

    v51 = (void *)MEMORY[0x24BDD17C8];
    v52 = xpc_dictionary_get_string(v4, "ProductName");
    if (v52)
      v53 = v52;
    else
      v53 = "";
    objc_msgSend(v51, "stringWithUTF8String:", v53);
    v54 = objc_claimAutoreleasedReturnValue();
    ProductName = v5->_ProductName;
    v5->_ProductName = (NSString *)v54;

    v56 = (void *)MEMORY[0x24BDD17C8];
    v57 = xpc_dictionary_get_string(v4, "ReleaseType");
    if (v57)
      v58 = v57;
    else
      v58 = "";
    objc_msgSend(v56, "stringWithUTF8String:", v58);
    v59 = objc_claimAutoreleasedReturnValue();
    ReleaseType = v5->_ReleaseType;
    v5->_ReleaseType = (NSString *)v59;

    v5->_AppleInternal = xpc_dictionary_get_BOOL(v4, "AppleInternal");
    v5->_DeviceSupportsLockdown = xpc_dictionary_get_BOOL(v4, "DeviceSupportsLockdown");
    v5->_EffectiveProductionStatusAp = xpc_dictionary_get_BOOL(v4, "EffectiveProductionStatusAp");
    v5->_IsUIBuild = xpc_dictionary_get_BOOL(v4, "IsUIBuild");
    v5->_OSInstallEnvironment = xpc_dictionary_get_BOOL(v4, "OSInstallEnvironment");
    v5->_StoreDemoMode = xpc_dictionary_get_BOOL(v4, "StoreDemoMode");
  }

  return v5;
}

- (GTDeviceProperties)initWithCoder:(id)a3
{
  id v4;
  GTDeviceProperties *v5;
  uint64_t v6;
  NSString *BuildVersion;
  uint64_t v8;
  NSString *HWModelStr;
  uint64_t v10;
  NSString *OSVersion;
  uint64_t v12;
  NSString *ProductType;
  uint64_t v14;
  NSString *UniqueDeviceID;
  uint64_t v16;
  NSString *Reality;
  uint64_t v18;
  NSString *CPUArchitecture;
  uint64_t v20;
  NSString *DeviceClass;
  uint64_t v22;
  NSString *MobileDeviceMinimumVersion;
  uint64_t v24;
  NSString *ProductName;
  uint64_t v26;
  NSString *ReleaseType;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)GTDeviceProperties;
  v5 = -[GTDeviceProperties init](&v29, sel_init);
  if (v5)
  {
    v5->_LocationID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("LocationID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BuildVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    BuildVersion = v5->_BuildVersion;
    v5->_BuildVersion = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HWModel"));
    v8 = objc_claimAutoreleasedReturnValue();
    HWModelStr = v5->_HWModelStr;
    v5->_HWModelStr = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OSVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    OSVersion = v5->_OSVersion;
    v5->_OSVersion = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductType"));
    v12 = objc_claimAutoreleasedReturnValue();
    ProductType = v5->_ProductType;
    v5->_ProductType = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UniqueDeviceID"));
    v14 = objc_claimAutoreleasedReturnValue();
    UniqueDeviceID = v5->_UniqueDeviceID;
    v5->_UniqueDeviceID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Reality"));
    v16 = objc_claimAutoreleasedReturnValue();
    Reality = v5->_Reality;
    v5->_Reality = (NSString *)v16;

    v5->_RemoteXPCVersionFlags = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("RemoteXPCVersionFlags"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPUArchitecture"));
    v18 = objc_claimAutoreleasedReturnValue();
    CPUArchitecture = v5->_CPUArchitecture;
    v5->_CPUArchitecture = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceClass"));
    v20 = objc_claimAutoreleasedReturnValue();
    DeviceClass = v5->_DeviceClass;
    v5->_DeviceClass = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MobileDeviceMinimumVersion"));
    v22 = objc_claimAutoreleasedReturnValue();
    MobileDeviceMinimumVersion = v5->_MobileDeviceMinimumVersion;
    v5->_MobileDeviceMinimumVersion = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductName"));
    v24 = objc_claimAutoreleasedReturnValue();
    ProductName = v5->_ProductName;
    v5->_ProductName = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReleaseType"));
    v26 = objc_claimAutoreleasedReturnValue();
    ReleaseType = v5->_ReleaseType;
    v5->_ReleaseType = (NSString *)v26;

    v5->_AppleInternal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AppleInternal"));
    v5->_DeviceSupportsLockdown = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DeviceSupportsLockdown"));
    v5->_EffectiveProductionStatusAp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EffectiveProductionStatusAp"));
    v5->_IsUIBuild = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsUIBuild"));
    v5->_OSInstallEnvironment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("OSInstallEnvironment"));
    v5->_StoreDemoMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("StoreDemoMode"));
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), self->_ProductName, self->_UniqueDeviceID);
}

- (id)initForEmbeddedSystem
{
  GTDeviceProperties *v2;
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  int v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  CFArrayRef v10;
  const __CFDictionary *v11;
  GTDeviceProperties *v12;
  objc_super v14;
  size_t size;
  void *values[2];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)GTDeviceProperties;
  v2 = -[GTDeviceProperties init](&v14, sel_init);
  if (v2)
  {
    -[GTDeviceProperties setAppleInternal:](v2, "setAppleInternal:", os_variant_has_internal_content());
    v3 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
    if (v3)
    {
      v4 = v3;
      -[GTDeviceProperties setOsVersion:](v2, "setOsVersion:", CFDictionaryGetValue(v3, (const void *)*MEMORY[0x24BDBD200]));
      -[GTDeviceProperties setBuildVersion:](v2, "setBuildVersion:", CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BDBD1F0]));
      -[GTDeviceProperties setProductName:](v2, "setProductName:", CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BDBD1F8]));
      -[GTDeviceProperties setReleaseType:](v2, "setReleaseType:", CFDictionaryGetValue(v4, CFSTR("ReleaseType")));
      CFRelease(v4);
    }
    *__error() = 0;
    size = 128;
    v5 = sysctlbyname("kern.osversion", values, &size, 0, 0);
    if (!v5 || *__error() == 12)
    {
      if (size != 128 || *__error() != 12)
      {
        v7 = 0;
        v6 = values;
        if (v5)
          goto LABEL_13;
        goto LABEL_15;
      }
      if (!sysctlbyname("kern.osversion", 0, &size, 0, 0))
      {
        if (size >= 0x81)
        {
          v6 = malloc_type_malloc(size, 0x9ADD76BCuLL);
          v7 = v6;
          if (!sysctlbyname("kern.osversion", v6, &size, 0, 0))
            goto LABEL_15;
LABEL_13:
          v8 = 0;
          size = 0;
          goto LABEL_16;
        }
        v7 = 0;
        v6 = values;
LABEL_15:
        v8 = strdup((const char *)v6);
LABEL_16:
        free(v7);
        if (size)
        {
          if (!v8)
          {
LABEL_19:
            v18 = xmmword_24F828190;
            v19 = *(_OWORD *)&off_24F8281A0;
            v20 = xmmword_24F8281B0;
            v21 = CFSTR("re6Zb+zwFKJNlkQTUeT+/w");
            *(_OWORD *)values = xmmword_24F828170;
            v17 = *(_OWORD *)&off_24F828180;
            v10 = CFArrayCreate(0, (const void **)values, 11, MEMORY[0x24BDBD690]);
            v11 = (const __CFDictionary *)MGCopyMultipleAnswers();
            CFRelease(v10);
            -[GTDeviceProperties setCpuArchitecture:](v2, "setCpuArchitecture:", CFDictionaryGetValue(v11, CFSTR("k7QIBwZJJOVw+Sej/8h8VA")));
            -[GTDeviceProperties setCpuArchitecture:](v2, "setCpuArchitecture:", CFDictionaryGetValue(v11, CFSTR("k7QIBwZJJOVw+Sej/8h8VA")));
            -[GTDeviceProperties setDeviceClass:](v2, "setDeviceClass:", CFDictionaryGetValue(v11, CFSTR("+3Uf0Pm5F8Xy7Onyvko0vA")));
            -[GTDeviceProperties setDeviceSupportsLockdown:](v2, "setDeviceSupportsLockdown:", MGGetBoolAnswer());
            -[GTDeviceProperties setEffectiveProductionStatusAp:](v2, "setEffectiveProductionStatusAp:", MGGetBoolAnswer());
            -[GTDeviceProperties setHardwareModel:](v2, "setHardwareModel:", CFDictionaryGetValue(v11, CFSTR("/YYygAofPDbhrwToVsXdeA")));
            -[GTDeviceProperties setIsUIBuild:](v2, "setIsUIBuild:", MGGetBoolAnswer());
            -[GTDeviceProperties setMobileDeviceMinimumVersion:](v2, "setMobileDeviceMinimumVersion:", CFDictionaryGetValue(v11, CFSTR("k+KTni1jrwErpcDMEnn3aw")));
            -[GTDeviceProperties setProductName:](v2, "setProductName:", CFDictionaryGetValue(v11, CFSTR("ivIu8YTDnBSrYv/SN4G8Ag")));
            -[GTDeviceProperties setProductType:](v2, "setProductType:", CFDictionaryGetValue(v11, CFSTR("h9jDsbgj7xIVeIQ8S3/X3Q")));
            -[GTDeviceProperties setReleaseType:](v2, "setReleaseType:", CFDictionaryGetValue(v11, CFSTR("9UCjT7Qfi4xLVvPAKIzTCQ")));
            -[GTDeviceProperties setUniqueDeviceID:](v2, "setUniqueDeviceID:", CFDictionaryGetValue(v11, CFSTR("re6Zb+zwFKJNlkQTUeT+/w")));
            CFRelease(v11);
            -[GTDeviceProperties setOsInstallEnvironment:](v2, "setOsInstallEnvironment:", getenv("__OSINSTALL_ENVIRONMENT") != 0);
            v12 = v2;
            goto LABEL_20;
          }
LABEL_18:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[GTDeviceProperties setBuildVersion:](v2, "setBuildVersion:", v9);

          free(v8);
          goto LABEL_19;
        }
LABEL_22:
        _os_assumes_log();
        if (!v8)
          goto LABEL_19;
        goto LABEL_18;
      }
    }
    v8 = 0;
    goto LABEL_22;
  }
LABEL_20:

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t LocationID;
  id v5;

  LocationID = self->_LocationID;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", LocationID, CFSTR("LocationID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_BuildVersion, CFSTR("BuildVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_HWModelStr, CFSTR("HWModel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_OSVersion, CFSTR("OSVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ProductType, CFSTR("ProductType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_UniqueDeviceID, CFSTR("UniqueDeviceID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_Reality, CFSTR("Reality"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_RemoteXPCVersionFlags, CFSTR("RemoteXPCVersionFlags"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_CPUArchitecture, CFSTR("CPUArchitecture"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_DeviceClass, CFSTR("DeviceClass"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_MobileDeviceMinimumVersion, CFSTR("MobileDeviceMinimumVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ProductName, CFSTR("ProductName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ReleaseType, CFSTR("ReleaseType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_AppleInternal, CFSTR("AppleInternal"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_DeviceSupportsLockdown, CFSTR("DeviceSupportsLockdown"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_EffectiveProductionStatusAp, CFSTR("EffectiveProductionStatusAp"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_IsUIBuild, CFSTR("IsUIBuild"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_OSInstallEnvironment, CFSTR("OSInstallEnvironment"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_StoreDemoMode, CFSTR("StoreDemoMode"));

}

- (unint64_t)locationID
{
  return self->_LocationID;
}

- (void)setLocationID:(unint64_t)a3
{
  self->_LocationID = a3;
}

- (NSString)buildVersion
{
  return self->_BuildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)hardwareModel
{
  return self->_HWModelStr;
}

- (void)setHardwareModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)osVersion
{
  return self->_OSVersion;
}

- (void)setOsVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)productType
{
  return self->_ProductType;
}

- (void)setProductType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)uniqueDeviceID
{
  return self->_UniqueDeviceID;
}

- (void)setUniqueDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)reality
{
  return self->_Reality;
}

- (void)setReality:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)remoteXPCVersionFlags
{
  return self->_RemoteXPCVersionFlags;
}

- (void)setRemoteXPCVersionFlags:(unint64_t)a3
{
  self->_RemoteXPCVersionFlags = a3;
}

- (NSString)cpuArchitecture
{
  return self->_CPUArchitecture;
}

- (void)setCpuArchitecture:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)deviceClass
{
  return self->_DeviceClass;
}

- (void)setDeviceClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)mobileDeviceMinimumVersion
{
  return self->_MobileDeviceMinimumVersion;
}

- (void)setMobileDeviceMinimumVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)productName
{
  return self->_ProductName;
}

- (void)setProductName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)releaseType
{
  return self->_ReleaseType;
}

- (void)setReleaseType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)appleInternal
{
  return self->_AppleInternal;
}

- (void)setAppleInternal:(BOOL)a3
{
  self->_AppleInternal = a3;
}

- (BOOL)deviceSupportsLockdown
{
  return self->_DeviceSupportsLockdown;
}

- (void)setDeviceSupportsLockdown:(BOOL)a3
{
  self->_DeviceSupportsLockdown = a3;
}

- (BOOL)effectiveProductionStatusAp
{
  return self->_EffectiveProductionStatusAp;
}

- (void)setEffectiveProductionStatusAp:(BOOL)a3
{
  self->_EffectiveProductionStatusAp = a3;
}

- (BOOL)isUIBuild
{
  return self->_IsUIBuild;
}

- (void)setIsUIBuild:(BOOL)a3
{
  self->_IsUIBuild = a3;
}

- (BOOL)osInstallEnvironment
{
  return self->_OSInstallEnvironment;
}

- (void)setOsInstallEnvironment:(BOOL)a3
{
  self->_OSInstallEnvironment = a3;
}

- (BOOL)storeDemoMode
{
  return self->_StoreDemoMode;
}

- (void)setStoreDemoMode:(BOOL)a3
{
  self->_StoreDemoMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ReleaseType, 0);
  objc_storeStrong((id *)&self->_ProductName, 0);
  objc_storeStrong((id *)&self->_MobileDeviceMinimumVersion, 0);
  objc_storeStrong((id *)&self->_DeviceClass, 0);
  objc_storeStrong((id *)&self->_CPUArchitecture, 0);
  objc_storeStrong((id *)&self->_Reality, 0);
  objc_storeStrong((id *)&self->_UniqueDeviceID, 0);
  objc_storeStrong((id *)&self->_ProductType, 0);
  objc_storeStrong((id *)&self->_OSVersion, 0);
  objc_storeStrong((id *)&self->_HWModelStr, 0);
  objc_storeStrong((id *)&self->_BuildVersion, 0);
}

@end
