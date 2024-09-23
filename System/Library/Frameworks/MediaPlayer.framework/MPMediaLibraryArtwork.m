@implementation MPMediaLibraryArtwork

+ (BOOL)fetchableArtworkExistsForRequest:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v3 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v4 = objc_msgSend(v3, "libraryID");
  v5 = objc_msgSend(v3, "entityType");
  v6 = objc_msgSend(v3, "artworkType");
  objc_msgSend(v3, "musicLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__MPMediaLibraryArtwork_fetchableArtworkExistsForRequest___block_invoke;
  v10[3] = &unk_1E315C320;
  v12 = &v16;
  v8 = v7;
  v11 = v8;
  v13 = v4;
  v14 = v5;
  v15 = v6;
  objc_msgSend(v8, "enumerateArtworkTokensForEntityPersistentID:entityType:artworkType:usingBlock:", v4, v5, v6, v10);
  LOBYTE(v4) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v4;
}

- (NSArray)validSizes
{
  os_unfair_lock_s *p_stateLock;
  NSArray *validSizes;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  validSizes = self->_validSizes;
  if (!validSizes)
  {
    -[MPMediaLibraryArtwork artworkRequest](self, "artworkRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPArtworkConfiguration systemConfiguration](MPArtworkConfiguration, "systemConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "supportedSizesForMediaType:artworkType:", objc_msgSend(v5, "mediaType"), objc_msgSend(v5, "artworkType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_373);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_validSizes;
    self->_validSizes = v9;

    validSizes = self->_validSizes;
  }
  v11 = validSizes;
  os_unfair_lock_unlock(p_stateLock);
  return v11;
}

+ (id)availableArtworkWithRequest:(id)a3
{
  id v3;
  void *v4;
  MPMediaLibraryArtwork *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  MPMediaLibraryArtwork *v12;

  v3 = a3;
  objc_msgSend(v3, "libraryArtwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(v3, "availableArtworkToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_6;
    v7 = objc_alloc(MEMORY[0x1E0D511F0]);
    objc_msgSend(v3, "availableArtworkToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v3, "artworkType");
    objc_msgSend(v3, "musicLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithToken:artworkType:musicLibrary:", v8, v9, v10);

    if (v11)
    {
      v12 = objc_alloc_init(MPMediaLibraryArtwork);
      -[MPMediaLibraryArtwork setArtworkRequest:](v12, "setArtworkRequest:", v3);
      -[MPMediaLibraryArtwork setArtwork:](v12, "setArtwork:", v11);
      objc_msgSend(v3, "setLibraryArtwork:", v12);
      v5 = v12;

    }
    else
    {
LABEL_6:
      v5 = 0;
    }
  }

  return v5;
}

- (void)setArtworkRequest:(id)a3
{
  objc_storeWeak((id *)&self->_artworkRequest, a3);
}

- (void)setArtwork:(id)a3
{
  ML3Artwork *v4;
  ML3Artwork *artwork;

  v4 = (ML3Artwork *)a3;
  os_unfair_lock_lock(&self->_stateLock);
  artwork = self->_artwork;
  self->_artwork = v4;

  os_unfair_lock_unlock(&self->_stateLock);
}

- (MPMediaLibraryArtwork)init
{
  MPMediaLibraryArtwork *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPMediaLibraryArtwork;
  result = -[MPMediaLibraryArtwork init](&v3, sel_init);
  if (result)
    result->_stateLock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)imageFileURLForSize:(CGSize)a3
{
  double height;
  double width;
  os_unfair_lock_s *p_stateLock;
  void *v7;
  void *v8;

  height = a3.height;
  width = a3.width;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[MPMediaLibraryArtwork artwork](self, "artwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLForSize:", width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_stateLock);
  return v8;
}

- (ML3Artwork)artwork
{
  return self->_artwork;
}

- (MPMediaLibraryArtworkRequest)artworkRequest
{
  return (MPMediaLibraryArtworkRequest *)objc_loadWeakRetained((id *)&self->_artworkRequest);
}

+ (BOOL)needsToFetchArtworkForRequest:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  BOOL v10;

  v3 = a3;
  objc_msgSend(v3, "fetchableArtworkToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "musicLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchableArtworkToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isArtworkTokenAvailable:", v7);

    if (!v8)
    {
      v10 = 1;
      goto LABEL_6;
    }
    objc_msgSend(v3, "fetchableArtworkToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAvailableArtworkToken:", v9);

    objc_msgSend(v3, "setFetchableArtworkToken:", 0);
    objc_msgSend(v3, "setLibraryArtwork:", 0);
  }
  v10 = 0;
LABEL_6:

  return v10;
}

+ (BOOL)artworkExistsForRequest:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "availableArtworkToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "fetchableArtworkToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "length") != 0;

  }
  return v5;
}

