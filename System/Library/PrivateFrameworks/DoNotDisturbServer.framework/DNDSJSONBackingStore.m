@implementation DNDSJSONBackingStore

- (DNDSJSONBackingStore)initWithRecordClass:(Class)a3 fileURL:(id)a4 versionNumber:(unint64_t)a5
{
  return -[DNDSJSONBackingStore initWithRecordClass:fileURL:secureFileURL:versionNumber:securityClass:](self, "initWithRecordClass:fileURL:secureFileURL:versionNumber:securityClass:", a3, a4, 0, a5, 3);
}

- (DNDSJSONBackingStore)initWithRecordClass:(Class)a3 fileURL:(id)a4 secureFileURL:(id)a5 versionNumber:(unint64_t)a6 securityClass:(unint64_t)a7
{
  id v12;
  id v13;
  DNDSJSONBackingStore *v14;
  DNDSJSONBackingStore *v15;
  uint64_t v16;
  NSURL *fileURL;
  uint64_t v18;
  NSURL *secureFileURL;
  objc_super v21;

  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DNDSJSONBackingStore;
  v14 = -[DNDSJSONBackingStore init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_recordClass = a3;
    v16 = objc_msgSend(v12, "copy");
    fileURL = v15->_fileURL;
    v15->_fileURL = (NSURL *)v16;

    v18 = objc_msgSend(v13, "copy");
    secureFileURL = v15->_secureFileURL;
    v15->_secureFileURL = (NSURL *)v18;

    v15->_versionNumber = a6;
    v15->_securityClass = a7;
    DNDSRegisterSysdiagnoseDataProvider(v15);
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSJSONBackingStore;
  -[DNDSJSONBackingStore dealloc](&v3, sel_dealloc);
}

- (id)readRecordWithError:(id *)a3
{
  DNDSApplicationIdentifierMapper *v5;
  DNDSContactProvider *v6;
  void *v7;
  DNDSBackingStoreDictionaryContext *v8;
  void *v9;
  void *v10;

  v5 = objc_alloc_init(DNDSApplicationIdentifierMapper);
  v6 = objc_alloc_init(DNDSContactProvider);
  -[DNDSJSONBackingStore readRecordDictionaryfromURL:withError:](self, "readRecordDictionaryfromURL:withError:", self->_fileURL, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_secureFileURL
    && -[objc_class conformsToProtocol:](self->_recordClass, "conformsToProtocol:", &unk_1EF9B5080))
  {
    v8 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 1, 3, 0, v6, v5);
    -[DNDSJSONBackingStore readRecordDictionaryfromURL:withError:](self, "readRecordDictionaryfromURL:withError:", self->_secureFileURL, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)-[objc_class newWithDictionaryRepresentation:partitionedDictionaryRepresentation:context:](self->_recordClass, "newWithDictionaryRepresentation:partitionedDictionaryRepresentation:context:", v7, v9, v8);

  }
  else
  {
    v8 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 1, 1, 0, v6, v5);
    v10 = (void *)-[objc_class newWithDictionaryRepresentation:context:](self->_recordClass, "newWithDictionaryRepresentation:context:", v7, v8);
  }

  return v10;
}

- (unint64_t)writeRecord:(id)a3 error:(id *)a4
{
  return -[DNDSJSONBackingStore writeRecord:writePartition:error:](self, "writeRecord:writePartition:error:", a3, 1, a4);
}

- (unint64_t)writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  id v7;
  DNDSApplicationIdentifierMapper *v8;
  DNDSContactProvider *v9;
  DNDSBackingStoreDictionaryContext *v10;
  void *v11;
  NSURL *fileURL;
  unint64_t v13;
  id v14;
  DNDSBackingStoreDictionaryContext *v15;
  void *v16;
  unint64_t securityClass;
  NSURL *secureFileURL;
  id v19;
  void *v21;
  id v23;
  id v24;

  v5 = a4;
  v7 = a3;
  self->_deviceOutOfSpace = 0;
  v21 = (void *)MEMORY[0x1D17A0B90]();
  v8 = objc_alloc_init(DNDSApplicationIdentifierMapper);
  v9 = objc_alloc_init(DNDSContactProvider);
  v10 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 1, 1, 0, v9, v8);
  objc_msgSend(v7, "dictionaryRepresentationWithContext:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  fileURL = self->_fileURL;
  v24 = 0;
  v13 = -[DNDSJSONBackingStore writeRecordDictionary:withSecurityClass:toURL:error:](self, "writeRecordDictionary:withSecurityClass:toURL:error:", v11, 3, fileURL, &v24);
  v14 = v24;
  if (v5 && v13 == 2)
  {
    if (self->_secureFileURL)
    {
      v15 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 1, 2, 0, v9, v8);

      objc_msgSend(v7, "dictionaryRepresentationWithContext:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      securityClass = self->_securityClass;
      secureFileURL = self->_secureFileURL;
      v23 = v14;
      v13 = -[DNDSJSONBackingStore writeRecordDictionary:withSecurityClass:toURL:error:](self, "writeRecordDictionary:withSecurityClass:toURL:error:", v16, securityClass, secureFileURL, &v23);
      v19 = v23;

      v10 = v15;
      v14 = v19;
    }
    else
    {
      v13 = 2;
    }
  }

  objc_autoreleasePoolPop(v21);
  if (a5)
    *a5 = objc_retainAutorelease(v14);

  return v13;
}

