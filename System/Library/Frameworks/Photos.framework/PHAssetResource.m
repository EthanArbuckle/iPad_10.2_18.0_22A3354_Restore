@implementation PHAssetResource

- (PHAssetResource)initWithResource:(id)a3 asset:(id)a4 hasAdjustments:(BOOL)a5 photoLibrary:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  int v19;
  NSObject *v20;
  os_log_type_t v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  PHAssetResource *v27;
  id v28;
  int v29;
  uint32_t v30;
  int v31;
  unsigned int v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  int v37;
  int v38;
  id v39;
  PHAssetResource *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSString *assetLocalIdentifier;
  uint64_t v47;
  id v48;
  const __CFString *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSString *originalFilename;
  void *v62;
  uint64_t v63;
  NSURL *privateFileURL;
  uint64_t v65;
  NSDate *trashedDate;
  uint64_t v67;
  PLResourceIdentity *backingResourceIdentity;
  uint64_t v69;
  NSManagedObjectID *assetObjectID;
  void *v71;
  int v72;
  int v73;
  BOOL v74;
  char v75;
  uint64_t v76;
  PLPhotoLibraryPathManagerIdentifier *libraryID;
  void *v79;
  void *v80;
  PHAssetResource *v81;
  _BOOL4 v82;
  id v83;
  objc_super v84;
  uint8_t buf[4];
  id v86;
  uint64_t v87;

  v7 = a5;
  v87 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v83 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetResource.m"), 529, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

    if (v12)
      goto LABEL_3;
LABEL_128:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetResource.m"), 530, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    goto LABEL_3;
  }
  if (!v12)
    goto LABEL_128;
LABEL_3:
  v13 = v11;
  v14 = v12;
  v15 = &unk_1E3655528;
  switch(objc_msgSend(v13, "resourceType"))
  {
    case 0u:
      if (_PHAssetResourceIsTopClassResource(v13))
      {
        v15 = &unk_1E3655618;
        switch(objc_msgSend(v13, "version"))
        {
          case 0u:
            goto LABEL_87;
          case 1u:
            v15 = &unk_1E3655648;
            goto LABEL_87;
          case 2u:
            v15 = &unk_1E3655630;
            goto LABEL_87;
          case 3u:
            PLPhotoKitGetLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              goto LABEL_85;
            *(_WORD *)buf = 0;
            v17 = "'current' version non-derivative image is invalid, likely resource data error";
            goto LABEL_82;
          default:
            goto LABEL_9;
        }
      }
      objc_msgSend(v13, "dataStore");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend((id)objc_opt_class(), "storeClassID");

      if (v36 == 1)
      {
        v15 = &unk_1E3655660;
        goto LABEL_87;
      }
      if ((objc_msgSend(MEMORY[0x1E0D71A58], "isMasterThumbRecipeID:", objc_msgSend(v13, "recipeID")) & 1) != 0)
      {
        v15 = &unk_1E3655678;
        goto LABEL_87;
      }
      if (objc_msgSend(v13, "recipeID") == 65749)
        goto LABEL_86;
      if (v36 == 3)
        goto LABEL_45;
      if (v36)
      {
        PLPhotoKitGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          goto LABEL_85;
        *(_DWORD *)buf = 138412290;
        v86 = v13;
        v17 = "Derivative image resource not supported by PHAssetResource: %@";
LABEL_20:
        v20 = v16;
        v21 = OS_LOG_TYPE_DEBUG;
LABEL_27:
        v30 = 12;
LABEL_84:
        _os_log_impl(&dword_1991EC000, v20, v21, v17, buf, v30);
        goto LABEL_85;
      }
      if ((objc_msgSend(v13, "isCPLResource") & 1) != 0)
        goto LABEL_45;
      v37 = objc_msgSend(v13, "recipeID");
      if (v7)
      {
        v38 = 65941;
      }
      else
      {
        if (v37 == 65943)
        {
LABEL_132:
          v15 = &unk_1E3655690;
          goto LABEL_87;
        }
        v37 = objc_msgSend(v13, "recipeID");
        v38 = 65951;
      }
      if (v37 == v38)
        goto LABEL_132;
      PLPhotoKitGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v86 = v13;
        v17 = "Derivative image resource not supported by PHAssetResource: %@";
        goto LABEL_20;
      }
LABEL_85:

LABEL_86:
      v15 = 0;
