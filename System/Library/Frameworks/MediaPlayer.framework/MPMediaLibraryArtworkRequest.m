@implementation MPMediaLibraryArtworkRequest

- (NSString)availableArtworkToken
{
  os_unfair_lock_s *p_lock;
  NSString *availableArtworkToken;
  NSString *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  availableArtworkToken = self->_availableArtworkToken;
  if (!availableArtworkToken)
  {
    if (self->_hasRetrievedTokens)
    {
      availableArtworkToken = 0;
    }
    else
    {
      -[MPMediaLibraryArtworkRequest _onQueue_updateTokens](self, "_onQueue_updateTokens");
      availableArtworkToken = self->_availableArtworkToken;
    }
  }
  v5 = availableArtworkToken;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (int64_t)artworkType
{
  os_unfair_lock_s *p_lock;
  int64_t artworkType;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  artworkType = self->_artworkType;
  os_unfair_lock_unlock(p_lock);
  return artworkType;
}

- (NSString)fetchableArtworkToken
{
  os_unfair_lock_s *p_lock;
  NSString *fetchableArtworkToken;
  NSString *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  fetchableArtworkToken = self->_fetchableArtworkToken;
  if (!fetchableArtworkToken)
  {
    if (self->_hasRetrievedTokens)
    {
      fetchableArtworkToken = 0;
    }
    else
    {
      -[MPMediaLibraryArtworkRequest _onQueue_updateTokens](self, "_onQueue_updateTokens");
      fetchableArtworkToken = self->_fetchableArtworkToken;
    }
  }
  v5 = fetchableArtworkToken;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)_onQueue_updateTokens
{
  void *v3;
  unint64_t libraryID;
  int64_t entityType;
  int64_t artworkType;
  double retrievalTime;
  _QWORD v8[5];

  os_unfair_lock_assert_owner(&self->_lock);
  -[MPMediaLibraryArtworkRequest _onQueue_musicLibrary](self, "_onQueue_musicLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  entityType = self->_entityType;
  libraryID = self->_libraryID;
  artworkType = self->_artworkType;
  retrievalTime = self->_retrievalTime;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__MPMediaLibraryArtworkRequest__onQueue_updateTokens__block_invoke;
  v8[3] = &unk_1E315C2F8;
  v8[4] = self;
  objc_msgSend(v3, "retrieveBestArtworkTokensForEntityPersistentID:entityType:artworkType:retrievalTime:completionHandler:", libraryID, entityType, artworkType, v8, retrievalTime);

}

- (id)_onQueue_musicLibrary
{
  void *v3;
  void *v4;

  os_unfair_lock_assert_owner(&self->_lock);
  -[MPMediaLibrary libraryDataProvider](self->_library, "libraryDataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "library");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __53__MPMediaLibraryArtworkRequest__onQueue_updateTokens__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 8));
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v17 = v7;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 48);
  *(_QWORD *)(v11 + 48) = v8;
  v13 = v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 56);
  *(_QWORD *)(v15 + 56) = v14;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
}

- (unint64_t)libraryID
{
  os_unfair_lock_s *p_lock;
  unint64_t libraryID;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  libraryID = self->_libraryID;
  os_unfair_lock_unlock(p_lock);
  return libraryID;
}

- (int64_t)entityType
{
  os_unfair_lock_s *p_lock;
  int64_t entityType;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  entityType = self->_entityType;
  os_unfair_lock_unlock(p_lock);
  return entityType;
}

- (MPMediaLibraryArtwork)libraryArtwork
{
  os_unfair_lock_s *p_lock;
  MPMediaLibraryArtwork *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_libraryArtwork;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (ML3MusicLibrary)musicLibrary
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MPMediaLibraryArtworkRequest _onQueue_musicLibrary](self, "_onQueue_musicLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (ML3MusicLibrary *)v4;
}

- (void)setLibraryArtwork:(id)a3
{
  MPMediaLibraryArtwork *v4;
  MPMediaLibraryArtwork *libraryArtwork;

  v4 = (MPMediaLibraryArtwork *)a3;
  os_unfair_lock_lock(&self->_lock);
  libraryArtwork = self->_libraryArtwork;
  self->_libraryArtwork = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)mediaType
{
  os_unfair_lock_s *p_lock;
  unint64_t mediaType;
  id v5;
  unint64_t libraryID;
  void *v7;
  void *v8;
  void *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_artworkType == 4)
  {
    mediaType = -1;
  }
  else
  {
    mediaType = self->_mediaType;
    if (!mediaType)
    {
      v5 = objc_alloc(MEMORY[0x1E0D512C8]);
      libraryID = self->_libraryID;
      -[MPMediaLibraryArtworkRequest _onQueue_musicLibrary](self, "_onQueue_musicLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v5, "initWithPersistentID:inLibrary:", libraryID, v7);

      objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0D50F30]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = objc_msgSend(v9, "unsignedIntValue");

      self->_mediaType = MPMediaTypeForMLMediaType(v7);
      mediaType = self->_mediaType;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return mediaType;
}

- (void)setFetchableArtworkToken:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSString *v6;
  NSString *fetchableArtworkToken;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSString *)objc_msgSend(v5, "copy");

  fetchableArtworkToken = self->_fetchableArtworkToken;
  self->_fetchableArtworkToken = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setFetchableArtworkSource:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSNumber *v6;
  NSNumber *fetchableArtworkSource;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSNumber *)objc_msgSend(v5, "copy");

  fetchableArtworkSource = self->_fetchableArtworkSource;
  self->_fetchableArtworkSource = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setAvailableArtworkToken:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSString *v6;
  NSString *availableArtworkToken;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSString *)objc_msgSend(v5, "copy");

  availableArtworkToken = self->_availableArtworkToken;
  self->_availableArtworkToken = v6;

  os_unfair_lock_unlock(p_lock);
}

