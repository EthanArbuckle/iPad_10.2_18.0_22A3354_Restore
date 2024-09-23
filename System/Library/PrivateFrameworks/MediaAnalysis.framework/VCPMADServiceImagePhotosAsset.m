@implementation VCPMADServiceImagePhotosAsset

- (VCPMADServiceImagePhotosAsset)initWithPhotosAsset:(id)a3 clientBundleID:(id)a4 clientTeamID:(id)a5
{
  id v9;
  VCPMADServiceImagePhotosAsset *v10;
  VCPMADServiceImagePhotosAsset *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VCPMADServiceImagePhotosAsset;
  v10 = -[VCPMADServiceImageAsset initWithClientBundleID:clientTeamID:](&v13, sel_initWithClientBundleID_clientTeamID_, a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_asset, a3);

  return v11;
}

- (VCPMADServiceImagePhotosAsset)initWithPhotosAsset:(id)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 clientBundleID:(id)a6 clientTeamID:(id)a7
{
  id v13;
  VCPMADServiceImagePhotosAsset *v14;
  VCPMADServiceImagePhotosAsset *v15;
  CFTypeRef v16;
  const void *v18;
  objc_super v19;

  v13 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VCPMADServiceImagePhotosAsset;
  v14 = -[VCPMADServiceImageAsset initWithClientBundleID:clientTeamID:](&v19, sel_initWithClientBundleID_clientTeamID_, a6, a7);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_asset, a3);
    if (a4)
      v16 = CFRetain(a4);
    else
      v16 = 0;
    v18 = v16;
    CF<__CVBuffer *>::operator=((const void **)&v15->_pixelBuffer.value_, &v18);
    CF<opaqueCMSampleBuffer *>::~CF(&v18);
    v15->_orientation = a5;
  }

  return v15;
}

- (unint64_t)assetType
{
  return 4;
}

- (id)identifier
{
  return (id)-[PHAsset localIdentifier](self->_asset, "localIdentifier");
}

- (id)location
{
  return -[PHAsset location](self->_asset, "location");
}

- (BOOL)isScreenshot
{
  return (-[PHAsset mediaSubtypes](self->_asset, "mediaSubtypes") >> 2) & 1;
}

- (id)faces
{
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
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[PHAsset faceAnalysisVersion](self->_asset, "faceAnalysisVersion")
    || (-[PHAsset localIdentifier](self->_asset, "localIdentifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    if (-[PHAsset vcp_needsFaceProcessing](self->_asset, "vcp_needsFaceProcessing"))
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        -[PHAsset localIdentifier](self->_asset, "localIdentifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v3;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[Faces][%@] Asset not processed or outdated", buf, 0xCu);

      }
      return 0;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[Faces][%@] Re-fetching asset ...", buf, 0xCu);

    }
    v6 = (void *)MEMORY[0x1E0CD1398];
    -[PHAsset photoLibrary](self->_asset, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vcp_fetchOptionsForLibrary:forTaskID:", v7, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CD1398];
    -[PHAsset localIdentifier](self->_asset, "localIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchAssetsWithLocalIdentifiers:options:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[PHAsset localIdentifier](self->_asset, "localIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v15;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Faces][%@] Failed to fetch asset to check faceAnalysisVersion", buf, 0xCu);

      }
      goto LABEL_18;
    }
    if (objc_msgSend(v13, "vcp_needsFaceProcessing"))
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        -[PHAsset localIdentifier](self->_asset, "localIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v14;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[Faces][%@] Asset (re-fetched) not processed or outdated", buf, 0xCu);

      }