LABEL_87:

      v39 = v15;
      if (v39)
      {
        v84.receiver = self;
        v84.super_class = (Class)PHAssetResource;
        v40 = -[PHAssetResource init](&v84, sel_init);
        if (!v40)
          goto LABEL_118;
        v41 = a6;
        v82 = v7;
        objc_msgSend(v13, "uniformTypeIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "uuid");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHObject localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", v44);
        v45 = objc_claimAutoreleasedReturnValue();
        assetLocalIdentifier = v40->_assetLocalIdentifier;
        v40->_assetLocalIdentifier = (NSString *)v45;

        objc_storeStrong((id *)&v40->_uniformTypeIdentifier, v43);
        v47 = objc_msgSend(v39, "integerValue");
        v40->_type = v47;
        v48 = v14;
        self = v43;
        v49 = 0;
        switch(v47)
        {
          case 1:
          case 2:
          case 3:
          case 19:
            objc_msgSend(v48, "originalFilename");
            v50 = objc_claimAutoreleasedReturnValue();
LABEL_91:
            v49 = (const __CFString *)v50;
            break;
          case 4:
          case 9:
            objc_msgSend(v48, "originalFilename");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "stringByDeletingPathExtension");
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            _PHAssetResourceOriginalFilenameFromBasePlusUTI(v52, self);
            v49 = (const __CFString *)objc_claimAutoreleasedReturnValue();

            break;
          case 5:
            v49 = CFSTR("FullSizeRender.jpg");
            break;
          case 6:
          case 10:
            v49 = CFSTR("FullSizeRender.mov");
            break;
          case 7:
            v49 = CFSTR("Adjustments.plist");
            break;
          case 8:
            v49 = CFSTR("PenultimateFullSizeRender.jpg");
            break;
          case 11:
          case 12:
            v49 = CFSTR("PenultimateFullSizeRender.mov");
            break;
          case 13:
          case 14:
            objc_msgSend(v48, "originalFilename");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "stringByDeletingPathExtension");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "stringByAppendingString:", CFSTR("S"));
            v81 = self;
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            _PHAssetResourceOriginalFilenameFromBasePlusAsset(v55, v48, 0);
            v56 = objc_claimAutoreleasedReturnValue();
            goto LABEL_104;
          case 15:
            objc_msgSend(v48, "originalFilename");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "stringByDeletingPathExtension");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "stringByAppendingString:", CFSTR("S"));
            v81 = self;
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            _PHAssetResourceOriginalFilenameFromBasePlusUTI(v55, v81);
            v56 = objc_claimAutoreleasedReturnValue();
            goto LABEL_104;
          case 16:
            objc_msgSend(v48, "originalFilename");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "stringByDeletingPathExtension");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "stringByAppendingString:", CFSTR("O"));
            v81 = self;
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v55, "stringByAppendingPathExtension:", *MEMORY[0x1E0D75A68]);
            v56 = objc_claimAutoreleasedReturnValue();
LABEL_104:
            v49 = (const __CFString *)v56;

            self = v81;
            break;
          case 17:
          case 18:
            break;
          case 20:
            v49 = CFSTR("Alchemist.heic");
            break;
          default:
            switch(v47)
            {
              case 'k':
                _PHAssetResourceOriginalFilenameFromBasePlusAsset(CFSTR("DeferredPreview"), v48, 1);
                v50 = objc_claimAutoreleasedReturnValue();
                goto LABEL_91;
              case 'l':
                v49 = CFSTR("Adjustments.data");
                break;
              case 'm':
                v49 = CFSTR("WallpaperComputeResources.dat");
                break;
              case 'n':
                v49 = CFSTR("AdjustmentsSecondary.data");
                break;
              case 'p':
                v49 = CFSTR("ComputeSyncWrapper.dat");
                break;
              case 'r':
                v49 = CFSTR("GenerativePlaygroundFaceResources.dat");
                break;
              default:
                goto LABEL_105;
            }
            break;
        }
LABEL_105:

        originalFilename = v40->_originalFilename;
        v40->_originalFilename = &v49->isa;

        objc_storeStrong((id *)&v40->_photoLibrary, v41);
        if ((int)objc_msgSend(v13, "localAvailability") >= 1)
        {
          v40->_locallyAvailable = 1;
          objc_msgSend(v13, "dataStoreKey");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "fileURLForAssetID:", v48);
          v63 = objc_claimAutoreleasedReturnValue();
          privateFileURL = v40->_privateFileURL;
          v40->_privateFileURL = (NSURL *)v63;

        }
        v40->_pixelWidth = objc_msgSend(v13, "orientedWidth");
        v40->_pixelHeight = objc_msgSend(v13, "orientedHeight");
        v40->_fileSize = objc_msgSend(v13, "dataLength");
        objc_msgSend(v13, "trashedDate");
        v65 = objc_claimAutoreleasedReturnValue();
        trashedDate = v40->_trashedDate;
        v40->_trashedDate = (NSDate *)v65;

        v40->_trashed = objc_msgSend(v13, "trashedState") != 0;
        v67 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71A68]), "initWithResource:", v13);
        backingResourceIdentity = v40->_backingResourceIdentity;
        v40->_backingResourceIdentity = (PLResourceIdentity *)v67;

        objc_msgSend(v48, "objectID");
        v69 = objc_claimAutoreleasedReturnValue();
        assetObjectID = v40->_assetObjectID;
        v40->_assetObjectID = (NSManagedObjectID *)v69;

        v40->_cplResourceType = objc_msgSend(v13, "cplType");
        v40->_orientation = objc_msgSend(v13, "orientation");
        objc_msgSend(v13, "dataStore");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v40->_dataStoreClassID = objc_msgSend((id)objc_opt_class(), "storeClassID");

        v72 = objc_msgSend(v13, "version");
        if (v82)
          v73 = 2;
        else
          v73 = 0;
        v74 = v72 == 3 || v73 == v72;
        v75 = v74;
        v40->_current = v75;
        objc_msgSend(v48, "libraryID");
        v76 = objc_claimAutoreleasedReturnValue();
        libraryID = v40->_libraryID;
        v40->_libraryID = (PLPhotoLibraryPathManagerIdentifier *)v76;

        v40->_inCloud = objc_msgSend(v13, "isInCloud");
      }
      else
      {
        v40 = 0;
      }

LABEL_118:
      return v40;
    case 1u:
LABEL_9:
      if (_PHAssetResourceIsTopClassResource(v13))
      {
        v15 = &unk_1E36556A8;
        switch(objc_msgSend(v13, "version"))
        {
          case 0u:
            goto LABEL_87;
          case 1u:
            v15 = &unk_1E36556D8;
            goto LABEL_87;
          case 2u:
            v15 = &unk_1E36556C0;
            goto LABEL_87;
          case 3u:
            PLPhotoKitGetLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              goto LABEL_85;
            *(_WORD *)buf = 0;
            v17 = "'current' version video is invalid, likely resource data error";
            goto LABEL_82;
          default:
            goto LABEL_12;
        }
      }
      objc_msgSend(v13, "dataStore");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend((id)objc_opt_class(), "storeClassID");

      if (v34 == 3)
      {
        PLPhotoKitGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          goto LABEL_85;
        *(_WORD *)buf = 0;
        v17 = "Unexpected derivative video resource in syndication store";
        goto LABEL_82;
      }
      if (!v34 && (objc_msgSend(v13, "isCPLResource") & 1) != 0)
        goto LABEL_45;
      PLPhotoKitGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        goto LABEL_85;
      *(_WORD *)buf = 0;
      v17 = "Unsupported derivative video type";
      v20 = v16;
      v21 = OS_LOG_TYPE_DEBUG;
      goto LABEL_83;
    case 2u:
      v15 = &unk_1E3655540;
      goto LABEL_87;
    case 3u:
      if (!objc_msgSend(v13, "isDerivative"))
      {
        v15 = &unk_1E3655570;
        switch(objc_msgSend(v13, "version"))
        {
          case 0u:
            goto LABEL_87;
          case 1u:
            v15 = &unk_1E36555A0;
            goto LABEL_87;
          case 2u:
            v15 = &unk_1E3655588;
            goto LABEL_87;
          case 3u:
            PLPhotoKitGetLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              goto LABEL_85;
            *(_WORD *)buf = 0;
            v17 = "'current' version video complement is invalid, likely resource data error";
            goto LABEL_82;
          default:
            goto LABEL_50;
        }
      }
      objc_msgSend(v13, "dataStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend((id)objc_opt_class(), "storeClassID");

      if (v19 != 3)
      {
        if (!v19 && (objc_msgSend(v13, "isCPLResource") & 1) != 0)
        {
LABEL_45:
          v15 = &unk_1E3655558;
          goto LABEL_87;
        }
        PLPhotoKitGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          goto LABEL_85;
        *(_DWORD *)buf = 138412290;
        v86 = v13;
        v17 = "Derivative video complement resource not supported by PHAssetResource: %@";
        goto LABEL_20;
      }
      PLPhotoKitGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_85;
      *(_WORD *)buf = 0;
      v17 = "Unexpected derivative video complement resource in syndication store";
      goto LABEL_82;
    case 4u:
LABEL_12:
      v15 = &unk_1E36556F0;
      goto LABEL_87;
    case 5u:
      objc_msgSend(v13, "uniformTypeIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D752F0], "supplementalResourceAAEType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v25 = v7;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = self;
      v28 = a6;
      v29 = objc_msgSend(v23, "isEqualToString:", v26);

      v7 = v25;
      v74 = v29 == 0;
      a6 = v28;
      self = v27;
      if (v74)
        v15 = 0;
      else
        v15 = &unk_1E36554E0;
      goto LABEL_87;
    case 6u:
LABEL_28:
      v15 = &unk_1E3655510;
      goto LABEL_87;
    case 7u:
      goto LABEL_87;
    case 8u:
      v15 = &unk_1E36554E0;
      switch(objc_msgSend(v13, "version"))
      {
        case 0u:
          goto LABEL_87;
        case 1u:
        case 3u:
          PLPhotoKitGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            goto LABEL_85;
          *(_DWORD *)buf = 138412290;
          v86 = v13;
          v17 = "Adjustment resource with unsupported version: %@";
          v20 = v16;
          v21 = OS_LOG_TYPE_ERROR;
          goto LABEL_27;
        case 2u:
          v15 = &unk_1E36554F8;
          goto LABEL_87;
        default:
          goto LABEL_28;
      }
    case 9u:
      v31 = objc_msgSend(v13, "version");
      if (!v31)
      {
        v15 = &unk_1E3655720;
        goto LABEL_87;
      }
      if (v31 == 2)
      {
        v15 = &unk_1E3655738;
        goto LABEL_87;
      }
      PLPhotoKitGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_85;
      *(_WORD *)buf = 0;
      v17 = "Media metadata only valid for original or adjusted versions";
      goto LABEL_82;
    case 0xAu:
LABEL_50:
      if (objc_msgSend(v14, "isVideo"))
        v15 = &unk_1E36555B8;
      else
        v15 = &unk_1E36555D0;
      goto LABEL_87;
    case 0xBu:
      v15 = &unk_1E36555E8;
      goto LABEL_87;
    case 0xCu:
    case 0x1Fu:
      PLPhotoKitGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_85;
      *(_WORD *)buf = 0;
      v17 = "Unsupported resource type";
      goto LABEL_82;
    case 0xDu:
      if ((objc_msgSend(v14, "isVideo") & 1) != 0)
      {
        v15 = &unk_1E3655600;
        goto LABEL_87;
      }
      PLPhotoKitGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_85;
      *(_WORD *)buf = 0;
      v17 = "Unsupported metadata for image type";
LABEL_82:
      v20 = v16;
      v21 = OS_LOG_TYPE_ERROR;
LABEL_83:
      v30 = 2;
      goto LABEL_84;
    case 0xEu:
      v32 = objc_msgSend(v13, "recipeID") - 327687;
      if (v32 >= 7)
        goto LABEL_86;
      v15 = (void *)qword_1E35D93B8[v32];
      goto LABEL_87;
    case 0xFu:
      if (objc_msgSend(v13, "recipeID") == 66137)
        v15 = &unk_1E3655708;
      else
        v15 = 0;
      goto LABEL_87;
    default:
      PLPhotoKitGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_85;
      *(_WORD *)buf = 0;
      v17 = "Asset resource type unknown";
      goto LABEL_82;
  }
}