- (MPMediaLibraryArtworkRequest)initWithLibrary:(id)a3 identifier:(unint64_t)a4 entityType:(int64_t)a5 artworkType:(int64_t)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  MPMediaLibraryArtworkRequest *v14;

  v10 = a3;
  v11 = v10;
  if (a6 == 4)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v10, "itemWithPersistentID:verifyExistence:", a4, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "mediaType");

  }
  v14 = -[MPMediaLibraryArtworkRequest initWithLibrary:identifier:entityType:artworkType:mediaType:](self, "initWithLibrary:identifier:entityType:artworkType:mediaType:", v11, a4, a5, a6, v12);

  return v14;
}

- (MPMediaLibraryArtworkRequest)initWithLibrary:(id)a3 identifier:(unint64_t)a4 entityType:(int64_t)a5 artworkType:(int64_t)a6 mediaType:(unint64_t)a7
{
  id v13;
  MPMediaLibraryArtworkRequest *v14;
  MPMediaLibraryArtworkRequest *v15;
  uint64_t v16;
  ICUserIdentity *userIdentity;
  objc_super v19;

  v13 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MPMediaLibraryArtworkRequest;
  v14 = -[MPMediaLibraryArtworkRequest init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_library, a3);
    v15->_libraryID = a4;
    v15->_artworkType = a6;
    v15->_entityType = a5;
    v15->_mediaType = a7;
    objc_msgSend(v13, "userIdentity");
    v16 = objc_claimAutoreleasedReturnValue();
    userIdentity = v15->_userIdentity;
    v15->_userIdentity = (ICUserIdentity *)v16;

  }
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_libraryArtwork, 0);
  objc_storeStrong((id *)&self->_fetchableArtworkSource, 0);
  objc_storeStrong((id *)&self->_fetchableArtworkToken, 0);
  objc_storeStrong((id *)&self->_availableArtworkToken, 0);
}