LABEL_18:

      return 0;
    }

  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[PHAsset localIdentifier](self->_asset, "localIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v17;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[Faces][%@] Loading existing results from Photos", buf, 0xCu);

  }
  -[PHAsset photoLibrary](self->_asset, "photoLibrary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "librarySpecificFetchOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInAsset:options:", self->_asset, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fetchedObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)nsfwClassifications
{
  _BOOL4 v3;
  int v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[PHAsset vcp_needSceneProcessing](self->_asset, "vcp_needSceneProcessing");
  v4 = MediaAnalysisLogLevel();
  if (v3)
  {
    if (v4 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[NSFW][%@] Asset not processed or outdated", buf, 0xCu);

    }
    return 0;
  }
  else
  {
    if (v4 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[NSFW][%@] Loading existing results from Photos", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PHAsset sceneClassifications](self->_asset, "sceneClassifications", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v13, "extendedSceneIdentifier") > 0x7FFFF8F5
            && (unint64_t)objc_msgSend(v13, "extendedSceneIdentifier") < 0x7FFFF900)
          {
            objc_msgSend(v8, "addObject:", v13);
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

    return v8;
  }
}

- (id)scenenetClassifications
{
  _BOOL4 v3;
  int v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = -[PHAsset vcp_needSceneProcessing](self->_asset, "vcp_needSceneProcessing");
  v4 = MediaAnalysisLogLevel();
  if (v3)
  {
    if (v4 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = (uint64_t)v5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[SceneNet][%@] Asset not processed or outdated", buf, 0xCu);

    }
    return 0;
  }
  else
  {
    if (v4 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = (uint64_t)v7;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[SceneNet][%@] Loading existing results from Photos", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[PHAsset sceneClassifications](self->_asset, "sceneClassifications");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v12 = *(_QWORD *)v22;
      *(_QWORD *)&v11 = 134217984;
      v20 = v11;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0D75258], "vcp_sharedTaxonomy", v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "nodeForExtendedSceneClassId:", objc_msgSend(v14, "extendedSceneIdentifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16
            || (objc_msgSend(v16, "name"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v18 = v17 == 0,
                v17,
                v18))
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v19 = objc_msgSend(v14, "extendedSceneIdentifier");
              *(_DWORD *)buf = v20;
              v27 = v19;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[SceneNet] No scene label name for scene id %llu", buf, 0xCu);
            }
          }
          else
          {
            objc_msgSend(v8, "addObject:", v14);
          }

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    return v8;
  }
}

- (id)resources
{
  NSArray *resources;
  NSArray *v4;
  NSArray *v5;

  resources = self->_resources;
  if (!resources)
  {
    objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allAcceptableResourcesForAsset:", self->_asset);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_resources;
    self->_resources = v4;

    resources = self->_resources;
  }
  return resources;
}

- (CGSize)resolution
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = (double)-[PHAsset pixelWidth](self->_asset, "pixelWidth");
  v4 = (double)-[PHAsset pixelHeight](self->_asset, "pixelHeight");
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (BOOL)isHighResDecoded
{
  return self->_highResPixelBuffer.value_ != 0;
}

- (id)isSensitive
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[VCPMADServiceImagePhotosAsset nsfwClassifications](self, "nsfwClassifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v9, "extendedSceneIdentifier", (_QWORD)v19) == 2147481854)
          {
            if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              -[PHAsset localIdentifier](self->_asset, "localIdentifier");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "confidence");
              *(_DWORD *)buf = 138412546;
              v24 = v12;
              v25 = 2048;
              v26 = v13;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] Ineligible Confidence: %0.3f", buf, 0x16u);

            }
            v14 = (void *)MEMORY[0x1E0CB37E8];
            v15 = (void *)MEMORY[0x1E0D8C998];
            VCPSpecialLabelFromExtendedSceneClassificationID(objc_msgSend(v9, "extendedSceneIdentifier"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "confidence");
            objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "isImageSensitiveForLabel:confidenceScore:classificationMode:", v16, 2));
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_22;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v6)
          continue;
        break;
      }
    }

    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] Ineligible Confidence: 0.0", buf, 0xCu);

    }
    v11 = (void *)MEMORY[0x1E0C9AAA0];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v17;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] Ineligible Confidence: Unknown", buf, 0xCu);

    }
    v11 = 0;
  }
LABEL_22:

  return v11;
}

- (id)animatedStickerScore
{
  return -[PHAsset vcp_animatedStickerScore](self->_asset, "vcp_animatedStickerScore");
}

