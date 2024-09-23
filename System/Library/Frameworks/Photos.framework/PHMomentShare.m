@implementation PHMomentShare

+ (id)invitedMomentSharesExpiringInDays:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v4, "setDay:", a3);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHPhotoLibrary sharedMomentSharePhotoLibrary](PHPhotoLibrary, "sharedMomentSharePhotoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("expiryDate <= %@ AND (status == %d OR status == %d)"), v7, 2, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInternalPredicate:", v10);
  +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHMomentShare, "fetchAssetCollectionsWithType:subtype:options:", 7, 0x7FFFFFFFFFFFFFFFLL, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (unint64_t)estimatedAssetCount
{
  return self->_assetCount;
}

- (unint64_t)estimatedPhotosCount
{
  return self->_photosCount;
}

- (unint64_t)estimatedVideosCount
{
  return self->_videosCount;
}

- (PHMomentSharePreview)preview
{
  return self->_preview;
}

- (PHMomentShare)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHMomentShare *v9;
  uint64_t v10;
  NSString *localizedTitle;
  uint64_t v12;
  NSDate *creationDate;
  uint64_t v14;
  NSURL *shareURL;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *scopeIdentifier;
  uint64_t v25;
  NSDate *startDate;
  uint64_t v27;
  NSDate *endDate;
  uint64_t v29;
  NSDate *expiryDate;
  uint64_t v31;
  NSData *thumbnailImageData;
  uint64_t v33;
  NSData *previewData;
  void *v35;
  void *v36;
  void *v37;
  PHMomentSharePreview *v38;
  PHMomentSharePreview *preview;
  void *v40;
  objc_super v42;

  v8 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PHMomentShare;
  v9 = -[PHAssetCollection initWithFetchDictionary:propertyHint:photoLibrary:](&v42, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v9->super._localizedTitle;
    v9->super._localizedTitle = (NSString *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("creationDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    creationDate = v9->_creationDate;
    v9->_creationDate = (NSDate *)v12;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("shareURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    shareURL = v9->_shareURL;
    v9->_shareURL = (NSURL *)v14;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("status"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_status = objc_msgSend(v16, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("trashedState"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_trashedState = objc_msgSend(v17, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("assetCount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_assetCount = objc_msgSend(v18, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("photosCount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_photosCount = objc_msgSend(v19, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("videosCount"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_videosCount = objc_msgSend(v20, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("uploadedPhotosCount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_uploadedPhotosCount = objc_msgSend(v21, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("uploadedVideosCount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_uploadedVideosCount = objc_msgSend(v22, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("scopeIdentifier"));
    v23 = objc_claimAutoreleasedReturnValue();
    scopeIdentifier = v9->_scopeIdentifier;
    v9->_scopeIdentifier = (NSString *)v23;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("startDate"));
    v25 = objc_claimAutoreleasedReturnValue();
    startDate = v9->super._startDate;
    v9->super._startDate = (NSDate *)v25;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("endDate"));
    v27 = objc_claimAutoreleasedReturnValue();
    endDate = v9->super._endDate;
    v9->super._endDate = (NSDate *)v27;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("expiryDate"));
    v29 = objc_claimAutoreleasedReturnValue();
    expiryDate = v9->_expiryDate;
    v9->_expiryDate = (NSDate *)v29;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("thumbnailImageData"));
    v31 = objc_claimAutoreleasedReturnValue();
    thumbnailImageData = v9->_thumbnailImageData;
    v9->_thumbnailImageData = (NSData *)v31;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("previewData"));
    v33 = objc_claimAutoreleasedReturnValue();
    previewData = v9->_previewData;
    v9->_previewData = (NSData *)v33;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("shouldIgnoreBudgets"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_shouldIgnoreBudgets = objc_msgSend(v35, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("shouldNotifyOnUploadCompletion"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_shouldNotifyOnUploadCompletion = objc_msgSend(v36, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("localPublishState"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_publishState = objc_msgSend(v37, "unsignedIntegerValue");

    v38 = -[PHMomentSharePreview initWithThumbnailImageData:previewData:]([PHMomentSharePreview alloc], "initWithThumbnailImageData:previewData:", v9->_thumbnailImageData, v9->_previewData);
    preview = v9->_preview;
    v9->_preview = v38;

    v9->super._assetCollectionType = 7;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("publicPermission"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_publicPermission = objc_msgSend(v40, "integerValue");

  }
  return v9;
}

- (BOOL)shouldPromptUserToIgnoreBudgets
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[PHObject photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__PHMomentShare_shouldPromptUserToIgnoreBudgets__block_invoke;
  v7[3] = &unk_1E35DEE50;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  objc_msgSend(v5, "performBlockAndWait:", v7);
  LOBYTE(v4) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

- (BOOL)shouldSuggestShareBack
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  -[PHObject photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__PHMomentShare_shouldSuggestShareBack__block_invoke;
  v7[3] = &unk_1E35DEE50;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  objc_msgSend(v5, "performBlockAndWait:", v7);
  LOBYTE(v4) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

- (void)acceptMomentShareWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PHObject uuid](self, "uuid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PHObject photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHShare acceptShareWithUUID:photoLibrary:completion:](PHShare, "acceptShareWithUUID:photoLibrary:completion:", v6, v5, v4);

}

- (void)forceSyncMomentShareWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[PHObject uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObject photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetsdClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cloudInternalClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__PHMomentShare_forceSyncMomentShareWithCompletion___block_invoke;
  v10[3] = &unk_1E35DF598;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "forceSyncMomentShare:completionHandler:", v5, v10);

}

- (void)publishMomentShareWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, _QWORD, void *))a3;
  -[PHObject photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cplStatus");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isExceedingQuota"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 6008, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHShare PHShareErrorFromError:](PHShare, "PHShareErrorFromError:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v7);
  }
  else
  {
    -[PHObject uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHObject photoLibrary](self, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHShare publishShareWithUUID:photoLibrary:completion:](PHShare, "publishShareWithUUID:photoLibrary:completion:", v6, v7, v4);
  }

}

- (NSString)description
{
  void *v3;
  void *v4;
  unsigned int v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHMomentShare;
  -[PHAssetCollection description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMomentShare scopeIdentifier](self, "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PHMomentShare status](self, "status") - 1;
  if (v5 > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E35DE088[(unsigned __int16)v5];
  v7 = v6;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", scopeIdentifier: %@, status: %@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unsigned)status
{
  return self->_status;
}

- (signed)publicPermission
{
  return self->_publicPermission;
}

- (unsigned)trashedState
{
  return self->_trashedState;
}

- (signed)publishState
{
  return self->_publishState;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (unint64_t)assetCount
{
  return self->_assetCount;
}

- (unint64_t)photosCount
{
  return self->_photosCount;
}

- (unint64_t)videosCount
{
  return self->_videosCount;
}

- (unint64_t)uploadedPhotosCount
{
  return self->_uploadedPhotosCount;
}

- (unint64_t)uploadedVideosCount
{
  return self->_uploadedVideosCount;
}

- (BOOL)shouldIgnoreBudgets
{
  return self->_shouldIgnoreBudgets;
}

- (BOOL)shouldNotifyOnUploadCompletion
{
  return self->_shouldNotifyOnUploadCompletion;
}

- (NSData)previewData
{
  return self->_previewData;
}

- (NSData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (NSString)scopeIdentifier
{
  return self->_scopeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_previewData, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

void __52__PHMomentShare_forceSyncMomentShareWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  +[PHShare PHShareErrorFromError:](PHShare, "PHShareErrorFromError:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __39__PHMomentShare_shouldSuggestShareBack__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D718F0];
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shareWithUUID:includeTrashed:inManagedObjectContext:", v13, 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "originatingScopeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v6 = (void *)MEMORY[0x1E0D718F0];
      objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shareWithScopeIdentifier:includeTrashed:inManagedObjectContext:", v5, 1, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;

    }
    objc_msgSend(v4, "scopeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v10 = (void *)MEMORY[0x1E0D718F0];
      objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "momentShareWithOriginatingScopeIdentifier:inManagedObjectContext:", v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;

    }
  }

}

void __48__PHMomentShare_shouldPromptUserToIgnoreBudgets__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D718F0];
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shareWithUUID:includeTrashed:inManagedObjectContext:", v2, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (unint64_t)objc_msgSend(v5, "estimateUploadSize") > 0xC800000;
  }
  else
  {
    PLBackendSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v2;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Failed to find moment share with uuid %@ to estimate upload size.", (uint8_t *)&v7, 0xCu);
    }

  }
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_38394 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_38394, &__block_literal_global_38395);
  return (id)propertiesToFetchWithHint__array_38396;
}

+ (id)managedEntityName
{
  return CFSTR("MomentShare");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHMomentShare");
  return CFSTR("PHMomentShare");
}

+ (id)identifierCode
{
  return CFSTR("140");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_38388;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PHMomentShare_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_38380 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_38380, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_38381, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

+ (id)localIdentifierWithUUID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "identifierCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/L0/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

+ (BOOL)managedObjectSupportsShareTrashedState
{
  return 1;
}

+ (BOOL)managedObjectSupportsShareExpiredState
{
  return 1;
}

+ (id)fetchLocalMomentShareFromShareURL:(id)a3 error:(id *)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  id v35;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v10 = objc_msgSend(v9, "openAndWaitWithUpgrade:error:", 0, &v35);
  v11 = v35;
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__38372;
    v33 = __Block_byref_object_dispose__38373;
    v34 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__38372;
    v27 = __Block_byref_object_dispose__38373;
    v28 = 0;
    objc_msgSend(v9, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __65__PHMomentShare_fetchLocalMomentShareFromShareURL_error_options___block_invoke;
    v18[3] = &unk_1E35DE5F8;
    v19 = v7;
    v14 = v13;
    v20 = v14;
    v21 = &v29;
    v22 = &v23;
    objc_msgSend(v14, "performBlockAndWait:", v18);
    v15 = (void *)v30[5];
    if (a4 && !v15)
    {
      *a4 = objc_retainAutorelease((id)v24[5]);
      v15 = (void *)v30[5];
    }
    v16 = v15;

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);

  }
  else
  {
    v16 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }

  return v16;
}

+ (void)fetchMomentShareFromShareURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v10 = objc_msgSend(v9, "openAndWaitWithUpgrade:error:", 0, &v14);
  v11 = v14;
  if ((v10 & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__PHMomentShare_fetchMomentShareFromShareURL_options_completionHandler___block_invoke;
    v12[3] = &unk_1E35DE620;
    v13 = v8;
    +[PHShare fetchShareFromShareURL:ignoreExistingShare:photoLibrary:completionHandler:](PHShare, "fetchShareFromShareURL:ignoreExistingShare:photoLibrary:completionHandler:", v7, 0, v9, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v11);
  }

}

+ (id)_fetchLocalMomentShareWithUUID:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  +[PHMomentShare localIdentifierWithUUID:](PHMomentShare, "localIdentifierWithUUID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHPhotoLibrary sharedMomentSharePhotoLibrary](PHPhotoLibrary, "sharedMomentSharePhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHAssetCollection, "fetchAssetCollectionsWithLocalIdentifiers:options:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D71C78];
    v17 = *MEMORY[0x1E0CB2D50];
    v18 = CFSTR("Moment share not found");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ph_errorWithDomain:code:userInfo:", v12, 100, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHShare PHShareErrorFromError:](PHShare, "PHShareErrorFromError:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v15);

    v10 = 0;
  }

  return v10;
}

+ (id)fetchMomentSharesOverlappingAssetCollection:(id)a3 options:(id)a4
{
  id v6;
  id v7;
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
  void *v29;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v6, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSortDescriptors:", v12);

    +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v6, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(v6, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "librarySpecificFetchOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSortDescriptors:", v19);

    +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v6, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "creationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startDate <= %@ && endDate >= %@"), v15, v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHPhotoLibrary sharedMomentSharePhotoLibrary](PHPhotoLibrary, "sharedMomentSharePhotoLibrary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "librarySpecificFetchOptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPredicate:", v22);
  objc_msgSend(v7, "photoLibrary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "photoLibrary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25 != v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHMomentShare.m"), 421, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options.photoLibrary == localOptions.photoLibrary"));

  }
  objc_msgSend(v24, "mergeWithFetchOptions:", v7);
  +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHMomentShare, "fetchAssetCollectionsWithType:subtype:options:", 7, 0x7FFFFFFFFFFFFFFFLL, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

void __72__PHMomentShare_fetchMomentShareFromShareURL_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    +[PHShare PHShareErrorFromError:](PHShare, "PHShareErrorFromError:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v7);

  }
  else
  {
    v8 = 0;
    +[PHMomentShare _fetchLocalMomentShareWithUUID:error:](PHMomentShare, "_fetchLocalMomentShareWithUUID:error:", a2, &v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __65__PHMomentShare_fetchLocalMomentShareFromShareURL_error_options___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D718F0];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shareWithShareURL:includeTrashed:inManagedObjectContext:", v3, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v5, "trashedState") == 1)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0D71C78];
      v22 = *MEMORY[0x1E0CB2D50];
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("Moment share %@ found but it's trashed"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 101, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[PHShare PHShareErrorFromError:](PHShare, "PHShareErrorFromError:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;
    }
    else
    {
      objc_msgSend(v5, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PLBackendSharingGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "pl_redactedShareURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v17;
        v26 = 2112;
        v27 = v12;
        _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_INFO, "Found local moment share with shareURL %{public}@ with uuid %@", buf, 0x16u);

      }
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      obj = *(id *)(v18 + 40);
      +[PHMomentShare _fetchLocalMomentShareWithUUID:error:](PHMomentShare, "_fetchLocalMomentShareWithUUID:error:", v12, &obj);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v18 + 40), obj);
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;
    }

  }
}