- (NSNumber)fetchableArtworkSource
{
  os_unfair_lock_s *p_lock;
  NSNumber *fetchableArtworkSource;
  NSNumber *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  fetchableArtworkSource = self->_fetchableArtworkSource;
  if (!fetchableArtworkSource)
  {
    if (self->_hasRetrievedTokens)
    {
      fetchableArtworkSource = 0;
    }
    else
    {
      -[MPMediaLibraryArtworkRequest _onQueue_updateTokens](self, "_onQueue_updateTokens");
      fetchableArtworkSource = self->_fetchableArtworkSource;
    }
  }
  v5 = fetchableArtworkSource;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (double)retrievalTime
{
  os_unfair_lock_s *p_lock;
  double retrievalTime;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  retrievalTime = self->_retrievalTime;
  os_unfair_lock_unlock(p_lock);
  return retrievalTime;
}

- (void)setRetrievalTime:(double)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_retrievalTime = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t entityType;
  unint64_t libraryID;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t artworkType;
  int64_t v21;
  unint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t v31;
  int64_t v32;
  int64_t v33;
  int64_t v34;
  unint64_t retrievalTime;
  int64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int64_t v71;
  int64_t v72;
  unint64_t v73;
  uint64_t v74;
  int64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  os_unfair_lock_lock(&self->_lock);
  entityType = self->_entityType;
  libraryID = self->_libraryID;
  v11 = v5 ^ 0x7465646279746573 ^ libraryID;
  v12 = (v6 + v7) ^ __ROR8__(v7, 51);
  v13 = v8 + v11;
  v14 = (v8 + v11) ^ __ROR8__(v11, 48);
  v15 = v14 + __ROR8__(v6 + v7, 32);
  v16 = v15 ^ __ROR8__(v14, 43);
  v17 = v13 + v12;
  v18 = v17 ^ __ROR8__(v12, 47);
  v19 = v15 ^ libraryID;
  artworkType = self->_artworkType;
  v21 = v16 ^ artworkType;
  v22 = v19 + v18;
  v23 = v22 ^ __ROR8__(v18, 51);
  v24 = __ROR8__(v17, 32) + v21;
  v25 = __ROR8__(v21, 48);
  v26 = (v24 ^ v25) + __ROR8__(v22, 32);
  v27 = v26 ^ __ROR8__(v24 ^ v25, 43);
  v28 = v24 + v23;
  v71 = v26 ^ artworkType;
  v74 = v28 ^ __ROR8__(v23, 47);
  v29 = ((v26 ^ artworkType) + v74) ^ __ROR8__(v74, 51);
  v30 = __ROR8__(v28, 32) + (v27 ^ entityType);
  v31 = __ROR8__(v27 ^ entityType, 48);
  v32 = (v30 ^ v31) + __ROR8__(v71 + v74, 32);
  v33 = v32 ^ __ROR8__(v30 ^ v31, 43);
  v34 = v30 + v29;
  v72 = v32 ^ entityType;
  v75 = v34 ^ __ROR8__(v29, 47);
  retrievalTime = (unint64_t)self->_retrievalTime;
  v36 = (v72 + v75) ^ __ROR8__(v75, 51);
  v37 = __ROR8__(v34, 32) + (v33 ^ retrievalTime);
  v38 = __ROR8__(v33 ^ retrievalTime, 48);
  v39 = (v37 ^ v38) + __ROR8__(v72 + v75, 32);
  v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
  v41 = v37 + v36;
  v77 = __ROR8__(v41, 32);
  v78 = v40;
  v73 = v39 ^ retrievalTime;
  v76 = v41 ^ __ROR8__(v36, 47);
  os_unfair_lock_unlock(&self->_lock);
  v42 = (v73 + v76) ^ __ROR8__(v76, 51);
  v43 = v77 + (v78 ^ 0x2000000000000000);
  v44 = __ROR8__(v78 ^ 0x2000000000000000, 48);
  v45 = (v43 ^ v44) + __ROR8__(v73 + v76, 32);
  v46 = v45 ^ __ROR8__(v43 ^ v44, 43);
  v47 = v43 + v42;
  v48 = v47 ^ __ROR8__(v42, 47);
  v49 = (v45 ^ 0x2000000000000000) + v48;
  v50 = v49 ^ __ROR8__(v48, 51);
  v51 = (__ROR8__(v47, 32) ^ 0xFFLL) + v46;
  v52 = __ROR8__(v46, 48);
  v53 = __ROR8__(v49, 32) + (v51 ^ v52);
  v54 = v53 ^ __ROR8__(v51 ^ v52, 43);
  v55 = v50 + v51;
  v56 = v55 ^ __ROR8__(v50, 47);
  v57 = v56 + v53;
  v58 = v57 ^ __ROR8__(v56, 51);
  v59 = __ROR8__(v55, 32) + v54;
  v60 = __ROR8__(v54, 48);
  v61 = __ROR8__(v57, 32) + (v59 ^ v60);
  v62 = v61 ^ __ROR8__(v59 ^ v60, 43);
  v63 = v58 + v59;
  v64 = v63 ^ __ROR8__(v58, 47);
  v65 = v64 + v61;
  v66 = v65 ^ __ROR8__(v64, 51);
  v67 = __ROR8__(v63, 32) + v62;
  v68 = __ROR8__(v62, 48);
  v69 = __ROR8__(v65, 32) + (v67 ^ v68);
  return (v66 + v67) ^ __ROR8__(v66, 47) ^ v69 ^ __ROR8__(v66 + v67, 32) ^ v69 ^ __ROR8__(v67 ^ v68, 43);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  BOOL v16;
  BOOL v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "libraryID");
    v7 = -[MPMediaLibraryArtworkRequest libraryID](self, "libraryID");
    v8 = objc_msgSend(v5, "entityType");
    v9 = -[MPMediaLibraryArtworkRequest entityType](self, "entityType");
    v10 = objc_msgSend(v5, "artworkType");
    v11 = -[MPMediaLibraryArtworkRequest artworkType](self, "artworkType");
    objc_msgSend(v5, "retrievalTime");
    v13 = v12;
    -[MPMediaLibraryArtworkRequest retrievalTime](self, "retrievalTime");
    v16 = v13 == v14 && v10 == v11;
    if (v8 != v9)
      v16 = 0;
    v17 = v6 == v7 && v16;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSString)description
{
  void *v3;
  double v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p libraryID=%llu entityType=%ld artworkType=%ld"), objc_opt_class(), self, -[MPMediaLibraryArtworkRequest libraryID](self, "libraryID"), -[MPMediaLibraryArtworkRequest entityType](self, "entityType"), -[MPMediaLibraryArtworkRequest artworkType](self, "artworkType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryArtworkRequest retrievalTime](self, "retrievalTime");
  if (v4 > 0.0)
  {
    -[MPMediaLibraryArtworkRequest retrievalTime](self, "retrievalTime");
    objc_msgSend(v3, "appendFormat:", CFSTR(" retrievalTime=%f"), v5);
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (id)artworkTokenParameters
{
  id v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  int64_t entityType;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  id v11;
  int64_t artworkType;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSString *availableArtworkToken;
  NSString *fetchableArtworkToken;
  NSInteger v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  id v23;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MPMediaLibrary uniqueIdentifier](self->_library, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("lid"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), self->_libraryID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("id"));
  entityType = self->_entityType;
  if (entityType)
  {
    v8 = 0;
    v9 = _MPMediaEntityTypeDescriptions;
    while (1)
    {
      v10 = *v9;
      v9 += 2;
      if (v10 == entityType)
        break;
      if (++v8 == 7)
        goto LABEL_11;
    }
    v11 = (id)_MPMediaEntityTypeDescriptions[2 * v8 + 1];
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("et"));

  }
