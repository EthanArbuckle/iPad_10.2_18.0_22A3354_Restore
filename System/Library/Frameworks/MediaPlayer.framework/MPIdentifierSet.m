@implementation MPIdentifierSet

- (MPPersonalStoreIdentifiers)personalizedStore
{
  void *v4;
  NSObject *v5;
  int v6;
  MPIdentifierSet *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->_personID, "length"))
    return (MPPersonalStoreIdentifiers *)self;
  if (self->_cloudID
    || -[NSString length](self->_cloudAlbumID, "length")
    || -[NSString length](self->_cloudArtistID, "length")
    || (v4 = -[NSString length](self->_recommendationID, "length")) != 0)
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "Omitting personalizedStore IDs [missing databaseID] identifierSet=%{public}@", (uint8_t *)&v6, 0xCu);
    }

    v4 = 0;
  }
  return (MPPersonalStoreIdentifiers *)v4;
}

- (MPLocalLibraryIdentifiers)library
{
  NSObject *v4;
  int v5;
  MPIdentifierSet *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->_databaseID, "length"))
    return (MPLocalLibraryIdentifiers *)self;
  if (self->_persistentID || self->_containedPersistentID || self->_syncID)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = self;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "Omitting library IDs [missing databaseID] identifierSet=%{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
  return (MPLocalLibraryIdentifiers *)0;
}

- (MPRadioIdentifiers)radio
{
  MPIdentifierSet *v3;

  if (-[NSString length](self->_stationStringID, "length")
    || self->_stationID
    || -[NSString length](self->_stationHash, "length")
    || (v3 = -[NSString length](self->_stationEventID, "length")) != 0)
  {
    v3 = self;
  }
  return (MPRadioIdentifiers *)v3;
}

- (MPUniversalStoreIdentifiers)universalStore
{
  MPIdentifierSet *v3;

  if (-[NSString length](self->_globalPlaylistID, "length")
    || self->_adamID
    || -[NSArray count](self->_formerAdamIDs, "count")
    || -[NSString length](self->_universalCloudLibraryID, "length")
    || self->_purchasedAdamID
    || self->_subscriptionAdamID
    || -[NSString length](self->_socialProfileID, "length")
    || -[NSString length](self->_informalMediaClipID, "length")
    || -[NSString length](self->_informalStaticAssetID, "length")
    || self->_reportingAdamID
    || self->_assetAdamID
    || self->_lyricsAdamID)
  {
    v3 = self;
  }
  else
  {
    v3 = 0;
  }
  return (MPUniversalStoreIdentifiers *)v3;
}

- (void)setUniversalCloudLibraryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setAdamID:(int64_t)a3
{
  self->_adamID = a3;
}

- (int64_t)adamID
{
  return self->_adamID;
}

- (void)setSubscriptionAdamID:(int64_t)a3
{
  self->_subscriptionAdamID = a3;
}

- (void)setPurchasedAdamID:(int64_t)a3
{
  self->_purchasedAdamID = a3;
}

- (void)setReportingAdamID:(int64_t)a3
{
  self->_reportingAdamID = a3;
}

- (void)setAssetAdamID:(int64_t)a3
{
  self->_assetAdamID = a3;
}

- (void)setUniversalStoreIdentifiersWithBlock:(id)a3
{
  (*((void (**)(id, MPIdentifierSet *))a3 + 2))(a3, self);
}

- (void)setPersonalStoreIdentifiersWithPersonID:(id)a3 block:(id)a4
{
  void (**v7)(id, MPIdentifierSet *);
  NSString *v8;
  NSString *v9;
  char v10;
  NSString *v11;
  NSString *personID;
  void *v13;
  NSString *v14;

  v14 = (NSString *)a3;
  v7 = (void (**)(id, MPIdentifierSet *))a4;
  if (!-[NSString length](v14, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPIdentifierSet.m"), 865, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personID.length > 0"));

  }
  v8 = self->_personID;
  if (v8 == v14)
  {

  }
  else
  {
    v9 = v8;
    v10 = -[NSString isEqual:](v8, "isEqual:", v14);

    if ((v10 & 1) == 0)
      -[MPIdentifierSet clearPersonalStoreIdentifiers](self, "clearPersonalStoreIdentifiers");
  }
  v11 = (NSString *)-[NSString copy](v14, "copy");
  personID = self->_personID;
  self->_personID = v11;

  v7[2](v7, self);
}

- (void)setLibraryIdentifiersWithDatabaseID:(id)a3 block:(id)a4
{
  void (**v7)(id, MPIdentifierSet *);
  NSString *v8;
  NSString *v9;
  char v10;
  NSString *v11;
  NSString *databaseID;
  void *v13;
  NSString *v14;

  v14 = (NSString *)a3;
  v7 = (void (**)(id, MPIdentifierSet *))a4;
  if (!-[NSString length](v14, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPIdentifierSet.m"), 849, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseID.length > 0"));

  }
  v8 = self->_databaseID;
  if (v8 == v14)
  {

  }
  else
  {
    v9 = v8;
    v10 = -[NSString isEqual:](v8, "isEqual:", v14);

    if ((v10 & 1) == 0)
      -[MPIdentifierSet clearLibraryIdentifiers](self, "clearLibraryIdentifiers");
  }
  v11 = (NSString *)-[NSString copy](v14, "copy");
  databaseID = self->_databaseID;
  self->_databaseID = v11;

  v7[2](v7, self);
}

- (MPIdentifierSet)initWithSource:(id)a3 modelKind:(id)a4 block:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  MPIdentifierSet *v13;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[MPIdentifierSet _initWithSources:modelKind:block:](self, "_initWithSources:modelKind:block:", v12, v10, v9, v15, v16);
  return v13;
}

- (id)_initWithSources:(id)a3 modelKind:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, MPIdentifierSet *);
  MPIdentifierSet *v11;
  uint64_t v12;
  NSArray *sources;
  NSArray *formerAdamIDs;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, MPIdentifierSet *))a5;
  v16.receiver = self;
  v16.super_class = (Class)MPIdentifierSet;
  v11 = -[MPIdentifierSet init](&v16, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    sources = v11->_sources;
    v11->_sources = (NSArray *)v12;

    objc_storeStrong((id *)&v11->_modelKind, a4);
    formerAdamIDs = v11->_formerAdamIDs;
    v11->_formerAdamIDs = (NSArray *)MEMORY[0x1E0C9AA60];

    v10[2](v10, v11);
  }

  return v11;
}

- (void)clearLibraryIdentifiers
{
  NSString *databaseID;

  databaseID = self->_databaseID;
  self->_databaseID = 0;

  self->_persistentID = 0;
  self->_containedPersistentID = 0;
  self->_syncID = 0;
}

- (void)clearPersonalStoreIdentifiers
{
  NSString *personID;
  NSString *cloudAlbumID;
  NSString *cloudArtistID;
  NSString *recommendationID;

  personID = self->_personID;
  self->_personID = 0;

  cloudAlbumID = self->_cloudAlbumID;
  self->_cloudID = 0;
  self->_cloudAlbumID = 0;

  cloudArtistID = self->_cloudArtistID;
  self->_cloudArtistID = 0;

  recommendationID = self->_recommendationID;
  self->_recommendationID = 0;

}

- (void)setShouldExcludeFromShuffle:(BOOL)a3
{
  self->_shouldExcludeFromShuffle = a3;
}

- (void)setCloudID:(unint64_t)a3
{
  self->_cloudID = a3;
}

- (void)setCloudAlbumID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setPersistentID:(int64_t)a3
{
  self->_persistentID = a3;
}

- (void)setSyncID:(int64_t)a3
{
  -[MPIdentifierSet _setDefaultDatabaseIDIfNeeded](self, "_setDefaultDatabaseIDIfNeeded");
  self->_syncID = a3;
}

- (void)_setDefaultDatabaseIDIfNeeded
{
  void *v3;
  NSString *v4;
  NSString *databaseID;
  id v6;

  if (!-[NSString length](self->_databaseID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uniqueIdentifier");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    databaseID = self->_databaseID;
    self->_databaseID = v4;

  }
}

void __33__MPIdentifierSet_initWithCoder___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setCloudID:", objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("MPIdentifierSetStoreCloudID")));
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetStoreCloudAlbumID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudAlbumID:", v5);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetStoreCloudArtistID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudArtistID:", v6);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetStoreRecommendationID"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecommendationID:", v7);

}

- (void)setRecommendationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setCloudArtistID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

void __33__MPIdentifierSet_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetContainerUniqueID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContainerUniqueID:", v3);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetHandoffCorrelationID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHandoffCorrelationID:", v4);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetContentItemID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentItemID:", v5);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetLyricsID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLyricsID:", v6);

  objc_msgSend(v13, "setShouldExcludeFromShuffle:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("MPIdentifierSetShouldExcludeFromShuffle")));
  objc_msgSend(v13, "setPlaceholder:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("MPIdentifierSetIsPlaceholder")));
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetVendorID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setVendorID:", v7);

  objc_msgSend(v13, "musicKit_setPossibleLibraryPersistentID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", CFSTR("_MPIdentifierSetCodingKeyMusicKitPossibleLibraryPersistentID")));
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetOpaqueID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOpaqueID:", v8);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetVersionHash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setVersionHash:", v9);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetCodingKeyDatabaseID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __33__MPIdentifierSet_initWithCoder___block_invoke_2;
    v20[3] = &unk_1E3162B80;
    v21 = *(id *)(a1 + 32);
    objc_msgSend(v13, "setLibraryIdentifiersWithDatabaseID:block:", v10, v20);

  }
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetCodingKeyPersonID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __33__MPIdentifierSet_initWithCoder___block_invoke_3;
    v18[3] = &unk_1E3162BA8;
    v19 = *(id *)(a1 + 32);
    objc_msgSend(v13, "setPersonalStoreIdentifiersWithPersonID:block:", v12, v18);

  }
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __33__MPIdentifierSet_initWithCoder___block_invoke_4;
  v16[3] = &unk_1E3163A30;
  v17 = *(id *)(a1 + 32);
  objc_msgSend(v13, "setUniversalStoreIdentifiersWithBlock:", v16);
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __33__MPIdentifierSet_initWithCoder___block_invoke_5;
  v14[3] = &unk_1E3162BD0;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v13, "setRadioIdentifiersWithBlock:", v14);

}

- (void)setVendorID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (void)setOpaqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setLyricsID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)setHandoffCorrelationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

void __33__MPIdentifierSet_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setPersistentID:", objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("MPIdentifierSetDeviceLibraryPersistentID")));
  objc_msgSend(v4, "setContainedPersistentID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", CFSTR("MPIdentifierSetDeviceLibraryContainedPersistentID")));
  objc_msgSend(v4, "setSyncID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", CFSTR("MPIdentifierSetSyncID")));

}

- (void)setContainedPersistentID:(int64_t)a3
{
  self->_containedPersistentID = a3;
}

void __33__MPIdentifierSet_initWithCoder___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = *(void **)(a1 + 32);
  v14 = a2;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetGlobalPlaylistID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setGlobalPlaylistID:", v4);

  objc_msgSend(v14, "setAdamID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", CFSTR("MPIdentifierSetStoreAdamID")));
  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("MPIdentifierSetFormerStoreAdamIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFormerAdamIDs:", v9);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetCloudUniversalLibraryID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUniversalCloudLibraryID:", v10);

  objc_msgSend(v14, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", CFSTR("MPIdentifierSetStorePurchasedAdamID")));
  objc_msgSend(v14, "setSubscriptionAdamID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", CFSTR("MPIdentifierSetStoreSubscriptionAdamID")));
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetSocialProfileID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSocialProfileID:", v11);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetInformalMediaClipID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInformalMediaClipID:", v12);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetInformalStaticAssetID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInformalStaticAssetID:", v13);

  objc_msgSend(v14, "setReportingAdamID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", CFSTR("MPIdentifierSetReportingAdamID")));
  objc_msgSend(v14, "setAssetAdamID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", CFSTR("MPIdentifierSetAssetAdamID")));
  objc_msgSend(v14, "setLyricsAdamID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", CFSTR("MPIdentifierSetLyricsAdamID")));

}

- (void)setSocialProfileID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setInformalStaticAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setInformalMediaClipID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)musicKit_setPossibleLibraryPersistentID:(int64_t)a3
{
  self->_musicKit_possibleLibraryPersistentID = a3;
}

void __33__MPIdentifierSet_initWithCoder___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetRadioStationStringID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStationStringID:", v5);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetRadioStationHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStationHash:", v6);

  objc_msgSend(v4, "setStationID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", CFSTR("MPIdentifierSetRadioStationID")));
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetRadioStationEventID"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStationEventID:", v7);

}

- (void)setStationID:(int64_t)a3
{
  self->_stationID = a3;
}

