@implementation DEAttachmentItem

- (DEAttachmentItem)init
{
  DEAttachmentItem *v2;
  DEAttachmentItem *v3;
  NSString *displayName;
  NSURL *path;
  NSNumber *shouldCompress;
  NSNumber *v7;
  NSDate *modificationDate;
  NSNumber *filesize;
  NSURL *attachedPath;
  NSString *attachmentType;
  NSNumber *deleteOnAttach;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DEAttachmentItem;
  v2 = -[DEAttachmentItem init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    displayName = v2->_displayName;
    v2->_displayName = 0;

    path = v3->_path;
    v3->_path = 0;

    shouldCompress = v3->_shouldCompress;
    v7 = (NSNumber *)MEMORY[0x1E0C9AAA0];
    v3->_shouldCompress = (NSNumber *)MEMORY[0x1E0C9AAA0];

    modificationDate = v3->_modificationDate;
    v3->_modificationDate = 0;

    filesize = v3->_filesize;
    v3->_filesize = 0;

    attachedPath = v3->_attachedPath;
    v3->_attachedPath = 0;

    attachmentType = v3->_attachmentType;
    v3->_attachmentType = (NSString *)CFSTR("DEAttachmentTypeItem");

    deleteOnAttach = v3->_deleteOnAttach;
    v3->_deleteOnAttach = v7;

  }
  return v3;
}

- (DEAttachmentItem)initWithPath:(id)a3
{
  void *v4;
  DEAttachmentItem *v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DEAttachmentItem initWithPathURL:](self, "initWithPathURL:", v4);

  return v5;
}

- (DEAttachmentItem)initWithPathURL:(id)a3
{
  id v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  DEAttachmentItem *v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = 0;
  v5 = objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", &v33);
  v6 = v33;
  if ((v5 & 1) == 0)
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v4;
      _os_log_impl(&dword_1A4EEE000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ is not reachable", buf, 0xCu);
    }

  }
  v32 = 0;
  v8 = *MEMORY[0x1E0C998D8];
  v31 = 0;
  objc_msgSend(v4, "getResourceValue:forKey:error:", &v32, v8, &v31);
  v9 = v32;
  v10 = v31;
  if (v10)
  {
    v11 = v10;
    +[DELogging fwHandle](DELogging, "fwHandle");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[DEAttachmentItem initWithPathURL:].cold.3();

  }
  v30 = 0;
  v13 = *MEMORY[0x1E0C999D0];
  v29 = 0;
  objc_msgSend(v4, "getResourceValue:forKey:error:", &v30, v13, &v29);
  v14 = v30;
  v15 = v29;
  if (v15)
  {
    v16 = v15;
    +[DELogging fwHandle](DELogging, "fwHandle");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[DEAttachmentItem initWithPathURL:].cold.2();

  }
  if (v14 && objc_msgSend(v14, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[DEUtils getDirectorySize:](DEUtils, "getDirectorySize:", v4));
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
    v19 = *MEMORY[0x1E0C99998];
    v27 = 0;
    objc_msgSend(v4, "getResourceValue:forKey:error:", &v28, v19, &v27);
    v18 = v28;
    v20 = v27;
    if (v20)
    {
      v21 = v20;
      +[DELogging fwHandle](DELogging, "fwHandle");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[DEAttachmentItem initWithPathURL:].cold.1();

    }
  }
  +[DELogging fwHandle](DELogging, "fwHandle");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v35 = v4;
    v36 = 2112;
    v37 = v9;
    v38 = 2112;
    v39 = v18;
    _os_log_impl(&dword_1A4EEE000, v23, OS_LOG_TYPE_DEFAULT, "New attachment at path: [%{public}@] mod date: %@ size: %@", buf, 0x20u);
  }

  objc_msgSend(v4, "lastPathComponent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[DEAttachmentItem initWithPath:withDisplayName:modificationDate:andFilesize:](self, "initWithPath:withDisplayName:modificationDate:andFilesize:", v4, v24, v9, v18);

  return v25;
}

