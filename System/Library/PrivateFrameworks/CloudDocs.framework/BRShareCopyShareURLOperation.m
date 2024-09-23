@implementation BRShareCopyShareURLOperation

- (BRShareCopyShareURLOperation)initWithShare:(id)a3 fileURL:(id)a4 documentType:(id)a5
{
  id v7;
  BRShareCopyShareURLOperation *v8;
  BRShareCopyShareURLOperation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRShareCopyShareURLOperation;
  v8 = -[BRShareOperation initWithURL:](&v11, sel_initWithURL_, a4);
  v9 = v8;
  if (v8)
    -[BRShareCopyShareURLOperation setShare:](v8, "setShare:", v7);

  return v9;
}

- (BRShareCopyShareURLOperation)initWithShare:(id)a3 documentType:(id)a4
{
  id v6;
  id v7;
  BRShareCopyShareURLOperation *v8;
  BRShareCopyShareURLOperation *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    br_shareAssociatedURL(v6);
    v8 = (BRShareCopyShareURLOperation *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[BRShareCopyShareURLOperation initWithShare:fileURL:documentType:](self, "initWithShare:fileURL:documentType:", v6, v8, v7);
    }
    else
    {
      brc_bread_crumbs((uint64_t)"-[BRShareCopyShareURLOperation initWithShare:documentType:]", 897);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
        -[BRShareCopyShareURLOperation initWithShare:documentType:].cold.2();

      v9 = 0;
    }
    self = v8;
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRShareCopyShareURLOperation initWithShare:documentType:]", 891);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      -[BRShareCopyiWorkShareURLOperation initWithShare:].cold.1();

    v9 = 0;
  }

  return v9;
}

- (BRShareCopyShareURLOperation)initWithFileURL:(id)a3 documentType:(id)a4
{
  id v6;
  id v7;
  CKShare *v8;
  BRShareCreateShareOperation *v9;
  CKShare *share;
  NSError *error;
  BRShareCreateShareOperation *v12;
  BRShareCopyShareURLOperation *v13;
  BRShareCreateShareOperation *v15;

  v15 = 0;
  v6 = a4;
  v7 = a3;
  BRSharingCreateShareForItemAtURL(v7, &v15);
  v8 = (CKShare *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  share = self->_share;
  self->_share = v8;

  error = self->_error;
  self->_error = (NSError *)v9;
  v12 = v9;

  v13 = -[BRShareCopyShareURLOperation initWithShare:fileURL:documentType:](self, "initWithShare:fileURL:documentType:", self->_share, v7, v6);
  return v13;
}

- (BRShareCopyShareURLOperation)initWithShare:(id)a3 itemID:(id)a4
{
  id v6;
  BRShareCopyShareURLOperation *v7;
  BRShareCopyShareURLOperation *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRShareCopyShareURLOperation;
  v7 = -[BRShareOperation initWithItemIdentifier:](&v10, sel_initWithItemIdentifier_, a4);
  v8 = v7;
  if (v7)
    -[BRShareCopyShareURLOperation setShare:](v7, "setShare:", v6);

  return v8;
}

- (BRShareCopyShareURLOperation)initWithItemID:(id)a3
{
  id v4;
  CKShare *v5;
  BRShareCreateShareOperation *v6;
  CKShare *share;
  NSError *error;
  BRShareCreateShareOperation *v9;
  BRShareCopyShareURLOperation *v10;
  BRShareCreateShareOperation *v12;

  v12 = 0;
  v4 = a3;
  BRSharingCreateShareForItemWithIdentifier(v4, &v12);
  v5 = (CKShare *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  share = self->_share;
  self->_share = v5;

  error = self->_error;
  self->_error = (NSError *)v6;
  v9 = v6;

  v10 = -[BRShareCopyShareURLOperation initWithShare:itemID:](self, "initWithShare:itemID:", self->_share, v4);
  return v10;
}

- (void)main
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: No share and no error%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __36__BRShareCopyShareURLOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("share"));
    objc_msgSend(*(id *)(a1 + 32), "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    br_setShareAssociatedURL(v13, v10);

    objc_msgSend(v13, "baseToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "setBaseToken:", v11);

    objc_msgSend(v13, "publicSharingIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "setPublicSharingIdentity:", v12);

  }
  if (v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("url"));
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", v9, v8);

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[BRShareCopyShareURLOperation shareCopyURLCompletionBlock](self, "shareCopyURLCompletionBlock");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("share"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, id))v8)[2](v8, v9, v10, v7);

    -[BRShareCopyShareURLOperation setShareCopyURLCompletionBlock:](self, "setShareCopyURLCompletionBlock:", 0);
  }

  -[BRShareCopyShareURLOperation copyShareURLCompletionBlock](self, "copyShareURLCompletionBlock");
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v11)[2](v11, v12, v7);

    -[BRShareCopyShareURLOperation setCopyShareURLCompletionBlock:](self, "setCopyShareURLCompletionBlock:", 0);
  }

  v13.receiver = self;
  v13.super_class = (Class)BRShareCopyShareURLOperation;
  -[BROperation finishWithResult:error:](&v13, sel_finishWithResult_error_, v6, v7);

}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
  objc_storeStrong((id *)&self->_share, a3);
}

- (id)shareCopyURLCompletionBlock
{
  return objc_getProperty(self, a2, 368, 1);
}

- (void)setShareCopyURLCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 368);
}

- (id)copyShareURLCompletionBlock
{
  return objc_getProperty(self, a2, 376, 1);
}

- (void)setCopyShareURLCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 376);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_copyShareURLCompletionBlock, 0);
  objc_storeStrong(&self->_shareCopyURLCompletionBlock, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_share, 0);
}

- (void)initWithShare:documentType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_0(&dword_19CBF0000, v0, v1, "[ERROR] CKShare wasn't returned by BRShareCopyShareOperation%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