- (void)setStationHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setStationEventID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)intersectsSet:(id)a3
{
  MPIdentifierSet *v4;
  MPIdentifierSet *v5;
  void *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v50;
  void *v51;
  void *v52;
  int v53;
  MPIdentifierSet *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;

  v4 = (MPIdentifierSet *)a3;
  v5 = v4;
  if (self != v4)
  {
    if (!self->_modelKind)
      goto LABEL_15;
    -[MPIdentifierSet modelKind](v4, "modelKind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_15;
    v7 = -[MPModelKind modelClass](self->_modelKind, "modelClass");
    if (v7 == (objc_class *)objc_opt_class())
      goto LABEL_15;
    v8 = -[MPModelKind modelClass](self->_modelKind, "modelClass");
    if (v8 == (objc_class *)objc_opt_class())
      goto LABEL_15;
    v9 = -[MPModelKind modelClass](self->_modelKind, "modelClass");
    if (v9 == (objc_class *)objc_opt_class())
      goto LABEL_15;
    -[MPIdentifierSet modelKind](v5, "modelKind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "modelClass");
    if (v11 != objc_opt_class())
    {
      -[MPIdentifierSet modelKind](v5, "modelKind");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "modelClass");
      if (v13 != objc_opt_class())
      {
        -[MPIdentifierSet modelKind](v5, "modelKind");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "modelClass");
        v16 = objc_opt_class();

        if (v15 != v16)
        {
          -[MPModelKind identityKind](self->_modelKind, "identityKind");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPIdentifierSet modelKind](v5, "modelKind");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "identityKind");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v17, "isEqual:", v19);

          if ((v20 & 1) == 0)
            goto LABEL_27;
        }
LABEL_15:
        -[MPIdentifierSet containerUniqueID](self, "containerUniqueID");
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)v21;
          -[MPIdentifierSet containerUniqueID](v5, "containerUniqueID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            -[MPIdentifierSet containerUniqueID](self, "containerUniqueID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPIdentifierSet containerUniqueID](v5, "containerUniqueID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v24, "isEqualToString:", v25);

            if (!v26)
            {
LABEL_27:
              LOBYTE(self) = 0;
              goto LABEL_42;
            }
          }
        }
        -[MPIdentifierSet handoffCorrelationID](self, "handoffCorrelationID");
        v27 = objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = (void *)v27;
          -[MPIdentifierSet handoffCorrelationID](v5, "handoffCorrelationID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            -[MPIdentifierSet handoffCorrelationID](self, "handoffCorrelationID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPIdentifierSet handoffCorrelationID](v5, "handoffCorrelationID");
            v31 = objc_claimAutoreleasedReturnValue();
LABEL_40:
            v48 = (void *)v31;
            LOBYTE(self) = objc_msgSend(v30, "isEqualToString:", v31);
LABEL_41:

            goto LABEL_42;
          }
        }
        -[MPIdentifierSet contentItemID](self, "contentItemID");
        v32 = objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          v33 = (void *)v32;
          -[MPIdentifierSet contentItemID](v5, "contentItemID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            -[MPIdentifierSet contentItemID](self, "contentItemID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPIdentifierSet contentItemID](v5, "contentItemID");
            v31 = objc_claimAutoreleasedReturnValue();
            goto LABEL_40;
          }
        }
        -[MPIdentifierSet lyricsID](self, "lyricsID");
        v35 = objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          v36 = (void *)v35;
          -[MPIdentifierSet lyricsID](v5, "lyricsID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            -[MPIdentifierSet lyricsID](self, "lyricsID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPIdentifierSet lyricsID](v5, "lyricsID");
            v31 = objc_claimAutoreleasedReturnValue();
            goto LABEL_40;
          }
        }
        -[MPIdentifierSet vendorID](self, "vendorID");
        v38 = objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          v39 = (void *)v38;
          -[MPIdentifierSet vendorID](v5, "vendorID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            -[MPIdentifierSet vendorID](self, "vendorID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPIdentifierSet vendorID](v5, "vendorID");
            v31 = objc_claimAutoreleasedReturnValue();
            goto LABEL_40;
          }
        }
        if (-[MPIdentifierSet musicKit_possibleLibraryPersistentID](self, "musicKit_possibleLibraryPersistentID")
          && -[MPIdentifierSet musicKit_possibleLibraryPersistentID](v5, "musicKit_possibleLibraryPersistentID"))
        {
          v41 = -[MPIdentifierSet musicKit_possibleLibraryPersistentID](self, "musicKit_possibleLibraryPersistentID");
          LOBYTE(self) = v41 == -[MPIdentifierSet musicKit_possibleLibraryPersistentID](v5, "musicKit_possibleLibraryPersistentID");
          goto LABEL_42;
        }
        -[MPIdentifierSet opaqueID](self, "opaqueID");
        v42 = objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          v43 = (void *)v42;
          -[MPIdentifierSet opaqueID](v5, "opaqueID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44)
          {
            -[MPIdentifierSet opaqueID](self, "opaqueID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPIdentifierSet opaqueID](v5, "opaqueID");
            v31 = objc_claimAutoreleasedReturnValue();
            goto LABEL_40;
          }
        }
        -[MPIdentifierSet versionHash](self, "versionHash");
        v45 = objc_claimAutoreleasedReturnValue();
        if (v45)
        {
          v46 = (void *)v45;
          -[MPIdentifierSet versionHash](v5, "versionHash");
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
          {
            -[MPIdentifierSet versionHash](self, "versionHash");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPIdentifierSet versionHash](v5, "versionHash");
            v31 = objc_claimAutoreleasedReturnValue();
            goto LABEL_40;
          }
        }
        -[MPIdentifierSet library](self, "library");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPIdentifierSet library](v5, "library");
        v50 = objc_claimAutoreleasedReturnValue();
        v48 = (void *)v50;
        if (v30)
        {
          if (v50)
          {
            objc_msgSend(v30, "databaseID");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "databaseID");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v51, "isEqual:", v52);

            if (v53)
            {
              if (objc_msgSend(v30, "persistentID") && objc_msgSend(v48, "persistentID"))
              {
                self = (MPIdentifierSet *)objc_msgSend(v30, "persistentID");
                v54 = (MPIdentifierSet *)objc_msgSend(v48, "persistentID");
LABEL_55:
                LOBYTE(self) = self == v54;
                goto LABEL_41;
              }
              if (objc_msgSend(v30, "containedPersistentID") && objc_msgSend(v48, "containedPersistentID"))
              {
                self = (MPIdentifierSet *)objc_msgSend(v30, "containedPersistentID");
                v54 = (MPIdentifierSet *)objc_msgSend(v48, "containedPersistentID");
                goto LABEL_55;
              }
              if (objc_msgSend(v30, "syncID") && objc_msgSend(v48, "syncID"))
              {
                self = (MPIdentifierSet *)objc_msgSend(v30, "syncID");
                v54 = (MPIdentifierSet *)objc_msgSend(v48, "syncID");
                goto LABEL_55;
              }
            }
          }
        }
        -[MPIdentifierSet personalizedStore](self, "personalizedStore");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPIdentifierSet personalizedStore](v5, "personalizedStore");
        v56 = objc_claimAutoreleasedReturnValue();
        v57 = (void *)v56;
        if (v55)
        {
          if (v56)
          {
            objc_msgSend(v55, "personID");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "personID");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v58, "isEqual:", v59);

            if (v60)
            {
              if (objc_msgSend(v55, "cloudID") && objc_msgSend(v57, "cloudID"))
              {
                self = (MPIdentifierSet *)objc_msgSend(v55, "cloudID");
                LOBYTE(self) = self == (MPIdentifierSet *)objc_msgSend(v57, "cloudID");
LABEL_137:

                goto LABEL_41;
              }
              objc_msgSend(v55, "cloudAlbumID");
              v61 = objc_claimAutoreleasedReturnValue();
              if (v61)
              {
                v62 = (void *)v61;
                objc_msgSend(v57, "cloudAlbumID");
                v63 = (void *)objc_claimAutoreleasedReturnValue();

                if (v63)
                {
                  objc_msgSend(v55, "cloudAlbumID");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "cloudAlbumID");
                  v65 = objc_claimAutoreleasedReturnValue();
LABEL_71:
                  v72 = (void *)v65;
                  LOBYTE(self) = objc_msgSend(v64, "isEqualToString:", v65);
LABEL_136:

                  goto LABEL_137;
                }
              }
              objc_msgSend(v55, "recommendationID");
              v66 = objc_claimAutoreleasedReturnValue();
              if (v66)
              {
                v67 = (void *)v66;
                objc_msgSend(v57, "recommendationID");
                v68 = (void *)objc_claimAutoreleasedReturnValue();

                if (v68)
                {
                  objc_msgSend(v55, "recommendationID");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "recommendationID");
                  v65 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_71;
                }
              }
              objc_msgSend(v55, "cloudArtistID");
              v69 = objc_claimAutoreleasedReturnValue();
              if (v69)
              {
                v70 = (void *)v69;
                objc_msgSend(v57, "cloudArtistID");
                v71 = (void *)objc_claimAutoreleasedReturnValue();

                if (v71)
                {
                  objc_msgSend(v55, "cloudArtistID");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "cloudArtistID");
                  v65 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_71;
                }
              }
            }
          }
        }
        -[MPIdentifierSet universalStore](self, "universalStore");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPIdentifierSet universalStore](v5, "universalStore");
        v73 = objc_claimAutoreleasedReturnValue();
        v72 = (void *)v73;
        if (v64 && v73)
        {
          objc_msgSend(v64, "globalPlaylistID");
          v74 = objc_claimAutoreleasedReturnValue();
          if (v74)
          {
            v75 = (void *)v74;
            objc_msgSend(v72, "globalPlaylistID");
            v76 = (void *)objc_claimAutoreleasedReturnValue();

            if (v76)
            {
              objc_msgSend(v64, "globalPlaylistID");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "globalPlaylistID");
              v78 = objc_claimAutoreleasedReturnValue();
LABEL_89:
              v91 = (void *)v78;
              LOBYTE(self) = objc_msgSend(v77, "isEqualToString:", v78);
LABEL_135:

              goto LABEL_136;
            }
          }
          objc_msgSend(v64, "universalCloudLibraryID");
          v79 = objc_claimAutoreleasedReturnValue();
          if (v79)
          {
            v80 = (void *)v79;
            objc_msgSend(v72, "universalCloudLibraryID");
            v81 = (void *)objc_claimAutoreleasedReturnValue();

            if (v81)
            {
              objc_msgSend(v64, "universalCloudLibraryID");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "universalCloudLibraryID");
              v78 = objc_claimAutoreleasedReturnValue();
              goto LABEL_89;
            }
          }
          objc_msgSend(v64, "socialProfileID");
          v82 = objc_claimAutoreleasedReturnValue();
          if (v82)
          {
            v83 = (void *)v82;
            objc_msgSend(v72, "socialProfileID");
            v84 = (void *)objc_claimAutoreleasedReturnValue();

            if (v84)
            {
              objc_msgSend(v64, "socialProfileID");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "socialProfileID");
              v78 = objc_claimAutoreleasedReturnValue();
              goto LABEL_89;
            }
          }
          objc_msgSend(v64, "informalMediaClipID");
          v85 = objc_claimAutoreleasedReturnValue();
          if (v85)
          {
            v86 = (void *)v85;
            objc_msgSend(v72, "informalMediaClipID");
            v87 = (void *)objc_claimAutoreleasedReturnValue();

            if (v87)
            {
              objc_msgSend(v64, "informalMediaClipID");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "informalMediaClipID");
              v78 = objc_claimAutoreleasedReturnValue();
              goto LABEL_89;
            }
          }
          objc_msgSend(v64, "informalStaticAssetID");
          v88 = objc_claimAutoreleasedReturnValue();
          if (v88)
          {
            v89 = (void *)v88;
            objc_msgSend(v72, "informalStaticAssetID");
            v90 = (void *)objc_claimAutoreleasedReturnValue();

            if (v90)
            {
              objc_msgSend(v64, "informalStaticAssetID");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "informalStaticAssetID");
              v78 = objc_claimAutoreleasedReturnValue();
              goto LABEL_89;
            }
          }
          v126 = v57;
          v92 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v64, "formerAdamIDs", v48);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "setWithCapacity:", objc_msgSend(v93, "count") + 6);
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v64, "formerAdamIDs");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "addObjectsFromArray:", v94);

          if (objc_msgSend(v64, "subscriptionAdamID"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v64, "subscriptionAdamID"));
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "addObject:", v95);

          }
          if (objc_msgSend(v64, "purchasedAdamID"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v64, "purchasedAdamID"));
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "addObject:", v96);

          }
          if (objc_msgSend(v64, "adamID"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v64, "adamID"));
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "addObject:", v97);

          }
          if (objc_msgSend(v64, "reportingAdamID"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v64, "reportingAdamID"));
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "addObject:", v98);

          }
          if (objc_msgSend(v64, "assetAdamID"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v64, "assetAdamID"));
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "addObject:", v99);

          }
          if (objc_msgSend(v64, "lyricsAdamID"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v64, "lyricsAdamID"));
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "addObject:", v100);

          }
          v101 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v72, "formerAdamIDs");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "setWithCapacity:", objc_msgSend(v102, "count") + 6);
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v72, "formerAdamIDs");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "addObjectsFromArray:", v103);

          if (objc_msgSend(v72, "subscriptionAdamID"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v72, "subscriptionAdamID"));
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "addObject:", v104);

          }
          v57 = v126;
          if (objc_msgSend(v72, "purchasedAdamID"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v72, "purchasedAdamID"));
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "addObject:", v105);

          }
          if (objc_msgSend(v72, "adamID"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v72, "adamID"));
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "addObject:", v106);

          }
          if (objc_msgSend(v72, "reportingAdamID"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v72, "reportingAdamID"));
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "addObject:", v107);

          }
          if (objc_msgSend(v72, "assetAdamID"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v72, "assetAdamID"));
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "addObject:", v108);

          }
          if (objc_msgSend(v72, "lyricsAdamID"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v72, "lyricsAdamID"));
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "addObject:", v109);

          }
          if (objc_msgSend(v77, "count") && objc_msgSend(v91, "count"))
          {
            LOBYTE(self) = objc_msgSend(v77, "intersectsSet:", v91);
LABEL_134:
            v48 = v125;
            goto LABEL_135;
          }

          v48 = v125;
        }
        -[MPIdentifierSet radio](self, "radio");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPIdentifierSet radio](v5, "radio");
        v110 = objc_claimAutoreleasedReturnValue();
        v91 = (void *)v110;
        LOBYTE(self) = 0;
        if (!v77 || !v110)
          goto LABEL_135;
        v125 = v48;
        v127 = v57;
        objc_msgSend(v77, "stationStringID");
        v111 = objc_claimAutoreleasedReturnValue();
        if (v111
          && (v112 = (void *)v111,
              objc_msgSend(v91, "stationStringID"),
              v113 = (void *)objc_claimAutoreleasedReturnValue(),
              v113,
              v112,
              v113))
        {
          objc_msgSend(v77, "stationStringID");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "stationStringID");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(self) = objc_msgSend(v114, "isEqualToString:", v115);

        }
        else
        {
          objc_msgSend(v77, "stationHash");
          v116 = objc_claimAutoreleasedReturnValue();
          if (v116
            && (v117 = (void *)v116,
                objc_msgSend(v91, "stationHash"),
                v118 = (void *)objc_claimAutoreleasedReturnValue(),
                v118,
                v117,
                v118))
          {
            objc_msgSend(v77, "stationHash");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "stationHash");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(self) = objc_msgSend(v119, "isEqualToString:", v120);

          }
          else
          {
            if (!objc_msgSend(v77, "stationID") || !objc_msgSend(v91, "stationID"))
            {
              objc_msgSend(v77, "stationEventID");
              self = (MPIdentifierSet *)objc_claimAutoreleasedReturnValue();
              v57 = v127;
              if (self)
              {
                objc_msgSend(v91, "stationEventID");
                v122 = (void *)objc_claimAutoreleasedReturnValue();

                if (v122)
                {
                  objc_msgSend(v77, "stationEventID");
                  v123 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v91, "stationEventID");
                  v124 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(self) = objc_msgSend(v123, "isEqualToString:", v124);

                  v57 = v127;
                }
                else
                {
                  LOBYTE(self) = 0;
                }
              }
              goto LABEL_134;
            }
            v121 = objc_msgSend(v77, "stationID");
            LOBYTE(self) = v121 == objc_msgSend(v91, "stationID");
          }
        }
        v48 = v125;
        v57 = v127;
        goto LABEL_135;
      }

    }
    goto LABEL_15;
  }
  LOBYTE(self) = 1;
