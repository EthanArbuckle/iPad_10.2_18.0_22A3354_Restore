@implementation CRKFetchBooksOperation

- (CRKFetchBooksOperation)initWithBookLibraryProxy:(id)a3
{
  return -[CRKFetchBooksOperation initWithBookLibraryProxy:includeImages:](self, "initWithBookLibraryProxy:includeImages:", a3, 1);
}

- (CRKFetchBooksOperation)initWithBookLibraryProxy:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  CRKFetchBooksOperation *v11;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v9)
  {
    if (a5)
    {
      CRKErrorWithCodeAndUserInfo(2, &unk_24DA07CB0);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  if (!objc_msgSend(v9, "isValidWithError:", a5))
    goto LABEL_6;
  self = -[CRKFetchBooksOperation initWithBookLibraryProxy:includeImages:](self, "initWithBookLibraryProxy:includeImages:", v8, objc_msgSend(v10, "includeImages"));
  v11 = self;
LABEL_7:

  return v11;
}

- (CRKFetchBooksOperation)initWithBookLibraryProxy:(id)a3 includeImages:(BOOL)a4
{
  id v6;
  CRKFetchBooksOperation *v7;
  uint64_t v8;
  id mBookLibraryProxy;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKFetchBooksOperation;
  v7 = -[CRKFetchBooksOperation init](&v11, sel_init);
  if (v7)
  {
    v8 = MEMORY[0x219A226E8](v6);
    mBookLibraryProxy = v7->mBookLibraryProxy;
    v7->mBookLibraryProxy = (id)v8;

    v7->mIncludeImages = a4;
  }

  return v7;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  NSMutableArray *v3;
  NSMutableArray *mBooks;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  CRKParsePDFMetadataOperation *v31;
  void *v32;
  void *v33;
  void *v34;
  CRKParseBookMetadataOperation *v35;
  CRKFetchBooksOperation *v36;
  char *v37;
  CRKParsePDFMetadataOperation *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[5];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = (NSMutableArray *)objc_opt_new();
  mBooks = self->mBooks;
  self->mBooks = v3;

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  (*((void (**)(void))self->mBookLibraryProxy + 2))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (!v50)
  {

    goto LABEL_45;
  }
  v6 = 0;
  v49 = *(_QWORD *)v53;
  obj = v5;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v53 != v49)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v7);
      if (_CRKLogGeneral_onceToken_25 != -1)
        dispatch_once(&_CRKLogGeneral_onceToken_25, &__block_literal_global_78);
      v9 = _CRKLogGeneral_logObj_25;
      if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v57 = v8;
        _os_log_debug_impl(&dword_218C99000, v9, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
      }
      v10 = (void *)objc_opt_new();
      objc_msgSend(v8, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTitle:", v11);

      objc_msgSend(v8, "author");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAuthor:", v12);

      objc_msgSend(v10, "setType:", objc_msgSend(v8, "type"));
      if (objc_msgSend(v8, "type"))
        v13 = objc_msgSend(v8, "type") == 1;
      else
        v13 = 1;
      objc_msgSend(v10, "setHasChapters:", v13);
      objc_msgSend(v8, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPath:", v14);

      if (self->mIncludeImages)
      {
        v15 = (void *)MEMORY[0x24BDBCE50];
        objc_msgSend(v8, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByAppendingPathComponent:", CFSTR("iTunesArtwork"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dataWithContentsOfFile:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setImage:", v18);

      }
      objc_msgSend(v8, "storeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      if (v20)
      {
        v21 = (void *)MEMORY[0x24BDBCF48];
        v22 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v8, "storeIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("ibooks://storeid/%@"), v23);
        goto LABEL_19;
      }
      objc_msgSend(v8, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "length");

      if (v25)
      {
        v21 = (void *)MEMORY[0x24BDBCF48];
        v26 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v8, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("ibooks://assetid/%@"), v23);
LABEL_19:
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v21;
LABEL_20:
        objc_msgSend(v28, "URLWithString:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      objc_msgSend(v8, "legacyUniqueIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "length");

      v43 = (void *)MEMORY[0x24BDBCF48];
      v44 = (void *)MEMORY[0x24BDD17C8];
      if (v42)
      {
        objc_msgSend(v8, "legacyUniqueIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringWithFormat:", CFSTR("ibooks://assetid/%@"), v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v43;
        goto LABEL_20;
      }
      objc_msgSend(v8, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringWithFormat:", CFSTR("ibooks://filename/%@"), v27);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "URLWithString:", v45);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
      objc_msgSend(v10, "setWebURL:", v29);
      -[NSMutableArray addObject:](self->mBooks, "addObject:", v10);
      objc_msgSend(v10, "title");
      v30 = objc_claimAutoreleasedReturnValue();
      if (!v30)
        goto LABEL_27;
      v31 = (CRKParsePDFMetadataOperation *)v30;
      objc_msgSend(v10, "author");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v32)
      {

LABEL_27:
        if (objc_msgSend(v8, "type") && objc_msgSend(v8, "type") != 1)
        {
          v38 = [CRKParsePDFMetadataOperation alloc];
          objc_msgSend(v8, "path");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = -[CRKParsePDFMetadataOperation initWithPDFBook:filePath:parseImage:](v38, "initWithPDFBook:filePath:parseImage:", v10, v39, self->mIncludeImages);

          v35 = (CRKParseBookMetadataOperation *)v31;
          v36 = self;
          v37 = sel_parsePDFMetadataOperationDidFail_;
        }
        else
        {
          v35 = -[CRKParseBookMetadataOperation initWithBook:parseImage:]([CRKParseBookMetadataOperation alloc], "initWithBook:parseImage:", v10, self->mIncludeImages);
          v31 = (CRKParsePDFMetadataOperation *)v35;
          v36 = self;
          v37 = sel_parseBookMetadataOperationDidFail_;
        }
        -[CRKParseBookMetadataOperation addTarget:selector:forOperationEvents:](v35, "addTarget:selector:forOperationEvents:", v36, v37, 4);
        objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addOperation:", v31);

        if (!v6)
        {
          v51[0] = MEMORY[0x24BDAC760];
          v51[1] = 3221225472;
          v51[2] = __30__CRKFetchBooksOperation_main__block_invoke;
          v51[3] = &unk_24D9C7020;
          v51[4] = self;
          objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v51);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v6, "addDependency:", v31);
        goto LABEL_34;
      }
      v33 = v32;
      if (self->mIncludeImages)
      {
        objc_msgSend(v10, "image");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
          goto LABEL_35;
        goto LABEL_27;
      }

LABEL_34:
LABEL_35:

      ++v7;
    }
    while (v50 != v7);
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    v50 = v46;
  }
  while (v46);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addOperation:", v6);

    return;
  }
LABEL_45:
  -[CRKFetchBooksOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", self->mBooks);
}

uint64_t __30__CRKFetchBooksOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384));
}

- (void)parseBookMetadataOperationDidFail:(id)a3
{
  NSMutableArray *mBooks;
  id v4;

  mBooks = self->mBooks;
  objc_msgSend(a3, "book");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](mBooks, "removeObject:", v4);

}

- (void)parsePDFMetadataOperationDidFail:(id)a3
{
  NSMutableArray *mBooks;
  id v4;

  mBooks = self->mBooks;
  objc_msgSend(a3, "book");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](mBooks, "removeObject:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBooks, 0);
  objc_storeStrong(&self->mBookLibraryProxy, 0);
}

@end