- (PHAssetResource)initWithType:(int64_t)a3 livePhoto:(id)a4
{
  id v7;
  PHAssetResource *v8;
  PHAssetResource *v9;
  uint64_t v10;
  NSString *assetLocalIdentifier;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSURL *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id privateFileLoader;
  uint64_t v23;
  NSURL *privateFileURL;
  void *v25;
  void *v26;
  void *uniformTypeIdentifier;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  uint64_t v32;
  NSString *originalFilename;
  void *v35;
  objc_super v36;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAssetResource.m"), 579, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("livePhoto"));

  }
  v36.receiver = self;
  v36.super_class = (Class)PHAssetResource;
  v8 = -[PHAssetResource init](&v36, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_msgSend(v7, "assetLocalIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    assetLocalIdentifier = v9->_assetLocalIdentifier;
    v9->_assetLocalIdentifier = (NSString *)v10;

    if (a3 == 9)
    {
      objc_msgSend(v7, "videoFileLoader");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      privateFileLoader = v9->_privateFileLoader;
      v9->_privateFileLoader = (id)v21;

      objc_msgSend(v7, "videoURL");
      v23 = objc_claimAutoreleasedReturnValue();
      privateFileURL = v9->_privateFileURL;
      v9->_privateFileURL = (NSURL *)v23;

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL path](v9->_privateFileURL, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_locallyAvailable = objc_msgSend(v25, "fileExistsAtPath:", v26);

      objc_msgSend(v7, "videoTypeIdentifier");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        uniformTypeIdentifier = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(uniformTypeIdentifier, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PHAssetResource.m"), 599, CFSTR("Live photo asset resources only supports 'Photo' and 'PairedVideo'"));
LABEL_10:

        objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v9->_uniformTypeIdentifier);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "preferredFilenameExtension");
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          -[NSURL pathExtension](v9->_privateFileURL, "pathExtension");
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v29)
          {
            v30 = CFSTR("MOV");
            if (a3 == 1)
              v30 = CFSTR("JPG");
            v29 = v30;
          }
        }
        objc_msgSend(v7, "originalFilename");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringByAppendingPathExtension:", v29);
        v32 = objc_claimAutoreleasedReturnValue();
        originalFilename = v9->_originalFilename;
        v9->_originalFilename = (NSString *)v32;

        goto LABEL_16;
      }
      objc_msgSend(v7, "imageFileLoader");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      v14 = v9->_privateFileLoader;
      v9->_privateFileLoader = (id)v13;

      objc_msgSend(v7, "imageURL");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v9->_privateFileURL;
      v9->_privateFileURL = (NSURL *)v15;

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL path](v9->_privateFileURL, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_locallyAvailable = objc_msgSend(v17, "fileExistsAtPath:", v18);

      objc_msgSend(v7, "imageTypeIdentifier");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    uniformTypeIdentifier = v9->_uniformTypeIdentifier;
    v9->_uniformTypeIdentifier = (NSString *)v19;
    goto LABEL_10;
  }
LABEL_16:

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  _PHAssetResourceTypeDescription(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("type: %@, uti: %@, size: {%lu,%lu}"), v4, self->_uniformTypeIdentifier, self->_pixelWidth, self->_pixelHeight);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_originalFilename)
    objc_msgSend(v5, "appendFormat:", CFSTR(", filename: %@"), self->_originalFilename);
  objc_msgSend(v5, "appendFormat:", CFSTR(", asset: %@"), self->_assetLocalIdentifier);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@ %p> - %@"), v8, self, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  int64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D716C0], "prettyMultiLineDescriptionBuilderWithObject:indent:", self, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _PHAssetResourceTypeDescription(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendName:object:", CFSTR("type"), v4);

  objc_msgSend(v3, "appendName:object:", CFSTR("uti"), self->_uniformTypeIdentifier);
  objc_msgSend(v3, "appendName:object:", CFSTR("filename"), self->_originalFilename);
  objc_msgSend(v3, "appendName:object:", CFSTR("asset"), self->_assetLocalIdentifier);
  objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("locallyAvailable"), self->_locallyAvailable);
  objc_msgSend(v3, "appendName:object:", CFSTR("fileURL"), self->_privateFileURL);
  objc_msgSend(v3, "appendName:integerValue:", CFSTR("width"), self->_pixelWidth);
  objc_msgSend(v3, "appendName:integerValue:", CFSTR("height"), self->_pixelHeight);
  objc_msgSend(v3, "appendName:unsignedIntegerValue:", CFSTR("fileSize"), -[PHAssetResource fileSize](self, "fileSize"));
  v5 = -[PHAssetResource analysisType](self, "analysisType");
  if ((unint64_t)(v5 - 1) > 2)
    v6 = CFSTR("small");
  else
    v6 = off_1E35D7CB8[v5 - 1];
  v7 = v6;
  objc_msgSend(v3, "appendName:object:", CFSTR("analysisType"), v7);

  objc_msgSend(MEMORY[0x1E0D11440], "shortDescriptionForResourceType:", self->_cplResourceType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendName:object:", CFSTR("cplResourceType"), v8);

  objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("isCurrent"), self->_current);
  objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("isInCloud"), self->_inCloud);
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PHAsset)asset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[PHAssetResource photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHAssetResource assetLocalIdentifier](self, "assetLocalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHAsset *)v8;
}