- (int)loadPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4
{
  CF<__CVBuffer *> *p_pixelBuffer;
  __CVBuffer *value;
  __CVBuffer *v7;
  int result;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  int Width;
  int Height;
  unsigned int orientation;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  os_signpost_id_t spid;
  uint64_t v54;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id obj;
  uint64_t v61;
  uint64_t v62;
  const void **p_value;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE buf[12];
  __int16 v70;
  _BYTE v71[10];
  _BYTE v72[6];
  _BYTE v73[6];
  int v74;
  __int16 v75;
  int v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  p_pixelBuffer = &self->_pixelBuffer;
  value = self->_pixelBuffer.value_;
  if (value)
    goto LABEL_2;
  p_value = (const void **)&p_pixelBuffer->value_;
  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v9);

  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    -[VCPMADServiceImageAsset signpostPayload](self, "signpostPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v12;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADServiceImageAsset_Decode", "%@", buf, 0xCu);

  }
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[PHAsset localIdentifier](self->_asset, "localIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAsset vcp_typeDescription](self->_asset, "vcp_typeDescription");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = -[PHAsset mediaType](self->_asset, "mediaType");
    v16 = -[PHAsset mediaSubtypes](self->_asset, "mediaSubtypes");
    v17 = -[PHAsset pixelWidth](self->_asset, "pixelWidth");
    v18 = -[PHAsset pixelHeight](self->_asset, "pixelHeight");
    *(_DWORD *)buf = 138413570;
    *(_QWORD *)&buf[4] = v13;
    v70 = 2112;
    *(_QWORD *)v71 = v14;
    *(_WORD *)&v71[8] = 1024;
    *(_DWORD *)v72 = v15;
    *(_WORD *)&v72[4] = 1024;
    *(_DWORD *)v73 = v16;
    *(_WORD *)&v73[4] = 1024;
    v74 = v17;
    v75 = 1024;
    v76 = v18;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Selecting resource for Asset Type: %@ [%d/%d] Resolution: %dx%d", buf, 0x2Eu);

  }
  -[VCPMADServiceImagePhotosAsset resources](self, "resources", spid - 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "vcp_highResImageResourcesForAsset:", self->_asset);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v20;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  if (!v21)
    goto LABEL_56;
  v61 = *(_QWORD *)v65;
  v59 = *MEMORY[0x1E0CEC530];
  v58 = *MEMORY[0x1E0CEC508];
  v57 = *MEMORY[0x1E0CEC510];
  v54 = *MEMORY[0x1E0CEC580];
  while (2)
  {
    v62 = v21;
    for (i = 0; i != v62; ++i)
    {
      if (*(_QWORD *)v65 != v61)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[PHAsset localIdentifier](self->_asset, "localIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "type");
        v26 = objc_msgSend(v23, "pixelWidth");
        v27 = objc_msgSend(v23, "pixelHeight");
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v24;
        v70 = 1024;
        *(_DWORD *)v71 = v25;
        *(_WORD *)&v71[4] = 1024;
        *(_DWORD *)&v71[6] = v26;
        *(_WORD *)v72 = 1024;
        *(_DWORD *)&v72[2] = v27;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Evaluating resource (Type: %d Resolution: %dx%d)", buf, 0x1Eu);

      }
      if ((objc_msgSend(v23, "vcp_isLocallyAvailable") & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          -[PHAsset localIdentifier](self->_asset, "localIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v37;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Resource not locally available; skipping resource",
            buf,
            0xCu);

        }
        continue;
      }
      objc_msgSend(v23, "vcp_uniformTypeIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "conformsToType:", v59) & 1) == 0
        && (objc_msgSend(v28, "conformsToType:", v58) & 1) == 0
        && (objc_msgSend(v28, "conformsToType:", v57) & 1) == 0
        && (objc_msgSend(v28, "conformsToType:", v54) & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          -[PHAsset localIdentifier](self->_asset, "localIdentifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "identifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v41;
          v70 = 2112;
          *(_QWORD *)v71 = v42;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Purging resource cache to load uncommon resource (%@)", buf, 0x16u);

        }
        goto LABEL_27;
      }
      v29 = objc_msgSend(v23, "pixelWidth");
      if ((unint64_t)(objc_msgSend(v23, "pixelHeight") * v29) >= 0xCCA6CD)
      {
        if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          -[PHAsset localIdentifier](self->_asset, "localIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v23, "pixelWidth");
          v32 = objc_msgSend(v23, "pixelHeight");
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v30;
          v70 = 1024;
          *(_DWORD *)v71 = v31;
          *(_WORD *)&v71[4] = 1024;
          *(_DWORD *)&v71[6] = v32;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Purging resource cache to load large resource (%dx%d)", buf, 0x18u);

        }
LABEL_27:
        +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "purgeInactiveResources");

      }
      v34 = -[PHAsset vcp_ocrMajorDimensionForResource:](self->_asset, "vcp_ocrMajorDimensionForResource:", v23);
      +[VCPImageManager sharedImageManager](VCPImageManager, "sharedImageManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "privateFileURL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
        *(_QWORD *)buf = objc_msgSend(v35, "pixelBufferWithFormat:andMaxDimension:fromImageURL:orientation:", 875704422, v34, v36, &self->_orientation);
      else
        *(_QWORD *)buf = objc_msgSend(v35, "pixelBufferWithFormat:fromImageURL:flushCache:orientation:", 875704422, v36, 1, &self->_orientation);
      CF<__CVBuffer *>::operator=(p_value, (const void **)buf);
      CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);

      if (!self->_orientation)
      {
        if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          -[PHAsset localIdentifier](self->_asset, "localIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v38;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Failed to load orientation", buf, 0xCu);

        }
        self->_orientation = 1;
      }
      if (*p_value)
      {
        if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          -[PHAsset localIdentifier](self->_asset, "localIdentifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v23, "type");
          Width = CVPixelBufferGetWidth((CVPixelBufferRef)*p_value);
          Height = CVPixelBufferGetHeight((CVPixelBufferRef)*p_value);
          orientation = self->_orientation;
          *(_DWORD *)buf = 138413314;
          *(_QWORD *)&buf[4] = v43;
          v70 = 1024;
          *(_DWORD *)v71 = v44;
          *(_WORD *)&v71[4] = 1024;
          *(_DWORD *)&v71[6] = Width;
          *(_WORD *)v72 = 1024;
          *(_DWORD *)&v72[2] = Height;
          *(_WORD *)v73 = 1024;
          *(_DWORD *)&v73[2] = orientation;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Loaded resource (Type: %d Actual Resolution: %dx%d, orientation %d)", buf, 0x24u);

        }
        goto LABEL_56;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[PHAsset localIdentifier](self->_asset, "localIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v23, "type");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v39;
        v70 = 1024;
        *(_DWORD *)v71 = v40;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to load resource (Type: %d)", buf, 0x12u);

      }
    }
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    if (v21)
      continue;
    break;
  }
LABEL_56:

  VCPSignPostLog();
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (v52 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
  {
    -[VCPMADServiceImageAsset signpostPayload](self, "signpostPayload");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v50;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v49, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADServiceImageAsset_Decode", "%@", buf, 0xCu);

  }
  if (!*p_value)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v51;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to find/decode high-res image resource", buf, 0xCu);

    }
    return -18;
  }

  value = (__CVBuffer *)*p_value;
  if (*p_value)
  {
LABEL_2:
    v7 = (__CVBuffer *)CFRetain(value);
    goto LABEL_3;
  }
  v7 = 0;
LABEL_3:
  result = 0;
  *a3 = v7;
  *a4 = self->_orientation;
  return result;
}

