@implementation PHPTPFormatConversionManager

- (PHPTPFormatConversionManager)init
{
  PHPTPFormatConversionManager *v2;
  void *v3;
  void *v4;
  NSURL *temporaryDirectoryURL;
  void *v6;
  uint64_t v7;
  PFMediaCapabilities *legacyCapabilities;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHPTPFormatConversionManager;
  v2 = -[PHPTPFormatConversionManager init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPTPFormatConversionManager setConvertedLivePhotoPairingIdentifiersByOriginalIdentifiers:](v2, "setConvertedLivePhotoPairingIdentifiersByOriginalIdentifiers:", v3);

    v4 = (void *)objc_opt_new();
    -[PHPTPFormatConversionManager setMediaFormatConversionManager:](v2, "setMediaFormatConversionManager:", v4);

    if (-[PHPTPFormatConversionManager setupTemporaryDirectory](v2, "setupTemporaryDirectory"))
    {
      temporaryDirectoryURL = v2->_temporaryDirectoryURL;
      -[PHPTPFormatConversionManager mediaFormatConversionManager](v2, "mediaFormatConversionManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDirectoryForTemporaryFiles:", temporaryDirectoryURL);

      -[PHPTPFormatConversionManager setInitialized:](v2, "setInitialized:", 1);
      v2->_penultimateIsPublic = 0;
    }
    objc_msgSend(MEMORY[0x1E0D75128], "legacyCapabilities");
    v7 = objc_claimAutoreleasedReturnValue();
    legacyCapabilities = v2->_legacyCapabilities;
    v2->_legacyCapabilities = (PFMediaCapabilities *)v7;

  }
  return v2;
}

- (BOOL)setupTemporaryDirectory
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  unsigned __int8 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  NSObject *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%d"), v5, getpid());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  NSTemporaryDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPTPFormatConversionManager setTemporaryDirectoryURL:](self, "setTemporaryDirectoryURL:", v9);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  -[PHPTPFormatConversionManager temporaryDirectoryURL](self, "temporaryDirectoryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v12, &v29);

  if (v13)
  {
    v14 = v29;
    PLPTPGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      v17 = 1;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        -[PHPTPFormatConversionManager temporaryDirectoryURL](self, "temporaryDirectoryURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v18;
        _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_INFO, "Conversion manager temporary directory path already exists: %@", buf, 0xCu);

      }
      goto LABEL_15;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[PHPTPFormatConversionManager temporaryDirectoryURL](self, "temporaryDirectoryURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v26;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "Conversion manager temporary directory path exists but is not directory %@", buf, 0xCu);

    }
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  -[PHPTPFormatConversionManager temporaryDirectoryURL](self, "temporaryDirectoryURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v20 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v19, 1, 0, &v28);
  v16 = v28;

  PLPTPGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[PHPTPFormatConversionManager temporaryDirectoryURL](self, "temporaryDirectoryURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v25;
      v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, "Unable to create conversion manager temporary directory %@: %@", buf, 0x16u);

    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    -[PHPTPFormatConversionManager temporaryDirectoryURL](self, "temporaryDirectoryURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v24;
    _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_INFO, "Created conversion manager temporary directory %@", buf, 0xCu);

  }
  v17 = 1;
LABEL_15:

  return v17;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  void *v8;
  objc_super v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPTPFormatConversionManager temporaryDirectoryURL](self, "temporaryDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v5 = objc_msgSend(v3, "removeItemAtURL:error:", v4, &v10);
  v6 = v10;

  if ((v5 & 1) == 0)
  {
    PLPTPGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[PHPTPFormatConversionManager temporaryDirectoryURL](self, "temporaryDirectoryURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v8;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Unable to remove temporary directory %@: %{public}@", buf, 0x16u);

    }
  }

  v9.receiver = self;
  v9.super_class = (Class)PHPTPFormatConversionManager;
  -[PHPTPFormatConversionManager dealloc](&v9, sel_dealloc);
}