uint64_t __58__MPMediaLibraryArtwork_fetchableArtworkExistsForRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isArtworkFetchableForPersistentID:entityType:artworkType:artworkSourceType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MPMediaLibraryArtwork artwork](self, "artwork");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MPMediaLibraryArtwork *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (MPMediaLibraryArtwork *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MPMediaLibraryArtwork artwork](self, "artwork");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaLibraryArtwork artwork](v4, "artwork");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSURL)originalFileURL
{
  return (NSURL *)-[MPMediaLibraryArtwork imageFileURLForSize:](self, "imageFileURLForSize:", 1.79769313e308, 1.79769313e308);
}

- (id)imageFileURLForEffect:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  id v5;
  void *v6;
  void *v7;

  p_stateLock = &self->_stateLock;
  v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  -[MPMediaLibraryArtwork artwork](self, "artwork");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLForEffect:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_stateLock);
  return v7;
}

- (NSArray)autogeneratedSizes
{
  os_unfair_lock_s *p_stateLock;
  NSArray *autogeneratedSizes;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  autogeneratedSizes = self->_autogeneratedSizes;
  if (!autogeneratedSizes)
  {
    -[MPMediaLibraryArtwork artworkRequest](self, "artworkRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPArtworkConfiguration systemConfiguration](MPArtworkConfiguration, "systemConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizesToAutogenerateForMediaType:artworkType:", objc_msgSend(v5, "mediaType"), objc_msgSend(v5, "artworkType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_373);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_autogeneratedSizes;
    self->_autogeneratedSizes = v9;

    autogeneratedSizes = self->_autogeneratedSizes;
  }
  v11 = autogeneratedSizes;
  os_unfair_lock_unlock(p_stateLock);
  return v11;
}

- (NSDictionary)effectsMetadata
{
  os_unfair_lock_s *p_stateLock;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  -[ML3Artwork interestDictionary](self->_artwork, "interestDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA70];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  os_unfair_lock_unlock(p_stateLock);
  return (NSDictionary *)v8;
}

- (void)setEffectsMetadata:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  id v5;
  void *v6;

  p_stateLock = &self->_stateLock;
  v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  -[ML3Artwork setInterestDictionary:](self->_artwork, "setInterestDictionary:", v6);
  os_unfair_lock_unlock(p_stateLock);
}

- (os_unfair_lock_s)stateLock
{
  return self->_stateLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_destroyWeak((id *)&self->_artworkRequest);
  objc_storeStrong((id *)&self->_autogeneratedSizes, 0);
  objc_storeStrong((id *)&self->_validSizes, 0);
}