LABEL_42:

  return (char)self;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (MPModelKind)modelKind
{
  return self->_modelKind;
}

- (NSString)contentItemID
{
  return self->_contentItemID;
}

- (NSString)containerUniqueID
{
  return self->_containerUniqueID;
}

- (void)setVersionHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setGlobalPlaylistID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)universalCloudLibraryID
{
  return self->_universalCloudLibraryID;
}

- (int64_t)subscriptionAdamID
{
  return self->_subscriptionAdamID;
}

- (int64_t)purchasedAdamID
{
  return self->_purchasedAdamID;
}

- (NSArray)formerAdamIDs
{
  return self->_formerAdamIDs;
}

- (void)setFormerAdamIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)versionHash
{
  return self->_versionHash;
}

- (NSString)vendorID
{
  return self->_vendorID;
}

- (NSString)opaqueID
{
  return self->_opaqueID;
}

- (NSString)lyricsID
{
  return self->_lyricsID;
}

- (NSString)handoffCorrelationID
{
  return self->_handoffCorrelationID;
}

- (BOOL)isEqual:(id)a3
{
  MPIdentifierSet *v4;
  MPModelKind *modelKind;
  void *v6;
  NSString *databaseID;
  uint64_t v8;
  void *v9;
  NSString *v10;
  void *v11;
  char v12;
  int64_t persistentID;
  int64_t containedPersistentID;
  int64_t syncID;
  NSString *personID;
  uint64_t v17;
  void *v18;
  NSString *v19;
  void *v20;
  unint64_t cloudID;
  NSString *cloudAlbumID;
  uint64_t v23;
  void *v24;
  NSString *v25;
  void *v26;
  NSString *cloudArtistID;
  uint64_t v28;
  void *v29;
  NSString *v30;
  void *v31;
  NSString *recommendationID;
  uint64_t v33;
  void *v34;
  NSString *v35;
  void *v36;
  int64_t musicKit_possibleLibraryPersistentID;
  NSString *globalPlaylistID;
  int64_t adamID;
  NSArray *formerAdamIDs;
  uint64_t v41;
  void *v42;
  NSArray *v43;
  void *v44;
  NSString *universalCloudLibraryID;
  uint64_t v46;
  void *v47;
  NSString *v48;
  void *v49;
  int64_t purchasedAdamID;
  int64_t subscriptionAdamID;
  NSString *socialProfileID;
  NSString *informalMediaClipID;
  NSString *informalStaticAssetID;
  NSString *stationStringID;
  uint64_t v56;
  void *v57;
  NSString *v58;
  void *v59;
  NSString *stationHash;
  uint64_t v61;
  void *v62;
  NSString *v63;
  void *v64;
  int64_t stationID;
  NSString *stationEventID;
  uint64_t v67;
  void *v68;
  NSString *v69;
  void *v70;
  NSString *containerUniqueID;
  uint64_t v72;
  void *v73;
  NSString *v74;
  void *v75;
  NSString *handoffCorrelationID;
  uint64_t v77;
  void *v78;
  NSString *v79;
  void *v80;
  NSString *contentItemID;
  uint64_t v82;
  void *v83;
  NSString *v84;
  void *v85;
  NSString *lyricsID;
  uint64_t v87;
  void *v88;
  NSString *v89;
  void *v90;
  _BOOL4 shouldExcludeFromShuffle;
  _BOOL4 placeholder;
  NSString *vendorID;
  uint64_t v94;
  void *v95;
  NSString *v96;
  void *v97;
  NSString *opaqueID;
  NSString *v99;
  NSString *v100;
  int v101;
  NSString *versionHash;
  NSString *v104;

  v4 = (MPIdentifierSet *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    if (!-[MPIdentifierSet isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
      goto LABEL_89;
    modelKind = self->_modelKind;
    -[MPIdentifierSet modelKind](v4, "modelKind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(modelKind) = -[MPModelKind isEqual:](modelKind, "isEqual:", v6);

    if (!(_DWORD)modelKind)
      goto LABEL_89;
    databaseID = self->_databaseID;
    -[MPIdentifierSet databaseID](v4, "databaseID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (databaseID == (NSString *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      v10 = self->_databaseID;
      -[MPIdentifierSet databaseID](v4, "databaseID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = -[NSString isEqual:](v10, "isEqual:", v11);

      if (!(_DWORD)v10)
        goto LABEL_89;
    }
    persistentID = self->_persistentID;
    if (persistentID != -[MPIdentifierSet persistentID](v4, "persistentID"))
      goto LABEL_89;
    containedPersistentID = self->_containedPersistentID;
    if (containedPersistentID != -[MPIdentifierSet containedPersistentID](v4, "containedPersistentID"))
      goto LABEL_89;
    syncID = self->_syncID;
    if (syncID != -[MPIdentifierSet syncID](v4, "syncID"))
      goto LABEL_89;
    personID = self->_personID;
    -[MPIdentifierSet personID](v4, "personID");
    v17 = objc_claimAutoreleasedReturnValue();
    if (personID == (NSString *)v17)
    {

    }
    else
    {
      v18 = (void *)v17;
      v19 = self->_personID;
      -[MPIdentifierSet personID](v4, "personID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = -[NSString isEqual:](v19, "isEqual:", v20);

      if (!(_DWORD)v19)
        goto LABEL_89;
    }
    cloudID = self->_cloudID;
    if (cloudID != -[MPIdentifierSet cloudID](v4, "cloudID"))
      goto LABEL_89;
    cloudAlbumID = self->_cloudAlbumID;
    -[MPIdentifierSet cloudAlbumID](v4, "cloudAlbumID");
    v23 = objc_claimAutoreleasedReturnValue();
    if (cloudAlbumID == (NSString *)v23)
    {

    }
    else
    {
      v24 = (void *)v23;
      v25 = self->_cloudAlbumID;
      -[MPIdentifierSet cloudAlbumID](v4, "cloudAlbumID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v25) = -[NSString isEqual:](v25, "isEqual:", v26);

      if (!(_DWORD)v25)
        goto LABEL_89;
    }
    cloudArtistID = self->_cloudArtistID;
    -[MPIdentifierSet cloudArtistID](v4, "cloudArtistID");
    v28 = objc_claimAutoreleasedReturnValue();
    if (cloudArtistID == (NSString *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      v30 = self->_cloudArtistID;
      -[MPIdentifierSet cloudArtistID](v4, "cloudArtistID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v30) = -[NSString isEqual:](v30, "isEqual:", v31);

      if (!(_DWORD)v30)
        goto LABEL_89;
    }
    recommendationID = self->_recommendationID;
    -[MPIdentifierSet recommendationID](v4, "recommendationID");
    v33 = objc_claimAutoreleasedReturnValue();
    if (recommendationID == (NSString *)v33)
    {

    }
    else
    {
      v34 = (void *)v33;
      v35 = self->_recommendationID;
      -[MPIdentifierSet recommendationID](v4, "recommendationID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v35) = -[NSString isEqual:](v35, "isEqual:", v36);

      if (!(_DWORD)v35)
        goto LABEL_89;
    }
    musicKit_possibleLibraryPersistentID = self->_musicKit_possibleLibraryPersistentID;
    if (musicKit_possibleLibraryPersistentID != -[MPIdentifierSet musicKit_possibleLibraryPersistentID](v4, "musicKit_possibleLibraryPersistentID"))goto LABEL_89;
    globalPlaylistID = self->_globalPlaylistID;
    if (globalPlaylistID != v4->_globalPlaylistID && !-[NSString isEqual:](globalPlaylistID, "isEqual:"))
      goto LABEL_89;
    adamID = self->_adamID;
    if (adamID != -[MPIdentifierSet adamID](v4, "adamID"))
      goto LABEL_89;
    formerAdamIDs = self->_formerAdamIDs;
    -[MPIdentifierSet formerAdamIDs](v4, "formerAdamIDs");
    v41 = objc_claimAutoreleasedReturnValue();
    if (formerAdamIDs == (NSArray *)v41)
    {

    }
    else
    {
      v42 = (void *)v41;
      v43 = self->_formerAdamIDs;
      -[MPIdentifierSet formerAdamIDs](v4, "formerAdamIDs");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v43) = -[NSArray isEqual:](v43, "isEqual:", v44);

      if (!(_DWORD)v43)
        goto LABEL_89;
    }
    universalCloudLibraryID = self->_universalCloudLibraryID;
    -[MPIdentifierSet universalCloudLibraryID](v4, "universalCloudLibraryID");
    v46 = objc_claimAutoreleasedReturnValue();
    if (universalCloudLibraryID == (NSString *)v46)
    {

    }
    else
    {
      v47 = (void *)v46;
      v48 = self->_universalCloudLibraryID;
      -[MPIdentifierSet universalCloudLibraryID](v4, "universalCloudLibraryID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v48) = -[NSString isEqual:](v48, "isEqual:", v49);

      if (!(_DWORD)v48)
        goto LABEL_89;
    }
    purchasedAdamID = self->_purchasedAdamID;
    if (purchasedAdamID != -[MPIdentifierSet purchasedAdamID](v4, "purchasedAdamID"))
      goto LABEL_89;
    subscriptionAdamID = self->_subscriptionAdamID;
    if (subscriptionAdamID != -[MPIdentifierSet subscriptionAdamID](v4, "subscriptionAdamID"))
      goto LABEL_89;
    socialProfileID = self->_socialProfileID;
    if (socialProfileID != v4->_socialProfileID && !-[NSString isEqual:](socialProfileID, "isEqual:"))
      goto LABEL_89;
    informalMediaClipID = self->_informalMediaClipID;
    if (informalMediaClipID != v4->_informalMediaClipID
      && !-[NSString isEqual:](informalMediaClipID, "isEqual:"))
    {
      goto LABEL_89;
    }
    informalStaticAssetID = self->_informalStaticAssetID;
    if (informalStaticAssetID != v4->_informalStaticAssetID
      && !-[NSString isEqual:](informalStaticAssetID, "isEqual:"))
    {
      goto LABEL_89;
    }
    if (self->_reportingAdamID != v4->_reportingAdamID
      || self->_assetAdamID != v4->_assetAdamID
      || self->_lyricsAdamID != v4->_lyricsAdamID)
    {
      goto LABEL_89;
    }
    stationStringID = self->_stationStringID;
    -[MPIdentifierSet stationStringID](v4, "stationStringID");
    v56 = objc_claimAutoreleasedReturnValue();
    if (stationStringID == (NSString *)v56)
    {

    }
    else
    {
      v57 = (void *)v56;
      v58 = self->_stationStringID;
      -[MPIdentifierSet stationStringID](v4, "stationStringID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v58) = -[NSString isEqual:](v58, "isEqual:", v59);

      if (!(_DWORD)v58)
        goto LABEL_89;
    }
    stationHash = self->_stationHash;
    -[MPIdentifierSet stationHash](v4, "stationHash");
    v61 = objc_claimAutoreleasedReturnValue();
    if (stationHash == (NSString *)v61)
    {

    }
    else
    {
      v62 = (void *)v61;
      v63 = self->_stationHash;
      -[MPIdentifierSet stationHash](v4, "stationHash");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v63) = -[NSString isEqual:](v63, "isEqual:", v64);

      if (!(_DWORD)v63)
        goto LABEL_89;
    }
    stationID = self->_stationID;
    if (stationID != -[MPIdentifierSet stationID](v4, "stationID"))
    {
LABEL_89:
      v12 = 0;
      goto LABEL_90;
    }
    stationEventID = self->_stationEventID;
    -[MPIdentifierSet stationEventID](v4, "stationEventID");
    v67 = objc_claimAutoreleasedReturnValue();
    if (stationEventID == (NSString *)v67)
    {

    }
    else
    {
      v68 = (void *)v67;
      v69 = self->_stationEventID;
      -[MPIdentifierSet stationEventID](v4, "stationEventID");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v69) = -[NSString isEqual:](v69, "isEqual:", v70);

      if (!(_DWORD)v69)
        goto LABEL_89;
    }
    containerUniqueID = self->_containerUniqueID;
    -[MPIdentifierSet containerUniqueID](v4, "containerUniqueID");
    v72 = objc_claimAutoreleasedReturnValue();
    if (containerUniqueID == (NSString *)v72)
    {

    }
    else
    {
      v73 = (void *)v72;
      v74 = self->_containerUniqueID;
      -[MPIdentifierSet containerUniqueID](v4, "containerUniqueID");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v74) = -[NSString isEqual:](v74, "isEqual:", v75);

      if (!(_DWORD)v74)
        goto LABEL_89;
    }
    handoffCorrelationID = self->_handoffCorrelationID;
    -[MPIdentifierSet handoffCorrelationID](v4, "handoffCorrelationID");
    v77 = objc_claimAutoreleasedReturnValue();
    if (handoffCorrelationID == (NSString *)v77)
    {

    }
    else
    {
      v78 = (void *)v77;
      v79 = self->_handoffCorrelationID;
      -[MPIdentifierSet handoffCorrelationID](v4, "handoffCorrelationID");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v79) = -[NSString isEqual:](v79, "isEqual:", v80);

      if (!(_DWORD)v79)
        goto LABEL_89;
    }
    contentItemID = self->_contentItemID;
    -[MPIdentifierSet contentItemID](v4, "contentItemID");
    v82 = objc_claimAutoreleasedReturnValue();
    if (contentItemID == (NSString *)v82)
    {

    }
    else
    {
      v83 = (void *)v82;
      v84 = self->_contentItemID;
      -[MPIdentifierSet contentItemID](v4, "contentItemID");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v84) = -[NSString isEqual:](v84, "isEqual:", v85);

      if (!(_DWORD)v84)
        goto LABEL_89;
    }
    lyricsID = self->_lyricsID;
    -[MPIdentifierSet lyricsID](v4, "lyricsID");
    v87 = objc_claimAutoreleasedReturnValue();
    if (lyricsID == (NSString *)v87)
    {

    }
    else
    {
      v88 = (void *)v87;
      v89 = self->_lyricsID;
      -[MPIdentifierSet lyricsID](v4, "lyricsID");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v89) = -[NSString isEqual:](v89, "isEqual:", v90);

      if (!(_DWORD)v89)
        goto LABEL_89;
    }
    shouldExcludeFromShuffle = self->_shouldExcludeFromShuffle;
    if (shouldExcludeFromShuffle != -[MPIdentifierSet shouldExcludeFromShuffle](v4, "shouldExcludeFromShuffle"))
      goto LABEL_89;
    placeholder = self->_placeholder;
    if (placeholder != -[MPIdentifierSet isPlaceholder](v4, "isPlaceholder"))
      goto LABEL_89;
    vendorID = self->_vendorID;
    -[MPIdentifierSet vendorID](v4, "vendorID");
    v94 = objc_claimAutoreleasedReturnValue();
    if (vendorID == (NSString *)v94)
    {

    }
    else
    {
      v95 = (void *)v94;
      v96 = self->_vendorID;
      -[MPIdentifierSet vendorID](v4, "vendorID");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v96) = -[NSString isEqual:](v96, "isEqual:", v97);

      if (!(_DWORD)v96)
        goto LABEL_89;
    }
    opaqueID = self->_opaqueID;
    -[MPIdentifierSet opaqueID](v4, "opaqueID");
    v99 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
    if (opaqueID == v99)
    {

    }
    else
    {
      v100 = v99;
      v101 = -[NSString isEqual:](opaqueID, "isEqual:", v99);

      if (!v101)
        goto LABEL_89;
    }
    versionHash = self->_versionHash;
    -[MPIdentifierSet versionHash](v4, "versionHash");
    v104 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (versionHash == v104)
      v12 = 1;
    else
      v12 = -[NSString isEqual:](versionHash, "isEqual:", v104);

  }
LABEL_90:

  return v12;
}

- (NSString)databaseID
{
  return self->_databaseID;
}

- (int64_t)syncID
{
  return self->_syncID;
}

- (int64_t)containedPersistentID
{
  return self->_containedPersistentID;
}

- (unint64_t)cloudID
{
  return self->_cloudID;
}

- (NSString)cloudAlbumID
{
  return self->_cloudAlbumID;
}

- (NSString)personID
{
  return self->_personID;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (int64_t)musicKit_possibleLibraryPersistentID
{
  return self->_musicKit_possibleLibraryPersistentID;
}

- (NSString)recommendationID
{
  return self->_recommendationID;
}

- (NSString)cloudArtistID
{
  return self->_cloudArtistID;
}

- (void)setRadioIdentifiersWithBlock:(id)a3
{
  (*((void (**)(id, MPIdentifierSet *))a3 + 2))(a3, self);
}

- (void)setStationStringID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (BOOL)shouldExcludeFromShuffle
{
  return self->_shouldExcludeFromShuffle;
}

- (NSString)stationStringID
{
  return self->_stationStringID;
}

- (int64_t)stationID
{
  return self->_stationID;
}

- (NSString)stationHash
{
  return self->_stationHash;
}

- (NSString)stationEventID
{
  return self->_stationEventID;
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)setContentItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setContainerUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setLyricsAdamID:(int64_t)a3
{
  self->_lyricsAdamID = a3;
}

- (NSString)description
{
  MPIdentifierSet *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __CFString *v10;

  +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
  v3 = (MPIdentifierSet *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    v10 = CFSTR("<MPIdentifierSet EMPTY>");
  }
  else
  {
    -[MPIdentifierSet identifierDescriptions:](self, "identifierDescriptions:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    v6 = (void *)MEMORY[0x1E0CB3940];
    if (v5)
    {
      v7 = objc_opt_class();
      -[NSArray msv_compactDescription](self->_sources, "msv_compactDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "componentsJoinedByString:", CFSTR("; "));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@ sources=[%@] %@>"), v7, v8, v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[NSArray msv_compactDescription](self->_sources, "msv_compactDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<MPIdentifierSet EMPTY (not-singleton) sources=[%@]>"), v8);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  return (NSString *)v10;
}

+ (MPIdentifierSet)emptyIdentifierSet
{
  if (emptyIdentifierSet_sOnceToken != -1)
    dispatch_once(&emptyIdentifierSet_sOnceToken, &__block_literal_global_48026);
  return (MPIdentifierSet *)(id)emptyIdentifierSet_sEmptyIdentifierSet;
}

- (id)identifierDescriptions:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *modelKind;
  void *v44;
  id v45;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 50);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_placeholder)
    objc_msgSend(v5, "addObject:", CFSTR("placeholder=YES"));
  if (-[NSString length](self->_databaseID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("databaseID=\"%@\"), self->_databaseID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  if (-[NSString length](self->_personID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("personID=\"%@\"), self->_personID);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  if (self->_persistentID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("persistentID=%lld"), self->_persistentID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
  if (self->_containedPersistentID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("containedPersistentID=%lld"), self->_containedPersistentID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

  }
  if (self->_musicKit_possibleLibraryPersistentID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("musicKit_possibleLibraryPersistentID=%lld"), self->_musicKit_possibleLibraryPersistentID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v11);

  }
  if (self->_adamID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("storeAdamID=%lld"), self->_adamID);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v12);

  }
  if (-[NSString length](self->_cloudAlbumID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("storeCloudAlbumID=\"%@\"), self->_cloudAlbumID);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v13);

  }
  if (-[NSString length](self->_cloudArtistID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("storeCloudArtistID=\"%@\"), self->_cloudArtistID);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v14);

  }
  if (self->_cloudID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("storeCloudID=%lld"), self->_cloudID);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v15);

  }
  if (-[NSString length](self->_universalCloudLibraryID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cloudUniversalLibraryID=\"%@\"), self->_universalCloudLibraryID);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v16);

  }
  if (self->_purchasedAdamID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("storePurchasedAdamID=%lld"), self->_purchasedAdamID);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v17);

  }
  if (-[NSArray count](self->_formerAdamIDs, "count"))
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    -[NSArray componentsJoinedByString:](self->_formerAdamIDs, "componentsJoinedByString:", CFSTR(", "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("formerStoreAdamIDs=[%@]"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v20);

  }
  if (self->_subscriptionAdamID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("storeSubscriptionAdamID=%lld"), self->_subscriptionAdamID);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v21);

  }
  if (-[NSString length](self->_stationStringID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("radioStationStringID=\"%@\"), self->_stationStringID);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v22);

  }
  if (self->_stationID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("radioStationID=%lld"), self->_stationID);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v23);

  }
  if (-[NSString length](self->_stationHash, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("radioStationHash=\"%@\"), self->_stationHash);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v24);

  }
  if (-[NSString length](self->_stationEventID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("radioStationEventID=\"%@\"), self->_stationEventID);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v25);

  }
  if (-[NSString length](self->_globalPlaylistID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("globalPlaylistID=\"%@\"), self->_globalPlaylistID);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v26);

  }
  if (-[NSString length](self->_recommendationID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("storeRecommendationID=\"%@\"), self->_recommendationID);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v27);

  }
  if (-[NSString length](self->_containerUniqueID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("containerUniqueID=\"%@\"), self->_containerUniqueID);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v28);

  }
  if (-[NSString length](self->_handoffCorrelationID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("handoffCorrelationID=\"%@\"), self->_handoffCorrelationID);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v29);

  }
  if (-[NSString length](self->_contentItemID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("contentItemID=\"%@\"), self->_contentItemID);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v30);

  }
  if (-[NSString length](self->_lyricsID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lyricsID=\"%@\"), self->_lyricsID);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v31);

  }
  if (self->_shouldExcludeFromShuffle)
    objc_msgSend(v6, "addObject:", CFSTR("shouldExcludeFromShuffle=YES"));
  if (-[NSString length](self->_vendorID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("vendorID=\"%@\"), self->_vendorID);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v32);

  }
  if (-[NSString length](self->_opaqueID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("opaqueID=\"%@\"), self->_opaqueID);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v33);

  }
  if (-[NSString length](self->_versionHash, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("versionHash=\"%@\"), self->_versionHash);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v34);

  }
  if (-[NSString length](self->_informalMediaClipID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("informalMediaClipID=\"%@\"), self->_informalMediaClipID);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v35);

  }
  if (-[NSString length](self->_informalStaticAssetID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("informalStaticAssetID=\"%@\"), self->_informalStaticAssetID);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v36);

  }
  if (self->_reportingAdamID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reportingAdamID=%lld"), self->_reportingAdamID);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v37);

  }
  if (self->_assetAdamID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("assetAdamID=%lld"), self->_assetAdamID);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v38);

  }
  if (self->_lyricsAdamID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lyricsAdamID=%lld"), self->_lyricsAdamID);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v39);

  }
  if (-[NSString length](self->_socialProfileID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("socialProfileID=\"%@\"), self->_socialProfileID);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v40);

  }
  if (self->_syncID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("syncID=%lld"), self->_syncID);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v41);

  }
  if (objc_msgSend(v6, "count"))
  {
    v42 = (void *)MEMORY[0x1E0CB3940];
    modelKind = self->_modelKind;
    if (v3)
    {
      objc_msgSend(modelKind, "humanDescription");
      modelKind = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v42, "stringWithFormat:", CFSTR("kind=%@"), modelKind);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v44);

    if (v3)
  }
  v45 = v6;

  return v45;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_modelKind, 0);
  objc_storeStrong((id *)&self->_versionHash, 0);
  objc_storeStrong((id *)&self->_opaqueID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_lyricsID, 0);
  objc_storeStrong((id *)&self->_contentItemID, 0);
  objc_storeStrong((id *)&self->_handoffCorrelationID, 0);
  objc_storeStrong((id *)&self->_containerUniqueID, 0);
  objc_storeStrong((id *)&self->_stationEventID, 0);
  objc_storeStrong((id *)&self->_stationHash, 0);
  objc_storeStrong((id *)&self->_stationStringID, 0);
  objc_storeStrong((id *)&self->_informalStaticAssetID, 0);
  objc_storeStrong((id *)&self->_informalMediaClipID, 0);
  objc_storeStrong((id *)&self->_socialProfileID, 0);
  objc_storeStrong((id *)&self->_universalCloudLibraryID, 0);
  objc_storeStrong((id *)&self->_formerAdamIDs, 0);
  objc_storeStrong((id *)&self->_globalPlaylistID, 0);
  objc_storeStrong((id *)&self->_recommendationID, 0);
  objc_storeStrong((id *)&self->_cloudArtistID, 0);
  objc_storeStrong((id *)&self->_cloudAlbumID, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_databaseID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MPIdentifierSet)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  MPIdentifierSet *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPIdentifierSetCodingKeyModelKind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MPIdentifierSetCodingKeySources"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "arrayByAddingObject:", CFSTR("Decoded"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __33__MPIdentifierSet_initWithCoder___block_invoke;
  v14[3] = &unk_1E3163A58;
  v15 = v4;
  v11 = v4;
  v12 = -[MPIdentifierSet _initWithSources:modelKind:block:](self, "_initWithSources:modelKind:block:", v10, v5, v14);

  return v12;
}

- (NSString)humanDescription
{
  MPIdentifierSet *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
  v3 = (MPIdentifierSet *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    v9 = CFSTR("<MPIdentifierSet EMPTY>");
  }
  else
  {
    -[MPIdentifierSet identifierDescriptions:](self, "identifierDescriptions:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    v6 = (void *)MEMORY[0x1E0CB3940];
    if (v5)
    {
      objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray msv_compactDescription](self->_sources, "msv_compactDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("(%@) from [%@]"), v7, v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[NSArray msv_compactDescription](self->_sources, "msv_compactDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<MPIdentifierSet EMPTY (not-singleton) sources=[%@]>"), v7);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  return (NSString *)v9;
}

void __37__MPIdentifierSet_emptyIdentifierSet__block_invoke()
{
  MPIdentifierSet *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [MPIdentifierSet alloc];
  +[MPModelKind unknownKind](MPModelKind, "unknownKind");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[MPIdentifierSet _initWithSources:modelKind:block:](v0, "_initWithSources:modelKind:block:", &unk_1E31E6520, v3, &__block_literal_global_6_48028);
  v2 = (void *)emptyIdentifierSet_sEmptyIdentifierSet;
  emptyIdentifierSet_sEmptyIdentifierSet = v1;

}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MPModelKind *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  int64_t persistentID;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t containedPersistentID;
  int64_t v26;
  int64_t v27;
  uint64_t v28;
  int64_t v29;
  int64_t v30;
  int64_t v31;
  NSString *v32;
  unint64_t cloudID;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSString *v40;
  NSString *v41;
  NSString *v42;
  int64_t musicKit_possibleLibraryPersistentID;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSString *v50;
  int64_t adamID;
  int64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSArray *v58;
  uint64_t v59;
  int64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSString *v66;
  int64_t purchasedAdamID;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int64_t subscriptionAdamID;
  int64_t v75;
  int64_t v76;
  uint64_t v77;
  int64_t v78;
  int64_t v79;
  int64_t v80;
  NSString *v81;
  NSString *v82;
  NSString *v83;
  int64_t reportingAdamID;
  int64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int64_t assetAdamID;
  int64_t v92;
  int64_t v93;
  uint64_t v94;
  int64_t v95;
  int64_t v96;
  int64_t v97;
  int64_t lyricsAdamID;
  int64_t v99;
  int64_t v100;
  uint64_t v101;
  int64_t v102;
  int64_t v103;
  int64_t v104;
  NSString *v105;
  NSString *v106;
  int64_t stationID;
  int64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  NSString *v114;
  NSString *v115;
  NSString *v116;
  NSString *v117;
  NSString *v118;
  uint64_t placeholder;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  int64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  NSString *v129;
  NSString *v130;
  NSString *v131;
  int64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  int64_t v166;
  int64_t v167;
  unint64_t v168;
  int64_t v169;
  int64_t v170;
  uint64_t v171;
  int64_t v172;
  int64_t v173;
  int64_t v174;
  int64_t v175;
  int64_t v176;
  int64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  unint64_t v210;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v9 = self->_modelKind;
  v10 = -[MPModelKind hash](v9, "hash");
  v11 = v5 ^ 0x7465646279746573 ^ v10;
  v12 = (v6 + v7) ^ __ROR8__(v7, 51);
  v13 = v8 + v11;
  v14 = (v8 + v11) ^ __ROR8__(v11, 48);
  v15 = __ROR8__(v6 + v7, 32) + v14;
  v16 = v13 + v12;
  v191 = __ROR8__(v16, 32);
  v200 = v15 ^ __ROR8__(v14, 43);
  v165 = v15 ^ v10;
  v178 = v16 ^ __ROR8__(v12, 47);

  v17 = objc_retainAutorelease(self->_databaseID);
  -[NSString UTF8String](v17, "UTF8String");
  -[NSString length](v17, "length");

  persistentID = self->_persistentID;
  v19 = (v165 + v178) ^ __ROR8__(v178, 51);
  v20 = v191 + (v200 ^ persistentID);
  v21 = __ROR8__(v200 ^ persistentID, 48);
  v22 = __ROR8__(v165 + v178, 32) + (v20 ^ v21);
  v23 = v22 ^ __ROR8__(v20 ^ v21, 43);
  v24 = v20 + v19;
  v166 = v22 ^ persistentID;
  v179 = v24 ^ __ROR8__(v19, 47);
  containedPersistentID = self->_containedPersistentID;
  v26 = (v166 + v179) ^ __ROR8__(v179, 51);
  v27 = __ROR8__(v24, 32) + (v23 ^ containedPersistentID);
  v28 = __ROR8__(v23 ^ containedPersistentID, 48);
  v29 = __ROR8__(v166 + v179, 32) + (v27 ^ v28);
  v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
  v31 = v27 + v26;
  v192 = __ROR8__(v31, 32);
  v201 = v30;
  v167 = v29 ^ containedPersistentID;
  v180 = v31 ^ __ROR8__(v26, 47);
  v32 = objc_retainAutorelease(self->_personID);
  -[NSString UTF8String](v32, "UTF8String");
  -[NSString length](v32, "length");

  cloudID = self->_cloudID;
  v34 = (v167 + v180) ^ __ROR8__(v180, 51);
  v35 = v192 + (v201 ^ cloudID);
  v36 = __ROR8__(v201 ^ cloudID, 48);
  v37 = (v35 ^ v36) + __ROR8__(v167 + v180, 32);
  v38 = v37 ^ __ROR8__(v35 ^ v36, 43);
  v39 = v35 + v34;
  v193 = __ROR8__(v39, 32);
  v202 = v38;
  v168 = v37 ^ cloudID;
  v181 = v39 ^ __ROR8__(v34, 47);
  v40 = objc_retainAutorelease(self->_cloudAlbumID);
  -[NSString UTF8String](v40, "UTF8String");
  -[NSString length](v40, "length");

  v41 = objc_retainAutorelease(self->_cloudArtistID);
  -[NSString UTF8String](v41, "UTF8String");
  -[NSString length](v41, "length");

  v42 = objc_retainAutorelease(self->_recommendationID);
  -[NSString UTF8String](v42, "UTF8String");
  -[NSString length](v42, "length");

  musicKit_possibleLibraryPersistentID = self->_musicKit_possibleLibraryPersistentID;
  v44 = (v168 + v181) ^ __ROR8__(v181, 51);
  v45 = v193 + (v202 ^ musicKit_possibleLibraryPersistentID);
  v46 = __ROR8__(v202 ^ musicKit_possibleLibraryPersistentID, 48);
  v47 = (v45 ^ v46) + __ROR8__(v168 + v181, 32);
  v48 = v47 ^ __ROR8__(v45 ^ v46, 43);
  v49 = v45 + v44;
  v194 = __ROR8__(v49, 32);
  v203 = v48;
  v169 = v47 ^ musicKit_possibleLibraryPersistentID;
  v182 = v49 ^ __ROR8__(v44, 47);
  v50 = objc_retainAutorelease(self->_globalPlaylistID);
  -[NSString UTF8String](v50, "UTF8String");
  -[NSString length](v50, "length");

  adamID = self->_adamID;
  v52 = (v169 + v182) ^ __ROR8__(v182, 51);
  v53 = v194 + (v203 ^ adamID);
  v54 = __ROR8__(v203 ^ adamID, 48);
  v55 = (v53 ^ v54) + __ROR8__(v169 + v182, 32);
  v56 = v55 ^ __ROR8__(v53 ^ v54, 43);
  v57 = v53 + v52;
  v195 = __ROR8__(v57, 32);
  v204 = v56;
  v170 = v55 ^ adamID;
  v183 = v57 ^ __ROR8__(v52, 47);
  v58 = self->_formerAdamIDs;
  v59 = -[NSArray hash](v58, "hash");
  v60 = (v170 + v183) ^ __ROR8__(v183, 51);
  v61 = v195 + (v204 ^ v59);
  v62 = __ROR8__(v204 ^ v59, 48);
  v63 = (v61 ^ v62) + __ROR8__(v170 + v183, 32);
  v64 = v63 ^ __ROR8__(v61 ^ v62, 43);
  v65 = v61 + v60;
  v196 = __ROR8__(v65, 32);
  v205 = v64;
  v171 = v63 ^ v59;
  v184 = v65 ^ __ROR8__(v60, 47);

  v66 = objc_retainAutorelease(self->_universalCloudLibraryID);
  -[NSString UTF8String](v66, "UTF8String");
  -[NSString length](v66, "length");

  purchasedAdamID = self->_purchasedAdamID;
  v68 = (v171 + v184) ^ __ROR8__(v184, 51);
  v69 = v196 + (v205 ^ purchasedAdamID);
  v70 = __ROR8__(v205 ^ purchasedAdamID, 48);
  v71 = (v69 ^ v70) + __ROR8__(v171 + v184, 32);
  v72 = v71 ^ __ROR8__(v69 ^ v70, 43);
  v73 = v69 + v68;
  v172 = v71 ^ purchasedAdamID;
  v185 = v73 ^ __ROR8__(v68, 47);
  subscriptionAdamID = self->_subscriptionAdamID;
  v75 = (v172 + v185) ^ __ROR8__(v185, 51);
  v76 = __ROR8__(v73, 32) + (v72 ^ subscriptionAdamID);
  v77 = __ROR8__(v72 ^ subscriptionAdamID, 48);
  v78 = (v76 ^ v77) + __ROR8__(v172 + v185, 32);
  v79 = v78 ^ __ROR8__(v76 ^ v77, 43);
  v80 = v76 + v75;
  v197 = __ROR8__(v80, 32);
  v206 = v79;
  v173 = v78 ^ subscriptionAdamID;
  v186 = v80 ^ __ROR8__(v75, 47);
  v81 = objc_retainAutorelease(self->_socialProfileID);
  -[NSString UTF8String](v81, "UTF8String");
  -[NSString length](v81, "length");

  v82 = objc_retainAutorelease(self->_informalMediaClipID);
  -[NSString UTF8String](v82, "UTF8String");
  -[NSString length](v82, "length");

  v83 = objc_retainAutorelease(self->_informalStaticAssetID);
  -[NSString UTF8String](v83, "UTF8String");
  -[NSString length](v83, "length");

  reportingAdamID = self->_reportingAdamID;
  v85 = (v173 + v186) ^ __ROR8__(v186, 51);
  v86 = v197 + (v206 ^ reportingAdamID);
  v87 = __ROR8__(v206 ^ reportingAdamID, 48);
  v88 = (v86 ^ v87) + __ROR8__(v173 + v186, 32);
  v89 = v88 ^ __ROR8__(v86 ^ v87, 43);
  v90 = v86 + v85;
  v174 = v88 ^ reportingAdamID;
  v187 = v90 ^ __ROR8__(v85, 47);
  assetAdamID = self->_assetAdamID;
  v92 = (v174 + v187) ^ __ROR8__(v187, 51);
  v93 = __ROR8__(v90, 32) + (v89 ^ assetAdamID);
  v94 = __ROR8__(v89 ^ assetAdamID, 48);
  v95 = (v93 ^ v94) + __ROR8__(v174 + v187, 32);
  v96 = v95 ^ __ROR8__(v93 ^ v94, 43);
  v97 = v93 + v92;
  v175 = v95 ^ assetAdamID;
  v188 = v97 ^ __ROR8__(v92, 47);
  lyricsAdamID = self->_lyricsAdamID;
  v99 = (v175 + v188) ^ __ROR8__(v188, 51);
  v100 = __ROR8__(v97, 32) + (v96 ^ lyricsAdamID);
  v101 = __ROR8__(v96 ^ lyricsAdamID, 48);
  v102 = (v100 ^ v101) + __ROR8__(v175 + v188, 32);
  v103 = v102 ^ __ROR8__(v100 ^ v101, 43);
  v104 = v100 + v99;
  v198 = __ROR8__(v104, 32);
  v207 = v103;
  v176 = v102 ^ lyricsAdamID;
  v189 = v104 ^ __ROR8__(v99, 47);
  v105 = objc_retainAutorelease(self->_stationStringID);
  -[NSString UTF8String](v105, "UTF8String");
  -[NSString length](v105, "length");

  v106 = objc_retainAutorelease(self->_stationHash);
  -[NSString UTF8String](v106, "UTF8String");
  -[NSString length](v106, "length");

  stationID = self->_stationID;
  v108 = (v176 + v189) ^ __ROR8__(v189, 51);
  v109 = v198 + (v207 ^ stationID);
  v110 = __ROR8__(v207 ^ stationID, 48);
  v111 = (v109 ^ v110) + __ROR8__(v176 + v189, 32);
  v112 = v111 ^ __ROR8__(v109 ^ v110, 43);
  v113 = v109 + v108;
  v199 = __ROR8__(v113, 32);
  v208 = v112;
  v177 = v111 ^ stationID;
  v190 = v113 ^ __ROR8__(v108, 47);
  v114 = objc_retainAutorelease(self->_stationEventID);
  -[NSString UTF8String](v114, "UTF8String");
  -[NSString length](v114, "length");

  v115 = objc_retainAutorelease(self->_containerUniqueID);
  -[NSString UTF8String](v115, "UTF8String");
  -[NSString length](v115, "length");

  v116 = objc_retainAutorelease(self->_handoffCorrelationID);
  -[NSString UTF8String](v116, "UTF8String");
  -[NSString length](v116, "length");

  v117 = objc_retainAutorelease(self->_contentItemID);
  -[NSString UTF8String](v117, "UTF8String");
  -[NSString length](v117, "length");

  v118 = objc_retainAutorelease(self->_lyricsID);
  -[NSString UTF8String](v118, "UTF8String");
  -[NSString length](v118, "length");

  placeholder = self->_placeholder;
  v120 = (self->_shouldExcludeFromShuffle | 0x6800000000000000) + 0x400000000000000;
  v209 = v120;
  if ((v120 & 0x400000000000000) != 0)
  {
    if ((v120 & 0x300000000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "handleFailureInFunction:file:lineNumber:description:", v164, CFSTR("MSVHasher+SipHash.h"), 91, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld"), v209);

      v120 = v209;
    }
    v122 = v120 & 0xFFFFFFFFFFFFFFLL | (placeholder << 32);
    v123 = (v177 + v190) ^ __ROR8__(v190, 51);
    v124 = v199 + (v122 ^ v208);
    v125 = __ROR8__(v122 ^ v208, 48);
    v126 = (v124 ^ v125) + __ROR8__(v177 + v190, 32);
    v127 = v126 ^ __ROR8__(v124 ^ v125, 43);
    v128 = v124 + v123;
    v199 = __ROR8__(v128, 32);
    v208 = v127;
    v177 = v126 ^ v122;
    v190 = v128 ^ __ROR8__(v123, 47);
    v121 = v120 & 0xFF00000000000000;
  }
  else
  {
    if ((v120 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "handleFailureInFunction:file:lineNumber:description:", v162, CFSTR("MSVHasher+SipHash.h"), 88, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v209);

      v120 = v209;
    }
    v121 = v120 | placeholder;
  }
  v210 = v121 + 0x400000000000000;
  v129 = objc_retainAutorelease(self->_vendorID);
  -[NSString UTF8String](v129, "UTF8String");
  -[NSString length](v129, "length");

  v130 = objc_retainAutorelease(self->_opaqueID);
  -[NSString UTF8String](v130, "UTF8String");
  -[NSString length](v130, "length");

  v131 = objc_retainAutorelease(self->_versionHash);
  -[NSString UTF8String](v131, "UTF8String");
  -[NSString length](v131, "length");

  v132 = (v177 + v190) ^ __ROR8__(v190, 51);
  v133 = v199 + (v208 ^ v210);
  v134 = __ROR8__(v208 ^ v210, 48);
  v135 = (v133 ^ v134) + __ROR8__(v177 + v190, 32);
  v136 = v135 ^ __ROR8__(v133 ^ v134, 43);
  v137 = v133 + v132;
  v138 = v137 ^ __ROR8__(v132, 47);
  v139 = (v135 ^ v210) + v138;
  v140 = v139 ^ __ROR8__(v138, 51);
  v141 = (__ROR8__(v137, 32) ^ 0xFFLL) + v136;
  v142 = __ROR8__(v136, 48);
  v143 = __ROR8__(v139, 32) + (v141 ^ v142);
  v144 = v143 ^ __ROR8__(v141 ^ v142, 43);
  v145 = v140 + v141;
  v146 = v145 ^ __ROR8__(v140, 47);
  v147 = v146 + v143;
  v148 = v147 ^ __ROR8__(v146, 51);
  v149 = __ROR8__(v145, 32) + v144;
  v150 = __ROR8__(v144, 48);
  v151 = __ROR8__(v147, 32) + (v149 ^ v150);
  v152 = v151 ^ __ROR8__(v149 ^ v150, 43);
  v153 = v148 + v149;
  v154 = v153 ^ __ROR8__(v148, 47);
  v155 = v154 + v151;
  v156 = v155 ^ __ROR8__(v154, 51);
  v157 = __ROR8__(v153, 32) + v152;
  v158 = __ROR8__(v152, 48);
  v159 = __ROR8__(v155, 32) + (v157 ^ v158);
  return (v156 + v157) ^ __ROR8__(v156, 47) ^ v159 ^ __ROR8__(v156 + v157, 32) ^ v159 ^ __ROR8__(v157 ^ v158, 43);
}

- (NSString)globalPlaylistID
{
  return self->_globalPlaylistID;
}

- (MPIdentifierSet)initWithModelKind:(id)a3 block:(id)a4
{
  return (MPIdentifierSet *)-[MPIdentifierSet _initWithSources:modelKind:block:](self, "_initWithSources:modelKind:block:", &unk_1E31E6538, a3, a4);
}

- (MPIdentifierSet)initWithModelKind:(id)a3 musicKitBlock:(id)a4
{
  return (MPIdentifierSet *)-[MPIdentifierSet _initWithSources:modelKind:block:](self, "_initWithSources:modelKind:block:", &unk_1E31E6550, a3, a4);
}

- (MPIdentifierSet)initWithSource:(id)a3 modelKind:(id)a4 musicKitBlock:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  MPIdentifierSet *v13;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[MPIdentifierSet _initWithSources:modelKind:block:](self, "_initWithSources:modelKind:block:", v12, v10, v9, v15, v16);
  return v13;
}

- (MPIdentifierSet)initWithBlock:(id)a3
{
  id v4;
  void *v5;
  MPIdentifierSet *v6;

  v4 = a3;
  +[MPModelKind unknownKind](MPModelKind, "unknownKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPIdentifierSet _initWithSources:modelKind:block:](self, "_initWithSources:modelKind:block:", &unk_1E31E6568, v5, v4);

  return v6;
}

- (id)copyWithBlock:(id)a3
{
  return -[MPIdentifierSet _copyWithSources:block:](self, "_copyWithSources:block:", &unk_1E31E6580, a3);
}

- (id)copyWithSource:(id)a3 block:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MPIdentifierSet _copyWithSources:block:](self, "_copyWithSources:block:", v9, v7, v12, v13);
  return v10;
}

- (id)copyWithMusicKitBlock:(id)a3
{
  return -[MPIdentifierSet _copyWithSources:block:](self, "_copyWithSources:block:", &unk_1E31E6598, a3);
}

- (id)copyWithSource:(id)a3 musicKitBlock:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MPIdentifierSet _copyWithSources:block:](self, "_copyWithSources:block:", v9, v7, v12, v13);
  return v10;
}

- (id)_copyWithSources:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)objc_opt_class());
  -[MPIdentifierSet sources](self, "sources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPIdentifierSet modelKind](self, "modelKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__MPIdentifierSet__copyWithSources_block___block_invoke;
  v15[3] = &unk_1E3162B58;
  v15[4] = self;
  v16 = v6;
  v12 = v6;
  v13 = (void *)objc_msgSend(v8, "_initWithSources:modelKind:block:", v10, v11, v15);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  MPModelKind *modelKind;
  id v5;

  modelKind = self->_modelKind;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", modelKind, CFSTR("MPIdentifierSetCodingKeyModelKind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sources, CFSTR("MPIdentifierSetCodingKeySources"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_databaseID, CFSTR("MPIdentifierSetCodingKeyDatabaseID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_persistentID, CFSTR("MPIdentifierSetDeviceLibraryPersistentID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_containedPersistentID, CFSTR("MPIdentifierSetDeviceLibraryContainedPersistentID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_syncID, CFSTR("MPIdentifierSetSyncID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_musicKit_possibleLibraryPersistentID, CFSTR("_MPIdentifierSetCodingKeyMusicKitPossibleLibraryPersistentID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personID, CFSTR("MPIdentifierSetCodingKeyPersonID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_cloudID, CFSTR("MPIdentifierSetStoreCloudID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cloudAlbumID, CFSTR("MPIdentifierSetStoreCloudAlbumID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cloudArtistID, CFSTR("MPIdentifierSetStoreCloudArtistID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recommendationID, CFSTR("MPIdentifierSetStoreRecommendationID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_globalPlaylistID, CFSTR("MPIdentifierSetGlobalPlaylistID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_adamID, CFSTR("MPIdentifierSetStoreAdamID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formerAdamIDs, CFSTR("MPIdentifierSetFormerStoreAdamIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_universalCloudLibraryID, CFSTR("MPIdentifierSetCloudUniversalLibraryID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_purchasedAdamID, CFSTR("MPIdentifierSetStorePurchasedAdamID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_subscriptionAdamID, CFSTR("MPIdentifierSetStoreSubscriptionAdamID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_socialProfileID, CFSTR("MPIdentifierSetSocialProfileID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_informalMediaClipID, CFSTR("MPIdentifierSetInformalMediaClipID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_informalStaticAssetID, CFSTR("MPIdentifierSetInformalStaticAssetID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_reportingAdamID, CFSTR("MPIdentifierSetReportingAdamID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_assetAdamID, CFSTR("MPIdentifierSetAssetAdamID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_lyricsAdamID, CFSTR("MPIdentifierSetLyricsAdamID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stationStringID, CFSTR("MPIdentifierSetRadioStationStringID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stationHash, CFSTR("MPIdentifierSetRadioStationHash"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_stationID, CFSTR("MPIdentifierSetRadioStationID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stationEventID, CFSTR("MPIdentifierSetRadioStationEventID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerUniqueID, CFSTR("MPIdentifierSetContainerUniqueID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handoffCorrelationID, CFSTR("MPIdentifierSetHandoffCorrelationID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentItemID, CFSTR("MPIdentifierSetContentItemID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lyricsID, CFSTR("MPIdentifierSetLyricsID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldExcludeFromShuffle, CFSTR("MPIdentifierSetShouldExcludeFromShuffle"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_placeholder, CFSTR("MPIdentifierSetIsPlaceholder"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vendorID, CFSTR("MPIdentifierSetVendorID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_opaqueID, CFSTR("MPIdentifierSetOpaqueID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_versionHash, CFSTR("MPIdentifierSetVersionHash"));

}

- (BOOL)hasCommonIdentifierWithIdentifierSet:(id)a3
{
  id v4;
  void *v5;
  int64_t persistentID;
  void *v7;
  uint64_t v8;
  int64_t adamID;
  void *v10;
  uint64_t v11;
  int64_t purchasedAdamID;
  void *v13;
  uint64_t v14;
  int64_t subscriptionAdamID;
  void *v16;
  uint64_t v17;
  unint64_t cloudID;
  void *v19;
  uint64_t v20;
  NSString *universalCloudLibraryID;
  void *v22;
  void *v23;
  BOOL v24;
  int64_t stationID;
  void *v26;
  uint64_t v27;
  NSString *stationStringID;
  void *v29;
  void *v30;
  BOOL v31;
  NSString *stationEventID;
  void *v33;
  void *v34;
  BOOL v35;
  NSString *stationHash;
  void *v37;
  void *v38;
  BOOL v39;
  NSString *globalPlaylistID;
  void *v41;
  void *v42;
  BOOL v43;
  NSString *contentItemID;
  void *v45;
  BOOL v46;
  NSString *lyricsID;
  void *v48;
  BOOL v49;
  NSString *vendorID;
  void *v51;
  BOOL v52;
  NSString *opaqueID;
  void *v54;
  BOOL v55;
  NSString *versionHash;
  void *v57;
  BOOL v58;
  NSString *informalMediaClipID;
  void *v60;
  void *v61;
  BOOL v62;
  NSString *informalStaticAssetID;
  void *v64;
  void *v65;
  BOOL v66;
  int64_t reportingAdamID;
  void *v68;
  uint64_t v69;
  int64_t assetAdamID;
  void *v71;
  uint64_t v72;
  int64_t lyricsAdamID;
  void *v74;
  uint64_t v75;
  NSString *socialProfileID;
  void *v77;
  void *v78;
  BOOL v79;
  NSArray *formerAdamIDs;
  void *v81;
  void *v82;
  int64_t syncID;
  void *v84;
  uint64_t v85;
  int64_t musicKit_possibleLibraryPersistentID;

  v4 = a3;
  v5 = v4;
  persistentID = self->_persistentID;
  if (persistentID)
  {
    objc_msgSend(v4, "library");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "persistentID");

    if (persistentID == v8)
      goto LABEL_49;
  }
  adamID = self->_adamID;
  if (adamID)
  {
    objc_msgSend(v5, "universalStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "adamID");

    if (adamID == v11)
      goto LABEL_49;
  }
  purchasedAdamID = self->_purchasedAdamID;
  if (purchasedAdamID)
  {
    objc_msgSend(v5, "universalStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "purchasedAdamID");

    if (purchasedAdamID == v14)
      goto LABEL_49;
  }
  subscriptionAdamID = self->_subscriptionAdamID;
  if (subscriptionAdamID)
  {
    objc_msgSend(v5, "universalStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "subscriptionAdamID");

    if (subscriptionAdamID == v17)
      goto LABEL_49;
  }
  cloudID = self->_cloudID;
  if (cloudID)
  {
    objc_msgSend(v5, "personalizedStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "cloudID");

    if (cloudID == v20)
      goto LABEL_49;
  }
  universalCloudLibraryID = self->_universalCloudLibraryID;
  if (universalCloudLibraryID)
  {
    objc_msgSend(v5, "universalStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "universalCloudLibraryID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[NSString isEqualToString:](universalCloudLibraryID, "isEqualToString:", v23);

    if (v24)
      goto LABEL_49;
  }
  stationID = self->_stationID;
  if (stationID)
  {
    objc_msgSend(v5, "radio");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "stationID");

    if (stationID == v27)
      goto LABEL_49;
  }
  stationStringID = self->_stationStringID;
  if (stationStringID)
  {
    objc_msgSend(v5, "radio");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stationStringID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[NSString isEqualToString:](stationStringID, "isEqualToString:", v30);

    if (v31)
      goto LABEL_49;
  }
  stationEventID = self->_stationEventID;
  if (stationEventID)
  {
    objc_msgSend(v5, "radio");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stationEventID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[NSString isEqualToString:](stationEventID, "isEqualToString:", v34);

    if (v35)
      goto LABEL_49;
  }
  stationHash = self->_stationHash;
  if (stationHash)
  {
    objc_msgSend(v5, "radio");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stationHash");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[NSString isEqualToString:](stationHash, "isEqualToString:", v38);

    if (v39)
      goto LABEL_49;
  }
  globalPlaylistID = self->_globalPlaylistID;
  if (globalPlaylistID)
  {
    objc_msgSend(v5, "universalStore");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "globalPlaylistID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[NSString isEqualToString:](globalPlaylistID, "isEqualToString:", v42);

    if (v43)
      goto LABEL_49;
  }
  contentItemID = self->_contentItemID;
  if (contentItemID)
  {
    objc_msgSend(v5, "contentItemID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[NSString isEqualToString:](contentItemID, "isEqualToString:", v45);

    if (v46)
      goto LABEL_49;
  }
  lyricsID = self->_lyricsID;
  if (lyricsID)
  {
    objc_msgSend(v5, "lyricsID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[NSString isEqualToString:](lyricsID, "isEqualToString:", v48);

    if (v49)
      goto LABEL_49;
  }
  vendorID = self->_vendorID;
  if (vendorID)
  {
    objc_msgSend(v5, "vendorID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[NSString isEqualToString:](vendorID, "isEqualToString:", v51);

    if (v52)
      goto LABEL_49;
  }
  opaqueID = self->_opaqueID;
  if (opaqueID)
  {
    objc_msgSend(v5, "opaqueID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[NSString isEqualToString:](opaqueID, "isEqualToString:", v54);

    if (v55)
      goto LABEL_49;
  }
  versionHash = self->_versionHash;
  if (versionHash)
  {
    objc_msgSend(v5, "versionHash");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = -[NSString isEqualToString:](versionHash, "isEqualToString:", v57);

    if (v58)
      goto LABEL_49;
  }
  informalMediaClipID = self->_informalMediaClipID;
  if (informalMediaClipID)
  {
    objc_msgSend(v5, "universalStore");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "informalMediaClipID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = -[NSString isEqualToString:](informalMediaClipID, "isEqualToString:", v61);

    if (v62)
      goto LABEL_49;
  }
  informalStaticAssetID = self->_informalStaticAssetID;
  if (informalStaticAssetID)
  {
    objc_msgSend(v5, "universalStore");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "informalStaticAssetID");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = -[NSString isEqualToString:](informalStaticAssetID, "isEqualToString:", v65);

    if (v66)
      goto LABEL_49;
  }
  reportingAdamID = self->_reportingAdamID;
  if (reportingAdamID)
  {
    objc_msgSend(v5, "universalStore");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "reportingAdamID");

    if (reportingAdamID == v69)
      goto LABEL_49;
  }
  assetAdamID = self->_assetAdamID;
  if (assetAdamID)
  {
    objc_msgSend(v5, "universalStore");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "assetAdamID");

    if (assetAdamID == v72)
      goto LABEL_49;
  }
  lyricsAdamID = self->_lyricsAdamID;
  if (lyricsAdamID)
  {
    objc_msgSend(v5, "universalStore");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "lyricsAdamID");

    if (lyricsAdamID == v75)
      goto LABEL_49;
  }
  socialProfileID = self->_socialProfileID;
  if (socialProfileID)
  {
    objc_msgSend(v5, "universalStore");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "socialProfileID");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = -[NSString isEqualToString:](socialProfileID, "isEqualToString:", v78);

    if (v79)
      goto LABEL_49;
  }
  if (-[NSArray count](self->_formerAdamIDs, "count"))
  {
    formerAdamIDs = self->_formerAdamIDs;
    objc_msgSend(v5, "universalStore");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "formerAdamIDs");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(formerAdamIDs) = -[NSArray isEqualToArray:](formerAdamIDs, "isEqualToArray:", v82);

    if ((formerAdamIDs & 1) != 0)
      goto LABEL_49;
  }
  syncID = self->_syncID;
  if (syncID
    && (objc_msgSend(v5, "library"),
        v84 = (void *)objc_claimAutoreleasedReturnValue(),
        v85 = objc_msgSend(v84, "syncID"),
        v84,
        syncID == v85))
  {
LABEL_49:
    LOBYTE(musicKit_possibleLibraryPersistentID) = 1;
  }
  else
  {
    musicKit_possibleLibraryPersistentID = self->_musicKit_possibleLibraryPersistentID;
    if (musicKit_possibleLibraryPersistentID)
      LOBYTE(musicKit_possibleLibraryPersistentID) = musicKit_possibleLibraryPersistentID == objc_msgSend(v5, "musicKit_possibleLibraryPersistentID");
  }

  return musicKit_possibleLibraryPersistentID;
}

- (id)unionSet:(id)a3
{
  return -[MPIdentifierSet unionSet:block:](self, "unionSet:block:", a3, &__block_literal_global_125_47902);
}

- (id)unionSet:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  MPIdentifierSet *v8;
  MPIdentifierSet *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  MPIdentifierSet *v16;
  MPIdentifierSet *v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_10;
  +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
  v8 = (MPIdentifierSet *)(id)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {

    goto LABEL_8;
  }
  v9 = v8;
  v10 = -[MPIdentifierSet isEqual:](self, "isEqual:", v8);

  if (v10)
  {
LABEL_8:
    v17 = (MPIdentifierSet *)v6;
LABEL_11:
    v16 = v17;
    goto LABEL_12;
  }
  +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v6)
  {

    goto LABEL_10;
  }
  v12 = v11;
  v13 = objc_msgSend(v6, "isEqual:", v11);

  if (v13)
  {
LABEL_10:
    v17 = self;
    goto LABEL_11;
  }
  objc_msgSend(v6, "sources");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E31E65B0, "arrayByAddingObjectsFromArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __34__MPIdentifierSet_unionSet_block___block_invoke;
  v19[3] = &unk_1E3162B58;
  v20 = v6;
  v21 = v7;
  v16 = -[MPIdentifierSet _copyWithSources:block:](self, "_copyWithSources:block:", v15, v19);

LABEL_12:
  return v16;
}

- (void)clearUniversalStoreIdentifiers
{
  NSString *globalPlaylistID;
  NSArray *formerAdamIDs;
  NSArray *v5;
  NSString *universalCloudLibraryID;
  NSString *socialProfileID;
  NSString *informalMediaClipID;
  NSString *informalStaticAssetID;

  globalPlaylistID = self->_globalPlaylistID;
  self->_globalPlaylistID = 0;

  formerAdamIDs = self->_formerAdamIDs;
  v5 = (NSArray *)MEMORY[0x1E0C9AA60];
  self->_adamID = 0;
  self->_formerAdamIDs = v5;

  universalCloudLibraryID = self->_universalCloudLibraryID;
  self->_universalCloudLibraryID = 0;

  self->_purchasedAdamID = 0;
  self->_subscriptionAdamID = 0;
  socialProfileID = self->_socialProfileID;
  self->_socialProfileID = 0;

  informalMediaClipID = self->_informalMediaClipID;
  self->_informalMediaClipID = 0;

  informalStaticAssetID = self->_informalStaticAssetID;
  self->_informalStaticAssetID = 0;

  self->_reportingAdamID = 0;
  self->_assetAdamID = 0;
  self->_lyricsAdamID = 0;
}

- (void)setModelKind:(id)a3
{
  MPModelKind *v4;
  MPModelKind *modelKind;

  v4 = (MPModelKind *)objc_msgSend(a3, "copy");
  modelKind = self->_modelKind;
  self->_modelKind = v4;

}

- (void)clearRadioIdentifiers
{
  NSString *stationStringID;
  NSString *stationHash;
  NSString *stationEventID;

  stationStringID = self->_stationStringID;
  self->_stationStringID = 0;

  stationHash = self->_stationHash;
  self->_stationHash = 0;

  stationEventID = self->_stationEventID;
  self->_stationID = 0;
  self->_stationEventID = 0;

}

- (int64_t)deviceLibraryPersistentID
{
  return self->_persistentID;
}

- (void)setDeviceLibraryPersistentID:(int64_t)a3
{
  -[MPIdentifierSet _setDefaultDatabaseIDIfNeeded](self, "_setDefaultDatabaseIDIfNeeded");
  self->_persistentID = a3;
}

- (NSString)radioStationStringID
{
  return self->_stationStringID;
}

- (void)setRadioStationStringID:(id)a3
{
  NSString *v4;
  NSString *stationStringID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  stationStringID = self->_stationStringID;
  self->_stationStringID = v4;

}

- (NSString)radioStationHash
{
  return self->_stationHash;
}

- (void)setRadioStationHash:(id)a3
{
  NSString *v4;
  NSString *stationHash;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  stationHash = self->_stationHash;
  self->_stationHash = v4;

}

- (int64_t)radioStationID
{
  return self->_stationID;
}

- (void)setRadioStationID:(int64_t)a3
{
  self->_stationID = a3;
}

- (int64_t)storeAdamID
{
  return self->_adamID;
}

- (void)setStoreAdamID:(int64_t)a3
{
  self->_adamID = a3;
}

- (NSArray)formerStoreAdamIDs
{
  return self->_formerAdamIDs;
}

- (void)setFormerStoreAdamIDs:(id)a3
{
  NSArray *v4;
  NSArray *formerAdamIDs;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  formerAdamIDs = self->_formerAdamIDs;
  self->_formerAdamIDs = v4;

}

- (unint64_t)storeCloudID
{
  return self->_cloudID;
}

- (void)setStoreCloudID:(unint64_t)a3
{
  -[MPIdentifierSet _setDefaultPersonIDIfNeeded](self, "_setDefaultPersonIDIfNeeded");
  self->_cloudID = a3;
}

- (NSString)cloudUniversalLibraryID
{
  return self->_universalCloudLibraryID;
}

- (void)setCloudUniversalLibraryID:(id)a3
{
  NSString *v4;
  NSString *universalCloudLibraryID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  universalCloudLibraryID = self->_universalCloudLibraryID;
  self->_universalCloudLibraryID = v4;

}

- (NSString)storeCloudAlbumID
{
  return self->_cloudAlbumID;
}

- (void)setStoreCloudAlbumID:(id)a3
{
  id v4;
  NSString *v5;
  NSString *cloudAlbumID;

  v4 = a3;
  -[MPIdentifierSet _setDefaultPersonIDIfNeeded](self, "_setDefaultPersonIDIfNeeded");
  v5 = (NSString *)objc_msgSend(v4, "copy");

  cloudAlbumID = self->_cloudAlbumID;
  self->_cloudAlbumID = v5;

}

- (id)storeCloudArtistID
{
  return self->_cloudArtistID;
}

- (void)setStoreCloudArtistID:(id)a3
{
  id v4;
  NSString *v5;
  NSString *cloudArtistID;

  v4 = a3;
  -[MPIdentifierSet _setDefaultPersonIDIfNeeded](self, "_setDefaultPersonIDIfNeeded");
  v5 = (NSString *)objc_msgSend(v4, "copy");

  cloudArtistID = self->_cloudArtistID;
  self->_cloudArtistID = v5;

}

- (NSString)storeRecommendationID
{
  return self->_recommendationID;
}

- (void)setStoreRecommendationID:(id)a3
{
  id v4;
  NSString *v5;
  NSString *recommendationID;

  v4 = a3;
  -[MPIdentifierSet _setDefaultPersonIDIfNeeded](self, "_setDefaultPersonIDIfNeeded");
  v5 = (NSString *)objc_msgSend(v4, "copy");

  recommendationID = self->_recommendationID;
  self->_recommendationID = v5;

}

- (int64_t)storePurchasedAdamID
{
  return self->_purchasedAdamID;
}

- (void)setStorePurchasedAdamID:(int64_t)a3
{
  self->_purchasedAdamID = a3;
}

- (int64_t)storeSubscriptionAdamID
{
  return self->_subscriptionAdamID;
}

- (void)setStoreSubscriptionAdamID:(int64_t)a3
{
  self->_subscriptionAdamID = a3;
}

- (id)_stateDumpObject
{
  MPIdentifierSet *v3;
  __CFString *v4;
  NSArray *sources;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
  v3 = (MPIdentifierSet *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    return CFSTR("<EMPTY>");
  -[MPIdentifierSet identifierDescriptions:](self, "identifierDescriptions:", 0);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  sources = self->_sources;
  v10[0] = CFSTR("sources");
  v10[1] = CFSTR("identifiers");
  v11[0] = sources;
  v6 = -[__CFString count](v4, "count");
  v7 = CFSTR("@");
  if (v6)
    v7 = v4;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)preferredStoreStringIdentifierForPersonID:(id)a3
{
  void *v3;
  void *v4;

  -[MPIdentifierSet prioritizedStoreStringIdentifiersForPersonID:](self, "prioritizedStoreStringIdentifiersForPersonID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)prioritizedStoreStringIdentifiersForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char *v20;
  uint64_t quot;
  lldiv_t v22;
  uint64_t v23;
  const UInt8 *v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  lldiv_t v30;
  uint64_t v31;
  const UInt8 *v32;
  __CFString *v33;
  void *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  lldiv_t v38;
  uint64_t v39;
  const UInt8 *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 10);
  -[MPIdentifierSet universalStore](self, "universalStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "globalPlaylistID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
    objc_msgSend(v5, "addObject:", v7);
  -[MPIdentifierSet radio](self, "radio", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stationStringID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
    objc_msgSend(v5, "addObject:", v9);
  -[MPIdentifierSet radio](self, "radio");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stationEventID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
    objc_msgSend(v5, "addObject:", v11);
  -[MPIdentifierSet universalStore](self, "universalStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "socialProfileID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
    objc_msgSend(v5, "addObject:", v13);
  -[MPIdentifierSet personalizedStore](self, "personalizedStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "personID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length")
    && objc_msgSend(v15, "length")
    && objc_msgSend(v4, "isEqualToString:", v15))
  {
    -[MPIdentifierSet universalStore](self, "universalStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "universalCloudLibraryID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "length"))
      objc_msgSend(v5, "addObject:", v17);

  }
  v47 = v4;
  -[MPIdentifierSet universalStore](self, "universalStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "subscriptionAdamID");

  if (v19)
  {
    v20 = (char *)&v48 + 1;
    quot = v19;
    do
    {
      v22 = lldiv(quot, 10);
      quot = v22.quot;
      if (v22.rem >= 0)
        LOBYTE(v23) = v22.rem;
      else
        v23 = -v22.rem;
      *(v20 - 2) = v23 + 48;
      v24 = (const UInt8 *)(v20 - 2);
      --v20;
    }
    while (v22.quot);
    if (v19 < 0)
    {
      *(v20 - 2) = 45;
      v24 = (const UInt8 *)(v20 - 2);
    }
    v25 = (__CFString *)CFStringCreateWithBytes(0, v24, (char *)&v48 - (char *)v24, 0x8000100u, 0);
    objc_msgSend(v5, "addObject:", v25);

  }
  -[MPIdentifierSet universalStore](self, "universalStore");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "adamID");

  if (v27 && v27 != v19)
  {
    v28 = (char *)&v48 + 1;
    v29 = v27;
    do
    {
      v30 = lldiv(v29, 10);
      v29 = v30.quot;
      if (v30.rem >= 0)
        LOBYTE(v31) = v30.rem;
      else
        v31 = -v30.rem;
      *(v28 - 2) = v31 + 48;
      v32 = (const UInt8 *)(v28 - 2);
      --v28;
    }
    while (v30.quot);
    if (v27 < 0)
    {
      *(v28 - 2) = 45;
      v32 = (const UInt8 *)(v28 - 2);
    }
    v33 = (__CFString *)CFStringCreateWithBytes(0, v32, (char *)&v48 - (char *)v32, 0x8000100u, 0);
    objc_msgSend(v5, "addObject:", v33);

  }
  -[MPIdentifierSet universalStore](self, "universalStore");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "purchasedAdamID");

  if (v35 && v35 != v27 && v35 != v19)
  {
    v36 = (char *)&v48 + 1;
    v37 = v35;
    do
    {
      v38 = lldiv(v37, 10);
      v37 = v38.quot;
      if (v38.rem >= 0)
        LOBYTE(v39) = v38.rem;
      else
        v39 = -v38.rem;
      *(v36 - 2) = v39 + 48;
      v40 = (const UInt8 *)(v36 - 2);
      --v36;
    }
    while (v38.quot);
    if (v35 < 0)
    {
      *(v36 - 2) = 45;
      v40 = (const UInt8 *)(v36 - 2);
    }
    v41 = (__CFString *)CFStringCreateWithBytes(0, v40, (char *)&v48 - (char *)v40, 0x8000100u, 0);
    objc_msgSend(v5, "addObject:", v41);

  }
  -[MPIdentifierSet opaqueID](self, "opaqueID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "length"))
    objc_msgSend(v5, "addObject:", v42);
  objc_msgSend(v5, "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "copy");

  return v44;
}

- (void)_setDefaultPersonIDIfNeeded
{
  NSString *v3;
  NSString *personID;
  id v5;

  if (!-[NSString length](self->_personID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountDSID");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    personID = self->_personID;
    self->_personID = v3;

  }
}

- (NSString)socialProfileID
{
  return self->_socialProfileID;
}

- (NSString)informalMediaClipID
{
  return self->_informalMediaClipID;
}

- (NSString)informalStaticAssetID
{
  return self->_informalStaticAssetID;
}

- (int64_t)reportingAdamID
{
  return self->_reportingAdamID;
}

- (int64_t)assetAdamID
{
  return self->_assetAdamID;
}

- (int64_t)lyricsAdamID
{
  return self->_lyricsAdamID;
}

void __34__MPIdentifierSet_unionSet_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;

  v36 = a2;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 280);
  if (v3)
  {
    +[MPModelKind unknownKind](MPModelKind, "unknownKind");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v3 == v4)
    {

    }
    else
    {
      v5 = v4;
      v6 = objc_msgSend(v3, "isEqual:", v4);

      if ((v6 & 1) == 0)
        objc_storeStrong(v36 + 35, *(id *)(*(_QWORD *)(a1 + 32) + 280));
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "containerUniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "containerUniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setContainerUniqueID:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "handoffCorrelationID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "handoffCorrelationID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setHandoffCorrelationID:", v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "contentItemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "contentItemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setContentItemID:", v12);

  }
  objc_msgSend(*(id *)(a1 + 32), "lyricsID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "lyricsID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setLyricsID:", v14);

  }
  objc_msgSend(*(id *)(a1 + 32), "vendorID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 32), "vendorID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setVendorID:", v16);

  }
  objc_msgSend(*(id *)(a1 + 32), "opaqueID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 32), "opaqueID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setOpaqueID:", v18);

  }
  objc_msgSend(*(id *)(a1 + 32), "versionHash");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(*(id *)(a1 + 32), "versionHash");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setVersionHash:", v20);

  }
  v21 = objc_msgSend(*(id *)(a1 + 32), "musicKit_possibleLibraryPersistentID");
  v22 = v36;
  if (v21)
  {
    objc_msgSend(v36, "musicKit_setPossibleLibraryPersistentID:", objc_msgSend(*(id *)(a1 + 32), "musicKit_possibleLibraryPersistentID"));
    v22 = v36;
  }
  if ((objc_msgSend(v22, "shouldExcludeFromShuffle") & 1) != 0)
    v23 = 1;
  else
    v23 = objc_msgSend(*(id *)(a1 + 32), "shouldExcludeFromShuffle");
  objc_msgSend(v36, "setShouldExcludeFromShuffle:", v23);
  if ((objc_msgSend(v36, "isPlaceholder") & 1) != 0)
    v24 = 1;
  else
    v24 = objc_msgSend(*(id *)(a1 + 32), "isPlaceholder");
  objc_msgSend(v36, "setPlaceholder:", v24);
  objc_msgSend(*(id *)(a1 + 32), "library");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  v27 = MEMORY[0x1E0C809B0];
  if (v25)
  {
    objc_msgSend(v25, "databaseID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v27;
    v43[1] = 3221225472;
    v43[2] = __34__MPIdentifierSet_unionSet_block___block_invoke_2;
    v43[3] = &unk_1E3162B80;
    v44 = v26;
    objc_msgSend(v36, "setLibraryIdentifiersWithDatabaseID:block:", v28, v43);

  }
  objc_msgSend(*(id *)(a1 + 32), "personalizedStore");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    objc_msgSend(v29, "personID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v27;
    v41[1] = 3221225472;
    v41[2] = __34__MPIdentifierSet_unionSet_block___block_invoke_3;
    v41[3] = &unk_1E3162BA8;
    v42 = v30;
    objc_msgSend(v36, "setPersonalStoreIdentifiersWithPersonID:block:", v31, v41);

  }
  objc_msgSend(*(id *)(a1 + 32), "universalStore");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    v39[0] = v27;
    v39[1] = 3221225472;
    v39[2] = __34__MPIdentifierSet_unionSet_block___block_invoke_4;
    v39[3] = &unk_1E3163A30;
    v40 = v32;
    objc_msgSend(v36, "setUniversalStoreIdentifiersWithBlock:", v39);

  }
  objc_msgSend(*(id *)(a1 + 32), "radio");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    v37[0] = v27;
    v37[1] = 3221225472;
    v37[2] = __34__MPIdentifierSet_unionSet_block___block_invoke_5;
    v37[3] = &unk_1E3162BD0;
    v38 = v34;
    objc_msgSend(v36, "setRadioIdentifiersWithBlock:", v37);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __34__MPIdentifierSet_unionSet_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "persistentID"))
    objc_msgSend(v3, "setPersistentID:", objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  if (objc_msgSend(*(id *)(a1 + 32), "containedPersistentID"))
    objc_msgSend(v3, "setContainedPersistentID:", objc_msgSend(*(id *)(a1 + 32), "containedPersistentID"));
  if (objc_msgSend(*(id *)(a1 + 32), "syncID"))
    objc_msgSend(v3, "setSyncID:", objc_msgSend(*(id *)(a1 + 32), "syncID"));

}

void __34__MPIdentifierSet_unionSet_block___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "cloudID"))
    objc_msgSend(v9, "setCloudID:", objc_msgSend(*(id *)(a1 + 32), "cloudID"));
  objc_msgSend(*(id *)(a1 + 32), "cloudAlbumID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "cloudAlbumID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCloudAlbumID:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "cloudArtistID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "cloudArtistID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCloudArtistID:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "recommendationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "recommendationID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRecommendationID:", v8);

  }
}

void __34__MPIdentifierSet_unionSet_block___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  objc_msgSend(*(id *)(a1 + 32), "globalPlaylistID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "globalPlaylistID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setGlobalPlaylistID:", v4);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "adamID"))
    objc_msgSend(v20, "setAdamID:", objc_msgSend(*(id *)(a1 + 32), "adamID"));
  objc_msgSend(*(id *)(a1 + 32), "formerAdamIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v20, "formerAdamIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "formerAdamIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v10);

    objc_msgSend(v9, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFormerAdamIDs:", v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "universalCloudLibraryID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "universalCloudLibraryID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setUniversalCloudLibraryID:", v13);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "purchasedAdamID"))
    objc_msgSend(v20, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 32), "purchasedAdamID"));
  if (objc_msgSend(*(id *)(a1 + 32), "subscriptionAdamID"))
    objc_msgSend(v20, "setSubscriptionAdamID:", objc_msgSend(*(id *)(a1 + 32), "subscriptionAdamID"));
  objc_msgSend(*(id *)(a1 + 32), "socialProfileID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "socialProfileID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSocialProfileID:", v15);

  }
  objc_msgSend(*(id *)(a1 + 32), "informalMediaClipID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "informalMediaClipID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setInformalMediaClipID:", v17);

  }
  objc_msgSend(*(id *)(a1 + 32), "informalStaticAssetID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 32), "informalStaticAssetID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setInformalStaticAssetID:", v19);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "reportingAdamID"))
    objc_msgSend(v20, "setReportingAdamID:", objc_msgSend(*(id *)(a1 + 32), "reportingAdamID"));
  if (objc_msgSend(*(id *)(a1 + 32), "assetAdamID"))
    objc_msgSend(v20, "setAssetAdamID:", objc_msgSend(*(id *)(a1 + 32), "assetAdamID"));
  if (objc_msgSend(*(id *)(a1 + 32), "lyricsAdamID"))
    objc_msgSend(v20, "setLyricsAdamID:", objc_msgSend(*(id *)(a1 + 32), "lyricsAdamID"));

}

void __34__MPIdentifierSet_unionSet_block___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "stationStringID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "stationStringID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStationStringID:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "stationHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "stationHash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStationHash:", v6);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "stationID"))
    objc_msgSend(v9, "setStationID:", objc_msgSend(*(id *)(a1 + 32), "stationID"));
  objc_msgSend(*(id *)(a1 + 32), "stationEventID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "stationEventID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStationEventID:", v8);

  }
}

void __42__MPIdentifierSet__copyWithSources_block___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;

  v3 = *(void **)(a1 + 32);
  v40 = a2;
  objc_msgSend(v3, "modelKind");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)*((_QWORD *)v40 + 35);
  *((_QWORD *)v40 + 35) = v4;

  objc_msgSend(*(id *)(a1 + 32), "databaseID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)*((_QWORD *)v40 + 2);
  *((_QWORD *)v40 + 2) = v6;

  *((_QWORD *)v40 + 3) = objc_msgSend(*(id *)(a1 + 32), "persistentID");
  *((_QWORD *)v40 + 4) = objc_msgSend(*(id *)(a1 + 32), "containedPersistentID");
  *((_QWORD *)v40 + 5) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  *((_QWORD *)v40 + 34) = objc_msgSend(*(id *)(a1 + 32), "musicKit_possibleLibraryPersistentID");
  objc_msgSend(*(id *)(a1 + 32), "personID");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)*((_QWORD *)v40 + 6);
  *((_QWORD *)v40 + 6) = v8;

  *((_QWORD *)v40 + 7) = objc_msgSend(*(id *)(a1 + 32), "cloudID");
  objc_msgSend(*(id *)(a1 + 32), "cloudAlbumID");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)*((_QWORD *)v40 + 8);
  *((_QWORD *)v40 + 8) = v10;

  objc_msgSend(*(id *)(a1 + 32), "cloudArtistID");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)*((_QWORD *)v40 + 9);
  *((_QWORD *)v40 + 9) = v12;

  objc_msgSend(*(id *)(a1 + 32), "recommendationID");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)*((_QWORD *)v40 + 10);
  *((_QWORD *)v40 + 10) = v14;

  objc_storeStrong((id *)v40 + 11, *(id *)(*(_QWORD *)(a1 + 32) + 88));
  *((_QWORD *)v40 + 12) = objc_msgSend(*(id *)(a1 + 32), "adamID");
  objc_msgSend(*(id *)(a1 + 32), "formerAdamIDs");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)*((_QWORD *)v40 + 13);
  *((_QWORD *)v40 + 13) = v16;

  objc_msgSend(*(id *)(a1 + 32), "universalCloudLibraryID");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)*((_QWORD *)v40 + 14);
  *((_QWORD *)v40 + 14) = v18;

  *((_QWORD *)v40 + 15) = objc_msgSend(*(id *)(a1 + 32), "purchasedAdamID");
  *((_QWORD *)v40 + 16) = objc_msgSend(*(id *)(a1 + 32), "subscriptionAdamID");
  objc_storeStrong((id *)v40 + 17, *(id *)(*(_QWORD *)(a1 + 32) + 136));
  objc_storeStrong((id *)v40 + 18, *(id *)(*(_QWORD *)(a1 + 32) + 144));
  objc_storeStrong((id *)v40 + 19, *(id *)(*(_QWORD *)(a1 + 32) + 152));
  *((_QWORD *)v40 + 20) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160);
  *((_QWORD *)v40 + 21) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
  *((_QWORD *)v40 + 22) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
  objc_msgSend(*(id *)(a1 + 32), "stationStringID");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)*((_QWORD *)v40 + 23);
  *((_QWORD *)v40 + 23) = v20;

  objc_msgSend(*(id *)(a1 + 32), "stationHash");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)*((_QWORD *)v40 + 24);
  *((_QWORD *)v40 + 24) = v22;

  *((_QWORD *)v40 + 25) = objc_msgSend(*(id *)(a1 + 32), "stationID");
  objc_msgSend(*(id *)(a1 + 32), "stationEventID");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)*((_QWORD *)v40 + 26);
  *((_QWORD *)v40 + 26) = v24;

  objc_msgSend(*(id *)(a1 + 32), "containerUniqueID");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)*((_QWORD *)v40 + 27);
  *((_QWORD *)v40 + 27) = v26;

  objc_msgSend(*(id *)(a1 + 32), "handoffCorrelationID");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)*((_QWORD *)v40 + 28);
  *((_QWORD *)v40 + 28) = v28;

  objc_msgSend(*(id *)(a1 + 32), "contentItemID");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)*((_QWORD *)v40 + 29);
  *((_QWORD *)v40 + 29) = v30;

  objc_msgSend(*(id *)(a1 + 32), "lyricsID");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)*((_QWORD *)v40 + 30);
  *((_QWORD *)v40 + 30) = v32;

  *((_BYTE *)v40 + 8) = objc_msgSend(*(id *)(a1 + 32), "shouldExcludeFromShuffle");
  *((_BYTE *)v40 + 9) = objc_msgSend(*(id *)(a1 + 32), "isPlaceholder");
  objc_msgSend(*(id *)(a1 + 32), "vendorID");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)*((_QWORD *)v40 + 31);
  *((_QWORD *)v40 + 31) = v34;

  objc_msgSend(*(id *)(a1 + 32), "opaqueID");
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)*((_QWORD *)v40 + 32);
  *((_QWORD *)v40 + 32) = v36;

  objc_msgSend(*(id *)(a1 + 32), "versionHash");
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)*((_QWORD *)v40 + 33);
  *((_QWORD *)v40 + 33) = v38;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