- (id)ptpAssetReaderForFormatConvertedPTPAsset:(id)a3 ofPhotosAsset:(id)a4 resourcePath:(id)a5 originalResourcePath:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  PHPTPConversionDestinationAssetReader *v27;
  void *v28;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  dispatch_block_t v45;
  void *v46;
  PHPTPConversionDestinationAssetReader *v47;
  NSObject *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  _QWORD block[4];
  NSObject *v54;
  id v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (-[PHPTPFormatConversionManager initialized](self, "initialized"))
  {
    v15 = objc_msgSend(v11, "isMovie");
    objc_msgSend(v12, "ptpProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "livePhotoPairingIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "ptpProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (double)(unint64_t)objc_msgSend(v18, "originalWidth");
    objc_msgSend(v12, "ptpProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (double)(unint64_t)objc_msgSend(v20, "originalHeight");

    objc_msgSend(v11, "resourceHandle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "resourceType");

    v24 = v15;
    switch(v23)
    {
      case 3:
      case 4:
      case 7:
      case 8:
      case 10:
      case 11:
      case 12:
      case 16:
      case 17:
        goto LABEL_6;
      case 5:
        -[PHPTPFormatConversionManager requestForOriginalAtPath:isVideo:imageDimensions:originalPairingIdentifier:](self, "requestForOriginalAtPath:isVideo:imageDimensions:originalPairingIdentifier:", v14, 0, v17, v19, v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "imagePixSize");
        v32 = v31;
        v34 = v33;
        objc_msgSend(v11, "filename");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHPTPFormatConversionManager requestForRenderImagePath:imageDimensions:outputFilename:](self, "requestForRenderImagePath:imageDimensions:outputFilename:", v13, v35, v32, v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = 0;
        objc_msgSend(MEMORY[0x1E0D47C38], "chainedRequestForAdjustmentRenderRequest:dependingOnRequest:error:", v36, v30, &v55);
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = v55;
        v51 = (void *)v37;
        if (!v37)
        {
          v50 = v38;
          PLPTPGetLog();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v57 = (uint64_t)v13;
            v58 = 2114;
            v59 = (uint64_t)v50;
            _os_log_impl(&dword_1991EC000, v39, OS_LOG_TYPE_ERROR, "Unable to create request for path %@: %{public}@", buf, 0x16u);
          }

          v38 = v50;
        }

        v40 = v51;
        if (!v51)
          break;
        goto LABEL_32;
      case 6:
        objc_msgSend(v11, "filename");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHPTPFormatConversionManager requestForRenderVideoPath:outputFilename:](self, "requestForRenderVideoPath:outputFilename:", v13, v41);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v40)
          break;
        goto LABEL_32;
      case 9:
        v24 = 1;
        goto LABEL_26;
      case 13:
      case 14:
      case 15:
      case 19:
      case 20:
        PLPTPGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v57 = v23;
          _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
        }

        goto LABEL_6;
      case 18:
        goto LABEL_26;
      default:
        if (v23 == 108 || (v24 = v15, v23 == 113))
        {
LABEL_6:
          PLPTPGetLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v57 = 0;
            v58 = 2048;
            v59 = v23;
            _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_ERROR, "Ignoring conversion request %{public}@ for unknown asset type %ld", buf, 0x16u);
          }
          v27 = 0;
LABEL_9:

          goto LABEL_13;
        }
LABEL_26:
        -[PHPTPFormatConversionManager requestForOriginalAtPath:isVideo:imageDimensions:originalPairingIdentifier:](self, "requestForOriginalAtPath:isVideo:imageDimensions:originalPairingIdentifier:", v13, v24, v17, v19, v21);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "resourceHandle");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "requiresConversion");

        v40 = v52;
        if (v43)
        {
          objc_msgSend(v52, "setForceFormatConversion:", 1);
          if (!(_DWORD)v15)
          {
LABEL_28:
            if (!v52)
              break;
            goto LABEL_32;
          }
        }
        else if (!(_DWORD)v15)
        {
          goto LABEL_28;
        }
        -[PHPTPFormatConversionManager mediaFormatConversionManager](self, "mediaFormatConversionManager");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "preflightConversionRequest:", v52);

        objc_msgSend(v52, "enableSinglePassVideoEncodingWithUpdateHandler:", &__block_literal_global_3427);
        if (v52)
        {
LABEL_32:
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __121__PHPTPFormatConversionManager_ptpAssetReaderForFormatConvertedPTPAsset_ofPhotosAsset_resourcePath_originalResourcePath___block_invoke_51;
          block[3] = &unk_1E35DF110;
          v26 = v40;
          v54 = v26;
          v45 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
          -[PHPTPFormatConversionManager mediaFormatConversionManager](self, "mediaFormatConversionManager");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "enqueueConversionRequest:completionHandler:", v26, v45);

          if ((-[NSObject requiresSinglePassVideoConversion](v26, "requiresSinglePassVideoConversion") & 1) != 0
            || (dispatch_block_wait(v45, 0xFFFFFFFFFFFFFFFFLL), -[NSObject status](v26, "status") == 4))
          {
            v47 = [PHPTPConversionDestinationAssetReader alloc];
            -[NSObject destination](v26, "destination");
            v48 = objc_claimAutoreleasedReturnValue();
            v27 = -[PHPTPConversionDestinationAssetReader initWithDestination:](v47, "initWithDestination:", v48);
          }
          else
          {
            PLPTPGetLog();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              -[NSObject error](v26, "error");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v57 = (uint64_t)v26;
              v58 = 2048;
              v59 = v23;
              v60 = 2114;
              v61 = v49;
              _os_log_impl(&dword_1991EC000, v48, OS_LOG_TYPE_ERROR, "Conversion request %{public}@ for asset type %ld failed: %{public}@", buf, 0x20u);

            }
            v27 = 0;
          }

          goto LABEL_9;
        }
        break;
    }
  }
  else
  {
    PLPTPGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = (uint64_t)v28;
      _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Ignoring request %{public}@ to conversion manager in failed state", buf, 0xCu);

    }
  }
  v27 = 0;
