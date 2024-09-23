@implementation EKAttachment

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_12 != -1)
    dispatch_once(&knownIdentityKeysForComparison_onceToken_12, &__block_literal_global_73);
  return (id)knownIdentityKeysForComparison_keys_12;
}

void __46__EKAttachment_knownIdentityKeysForComparison__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B820];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownIdentityKeysForComparison_keys_12;
  knownIdentityKeysForComparison_keys_12 = v0;

}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_11 != -1)
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_11, &__block_literal_global_3_2);
  return (id)knownSingleValueKeysForComparison_keys_11;
}

void __49__EKAttachment_knownSingleValueKeysForComparison__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B208];
  v5[0] = *MEMORY[0x1E0D0B1B8];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0D0B1D0];
  v5[2] = *MEMORY[0x1E0D0B1C0];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0D0B1E8];
  v5[4] = *MEMORY[0x1E0D0B1D8];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)knownSingleValueKeysForComparison_keys_11;
  knownSingleValueKeysForComparison_keys_11 = v3;

}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_7 != -1)
    dispatch_once(&knownRelationshipWeakKeys_onceToken_7, &__block_literal_global_4_1);
  return (id)knownRelationshipWeakKeys_keys_7;
}

void __41__EKAttachment_knownRelationshipWeakKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B830];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownRelationshipWeakKeys_keys_7;
  knownRelationshipWeakKeys_keys_7 = v0;

}

- (EKAttachment)init
{
  void *v3;
  EKAttachment *v4;

  EKUUIDString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[EKAttachment initWithUUID:](self, "initWithUUID:", v3);

  return v4;
}

- (EKAttachment)initWithUUID:(id)a3
{
  id v4;
  EKAttachment *v5;
  EKAttachment *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKAttachment;
  v5 = -[EKObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[EKAttachment setUUID:](v5, "setUUID:", v4);
    -[EKObject updatePersistentValueForKeyIfNeeded:](v6, "updatePersistentValueForKeyIfNeeded:", *MEMORY[0x1E0D0B820]);
  }

  return v6;
}

- (EKAttachment)initWithFilepath:(id)a3
{
  id v4;
  EKAttachment *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v11;

  v4 = a3;
  v5 = -[EKAttachment init](self, "init");
  if (v5)
  {
    v11 = 0;
    objc_msgSend(v4, "getResourceValue:forKey:error:", &v11, *MEMORY[0x1E0C999D0], 0);
    v6 = v11;
    objc_msgSend(v4, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAttachment setFileNameRaw:](v5, "setFileNameRaw:", v7);
    v8 = objc_msgSend(v6, "BOOLValue");

    -[EKAttachment setAutoArchived:](v5, "setAutoArchived:", v8);
    v9 = (void *)objc_msgSend((id)objc_opt_class(), "_copyFileAtURLToTemporaryDirectory:", v4);
    -[EKAttachment setURLForPendingFileCopy:](v5, "setURLForPendingFileCopy:", v9);

  }
  return v5;
}

