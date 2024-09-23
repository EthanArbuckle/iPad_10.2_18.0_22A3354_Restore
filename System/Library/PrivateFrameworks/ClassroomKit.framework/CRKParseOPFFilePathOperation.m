@implementation CRKParseOPFFilePathOperation

- (CRKParseOPFFilePathOperation)initWithBookFilePath:(id)a3
{
  id v5;
  CRKParseOPFFilePathOperation *v6;
  CRKParseOPFFilePathOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKParseOPFFilePathOperation;
  v6 = -[CRKParseOPFFilePathOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->mBookFilePath, a3);

  return v7;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  NSXMLParser *v7;
  NSXMLParser *mContainerParser;
  id v9;

  -[NSString stringByAppendingPathComponent:](self->mBookFilePath, "stringByAppendingPathComponent:", CFSTR("META-INF/container.xml"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v9, 0);

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDD1978]);
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSXMLParser *)objc_msgSend(v5, "initWithContentsOfURL:", v6);
    mContainerParser = self->mContainerParser;
    self->mContainerParser = v7;

    -[NSXMLParser setDelegate:](self->mContainerParser, "setDelegate:", self);
    -[NSXMLParser parse](self->mContainerParser, "parse");
  }
  else
  {
    -[CRKParseOPFFilePathOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }

}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSString *mBookFilePath;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v10 = a7;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("rootfile")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("full-path"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("media-type"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("application/oebps-package+xml"));

      if (v14)
      {
        mBookFilePath = self->mBookFilePath;
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("full-path"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString stringByAppendingPathComponent:](mBookFilePath, "stringByAppendingPathComponent:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[CRKParseOPFFilePathOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v17);
        objc_msgSend(v18, "setDelegate:", 0);
        objc_msgSend(v18, "abortParsing");

      }
    }
  }

}

- (void)parserDidEndDocument:(id)a3
{
  -[CRKParseOPFFilePathOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  -[CRKParseOPFFilePathOperation endOperationWithError:](self, "endOperationWithError:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBookFilePath, 0);
  objc_storeStrong((id *)&self->mContainerParser, 0);
}

@end