LABEL_11:
  artworkType = self->_artworkType;
  if (artworkType)
  {
    _NSStringFromMPMediaLibraryArtworkType(artworkType);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("at"));

  }
  _NSStringFromMPMediaType(self->_mediaType, CFSTR(","));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("mt"));
  if (self->_retrievalTime > 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&self->_retrievalTime);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("rt"));

    }
  }
  availableArtworkToken = self->_availableArtworkToken;
  if (availableArtworkToken)
    objc_msgSend(v3, "setObject:forKey:", availableArtworkToken, CFSTR("aat"));
  fetchableArtworkToken = self->_fetchableArtworkToken;
  if (fetchableArtworkToken)
    objc_msgSend(v3, "setObject:forKey:", fetchableArtworkToken, CFSTR("fat"));
  v19 = -[NSNumber integerValue](self->_fetchableArtworkSource, "integerValue");
  if (v19)
  {
    v20 = 0;
    v21 = _MPMediaLibraryArtworkSourceTypeDescriptions;
    while (1)
    {
      v22 = *v21;
      v21 += 2;
      if (v22 == v19)
        break;
      if (++v20 == 7)
        goto LABEL_30;
    }
    v23 = (id)_MPMediaLibraryArtworkSourceTypeDescriptions[2 * v20 + 1];
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("fas"));

  }
LABEL_30:
  os_unfair_lock_unlock(p_lock);

  return v3;
}

