@implementation CRKFileBackedMarker

- (CRKFileBackedMarker)init
{
  void *v3;
  CRKFileBackedMarker *v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "crk_uniqueTemporaryFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CRKFileBackedMarker initWithFileURL:](self, "initWithFileURL:", v3);

  return v4;
}

- (CRKFileBackedMarker)initWithFileURL:(id)a3
{
  id v6;
  CRKFileBackedMarker *v7;
  CRKFileBackedMarker *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if ((objc_msgSend(v6, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKFileBackedMarker.m"), 26, CFSTR("File URL must point to a file"));

  }
  v11.receiver = self;
  v11.super_class = (Class)CRKFileBackedMarker;
  v7 = -[CRKFileBackedMarker init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->mFileURL, a3);

  return v8;
}

- (BOOL)exists
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->mFileURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, 0);

  return v5;
}

- (BOOL)createWithError:(id *)a3
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;

  if (-[CRKFileBackedMarker exists](self, "exists"))
    return 1;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByDeletingLastPathComponent](self->mFileURL, "URLByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, a3);

  if (!v8)
    return 0;
  v9 = (void *)objc_opt_new();
  v10 = objc_msgSend(v9, "writeToURL:options:error:", self->mFileURL, 1, a3);

  return v10;
}

- (BOOL)deleteWithError:(id *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "crk_safeRemoveItemAtURL:error:", self->mFileURL, a3);

  return (char)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFileURL, 0);
}

@end
