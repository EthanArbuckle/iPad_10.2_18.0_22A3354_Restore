@implementation MSDKManifestFileItem

- (MSDKManifestFileItem)initWithIdentifier:(id)a3 andDictionary:(id)a4 forComponent:(id)a5
{
  id v9;
  id v10;
  MSDKManifestFileItem *v11;
  MSDKManifestFileItem *v12;
  uint64_t v13;
  NSDictionary *fileAttributes;
  NSDictionary *v15;
  uint64_t v16;
  uint64_t v17;
  NSString *fileType;
  uint64_t v19;
  NSData *fileHash;
  uint64_t v21;
  NSDictionary *fileExtendedAttributes;
  uint64_t v23;
  NSString *symbolicLinkTargetFilePath;
  NSString *bundleFilePath;
  void *v26;
  uint64_t v27;
  NSString *v28;
  MSDKManifestFileItem *v29;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  objc_super v34;

  v9 = a3;
  v10 = a4;
  v34.receiver = self;
  v34.super_class = (Class)MSDKManifestFileItem;
  v11 = -[MSDKManifestItem initWithIdentifier:andDictionary:forComponent:](&v34, sel_initWithIdentifier_andDictionary_forComponent_, v9, v10, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_manifestFilePath, a3);
    objc_msgSend(v10, "objectForKey:ofType:", CFSTR("MSDManifestFileAttributes"), objc_opt_class());
    v13 = objc_claimAutoreleasedReturnValue();
    fileAttributes = v12->_fileAttributes;
    v12->_fileAttributes = (NSDictionary *)v13;

    v15 = v12->_fileAttributes;
    if (v15)
    {
      v16 = *MEMORY[0x24BDD0D30];
      -[NSDictionary objectForKey:ofType:](v15, "objectForKey:ofType:", *MEMORY[0x24BDD0D30], objc_opt_class());
      v17 = objc_claimAutoreleasedReturnValue();
      fileType = v12->_fileType;
      v12->_fileType = (NSString *)v17;

      if (v12->_fileType)
      {
        objc_msgSend(v10, "objectForKey:", CFSTR("MSDManifestFileHash"));
        v19 = objc_claimAutoreleasedReturnValue();
        fileHash = v12->_fileHash;
        v12->_fileHash = (NSData *)v19;

        objc_msgSend(v10, "objectForKey:", CFSTR("MSDManifestFileExtendedAttributes"));
        v21 = objc_claimAutoreleasedReturnValue();
        fileExtendedAttributes = v12->_fileExtendedAttributes;
        v12->_fileExtendedAttributes = (NSDictionary *)v21;

        objc_msgSend(v10, "objectForKey:", CFSTR("MSDManifestSymbolicLinkTargetFile"));
        v23 = objc_claimAutoreleasedReturnValue();
        symbolicLinkTargetFilePath = v12->_symbolicLinkTargetFilePath;
        v12->_symbolicLinkTargetFilePath = (NSString *)v23;

        bundleFilePath = v12->_bundleFilePath;
        v12->_bundleFilePath = 0;

        if (v12->_fileHash)
        {
          -[MSDKManifestFileItem fileHash](v12, "fileHash");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[MSDKCacheManager getBundleFilePathFromHash:](MSDKCacheManager, "getBundleFilePathFromHash:", v26);
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = v12->_bundleFilePath;
          v12->_bundleFilePath = (NSString *)v27;

        }
        goto LABEL_6;
      }
      defaultLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[MSDKManifestFileItem initWithIdentifier:andDictionary:forComponent:].cold.2(v16, (uint64_t)v9, v33);

    }
    else
    {
      defaultLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[MSDKManifestFileItem initWithIdentifier:andDictionary:forComponent:].cold.1((uint64_t)v9, v31, v32);

    }
    v29 = 0;
    goto LABEL_7;
  }
LABEL_6:
  v29 = v12;
LABEL_7:

  return v29;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: Path:%@>"), v5, self->_manifestFilePath);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)fileType
{
  return self->_fileType;
}

- (NSData)fileHash
{
  return self->_fileHash;
}

- (NSDictionary)fileAttributes
{
  return self->_fileAttributes;
}

- (NSDictionary)fileExtendedAttributes
{
  return self->_fileExtendedAttributes;
}

- (NSString)symbolicLinkTargetFilePath
{
  return self->_symbolicLinkTargetFilePath;
}

- (NSString)manifestFilePath
{
  return self->_manifestFilePath;
}

- (NSString)bundleFilePath
{
  return self->_bundleFilePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleFilePath, 0);
  objc_storeStrong((id *)&self->_manifestFilePath, 0);
  objc_storeStrong((id *)&self->_symbolicLinkTargetFilePath, 0);
  objc_storeStrong((id *)&self->_fileExtendedAttributes, 0);
  objc_storeStrong((id *)&self->_fileAttributes, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
}

- (void)initWithIdentifier:(uint64_t)a1 andDictionary:(NSObject *)a2 forComponent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[MSDKManifestFileItem initWithIdentifier:andDictionary:forComponent:]";
  v5 = 2114;
  v6 = CFSTR("MSDManifestFileAttributes");
  v7 = 2114;
  v8 = a1;
  OUTLINED_FUNCTION_4(&dword_213A7E000, a2, a3, "%s: Failed to parse %{public}@ from file item %{public}@", (uint8_t *)&v3);
}

- (void)initWithIdentifier:(uint64_t)a1 andDictionary:(uint64_t)a2 forComponent:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[MSDKManifestFileItem initWithIdentifier:andDictionary:forComponent:]";
  v5 = 2114;
  v6 = a1;
  v7 = 2114;
  v8 = a2;
  OUTLINED_FUNCTION_4(&dword_213A7E000, a3, (uint64_t)a3, "%s: Failed to parse %{public}@ from file item %{public}@", (uint8_t *)&v3);
}

@end