- (int)loadLowResPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4
{
  CF<__CVBuffer *> *p_lowResPixelBuffer;
  __CVBuffer *value;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  int v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  unsigned int *p_lowResOrientation;
  void *v27;
  void *v28;
  int v29;
  int Width;
  int Height;
  unsigned int v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  __CVBuffer *v39;
  int result;
  void *v41;
  void *v42;
  os_signpost_id_t spid;
  _BYTE buf[12];
  __int16 v45;
  _BYTE v46[10];
  _BYTE v47[6];
  _BYTE v48[6];
  int v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  p_lowResPixelBuffer = &self->_lowResPixelBuffer;
  value = self->_lowResPixelBuffer.value_;
  if (value)
    goto LABEL_33;
  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v9);

  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    -[VCPMADServiceImageAsset signpostPayload](self, "signpostPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v12;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADServiceImageAsset_Decode", "%@", buf, 0xCu);

  }
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[PHAsset localIdentifier](self->_asset, "localIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAsset vcp_typeDescription](self->_asset, "vcp_typeDescription");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = -[PHAsset mediaType](self->_asset, "mediaType");
    v15 = -[PHAsset mediaSubtypes](self->_asset, "mediaSubtypes");
    v16 = -[PHAsset pixelWidth](self->_asset, "pixelWidth");
    v17 = -[PHAsset pixelHeight](self->_asset, "pixelHeight");
    *(_DWORD *)buf = 138413570;
    *(_QWORD *)&buf[4] = v42;
    v45 = 2112;
    *(_QWORD *)v46 = v13;
    *(_WORD *)&v46[8] = 1024;
    *(_DWORD *)v47 = v14;
    *(_WORD *)&v47[4] = 1024;
    *(_DWORD *)v48 = v15;
    *(_WORD *)&v48[4] = 1024;
    v49 = v16;
    v50 = 1024;
    v51 = v17;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Selecting resource for Asset Type: %@ [%d/%d] Resolution: %dx%d", buf, 0x2Eu);

  }
  -[VCPMADServiceImagePhotosAsset resources](self, "resources");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "vcp_thumbnailResource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "vcp_isLocallyAvailable"))
  {
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "type");
      v22 = objc_msgSend(v19, "pixelWidth");
      v23 = objc_msgSend(v19, "pixelHeight");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v20;
      v45 = 1024;
      *(_DWORD *)v46 = v21;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v22;
      *(_WORD *)v47 = 1024;
      *(_DWORD *)&v47[2] = v23;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Evaluating resource (Type: %d Resolution: %dx%d)", buf, 0x1Eu);

    }
    +[VCPImageManager sharedImageManager](VCPImageManager, "sharedImageManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "privateFileURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    p_lowResOrientation = &self->_lowResOrientation;
    *(_QWORD *)buf = objc_msgSend(v24, "pixelBufferWithFormat:fromImageURL:flushCache:orientation:", 875704422, v25, 1, &self->_lowResOrientation);
    CF<__CVBuffer *>::operator=((const void **)&p_lowResPixelBuffer->value_, (const void **)buf);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);

    if (!self->_lowResOrientation)
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[PHAsset localIdentifier](self->_asset, "localIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v27;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Failed to load orientation", buf, 0xCu);

      }
      *p_lowResOrientation = 1;
    }
    if (p_lowResPixelBuffer->value_)
    {
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[PHAsset localIdentifier](self->_asset, "localIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v19, "type");
        Width = CVPixelBufferGetWidth(p_lowResPixelBuffer->value_);
        Height = CVPixelBufferGetHeight(p_lowResPixelBuffer->value_);
        v32 = *p_lowResOrientation;
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v28;
        v45 = 1024;
        *(_DWORD *)v46 = v29;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = Width;
        *(_WORD *)v47 = 1024;
        *(_DWORD *)&v47[2] = Height;
        *(_WORD *)v48 = 1024;
        *(_DWORD *)&v48[2] = v32;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Loaded resource (Type: %d Actual Resolution: %dx%d, orientation %d)", buf, 0x24u);

      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v19, "type");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v34;
      v45 = 1024;
      *(_DWORD *)v46 = v35;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to load resource (Type: %d)", buf, 0x12u);

    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[PHAsset localIdentifier](self->_asset, "localIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v33;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Resource not locally available; skipping resource",
      buf,
      0xCu);

  }
  VCPSignPostLog();
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    -[VCPMADServiceImageAsset signpostPayload](self, "signpostPayload");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v38;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v37, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADServiceImageAsset_Decode", "%@", buf, 0xCu);

  }
  if (p_lowResPixelBuffer->value_
    || (-[VCPMADServiceImagePhotosAsset loadPixelBuffer:orientation:](self, "loadPixelBuffer:orientation:", p_lowResPixelBuffer, &self->_lowResOrientation), p_lowResPixelBuffer->value_))
  {

    value = p_lowResPixelBuffer->value_;
    if (!p_lowResPixelBuffer->value_)
    {
      v39 = 0;
      goto LABEL_34;
    }
LABEL_33:
    v39 = (__CVBuffer *)CFRetain(value);
LABEL_34:
    result = 0;
    *a3 = v39;
    *a4 = self->_lowResOrientation;
    return result;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[PHAsset localIdentifier](self->_asset, "localIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v41;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to find/decode thumbnail resource", buf, 0xCu);

  }
  return -18;
}