- (id)duplicateWithNewIdentity
{
  void *v3;

  -[EKObject duplicate](self, "duplicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAttachment assignNewIdentity](self, "assignNewIdentity");
  return v3;
}

- (void)assignNewIdentity
{
  id v3;

  EKUUIDString();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[EKAttachment assignIdentity:](self, "assignIdentity:", v3);

}

- (void)assignIdentity:(id)a3
{
  -[EKAttachment setUUID:](self, "setUUID:", a3);
  -[EKObject updatePersistentValueForKeyIfNeeded:](self, "updatePersistentValueForKeyIfNeeded:", *MEMORY[0x1E0D0B820]);
}

- (BOOL)copyLocalFileToNewSource
{
  void *v3;
  void *v4;
  id v5;
  BOOL v6;

  -[EKAttachment localURL](self, "localURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "startAccessingSecurityScopedResource");
    v5 = +[EKAttachment _copyFileAtURLToTemporaryDirectory:](EKAttachment, "_copyFileAtURLToTemporaryDirectory:", v4);
    objc_msgSend(v4, "stopAccessingSecurityScopedResource");
    v6 = v5 != 0;
    if (v5)
    {
      -[EKAttachment invalidateLocalFilePropertiesForNewCopiedFile](self, "invalidateLocalFilePropertiesForNewCopiedFile");
      -[EKAttachment setURLForPendingFileCopy:](self, "setURLForPendingFileCopy:", v5);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)invalidateLocalFilePropertiesForNewCopiedFile
{
  id v3;

  -[EKAttachment setLocalRelativePath:](self, "setLocalRelativePath:", 0);
  -[EKObject persistentObject](self, "persistentObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unloadPropertyForKey:", *MEMORY[0x1E0D0B200]);
  objc_msgSend(v3, "unloadPropertyForKey:", *MEMORY[0x1E0D0B1F8]);
  objc_msgSend(v3, "unloadPropertyForKey:", *MEMORY[0x1E0D0B208]);

}

+ (id)createTempDestinationURLWithExtension:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  CalTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v5, "setPath:", v4);
  objc_msgSend(v5, "setScheme:", CFSTR("file"));
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  EKUUIDString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathExtension:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_copyFileAtURLToTemporaryDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v3, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v7;
  }
  objc_msgSend(v3, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKAttachment createTempDestinationURLWithExtension:](EKAttachment, "createTempDestinationURLWithExtension:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v11 = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v3, v9, &v31);
    v12 = v31;
    if ((v11 & 1) != 0)
    {
      v13 = v9;
    }
    else
    {
      v22 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        +[EKAttachment _copyFileAtURLToTemporaryDirectory:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
      v13 = 0;
    }

  }
  else
  {
    v14 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      +[EKAttachment _copyFileAtURLToTemporaryDirectory:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    v13 = 0;
  }

  return v13;
}

- (id)URLString
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B1B8]);
}

- (void)setURLString:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B1B8]);
}

- (NSURL)URL
{
  void *v2;
  void *v3;

  -[EKAttachment URLString](self, "URLString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (void)setURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKAttachment setURLString:](self, "setURLString:", v4);

}

- (NSString)externalModificationTag
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B1C8]);
}

- (void)setExternalModificationTag:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B1C8]);
}

- (NSString)fileNameRaw
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B1D8]);
}

- (NSString)fileName
{
  void *v3;
  void *v4;
  void *v5;

  -[EKAttachment fileNameRaw](self, "fileNameRaw");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EKAttachment URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "lastPathComponent");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return (NSString *)v3;
}

- (void)setFileNameRaw:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B1D8]);
}

- (NSString)fileFormat
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B1D0]);
}

- (void)setFileFormat:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B1D0]);
}

