@implementation CRKUnzipOperation

- (CRKUnzipOperation)initWithZipFileURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CRKUnzipOperation *v7;

  v4 = (void *)MEMORY[0x24BDBCF48];
  v5 = a3;
  objc_msgSend(v4, "crk_uniqueTemporaryDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CRKUnzipOperation initWithZipFileURL:destinationDirectoryURL:](self, "initWithZipFileURL:destinationDirectoryURL:", v5, v6);

  return v7;
}

- (CRKUnzipOperation)initWithZipFileURL:(id)a3 destinationDirectoryURL:(id)a4
{
  id v8;
  id v9;
  void *v10;
  CRKUnzipOperation *v11;
  CRKUnzipOperation *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKUnzipOperation.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zipFileURL"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKUnzipOperation.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationDirectoryURL"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)CRKUnzipOperation;
  v11 = -[CRKUnzipOperation init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_zipFileURL, a3);
    objc_storeStrong((id *)&v12->_destinationDirectoryURL, a4);
  }

  return v12;
}

- (void)cancel
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void soft_BOMCopierCancelCopy(BOMCopier)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("CRKUnzipOperation.m"), 23, CFSTR("%s"), OUTLINED_FUNCTION_0_8());

  __break(1u);
}

- (void)operationWillFinish
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void soft_BOMCopierFree(BOMCopier)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("CRKUnzipOperation.m"), 22, CFSTR("%s"), OUTLINED_FUNCTION_0_8());

  __break(1u);
}

- (void)main
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "int soft_BOMCopierCopyWithOptions(BOMCopier, const char *, const char *, CFDictionaryRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("CRKUnzipOperation.m"), 29, CFSTR("%s"), OUTLINED_FUNCTION_0_8());

  __break(1u);
}

- (void)setStashedError:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_stashedError)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_stashedError, a3);
    v5 = v6;
  }

}

+ (id)errorFromBOMCopierStatus:(int)a3 message:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  _QWORD v33[4];

  v33[3] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = v5;
  v7 = a3 + 1;
  v8 = 0;
  switch(v7)
  {
    case 0:
      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = *MEMORY[0x24BDD1128];
      if (!v5)
      {
        v21 = (void *)MEMORY[0x24BDD1540];
        v20 = (const __CFString *)*MEMORY[0x24BDD1128];
        v22 = -1;
        goto LABEL_19;
      }
      v32 = *MEMORY[0x24BDD0FC8];
      v33[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, -1, v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_21;
    case 1:
      goto LABEL_21;
    case 2:
      v12 = (void *)MEMORY[0x24BDD1540];
      if (v5)
      {
        v30 = *MEMORY[0x24BDD0FC8];
        v31 = v5;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v12;
        v15 = 1;
        goto LABEL_13;
      }
      v20 = CFSTR("BOMCopierErrorDomain");
      v21 = (void *)MEMORY[0x24BDD1540];
      v22 = 1;
      goto LABEL_19;
    case 3:
      v18 = (void *)MEMORY[0x24BDD1540];
      if (v5)
      {
        v28 = *MEMORY[0x24BDD0FC8];
        v29 = v5;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v18;
        v15 = 2;
        goto LABEL_13;
      }
      v20 = CFSTR("BOMCopierErrorDomain");
      v21 = (void *)MEMORY[0x24BDD1540];
      v22 = 2;
      goto LABEL_19;
    case 4:
      v16 = (void *)MEMORY[0x24BDD1540];
      if (v5)
      {
        v26 = *MEMORY[0x24BDD0FC8];
        v27 = v5;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v16;
        v15 = 3;
        goto LABEL_13;
      }
      v20 = CFSTR("BOMCopierErrorDomain");
      v21 = (void *)MEMORY[0x24BDD1540];
      v22 = 3;
      goto LABEL_19;
    case 5:
      v19 = (void *)MEMORY[0x24BDD1540];
      if (v5)
      {
        v24 = *MEMORY[0x24BDD0FC8];
        v25 = v5;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v19;
        v15 = 4;
LABEL_13:
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("BOMCopierErrorDomain"), v15, v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = CFSTR("BOMCopierErrorDomain");
        v21 = (void *)MEMORY[0x24BDD1540];
        v22 = 4;
LABEL_19:
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", v20, v22, 0);
        v17 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v8 = (void *)v17;
      }
LABEL_21:

      return v8;
    default:
      CRKErrorWithCodeAndUserInfo(1, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
  }
}

- (NSURL)zipFileURL
{
  return self->_zipFileURL;
}

- (NSURL)destinationDirectoryURL
{
  return self->_destinationDirectoryURL;
}

- (_BOMCopier)copier
{
  return self->_copier;
}

- (void)setCopier:(_BOMCopier *)a3
{
  self->_copier = a3;
}

- (NSError)stashedError
{
  return self->_stashedError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stashedError, 0);
  objc_storeStrong((id *)&self->_destinationDirectoryURL, 0);
  objc_storeStrong((id *)&self->_zipFileURL, 0);
}

@end