LABEL_13:

  return v27;
}

- (id)requestForOriginalAtPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5 originalPairingIdentifier:(id)a6
{
  double height;
  double width;
  _BOOL8 v8;
  id v11;
  void *v12;
  void *v13;

  height = a5.height;
  width = a5.width;
  v8 = a4;
  v11 = a6;
  -[PHPTPFormatConversionManager requestForPath:isVideo:imageDimensions:](self, "requestForPath:isVideo:imageDimensions:", a3, v8, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v11)
    {
      -[PHPTPFormatConversionManager convertedAssetLivePhotoPairingIdentifierForOriginalIdentifier:](self, "convertedAssetLivePhotoPairingIdentifierForOriginalIdentifier:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLivePhotoPairingIdentifier:", v13);
      objc_msgSend(v12, "setLivePhotoPairingIdentifierBehavior:", 4);

    }
    objc_msgSend(v12, "setShouldPadOutputFileToEstimatedLength:", 1);
  }

  return v12;
}

- (id)requestForRenderImagePath:(id)a3 imageDimensions:(CGSize)a4 outputFilename:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  -[PHPTPFormatConversionManager requestForPath:isVideo:imageDimensions:](self, "requestForPath:isVideo:imageDimensions:", a3, 0, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setOutputFilename:", v9);
    objc_msgSend(v11, "setLivePhotoPairingIdentifierBehavior:", 1);
    objc_msgSend(v11, "setShouldPadOutputFileToEstimatedLength:", 1);
  }

  return v11;
}

- (id)requestForRenderVideoPath:(id)a3 outputFilename:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[PHPTPFormatConversionManager requestForPath:isVideo:imageDimensions:](self, "requestForPath:isVideo:imageDimensions:", a3, 1, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setOutputFilename:", v6);
    objc_msgSend(v8, "setLivePhotoPairingIdentifierBehavior:", 1);
    objc_msgSend(v8, "setShouldPadOutputFileToEstimatedLength:", 1);
  }

  return v8;
}

- (id)requestForPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5
{
  double height;
  double width;
  _BOOL8 v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  height = a5.height;
  width = a5.width;
  v7 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[PHPTPFormatConversionManager sourceForPath:isVideo:imageDimensions:](self, "sourceForPath:isVideo:imageDimensions:", v9, v7, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D47C48];
  -[PHPTPFormatConversionManager effectivePeerMediaCapabilites](self, "effectivePeerMediaCapabilites");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v11, "requestForSource:destinationCapabilities:error:", v10, v12, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v17;

  if (!v13)
  {
    PLPTPGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v9;
      v20 = 2114;
      v21 = v14;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Unable to create request for path %@: %{public}@", buf, 0x16u);
    }

  }
  return v13;
}

