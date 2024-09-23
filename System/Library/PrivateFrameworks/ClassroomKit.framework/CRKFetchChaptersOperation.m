@implementation CRKFetchChaptersOperation

- (CRKFetchChaptersOperation)initWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CRKFetchChaptersOperation *v11;

  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      CRKErrorWithCodeAndUserInfo(2, &unk_24DA07E40);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  if (!objc_msgSend(v6, "isValidWithError:", a4))
    goto LABEL_6;
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifierType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[CRKFetchChaptersOperation initWithBookPath:identifierType:identifier:](self, "initWithBookPath:identifierType:identifier:", v8, v9, v10);

  v11 = self;
LABEL_7:

  return v11;
}

- (CRKFetchChaptersOperation)initWithBook:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CRKFetchChaptersOperation *v11;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKFetchChaptersOperation.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("book"));

  }
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CRKFetchChaptersOperation initWithBookPath:identifierType:identifier:](self, "initWithBookPath:identifierType:identifier:", v6, v8, v10);

  return v11;
}

- (CRKFetchChaptersOperation)initWithBookPath:(id)a3 identifierType:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRKFetchChaptersOperation *v12;
  uint64_t v13;
  NSString *mPath;
  uint64_t v15;
  NSString *mIdentifierType;
  uint64_t v17;
  NSString *mIdentifier;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKFetchChaptersOperation.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifierType"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKFetchChaptersOperation.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKFetchChaptersOperation.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_4:
  v23.receiver = self;
  v23.super_class = (Class)CRKFetchChaptersOperation;
  v12 = -[CRKFetchChaptersOperation init](&v23, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    mPath = v12->mPath;
    v12->mPath = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    mIdentifierType = v12->mIdentifierType;
    v12->mIdentifierType = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    mIdentifier = v12->mIdentifier;
    v12->mIdentifier = (NSString *)v17;

  }
  return v12;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  void *v3;
  CRKParseOPFFilePathOperation *v4;

  v4 = -[CRKParseOPFFilePathOperation initWithBookFilePath:]([CRKParseOPFFilePathOperation alloc], "initWithBookFilePath:", self->mPath);
  -[CRKParseOPFFilePathOperation addTarget:selector:forOperationEvents:](v4, "addTarget:selector:forOperationEvents:", self, sel_parseOPFFilePathOperationDidFinish_, 6);
  objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addOperation:", v4);

}

- (void)parseOPFFilePathOperationDidFinish:(id)a3
{
  void *v4;
  CRKParseOPFPackageContentsOperation *v5;
  void *v6;
  CRKParseOPFPackageContentsOperation *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v10, "error");
    v5 = (CRKParseOPFPackageContentsOperation *)objc_claimAutoreleasedReturnValue();
    -[CRKFetchChaptersOperation endOperationWithError:](self, "endOperationWithError:", v5);
  }
  else
  {
    objc_msgSend(v10, "resultObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[CRKFetchChaptersOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", MEMORY[0x24BDBD1A8]);
      goto LABEL_6;
    }
    v7 = [CRKParseOPFPackageContentsOperation alloc];
    objc_msgSend(v10, "resultObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CRKParseOPFPackageContentsOperation initWithOPFFilePath:identifierType:identifier:](v7, "initWithOPFFilePath:identifierType:identifier:", v8, self->mIdentifierType, self->mIdentifier);

    -[CRKParseOPFPackageContentsOperation addTarget:selector:forOperationEvents:](v5, "addTarget:selector:forOperationEvents:", self, sel_parseOFPPackageContentsOperationDidFinish_, 6);
    objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addOperation:", v5);

  }
LABEL_6:

}

- (void)parseOFPPackageContentsOperationDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  __objc2_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v14, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKFetchChaptersOperation endOperationWithError:](self, "endOperationWithError:", v5);
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v14, "resultObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v14, "resultObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tableOfContentsMediaType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("application/x-dtbncx+xml"));

    if (v8)
      v9 = CRKParseNCXTableOfContentsOperation;
    else
      v9 = CRKParseHTMLTableOfContentsOperation;
    v10 = [v9 alloc];
    objc_msgSend(v5, "tableOfContentsFilePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFilePath:packageContents:", v11, v5);

    objc_msgSend(v12, "addTarget:selector:forOperationEvents:", self, sel_parseTableOfContentsOperationDidFinish_, 6);
    objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addOperation:", v12);

    goto LABEL_9;
  }
  -[CRKFetchChaptersOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", MEMORY[0x24BDBD1A8]);
LABEL_10:

}

- (void)parseTableOfContentsOperationDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v7, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKFetchChaptersOperation endOperationWithError:](self, "endOperationWithError:", v5);
  }
  else
  {
    objc_msgSend(v7, "resultObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[CRKFetchChaptersOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", MEMORY[0x24BDBD1A8]);
      goto LABEL_6;
    }
    objc_msgSend(v7, "resultObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKFetchChaptersOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v5);
  }

LABEL_6:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mIdentifier, 0);
  objc_storeStrong((id *)&self->mIdentifierType, 0);
  objc_storeStrong((id *)&self->mPath, 0);
}

@end