- (void)_generateSandboxExtensionTokenForPID:(int)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSString *v14;
  NSString *sandboxExtensionToken;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSString *v23;
  NSString *v24;
  void *v25;
  int v26;
  const char *v27;
  void *v28;
  const char *v29;
  int *v30;
  char *v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  __int16 v39;
  char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[DEAttachmentItem deleteOnAttach](self, "deleteOnAttach");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "BOOLValue");

  -[DEAttachmentItem path](self, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "fileSystemRepresentation");

  if (v7)
  {
    -[DEAttachmentItem path](self, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v9 = objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", &v32);
    v10 = v32;

    if ((v9 & 1) != 0)
    {
      v11 = sandbox_extension_issue_file_to_process_by_pid();
      +[DELogging fwHandle](DELogging, "fwHandle");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          -[DEAttachmentItem deleteOnAttach](self, "deleteOnAttach");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "BOOLValue");
          v27 = "R";
          *(_DWORD *)buf = 136315650;
          if (v26)
            v27 = "RW";
          v34 = v27;
          v35 = 2082;
          v36 = v7;
          v37 = 1024;
          v38 = a3;
          _os_log_debug_impl(&dword_1A4EEE000, v13, OS_LOG_TYPE_DEBUG, "Granted %s sandbox extension for attachment item '%{public}s' to process with PID: %d.", buf, 0x1Cu);

        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        sandboxExtensionToken = self->__sandboxExtensionToken;
        self->__sandboxExtensionToken = v14;

        v16 = (void *)v11;
LABEL_6:
        free(v16);
        goto LABEL_12;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[DEAttachmentItem deleteOnAttach](self, "deleteOnAttach");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "BOOLValue"))
          v29 = "RW";
        else
          v29 = "R";
        v30 = __error();
        v31 = strerror(*v30);
        *(_DWORD *)buf = 136315906;
        v34 = v29;
        v35 = 2082;
        v36 = v7;
        v37 = 1024;
        v38 = a3;
        v39 = 2080;
        v40 = v31;
        _os_log_error_impl(&dword_1A4EEE000, v13, OS_LOG_TYPE_ERROR, "Failed to grant %s sandbox extension for attachment item '%{public}s' for PID: %d with error: %s. This DiagnosticExtension may not have appropriate access to the specified item.", buf, 0x26u);

      }
      -[DEAttachmentItem deleteOnAttach](self, "deleteOnAttach");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "BOOLValue");

      if (v19)
      {
        v20 = sandbox_extension_issue_file_to_process_by_pid();
        +[DELogging fwHandle](DELogging, "fwHandle");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v20)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            -[DEAttachmentItem _generateSandboxExtensionTokenForPID:].cold.3();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
          v23 = (NSString *)objc_claimAutoreleasedReturnValue();
          v24 = self->__sandboxExtensionToken;
          self->__sandboxExtensionToken = v23;

          v16 = (void *)v20;
          goto LABEL_6;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[DEAttachmentItem _generateSandboxExtensionTokenForPID:].cold.2(v7, a3, v22);

      }
    }
    else
    {
      +[DELogging fwHandle](DELogging, "fwHandle");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[DEAttachmentItem _generateSandboxExtensionTokenForPID:].cold.4(v7, v10);

    }
  }
  else
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DEAttachmentItem _generateSandboxExtensionTokenForPID:].cold.1(self, v10);
  }
LABEL_12:

}

- (DEAttachmentItem)initWithPath:(id)a3 withDisplayName:(id)a4 modificationDate:(id)a5 andFilesize:(id)a6
{
  id v10;
  id v11;
  id v12;
  DEAttachmentItem *v13;
  DEAttachmentItem *v14;
  uint64_t v15;
  NSString *displayName;
  NSString *attachmentType;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = -[DEAttachmentItem init](self, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_path, a3);
    objc_msgSend(v10, "lastPathComponent");
    v15 = objc_claimAutoreleasedReturnValue();
    displayName = v14->_displayName;
    v14->_displayName = (NSString *)v15;

    objc_storeStrong((id *)&v14->_modificationDate, a5);
    objc_storeStrong((id *)&v14->_filesize, a6);
    attachmentType = v14->_attachmentType;
    v14->_attachmentType = (NSString *)CFSTR("DEAttachmentTypeItem");

  }
  return v14;
}

