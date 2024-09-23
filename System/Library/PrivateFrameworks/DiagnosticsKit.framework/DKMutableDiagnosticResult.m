@implementation DKMutableDiagnosticResult

- (DKMutableDiagnosticResult)init
{
  DKMutableDiagnosticResult *v2;
  uint64_t v3;
  NSNumber *statusCode;
  NSDictionary *data;
  uint64_t v6;
  NSArray *files;
  uint64_t v8;
  NSArray *fileSandboxTokens;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DKMutableDiagnosticResult;
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

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DKDiagnosticResult initWithMutableResult:](+[DKDiagnosticResult allocWithZone:](DKDiagnosticResult, "allocWithZone:", a3), "initWithMutableResult:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DKMutableDiagnosticResult;
  v5 = -[DKDiagnosticResult mutableCopyWithZone:](&v11, sel_mutableCopyWithZone_);
  v6 = (void *)-[NSDictionary mutableCopyWithZone:](self->_data, "mutableCopyWithZone:", a3);
  objc_msgSend(v5, "setData:", v6);

  v7 = (void *)-[NSArray mutableCopyWithZone:](self->_files, "mutableCopyWithZone:", a3);
  objc_msgSend(v5, "setFiles:", v7);

  v8 = (void *)-[NSArray mutableCopyWithZone:](self->_fileSandboxTokens, "mutableCopyWithZone:", a3);
  objc_msgSend(v5, "setFileSandboxTokens:", v8);

  objc_msgSend(v5, "setStatusCode:", self->_statusCode);
  v9 = (void *)-[NSArray mutableCopyWithZone:](self->_uploadStatus, "mutableCopyWithZone:", a3);
  objc_msgSend(v5, "setUploadStatus:", v9);

  return v5;
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
  objc_storeStrong((id *)&self->_statusCode, a3);
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSArray)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
  objc_storeStrong((id *)&self->_files, a3);
}

- (NSArray)fileSandboxTokens
{
  return self->_fileSandboxTokens;
}

- (void)setFileSandboxTokens:(id)a3
{
  objc_storeStrong((id *)&self->_fileSandboxTokens, a3);
}

- (NSArray)uploadStatus
{
  return self->_uploadStatus;
}

- (void)setUploadStatus:(id)a3
{
  objc_storeStrong((id *)&self->_uploadStatus, a3);
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
