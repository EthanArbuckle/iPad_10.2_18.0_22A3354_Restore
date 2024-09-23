@implementation CRKFileWrapperBackedFileSystemNode

- (CRKFileWrapperBackedFileSystemNode)initWithFileWrapper:(id)a3
{
  return -[CRKFileWrapperBackedFileSystemNode initWithFileWrapper:parentFileWrapper:](self, "initWithFileWrapper:parentFileWrapper:", a3, 0);
}

- (CRKFileWrapperBackedFileSystemNode)initWithFileWrapper:(id)a3 parentFileWrapper:(id)a4
{
  id v7;
  id v8;
  CRKFileWrapperBackedFileSystemNode *v9;
  CRKFileWrapperBackedFileSystemNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKFileWrapperBackedFileSystemNode;
  v9 = -[CRKFileWrapperBackedFileSystemNode init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileWrapper, a3);
    objc_storeStrong((id *)&v10->_parentFileWrapper, a4);
  }

  return v10;
}

- (NSString)fileName
{
  void *v2;
  void *v3;

  -[CRKFileWrapperBackedFileSystemNode fileWrapper](self, "fileWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setFileName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKFileWrapperBackedFileSystemNode fileWrapper](self, "fileWrapper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilename:", v4);

}

- (int64_t)type
{
  void *v2;
  int64_t v3;

  -[CRKFileWrapperBackedFileSystemNode fileWrapper](self, "fileWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDirectory") ^ 1;

  return v3;
}

- (NSData)content
{
  void *v2;
  void *v3;

  -[CRKFileWrapperBackedFileSystemNode fileWrapper](self, "fileWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regularFileContents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSDictionary)children
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[CRKFileWrapperBackedFileSystemNode fileWrapper](self, "fileWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileWrappers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__CRKFileWrapperBackedFileSystemNode_children__block_invoke;
  v7[3] = &unk_24D9C9268;
  v7[4] = self;
  objc_msgSend(v4, "crk_mapToDictionary:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

void __46__CRKFileWrapperBackedFileSystemNode_children__block_invoke(uint64_t a1, void *a2, void *a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;
  id v10;
  CRKFileWrapperBackedFileSystemNode *v11;
  CRKFileWrapperBackedFileSystemNode *v12;
  id v13;

  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = [CRKFileWrapperBackedFileSystemNode alloc];
  objc_msgSend(*(id *)(a1 + 32), "fileWrapper");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = -[CRKFileWrapperBackedFileSystemNode initWithFileWrapper:parentFileWrapper:](v11, "initWithFileWrapper:parentFileWrapper:", v9, v13);

  ((void (**)(_QWORD, id, CRKFileWrapperBackedFileSystemNode *))a4)[2](v8, v10, v12);
}

- (id)addChildWithDescriptor:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  CRKFileWrapperBackedFileSystemNode *v14;
  void *v15;
  CRKFileWrapperBackedFileSystemNode *v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 == 1)
  {
    v8 = objc_alloc(MEMORY[0x24BDD1598]);
    objc_msgSend(v4, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "initRegularFileWithContents:", v9);

  }
  else
  {
    if (v5)
    {
      v16 = 0;
      goto LABEL_7;
    }
    v6 = objc_alloc(MEMORY[0x24BDD1598]);
    v7 = (void *)objc_msgSend(v6, "initDirectoryWithFileWrappers:", MEMORY[0x24BDBD1B8]);
  }
  objc_msgSend(v4, "fileName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilename:", v10);

  objc_msgSend(v4, "fileName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredFilename:", v11);

  -[CRKFileWrapperBackedFileSystemNode fileWrapper](self, "fileWrapper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "addFileWrapper:", v7);

  v14 = [CRKFileWrapperBackedFileSystemNode alloc];
  -[CRKFileWrapperBackedFileSystemNode fileWrapper](self, "fileWrapper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CRKFileWrapperBackedFileSystemNode initWithFileWrapper:parentFileWrapper:](v14, "initWithFileWrapper:parentFileWrapper:", v7, v15);

LABEL_7:
  return v16;
}

- (void)removeFromParent
{
  void *v3;
  id v4;

  -[CRKFileWrapperBackedFileSystemNode parentFileWrapper](self, "parentFileWrapper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKFileWrapperBackedFileSystemNode fileWrapper](self, "fileWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFileWrapper:", v3);

}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[CRKFileWrapperBackedFileSystemNode fileWrapper](self, "fileWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "writeToURL:options:originalContentsURL:error:", v6, 1, 0, a4))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x24BDD0C60];
    v14[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "setAttributes:ofItemAtPath:error:", v9, v10, a4);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSFileWrapper)fileWrapper
{
  return self->_fileWrapper;
}

- (NSFileWrapper)parentFileWrapper
{
  return self->_parentFileWrapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFileWrapper, 0);
  objc_storeStrong((id *)&self->_fileWrapper, 0);
}

@end
