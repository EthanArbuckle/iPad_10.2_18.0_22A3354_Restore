@implementation MSDKManifestInstallableItem

- (MSDKManifestInstallableItem)initWithIdentifier:(id)a3 andDictionary:(id)a4 forComponent:(id)a5
{
  id v9;
  id v10;
  MSDKManifestInstallableItem *v11;
  MSDKManifestInstallableItem *v12;
  uint64_t v13;
  NSNumber *appType;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  NSString *osVersion;
  uint64_t v19;
  NSString *platformType;
  NSString *v21;
  NSString *v22;
  NSNumber *v23;
  NSNumber *v24;
  NSDictionary *v25;
  NSString *bundleFilePath;
  uint64_t v27;
  NSString *uniqueID;
  uint64_t v29;
  NSString *bundleShortVersionString;
  uint64_t v31;
  NSNumber *realSize;
  uint64_t v33;
  NSNumber *size;
  uint64_t v35;
  NSDictionary *privacyPermissions;
  uint64_t v37;
  NSData *fileHash;
  uint64_t v39;
  MSDKManifestInstallableItem *v40;
  NSObject *v42;
  objc_super v43;

  v9 = a3;
  v10 = a4;
  v43.receiver = self;
  v43.super_class = (Class)MSDKManifestInstallableItem;
  v11 = -[MSDKManifestItem initWithIdentifier:andDictionary:forComponent:](&v43, sel_initWithIdentifier_andDictionary_forComponent_, v9, v10, a5);
  v12 = v11;
  if (!v11)
    goto LABEL_16;
  objc_storeStrong((id *)&v11->_identifier, a3);
  objc_msgSend(v10, "objectForKey:ofType:", CFSTR("AppType"), objc_opt_class());
  v13 = objc_claimAutoreleasedReturnValue();
  appType = v12->_appType;
  v12->_appType = (NSNumber *)v13;

  if (!v12->_appType)
  {
    defaultLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:].cold.1();
    goto LABEL_39;
  }
  objc_msgSend(v10, "objectForKey:ofType:", CFSTR("IsContainerized"), objc_opt_class());
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    defaultLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:].cold.2();
    goto LABEL_39;
  }
  v16 = v15;
  v12->_isContainerized = -[NSObject BOOLValue](v15, "BOOLValue");
  objc_msgSend(v10, "objectForKey:ofType:", CFSTR("OSVersion"), objc_opt_class());
  v17 = objc_claimAutoreleasedReturnValue();
  osVersion = v12->_osVersion;
  v12->_osVersion = (NSString *)v17;

  if (!v12->_osVersion)
  {
    defaultLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:].cold.3();
    goto LABEL_38;
  }
  objc_msgSend(v10, "objectForKey:ofType:", CFSTR("PlatformType"), objc_opt_class());
  v19 = objc_claimAutoreleasedReturnValue();
  platformType = v12->_platformType;
  v12->_platformType = (NSString *)v19;

  if (!v12->_platformType)
  {
    defaultLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:].cold.4();
LABEL_38:

LABEL_39:
    v40 = 0;
    goto LABEL_17;
  }
  if (!-[MSDKManifestInstallableItem isSystemApp](v12, "isSystemApp"))
  {
    objc_msgSend(v10, "objectForKey:ofType:", CFSTR("Identifier"), objc_opt_class());
    v27 = objc_claimAutoreleasedReturnValue();
    uniqueID = v12->_uniqueID;
    v12->_uniqueID = (NSString *)v27;

    if (v12->_uniqueID)
    {
      objc_msgSend(v10, "objectForKey:ofType:", CFSTR("CFBundleShortVersionString"), objc_opt_class());
      v29 = objc_claimAutoreleasedReturnValue();
      bundleShortVersionString = v12->_bundleShortVersionString;
      v12->_bundleShortVersionString = (NSString *)v29;

      if (v12->_bundleShortVersionString)
      {
        objc_msgSend(v10, "objectForKey:ofType:", CFSTR("RealSize"), objc_opt_class());
        v31 = objc_claimAutoreleasedReturnValue();
        realSize = v12->_realSize;
        v12->_realSize = (NSNumber *)v31;

        if (v12->_realSize)
        {
          objc_msgSend(v10, "objectForKey:ofType:", CFSTR("Size"), objc_opt_class());
          v33 = objc_claimAutoreleasedReturnValue();
          size = v12->_size;
          v12->_size = (NSNumber *)v33;

          if (v12->_size)
          {
            objc_msgSend(v10, "objectForKey:ofType:", CFSTR("AppPrivacyPermissions"), objc_opt_class());
            v35 = objc_claimAutoreleasedReturnValue();
            privacyPermissions = v12->_privacyPermissions;
            v12->_privacyPermissions = (NSDictionary *)v35;

            if (v12->_privacyPermissions)
            {
              objc_msgSend(v10, "objectForKey:ofType:", CFSTR("Hash"), objc_opt_class());
              v37 = objc_claimAutoreleasedReturnValue();
              fileHash = v12->_fileHash;
              v12->_fileHash = (NSData *)v37;

              if (v12->_fileHash)
              {
                +[MSDKCacheManager getBundleFilePathFromHash:](MSDKCacheManager, "getBundleFilePathFromHash:");
                v39 = objc_claimAutoreleasedReturnValue();
                bundleFilePath = v12->_bundleFilePath;
                v12->_bundleFilePath = (NSString *)v39;
                goto LABEL_15;
              }
              defaultLogHandle();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:].cold.10();
            }
            else
            {
              defaultLogHandle();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:].cold.9();
            }
          }
          else
          {
            defaultLogHandle();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:].cold.8();
          }
        }
        else
        {
          defaultLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:].cold.7();
        }
      }
      else
      {
        defaultLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:].cold.6();
      }
    }
    else
    {
      defaultLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:].cold.5();
    }
    goto LABEL_38;
  }
  v21 = v12->_uniqueID;
  v12->_uniqueID = 0;

  v22 = v12->_bundleShortVersionString;
  v12->_bundleShortVersionString = 0;

  v23 = v12->_realSize;
  v12->_realSize = 0;

  v24 = v12->_size;
  v12->_size = 0;

  v25 = v12->_privacyPermissions;
  v12->_privacyPermissions = 0;

  bundleFilePath = v12->_bundleFilePath;
  v12->_bundleFilePath = 0;
LABEL_15:

LABEL_16:
  v40 = v12;
LABEL_17:

  return v40;
}

- (BOOL)isSystemApp
{
  void *v2;
  char v3;

  -[MSDKManifestItem component](self, "component");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOfType:", 0);

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: ID:%@>"), v5, self->_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSNumber)appType
{
  return self->_appType;
}

- (BOOL)isContainerized
{
  return self->_isContainerized;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)platformType
{
  return self->_platformType;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)bundleShortVersionString
{
  return self->_bundleShortVersionString;
}

- (NSNumber)realSize
{
  return self->_realSize;
}

- (NSNumber)size
{
  return self->_size;
}

- (NSDictionary)privacyPermissions
{
  return self->_privacyPermissions;
}

- (NSString)bundleFilePath
{
  return self->_bundleFilePath;
}

- (NSData)fileHash
{
  return self->_fileHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHash, 0);
  objc_storeStrong((id *)&self->_bundleFilePath, 0);
  objc_storeStrong((id *)&self->_privacyPermissions, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_realSize, 0);
  objc_storeStrong((id *)&self->_bundleShortVersionString, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_platformType, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_appType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_213A7E000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_213A7E000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_213A7E000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_213A7E000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_213A7E000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_213A7E000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_213A7E000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_213A7E000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_213A7E000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_213A7E000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

@end
