@implementation CPLMomentShare

- (CPLMomentShare)initWithCoder:(id)a3
{
  id v4;
  CPLMomentShare *v5;
  CPLMomentShare *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLMomentShare;
  v5 = -[CPLMomentShare init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[NSObject cplDecodePropertiesFromCoder:](v5, "cplDecodePropertiesFromCoder:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "cplCopyPropertiesFromObject:withCopyBlock:", self, 0);
  return v4;
}

+ (id)cplAdditionalSecureClassesForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (cplAdditionalSecureClassesForProperty__onceToken_101 != -1)
    dispatch_once(&cplAdditionalSecureClassesForProperty__onceToken_101, &__block_literal_global_102);
  objc_msgSend((id)cplAdditionalSecureClassesForProperty__additionalClasses_100, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___CPLMomentShare;
    objc_msgSendSuper2(&v10, sel_cplAdditionalSecureClassesForProperty_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __69__CPLMomentShare_CPLNSCoding__cplAdditionalSecureClassesForProperty___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("participants");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)cplAdditionalSecureClassesForProperty__additionalClasses_100;
  cplAdditionalSecureClassesForProperty__additionalClasses_100 = v1;

}

- (CPLMomentShare)initWithScopeChange:(id)a3
{
  id v4;
  CPLMomentShare *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *participants;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  NSURL *shareURL;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  NSDate *creationDate;
  uint64_t v21;
  NSDate *startDate;
  uint64_t v23;
  NSDate *endDate;
  uint64_t v25;
  NSDate *expiryDate;
  uint64_t v27;
  NSData *thumbnailImageData;
  uint64_t v29;
  NSData *previewData;
  uint64_t v31;
  NSString *originatingScopeIdentifier;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CPLMomentShare;
  v5 = -[CPLMomentShare init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "scopeIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "share");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "participants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLMomentShareParticipant momentShareParticipantsFromParticipants:](CPLMomentShareParticipant, "momentShareParticipantsFromParticipants:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    participants = v5->_participants;
    v5->_participants = (NSArray *)v10;

    objc_msgSend(v8, "currentUserParticipant");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      v14 = objc_msgSend(v12, "permission");
    else
      v14 = objc_msgSend(v8, "publicPermission");
    if (v14 <= 3)
      v5->_mode = v14;
    objc_msgSend(v8, "URL");
    v15 = objc_claimAutoreleasedReturnValue();
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v15;

    objc_msgSend(v4, "title");
    v17 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v17;

    objc_msgSend(v4, "creationDate");
    v19 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v19;

    objc_msgSend(v4, "startDate");
    v21 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v21;

    objc_msgSend(v4, "endDate");
    v23 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v23;

    objc_msgSend(v4, "expiryDate");
    v25 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v25;

    v5->_assetCount = objc_msgSend(v4, "promisedAssetCount");
    v5->_photosCount = objc_msgSend(v4, "promisedPhotosCount");
    v5->_videosCount = objc_msgSend(v4, "promisedVideosCount");
    objc_msgSend(v4, "thumbnailImageData");
    v27 = objc_claimAutoreleasedReturnValue();
    thumbnailImageData = v5->_thumbnailImageData;
    v5->_thumbnailImageData = (NSData *)v27;

    objc_msgSend(v4, "previewImageData");
    v29 = objc_claimAutoreleasedReturnValue();
    previewData = v5->_previewData;
    v5->_previewData = (NSData *)v29;

    objc_msgSend(v4, "originatingScopeIdentifier");
    v31 = objc_claimAutoreleasedReturnValue();
    originatingScopeIdentifier = v5->_originatingScopeIdentifier;
    v5->_originatingScopeIdentifier = (NSString *)v31;

  }
  return v5;
}

- (void)updateScopeChange:(id)a3
{
  id v4;
  CPLShare *v5;
  void *v6;
  void *v7;
  uint64_t mode;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "share");
  v5 = (CPLShare *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(CPLShare);
    -[CPLShare setURL:](v5, "setURL:", self->_shareURL);
    -[CPLMomentShare participants](self, "participants");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      +[CPLMomentShareParticipant shareParticipantsFromMomentShareParticipants:](CPLMomentShareParticipant, "shareParticipantsFromMomentShareParticipants:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLShare setParticipants:](v5, "setParticipants:", v7);

    }
    v16 = v6;
    if (self->_mode >= 4)
      mode = 2;
    else
      mode = self->_mode;
    -[CPLShare setPublicPermission:](v5, "setPublicPermission:", mode);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[CPLShare participants](v5, "participants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v14, "role") == 1)
            v15 = 3;
          else
            v15 = mode;
          objc_msgSend(v14, "setPermission:", v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setShare:", v5);
  }
  if (self->_title)
    objc_msgSend(v4, "setTitle:");
  if (self->_creationDate)
    objc_msgSend(v4, "setCreationDate:");
  if (self->_startDate)
    objc_msgSend(v4, "setStartDate:");
  if (self->_endDate)
    objc_msgSend(v4, "setEndDate:");
  if (self->_expiryDate)
    objc_msgSend(v4, "setExpiryDate:");
  if (self->_assetCount >= 1)
  {
    objc_msgSend(v4, "setPromisedAssetCount:");
    objc_msgSend(v4, "setPromisedPhotosCount:", self->_photosCount);
    objc_msgSend(v4, "setPromisedVideosCount:", self->_videosCount);
  }
  if (self->_thumbnailImageData)
    objc_msgSend(v4, "setThumbnailImageData:");
  if (self->_previewData)
    objc_msgSend(v4, "setPreviewImageData:");
  if (self->_originatingScopeIdentifier)
    objc_msgSend(v4, "setOriginatingScopeIdentifier:");

}

- (id)translateToScopeChangeWithScopeType:(int64_t)a3
{
  id v4;

  v4 = +[CPLScopeChange newScopeChangeWithScopeIdentifier:type:](CPLMomentShareScopeChange, "newScopeChangeWithScopeIdentifier:type:", self->_identifier, a3);
  -[CPLMomentShare updateScopeChange:](self, "updateScopeChange:", v4);
  return v4;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int64_t v17;
  uint64_t v18;
  id v19;

  v19 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v18 = objc_opt_class();
  -[CPLMomentShare identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  -[CPLMomentShare title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLMomentShare creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CPLMomentShare assetCount](self, "assetCount");
  v7 = -[CPLMomentShare photosCount](self, "photosCount");
  v8 = -[CPLMomentShare videosCount](self, "videosCount");
  -[CPLMomentShare expiryDate](self, "expiryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLMomentShare shareURL](self, "shareURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cpl_redactedShareURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v6;
  v12 = (void *)v3;
  v13 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("<%@ %@ '%@'> %@ %lu assets (%lu photos %lu videos) expiry %@ url %@"), v18, v3, v4, v5, v17, v7, v8, v9, v11);

  -[CPLMomentShare originatingScopeIdentifier](self, "originatingScopeIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    objc_msgSend(v13, "appendFormat:", CFSTR(" orig %@"), v14);

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (signed)mode
{
  return self->_mode;
}

- (void)setMode:(signed __int16)a3
{
  self->_mode = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)assetCount
{
  return self->_assetCount;
}

- (void)setAssetCount:(int64_t)a3
{
  self->_assetCount = a3;
}

- (int64_t)photosCount
{
  return self->_photosCount;
}

- (void)setPhotosCount:(int64_t)a3
{
  self->_photosCount = a3;
}

- (int64_t)videosCount
{
  return self->_videosCount;
}

- (void)setVideosCount:(int64_t)a3
{
  self->_videosCount = a3;
}

- (NSData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (void)setThumbnailImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)previewData
{
  return self->_previewData;
}

- (void)setPreviewData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)originatingScopeIdentifier
{
  return self->_originatingScopeIdentifier;
}

- (void)setOriginatingScopeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_previewData, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
