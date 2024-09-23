@implementation CoreDAVOctetStreamToFileParser

- (CoreDAVOctetStreamToFileParser)initWithFileHandle:(id)a3
{
  id v4;
  CoreDAVOctetStreamToFileParser *v5;
  CoreDAVOctetStreamToFileParser *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVOctetStreamToFileParser;
  v5 = -[CoreDAVOctetStreamParser init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[CoreDAVOctetStreamToFileParser setFileHandle:](v5, "setFileHandle:", v4);

  return v6;
}

- (BOOL)processData:(id)a3 forTask:(id)a4
{
  id v5;
  void *v6;

  if (a3)
  {
    v5 = a3;
    -[CoreDAVOctetStreamToFileParser fileHandle](self, "fileHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "writeData:", v5);

  }
  return 1;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_fileHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
}

@end
