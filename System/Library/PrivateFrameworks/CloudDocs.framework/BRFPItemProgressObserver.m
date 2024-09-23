@implementation BRFPItemProgressObserver

- (NSNumber)uploadPercentCompleted
{
  void *uploadProgress;
  void *v3;
  double v4;

  uploadProgress = self->_uploadProgress;
  if (uploadProgress)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(uploadProgress, "fractionCompleted");
    objc_msgSend(v3, "numberWithDouble:", v4 * 100.0);
    uploadProgress = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)uploadProgress;
}

- (NSNumber)downloadPercentCompleted
{
  void *downloadProgress;
  void *v3;
  double v4;

  downloadProgress = self->_downloadProgress;
  if (downloadProgress)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(downloadProgress, "fractionCompleted");
    objc_msgSend(v3, "numberWithDouble:", v4 * 100.0);
    downloadProgress = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)downloadProgress;
}

- (BRFPItemProgressObserver)initWithFPItem:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  BRFPItemProgressObserver *v8;
  uint64_t v9;
  FPItemID *fpItemID;
  uint64_t v11;
  NSProgress *downloadProgress;
  uint64_t v13;
  NSProgress *uploadProgress;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BRFPItemProgressObserver;
  v8 = -[BRFPItemProgressObserver init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "itemID");
    v9 = objc_claimAutoreleasedReturnValue();
    fpItemID = v8->_fpItemID;
    v8->_fpItemID = (FPItemID *)v9;

    objc_storeStrong((id *)&v8->_queue, a4);
    objc_msgSend(v6, "downloadingProgress");
    v11 = objc_claimAutoreleasedReturnValue();
    downloadProgress = v8->_downloadProgress;
    v8->_downloadProgress = (NSProgress *)v11;

    objc_msgSend(v6, "uploadingProgress");
    v13 = objc_claimAutoreleasedReturnValue();
    uploadProgress = v8->_uploadProgress;
    v8->_uploadProgress = (NSProgress *)v13;

  }
  return v8;
}

- (id)description
{
  BRFPItemProgressObserver *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@, ulp:%@, dlp:%@>"), objc_opt_class(), v2, v2->_fpItemID, v2->_uploadProgress, v2->_downloadProgress);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (void)_startObservingProgress:(id)a3
{
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 5, 0);
}

- (void)updateWithFPItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSProgress *v7;
  NSProgress *downloadProgress;
  NSProgress *v9;
  NSProgress *v10;
  NSProgress *v11;
  NSProgress *uploadProgress;
  NSProgress *v13;
  NSProgress *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToItemID:", self->_fpItemID);

  if ((v6 & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"-[BRFPItemProgressObserver updateWithFPItem:]", 69);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRFPItemProgressObserver updateWithFPItem:].cold.1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

  }
  objc_msgSend(v4, "downloadingProgress");
  v7 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  downloadProgress = self->_downloadProgress;

  if (v7 != downloadProgress)
  {
    -[NSProgress removeObserver:forKeyPath:](self->_downloadProgress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
    objc_msgSend(v4, "downloadingProgress");
    v9 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    v10 = self->_downloadProgress;
    self->_downloadProgress = v9;

    -[BRFPItemProgressObserver _startObservingProgress:](self, "_startObservingProgress:", self->_downloadProgress);
  }
  objc_msgSend(v4, "uploadingProgress");
  v11 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  uploadProgress = self->_uploadProgress;

  if (v11 != uploadProgress)
  {
    -[NSProgress removeObserver:forKeyPath:](self->_uploadProgress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
    objc_msgSend(v4, "uploadingProgress");
    v13 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    v14 = self->_uploadProgress;
    self->_uploadProgress = v13;

    -[BRFPItemProgressObserver _startObservingProgress:](self, "_startObservingProgress:", self->_uploadProgress);
  }

}

- (void)stop
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] %@ - stopping%@");
  OUTLINED_FUNCTION_1();
}

- (void)start
{
  OUTLINED_FUNCTION_10(&dword_19CBF0000, a2, a3, "[CRIT] UNREACHABLE: started twice%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;

  v7 = a4;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__BRFPItemProgressObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v10[3] = &unk_1E3DA4A70;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(queue, v10);

}

void __75__BRFPItemProgressObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = *(id *)(a1 + 40);
    if ((objc_msgSend(v2, "isIndeterminate") & 1) == 0)
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();

  }
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (FPItemID)fpItemID
{
  return self->_fpItemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpItemID, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_uploadProgress, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)updateWithFPItem:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_19CBF0000, a2, a3, "[CRIT] Assertion failed: [item.itemID isEqualToItemID:_fpItemID]%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