- (id)sourceForPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5
{
  double height;
  double width;
  _BOOL4 v7;
  void *v8;
  void *v9;

  height = a5.height;
  width = a5.width;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(MEMORY[0x1E0D47C50], "videoSourceForFileURL:", v8);
  else
    objc_msgSend(MEMORY[0x1E0D47C50], "imageSourceForFileURL:dimensions:", v8, width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)convertedAssetLivePhotoPairingIdentifierForOriginalIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHPTPFormatConversionManager convertedLivePhotoPairingIdentifiersByOriginalIdentifiers](self, "convertedLivePhotoPairingIdentifiersByOriginalIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHPTPFormatConversionManager convertedLivePhotoPairingIdentifiersByOriginalIdentifiers](self, "convertedLivePhotoPairingIdentifiersByOriginalIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v4);

    PLPTPGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEBUG, "Cached converted live photo UUID %@ -> %@", (uint8_t *)&v12, 0x16u);
    }

  }
  PLPTPGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412546;
    v13 = v4;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_DEBUG, "Using converted live photo UUID %@ -> %@", (uint8_t *)&v12, 0x16u);
  }

  return v6;
}

- (BOOL)generatePosterFrameExportForVideoURL:(id)a3 outputData:(id *)a4 maximumSize:(CGSize)a5 error:(id *)a6
{
  double height;
  double width;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  height = a5.height;
  width = a5.width;
  v10 = (void *)MEMORY[0x1E0D47C10];
  v11 = (void *)*MEMORY[0x1E0CEC530];
  v12 = a3;
  objc_msgSend(v11, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v10, "generatePosterFrameExportForVideoURL:outputData:maximumSize:outputFileType:error:", v12, a4, v13, a6, width, height);

  return (char)a6;
}

- (void)invalidate
{
  id v2;

  -[PHPTPFormatConversionManager mediaFormatConversionManager](self, "mediaFormatConversionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (BOOL)peerSupportsTranscodeChoice
{
  return -[PFMediaCapabilities supportsTranscodeChoice](self->_peerMediaCapabilities, "supportsTranscodeChoice");
}

- (BOOL)peerSupportsAdjustmentBaseResources
{
  return -[PFMediaCapabilities supportForAdjustmentBaseResources](self->_peerMediaCapabilities, "supportForAdjustmentBaseResources") == 1;
}

- (BOOL)penultimateIsPublic
{
  return self->_penultimateIsPublic;
}

- (id)conversionResultForPTPAsset:(id)a3 sourceHints:(id)a4 forceLegacyConversion:(BOOL)a5 assetTypeLabel:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  PFMediaCapabilities *v13;
  PFMediaCapabilities *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v7 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v7)
  {
    v13 = self->_legacyCapabilities;
  }
  else
  {
    -[PHPTPFormatConversionManager effectivePeerMediaCapabilites](self, "effectivePeerMediaCapabilites");
    v13 = (PFMediaCapabilities *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  +[PHPTPConversionHelper conversionResultForPTPAsset:sourceHints:withConversionManager:peerCapabilities:](PHPTPConversionHelper, "conversionResultForPTPAsset:sourceHints:withConversionManager:peerCapabilities:", v10, v11, self->_mediaFormatConversionManager, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PLPTPGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "resourceHandle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v18;
    v22 = 2114;
    v23 = v12;
    v24 = 2114;
    v25 = v15;
    _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEBUG, "Media conversion result for asset %{public}@ (%{public}@): %{public}@", (uint8_t *)&v20, 0x20u);

  }
  return v15;
}

- (id)effectivePeerMediaCapabilites
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[PHPTPFormatConversionManager peerSupportsTranscodeChoice](self, "peerSupportsTranscodeChoice");
  v4 = 24;
  if (v3)
    v4 = 8;
  return *(id *)((char *)&self->super.isa + v4);
}

- (void)setPenultimateIsPublic:(BOOL)a3
{
  self->_penultimateIsPublic = a3;
}

- (PFMediaCapabilities)peerMediaCapabilities
{
  return (PFMediaCapabilities *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPeerMediaCapabilities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (PHMediaFormatConversionManager)mediaFormatConversionManager
{
  return (PHMediaFormatConversionManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMediaFormatConversionManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSURL)temporaryDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTemporaryDirectoryURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)convertedLivePhotoPairingIdentifiersByOriginalIdentifiers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConvertedLivePhotoPairingIdentifiersByOriginalIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convertedLivePhotoPairingIdentifiersByOriginalIdentifiers, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_mediaFormatConversionManager, 0);
  objc_storeStrong((id *)&self->_peerMediaCapabilities, 0);
  objc_storeStrong((id *)&self->_legacyCapabilities, 0);
}

void __121__PHPTPFormatConversionManager_ptpAssetReaderForFormatConvertedPTPAsset_ofPhotosAsset_resourcePath_originalResourcePath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLPTPGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134218242;
    v9 = a2;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "Single pass video conversion update, status: %ld, error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

}

@end