- (NSString)contentType
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  -[EKAttachment localURL](self, "localURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

LABEL_5:
    -[EKAttachment URL](self, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathExtension");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      -[EKAttachment URL](self, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pathExtension");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", &stru_1E4789A58);

      if ((v15 & 1) == 0)
      {
        -[EKAttachment URL](self, "URL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    else
    {

    }
    -[EKAttachment fileFormat](self, "fileFormat");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "componentsSeparatedByString:", CFSTR(";"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("/"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  v5 = (void *)v4;
  -[EKAttachment localURL](self, "localURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", &stru_1E4789A58);

  if ((v8 & 1) != 0)
    goto LABEL_5;
  -[EKAttachment localURL](self, "localURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v16 = v9;
  objc_msgSend(v9, "pathExtension");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return (NSString *)v17;
}

- (unsigned)flags
{
  void *v2;
  unsigned int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B468]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (void)setFlags:(unsigned int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B468]);

}

- (BOOL)_flagValueWithMask:(unsigned int)a3
{
  return (-[EKAttachment flags](self, "flags") & a3) != 0;
}

- (void)_setFlagValue:(BOOL)a3 withMask:(unsigned int)a4
{
  _BOOL4 v5;
  unsigned int v7;
  uint64_t v8;

  v5 = a3;
  v7 = -[EKAttachment flags](self, "flags");
  if (v5)
    v8 = v7 | a4;
  else
    v8 = v7 & ~a4;
  -[EKAttachment setFlags:](self, "setFlags:", v8);
}

- (BOOL)isBinary
{
  return -[EKAttachment _flagValueWithMask:](self, "_flagValueWithMask:", 1);
}

- (void)setIsBinary:(BOOL)a3
{
  -[EKAttachment _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 1);
}

- (BOOL)autoArchived
{
  return -[EKAttachment _flagValueWithMask:](self, "_flagValueWithMask:", 2);
}

- (void)setAutoArchived:(BOOL)a3
{
  -[EKAttachment _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 2);
}

- (NSURL)localURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[EKAttachment URLForPendingFileCopy](self, "URLForPendingFileCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[EKAttachment securityScopedLocalURLWrapper](self, "securityScopedLocalURLWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v5;
}

- (id)securityScopedLocalURLWrapper
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B200]);
}

- (NSURL)localURLForArchivedData
{
  void *v2;
  void *v3;

  -[EKAttachment securityScopedLocalURLForArchivedDataWrapper](self, "securityScopedLocalURLForArchivedDataWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)securityScopedLocalURLForArchivedDataWrapper
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B1F8]);
}

- (NSString)localRelativePath
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B1F0]);
}

- (void)setLocalRelativePath:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B1F0]);
}

- (NSNumber)fileSize
{
  return (NSNumber *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B1E0]);
}

- (void)setFileSize:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B1E0]);
}

- (NSString)UUID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (void)setUUID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (id)XPropertiesData
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B1C0]);
}

- (void)setXPropertiesData:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B1C0]);
}

- (NSString)externalID
{
  return (NSString *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B828]);
}

- (void)setExternalID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B828]);
}

- (id)securityScopedURLWrapperForPendingFileCopy
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B208]);
}

- (void)setSecurityScopedURLWrapperForPendingFileCopy:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B208]);
}

- (NSURL)URLForPendingFileCopy
{
  void *v2;
  void *v3;

  -[EKAttachment securityScopedURLWrapperForPendingFileCopy](self, "securityScopedURLWrapperForPendingFileCopy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setURLForPendingFileCopy:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB3910];
    v5 = a3;
    v6 = (id)objc_msgSend([v4 alloc], "initWithURL:readonly:", v5, 1);

  }
  else
  {
    v6 = 0;
  }
  -[EKAttachment setSecurityScopedURLWrapperForPendingFileCopy:](self, "setSecurityScopedURLWrapperForPendingFileCopy:", v6);

}

- (void)markCopiedFileAsDownloaded
{
  -[EKAttachment setShouldSetQuarantineAttributesOnCopiedFile:](self, "setShouldSetQuarantineAttributesOnCopiedFile:", 1);
}

- (BOOL)shouldSetQuarantineAttributesOnCopiedFile
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B210]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setShouldSetQuarantineAttributesOnCopiedFile:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B210]);

}