- (int)loadHighResPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4
{
  CF<__CVBuffer *> *p_highResPixelBuffer;
  __CVBuffer *value;
  __CVBuffer *v6;
  int result;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  int v37;
  int Width;
  int Height;
  unsigned int highResOrientation;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t i;
  void *v45;
  void *v46;
  int v47;
  int v48;
  int v49;
  void *v50;
  void *v51;
  unsigned int *p_highResOrientation;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  int v58;
  int v59;
  int v60;
  unsigned int v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  os_signpost_id_t spid;
  void *v70;
  id obj;
  id type;
  const void **p_value;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE buf[12];
  __int16 v86;
  _BYTE v87[10];
  _BYTE v88[6];
  _BYTE v89[6];
  int v90;
  __int16 v91;
  int v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  p_highResPixelBuffer = &self->_highResPixelBuffer;
  value = self->_highResPixelBuffer.value_;
  if (value)
    goto LABEL_2;
  p_value = (const void **)&p_highResPixelBuffer->value_;
  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v8);

  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    -[VCPMADServiceImageAsset signpostPayload](self, "signpostPayload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v11;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADServiceImageAsset_Decode", "%@", buf, 0xCu);

  }
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[PHAsset localIdentifier](self->_asset, "localIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAsset vcp_typeDescription](self->_asset, "vcp_typeDescription");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = -[PHAsset mediaType](self->_asset, "mediaType");
    v15 = -[PHAsset mediaSubtypes](self->_asset, "mediaSubtypes");
    v16 = -[PHAsset pixelWidth](self->_asset, "pixelWidth");
    v17 = -[PHAsset pixelHeight](self->_asset, "pixelHeight");
    *(_DWORD *)buf = 138413570;
    *(_QWORD *)&buf[4] = v12;
    v86 = 2112;
    *(_QWORD *)v87 = v13;
    *(_WORD *)&v87[8] = 1024;
    *(_DWORD *)v88 = v14;
    *(_WORD *)&v88[4] = 1024;
    *(_DWORD *)v89 = v15;
    *(_WORD *)&v89[4] = 1024;
    v90 = v16;
    v91 = 1024;
    v92 = v17;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Selecting resource for Asset Type: %@ [%d/%d] Resolution: %dx%d", buf, 0x2Eu);

  }
  -[VCPMADServiceImagePhotosAsset resources](self, "resources");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "vcp_highResImageResourcesForAsset:", self->_asset);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v66;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v80;
    while (2)
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v80 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v21);
        v23 = objc_msgSend(v22, "pixelWidth");
        if (objc_msgSend(v22, "pixelHeight") * v23 > 10973491)
        {
          if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            -[PHAsset localIdentifier](self->_asset, "localIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v22, "type");
            v26 = objc_msgSend(v22, "pixelWidth");
            v27 = objc_msgSend(v22, "pixelHeight");
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v24;
            v86 = 1024;
            *(_DWORD *)v87 = v25;
            *(_WORD *)&v87[4] = 1024;
            *(_DWORD *)&v87[6] = v26;
            *(_WORD *)v88 = 1024;
            *(_DWORD *)&v88[2] = v27;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Evaluating high-resolution resource (Type: %d Resolution: %dx%d)", buf, 0x1Eu);

          }
          if ((objc_msgSend(v22, "vcp_isLocallyAvailable") & 1) != 0)
          {
            v28 = -[PHAsset vcp_majorDimensionForResource:withTargetResolution:](self->_asset, "vcp_majorDimensionForResource:withTargetResolution:", v22, 12192768);
            +[VCPImageManager sharedImageManager](VCPImageManager, "sharedImageManager");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "privateFileURL");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
              *(_QWORD *)buf = objc_msgSend(v29, "pixelBufferWithFormat:andMaxDimension:fromImageURL:orientation:", 875704422, v28, v30, &self->_highResOrientation);
            else
              *(_QWORD *)buf = objc_msgSend(v29, "pixelBufferWithFormat:fromImageURL:flushCache:orientation:", 875704422, v30, 1, &self->_highResOrientation);
            CF<__CVBuffer *>::operator=(p_value, (const void **)buf);
            CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);

            if (!self->_highResOrientation)
            {
              if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                -[PHAsset localIdentifier](self->_asset, "localIdentifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v32;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Failed to load orientation", buf, 0xCu);

              }
              self->_highResOrientation = 1;
            }
            if (*p_value)
            {
              if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                -[PHAsset localIdentifier](self->_asset, "localIdentifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v22, "type");
                Width = CVPixelBufferGetWidth((CVPixelBufferRef)*p_value);
                Height = CVPixelBufferGetHeight((CVPixelBufferRef)*p_value);
                highResOrientation = self->_highResOrientation;
                *(_DWORD *)buf = 138413314;
                *(_QWORD *)&buf[4] = v36;
                v86 = 1024;
                *(_DWORD *)v87 = v37;
                *(_WORD *)&v87[4] = 1024;
                *(_DWORD *)&v87[6] = Width;
                *(_WORD *)v88 = 1024;
                *(_DWORD *)&v88[2] = Height;
                *(_WORD *)v89 = 1024;
                *(_DWORD *)&v89[2] = highResOrientation;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Loaded resource (Type: %d Actual Resolution: %dx%d, orientation %d)", buf, 0x24u);

              }
              goto LABEL_43;
            }
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              -[PHAsset localIdentifier](self->_asset, "localIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v22, "type");
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v33;
              v86 = 1024;
              *(_DWORD *)v87 = v34;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to load resource (Type: %d)", buf, 0x12u);

            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            -[PHAsset localIdentifier](self->_asset, "localIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v31;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Resource not locally available; skipping resource",
              buf,
              0xCu);

          }
        }
        else
        {
          objc_msgSend(v70, "insertObject:atIndex:", v22, 0);
        }
        ++v21;
      }
      while (v19 != v21);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
      v19 = v35;
      if (v35)
        continue;
      break;
    }
  }
