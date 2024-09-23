@implementation PHImportAssetBundleAsset

- (PHImportAssetBundleAsset)initWithAssetBundleAtURL:(id)a3 withImportSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  PHImportAssetBundleAsset *v13;
  void *v14;
  PHImportAsset *v15;
  void *v16;
  PHImportAsset *v17;
  void *v18;
  PHImportAsset *v19;
  void *v20;
  PHImportAsset *v21;
  void *v22;
  PHImportAsset *v23;
  void *v24;
  PHImportAsset *v25;
  PHImportAssetBundleAsset *v26;
  void *v27;
  PHImportAsset *v28;
  void *v29;
  PHImportAsset *v30;
  void *v31;
  PHImportAsset *v32;
  void *v33;
  PHImportAsset *v34;
  void *v35;
  PHImportAsset *v36;
  void *v37;
  PHImportAsset *v38;
  void *v39;
  PHImportAsset *v40;
  void *v41;
  PHImportAsset *v42;
  void *v43;
  PHImportAsset *v44;
  void *v45;
  PHImportAsset *v46;
  void *v47;
  PHImportAsset *v48;
  void *v49;
  PHImportAsset *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  PHImportAsset *v54;
  void *v55;
  PHImportAsset *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  PHImportAsset *v61;
  void *v62;
  void *v63;
  void *v64;
  PHImportAsset *v65;
  void *v66;
  PHImportAsset *v67;
  void *v68;
  PHImportAsset *v69;
  void *v70;
  PHImportAsset *v71;
  void *v72;
  PHImportAsset *v73;
  void *v74;
  PHImportAsset *v75;
  objc_super v77;
  uint8_t buf[4];
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D750B8]), "initWithAssetBundleAtURL:", v6);
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "mediaType") == 2)
    {
      objc_msgSend(v9, "videoURL");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = 16;
      goto LABEL_8;
    }
    if (objc_msgSend(v9, "mediaType") == 1)
    {
      objc_msgSend(v9, "photoURL");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = 2;
LABEL_8:
      v77.receiver = self;
      v77.super_class = (Class)PHImportAssetBundleAsset;
      v13 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](&v77, sel_initWithSource_url_type_supportedMediaType_uuid_, v7, v10, 0, v11, 0);
      if (!v13)
      {
LABEL_47:
        self = v13;
        v26 = self;
        goto LABEL_48;
      }
      if (objc_msgSend(v9, "mediaType") == 2)
      {
        objc_msgSend(v9, "fullSizeVideoURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = [PHImportAsset alloc];
          objc_msgSend(v9, "fullSizeVideoURL");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](v15, "initWithSource:url:type:supportedMediaType:uuid:", v7, v16, 0, 16, 0);

          -[PHImportAsset setLargeMovieRender:](v13, "setLargeMovieRender:", v17);
        }
        objc_msgSend(v9, "adjustmentBaseVideoURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = [PHImportAsset alloc];
          objc_msgSend(v9, "adjustmentBaseVideoURL");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](v19, "initWithSource:url:type:supportedMediaType:uuid:", v7, v20, 0, 16, 0);

          -[PHImportAsset setBase:](v13, "setBase:", v21);
        }
        objc_msgSend(v9, "spatialOvercaptureVideoURL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          goto LABEL_40;
        v23 = [PHImportAsset alloc];
        objc_msgSend(v9, "fullSizeVideoURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](v23, "initWithSource:url:type:supportedMediaType:uuid:", v7, v24, 0, 16, 0);

        -[PHImportAsset setSpatialOverCapture:](v13, "setSpatialOverCapture:", v25);
      }
      else
      {
        if (objc_msgSend(v9, "mediaType") != 1)
          goto LABEL_40;
        objc_msgSend(v9, "alternatePhotoURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v28 = [PHImportAsset alloc];
          objc_msgSend(v9, "alternatePhotoURL");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](v28, "initWithSource:url:type:supportedMediaType:uuid:", v7, v29, 0, 2, 0);

          -[PHImportAsset setRawAsset:](v13, "setRawAsset:", v30);
        }
        objc_msgSend(v9, "fullSizePhotoURL");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v32 = [PHImportAsset alloc];
          objc_msgSend(v9, "fullSizePhotoURL");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](v32, "initWithSource:url:type:supportedMediaType:uuid:", v7, v33, 0, 2, 0);

          -[PHImportAsset setLargeRender:](v13, "setLargeRender:", v34);
        }
        objc_msgSend(v9, "adjustmentBasePhotoURL");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          v36 = [PHImportAsset alloc];
          objc_msgSend(v9, "adjustmentBasePhotoURL");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](v36, "initWithSource:url:type:supportedMediaType:uuid:", v7, v37, 0, 2, 0);

          -[PHImportAsset setBase:](v13, "setBase:", v38);
        }
        objc_msgSend(v9, "spatialOvercapturePhotoURL");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          v40 = [PHImportAsset alloc];
          objc_msgSend(v9, "spatialOvercapturePhotoURL");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](v40, "initWithSource:url:type:supportedMediaType:uuid:", v7, v41, 0, 2, 0);

          objc_msgSend(v9, "spatialOvercapturePairedVideoURL");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
          {
            v44 = [PHImportAsset alloc];
            objc_msgSend(v9, "spatialOvercapturePairedVideoURL");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](v44, "initWithSource:url:type:supportedMediaType:uuid:", v7, v45, 0, 16, 0);

            -[PHImportAsset setVideoComplement:](v42, "setVideoComplement:", v46);
          }
          -[PHImportAsset setSpatialOverCapture:](v13, "setSpatialOverCapture:", v42);

        }
        objc_msgSend(v9, "pairedVideoURL");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          v48 = [PHImportAsset alloc];
          objc_msgSend(v9, "pairedVideoURL");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](v48, "initWithSource:url:type:supportedMediaType:uuid:", v7, v49, 0, 16, 0);

          -[PHImportAsset setVideoComplement:](v13, "setVideoComplement:", v50);
        }
        objc_msgSend(v9, "fullSizePairedVideoURL");
        v51 = objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          v52 = (void *)v51;
          -[PHImportAsset largeRender](v13, "largeRender");
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (v53)
          {
            v54 = [PHImportAsset alloc];
            objc_msgSend(v9, "fullSizePairedVideoURL");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](v54, "initWithSource:url:type:supportedMediaType:uuid:", v7, v55, 0, 16, 0);

            -[PHImportAsset largeRender](v13, "largeRender");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setVideoComplement:", v56);

          }
        }
        objc_msgSend(v9, "adjustmentBasePairedVideoURL");
        v58 = objc_claimAutoreleasedReturnValue();
        if (!v58)
          goto LABEL_40;
        v59 = (void *)v58;
        -[PHImportAsset base](v13, "base");
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v60)
          goto LABEL_40;
        v61 = [PHImportAsset alloc];
        objc_msgSend(v9, "adjustmentBasePairedVideoURL");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](v61, "initWithSource:url:type:supportedMediaType:uuid:", v7, v62, 0, 16, 0);

        -[PHImportAsset base](v13, "base");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setVideoComplement:", v25);

      }
