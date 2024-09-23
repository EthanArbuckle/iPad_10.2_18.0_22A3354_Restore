@implementation DKDiagnosticResult

- (DKDiagnosticResult)init
{
  DKDiagnosticResult *v2;
  uint64_t v3;
  NSNumber *statusCode;
  NSDictionary *data;
  uint64_t v6;
  NSArray *files;
  uint64_t v8;
  NSArray *fileSandboxTokens;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DKDiagnosticResult;
  v2 = -[DKDiagnosticResult init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 4294966395);
    statusCode = v2->_statusCode;
    v2->_statusCode = (NSNumber *)v3;

    data = v2->_data;
    v2->_data = (NSDictionary *)MEMORY[0x24BDBD1B8];

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    files = v2->_files;
    v2->_files = (NSArray *)v6;

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    fileSandboxTokens = v2->_fileSandboxTokens;
    v2->_fileSandboxTokens = (NSArray *)v8;

  }
  return v2;
}

- (DKDiagnosticResult)initWithMutableResult:(id)a3
{
  id v4;
  DKDiagnosticResult *v5;
  uint64_t v6;
  NSNumber *statusCode;
  uint64_t v8;
  NSDictionary *data;
  uint64_t v10;
  NSArray *files;
  uint64_t v12;
  NSArray *fileSandboxTokens;
  uint64_t v14;
  NSArray *uploadStatus;

  v4 = a3;
  v5 = -[DKDiagnosticResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "statusCode");
    v6 = objc_claimAutoreleasedReturnValue();
    statusCode = v5->_statusCode;
    v5->_statusCode = (NSNumber *)v6;

    objc_msgSend(v4, "data");
    v8 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSDictionary *)v8;

    objc_msgSend(v4, "files");
    v10 = objc_claimAutoreleasedReturnValue();
    files = v5->_files;
    v5->_files = (NSArray *)v10;

    objc_msgSend(v4, "fileSandboxTokens");
    v12 = objc_claimAutoreleasedReturnValue();
    fileSandboxTokens = v5->_fileSandboxTokens;
    v5->_fileSandboxTokens = (NSArray *)v12;

    objc_msgSend(v4, "uploadStatus");
    v14 = objc_claimAutoreleasedReturnValue();
    uploadStatus = v5->_uploadStatus;
    v5->_uploadStatus = (NSArray *)v14;

  }
  return v5;
}

