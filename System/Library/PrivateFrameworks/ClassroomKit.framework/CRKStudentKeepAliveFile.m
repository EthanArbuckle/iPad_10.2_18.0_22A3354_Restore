@implementation CRKStudentKeepAliveFile

- (CRKStudentKeepAliveFile)init
{
  CRKStudentKeepAliveFile *v2;
  CRKFileBackedMarker *v3;
  void *v4;
  uint64_t v5;
  CRKMarker *fileMarker;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRKStudentKeepAliveFile;
  v2 = -[CRKStudentKeepAliveFile init](&v8, sel_init);
  if (v2)
  {
    v3 = [CRKFileBackedMarker alloc];
    objc_msgSend((id)objc_opt_class(), "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CRKFileBackedMarker initWithFileURL:](v3, "initWithFileURL:", v4);
    fileMarker = v2->_fileMarker;
    v2->_fileMarker = (CRKMarker *)v5;

  }
  return v2;
}

- (BOOL)exists
{
  void *v2;
  char v3;

  -[CRKStudentKeepAliveFile fileMarker](self, "fileMarker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "exists");

  return v3;
}

- (BOOL)createWithError:(id *)a3
{
  void *v4;

  -[CRKStudentKeepAliveFile fileMarker](self, "fileMarker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "createWithError:", a3);

  return (char)a3;
}

- (BOOL)deleteWithError:(id *)a3
{
  void *v4;

  -[CRKStudentKeepAliveFile fileMarker](self, "fileMarker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "deleteWithError:", a3);

  return (char)a3;
}

+ (id)fileURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1580], "crk_nonContainerizedHomeDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Library/studentd/isConnected"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CRKMarker)fileMarker
{
  return self->_fileMarker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileMarker, 0);
}

@end