LABEL_43:

  if (!*p_value)
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    type = v70;
    v41 = objc_msgSend(type, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v76;
      v43 = MEMORY[0x1E0C81028];
      while (2)
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v76 != v42)
            objc_enumerationMutation(type);
          v45 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
          if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            -[PHAsset localIdentifier](self->_asset, "localIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v45, "type");
            v48 = objc_msgSend(v45, "pixelWidth");
            v49 = objc_msgSend(v45, "pixelHeight");
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v46;
            v86 = 1024;
            *(_DWORD *)v87 = v47;
            *(_WORD *)&v87[4] = 1024;
            *(_DWORD *)&v87[6] = v48;
            *(_WORD *)v88 = 1024;
            *(_DWORD *)&v88[2] = v49;
            _os_log_impl(&dword_1B6C4A000, v43, OS_LOG_TYPE_DEFAULT, "[%@] Evaluating fall-back resource (Type: %d Resolution: %dx%d)", buf, 0x1Eu);

          }
          if ((objc_msgSend(v45, "vcp_isLocallyAvailable") & 1) != 0)
          {
            +[VCPImageManager sharedImageManager](VCPImageManager, "sharedImageManager");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "privateFileURL");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            p_highResOrientation = &self->_highResOrientation;
            *(_QWORD *)buf = objc_msgSend(v50, "pixelBufferWithFormat:fromImageURL:flushCache:orientation:", 875704422, v51, 1, &self->_highResOrientation);
            CF<__CVBuffer *>::operator=(p_value, (const void **)buf);
            CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);

            if (!self->_highResOrientation)
            {
              if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                -[PHAsset localIdentifier](self->_asset, "localIdentifier");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v53;
                _os_log_impl(&dword_1B6C4A000, v43, OS_LOG_TYPE_DEFAULT, "[%@] Failed to load orientation", buf, 0xCu);

              }
              *p_highResOrientation = 1;
            }
            if (*p_value)
            {
              if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                -[PHAsset localIdentifier](self->_asset, "localIdentifier");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = objc_msgSend(v45, "type");
                v59 = CVPixelBufferGetWidth((CVPixelBufferRef)*p_value);
                v60 = CVPixelBufferGetHeight((CVPixelBufferRef)*p_value);
                v61 = *p_highResOrientation;
                *(_DWORD *)buf = 138413314;
                *(_QWORD *)&buf[4] = v57;
                v86 = 1024;
                *(_DWORD *)v87 = v58;
                *(_WORD *)&v87[4] = 1024;
                *(_DWORD *)&v87[6] = v59;
                *(_WORD *)v88 = 1024;
                *(_DWORD *)&v88[2] = v60;
                *(_WORD *)v89 = 1024;
                *(_DWORD *)&v89[2] = v61;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Loaded resource (Type: %d Actual Resolution: %dx%d, orientation %d)", buf, 0x24u);

              }
              goto LABEL_71;
            }
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              -[PHAsset localIdentifier](self->_asset, "localIdentifier");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v45, "type");
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v54;
              v86 = 1024;
              *(_DWORD *)v87 = v55;
              _os_log_impl(&dword_1B6C4A000, v43, OS_LOG_TYPE_ERROR, "[%@] Failed to load resource (Type: %d)", buf, 0x12u);

            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            -[PHAsset localIdentifier](self->_asset, "localIdentifier");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v56;
            _os_log_impl(&dword_1B6C4A000, v43, OS_LOG_TYPE_DEFAULT, "[%@] Resource not locally available; skipping resource",
              buf,
              0xCu);

          }
        }
        v41 = objc_msgSend(type, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
        if (v41)
          continue;
        break;
      }
    }
LABEL_71:

  }
  VCPSignPostLog();
  v62 = objc_claimAutoreleasedReturnValue();
  v63 = v62;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
  {
    -[VCPMADServiceImageAsset signpostPayload](self, "signpostPayload");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v64;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v63, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADServiceImageAsset_Decode", "%@", buf, 0xCu);

  }
  if (*p_value)
  {

    value = (__CVBuffer *)*p_value;
    if (!*p_value)
    {
      v6 = 0;
      goto LABEL_3;
    }
LABEL_2:
    v6 = (__CVBuffer *)CFRetain(value);
LABEL_3:
    result = 0;
    *a3 = v6;
    *a4 = self->_highResOrientation;
    return result;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[PHAsset localIdentifier](self->_asset, "localIdentifier");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v65;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to find/decode high-res image resource", buf, 0xCu);

  }
  return -18;
}

- (void)persistOCRMRC
{
  *(_DWORD *)buf = 138412802;
  *(_QWORD *)(buf + 4) = a4;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((_QWORD *)buf + 3) = a2;
  _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "[%@][%@] Asset has invalid adjustment version (%@); cannot persist results to Photos",
    buf,
    0x20u);

}

void __46__VCPMADServiceImagePhotosAsset_persistOCRMRC__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CD13A8], "changeRequestForAsset:", *(_QWORD *)(a1[4] + 96));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v2 = a1[6];
  objc_msgSend(*(id *)(a1[4] + 96), "adjustmentVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCharacterRecognitionData:machineReadableCodeData:algorithmVersion:adjustmentVersion:", v3, v2, 8, v4);

  if (objc_msgSend(*(id *)(a1[4] + 96), "mad_isEligibleForComputeSync"))
    objc_msgSend(v5, "setAssetAnalysisStage:", objc_msgSend(*(id *)(a1[4] + 96), "mad_analysisStageAfterCompletingAnalysis:", 10));

}

void __46__VCPMADServiceImagePhotosAsset_persistOCRMRC__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "localIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@][%@] Successfully persisted results to Photos", (uint8_t *)&v10, 0x16u);

    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@][%@] Failed to persist results to Photos", (uint8_t *)&v10, 0x16u);

  }
}