- (PHAssetResourceType)type
{
  return self->_type;
}

- (NSString)assetLocalIdentifier
{
  return self->_assetLocalIdentifier;
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (NSInteger)pixelWidth
{
  return self->_pixelWidth;
}

- (NSInteger)pixelHeight
{
  return self->_pixelHeight;
}

- (PLResourceIdentity)backingResourceIdentity
{
  return self->_backingResourceIdentity;
}

- (NSManagedObjectID)assetObjectID
{
  return self->_assetObjectID;
}

- (unsigned)dataStoreClassID
{
  return self->_dataStoreClassID;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

- (unint64_t)cplResourceType
{
  return self->_cplResourceType;
}

- (void)setCplResourceType:(unint64_t)a3
{
  self->_cplResourceType = a3;
}

- (BOOL)isLocallyAvailable
{
  return self->_locallyAvailable;
}

- (void)setLocallyAvailable:(BOOL)a3
{
  self->_locallyAvailable = a3;
}

- (NSURL)privateFileURL
{
  return self->_privateFileURL;
}

- (void)setPrivateFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_privateFileURL, a3);
}

- (BOOL)isCurrent
{
  return self->_current;
}

- (PLPhotoLibraryPathManagerIdentifier)libraryID
{
  return self->_libraryID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryID, 0);
  objc_storeStrong((id *)&self->_assetObjectID, 0);
  objc_storeStrong((id *)&self->_backingResourceIdentity, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifier, 0);
  objc_storeStrong(&self->_privateFileLoader, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_trashedDate, 0);
  objc_storeStrong((id *)&self->_privateFileURL, 0);
}

+ (id)_assetResourcesFromPLResources:(id)a3 includeMetadata:(BOOL)a4 mediaMetadataVirtualResources:(id)a5 asset:(id)a6 photoLibrary:(id)a7 assetHasAdjustments:(BOOL)a8 includeDerivatives:(BOOL)a9 includeAdjustmentOverflowDataBlob:(BOOL)a10
{
  _BOOL8 v13;
  _BOOL8 v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _UNKNOWN **v21;
  uint64_t v22;
  void *v23;
  int IsTopClassResource;
  NSObject *v25;
  id v26;
  _BOOL8 v27;
  _UNKNOWN **v28;
  _BOOL8 v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  PHAssetResource *v40;
  PHAssetResource *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v51;
  void *v52;
  id v53;
  id v54;
  _BOOL4 v55;
  _QWORD v56[4];
  PHAssetResource *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v55 = a8;
  v13 = a4;
  v14 = a10;
  v72 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v51 = a5;
  v54 = a6;
  v53 = a7;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
  v52 = v17;
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v63;
    v21 = &off_1E35D2000;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v63 != v20)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v22);
        IsTopClassResource = _PHAssetResourceIsTopClassResource(v23);
        if ((a9 || IsTopClassResource)
          && (v13
           || objc_msgSend(v23, "resourceType") != 9
           && objc_msgSend(v23, "resourceType") != 13)
          && (v14 || objc_msgSend(v23, "resourceType") != 6)
          && (!objc_msgSend(v23, "isDerivative") || objc_msgSend(v23, "version") || !v55))
        {
          if (objc_msgSend(v23, "version") != 2 || v55)
          {
            v31 = objc_msgSend(objc_alloc((Class)v21[295]), "initWithResource:asset:hasAdjustments:photoLibrary:", v23, v54, v55, v53);
            v25 = v31;
            if (v31)
            {
              if (-[NSObject type](v31, "type") == 1
                || -[NSObject type](v25, "type") == 2
                || -[NSObject type](v25, "type") == 3)
              {
                objc_msgSend(v16, "insertObject:atIndex:", v25, 0);
              }
              else
              {
                objc_msgSend(v16, "addObject:", v25);
              }
            }
          }
          else
          {
            PLPhotoKitGetLog();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v54, "uuid");
              v26 = v16;
              v27 = v13;
              v28 = v21;
              v29 = v14;
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v67 = (uint64_t)v30;
              _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_DEFAULT, "Asset %@ with no adjustments has adjusted resource, resource will be ignored", buf, 0xCu);

              v14 = v29;
              v21 = v28;
              v13 = v27;
              v16 = v26;
              v17 = v52;
            }
          }

        }
        ++v22;
      }
      while (v19 != v22);
      v32 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      v19 = v32;
    }
    while (v32);
  }

  v33 = v51;
  if (v13)
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v34 = v51;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v59;
      v38 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v59 != v37)
            objc_enumerationMutation(v34);
          v40 = -[PHAssetResource initWithResource:asset:hasAdjustments:photoLibrary:]([PHAssetResource alloc], "initWithResource:asset:hasAdjustments:photoLibrary:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i), v54, v55, v53);
          v56[0] = v38;
          v56[1] = 3221225472;
          v56[2] = __188__PHAssetResource__assetResourcesFromPLResources_includeMetadata_mediaMetadataVirtualResources_asset_photoLibrary_assetHasAdjustments_includeDerivatives_includeAdjustmentOverflowDataBlob___block_invoke;
          v56[3] = &unk_1E35D9250;
          v41 = v40;
          v57 = v41;
          v42 = objc_msgSend(v16, "indexOfObjectPassingTest:", v56);
          if (v41)
          {
            if (v42 != 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v16, "removeObjectAtIndex:", v42);
            objc_msgSend(v16, "addObject:", v41);
          }

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      }
      while (v36);
    }

    v33 = v51;
  }
  objc_msgSend(v16, "indexesOfObjectsPassingTest:", &__block_literal_global_16781);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v43, "count") >= 2)
  {
    objc_msgSend(v16, "objectsAtIndexes:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectsAtIndexes:", v43);
    v45 = (id)objc_msgSend(v44, "sortedArrayUsingComparator:", &__block_literal_global_20);
    PLImageManagerGetLog();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = objc_msgSend(v43, "count");
      objc_msgSend(v54, "uuid");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v67 = v47;
      v68 = 2114;
      v69 = v48;
      _os_log_impl(&dword_1991EC000, v46, OS_LOG_TYPE_ERROR, "%ld original photo image resources found for asset %{public}@, not fatal, picking best and continuing", buf, 0x16u);

    }
    objc_msgSend(v44, "lastObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v49);

  }
  return v16;
}

