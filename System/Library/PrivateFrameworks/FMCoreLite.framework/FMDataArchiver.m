@implementation FMDataArchiver

- (FMDataArchiver)initWithFileURL:(id)a3
{
  id v4;
  FMDataArchiver *v5;
  FMDataArchiver *v6;
  NSObject *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDataArchiver;
  v5 = -[FMDataArchiver init](&v9, sel_init);
  if (!v5)
    goto LABEL_4;
  if ((objc_msgSend(v4, "isFileURL") & 1) != 0)
  {
    -[FMDataArchiver setFileURL:](v5, "setFileURL:", v4);
    -[FMDataArchiver setDataProtectionClass:](v5, "setDataProtectionClass:", 3);
    -[FMDataArchiver setBackedUp:](v5, "setBackedUp:", 0);
    -[FMDataArchiver setCreateDirectories:](v5, "setCreateDirectories:", 0);
LABEL_4:
    v6 = v5;
    goto LABEL_8;
  }
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[FMDataArchiver initWithFileURL:].cold.1(v7);

  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)defaultClasses
{
  if (defaultClasses_onceToken != -1)
    dispatch_once(&defaultClasses_onceToken, &__block_literal_global);
  return (id)defaultClasses_set;
}

void __32__FMDataArchiver_defaultClasses__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v15, v14, v13, v12, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)defaultClasses_set;
  defaultClasses_set = v10;

}

- (id)readDictionaryAndClasses:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  -[FMDataArchiver readDataOfClasses:error:](self, "readDataOfClasses:error:", v8, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  v11 = v10;
  if (v9 && !v10)
  {
    v12 = objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = 0;
      if (!a4)
        goto LABEL_11;
      goto LABEL_10;
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected class %@ got %@."), v12, objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.FMCore.FMDataArchiver"), 2, v15);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a4)
  {
    if (v11)
    {

      v9 = 0;
    }
LABEL_10:
    v11 = objc_retainAutorelease(v11);
    *a4 = v11;
  }
LABEL_11:

  return v9;
}

- (id)readArrayAndClasses:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  -[FMDataArchiver readDataOfClasses:error:](self, "readDataOfClasses:error:", v8, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  v11 = v10;
  if (v9 && !v10)
  {
    v12 = objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = 0;
      if (!a4)
        goto LABEL_11;
      goto LABEL_10;
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected class %@ got %@."), v12, objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.FMCore.FMDataArchiver"), 2, v15);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a4)
  {
    if (v11)
    {

      v9 = 0;
    }
LABEL_10:
    v11 = objc_retainAutorelease(v11);
    *a4 = v11;
  }
LABEL_11:

  return v9;
}

- (id)readDataOfClasses:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v13;

  v6 = a3;
  -[FMDataArchiver underlyingDataWithError:](self, "underlyingDataWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*a4)
  {
    v8 = 0;
  }
  else
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v6, v7, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    v10 = v9;
    if (v9)
    {
      *a4 = objc_retainAutorelease(v9);
      LogCategory_Unspecified();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[FMDataArchiver readDataOfClasses:error:].cold.1();

    }
  }

  return v8;
}

