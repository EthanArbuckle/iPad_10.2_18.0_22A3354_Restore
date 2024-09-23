@implementation DCSandboxExtension

- (DCSandboxExtension)initWithFileURL:(id)a3
{
  id v5;
  DCSandboxExtension *v6;
  DCSandboxExtension *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DCSandboxExtension;
  v6 = -[DCSandboxExtension init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_canAccessFileURL = 1;
    objc_storeStrong((id *)&v6->_fileURL, a3);
    v7->_shouldIssueSandboxExtensionWhenEncoding = 1;
    -[DCSandboxExtension setSandboxExtensionHandle:](v7, "setSandboxExtensionHandle:", -1);
  }

  return v7;
}

- (void)relinquish
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_20CE8E000, a2, a3, "FAILED to release sandbox extension handle: %@", (uint8_t *)&v3);
}

- (void)dealloc
{
  objc_super v3;

  -[DCSandboxExtension relinquish](self, "relinquish");
  v3.receiver = self;
  v3.super_class = (Class)DCSandboxExtension;
  -[DCSandboxExtension dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DCSandboxExtension)initWithCoder:(id)a3
{
  id v4;
  DCSandboxExtension *v5;
  DCSandboxExtension *v6;
  uint64_t v7;
  NSURL *fileURL;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DCSandboxExtension;
  v5 = -[DCSandboxExtension init](&v23, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_canAccessFileURL = 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFileURLFieldCodingKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    fileURL = v6->_fileURL;
    v6->_fileURL = (NSURL *)v7;

    v6->_shouldIssueSandboxExtensionWhenEncoding = 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSandboxExtensionTokenCodingKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (v10)
    {
      objc_msgSend(v10, "increaseLengthBy:", 1);
      v11 = objc_retainAutorelease(v10);
      objc_msgSend(v11, "bytes");
      -[DCSandboxExtension setSandboxExtensionHandle:](v6, "setSandboxExtensionHandle:", sandbox_extension_consume());
      if (-[DCSandboxExtension sandboxExtensionHandle](v6, "sandboxExtensionHandle") != -1)
      {
        v12 = os_log_create("com.apple.documentcamera", ");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          -[DCSandboxExtension fileURL](v6, "fileURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v25 = v13;
          _os_log_impl(&dword_20CE8E000, v12, OS_LOG_TYPE_INFO, "Consumed sandbox extension for %@", buf, 0xCu);

        }
        v6->_canAccessFileURL = 1;
        goto LABEL_13;
      }
      v15 = (void *)MEMORY[0x24BDD1540];
      v16 = *MEMORY[0x24BDD1128];
      v17 = *__error();
      v26[0] = CFSTR("sandboxExtensionToken");
      v26[1] = CFSTR("file");
      v27[0] = v11;
      -[DCSandboxExtension fileURL](v6, "fileURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, v19);
      v14 = objc_claimAutoreleasedReturnValue();

      v20 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[DCSandboxExtension initWithCoder:].cold.2((uint64_t)v14, v20, v21);

    }
    else
    {
      v14 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[DCSandboxExtension initWithCoder:].cold.1(v14);
    }

LABEL_13:
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  char *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[DCSandboxExtension shouldIssueSandboxExtensionWhenEncoding](self, "shouldIssueSandboxExtensionWhenEncoding"))
  {
    -[DCSandboxExtension fileURL](self, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "cStringUsingEncoding:", 4);

    v7 = (const char *)sandbox_extension_issue_file();
    if (v7)
    {
      v8 = (char *)v7;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, strlen(v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      free(v8);
      v10 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[DCSandboxExtension fileURL](self, "fileURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_20CE8E000, v10, OS_LOG_TYPE_INFO, "Issued sandbox extension for %@", (uint8_t *)&v13, 0xCu);

      }
    }
    else
    {
      v10 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[DCSandboxExtension encodeWithCoder:].cold.1(self, v10);
      v9 = 0;
    }

    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("kSandboxExtensionTokenCodingKey"));
  }
  else
  {
    objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("kSandboxExtensionTokenCodingKey"));
  }
  -[DCSandboxExtension fileURL](self, "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("kFileURLFieldCodingKey"));

}

- (BOOL)canAccessFileURL
{
  return self->_canAccessFileURL;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (BOOL)shouldIssueSandboxExtensionWhenEncoding
{
  return self->_shouldIssueSandboxExtensionWhenEncoding;
}

- (int64_t)sandboxExtensionHandle
{
  return self->_sandboxExtensionHandle;
}

- (void)setSandboxExtensionHandle:(int64_t)a3
{
  self->_sandboxExtensionHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20CE8E000, log, OS_LOG_TYPE_ERROR, "FAILED to consume sandbox extension: no extension token found", v1, 2u);
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_20CE8E000, a2, a3, "FAILED to consume sandbox extension: %@", (uint8_t *)&v3);
}

- (void)encodeWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_20CE8E000, a2, v4, "FAILED to issue sandbox extension for %@", (uint8_t *)&v5);

}

@end