+ (void)fetchArtworkForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "fetchableArtworkSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (v9)
  {
    objc_msgSend(v6, "userIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "libraryID");
    v13 = objc_msgSend(v6, "entityType");
    v14 = objc_msgSend(v6, "artworkType");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __66__MPMediaLibraryArtwork_fetchArtworkForRequest_completionHandler___block_invoke;
    v18[3] = &unk_1E315C370;
    v19 = v6;
    v20 = v7;
    v21 = a1;
    objc_msgSend(v11, "loadArtworkForEntityPersistentID:entityType:artworkType:artworkSourceType:completionHandler:", v12, v13, v14, v9, v18);

    v15 = v19;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = CFSTR("Unknown artwork source type.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("MPMediaLibraryArtworkErrorDomain"), 0, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v17);

    goto LABEL_5;
  }
LABEL_6:

}

+ (void)cancelFetchingArtworkForRequest:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "fetchableArtworkSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5)
  {
    objc_msgSend(v3, "userIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deprioritizeArtworkRequestForEntityPersistentID:entityType:artworkType:artworkSourceType:", objc_msgSend(v3, "libraryID"), objc_msgSend(v3, "entityType"), objc_msgSend(v3, "artworkType"), v5);

  }
  else
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v3;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "[MPArtwork] Failed to deprioritize artwork request %{public}@ – unknown artwork source type", (uint8_t *)&v9, 0xCu);
    }

  }
}

+ (void)fetchArtworkInfoForRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "fetchableArtworkSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8)
  {
    v9 = 0;
LABEL_3:
    objc_msgSend(v5, "userIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "libraryID");
    v13 = objc_msgSend(v5, "entityType");
    v14 = objc_msgSend(v5, "artworkType");
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __70__MPMediaLibraryArtwork_fetchArtworkInfoForRequest_completionHandler___block_invoke;
    v22[3] = &unk_1E315C398;
    v23 = v6;
    objc_msgSend(v11, "loadArtworkInfoForEntityPersistentID:entityType:artworkType:artworkSourceType:completionHandler:", v12, v13, v14, v8, v22);

    v15 = v23;
    goto LABEL_4;
  }
  objc_msgSend(v5, "availableArtworkToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v16 = objc_alloc(MEMORY[0x1E0D511F0]);
    objc_msgSend(v5, "availableArtworkToken");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v5, "artworkType");
    objc_msgSend(v5, "musicLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v16, "initWithToken:artworkType:musicLibrary:", v17, v18, v19);

    v8 = objc_msgSend(v9, "sourceType");
    if (v8)
      goto LABEL_3;
  }
  if (!v6)
    goto LABEL_5;
  v20 = (void *)MEMORY[0x1E0CB35C8];
  v24 = *MEMORY[0x1E0CB2D50];
  v25[0] = CFSTR("Unknown artwork source type for artwork info request.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("MPMediaLibraryArtworkErrorDomain"), 0, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v21);

LABEL_4:
LABEL_5:

}

uint64_t __70__MPMediaLibraryArtwork_fetchArtworkInfoForRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __66__MPMediaLibraryArtwork_fetchArtworkForRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  void *v12;

  v3 = a2;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __66__MPMediaLibraryArtwork_fetchArtworkForRequest_completionHandler___block_invoke_2;
  v10 = &unk_1E315C348;
  v11 = *(id *)(a1 + 32);
  v4 = v3;
  v12 = v4;
  AnalyticsSendEventLazy();
  if (!v4)
    objc_msgSend(*(id *)(a1 + 32), "promoteFetchableArtworkTokenIfNeeded", v7, 3221225472, __66__MPMediaLibraryArtwork_fetchArtworkForRequest_completionHandler___block_invoke_2, &unk_1E315C348, v11, 0);
  objc_msgSend(*(id *)(a1 + 32), "clearFailedFetchableToken", v7, v8, v9, v10);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    if (v4)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "availableArtworkWithRequest:", *(_QWORD *)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 40);
    }
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v4);

  }
}

id __66__MPMediaLibraryArtwork_fetchArtworkForRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _NSStringFromMPMediaLibraryArtworkType(objc_msgSend(*(id *)(a1 + 32), "artworkType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("mediaType"));

  if (*(_QWORD *)(a1 + 40))
    v5 = MEMORY[0x1E0C9AAB0];
  else
    v5 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("success"));
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "timeIntervalSinceNow");
  objc_msgSend(v6, "numberWithDouble:", fabs(v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("duration"));

  return v2;
}

@end