- (void)clearFailedFetchableToken
{
  os_unfair_lock_s *p_lock;
  NSString *fetchableArtworkToken;
  NSNumber *fetchableArtworkSource;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  fetchableArtworkToken = self->_fetchableArtworkToken;
  self->_fetchableArtworkToken = 0;

  fetchableArtworkSource = self->_fetchableArtworkSource;
  self->_fetchableArtworkSource = 0;

  self->_hasRetrievedTokens = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)promoteFetchableArtworkTokenIfNeeded
{
  os_unfair_lock_s *p_lock;
  NSString *fetchableArtworkToken;
  MPMediaLibraryArtwork *libraryArtwork;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  fetchableArtworkToken = self->_fetchableArtworkToken;
  if (fetchableArtworkToken)
  {
    objc_storeStrong((id *)&self->_availableArtworkToken, fetchableArtworkToken);
    libraryArtwork = self->_libraryArtwork;
    self->_libraryArtwork = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (MPMediaLibrary)library
{
  return self->_library;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

+ (id)artworkTokenWithParameters:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  id *v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id *v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  id v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  id *v39;
  id v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("lid"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary mediaLibraryWithUniqueIdentifier:allowsLoadingFromDisk:](MPMediaLibrary, "mediaLibraryWithUniqueIdentifier:allowsLoadingFromDisk:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("id"));
  v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = strtoull((const char *)objc_msgSend(v48, "UTF8String"), 0, 0);
  objc_msgSend(v4, "objectForKey:", CFSTR("et"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = (id *)&off_1E315C3C0;
  while (1)
  {
    v9 = *v8;
    if (v9 == v6)
      break;
    v10 = v9;
    v11 = objc_msgSend(v6, "isEqual:", v9);

    if (v11)
      goto LABEL_7;
    ++v7;
    v8 += 2;
    if (v7 == 7)
    {
      v12 = 0;
      goto LABEL_8;
    }
  }

LABEL_7:
  v12 = _MPMediaEntityTypeDescriptions[2 * v7];
LABEL_8:

  objc_msgSend(v4, "objectForKey:", CFSTR("at"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = (id *)&off_1E315C430;
  while (1)
  {
    v16 = *v15;
    if (v16 == v13)
      break;
    v17 = v16;
    v18 = objc_msgSend(v13, "isEqual:", v16);

    if (v18)
      goto LABEL_14;
    ++v14;
    v15 += 2;
    if (v14 == 6)
    {
      v19 = 0;
      goto LABEL_15;
    }
  }

LABEL_14:
  v19 = _MPMediaLibraryArtworkTypeDescriptions[2 * v14];
LABEL_15:

  objc_msgSend(v4, "objectForKey:", CFSTR("mt"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = CFSTR(",");
  v50 = v4;
  if ((objc_msgSend(v20, "isEqualToString:", CFSTR("anyMedia")) & 1) != 0)
  {
    v22 = -1;
  }
  else
  {
    v47 = a1;
    v46 = v20;
    objc_msgSend(v20, "componentsSeparatedByString:", CFSTR(","));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v23)
    {
      v24 = v23;
      v22 = 0;
      v25 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v54 != v25)
            objc_enumerationMutation(obj);
          v27 = 0;
          v28 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          do
          {
            if (objc_msgSend(v28, "isEqualToString:", _NSStringFromMPMediaType_strings1[v27]))
              v22 |= _NSStringFromMPMediaType_types1[v27];
            ++v27;
          }
          while (v27 != 6);
          for (j = 0; j != 7; ++j)
          {
            if (objc_msgSend(v28, "isEqualToString:", _NSStringFromMPMediaType_strings2[j]))
              v22 |= _NSStringFromMPMediaType_types2[j];
          }
        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v24);
    }
    else
    {
      v22 = 0;
    }

    v4 = v50;
    a1 = v47;
    v20 = v46;
  }

  v30 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLibrary:identifier:entityType:artworkType:mediaType:", v51, v5, v12, v19, v22);
  objc_msgSend(v4, "objectForKey:", CFSTR("rt"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    objc_msgSend(v31, "doubleValue");
    objc_msgSend(v30, "setRetrievalTime:");
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("aat"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    objc_msgSend(v30, "setAvailableArtworkToken:", v33);
  objc_msgSend(v4, "objectForKey:", CFSTR("fat"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    objc_msgSend(v30, "setFetchableArtworkToken:", v34);
  objc_msgSend(v4, "objectForKey:", CFSTR("fas"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    v37 = v35;
    v38 = 0;
    v39 = (id *)&off_1E315C490;
    while (1)
    {
      v40 = *v39;
      if (v40 == v37)
        break;
      v41 = v40;
      v42 = objc_msgSend(v37, "isEqual:", v40);

      if (v42)
        goto LABEL_48;
      ++v38;
      v39 += 2;
      if (v38 == 7)
      {
        v43 = 0;
        goto LABEL_49;
      }
    }

LABEL_48:
    v43 = _MPMediaLibraryArtworkSourceTypeDescriptions[2 * v38];
LABEL_49:

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFetchableArtworkSource:", v44);

    v4 = v50;
  }

  return v30;
}

@end