- (id)documentObservations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSArray *v16;
  NSArray *v17;
  void *v18;
  void *v19;
  NSArray *documentObservations;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_documentObservations)
    goto LABEL_31;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[PHAsset localIdentifier](self->_asset, "localIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[OCR][%@] Checking for existing results from Photos", buf, 0xCu);

  }
  -[PHAsset characterRecognitionProperties](self->_asset, "characterRecognitionProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "algorithmVersion") != 8)
    goto LABEL_32;
  objc_msgSend(v4, "adjustmentVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAsset adjustmentVersion](self->_asset, "adjustmentVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToDate:", v6);

  if (v7)
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[OCR][%@] Loading existing results from Photos", buf, 0xCu);

    }
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (v10)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        -[PHAsset localIdentifier](self->_asset, "localIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v19;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[OCR][%@] Photos results exist, but no text was recognized", buf, 0xCu);

      }
      documentObservations = self->_documentObservations;
      self->_documentObservations = (NSArray *)MEMORY[0x1E0C9AA60];

    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB3710];
      v12 = objc_opt_class();
      objc_msgSend(v4, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      objc_msgSend(v11, "unarchivedObjectOfClass:fromData:error:", v12, v13, &v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v24;

      if (v14)
      {
        v25 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
        v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v17 = self->_documentObservations;
        self->_documentObservations = v16;

      }
      else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[PHAsset localIdentifier](self->_asset, "localIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v21;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[OCR][%@] Failed to unarchive existing Photos results", buf, 0xCu);

      }
    }
  }
  else
  {
LABEL_32:
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v18;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[OCR][%@] Asset does not have existing results", buf, 0xCu);

    }
  }

  if (self->_documentObservations)
  {
LABEL_31:
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v22;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[OCR][%@] Successfully reused existing results", buf, 0xCu);

    }
  }
  return self->_documentObservations;
}

- (void)setDocumentObservations:(id)a3
{
  void *v4;
  NSArray *v5;
  NSArray *documentObservations;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (NSArray *)objc_msgSend(v7, "copy");
    documentObservations = self->_documentObservations;
    self->_documentObservations = v5;

    -[VCPMADServiceImagePhotosAsset persistOCRMRC](self, "persistOCRMRC");
  }

}

- (id)barcodeObservations
{
  id *p_barcodeObservations;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v25;
  _QWORD v26[2];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  p_barcodeObservations = (id *)&self->_barcodeObservations;
  if (self->_barcodeObservations)
    goto LABEL_31;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[PHAsset localIdentifier](self->_asset, "localIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MRC][%@] Checking for existing results from Photos", buf, 0xCu);

  }
  -[PHAsset characterRecognitionProperties](self->_asset, "characterRecognitionProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "algorithmVersion") != 8)
    goto LABEL_32;
  objc_msgSend(v5, "adjustmentVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAsset adjustmentVersion](self->_asset, "adjustmentVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToDate:", v7);

  if (v8)
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MRC][%@] Loading existing results from Photos", buf, 0xCu);

    }
    objc_msgSend(v5, "machineReadableCodeData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    if (v11)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        -[PHAsset localIdentifier](self->_asset, "localIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v20;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MRC][%@] Photos results exist, but no text was recognized", buf, 0xCu);

      }
      v21 = *p_barcodeObservations;
      *p_barcodeObservations = (id)MEMORY[0x1E0C9AA60];

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C99E60];
      v26[0] = objc_opt_class();
      v26[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0CB3710];
      objc_msgSend(v5, "machineReadableCodeData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      objc_msgSend(v15, "unarchivedObjectOfClasses:fromData:error:", v14, v16, &v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v25;

      if (v17)
      {
        objc_storeStrong(p_barcodeObservations, v17);
      }
      else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[PHAsset localIdentifier](self->_asset, "localIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v22;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MRC][%@] Failed to unarchive existing Photos results", buf, 0xCu);

      }
    }
  }
  else
  {
LABEL_32:
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v19;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MRC][%@] Asset does not have existing results", buf, 0xCu);

    }
  }

  if (*p_barcodeObservations)
  {
LABEL_31:
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v23;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MRC][%@] Successfully reused existing results", buf, 0xCu);

    }
  }
  return *p_barcodeObservations;
}

- (void)setBarcodeObservations:(id)a3
{
  NSArray *v4;
  NSArray *barcodeObservations;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    barcodeObservations = self->_barcodeObservations;
    self->_barcodeObservations = v4;

    -[VCPMADServiceImagePhotosAsset persistOCRMRC](self, "persistOCRMRC");
  }

}