+ (id)_resourcesForManagedAsset:(id)a3 includeDerivatives:(BOOL)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  BOOL v17;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v6, "modernResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "nonPersistedResources");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "virtualResourcesThatReplaceMissingPersistedResources:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObjectsFromArray:", v11);
  objc_msgSend(v7, "addObjectsFromArray:", v12);
  objc_msgSend(v7, "addObjectsFromArray:", v13);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__PHAssetResource__resourcesForManagedAsset_includeDerivatives___block_invoke;
  v16[3] = &__block_descriptor_33_e22_B16__0___PLResource__8l;
  v17 = a4;
  objc_msgSend(v7, "_pl_filter:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (NSArray)assetResourcesForAsset:(PHAsset *)asset
{
  return (NSArray *)objc_msgSend(a1, "assetResourcesForAsset:includeDerivatives:", asset, 0);
}

+ (NSArray)assetResourcesForLivePhoto:(PHLivePhoto *)livePhoto
{
  PHLivePhoto *v3;
  PHAssetResource *v4;
  PHAssetResource *v5;
  BOOL v6;
  NSObject *v7;
  void *v9;
  uint8_t v10[8];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (!livePhoto)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  v3 = livePhoto;
  v4 = -[PHAssetResource initWithType:livePhoto:]([PHAssetResource alloc], "initWithType:livePhoto:", 1, v3);
  v5 = -[PHAssetResource initWithType:livePhoto:]([PHAssetResource alloc], "initWithType:livePhoto:", 9, v3);

  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Unable to create live photo asset resources", v10, 2u);
    }

    v9 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v11[0] = v4;
    v11[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v9;
}

BOOL __64__PHAssetResource__resourcesForManagedAsset_includeDerivatives___block_invoke(uint64_t a1, void *a2)
{
  return !objc_msgSend(a2, "isDerivative") || *(_BYTE *)(a1 + 32) != 0;
}

BOOL __188__PHAssetResource__assetResourcesFromPLResources_includeMetadata_mediaMetadataVirtualResources_asset_photoLibrary_assetHasAdjustments_includeDerivatives_includeAdjustmentOverflowDataBlob___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "type");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "type");
}