- (DEAttachmentItem)initWithCoder:(id)a3
{
  id v4;
  DEAttachmentItem *v5;
  uint64_t v6;
  NSString *displayName;
  uint64_t v8;
  NSURL *path;
  uint64_t v10;
  NSNumber *shouldCompress;
  uint64_t v12;
  NSDate *modificationDate;
  uint64_t v14;
  NSURL *attachedPath;
  uint64_t v16;
  NSString *attachmentType;
  uint64_t v18;
  NSNumber *deleteOnAttach;
  uint64_t v20;
  NSString *sandboxExtensionToken;

  v4 = a3;
  v5 = -[DEAttachmentItem init](self, "init");
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("DisplayName"));
  v6 = objc_claimAutoreleasedReturnValue();
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v6;

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("Path"));
  v8 = objc_claimAutoreleasedReturnValue();
  path = v5->_path;
  v5->_path = (NSURL *)v8;

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ShouldCompress"));
  v10 = objc_claimAutoreleasedReturnValue();
  shouldCompress = v5->_shouldCompress;
  v5->_shouldCompress = (NSNumber *)v10;

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ModificationDate"));
  v12 = objc_claimAutoreleasedReturnValue();
  modificationDate = v5->_modificationDate;
  v5->_modificationDate = (NSDate *)v12;

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("AttachedPath"));
  v14 = objc_claimAutoreleasedReturnValue();
  attachedPath = v5->_attachedPath;
  v5->_attachedPath = (NSURL *)v14;

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("AttachmentType"));
  v16 = objc_claimAutoreleasedReturnValue();
  attachmentType = v5->_attachmentType;
  v5->_attachmentType = (NSString *)v16;

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("DeleteOnAttach"));
  v18 = objc_claimAutoreleasedReturnValue();
  deleteOnAttach = v5->_deleteOnAttach;
  v5->_deleteOnAttach = (NSNumber *)v18;

  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("SandboxExtensionToken"));
  v20 = objc_claimAutoreleasedReturnValue();

  sandboxExtensionToken = v5->__sandboxExtensionToken;
  v5->__sandboxExtensionToken = (NSString *)v20;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *path;
  id v5;

  path = self->_path;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", path, CFSTR("Path"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("DisplayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shouldCompress, CFSTR("ShouldCompress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modificationDate, CFSTR("ModificationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachedPath, CFSTR("AttachedPath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachmentType, CFSTR("AttachmentType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deleteOnAttach, CFSTR("DeleteOnAttach"));
  objc_msgSend(v5, "encodeObject:forKey:", self->__sandboxExtensionToken, CFSTR("SandboxExtensionToken"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)attachToDestinationDir:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[DELogging fwHandle](DELogging, "fwHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v16 = 138543362;
    v17 = v4;
    _os_log_impl(&dword_1A4EEE000, v5, OS_LOG_TYPE_INFO, "Log destination directory: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  -[DEAttachmentItem path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEAttachmentItem shouldCompress](self, "shouldCompress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[DEUtils copyItem:toDestinationDir:zipped:](DEUtils, "copyItem:toDestinationDir:zipped:", v6, v4, objc_msgSend(v7, "BOOLValue"));
  -[DEAttachmentItem setAttachedPath:](self, "setAttachedPath:", v8);

  -[DEAttachmentItem attachedPath](self, "attachedPath");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[DEAttachmentItem deleteOnAttach](self, "deleteOnAttach");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v12)
    {
      -[DEAttachmentItem path](self, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[DEUtils removeFile:](DEUtils, "removeFile:", v13);

    }
  }
  -[DEAttachmentItem attachedPath](self, "attachedPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)detach
{
  void *v3;

  -[DEAttachmentItem attachedPath](self, "attachedPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEUtils removeFile:](DEUtils, "removeFile:", v3);

  -[DEAttachmentItem setAttachedPath:](self, "setAttachedPath:", 0);
}

- (id)description
{
  void *v2;
  void *v3;

  -[DEAttachmentItem path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)attachmentWithPath:(id)a3 withDisplayName:(id)a4 modificationDate:(id)a5 andFilesize:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  DEAttachmentItem *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[DEAttachmentItem initWithPath:withDisplayName:modificationDate:andFilesize:]([DEAttachmentItem alloc], "initWithPath:withDisplayName:modificationDate:andFilesize:", v12, v11, v10, v9);

  return v13;
}

+ (id)attachmentWithPath:(id)a3
{
  id v3;
  DEAttachmentItem *v4;

  v3 = a3;
  v4 = -[DEAttachmentItem initWithPath:]([DEAttachmentItem alloc], "initWithPath:", v3);

  return v4;
}

+ (id)attachmentWithPathURL:(id)a3
{
  id v3;
  DEAttachmentItem *v4;

  v3 = a3;
  v4 = -[DEAttachmentItem initWithPathURL:]([DEAttachmentItem alloc], "initWithPathURL:", v3);

  return v4;
}

- (id)sandboxExtensionHandleWithErrorOut:(id *)a3
{
  void *v5;
  DEAttachmentItemSandboxExtensionHandle *v6;
  void *v7;
  void *v8;
  DEAttachmentItemSandboxExtensionHandle *v9;
  NSString *sandboxExtensionToken;

  -[DEAttachmentItem _sandboxExtensionToken](self, "_sandboxExtensionToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [DEAttachmentItemSandboxExtensionHandle alloc];
    -[DEAttachmentItem _sandboxExtensionToken](self, "_sandboxExtensionToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEAttachmentItem path](self, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[DEAttachmentItemSandboxExtensionHandle initWithSandboxExtensionToken:itemURL:errorOut:](v6, "initWithSandboxExtensionToken:itemURL:errorOut:", v7, v8, a3);

    sandboxExtensionToken = self->__sandboxExtensionToken;
    self->__sandboxExtensionToken = 0;

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSURL)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_modificationDate, a3);
}

- (NSNumber)filesize
{
  return self->_filesize;
}

- (void)setFilesize:(id)a3
{
  objc_storeStrong((id *)&self->_filesize, a3);
}

- (NSNumber)shouldCompress
{
  return self->_shouldCompress;
}

- (void)setShouldCompress:(id)a3
{
  objc_storeStrong((id *)&self->_shouldCompress, a3);
}

- (NSURL)attachedPath
{
  return self->_attachedPath;
}

- (void)setAttachedPath:(id)a3
{
  objc_storeStrong((id *)&self->_attachedPath, a3);
}

- (NSString)attachmentType
{
  return self->_attachmentType;
}

- (void)setAttachmentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)deleteOnAttach
{
  return self->_deleteOnAttach;
}

- (void)setDeleteOnAttach:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)_sandboxExtensionToken
{
  return self->__sandboxExtensionToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__sandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_deleteOnAttach, 0);
  objc_storeStrong((id *)&self->_attachmentType, 0);
  objc_storeStrong((id *)&self->_attachedPath, 0);
  objc_storeStrong((id *)&self->_shouldCompress, 0);
  objc_storeStrong((id *)&self->_filesize, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)initWithPathURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, v0, v1, "NSURLFileSizeKey: [%{public}@]", v2);
  OUTLINED_FUNCTION_5();
}

- (void)initWithPathURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, v0, v1, "NSURLIsDirectoryKey: [%{public}@]", v2);
  OUTLINED_FUNCTION_5();
}

