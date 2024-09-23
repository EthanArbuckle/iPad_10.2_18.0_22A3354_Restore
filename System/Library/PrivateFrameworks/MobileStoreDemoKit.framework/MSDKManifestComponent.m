@implementation MSDKManifestComponent

- (MSDKManifestComponent)initWithIdentifier:(id)a3 componentType:(int64_t)a4 andDictionary:(id)a5
{
  id v9;
  id v10;
  MSDKManifestComponent *v11;
  MSDKManifestComponent *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSArray *v18;
  NSArray *v19;
  void *v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *data;
  uint64_t v26;
  NSString *osVersion;
  uint64_t v28;
  NSString *platformType;
  uint64_t v30;
  NSString *certificate;
  uint64_t v32;
  NSData *signature;
  MSDKManifestComponent *v34;
  NSObject *v36;
  objc_super v37;

  v9 = a3;
  v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)MSDKManifestComponent;
  v11 = -[MSDKManifestComponent init](&v37, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_19;
  -[MSDKManifestComponent setType:](v11, "setType:", a4);
  objc_storeStrong((id *)&v12->_identifier, a3);
  v13 = (void *)objc_opt_new();
  -[MSDKManifestComponent setMutableDependencies:](v12, "setMutableDependencies:", v13);

  objc_msgSend(v10, "objectForKey:ofType:", CFSTR("Manifest"), objc_opt_class());
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v14)
  {
    objc_msgSend(v10, "objectForKey:ofType:", CFSTR("Settings"), objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      defaultLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[MSDKManifestComponent initWithIdentifier:componentType:andDictionary:].cold.6();
      v17 = 0;
      v15 = 0;
      goto LABEL_35;
    }
  }
  objc_msgSend(v15, "objectForKey:ofType:", CFSTR("Info"), objc_opt_class());
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    defaultLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[MSDKManifestComponent initWithIdentifier:componentType:andDictionary:].cold.1();
    v17 = 0;
    goto LABEL_35;
  }
  v17 = (void *)v16;
  if (!-[MSDKManifestComponent isOfType:](v12, "isOfType:", 0)
    && !-[MSDKManifestComponent isOfType:](v12, "isOfType:", 1))
  {
    v22 = -[MSDKManifestComponent isOfType:](v12, "isOfType:", 4);
    if (!v14 && !v22)
    {
      defaultLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[MSDKManifestComponent initWithIdentifier:componentType:andDictionary:].cold.5();
      goto LABEL_35;
    }
    -[MSDKManifestComponent setRawDependencyDict:](v12, "setRawDependencyDict:", 0);
    objc_msgSend(v15, "objectForKey:ofType:", CFSTR("Data"), objc_opt_class());
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      defaultLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[MSDKManifestComponent initWithIdentifier:componentType:andDictionary:].cold.4();
      goto LABEL_35;
    }
    v18 = (NSArray *)v23;
    if (v14)
      -[MSDKManifestComponent _parseFileItems:](v12, "_parseFileItems:", v23);
    else
      -[MSDKManifestComponent _parseDataItem:](v12, "_parseDataItem:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    data = v12->_data;
    v12->_data = (NSArray *)v24;

    if (v24)
      goto LABEL_18;
    goto LABEL_36;
  }
  if (!v14)
  {
    defaultLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[MSDKManifestComponent initWithIdentifier:componentType:andDictionary:].cold.3();
    goto LABEL_35;
  }
  -[MSDKManifestComponent _parseDataItemsForAppComponent:](v12, "_parseDataItemsForAppComponent:", v17);
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v19 = v12->_data;
  v12->_data = v18;

  if (!v18)
  {
LABEL_36:

    v34 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v15, "objectForKey:ofType:", CFSTR("Dependencies"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKManifestComponent setRawDependencyDict:](v12, "setRawDependencyDict:", v20);

  -[MSDKManifestComponent rawDependencyDict](v12, "rawDependencyDict");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    defaultLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[MSDKManifestComponent initWithIdentifier:componentType:andDictionary:].cold.2();
LABEL_35:

    v18 = 0;
    goto LABEL_36;
  }
  v18 = 0;
LABEL_18:
  objc_msgSend(v17, "objectForKey:ofType:", CFSTR("OSVersion"), objc_opt_class());
  v26 = objc_claimAutoreleasedReturnValue();
  osVersion = v12->_osVersion;
  v12->_osVersion = (NSString *)v26;

  objc_msgSend(v17, "objectForKey:ofType:", CFSTR("PlatformType"), objc_opt_class());
  v28 = objc_claimAutoreleasedReturnValue();
  platformType = v12->_platformType;
  v12->_platformType = (NSString *)v28;

  objc_msgSend(v10, "objectForKey:ofType:", CFSTR("Certificate"), objc_opt_class());
  v30 = objc_claimAutoreleasedReturnValue();
  certificate = v12->_certificate;
  v12->_certificate = (NSString *)v30;

  objc_msgSend(v10, "objectForKey:ofType:", CFSTR("Signature"), objc_opt_class());
  v32 = objc_claimAutoreleasedReturnValue();
  signature = v12->_signature;
  v12->_signature = (NSData *)v32;

LABEL_19:
  v34 = v12;
LABEL_20:

  return v34;
}