uint64_t __188__PHAssetResource__assetResourcesFromPLResources_includeMetadata_mediaMetadataVirtualResources_asset_photoLibrary_assetHasAdjustments_includeDerivatives_includeAdjustmentOverflowDataBlob___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "backingResourceIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "recipeID");
  objc_msgSend(v5, "backingResourceIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "recipeID");

  if (v7 == v9)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "backingResourceIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "recipeID");

    if (v12)
    {
      objc_msgSend(v5, "backingResourceIdentity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "recipeID");

      if (v14)
      {
        objc_msgSend(v4, "backingResourceIdentity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "recipeID");
        objc_msgSend(v5, "backingResourceIdentity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "recipeID");

        if (v16 > v18)
          v10 = 1;
        else
          v10 = -1;
      }
      else
      {
        v10 = -1;
      }
    }
    else
    {
      v10 = 1;
    }
  }

  return v10;
}

BOOL __188__PHAssetResource__assetResourcesFromPLResources_includeMetadata_mediaMetadataVirtualResources_asset_photoLibrary_assetHasAdjustments_includeDerivatives_includeAdjustmentOverflowDataBlob___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 1;
}

- (id)privateFileLoader
{
  return _Block_copy(self->_privateFileLoader);
}

- (NSDate)trashedDate
{
  return self->_trashedDate;
}

- (BOOL)isTrashed
{
  return self->_trashed;
}

- (int64_t)analysisType
{
  int64_t type;
  unint64_t v5;

  if (!self->_current)
    return 3;
  type = self->_type;
  if (type > 101)
  {
    switch(type)
    {
      case 'f':
        return 0;
      case 'g':
        if (self->_dataStoreClassID == 3)
          return 1;
        v5 = self->_cplResourceType - 1;
        if (v5 < 5)
          return qword_19944A9C8[v5];
        break;
      case 'k':
        return 2;
    }
    return 3;
  }
  if (type != 1 && type != 5)
    return 3;
  if (self->_dataStoreClassID == 3)
    return 3;
  else
    return 2;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (BOOL)isInCloud
{
  return self->_inCloud;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

+ (id)assetResourceForAsset:(id)a3 qualityClass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__16851;
  v25 = __Block_byref_object_dispose__16852;
  v26 = 0;
  objc_msgSend(v6, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__PHAssetResource_Private__assetResourceForAsset_qualityClass___block_invoke;
  v15[3] = &unk_1E35D92F8;
  v10 = v6;
  v16 = v10;
  v11 = v7;
  v17 = v11;
  v19 = &v21;
  v20 = a1;
  v12 = v8;
  v18 = v12;
  objc_msgSend(v9, "performBlockAndWait:", v15);

  v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v13;
}

+ (id)assetResourcesForAsset:(id)a3 includeDerivatives:(BOOL)a4
{
  return (id)objc_msgSend(a1, "assetResourcesForAsset:includeDerivatives:includeMetadata:", a3, a4, 0);
}

+ (id)assetResourcesForAsset:(id)a3 includeDerivatives:(BOOL)a4 includeMetadata:(BOOL)a5
{
  return (id)objc_msgSend(a1, "assetResourcesForAsset:includeDerivatives:includeMetadata:includeAdjustmentOverflowDataBlob:", a3, a4, a5, 0);
}

+ (id)assetResourcesForAsset:(id)a3 includeDerivatives:(BOOL)a4 includeMetadata:(BOOL)a5 includeAdjustmentOverflowDataBlob:(BOOL)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __120__PHAssetResource_Private__assetResourcesForAsset_includeDerivatives_includeMetadata_includeAdjustmentOverflowDataBlob___block_invoke;
  v20[3] = &unk_1E35D9320;
  v21 = v10;
  v22 = v13;
  v25 = a5;
  v24 = a1;
  v26 = a4;
  v27 = a6;
  v14 = v11;
  v23 = v14;
  v15 = v13;
  v16 = v10;
  objc_msgSend(v15, "performBlockAndWait:", v20);
  v17 = v23;
  v18 = v14;

  return v18;
}

+ (id)assetResourcesForAssets:(id)a3 includeDerivatives:(BOOL)a4 includeMetadata:(BOOL)a5 includeAdjustmentOverflowDataBlob:(BOOL)a6
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  SEL v27;
  id v28;
  BOOL v29;
  BOOL v30;
  BOOL v31;
  _OWORD v32[4];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  memset(v32, 0, sizeof(v32));
  if (objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", v32, v33, 16)
    && (objc_msgSend(**((id **)&v32[0] + 1), "photoLibrary"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = v12;
    objc_msgSend(v12, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __121__PHAssetResource_Private__assetResourcesForAssets_includeDerivatives_includeMetadata_includeAdjustmentOverflowDataBlob___block_invoke;
    v22[3] = &unk_1E35D9398;
    v23 = v11;
    v24 = v14;
    v27 = a2;
    v28 = a1;
    v25 = v13;
    v29 = a4;
    v30 = a5;
    v31 = a6;
    v16 = v15;
    v26 = v16;
    v17 = v14;
    v18 = v13;
    objc_msgSend(v17, "performBlockAndWait:", v22);
    v19 = v26;
    v20 = v16;

  }
  else
  {
    v20 = (id)MEMORY[0x1E0C9AA70];
  }

  return v20;
}

+ (id)computeSyncMediaAnalysisPayloadDataForResourceURL:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D71580], "mediaAnalysisPayloadDataForWrapperURL:", a3);
}

void __121__PHAssetResource_Private__assetResourcesForAssets_includeDerivatives_includeMetadata_includeAdjustmentOverflowDataBlob___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  __int16 v29;
  char v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  _QWORD v39[5];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v34;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v7), "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0D71880], "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFetchBatchSize:", 100);
  v39[0] = CFSTR("additionalAttributes");
  v39[1] = CFSTR("additionalAttributes.mediaMetadata");
  v39[2] = CFSTR("master");
  v39[3] = CFSTR("master.mediaMetadata");
  v39[4] = CFSTR("modernResources");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v10);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("uuid"), v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v11);

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = qos_class_self() == QOS_CLASS_USER_INITIATED || qos_class_self() == QOS_CLASS_USER_INTERACTIVE;
  v14 = objc_alloc(MEMORY[0x1E0D71710]);
  NSStringFromSelector(*(SEL *)(a1 + 64));
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "pathManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __121__PHAssetResource_Private__assetResourcesForAssets_includeDerivatives_includeMetadata_includeAdjustmentOverflowDataBlob___block_invoke_2;
  v31[3] = &unk_1E35D9348;
  v32 = *(id *)(a1 + 48);
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __121__PHAssetResource_Private__assetResourcesForAssets_includeDerivatives_includeMetadata_includeAdjustmentOverflowDataBlob___block_invoke_3;
  v24[3] = &unk_1E35D9370;
  v18 = *(id *)(a1 + 32);
  v19 = *(_QWORD *)(a1 + 72);
  v25 = v18;
  v28 = v19;
  v29 = *(_WORD *)(a1 + 80);
  v26 = *(id *)(a1 + 48);
  v30 = *(_BYTE *)(a1 + 82);
  v27 = *(id *)(a1 + 56);
  v20 = (void *)objc_msgSend(v14, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v15, v9, v12, v16, v13, 0, v31, 0, v24);

  v23 = 0;
  LOBYTE(v15) = objc_msgSend(v20, "processObjectsWithError:", &v23);
  v21 = v23;
  if ((v15 & 1) == 0)
  {
    PLPhotoKitGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v21;
      _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, "Error while enumerating assets: %@", buf, 0xCu);
    }

  }
}

