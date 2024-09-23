@implementation ML3ArtworkTokenSet

- (ML3ArtworkTokenSet)initWithEntity:(id)a3 artworkType:(int64_t)a4
{
  id v8;
  ML3ArtworkTokenSet *v9;
  ML3ArtworkTokenSet *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3ArtworkTokenSet.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entity != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)ML3ArtworkTokenSet;
  v9 = -[ML3ArtworkTokenSet init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entity, a3);
    v10->_artworkType = a4;
  }

  return v10;
}

- (NSString)availableArtworkToken
{
  if (!self->_faultedInBestTokens)
    -[ML3ArtworkTokenSet _faultInBestTokens](self, "_faultInBestTokens");
  return self->_availableArtworkToken;
}

- (NSString)fetchableArtworkToken
{
  if (!self->_faultedInBestTokens)
    -[ML3ArtworkTokenSet _faultInBestTokens](self, "_faultInBestTokens");
  return self->_fetchableArtworkToken;
}

- (int64_t)fetchableArtworkSourceType
{
  if (!self->_faultedInBestTokens)
    -[ML3ArtworkTokenSet _faultInBestTokens](self, "_faultInBestTokens");
  return self->_fetchableArtworkSourceType;
}

- (id)artworkTokenForSource:(int64_t)a3
{
  NSDictionary *artworkSourceToTokenMap;
  void *v6;
  void *v7;

  if (!self->_faultedInTokens)
    -[ML3ArtworkTokenSet _faultInTokens](self, "_faultInTokens");
  artworkSourceToTokenMap = self->_artworkSourceToTokenMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](artworkSourceToTokenMap, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_faultInBestTokens
{
  dispatch_semaphore_t v3;
  void *v4;
  int64_t v5;
  uint64_t v6;
  int64_t artworkType;
  double retrievalTime;
  NSObject *v9;
  _QWORD v10[5];
  dispatch_semaphore_t v11;

  self->_faultedInBestTokens = 1;
  v3 = dispatch_semaphore_create(0);
  -[ML3Entity library](self->_entity, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ML3Entity persistentID](self->_entity, "persistentID");
  v6 = objc_msgSend((id)objc_opt_class(), "revisionTrackingCode");
  artworkType = self->_artworkType;
  retrievalTime = self->_retrievalTime;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__ML3ArtworkTokenSet__faultInBestTokens__block_invoke;
  v10[3] = &unk_1E5B5C320;
  v10[4] = self;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v4, "retrieveBestArtworkTokensForEntityPersistentID:entityType:artworkType:retrievalTime:completionHandler:", v5, v6, artworkType, v10, retrievalTime);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_faultInTokens
{
  void *v3;
  void *v4;
  int64_t v5;
  uint64_t v6;
  int64_t artworkType;
  id v8;
  NSDictionary *v9;
  NSDictionary *artworkSourceToTokenMap;
  _QWORD v11[4];
  id v12;

  self->_faultedInTokens = 1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Entity library](self->_entity, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ML3Entity persistentID](self->_entity, "persistentID");
  v6 = objc_msgSend((id)objc_opt_class(), "revisionTrackingCode");
  artworkType = self->_artworkType;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__ML3ArtworkTokenSet__faultInTokens__block_invoke;
  v11[3] = &unk_1E5B5C348;
  v12 = v3;
  v8 = v3;
  objc_msgSend(v4, "enumerateArtworkTokensForEntityPersistentID:entityType:artworkType:usingBlock:", v5, v6, artworkType, v11);

  v9 = (NSDictionary *)objc_msgSend(v8, "copy");
  artworkSourceToTokenMap = self->_artworkSourceToTokenMap;
  self->_artworkSourceToTokenMap = v9;

}

- (double)retrievalTime
{
  return self->_retrievalTime;
}

- (void)setRetrievalTime:(double)a3
{
  self->_retrievalTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkSourceToTokenMap, 0);
  objc_storeStrong((id *)&self->_fetchableArtworkToken, 0);
  objc_storeStrong((id *)&self->_availableArtworkToken, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

void __36__ML3ArtworkTokenSet__faultInTokens__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

}

void __40__ML3ArtworkTokenSet__faultInBestTokens__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = v7;
  v14 = v7;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 32);
  *(_QWORD *)(v11 + 32) = v8;
  v13 = v8;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = a4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

@end
