@implementation _MFAttachmentActiveRequest

- (_MFAttachmentActiveRequest)initWithAttachment:(id)a3
{
  id v5;
  _MFAttachmentActiveRequest *v6;
  _MFAttachmentActiveRequest *v7;
  void *v8;
  uint64_t v9;
  id fetchCompletionBlock;
  uint64_t v11;
  NSProgress *downloadProgress;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MFAttachmentActiveRequest;
  v6 = -[_MFAttachmentActiveRequest init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attachment, a3);
    objc_msgSend(v5, "fetchCompletionBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    fetchCompletionBlock = v7->_fetchCompletionBlock;
    v7->_fetchCompletionBlock = (id)v9;

    v11 = objc_msgSend(v5, "newDownloadProgress");
    downloadProgress = v7->_downloadProgress;
    v7->_downloadProgress = (NSProgress *)v11;

    v7->_wantsCompletionBlockOffMainThread = objc_msgSend(v5, "wantsCompletionBlockOffMainThread");
    objc_msgSend(v5, "setFetchCompletionBlock:", 0);
  }

  return v7;
}

- (void)completeWithData:(id)a3 error:(id)a4
{
  id v6;
  void (**fetchCompletionBlock)(id, void *, id, id);
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  fetchCompletionBlock = (void (**)(id, void *, id, id))self->_fetchCompletionBlock;
  if (fetchCompletionBlock)
  {
    -[_MFAttachmentActiveRequest attachment](self, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    fetchCompletionBlock[2](fetchCompletionBlock, v9, v11, v6);

    v10 = self->_fetchCompletionBlock;
    self->_fetchCompletionBlock = 0;

  }
}

- (MFAttachment)attachment
{
  return self->_attachment;
}

- (NSProgress)downloadProgress
{
  return self->_downloadProgress;
}

- (id)fetchCompletionBlock
{
  return self->_fetchCompletionBlock;
}

- (BOOL)wantsCompletionBlockOffMainThread
{
  return self->_wantsCompletionBlockOffMainThread;
}

- (int64_t)lastProgressBytes
{
  return self->_lastProgressBytes;
}

- (void)setLastProgressBytes:(int64_t)a3
{
  self->_lastProgressBytes = a3;
}

- (double)lastProgressTime
{
  return self->_lastProgressTime;
}

- (void)setLastProgressTime:(double)a3
{
  self->_lastProgressTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
}

@end