- (int64_t)compareFileNames:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[EKAttachment fileName](self, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v5, "compare:", v6);
  }
  else if (v5)
  {
    v7 = -1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)EKAttachment;
  -[EKAttachment description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  -[EKAttachment URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAttachment localRelativePath](self, "localRelativePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAttachment fileName](self, "fileName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAttachment fileFormat](self, "fileFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAttachment fileSize](self, "fileSize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAttachment UUID](self, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ <%p> {%@; URL:%@; localRelativePath:%@; filename:%@; fileFormat:%@; fileSize:%@; UUID: %@\n"),
    v5,
    self,
    v3,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKAttachment *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  if (objc_msgSend(MEMORY[0x1E0D0C278], "isProgramSDKAtLeast:", 0x7E30901FFFFFFFFLL))
  {
    v14.receiver = self;
    v14.super_class = (Class)EKAttachment;
    return -[EKObject copyWithZone:](&v14, sel_copyWithZone_, a3);
  }
  else
  {
    v5 = -[EKAttachment init](+[EKAttachment allocWithZone:](EKAttachment, "allocWithZone:", a3), "init");
    if (v5)
    {
      -[EKAttachment URLString](self, "URLString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKAttachment setURLString:](v5, "setURLString:", v6);

      -[EKAttachment fileNameRaw](self, "fileNameRaw");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKAttachment setFileNameRaw:](v5, "setFileNameRaw:", v7);

      -[EKAttachment fileFormat](self, "fileFormat");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKAttachment setFileFormat:](v5, "setFileFormat:", v8);

      -[EKAttachment setIsBinary:](v5, "setIsBinary:", -[EKAttachment isBinary](self, "isBinary"));
      -[EKAttachment localRelativePath](self, "localRelativePath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKAttachment setLocalRelativePath:](v5, "setLocalRelativePath:", v9);

      -[EKAttachment fileSize](self, "fileSize");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKAttachment setFileSize:](v5, "setFileSize:", v10);

      -[EKAttachment XPropertiesData](self, "XPropertiesData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKAttachment setXPropertiesData:](v5, "setXPropertiesData:", v11);

      -[EKAttachment externalID](self, "externalID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKAttachment setExternalID:](v5, "setExternalID:", v12);

    }
  }
  return v5;
}

+ (BOOL)canonicalizedEqualityTestValue1:(id)a3 value2:(id)a4 key:(id)a5 object1:(id)a6 object2:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  unsigned __int8 v29;
  uint64_t v31;
  void *v32;
  void *v33;
  objc_super v34;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D0B208]))
  {
    v17 = v12;
    v18 = v13;
    objc_msgSend(v17, "url");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 || (objc_msgSend(v18, "url"), (v31 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v17, "url", v31);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "url");
      v33 = v19;
      v21 = v14;
      v22 = v17;
      v23 = v13;
      v24 = v16;
      v25 = v18;
      v26 = v12;
      v27 = v15;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v20, "isEqual:", v28);

      v15 = v27;
      v12 = v26;
      v18 = v25;
      v16 = v24;
      v13 = v23;
      v17 = v22;
      v14 = v21;
      v19 = v33;

      if (v33)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v32 = 0;
      v29 = 1;
    }

    goto LABEL_9;
  }
  v34.receiver = a1;
  v34.super_class = (Class)&OBJC_METACLASS___EKAttachment;
  v29 = objc_msgSendSuper2(&v34, sel_canonicalizedEqualityTestValue1_value2_key_object1_object2_, v12, v13, v14, v15, v16);
LABEL_10:

  return v29;
}

- (BOOL)validateWithOwner:(id)a3 error:(id *)a4
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EKAttachment;
  v7 = -[EKObject validateWithOwner:error:](&v11, sel_validateWithOwner_error_);
  if (v7)
  {
    v8 = -[EKObject isNew](self, "isNew");
    LOBYTE(v7) = 1;
    if (!a3 && v8)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 66);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        LOBYTE(v7) = 0;
        *a4 = v9;
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
  }
  return v7;
}

- (BOOL)save:(id *)a3
{
  if (a3)
    *a3 = 0;
  -[EKObject insertPersistentObjectIfNeeded](self, "insertPersistentObjectIfNeeded");
  -[EKObject updatePersistentObject](self, "updatePersistentObject");
  return 1;
}

+ (void)_copyFileAtURLToTemporaryDirectory:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, a1, a3, "Unable to get a temporary location to copy the file to", a5, a6, a7, a8, 0);
}

+ (void)_copyFileAtURLToTemporaryDirectory:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, a1, a3, "Unable to copy item to temporary file", a5, a6, a7, a8, 0);
}

@end
