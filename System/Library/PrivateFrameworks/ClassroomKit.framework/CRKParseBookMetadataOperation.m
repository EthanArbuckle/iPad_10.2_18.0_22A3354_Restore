@implementation CRKParseBookMetadataOperation

- (CRKParseBookMetadataOperation)initWithBook:(id)a3 parseImage:(BOOL)a4
{
  id v7;
  CRKParseBookMetadataOperation *v8;
  CRKParseBookMetadataOperation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKParseBookMetadataOperation;
  v8 = -[CRKParseBookMetadataOperation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_book, a3);
    v9->mParseImage = a4;
  }

  return v9;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  CRKParseOPFFilePathOperation *v3;
  void *v4;
  void *v5;
  void *v6;
  CRKParseOPFFilePathOperation *v7;

  v3 = [CRKParseOPFFilePathOperation alloc];
  -[CRKParseBookMetadataOperation book](self, "book");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CRKParseOPFFilePathOperation initWithBookFilePath:](v3, "initWithBookFilePath:", v5);

  -[CRKParseOPFFilePathOperation addTarget:selector:forOperationEvents:](v7, "addTarget:selector:forOperationEvents:", self, sel_parseContentsFilePathOperationDidFinish_, 6);
  objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v7);

}

- (void)parseContentsFilePathOperationDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CRKParseOPFPackageContentsOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CRKParseOPFPackageContentsOperation *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v17, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKParseBookMetadataOperation endOperationWithError:](self, "endOperationWithError:", v5);

  }
  else
  {
    objc_msgSend(v17, "resultObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [CRKParseOPFPackageContentsOperation alloc];
      objc_msgSend(v17, "resultObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKParseBookMetadataOperation book](self, "book");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "webURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "host");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKParseBookMetadataOperation book](self, "book");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "webURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[CRKParseOPFPackageContentsOperation initWithOPFFilePath:identifierType:identifier:](v7, "initWithOPFFilePath:identifierType:identifier:", v8, v11, v14);

      -[CRKParseOPFPackageContentsOperation addTarget:selector:forOperationEvents:](v15, "addTarget:selector:forOperationEvents:", self, sel_parseBookContentsOperationDidFinish_, 6);
      objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addOperation:", v15);

    }
    else
    {
      -[CRKParseBookMetadataOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", MEMORY[0x24BDBD1A8]);
    }
  }

}

- (void)parseBookContentsOperationDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "error");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[CRKParseBookMetadataOperation endOperationWithError:](self, "endOperationWithError:", v14);
  }
  else
  {
    objc_msgSend(v4, "resultObject");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v14, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKParseBookMetadataOperation updateTitle:](self, "updateTitle:", v7);

      objc_msgSend(v14, "author");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKParseBookMetadataOperation updateAuthor:](self, "updateAuthor:", v8);

      if (self->mParseImage)
      {
        v9 = (void *)MEMORY[0x24BDBCE50];
        objc_msgSend(v14, "coverImagePath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dataWithContentsOfFile:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRKParseBookMetadataOperation book](self, "book");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setImage:", v11);

      }
      -[CRKParseBookMetadataOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }
    else
    {
      CATErrorWithCodeAndUserInfo();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKParseBookMetadataOperation endOperationWithError:](self, "endOperationWithError:", v13);

    }
  }

}

- (void)updateTitle:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[CRKParseBookMetadataOperation book](self, "book");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v4);

  }
}

- (void)updateAuthor:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[CRKParseBookMetadataOperation book](self, "book");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAuthor:", v4);

  }
}

- (CRKBook)book
{
  return self->_book;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_book, 0);
}

@end