- (BOOL)isOfType:(int64_t)a3
{
  return a3 == 3
      && (-[MSDKManifestComponent type](self, "type") == 4 || -[MSDKManifestComponent type](self, "type") == 5)
      || -[MSDKManifestComponent type](self, "type") == a3;
}

- (void)addDependency:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MSDKManifestComponent mutableDependencies](self, "mutableDependencies");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)_parseDataItemsForAppComponent:(id)a3
{
  id v4;
  void *v5;
  MSDKManifestInstallableItem *v6;
  void *v7;
  MSDKManifestInstallableItem *v8;
  id v9;
  NSObject *v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = [MSDKManifestInstallableItem alloc];
  -[MSDKManifestComponent identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:](v6, "initWithIdentifier:andDictionary:forComponent:", v7, v4, self);

  if (v8)
  {
    objc_msgSend(v5, "addObject:", v8);
    v9 = v5;
  }
  else
  {
    defaultLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MSDKManifestComponent _parseDataItemsForAppComponent:].cold.1(self);

    v9 = 0;
  }

  return v9;
}

- (id)_parseDataItem:(id)a3
{
  id v4;
  void *v5;
  MSDKManifestDataItem *v6;
  void *v7;
  MSDKManifestDataItem *v8;
  id v9;
  NSObject *v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = [MSDKManifestDataItem alloc];
  -[MSDKManifestComponent identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MSDKManifestDataItem initWithIdentifier:andDictionary:forComponent:](v6, "initWithIdentifier:andDictionary:forComponent:", v7, v4, self);

  if (v8)
  {
    objc_msgSend(v5, "addObject:", v8);
    v9 = v5;
  }
  else
  {
    defaultLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MSDKManifestComponent _parseDataItemsForAppComponent:].cold.1(self);

    v9 = 0;
  }

  return v9;
}

- (id)_parseFileItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  MSDKManifestFileItem *v13;
  MSDKManifestFileItem *v14;
  id v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
      objc_msgSend(v6, "objectForKey:ofType:", v11, objc_opt_class(), (_QWORD)v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        break;
      v13 = -[MSDKManifestFileItem initWithIdentifier:andDictionary:forComponent:]([MSDKManifestFileItem alloc], "initWithIdentifier:andDictionary:forComponent:", v11, v12, self);
      if (!v13)
      {
        defaultLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[MSDKManifestComponent _parseFileItems:].cold.2(v11, self);
LABEL_15:

        v15 = 0;
        goto LABEL_16;
      }
      v14 = v13;
      objc_msgSend(v5, "addObject:", v13);

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    defaultLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MSDKManifestComponent _parseFileItems:].cold.1(self);
    goto LABEL_15;
  }
LABEL_10:

  v15 = v5;
LABEL_16:

  return v15;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSString)certificate
{
  return self->_certificate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)platformType
{
  return self->_platformType;
}

- (NSArray)data
{
  return self->_data;
}

- (NSDictionary)rawDependencyDict
{
  return self->_rawDependencyDict;
}

- (void)setRawDependencyDict:(id)a3
{
  objc_storeStrong((id *)&self->_rawDependencyDict, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSMutableArray)mutableDependencies
{
  return self->_mutableDependencies;
}

- (void)setMutableDependencies:(id)a3
{
  objc_storeStrong((id *)&self->_mutableDependencies, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDependencies, 0);
  objc_storeStrong((id *)&self->_rawDependencyDict, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_platformType, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

- (void)initWithIdentifier:componentType:andDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_213A7E000, v0, v1, "%s: Failed to parse %{public}@ dict for component: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)initWithIdentifier:componentType:andDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_213A7E000, v0, v1, "%s: Failed to parse %{public}@ dict for component: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)initWithIdentifier:componentType:andDictionary:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_213A7E000, v0, v1, "%s: Cannot parse %{public}@ dictionary for component %{public}@ of Apps/SystemApps section", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)initWithIdentifier:componentType:andDictionary:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_213A7E000, v0, v1, "%s: Failed to parse %{public}@ dict for component: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)initWithIdentifier:componentType:andDictionary:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_213A7E000, v0, v1, "%s: Cannot parse %{public}@ dictionary for component %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)initWithIdentifier:componentType:andDictionary:.cold.6()
{
  uint64_t v0;
  __int16 v1;
  os_log_t v2;
  int v3[3];
  uint64_t v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315906;
  OUTLINED_FUNCTION_5();
  v4 = v0;
  v5 = v1;
  v6 = CFSTR("Manifest");
  v7 = v1;
  v8 = CFSTR("Settings");
  _os_log_error_impl(&dword_213A7E000, v2, OS_LOG_TYPE_ERROR, "%s: Component %{public}@ does not have %{public}@ or %{public}@ key", (uint8_t *)v3, 0x2Au);
}

- (void)_parseDataItemsForAppComponent:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1(&dword_213A7E000, v2, v3, "Failed to parse data items for component %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)_parseFileItems:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1(&dword_213A7E000, v2, v3, "Failed to parse data items for component %{public}@ because item dictionary for %{public}@ is in wrong format", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_1();
}

- (void)_parseFileItems:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1(&dword_213A7E000, v2, v3, "Failed to parse item %{public}@ for component %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_1();
}

@end