- (BOOL)hasCachedParseData
{
  NSNumber *hasCachedParseData;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSData *v13;
  NSData *cachedParseData;
  void *v15;
  NSNumber *v16;
  void *v17;
  NSNumber **p_hasCachedParseData;
  NSNumber *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  hasCachedParseData = self->_hasCachedParseData;
  if (!hasCachedParseData)
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v4;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VS][%@] Checking for existing results from Photos", (uint8_t *)&v21, 0xCu);

    }
    -[PHAsset visualSearchProperties](self->_asset, "visualSearchProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "algorithmVersion");
    if (v6 == (int)VCPPhotosVisualSearchAlgorithmVersion()
      && (objc_msgSend(v5, "adjustmentVersion"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[PHAsset adjustmentVersion](self->_asset, "adjustmentVersion"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqualToDate:", v8),
          v8,
          v7,
          v9))
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        -[PHAsset localIdentifier](self->_asset, "localIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v10;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VS][%@] Loading existing results from Photos", (uint8_t *)&v21, 0xCu);

      }
      objc_msgSend(v5, "visualSearchData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11 == 0;

      if (v12)
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          -[PHAsset localIdentifier](self->_asset, "localIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138412290;
          v22 = v17;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VS][%@] Photos results exist, but empty", (uint8_t *)&v21, 0xCu);

        }
        cachedParseData = self->_cachedParseData;
        self->_cachedParseData = 0;
      }
      else
      {
        objc_msgSend(v5, "visualSearchData");
        v13 = (NSData *)objc_claimAutoreleasedReturnValue();
        cachedParseData = self->_cachedParseData;
        self->_cachedParseData = v13;
      }

      v16 = (NSNumber *)MEMORY[0x1E0C9AAB0];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        -[PHAsset localIdentifier](self->_asset, "localIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v15;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VS][%@] Asset does not have existing results", (uint8_t *)&v21, 0xCu);

      }
      v16 = (NSNumber *)MEMORY[0x1E0C9AAA0];
    }
    p_hasCachedParseData = &self->_hasCachedParseData;
    v19 = *p_hasCachedParseData;
    *p_hasCachedParseData = v16;

    hasCachedParseData = *p_hasCachedParseData;
  }
  return -[NSNumber BOOLValue](hasCachedParseData, "BOOLValue");
}

- (id)cachedParseData
{
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!-[VCPMADServiceImagePhotosAsset hasCachedParseData](self, "hasCachedParseData"))
    return 0;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    -[PHAsset localIdentifier](self->_asset, "localIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VS][%@] Successfully reused existing results", (uint8_t *)&v5, 0xCu);

  }
  return self->_cachedParseData;
}

- (void)setCachedParseData:(id)a3 overwriteExisting:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSData *v7;
  NSData *cachedParseData;
  NSNumber *hasCachedParseData;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (NSData *)objc_msgSend(v6, "copy");
  cachedParseData = self->_cachedParseData;
  self->_cachedParseData = v7;

  hasCachedParseData = self->_hasCachedParseData;
  self->_hasCachedParseData = (NSNumber *)MEMORY[0x1E0C9AAB0];

  if (-[PHAsset vcp_needsVisualSearchProcessing](self->_asset, "vcp_needsVisualSearchProcessing") || v4)
  {
    -[PHAsset adjustmentVersion](self->_asset, "adjustmentVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        -[PHAsset localIdentifier](self->_asset, "localIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v11;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VS][%@] Persisting results to Photos", buf, 0xCu);

      }
      -[PHAsset photoLibrary](self->_asset, "photoLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __70__VCPMADServiceImagePhotosAsset_setCachedParseData_overwriteExisting___block_invoke;
      v17[3] = &unk_1E6B16D58;
      v17[4] = self;
      v18 = v6;
      v16[0] = v13;
      v16[1] = 3221225472;
      v16[2] = __70__VCPMADServiceImagePhotosAsset_setCachedParseData_overwriteExisting___block_invoke_2;
      v16[3] = &unk_1E6B192C8;
      v16[4] = self;
      objc_msgSend(v12, "performChanges:completionHandler:", v17, v16);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAsset adjustmentVersion](self->_asset, "adjustmentVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPMADServiceImagePhotosAsset setCachedParseData:overwriteExisting:].cold.1(v14, v15, buf);
    }
  }

}

void __70__VCPMADServiceImagePhotosAsset_setCachedParseData_overwriteExisting___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CD13A8], "changeRequestForAsset:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  v3 = VCPPhotosVisualSearchAlgorithmVersion();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "adjustmentVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisualSearchData:algorithmVersion:adjustmentVersion:", v2, v3, v4);

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "vcp_needsStickerGatingProcessing") & 1) == 0
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "mad_isEligibleForComputeSync"))
  {
    objc_msgSend(v5, "setAssetAnalysisStage:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "mad_analysisStageAfterCompletingAnalysis:", 12));
  }

}

void __70__VCPMADServiceImagePhotosAsset_setCachedParseData_overwriteExisting___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "localIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VS][%@] Successfully persisted results to Photos", (uint8_t *)&v8, 0xCu);

    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "localIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VS][%@] Failed to persist results to Photos", (uint8_t *)&v8, 0xCu);

  }
}

- (id)thumbnailResource
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[VCPMADServiceImagePhotosAsset resources](self, "resources", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "type") == 102)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)asset
{
  return self->_asset;
}

- (id)photoLibrary
{
  return (id)-[PHAsset photoLibrary](self->_asset, "photoLibrary");
}

- (BOOL)hasValidSceneProcessing
{
  void *v2;
  char v3;

  -[VCPMADServiceImagePhotosAsset asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "vcp_needSceneProcessing") ^ 1;

  return v3;
}

- (BOOL)fromGenerativePlayground
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PHAsset photosInfoPanelExtendedProperties](self->_asset, "photosInfoPanelExtendedProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generativeAIType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 1;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedParseData, 0);
  objc_storeStrong((id *)&self->_hasCachedParseData, 0);
  objc_storeStrong((id *)&self->_barcodeObservations, 0);
  objc_storeStrong((id *)&self->_documentObservations, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_highResPixelBuffer.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_lowResPixelBuffer.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_pixelBuffer.value_);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 18) = 0;
  return self;
}

- (void)setCachedParseData:(uint8_t *)buf overwriteExisting:.cold.1(void *a1, void *a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "[VS][%@] Asset has invalid adjustment version (%@); cannot persist results to Photos",
    buf,
    0x16u);

}

@end
