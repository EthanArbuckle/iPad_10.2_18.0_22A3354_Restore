@implementation MPArtworkColorAnalysisUtility

- (MPArtworkColorAnalysisUtility)initWithQualityOfService:(int64_t)a3
{
  MPArtworkColorAnalysisUtility *v4;
  MPArtworkColorAnalysisUtility *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MPArtworkColorAnalysisUtility;
  v4 = -[MPArtworkColorAnalysisUtility init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    -[MPArtworkColorAnalysisUtility setQualityOfService:](v4, "setQualityOfService:", a3);
    v6 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[MPArtworkColorAnalysisUtility setArtworkColorAnalysisOperationQueue:](v5, "setArtworkColorAnalysisOperationQueue:", v6);

    -[MPArtworkColorAnalysisUtility artworkColorAnalysisOperationQueue](v5, "artworkColorAnalysisOperationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setQualityOfService:", a3);

    -[MPArtworkColorAnalysisUtility artworkColorAnalysisOperationQueue](v5, "artworkColorAnalysisOperationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setName:", CFSTR("com.apple.mediaplayer.artworkservice.colorAnalysis.OperationQueue"));

    -[MPArtworkColorAnalysisUtility artworkColorAnalysisOperationQueue](v5, "artworkColorAnalysisOperationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMaxConcurrentOperationCount:", 5);

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPArtworkColorAnalysisUtility setArtworkColorAnalysisOperations:](v5, "setArtworkColorAnalysisOperations:", v10);

  }
  return v5;
}

- (MPArtworkColorAnalysisUtility)init
{
  return -[MPArtworkColorAnalysisUtility initWithQualityOfService:](self, "initWithQualityOfService:", -1);
}

- (id)performColorAnalysisForImageAtUrl:(id)a3 preferredImageSize:(CGSize)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  id v9;
  void *v10;
  MPArtworkColorAnalysisOperation *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  void (**v19)(id, _QWORD, void *);
  id v20;
  id location;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a5;
  if (v7)
  {
    v9 = v7;
    os_unfair_lock_lock(&self->_lock);
    -[MPArtworkColorAnalysisUtility artworkColorAnalysisOperations](self, "artworkColorAnalysisOperations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (MPArtworkColorAnalysisOperation *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_lock);
    if (v11)
    {
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x1E0D4CE20], 2, CFSTR("Color analysis operation already in process"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, 0, v12);

      }
    }
    else
    {
      v11 = -[MPArtworkColorAnalysisOperation initWithURL:]([MPArtworkColorAnalysisOperation alloc], "initWithURL:", v9);
      objc_initWeak(&location, v11);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __104__MPArtworkColorAnalysisUtility_performColorAnalysisForImageAtUrl_preferredImageSize_completionHandler___block_invoke;
      v17[3] = &unk_1E315A490;
      objc_copyWeak(&v20, &location);
      v19 = v8;
      v17[4] = self;
      v13 = v9;
      v18 = v13;
      -[MPArtworkColorAnalysisOperation setCompletionBlock:](v11, "setCompletionBlock:", v17);
      -[MPArtworkColorAnalysisOperation setQualityOfService:](v11, "setQualityOfService:", -[MPArtworkColorAnalysisUtility qualityOfService](self, "qualityOfService"));
      os_unfair_lock_lock(&self->_lock);
      -[MPArtworkColorAnalysisUtility artworkColorAnalysisOperations](self, "artworkColorAnalysisOperations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v11, v13);

      os_unfair_lock_unlock(&self->_lock);
      -[MPArtworkColorAnalysisUtility artworkColorAnalysisOperationQueue](self, "artworkColorAnalysisOperationQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addOperation:", v11);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x1E0D4CE20], 1, CFSTR("Invalid source image URL=%@"), 0);
    v11 = (MPArtworkColorAnalysisOperation *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v11);
  }

  return v7;
}

- (void)cancelColorAnalysis:(id)a3 withCompletionHandler:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a4;
  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[MPArtworkColorAnalysisUtility artworkColorAnalysisOperations](self, "artworkColorAnalysisOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "cancel");
  if (v11)
  {
    objc_msgSend(v9, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v10);

  }
  os_unfair_lock_unlock(p_lock);

}

- (NSOperationQueue)artworkColorAnalysisOperationQueue
{
  return self->_artworkColorAnalysisOperationQueue;
}

- (void)setArtworkColorAnalysisOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_artworkColorAnalysisOperationQueue, a3);
}

- (NSMapTable)artworkColorAnalysisOperations
{
  return self->_artworkColorAnalysisOperations;
}

- (void)setArtworkColorAnalysisOperations:(id)a3
{
  objc_storeStrong((id *)&self->_artworkColorAnalysisOperations, a3);
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkColorAnalysisOperations, 0);
  objc_storeStrong((id *)&self->_artworkColorAnalysisOperationQueue, 0);
}

void __104__MPArtworkColorAnalysisUtility_performColorAnalysisForImageAtUrl_preferredImageSize_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "colorAnalysis");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v2, v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "artworkColorAnalysisOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

@end
