@implementation PHAssetComment

- (Class)changeRequestClass
{
  return 0;
}

- (PHAssetComment)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  PHAssetComment *v10;
  uint64_t v11;
  NSString *uuid;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSDate *commentClientDate;
  uint64_t v20;
  NSDate *commentDate;
  uint64_t v22;
  NSString *commentText;
  uint64_t v24;
  NSString *cloudGUID;
  uint64_t v26;
  NSString *commenterHashedPersonID;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  objc_super v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v38.receiver = self;
  v38.super_class = (Class)PHAssetComment;
  v10 = -[PHObject initWithFetchDictionary:propertyHint:photoLibrary:](&v38, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, v9);
  if (v10)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudGUID"));
    v11 = objc_claimAutoreleasedReturnValue();
    uuid = v10->super._uuid;
    v10->super._uuid = (NSString *)v11;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isCaption"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_isCaption = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isBatchComment"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_isBatchComment = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isDeletable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_isDeletable = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isLike"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_isLike = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isMyComment"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_isMyComment = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("commentClientDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    commentClientDate = v10->_commentClientDate;
    v10->_commentClientDate = (NSDate *)v18;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("commentDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    commentDate = v10->_commentDate;
    v10->_commentDate = (NSDate *)v20;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("commentText"));
    v22 = objc_claimAutoreleasedReturnValue();
    commentText = v10->_commentText;
    v10->_commentText = (NSString *)v22;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudGUID"));
    v24 = objc_claimAutoreleasedReturnValue();
    cloudGUID = v10->_cloudGUID;
    v10->_cloudGUID = (NSString *)v24;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("commenterHashedPersonID"));
    v26 = objc_claimAutoreleasedReturnValue();
    commenterHashedPersonID = v10->_commenterHashedPersonID;
    v10->_commenterHashedPersonID = (NSString *)v26;

    if (v10->_isLike)
      v28 = CFSTR("likedAsset");
    else
      v28 = CFSTR("commentedAsset");
    objc_msgSend(v8, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = CFSTR("PHAssetPropertySetCloudShared");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFetchPropertySets:", v31);

    v39 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAsset fetchAssetsWithObjectIDs:options:](PHAsset, "fetchAssetsWithObjectIDs:options:", v32, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "cloudSharedProperties");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
      v10->_isInterestingToUser = -[PHAssetComment _isInterestingToUser:cloudSharedProperties:](v10, "_isInterestingToUser:cloudSharedProperties:", v34, v35);
    if (-[PHAssetComment isDeletable](v10, "isDeletable") || (objc_msgSend(v35, "cloudIsMyAsset") & 1) != 0)
      v36 = 1;
    else
      v36 = -[PHAssetComment isMyComment](v10, "isMyComment");
    v10->_canBeDeletedByUser = v36;

  }
  return v10;
}

- (BOOL)_isInterestingToUser:(id)a3 cloudSharedProperties:(id)a4
{
  id v6;
  id v7;
  char v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  _BOOL4 v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "isCloudSharedAsset"))
  {
    PLPhotoSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v6;
      v10 = "Comment marked as not interesting because it's not for a cloudSharedAsset: %@.";
      v11 = v9;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  v8 = objc_msgSend(v7, "cloudIsMyAsset");
  if (-[PHAssetComment isMyComment](self, "isMyComment"))
  {
    PLPhotoSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v10 = "Ignoring comment notification because it's my comment";
      v11 = v9;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 2;
LABEL_7:
      _os_log_impl(&dword_1991EC000, v11, v12, v10, (uint8_t *)&v16, v13);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ((v8 & 1) != 0)
  {
    LOBYTE(v14) = 1;
    goto LABEL_10;
  }
  if (objc_msgSend(v7, "cloudHasCommentsByMe"))
  {
    v14 = !-[PHAssetComment isLike](self, "isLike");
    goto LABEL_10;
  }
LABEL_9:
  LOBYTE(v14) = 0;
LABEL_10:

  return v14;
}

- (BOOL)shouldNotifyAsNotificationWithMediaStreamInfo:(id)a3 asCaptionOnly:(BOOL *)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  uint8_t *v12;
  BOOL result;
  __int16 v14;
  __int16 v15;

  v6 = a3;
  v7 = -[PHAssetComment isCaption](self, "isCaption");
  objc_msgSend(v6, "valueForKey:", *MEMORY[0x1E0D16D88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v8, "BOOLValue");
  if (!(_DWORD)v6)
  {
    result = -[PHAssetComment isInterestingToUser](self, "isInterestingToUser");
    if (!a4)
      return result;
    goto LABEL_11;
  }
  PLPhotoSharingGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v10)
      goto LABEL_10;
    v15 = 0;
    v11 = "Notifications: mstreamd says comment is not interesting, but allowing as caption";
    v12 = (uint8_t *)&v15;
  }
  else
  {
    if (!v10)
      goto LABEL_10;
    v14 = 0;
    v11 = "Notifications: Ignoring comment notification because mstreamd says it's not interesting and is not a caption";
    v12 = (uint8_t *)&v14;
  }
  _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
LABEL_10:

  result = 0;
  if (!a4)
    return result;
LABEL_11:
  if (!result)
    *a4 = v7;
  return result;
}

- (BOOL)isInterestingForAlbumsSorting
{
  return -[PHAssetComment isMyComment](self, "isMyComment")
      || -[PHAssetComment isInterestingToUser](self, "isInterestingToUser");
}

- (NSString)commenterDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;

  -[PHAssetComment commenterFirstName](self, "commenterFirstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetComment commenterLastName](self, "commenterLastName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetComment commenterFullName](self, "commenterFullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
  }
  else if (objc_msgSend(v3, "length") || objc_msgSend(v4, "length"))
  {
    PLLocalizedNameWithFirstAndLastName();
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PHAssetComment commenterEmail](self, "commenterEmail");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v6)
    v7 = v6;
  else
    v7 = &stru_1E35DFFF8;

  return (NSString *)v7;
}

