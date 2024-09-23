@implementation FCAudioTrackFetchOperation

- (FCAudioTrackFetchOperation)initWithContext:(id)a3 audioTrack:(id)a4
{
  id v7;
  id v8;
  FCAudioTrackFetchOperation *v9;
  FCAudioTrackFetchOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCAudioTrackFetchOperation;
  v9 = -[FCOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_audioTrack, a4);
  }

  return v10;
}

- (void)performOperation
{
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id *v10;
  FCAudioTrackFetchOperation *v11;
  _QWORD v12[5];
  _QWORD v13[6];

  -[FCAudioTrackFetchOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internalContentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avAssetDownloadManager");
  v5 = (id *)objc_claimAutoreleasedReturnValue();

  -[FCAudioTrackFetchOperation audioTrack](self, "audioTrack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAVAssetDownloadManager interestTokenForCachedAsset:](v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__FCAudioTrackFetchOperation_performOperation__block_invoke;
    v13[3] = &unk_1E463AD10;
    v13[4] = self;
    v13[5] = v8;
    __46__FCAudioTrackFetchOperation_performOperation__block_invoke((uint64_t)v13);
  }
  else if (-[FCAudioTrackFetchOperation cachedOnly](self, "cachedOnly"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__FCAudioTrackFetchOperation_performOperation__block_invoke_2;
    v12[3] = &unk_1E463AB18;
    v12[4] = self;
    __46__FCAudioTrackFetchOperation_performOperation__block_invoke_2((uint64_t)v12);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__FCAudioTrackFetchOperation_performOperation__block_invoke_3;
    v9[3] = &unk_1E463AD10;
    v10 = v5;
    v11 = self;
    -[FCAVAssetDownloadManager restoreBackgroundDownloadsWithCompletionHandler:]((uint64_t)v10, v9);

  }
}

uint64_t __46__FCAudioTrackFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "interestTokenHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "interestTokenHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
  return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
}

void __46__FCAudioTrackFetchOperation_performOperation__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_notCachedError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishedPerformingOperationWithError:", v2);

}

void __46__FCAudioTrackFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v2 = *(id **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "audioTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__FCAudioTrackFetchOperation_performOperation__block_invoke_4;
  v6[3] = &unk_1E4646D30;
  v6[4] = *(_QWORD *)(a1 + 40);
  -[FCAVAssetDownloadManager downloadAsset:completionHandler:](v2, v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v5);
}

void __46__FCAudioTrackFetchOperation_performOperation__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a2;
  v5 = *(void **)(a1 + 32);
  if (a3)
  {
    v6 = a3;
  }
  else
  {
    objc_msgSend(v5, "interestTokenHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "interestTokenHandler");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v8)[2](v8, v9);

    }
    v5 = *(void **)(a1 + 32);
    v6 = 0;
  }
  objc_msgSend(v5, "finishedPerformingOperationWithError:", v6);

}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;
  _QWORD v12[6];

  v4 = a3;
  v11 = v4;
  if (v4)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__FCAudioTrackFetchOperation_operationWillFinishWithError___block_invoke;
    v12[3] = &unk_1E463AD10;
    v12[4] = self;
    v12[5] = v4;
    __59__FCAudioTrackFetchOperation_operationWillFinishWithError___block_invoke((uint64_t)v12);
  }
  else
  {
    -[FCAudioTrackFetchOperation archiveHandler](self, "archiveHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[FCAudioTrackFetchOperation archiveHandler](self, "archiveHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[FCAudioTrackFetchOperation audioTrack](self, "audioTrack");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentArchive");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v8);

    }
    -[FCAudioTrackFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[FCAudioTrackFetchOperation fetchCompletionHandler](self, "fetchCompletionHandler");
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0);

    }
  }

}

void __59__FCAudioTrackFetchOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "fetchCompletionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchCompletionHandler");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)cachedOnly
{
  return self->_cachedOnly;
}

- (void)setCachedOnly:(BOOL)a3
{
  self->_cachedOnly = a3;
}

- (id)interestTokenHandler
{
  return self->_interestTokenHandler;
}

- (void)setInterestTokenHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (id)archiveHandler
{
  return self->_archiveHandler;
}

- (void)setArchiveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (FCContentContext)context
{
  return self->_context;
}

- (FCArticleAudioTrack)audioTrack
{
  return self->_audioTrack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioTrack, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong(&self->_archiveHandler, 0);
  objc_storeStrong(&self->_interestTokenHandler, 0);
}

@end