- (void)initWithPathURL:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, v0, v1, "NSURLContentModificationDateKey: [%{public}@]", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_generateSandboxExtensionTokenForPID:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v3;
  v6 = CFSTR("-");
  if (v3)
    v6 = (const __CFString *)v3;
  v7 = 138543362;
  v8 = v6;
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, a2, v4, "Failed to get file system representation for file with URL: %{public}@. This DiagnosticExtension may not have appropriate access to the specified item.", (uint8_t *)&v7);

}

- (void)_generateSandboxExtensionTokenForPID:(NSObject *)a3 .cold.2(uint64_t a1, int a2, NSObject *a3)
{
  int *v6;
  char *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = __error();
  v7 = strerror(*v6);
  v8 = 136446722;
  v9 = a1;
  v10 = 1024;
  v11 = a2;
  v12 = 2080;
  v13 = v7;
  _os_log_error_impl(&dword_1A4EEE000, a3, OS_LOG_TYPE_ERROR, "Fallback attempt to grant R sandbox extension failed for attachment item '%{public}s' for PID: %d with error: %s. This DiagnosticExtension may not have appropriate access to the specified item.", (uint8_t *)&v8, 0x1Cu);
}

- (void)_generateSandboxExtensionTokenForPID:.cold.3()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_1A4EEE000, v1, OS_LOG_TYPE_DEBUG, "Succeeded in fallback attempt to grant R sandbox extension for %{public}s for PID %d.", v2, 0x12u);
  OUTLINED_FUNCTION_5();
}

- (void)_generateSandboxExtensionTokenForPID:(uint64_t)a1 .cold.4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1(&dword_1A4EEE000, v3, v4, "Cannot grant sandbox extension for unreachable item with path '%s' due to error %@. This DiagnosticExtension may not have appropriate access to the specified item.", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

@end