- (id)personInfoManager
{
  void *v2;
  void *v3;
  void *v4;

  -[PHObject photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibraryBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personInfoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)commenterEmail
{
  void *v3;
  void *v4;
  void *v5;

  -[PHAssetComment personInfoManager](self, "personInfoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetComment commenterHashedPersonID](self, "commenterHashedPersonID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailForPersonID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)commenterFirstName
{
  void *v3;
  void *v4;
  void *v5;

  -[PHAssetComment personInfoManager](self, "personInfoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetComment commenterHashedPersonID](self, "commenterHashedPersonID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstNameForPersonID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)commenterLastName
{
  void *v3;
  void *v4;
  void *v5;

  -[PHAssetComment personInfoManager](self, "personInfoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetComment commenterHashedPersonID](self, "commenterHashedPersonID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastNameForPersonID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)commenterFullName
{
  void *v3;
  void *v4;
  void *v5;

  -[PHAssetComment personInfoManager](self, "personInfoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetComment commenterHashedPersonID](self, "commenterHashedPersonID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullNameForPersonID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isLike
{
  return self->_isLike;
}

- (BOOL)isCaption
{
  return self->_isCaption;
}

- (BOOL)isBatchComment
{
  return self->_isBatchComment;
}

- (BOOL)isMyComment
{
  return self->_isMyComment;
}

- (NSString)commentText
{
  return self->_commentText;
}

- (NSDate)commentDate
{
  return self->_commentDate;
}

- (BOOL)canBeDeletedByUser
{
  return self->_canBeDeletedByUser;
}

- (BOOL)isDeletable
{
  return self->_isDeletable;
}

- (NSDate)commentClientDate
{
  return self->_commentClientDate;
}

- (NSString)cloudGUID
{
  return self->_cloudGUID;
}

- (NSString)commenterHashedPersonID
{
  return self->_commenterHashedPersonID;
}

- (BOOL)isInterestingToUser
{
  return self->_isInterestingToUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commenterHashedPersonID, 0);
  objc_storeStrong((id *)&self->_cloudGUID, 0);
  objc_storeStrong((id *)&self->_commentClientDate, 0);
  objc_storeStrong((id *)&self->_commentDate, 0);
  objc_storeStrong((id *)&self->_commentText, 0);
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PHAssetComment_propertiesToFetchWithHint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToFetchWithHint__onceToken_41348 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_41348, block);
  return (id)propertiesToFetchWithHint__array_41349;
}

+ (id)managedEntityName
{
  return CFSTR("CloudSharedComment");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHAssetComment");
  return CFSTR("PHAssetComment");
}

+ (id)identifierCode
{
  return CFSTR("230");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_41339;
}

+ (id)fetchCommentsForAsset:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  +[PHQuery queryForCommentsForAsset:options:](PHQuery, "queryForCommentsForAsset:options:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchLikesForAsset:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  +[PHQuery queryForLikesForAsset:options:](PHQuery, "queryForLikesForAsset:options:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __30__PHAssetComment_entityKeyMap__block_invoke()
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
  PHEntityKeyMap *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  _QWORD v23[2];
  _QWORD v24[10];
  _QWORD v25[12];

  v25[10] = *MEMORY[0x1E0C80C00];
  v12 = [PHEntityKeyMap alloc];
  v23[1] = CFSTR("cloudGUID");
  v24[0] = CFSTR("cloudGUID");
  v23[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v24[1] = CFSTR("isCaption");
  v22 = CFSTR("isCaption");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v0;
  v24[2] = CFSTR("isBatchComment");
  v21 = CFSTR("isBatchComment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v1;
  v24[3] = CFSTR("isDeletable");
  v20 = CFSTR("isDeletable");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v2;
  v24[4] = CFSTR("isLike");
  v19 = CFSTR("isLike");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v3;
  v24[5] = CFSTR("isMyComment");
  v18 = CFSTR("isMyComment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v4;
  v24[6] = CFSTR("commentClientDate");
  v17 = CFSTR("commentClientDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v5;
  v24[7] = CFSTR("commentDate");
  v16 = CFSTR("commentDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v6;
  v24[8] = CFSTR("commenterHashedPersonID");
  v15 = CFSTR("commenterHashedPersonID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v7;
  v24[9] = CFSTR("commentText");
  v14 = CFSTR("commentText");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v12, "initWithPropertyKeysByEntityKey:", v9);
  v11 = (void *)entityKeyMap_pl_once_object_15_41339;
  entityKeyMap_pl_once_object_15_41339 = v10;

}

void __44__PHAssetComment_propertiesToFetchWithHint___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[14];

  v4[13] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v0, "setName:", CFSTR("objectID"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setExpression:", v1);

  objc_msgSend(v0, "setExpressionResultType:", 2000);
  v4[0] = v0;
  v4[1] = CFSTR("cloudGUID");
  v4[2] = CFSTR("commentClientDate");
  v4[3] = CFSTR("commentDate");
  v4[4] = CFSTR("commenterHashedPersonID");
  v4[5] = CFSTR("commentText");
  v4[6] = CFSTR("isBatchComment");
  v4[7] = CFSTR("isCaption");
  v4[8] = CFSTR("isDeletable");
  v4[9] = CFSTR("isLike");
  v4[10] = CFSTR("isMyComment");
  v4[11] = CFSTR("likedAsset");
  v4[12] = CFSTR("commentedAsset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 13);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)propertiesToFetchWithHint__array_41349;
  propertiesToFetchWithHint__array_41349 = v2;

}

@end
