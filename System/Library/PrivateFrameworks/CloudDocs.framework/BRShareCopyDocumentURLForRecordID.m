@implementation BRShareCopyDocumentURLForRecordID

- (BRShareCopyDocumentURLForRecordID)initWithRecordID:(id)a3 withServerLookup:(BOOL)a4
{
  id v7;
  BRShareCopyDocumentURLForRecordID *v8;
  BRShareCopyDocumentURLForRecordID *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRShareCopyDocumentURLForRecordID;
  v8 = -[BRShareOperation initWithDirectConnection](&v11, sel_initWithDirectConnection);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recordID, a3);
    v9->_withServerLookup = a4;
  }

  return v9;
}

- (BRShareCopyDocumentURLForRecordID)initWithRecordID:(id)a3 fileURL:(id)a4 withServerLookup:(BOOL)a5
{
  id v8;
  BRShareCopyDocumentURLForRecordID *v9;
  BRShareCopyDocumentURLForRecordID *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRShareCopyDocumentURLForRecordID;
  v9 = -[BRShareOperation initWithDirectConnection](&v12, sel_initWithDirectConnection);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordID, a3);
    v10->_withServerLookup = a5;
  }

  return v10;
}

- (void)main
{
  uint64_t v3;
  int v4;
  const char *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 344);
  v4 = *(unsigned __int8 *)(a1 + 352);
  v6 = 138412802;
  if (v4)
    v5 = "Yes";
  else
    v5 = "No";
  v7 = v3;
  v8 = 2080;
  v9 = v5;
  v10 = 2112;
  v11 = a2;
  _os_log_debug_impl(&dword_19CBF0000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] copying document url for '%@' server lookup:%s%@", (uint8_t *)&v6, 0x20u);
}

void __41__BRShareCopyDocumentURLForRecordID_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "url");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completedWithResult:error:", v6, v5);

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
  -[BRShareCopyDocumentURLForRecordID copyDocumentURLCompletionBlock](self, "copyDocumentURLCompletionBlock");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    -[BRShareCopyDocumentURLForRecordID setCopyDocumentURLCompletionBlock:](self, "setCopyDocumentURLCompletionBlock:", 0);
  }

  v10.receiver = self;
  v10.super_class = (Class)BRShareCopyDocumentURLForRecordID;
  -[BROperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v6, v7);

}

- (id)copyDocumentURLCompletionBlock
{
  return objc_getProperty(self, a2, 360, 1);
}

- (void)setCopyDocumentURLCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 360);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_copyDocumentURLCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
