@implementation CCSModuleMetadata

- (NSString)associatedBundleIdentifier
{
  return self->_associatedBundleIdentifier;
}

- (NSString)associatedBundleMinimumVersion
{
  return self->_associatedBundleMinimumVersion;
}

- (unint64_t)visibilityPreference
{
  return self->_visibilityPreference;
}

- (NSString)moduleIdentifier
{
  return self->_moduleIdentifier;
}

- (NSSet)requiredDeviceCapabilities
{
  return self->_requiredDeviceCapabilities;
}

- (NSSet)requiredDeviceIncapabilities
{
  return self->_requiredDeviceIncapabilities;
}

- (NSURL)moduleBundleURL
{
  return self->_moduleBundleURL;
}

+ (id)metadataForBundleAtURL:(id)a3
{
  const __CFURL *v4;
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (const __CFURL *)a3;
  v5 = CFBundleCopyInfoDictionaryInDirectory(v4);
  -[__CFDictionary bs_safeObjectForKey:ofType:](v5, "bs_safeObjectForKey:ofType:", *MEMORY[0x24BDBD288], objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "_supportedDeviceFamiliesForBundleInfoDictionary:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_requiredCapabilitiesForInfoDictionary:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_requiredIncapabilitiesForInfoDictionary:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary bs_safeObjectForKey:ofType:](v5, "bs_safeObjectForKey:ofType:", CFSTR("CCAssociatedBundleIdentifier"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary bs_safeObjectForKey:ofType:](v5, "bs_safeObjectForKey:ofType:", CFSTR("CCAssociatedBundleMinimumVersion"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithModuleIdentifier:supportedDeviceFamilies:requiredDeviceCapabilities:requiredDeviceIncapabilities:associatedBundleIdentifier:associatedBundleMinimumVersion:visibilityPreference:moduleBundleURL:", v6, v7, v8, v9, v10, v11, CCSVisibilityPreferenceForBundleInfoDictionary(v5), v4);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_supportedDeviceFamiliesForBundleInfoDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UIDeviceFamily"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDBD1A8];
  if (v4)
    v5 = v4;
  v6 = v5;

  objc_msgSend(v6, "bs_filter:", &__block_literal_global_1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __69__CCSModuleMetadata__supportedDeviceFamiliesForBundleInfoDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6 == v4;
}

+ (id)_requiredCapabilitiesForInfoDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UIRequiredDeviceCapabilities"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDBD1A8];
  if (v4)
    v5 = v4;
  v6 = v5;

  objc_msgSend(v6, "bs_filter:", &__block_literal_global_13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __60__CCSModuleMetadata__requiredCapabilitiesForInfoDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
    v7 = MGIsQuestionValid();
  else
    v7 = 0;

  return v7;
}

+ (id)_requiredIncapabilitiesForInfoDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("CCRequiredDeviceIncapabilities"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDBD1A8];
  if (v4)
    v5 = v4;
  v6 = v5;

  objc_msgSend(v6, "bs_filter:", &__block_literal_global_14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __62__CCSModuleMetadata__requiredIncapabilitiesForInfoDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
    v7 = MGIsQuestionValid();
  else
    v7 = 0;

  return v7;
}

- (id)_initWithModuleIdentifier:(id)a3 supportedDeviceFamilies:(id)a4 requiredDeviceCapabilities:(id)a5 requiredDeviceIncapabilities:(id)a6 associatedBundleIdentifier:(id)a7 associatedBundleMinimumVersion:(id)a8 visibilityPreference:(unint64_t)a9 moduleBundleURL:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CCSModuleMetadata *v23;
  uint64_t v24;
  NSString *moduleIdentifier;
  uint64_t v26;
  NSSet *supportedDeviceFamilies;
  uint64_t v28;
  NSSet *requiredDeviceCapabilities;
  uint64_t v30;
  NSSet *requiredDeviceIncapabilities;
  uint64_t v32;
  NSString *associatedBundleIdentifier;
  uint64_t v34;
  NSString *associatedBundleMinimumVersion;
  uint64_t v36;
  NSURL *moduleBundleURL;
  objc_super v39;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a10;
  v39.receiver = self;
  v39.super_class = (Class)CCSModuleMetadata;
  v23 = -[CCSModuleMetadata init](&v39, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    moduleIdentifier = v23->_moduleIdentifier;
    v23->_moduleIdentifier = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    supportedDeviceFamilies = v23->_supportedDeviceFamilies;
    v23->_supportedDeviceFamilies = (NSSet *)v26;

    v28 = objc_msgSend(v18, "copy");
    requiredDeviceCapabilities = v23->_requiredDeviceCapabilities;
    v23->_requiredDeviceCapabilities = (NSSet *)v28;

    v30 = objc_msgSend(v19, "copy");
    requiredDeviceIncapabilities = v23->_requiredDeviceIncapabilities;
    v23->_requiredDeviceIncapabilities = (NSSet *)v30;

    v32 = objc_msgSend(v20, "copy");
    associatedBundleIdentifier = v23->_associatedBundleIdentifier;
    v23->_associatedBundleIdentifier = (NSString *)v32;

    v34 = objc_msgSend(v21, "copy");
    associatedBundleMinimumVersion = v23->_associatedBundleMinimumVersion;
    v23->_associatedBundleMinimumVersion = (NSString *)v34;

    v23->_visibilityPreference = a9;
    v36 = objc_msgSend(v22, "copy");
    moduleBundleURL = v23->_moduleBundleURL;
    v23->_moduleBundleURL = (NSURL *)v36;

  }
  return v23;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCSModuleMetadata moduleIdentifier](self, "moduleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("Module Identifier"));

  -[CCSModuleMetadata supportedDeviceFamilies](self, "supportedDeviceFamilies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("Supported Device Families"));

  -[CCSModuleMetadata requiredDeviceCapabilities](self, "requiredDeviceCapabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("Required Device Capabilities"));

  -[CCSModuleMetadata requiredDeviceIncapabilities](self, "requiredDeviceIncapabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
    v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("Required Device Incapabilities"));
  -[CCSModuleMetadata associatedBundleIdentifier](self, "associatedBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", v12, CFSTR("Associated Bundle Identifier"));

  -[CCSModuleMetadata associatedBundleMinimumVersion](self, "associatedBundleMinimumVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", v14, CFSTR("Associated Bundle Minimum Version"));

  CCSModuleVisibilityPreferenceDescription(self->_visibilityPreference);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v16, CFSTR("Visibility Preference"));

  -[CCSModuleMetadata moduleBundleURL](self, "moduleBundleURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v3, "appendObject:withName:", v17, CFSTR("Module Bundle URL"));

  objc_msgSend(v3, "build");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  unint64_t v19;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCSModuleMetadata moduleIdentifier](self, "moduleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[CCSModuleMetadata supportedDeviceFamilies](self, "supportedDeviceFamilies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[CCSModuleMetadata requiredDeviceCapabilities](self, "requiredDeviceCapabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  -[CCSModuleMetadata requiredDeviceIncapabilities](self, "requiredDeviceIncapabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:", v10);

  -[CCSModuleMetadata associatedBundleIdentifier](self, "associatedBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:", v12);

  -[CCSModuleMetadata associatedBundleMinimumVersion](self, "associatedBundleMinimumVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:", v14);

  v16 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[CCSModuleMetadata visibilityPreference](self, "visibilityPreference"));
  -[CCSModuleMetadata moduleBundleURL](self, "moduleBundleURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v3, "appendObject:", v17);

  v19 = objc_msgSend(v3, "hash");
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  CCSModuleMetadata *v4;
  CCSModuleMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = (CCSModuleMetadata *)a3;
  if (v4 == self)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[CCSModuleMetadata moduleIdentifier](self, "moduleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCSModuleMetadata moduleIdentifier](v5, "moduleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        -[CCSModuleMetadata supportedDeviceFamilies](self, "supportedDeviceFamilies");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CCSModuleMetadata supportedDeviceFamilies](v5, "supportedDeviceFamilies");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects())
        {
          -[CCSModuleMetadata requiredDeviceCapabilities](self, "requiredDeviceCapabilities");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[CCSModuleMetadata requiredDeviceCapabilities](v5, "requiredDeviceCapabilities");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (BSEqualObjects())
          {
            -[CCSModuleMetadata requiredDeviceIncapabilities](self, "requiredDeviceIncapabilities");
            v12 = objc_claimAutoreleasedReturnValue();
            -[CCSModuleMetadata requiredDeviceIncapabilities](v5, "requiredDeviceIncapabilities");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)v12;
            if (BSEqualObjects())
            {
              -[CCSModuleMetadata associatedBundleIdentifier](self, "associatedBundleIdentifier");
              v13 = objc_claimAutoreleasedReturnValue();
              -[CCSModuleMetadata associatedBundleIdentifier](v5, "associatedBundleIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (void *)v13;
              if (BSEqualObjects())
              {
                -[CCSModuleMetadata associatedBundleMinimumVersion](self, "associatedBundleMinimumVersion");
                v14 = objc_claimAutoreleasedReturnValue();
                -[CCSModuleMetadata associatedBundleMinimumVersion](v5, "associatedBundleMinimumVersion");
                v21 = (void *)v14;
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (BSEqualObjects()
                  && (v19 = -[CCSModuleMetadata visibilityPreference](self, "visibilityPreference"),
                      v19 == -[CCSModuleMetadata visibilityPreference](v5, "visibilityPreference")))
                {
                  -[CCSModuleMetadata moduleBundleURL](self, "moduleBundleURL");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  -[CCSModuleMetadata moduleBundleURL](v5, "moduleBundleURL");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = BSEqualObjects();

                }
                else
                {
                  v16 = 0;
                }

              }
              else
              {
                v16 = 0;
              }

            }
            else
            {
              v16 = 0;
            }

          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (NSSet)supportedDeviceFamilies
{
  return self->_supportedDeviceFamilies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleBundleURL, 0);
  objc_storeStrong((id *)&self->_associatedBundleMinimumVersion, 0);
  objc_storeStrong((id *)&self->_associatedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_requiredDeviceIncapabilities, 0);
  objc_storeStrong((id *)&self->_requiredDeviceCapabilities, 0);
  objc_storeStrong((id *)&self->_supportedDeviceFamilies, 0);
  objc_storeStrong((id *)&self->_moduleIdentifier, 0);
}

@end