id __121__PHAssetResource_Private__assetResourcesForAssets_includeDerivatives_includeMetadata_includeAdjustmentOverflowDataBlob___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  v2 = objc_alloc_init(MEMORY[0x1E0D719D0]);
  objc_msgSend(v2, "setRequiredState:", 6);
  objc_msgSend(v2, "setRefreshesAfterSave:", 0);
  objc_msgSend(v2, "setAutomaticallyPinToFirstFetch:", 0);
  objc_msgSend(v2, "setLibraryRole:", 0);
  v3 = (void *)MEMORY[0x1E0D719A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-worker"), "+[PHAssetResource(Private) assetResourcesForAssets:includeDerivatives:includeMetadata:includeAdjustmentOverflowDataBlob:]_block_invoke_2");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "UTF8String");
  objc_msgSend(*(id *)(a1 + 32), "photoLibraryBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "newPhotoLibraryWithName:loadedFromBundle:options:error:", v5, v6, v2, 0);

  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __121__PHAssetResource_Private__assetResourcesForAssets_includeDerivatives_includeMetadata_includeAdjustmentOverflowDataBlob___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
      objc_msgSend(v10, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if ((v13 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v10;

    if (!v14)
      goto LABEL_18;
    objc_msgSend(*(id *)(a1 + 56), "_resourcesForManagedAsset:includeDerivatives:", v4, *(unsigned __int8 *)(a1 + 64));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 56);
    v17 = *(unsigned __int8 *)(a1 + 65);
    if (*(_BYTE *)(a1 + 65))
    {
      objc_msgSend(v4, "mediaMetadataVirtualResources");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    v19 = *(_QWORD *)(a1 + 40);
    v20 = objc_msgSend(v4, "hasAdjustments");
    BYTE1(v22) = *(_BYTE *)(a1 + 66);
    LOBYTE(v22) = *(_BYTE *)(a1 + 64);
    objc_msgSend(v16, "_assetResourcesFromPLResources:includeMetadata:mediaMetadataVirtualResources:asset:photoLibrary:assetHasAdjustments:includeDerivatives:includeAdjustmentOverflowDataBlob:", v15, v17 != 0, v18, v4, v19, v20, v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)

    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v21, v14);
  }
  else
  {
LABEL_9:
    v14 = v5;
  }

LABEL_18:
}

void __120__PHAssetResource_Private__assetResourcesForAsset_includeDerivatives_includeMetadata_includeAdjustmentOverflowDataBlob___block_invoke(uint64_t a1)
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;

  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("self == %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeFetchRequest:error:", v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "refreshObject:mergeChanges:", v10, objc_msgSend(v10, "hasChanges"));

    v12 = objc_msgSend(*(id *)(a1 + 32), "isWalrusEnabled");
    v13 = (void *)MEMORY[0x1E0D71880];
    objc_msgSend(v10, "objectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v13, "fetchResourcesForAssetWithObjectID:inContext:versions:includeVirtualResources:allowDerivatives:excludeDynamicCPLResources:additionalPredicate:relationshipKeyPathsForPrefetching:error:", v14, v15, 0, 1, 1, v12, 0, 0, &v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v26;

    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(v10, "mediaMetadataVirtualResources");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_BYTE *)(a1 + 64) != 0;
    }
    else
    {
      v19 = 0;
      v18 = 0;
    }
    v20 = *(void **)(a1 + 56);
    v21 = *(void **)(a1 + 32);
    objc_msgSend(v21, "photoLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v10, "hasAdjustments");
    LOWORD(v25) = *(_WORD *)(a1 + 65);
    objc_msgSend(v20, "_assetResourcesFromPLResources:includeMetadata:mediaMetadataVirtualResources:asset:photoLibrary:assetHasAdjustments:includeDerivatives:includeAdjustmentOverflowDataBlob:", v16, v19, v18, v21, v22, v23, v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v24);

  }
}

void __63__PHAssetResource_Private__assetResourceForAsset_qualityClass___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetWithObjectID:inManagedObjectContext:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(*(id *)(a1 + 32), "isWalrusEnabled");
  v9 = (void *)MEMORY[0x1E0D71880];
  v28 = v7;
  objc_msgSend(v7, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v27 = (void *)v4;
  objc_msgSend(v9, "fetchResourcesForAssetWithObjectID:inContext:versions:includeVirtualResources:allowDerivatives:excludeDynamicCPLResources:additionalPredicate:relationshipKeyPathsForPrefetching:error:", v10, v4, 0, 1, 1, v8, 0, 0, &v33);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v33;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v17, "dataStore");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 40), "isTable"))
        {
          v19 = objc_msgSend(v17, "recipeID");
          objc_msgSend(*(id *)(a1 + 40), "backingImageFormat");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "formatID");
          v21 = PLTableThumbnailRecipeIDFromFormatID();

          if (v19 == v21)
            goto LABEL_15;
        }
        else if (objc_msgSend(*(id *)(a1 + 40), "isThumbnail"))
        {
          if ((objc_msgSend(MEMORY[0x1E0D71A58], "isMasterThumbRecipeID:", objc_msgSend(v17, "recipeID")) & 1) != 0)
            goto LABEL_15;
        }
        else if (PLDataStoreHasClassID())
        {
          if (objc_msgSend(v17, "isCPLResource"))
          {
            v22 = objc_msgSend(v17, "cplType");
            if (v22 == objc_msgSend(*(id *)(a1 + 40), "backingCPLResourceType"))
            {
LABEL_15:
              v23 = objc_msgSend(objc_alloc(*(Class *)(a1 + 64)), "initWithResource:asset:hasAdjustments:photoLibrary:", v17, *(_QWORD *)(a1 + 32), objc_msgSend(v28, "hasAdjustments"), *(_QWORD *)(a1 + 48));
              v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
              v25 = *(void **)(v24 + 40);
              *(_QWORD *)(v24 + 40) = v23;

            }
          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v14);
  }

}

@end
