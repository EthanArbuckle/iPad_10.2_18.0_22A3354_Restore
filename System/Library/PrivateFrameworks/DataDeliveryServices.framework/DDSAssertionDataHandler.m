@implementation DDSAssertionDataHandler

- (DDSAssertionDataHandler)initWithAssertionStorageFileURL:(id)a3
{
  id v4;
  DDSAssertionDataHandler *v5;
  uint64_t v6;
  NSURL *assertionStorageFileURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDSAssertionDataHandler;
  v5 = -[DDSAssertionDataHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    assertionStorageFileURL = v5->_assertionStorageFileURL;
    v5->_assertionStorageFileURL = (NSURL *)v6;

  }
  return v5;
}

- (id)loadAssertionData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v14;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99D50];
  -[DDSAssertionDataHandler assertionStorageFileURL](self, "assertionStorageFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v2, "dataWithContentsOfURL:options:error:", v3, 0, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;

  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v8, v4, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      DefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[DDSAssertionDataHandler loadAssertionData].cold.2();

      v11 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    DefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DDSAssertionDataHandler loadAssertionData].cold.1();
    v11 = (id)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (void)saveAssertionData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;

  v4 = a3;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v5)
  {
    -[DDSAssertionDataHandler assertionStorageFileURL](self, "assertionStorageFileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v8 = objc_msgSend(v5, "writeToURL:options:error:", v7, 1, &v12);
    v9 = v12;

    DefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((v8 & 1) != 0)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[DDSAssertionDataHandler saveAssertionData:].cold.2(self, v11);
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[DDSAssertionDataHandler saveAssertionData:].cold.3();
    }

  }
  else
  {
    DefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DDSAssertionDataHandler saveAssertionData:].cold.1();
  }

}

- (NSURL)assertionStorageFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionStorageFileURL, 0);
}

- (void)loadAssertionData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1DA990000, v0, v1, "Failed to unarchive assertion content: (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)saveAssertionData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1DA990000, v0, v1, "Failed to archive assertions : %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)saveAssertionData:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "assertionStorageFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1DA990000, a2, OS_LOG_TYPE_DEBUG, "Saved assertion data to URL: (%{public}@)", v4, 0xCu);

}

- (void)saveAssertionData:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_1DA990000, v1, OS_LOG_TYPE_ERROR, "Error (%{public}@) writing content: %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

@end