- (id)underlyingDataWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[FMDataArchiver unitTestData](self, "unitTestData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDataArchiver fileURL](self, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "fileExistsAtPath:", v8);

    if ((v9 & 1) != 0)
    {
      v10 = (void *)MEMORY[0x1E0C99D50];
      -[FMDataArchiver fileURL](self, "fileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(v10, "dataWithContentsOfURL:options:error:", v11, 0, &v19);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v19;

      if (!v13)
      {
        v12 = v12;
        v5 = v12;
        goto LABEL_10;
      }
      if (a3)
      {
        v13 = objc_retainAutorelease(v13);
        v5 = 0;
        *a3 = v13;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      if (!a3)
      {
        v5 = 0;
        goto LABEL_11;
      }
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2D68];
      v15 = (void *)MEMORY[0x1E0CB3940];
      -[FMDataArchiver fileURL](self, "fileURL");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("Could not find the file %@."), v13);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v21[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.FMCore.FMDataArchiver"), 4, v16);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v5 = 0;
    goto LABEL_10;
  }
LABEL_11:
  v17 = v5;

  return v17;
}

- (BOOL)saveArray:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  -[FMDataArchiver saveObject:](self, "saveObject:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    *a4 = objc_retainAutorelease(v5);

  return v6 == 0;
}

- (BOOL)saveDictionary:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  -[FMDataArchiver saveObject:](self, "saveObject:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    *a4 = objc_retainAutorelease(v5);

  return v6 == 0;
}

- (id)saveObject:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  const __CFString *v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    LogCategory_Unspecified();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AEA5C000, v5, OS_LOG_TYPE_DEFAULT, "FMDataArchiver : calling saveObject from the main thread is bad for performance.", buf, 2u);
    }

  }
  v35 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v35);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v35;
  if (!v7)
  {
    if (!v6)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0CB2D68];
      v41[0] = CFSTR("Could not convert object.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.FMCore.FMDataArchiver"), 2, v9);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
    -[FMDataArchiver fileURL](self, "fileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LogCategory_Unspecified();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[FMDataArchiver saveObject:].cold.5();

    objc_msgSend(v10, "URLByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "fileExistsAtPath:", v13);

    if ((v15 & 1) != 0)
      goto LABEL_12;
    if (-[FMDataArchiver createDirectories](self, "createDirectories"))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      objc_msgSend(v20, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v34);
      v8 = v34;

      if (!v8)
      {
LABEL_12:
        v33 = 0;
        objc_msgSend(v6, "writeToURL:options:error:", v10, -[FMDataArchiver dataWritingOptionForDataProtectionClass:](self, "dataWritingOptionForDataProtectionClass:", -[FMDataArchiver dataProtectionClass](self, "dataProtectionClass")) | 1, &v33);
        v16 = v33;
        if (v16)
        {
          v17 = v16;
          LogCategory_Unspecified();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[FMDataArchiver saveObject:].cold.3();
        }
        else
        {
          v32 = 0;
          objc_msgSend(MEMORY[0x1E0CB3620], "fm_setDataProtectionClass:forFileURL:error:", -[FMDataArchiver dataProtectionClass](self, "dataProtectionClass"), v10, &v32);
          v18 = v32;
          if (v18)
          {
            LogCategory_Unspecified();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              -[FMDataArchiver saveObject:].cold.2();

            v18 = v18;
            v17 = v18;
          }
          else if (-[FMDataArchiver backedUp](self, "backedUp"))
          {
            v17 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = *MEMORY[0x1E0C999D8];
            v31 = 0;
            objc_msgSend(v10, "setResourceValue:forKey:error:", v26, v27, &v31);
            v17 = v31;

            if (v17)
            {
              LogCategory_Unspecified();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                -[FMDataArchiver saveObject:].cold.1(v10, (uint64_t)v17, v28);

              v29 = v17;
            }

          }
        }

        v9 = v17;
        v8 = v9;
        goto LABEL_37;
      }
      LogCategory_Unspecified();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[FMDataArchiver saveObject:].cold.4();

    }
    else
    {
      LogCategory_Unspecified();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v13;
        _os_log_impl(&dword_1AEA5C000, v22, OS_LOG_TYPE_DEFAULT, "FMDataArchiver Error : no directory %@", buf, 0xCu);
      }

      v23 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D68];
      v37 = CFSTR("Could not find specified directory");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.FMCore.FMDataArchiver"), 0, v24);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v9 = 0;
LABEL_37:

    goto LABEL_38;
  }
  v8 = v7;
  LogCategory_Unspecified();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[FMDataArchiver saveObject:].cold.6();
LABEL_38:

  return v8;
}

- (unint64_t)dataWritingOptionForDataProtectionClass:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0x10000000;
  else
    return ((a3 - 1) << 28) + 0x20000000;
}

- (int64_t)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setDataProtectionClass:(int64_t)a3
{
  self->_dataProtectionClass = a3;
}

- (BOOL)backedUp
{
  return self->_backedUp;
}

- (void)setBackedUp:(BOOL)a3
{
  self->_backedUp = a3;
}

- (BOOL)createDirectories
{
  return self->_createDirectories;
}

- (void)setCreateDirectories:(BOOL)a3
{
  self->_createDirectories = a3;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (NSData)unitTestData
{
  return self->_unitTestData;
}

- (void)setUnitTestData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTestData, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)initWithFileURL:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AEA5C000, log, OS_LOG_TYPE_ERROR, "FMDataArchiver must be initialized with a file url", v1, 2u);
}

- (void)readDataOfClasses:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA5C000, v0, v1, "FMDataArchiver: Error unarchiving object %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveObject:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1AEA5C000, a3, OS_LOG_TYPE_ERROR, "FMDataArchiver Error excluding %@ from backup %@", v6, 0x16u);

}

- (void)saveObject:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA5C000, v0, v1, "FMDataArchiver Error : could set data protection %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveObject:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA5C000, v0, v1, "FMDataArchiver Error : could not write to file %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveObject:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA5C000, v0, v1, "FMDataArchiver Error creating the directory %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveObject:.cold.5()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1AEA5C000, v0, OS_LOG_TYPE_DEBUG, "FMDataArchiver saveData to file %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)saveObject:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA5C000, v0, v1, "FMDataArchiver Error creating archive: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