- (DKDiagnosticResult)initWithCoder:(id)a3
{
  id v4;
  DKDiagnosticResult *v5;
  uint64_t v6;
  NSNumber *statusCode;
  void *v8;
  uint64_t v9;
  NSDictionary *data;
  void *v11;
  uint64_t v12;
  NSArray *files;
  void *v14;
  uint64_t v15;
  NSArray *fileSandboxTokens;
  void *v17;
  uint64_t v18;
  NSArray *uploadStatus;
  NSObject *v20;
  int v22;
  DKDiagnosticResult *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[DKDiagnosticResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusCode"));
    v6 = objc_claimAutoreleasedReturnValue();
    statusCode = v5->_statusCode;
    v5->_statusCode = (NSNumber *)v6;

    +[DKUtilities acceptableDecoderClasses](DKUtilities, "acceptableDecoderClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("data"));
    v9 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSDictionary *)v9;

    +[DKUtilities acceptableDecoderClasses](DKUtilities, "acceptableDecoderClasses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("files"));
    v12 = objc_claimAutoreleasedReturnValue();
    files = v5->_files;
    v5->_files = (NSArray *)v12;

    +[DKUtilities acceptableDecoderClasses](DKUtilities, "acceptableDecoderClasses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("fileSandboxTokens"));
    v15 = objc_claimAutoreleasedReturnValue();
    fileSandboxTokens = v5->_fileSandboxTokens;
    v5->_fileSandboxTokens = (NSArray *)v15;

    +[DKUtilities acceptableDecoderClasses](DKUtilities, "acceptableDecoderClasses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("uploadStatus"));
    v18 = objc_claimAutoreleasedReturnValue();
    uploadStatus = v5->_uploadStatus;
    v5->_uploadStatus = (NSArray *)v18;

    DiagnosticsKitLogHandleForCategory(4);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v5;
      _os_log_impl(&dword_22DE4C000, v20, OS_LOG_TYPE_DEFAULT, "Doing decode of DKDiagnosticResult: %@", (uint8_t *)&v22, 0xCu);
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  DKDiagnosticResult *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  DKDiagnosticResult *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DiagnosticsKitLogHandleForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = self;
    _os_log_impl(&dword_22DE4C000, v5, OS_LOG_TYPE_DEFAULT, "Doing encode of DKDiagnosticResult: %@", buf, 0xCu);
  }

  -[DKDiagnosticResult statusCode](self, "statusCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("statusCode"));

  -[DKDiagnosticResult data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v7, "dropNonSerializableDataWithError:", &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("data"));

  -[DKDiagnosticResult files](self, "files");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v9;
  objc_msgSend(v10, "dropNonSerializableDataWithError:", &v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v23;

  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("files"));
  -[DKDiagnosticResult fileSandboxTokens](self, "fileSandboxTokens");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v12;
  objc_msgSend(v13, "dropNonSerializableDataWithError:", &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;

  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("fileSandboxTokens"));
  -[DKDiagnosticResult uploadStatus](self, "uploadStatus");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v15;
  objc_msgSend(v16, "dropNonSerializableDataWithError:", &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v21;

  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("uploadStatus"));
  if (v18)
  {
    DiagnosticsKitLogHandleForCategory(4);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v18, "description");
      v20 = (DKDiagnosticResult *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v20;
      _os_log_impl(&dword_22DE4C000, v19, OS_LOG_TYPE_DEFAULT, "DKDiagnosticResult decoding error encountered: %@", buf, 0xCu);

    }
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[DKDiagnosticResult statusCode](self, "statusCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKDiagnosticResult data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKDiagnosticResult files](self, "files");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKDiagnosticResult fileSandboxTokens](self, "fileSandboxTokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKDiagnosticResult uploadStatus](self, "uploadStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Status Code: %@, Data: %@, Files: %@, Sandbox Tokens: %@ Upload Status: %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  int v18;
  DKDiagnosticResult *v19;
  __int16 v20;
  _QWORD *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSNumber copyWithZone:](self->_statusCode, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSDictionary copyWithZone:](self->_data, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSArray copyWithZone:](self->_files, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSArray copyWithZone:](self->_fileSandboxTokens, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSArray copyWithZone:](self->_uploadStatus, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  DiagnosticsKitLogHandleForCategory(4);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = self;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_22DE4C000, v16, OS_LOG_TYPE_DEFAULT, "Copied DKDiagnosticResult: %@ -> %@", (uint8_t *)&v18, 0x16u);
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  DKMutableDiagnosticResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[DKMutableDiagnosticResult init](+[DKMutableDiagnosticResult allocWithZone:](DKMutableDiagnosticResult, "allocWithZone:"), "init");
  v6 = (void *)-[NSDictionary mutableCopyWithZone:](self->_data, "mutableCopyWithZone:", a3);
  -[DKMutableDiagnosticResult setData:](v5, "setData:", v6);

  v7 = (void *)-[NSArray mutableCopyWithZone:](self->_files, "mutableCopyWithZone:", a3);
  -[DKMutableDiagnosticResult setFiles:](v5, "setFiles:", v7);

  v8 = (void *)-[NSArray mutableCopyWithZone:](self->_fileSandboxTokens, "mutableCopyWithZone:", a3);
  -[DKMutableDiagnosticResult setFileSandboxTokens:](v5, "setFileSandboxTokens:", v8);

  -[DKMutableDiagnosticResult setStatusCode:](v5, "setStatusCode:", self->_statusCode);
  v9 = (void *)-[NSArray mutableCopyWithZone:](self->_uploadStatus, "mutableCopyWithZone:", a3);
  -[DKMutableDiagnosticResult setUploadStatus:](v5, "setUploadStatus:", v9);

  return v5;
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (NSDictionary)data
{
  return self->_data;
}

- (NSArray)files
{
  return self->_files;
}

- (NSArray)fileSandboxTokens
{
  return self->_fileSandboxTokens;
}

- (NSArray)uploadStatus
{
  return self->_uploadStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadStatus, 0);
  objc_storeStrong((id *)&self->_fileSandboxTokens, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_statusCode, 0);
}

@end
