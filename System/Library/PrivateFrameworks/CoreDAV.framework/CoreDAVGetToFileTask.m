@implementation CoreDAVGetToFileTask

- (CoreDAVGetToFileTask)initWithURL:(id)a3 destinationFile:(id)a4
{
  id v7;
  CoreDAVGetToFileTask *v8;
  CoreDAVGetToFileTask *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CoreDAVGetToFileTask;
  v8 = -[CoreDAVTask initWithURL:](&v11, sel_initWithURL_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_destinationFile, a4);

  return v9;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  CoreDAVOctetStreamToFileParser *v4;
  void *v5;
  CoreDAVOctetStreamToFileParser *v6;

  v4 = [CoreDAVOctetStreamToFileParser alloc];
  -[CoreDAVGetToFileTask destinationFile](self, "destinationFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CoreDAVOctetStreamToFileParser initWithFileHandle:](v4, "initWithFileHandle:", v5);

  return v6;
}

- (BOOL)shouldLogResponseBody
{
  return 0;
}

- (NSFileHandle)destinationFile
{
  return self->_destinationFile;
}

- (void)setDestinationFile:(id)a3
{
  objc_storeStrong((id *)&self->_destinationFile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationFile, 0);
}

@end
