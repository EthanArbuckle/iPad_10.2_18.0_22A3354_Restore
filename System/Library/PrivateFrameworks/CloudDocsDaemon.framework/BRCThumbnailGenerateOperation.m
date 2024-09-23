@implementation BRCThumbnailGenerateOperation

- (BRCThumbnailGenerateOperation)initWithDocumentAtURL:(id)a3 targetURL:(id)a4 timeout:(id)a5 sessionContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BRCThumbnailGenerateOperation *v18;
  void *v19;
  uint64_t v20;
  BRCTapToRadarManager *tapToRadarManager;
  void *v22;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v11, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("thumbnail-generate/%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v24.receiver = self;
  v24.super_class = (Class)BRCThumbnailGenerateOperation;
  v18 = -[_BRCOperation initWithName:](&v24, sel_initWithName_, v17);
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0C94F88], "br_operationGroupWithName:", CFSTR("ThumbnailGenerate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v18, "setGroup:", v19);

    objc_storeStrong((id *)&v18->_url, a3);
    objc_storeStrong((id *)&v18->_targetURL, a4);
    objc_msgSend(v14, "tapToRadarManager");
    v20 = objc_claimAutoreleasedReturnValue();
    tapToRadarManager = v18->_tapToRadarManager;
    v18->_tapToRadarManager = (BRCTapToRadarManager *)v20;

    if (v13)
    {
      objc_msgSend(v13, "doubleValue");
      -[_BRCOperation setTimeout:](v18, "setTimeout:");
    }
    else
    {
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "thumbnailGenerationOperationTimeout");
      -[_BRCOperation setTimeout:](v18, "setTimeout:");

    }
  }

  return v18;
}

- (void)main
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _url && _targetURL%@", (uint8_t *)&v2, 0xCu);
}

void __37__BRCThumbnailGenerateOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(v6 + 504);
    v8 = *(_QWORD *)(v6 + 520);
    v9 = 138413058;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    v15 = 2112;
    v16 = v4;
    _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Saved the thumbnail of %@ to %@ with error %@%@", (uint8_t *)&v9, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v3);
}

- (void)cancel
{
  void *v3;
  uint64_t v4;
  void *v5;
  BRCTapToRadarManager *tapToRadarManager;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  id saveThumbnailCompletionBlock;
  objc_super v11;

  if (-[_BRCOperation timedOut](self, "timedOut"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[_BRCOperation timeout](self, "timeout");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Thumbnail generation operation got timeouted after %fs"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    tapToRadarManager = self->_tapToRadarManager;
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorThumbnailGenerationOperationTimedOut");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCTapToRadarManager requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:](tapToRadarManager, "requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:", v5, CFSTR("Possible issue in QL, Thumbnail generation operation was running for too long"), MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, CFSTR("thumbnail generation encountered an error"), v7);

  }
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A6DB0](self->_saveThumbnailCompletionBlock);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorOperationCancelled");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v9);

    saveThumbnailCompletionBlock = self->_saveThumbnailCompletionBlock;
    self->_saveThumbnailCompletionBlock = 0;

  }
  v11.receiver = self;
  v11.super_class = (Class)BRCThumbnailGenerateOperation;
  -[_BRCOperation cancel](&v11, sel_cancel);
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id saveThumbnailCompletionBlock;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  objc_super v12;

  v6 = a4;
  saveThumbnailCompletionBlock = self->_saveThumbnailCompletionBlock;
  v8 = a3;
  v9 = MEMORY[0x1D17A6DB0](saveThumbnailCompletionBlock);
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
    v11 = self->_saveThumbnailCompletionBlock;
    self->_saveThumbnailCompletionBlock = 0;

  }
  v12.receiver = self;
  v12.super_class = (Class)BRCThumbnailGenerateOperation;
  -[_BRCOperation finishWithResult:error:](&v12, sel_finishWithResult_error_, v8, v6);

}

- (NSURL)targetURL
{
  return self->_targetURL;
}

- (id)saveThumbnailCompletionBlock
{
  return self->_saveThumbnailCompletionBlock;
}

- (void)setSaveThumbnailCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_saveThumbnailCompletionBlock, 0);
  objc_storeStrong((id *)&self->_targetURL, 0);
  objc_storeStrong((id *)&self->_tapToRadarManager, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
