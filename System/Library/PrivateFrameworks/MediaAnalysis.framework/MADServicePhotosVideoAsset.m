@implementation MADServicePhotosVideoAsset

- (MADServicePhotosVideoAsset)initWithPhotosAsset:(id)a3 clientBundleID:(id)a4 clientTeamID:(id)a5
{
  id v9;
  MADServicePhotosVideoAsset *v10;
  MADServicePhotosVideoAsset *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MADServicePhotosVideoAsset;
  v10 = -[MADServiceVideoAsset initWithClientBundleID:clientTeamID:](&v13, sel_initWithClientBundleID_clientTeamID_, a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_photosAsset, a3);

  return v11;
}

- (unint64_t)assetType
{
  return 6;
}

- (id)identifier
{
  return (id)-[PHAsset localIdentifier](self->_photosAsset, "localIdentifier");
}

- (id)resources
{
  NSArray *resources;
  NSArray *v4;
  NSArray *v5;

  resources = self->_resources;
  if (!resources)
  {
    objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allAcceptableResourcesForAsset:", self->_photosAsset);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_resources;
    self->_resources = v4;

    resources = self->_resources;
  }
  return resources;
}

- (id)url
{
  void *v3;
  MADServicePhotosVideoAsset *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  int v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  int v34;
  void *v36;
  void *v37;
  MADServicePhotosVideoAsset *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  _BYTE v48[10];
  _BYTE v49[6];
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[PHAsset localIdentifier](self->_photosAsset, "localIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAsset vcp_typeDescription](self->_photosAsset, "vcp_typeDescription");
    v4 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PHAsset mediaType](v4->_photosAsset, "mediaType");
    v7 = -[PHAsset mediaSubtypes](v4->_photosAsset, "mediaSubtypes");
    v8 = -[PHAsset pixelWidth](v4->_photosAsset, "pixelWidth");
    v9 = -[PHAsset pixelHeight](v4->_photosAsset, "pixelHeight");
    *(_DWORD *)buf = 138413570;
    v46 = v3;
    v47 = 2112;
    *(_QWORD *)v48 = v5;
    *(_WORD *)&v48[8] = 1024;
    *(_DWORD *)v49 = v6;
    *(_WORD *)&v49[4] = 1024;
    v50 = v7;
    v51 = 1024;
    v52 = v8;
    v53 = 1024;
    v54 = v9;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Selecting resource for Asset Type: %@ [%d/%d] Resolution: %dx%d", buf, 0x2Eu);

    self = v4;
  }
  -[MADServicePhotosVideoAsset resources](self, "resources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "vcp_movieResourcesSorted:", -[PHAsset vcp_hasAdjustments:](self->_photosAsset, "vcp_hasAdjustments:", v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v11, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (!v12)
  {
    v30 = 0;
    goto LABEL_30;
  }
  v13 = v12;
  v36 = v11;
  v37 = v10;
  v38 = self;
  v14 = *(_QWORD *)v41;
  v15 = MEMORY[0x1E0C81028];
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v41 != v14)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[PHAsset localIdentifier](v38->_photosAsset, "localIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "type");
        v20 = objc_msgSend(v17, "pixelWidth");
        v21 = objc_msgSend(v17, "pixelHeight");
        *(_DWORD *)buf = 138413058;
        v46 = v18;
        v47 = 1024;
        *(_DWORD *)v48 = v19;
        *(_WORD *)&v48[4] = 1024;
        *(_DWORD *)&v48[6] = v20;
        *(_WORD *)v49 = 1024;
        *(_DWORD *)&v49[2] = v21;
        _os_log_impl(&dword_1B6C4A000, v15, OS_LOG_TYPE_DEFAULT, "[%@] Evaluating movie resource (Type: %d Resolution: %dx%d)", buf, 0x1Eu);

      }
      if ((objc_msgSend(v17, "vcp_isLocallyAvailable", v36, v37) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "privateFileURL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v22, "fileExistsAtPath:", v24);

        v26 = MediaAnalysisLogLevel();
        if ((v25 & 1) != 0)
        {
          if (v26 >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            -[PHAsset localIdentifier](v38->_photosAsset, "localIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v17, "type");
            v33 = objc_msgSend(v17, "pixelWidth");
            v34 = objc_msgSend(v17, "pixelHeight");
            *(_DWORD *)buf = 138413058;
            v46 = v31;
            v47 = 1024;
            *(_DWORD *)v48 = v32;
            *(_WORD *)&v48[4] = 1024;
            *(_DWORD *)&v48[6] = v33;
            *(_WORD *)v49 = 1024;
            *(_DWORD *)&v49[2] = v34;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Selected resource (Type: %d Resolution: %dx%d)", buf, 0x1Eu);

          }
          objc_msgSend(v17, "privateFileURL");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
        if (v26 >= 5 && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          -[PHAsset localIdentifier](v38->_photosAsset, "localIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v46 = v27;
          v28 = v15;
          v29 = "[%@] Resource marked available, but file does not exist; skipping resource";
LABEL_20:
          _os_log_impl(&dword_1B6C4A000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);

          continue;
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[PHAsset localIdentifier](v38->_photosAsset, "localIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v46 = v27;
        v28 = v15;
        v29 = "[%@] Resource not locally available; skipping resource";
        goto LABEL_20;
      }
    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v13)
      continue;
    break;
  }
  v30 = 0;
LABEL_28:
  v11 = v36;
  v10 = v37;
LABEL_30:

  return v30;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTime
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v6;

  -[PHAsset photoIrisProperties](self->_photosAsset, "photoIrisProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "photoIrisStillDisplayTime");
    v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)trimTimeRange
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *result;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PHAsset mediaAnalysisProperties](self->_photosAsset, "mediaAnalysisProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaAnalysisTimeStamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAsset adjustmentVersion](self->_photosAsset, "adjustmentVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqual:", v7))
  {

    goto LABEL_10;
  }
  v8 = objc_msgSend(v5, "mediaAnalysisVersion");

  if (!v8)
  {
LABEL_10:
    v9 = MEMORY[0x1E0CA2E40];
    v10 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&retstr->var0.var3 = v10;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v9 + 32);
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "mediaAnalysisVersion") != 69
    && (int)MediaAnalysisLogLevel() >= 5
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = objc_msgSend(v5, "mediaAnalysisVersion");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Using trim range from older analysis version (%d)", (uint8_t *)v12, 8u);
  }
  if (v5)
  {
    objc_msgSend(v5, "bestVideoTimeRange");
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }
LABEL_11:

  return result;
}

- (id)isSensitive
{
  void *v3;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[PHAsset vcp_needsFullAnalysisProcessing](self->_photosAsset, "vcp_needsFullAnalysisProcessing"))
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[PHAsset localIdentifier](self->_photosAsset, "localIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Asset not processed or outdated for full analysis", (uint8_t *)&v8, 0xCu);

    }
    return 0;
  }
  else
  {
    -[PHAsset mediaAnalysisProperties](self->_photosAsset, "mediaAnalysisProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "screenTimeDeviceImageSensitivity");

    v7 = (void *)MEMORY[0x1E0C9AAA0];
    if (v6)
      v7 = 0;
    if (v6 == 1)
      return (id)MEMORY[0x1E0C9AAB0];
    else
      return v7;
  }
}

- (id)scoresForLabels
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
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;

  -[PHAsset photoLibrary](self->_photosAsset, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPDatabaseReader databaseForPhotoLibrary:](VCPDatabaseReader, "databaseForPhotoLibrary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHAsset localIdentifier](self->_photosAsset, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryAnalysisForAsset:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "vcp_results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SafetyResults"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SensitivitySceneResults"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __45__MADServicePhotosVideoAsset_scoresForLabels__block_invoke;
      v17[3] = &unk_1E6B19830;
      v18 = v9;
      v13 = v9;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);
      if (objc_msgSend(v13, "count"))
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __45__MADServicePhotosVideoAsset_scoresForLabels__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  VCPSpecialLabelFromExtendedSceneClassificationID(objc_msgSend(a2, "longLongValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (id)animatedStickerScore
{
  return -[PHAsset vcp_animatedStickerScore](self->_photosAsset, "vcp_animatedStickerScore");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_photosAsset, 0);
}

@end
