@implementation BRShareSaveOperation

- (BRShareSaveOperation)initWithShare:(id)a3
{
  id v4;
  BRShareSaveOperation *v5;
  BRShareSaveOperation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRShareSaveOperation;
  v5 = -[BRShareOperation initWithShare:](&v8, sel_initWithShare_, v4);
  v6 = v5;
  if (v5)
    -[BRShareSaveOperation setShare:](v5, "setShare:", v4);

  return v6;
}

- (BRShareSaveOperation)initWithShare:(id)a3 fileURL:(id)a4
{
  id v6;
  BRShareSaveOperation *v7;
  BRShareSaveOperation *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRShareSaveOperation;
  v7 = -[BRShareOperation initWithURL:](&v10, sel_initWithURL_, a4);
  v8 = v7;
  if (v7)
    -[BRShareSaveOperation setShare:](v7, "setShare:", v6);

  return v8;
}

- (void)main
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[BRShareOperation remoteObject](self, "remoteObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[CKShare copy](self->_share, "copy");
  br_setShareAssociatedURL(v4, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__BRShareSaveOperation_main__block_invoke;
  v5[3] = &unk_1E3DA4C20;
  v5[4] = self;
  objc_msgSend(v3, "startOperation:toSaveSharingInfo:reply:", self, v4, v5);

}

void __28__BRShareSaveOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v8 = a2;
  objc_msgSend(v5, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  br_setShareAssociatedURL(v8, v7);

  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", v8, v6);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  -[BRShareSaveOperation shareSaveCompletionBlock](self, "shareSaveCompletionBlock");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    -[BRShareSaveOperation setShareSaveCompletionBlock:](self, "setShareSaveCompletionBlock:", 0);
  }

  v10.receiver = self;
  v10.super_class = (Class)BRShareSaveOperation;
  -[BROperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v6, v7);

}

+ (BOOL)shouldRetryShareSaveOnError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("BRCloudDocsErrorDomain"));

  if (!v6)
  {
    objc_msgSend(v4, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    getCKErrorDomain();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", v11))
    {
      v12 = objc_msgSend(v4, "code");

      if (v12 == 14)
      {
LABEL_23:
        v9 = 1;
        goto LABEL_24;
      }
    }
    else
    {

    }
    objc_msgSend(v4, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    getCKErrorDomain();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", v14))
    {
      v15 = objc_msgSend(v4, "code");

      if (v15 != 2)
      {
LABEL_22:
        v9 = 0;
        goto LABEL_24;
      }
      objc_msgSend(v4, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      getCKPartialErrorsByItemIDKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(v13, "objectEnumerator", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v30 != v20)
              objc_enumerationMutation(v14);
            v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v22, "domain");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            getCKErrorDomain();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "isEqualToString:", v24))
            {
              v25 = objc_msgSend(v22, "code");

              if (v25 == 14)
              {

                goto LABEL_23;
              }
            }
            else
            {

            }
          }
          v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v19);
      }
    }

    goto LABEL_22;
  }
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    brc_bread_crumbs((uint64_t)"+[BRShareSaveOperation shouldRetryShareSaveOnError:]", 517);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      +[BRShareSaveOperation shouldRetryShareSaveOnError:].cold.1();

  }
  v9 = objc_msgSend(a1, "shouldRetryShareSaveOnError:", v8);

LABEL_24:
  return v9;
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
  objc_storeStrong((id *)&self->_share, a3);
}

- (id)shareSaveCompletionBlock
{
  return objc_getProperty(self, a2, 352, 1);
}

- (void)setShareSaveCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 352);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareSaveCompletionBlock, 0);
  objc_storeStrong((id *)&self->_share, 0);
}

+ (void)shouldRetryShareSaveOnError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: error != underlyingError%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