- (id)readRecordDictionaryfromURL:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17A0B90]();
    v41 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v6, 0, &v41);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (uint64_t)v41;
    if (!v11)
    {
      v14 = 0;
      v18 = 0;
      goto LABEL_28;
    }
    v40 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v11, 0, &v40);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (unint64_t)v40;
    if (!v13)
    {
      v18 = 0;
LABEL_27:

LABEL_28:
      objc_autoreleasePoolPop(v10);
      if (!a4)
        goto LABEL_34;
      goto LABEL_29;
    }
    v39 = v10;
    v15 = objc_opt_class();
    v16 = v13;
    v38 = v13;
    if (v15)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    v19 = v17;

    objc_msgSend(v19, "bs_safeObjectForKey:ofType:", CFSTR("header"), objc_opt_class());
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bs_safeObjectForKey:ofType:", CFSTR("version"), objc_opt_class());
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v35, "integerValue");
    v37 = v19;
    if (v20 <= self->_versionNumber)
    {
      objc_msgSend(v19, "bs_safeObjectForKey:ofType:", CFSTR("data"), objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_opt_class();
      v28 = v26;
      if (v27)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v29 = v28;
        else
          v29 = 0;
      }
      else
      {
        v29 = 0;
      }
      v18 = v29;

      if (v20 >= self->_versionNumber)
      {
        v13 = v38;
        v24 = v34;
        goto LABEL_26;
      }
      -[DNDSJSONBackingStore delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "backingStore:migrateDictionaryRepresentation:fromVersionNumber:toVersionNumber:", self, v18, v20, self->_versionNumber);
      v30 = objc_claimAutoreleasedReturnValue();

      v18 = (id)v30;
      v24 = v34;
    }
    else
    {
      v21 = DNDSLogGeneral;
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
        -[DNDSJSONBackingStore readRecordDictionaryfromURL:withError:].cold.1((uint64_t *)&self->_versionNumber, v20, v21);
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0D1D3E0];
      v42 = *MEMORY[0x1E0CB2D50];
      v43[0] = CFSTR("Unexpected version number");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 1006, v24);
      v18 = 0;
      v25 = (void *)v12;
      v12 = objc_claimAutoreleasedReturnValue();
    }

    v13 = v38;
LABEL_26:

    v10 = v39;
    goto LABEL_27;
  }
  v14 = 0;
  v12 = 0;
  v18 = 0;
  if (!a4)
    goto LABEL_34;
LABEL_29:
  if (v12 | v14)
  {
    if (v12)
      v31 = (void *)v12;
    else
      v31 = (void *)v14;
    *a4 = objc_retainAutorelease(v31);
  }
LABEL_34:
  v32 = v18;

  return v32;
}

- (unint64_t)writeRecordDictionary:(id)a3 withSecurityClass:(unint64_t)a4 toURL:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  char v25;
  id v26;
  void *v27;
  unint64_t v28;
  int v29;
  id v30;
  void *v31;
  void *v33;
  id *v34;
  void *context;
  id v37;
  id v38;
  id v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  self->_deviceOutOfSpace = 0;
  context = (void *)MEMORY[0x1D17A0B90]();
  v44[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = CFSTR("header");
  v40[0] = CFSTR("version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_versionNumber);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = CFSTR("timestamp");
  v41[0] = v12;
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = CFSTR("data");
  v43[0] = v15;
  v43[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v16))
  {
    v34 = a6;
    v39 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v16, 0, &v39);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v39;
    if (!v17)
    {
      v27 = 0;
      v24 = 0;
      v28 = 0;
LABEL_17:

      a6 = v34;
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "fileExistsAtPath:", v20);

    v33 = v19;
    if ((v21 & 1) == 0)
    {
      objc_msgSend(v10, "URLByDeletingLastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v19, "fileExistsAtPath:isDirectory:", v23, 0))
      {
        v38 = 0;
        v29 = objc_msgSend(v19, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v23, 1, 0, &v38);
        v24 = v38;

        if (!v29)
        {
          v27 = 0;
          goto LABEL_15;
        }
LABEL_7:
        v37 = 0;
        v25 = objc_msgSend(v17, "writeToURL:options:error:", v10, objc_msgSend((id)objc_opt_class(), "dataWritingOptionsForSecurityClass:", a4), &v37);
        v26 = v37;
        v27 = v26;
        if ((v25 & 1) != 0)
        {
          v28 = 2;
LABEL_16:

          goto LABEL_17;
        }
        if (objc_msgSend(v26, "dnds_isOutOfSpaceError"))
        {
          v28 = 1;
          self->_deviceOutOfSpace = 1;
          goto LABEL_16;
        }
LABEL_15:
        v28 = 0;
        goto LABEL_16;
      }

    }
    v24 = 0;
    goto LABEL_7;
  }
  v27 = 0;
  v24 = 0;
  v18 = 0;
  v28 = 0;
LABEL_18:

  objc_autoreleasePoolPop(context);
  if (a6 && (v27 || v24 || v18))
  {
    if (v24)
      v30 = v24;
    else
      v30 = v18;
    if (v27)
      v31 = v27;
    else
      v31 = v30;
    *a6 = objc_retainAutorelease(v31);
  }

  return v28;
}

+ (unint64_t)dataWritingOptionsForSecurityClass:(unint64_t)a3
{
  if (a3 > 3)
    return 1;
  else
    return qword_1CB953A00[a3];
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)CFSTR("com.apple.donotdisturb.server.JSONBackingStore");
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("deviceOutOfSpace");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deviceOutOfSpace, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (DNDSBackingStoreDelegate)delegate
{
  return (DNDSBackingStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secureFileURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)readRecordDictionaryfromURL:(os_log_t)log withError:.cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134349312;
  v5 = a2;
  v6 = 2050;
  v7 = v3;
  _os_log_error_impl(&dword_1CB895000, log, OS_LOG_TYPE_ERROR, "Unexpected version number %{public}llu (maximum version number %{public}llu)", (uint8_t *)&v4, 0x16u);
}

@end