LABEL_40:
      objc_msgSend(v9, "adjustmentDataURL");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        v65 = [PHImportAsset alloc];
        objc_msgSend(v9, "adjustmentDataURL");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](v65, "initWithSource:url:type:supportedMediaType:uuid:", v7, v66, 0, 64, 0);

        -[PHImportAsset addSidecarAsset:](v13, "addSidecarAsset:", v67);
      }
      objc_msgSend(v9, "originalAdjustmentDataURL");
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (v68)
      {
        v69 = [PHImportAsset alloc];
        objc_msgSend(v9, "originalAdjustmentDataURL");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](v69, "initWithSource:url:type:supportedMediaType:uuid:", v7, v70, 0, 64, 0);

        -[PHImportAsset addSidecarAsset:](v13, "addSidecarAsset:", v71);
      }
      objc_msgSend(v9, "adjustmentSecondaryDataURL");
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      if (v72)
      {
        v73 = [PHImportAsset alloc];
        objc_msgSend(v9, "adjustmentSecondaryDataURL");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](v73, "initWithSource:url:type:supportedMediaType:uuid:", v7, v74, 0, 64, 0);

        -[PHImportAsset addSidecarAsset:](v13, "addSidecarAsset:", v75);
      }
      -[PHImportAssetBundleAsset setAssetBundle:](v13, "setAssetBundle:", v9);
      goto LABEL_47;
    }
    PLImportGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v79 = objc_msgSend(v9, "mediaType");
      v12 = "Unsupported asset bundle media type: %ld.";
      goto LABEL_18;
    }
  }
  else
  {
    PLImportGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v79 = (uint64_t)v6;
      v12 = "Tried to parse asset bundle at URL: %@, but it was invalid.";
LABEL_18:
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
    }
  }
  v26 = 0;
LABEL_48:

  return v26;
}

- (id)creationDate
{
  void *v3;
  void *v4;
  objc_super v6;

  -[PHImportAssetBundleAsset assetBundle](self, "assetBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryCreationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)PHImportAssetBundleAsset;
    -[PHImportAsset creationDate](&v6, sel_creationDate);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)timeZone
{
  void *v3;
  void *v4;
  objc_super v6;

  -[PHImportAssetBundleAsset assetBundle](self, "assetBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryCreationDateTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)PHImportAssetBundleAsset;
    -[PHImportAsset timeZone](&v6, sel_timeZone);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)title
{
  void *v2;
  void *v3;

  -[PHImportAssetBundleAsset assetBundle](self, "assetBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)keywordTitles
{
  void *v2;
  void *v3;

  -[PHImportAssetBundleAsset assetBundle](self, "assetBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keywordTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)assetDescription
{
  void *v2;
  void *v3;

  -[PHImportAssetBundleAsset assetBundle](self, "assetBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityDescription
{
  void *v2;
  void *v3;

  -[PHImportAssetBundleAsset assetBundle](self, "assetBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PFAssetBundle)assetBundle
{
  return self->_assetBundle;
}

- (void)setAssetBundle:(id)a3
{
  objc_storeStrong((id *)&self->_assetBundle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetBundle, 0);
}

@end