void __53__PHMomentShare_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[21];

  v4[20] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("title");
  v4[1] = CFSTR("creationDate");
  v4[2] = CFSTR("uuid");
  v4[3] = CFSTR("shareURL");
  v4[4] = CFSTR("status");
  v4[5] = CFSTR("assetCount");
  v4[6] = CFSTR("photosCount");
  v4[7] = CFSTR("videosCount");
  v4[8] = CFSTR("uploadedPhotosCount");
  v4[9] = CFSTR("uploadedVideosCount");
  v4[10] = CFSTR("scopeIdentifier");
  v4[11] = CFSTR("startDate");
  v4[12] = CFSTR("endDate");
  v4[13] = CFSTR("expiryDate");
  v4[14] = CFSTR("thumbnailImageData");
  v4[15] = CFSTR("previewData");
  v4[16] = CFSTR("shouldIgnoreBudgets");
  v4[17] = CFSTR("shouldNotifyOnUploadCompletion");
  v4[18] = CFSTR("publishState");
  v4[19] = CFSTR("publicPermission");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 20);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_38381;
  transformValueExpression_forKeyPath___passThroughSet_38381 = v2;

}

void __29__PHMomentShare_entityKeyMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PHEntityKeyMap *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  _QWORD v44[20];
  _QWORD v45[22];

  v45[20] = *MEMORY[0x1E0C80C00];
  v18 = [PHEntityKeyMap alloc];
  v43 = CFSTR("title");
  v44[0] = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v23;
  v44[1] = CFSTR("creationDate");
  v42 = CFSTR("creationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v22;
  v44[2] = CFSTR("uuid");
  v41 = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v21;
  v44[3] = CFSTR("shareURL");
  v40 = CFSTR("shareURL");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v20;
  v44[4] = CFSTR("status");
  v39 = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v19;
  v44[5] = CFSTR("assetCount");
  v38 = CFSTR("assetCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v17;
  v44[6] = CFSTR("photosCount");
  v37 = CFSTR("photosCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v16;
  v44[7] = CFSTR("videosCount");
  v36 = CFSTR("videosCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[7] = v15;
  v44[8] = CFSTR("uploadedPhotosCount");
  v35 = CFSTR("uploadedPhotosCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[8] = v14;
  v44[9] = CFSTR("uploadedVideosCount");
  v34 = CFSTR("uploadedVideosCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45[9] = v13;
  v44[10] = CFSTR("scopeIdentifier");
  v33 = CFSTR("scopeIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[10] = v12;
  v44[11] = CFSTR("startDate");
  v32 = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v45[11] = v0;
  v44[12] = CFSTR("endDate");
  v31 = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v45[12] = v1;
  v44[13] = CFSTR("expiryDate");
  v30 = CFSTR("expiryDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v45[13] = v2;
  v44[14] = CFSTR("thumbnailImageData");
  v29 = CFSTR("thumbnailImageData");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v45[14] = v3;
  v44[15] = CFSTR("previewData");
  v28 = CFSTR("previewData");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45[15] = v4;
  v44[16] = CFSTR("shouldIgnoreBudgets");
  v27 = CFSTR("shouldIgnoreBudgets");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v45[16] = v5;
  v44[17] = CFSTR("shouldNotifyOnUploadCompletion");
  v26 = CFSTR("shouldNotifyOnUploadCompletion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45[17] = v6;
  v44[18] = CFSTR("localPublishState");
  v25 = CFSTR("publishState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45[18] = v7;
  v44[19] = CFSTR("publicPermission");
  v24 = CFSTR("publicPermission");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45[19] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v18, "initWithPropertyKeysByEntityKey:", v9);
  v11 = (void *)entityKeyMap_pl_once_object_15_38388;
  entityKeyMap_pl_once_object_15_38388 = v10;

}

void __43__PHMomentShare_propertiesToFetchWithHint___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[23];

  v3[22] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D718A8], "objectIDDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  v3[1] = CFSTR("title");
  v3[2] = CFSTR("creationDate");
  v3[3] = CFSTR("uuid");
  v3[4] = CFSTR("status");
  v3[5] = CFSTR("shareURL");
  v3[6] = CFSTR("assetCount");
  v3[7] = CFSTR("photosCount");
  v3[8] = CFSTR("videosCount");
  v3[9] = CFSTR("uploadedPhotosCount");
  v3[10] = CFSTR("uploadedVideosCount");
  v3[11] = CFSTR("scopeIdentifier");
  v3[12] = CFSTR("startDate");
  v3[13] = CFSTR("endDate");
  v3[14] = CFSTR("expiryDate");
  v3[15] = CFSTR("thumbnailImageData");
  v3[16] = CFSTR("previewData");
  v3[17] = CFSTR("shouldIgnoreBudgets");
  v3[18] = CFSTR("shouldNotifyOnUploadCompletion");
  v3[19] = CFSTR("trashedState");
  v3[20] = CFSTR("localPublishState");
  v3[21] = CFSTR("publicPermission");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 22);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)propertiesToFetchWithHint__array_38396;
  propertiesToFetchWithHint__array_38396 = v1;

}

@end
