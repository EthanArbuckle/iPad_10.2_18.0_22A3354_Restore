@implementation VCPPhotoAnalyzer

+ (BOOL)isLivePhotoKeyFrameEnabled
{
  return 0;
}

+ (id)resourceForAsset:(id)a3 withResources:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "vcp_localPhotoResourcesSorted:", objc_msgSend(v5, "hasAdjustments"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v7;
    v9 = 0;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v13, "vcp_fileSize", (_QWORD)v19) <= 0x800000
            && objc_msgSend(v13, "vcp_isDecodable"))
          {
            objc_msgSend(v13, "vcp_size");
            if (v14 < v15)
              v16 = v15;
            else
              v16 = v14;
            v17 = v13;
            if (v16 > 1536.0)
            {

              goto LABEL_19;
            }

            v9 = v17;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          continue;
        break;
      }
    }

    v9 = v9;
    v17 = v9;
LABEL_19:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (BOOL)canAnalyzeUndegraded:(id)a3 withResources:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v5 = a3;
  +[VCPPhotoAnalyzer resourceForAsset:withResources:](VCPPhotoAnalyzer, "resourceForAsset:withResources:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vcp_size");
  if (v7 < v8)
    v9 = v8;
  else
    v9 = v7;
  if (v9 >= 1536.0)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(v5, "vcp_originalSize");
    if (v10 < v11)
      v10 = v11;
    v12 = v9 >= v10;
  }

  return v12;
}

- (VCPPhotoAnalyzer)initWithVCPAsset:(id)a3 withExistingAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  VCPPhotoAnalyzer *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  NSMutableDictionary *v18;
  id *p_asset;
  unint64_t requestedAnalyses;
  unint64_t v21;
  void *v22;
  int v23;
  unint64_t v24;
  uint64_t v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  void *v29;
  NSMutableDictionary *analysis;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("[%@][PhotoAnalyzer]"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v32.receiver = self;
  v32.super_class = (Class)VCPPhotoAnalyzer;
  v14 = -[VCPPhotoAnalyzer init](&v32, sel_init);
  if (!v14)
    goto LABEL_27;
  objc_msgSend(v9, "modificationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (v16)
  {
    v14->_status = 3;
    analysis = v14->_analysis;
    v14->_analysis = 0;

    goto LABEL_27;
  }
  *(_WORD *)&v14->_allowStreaming = 0;
  v14->_status = 1;
  v14->_requestedAnalyses = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v14->_analysis;
  v14->_analysis = (NSMutableDictionary *)v17;

  p_asset = (id *)&v14->_asset;
  objc_storeStrong((id *)&v14->_asset, a3);
  *(_QWORD *)&v14->_imageBlurTextureScore = 0xBF8000003F800000;
  requestedAnalyses = v14->_requestedAnalyses;
  v21 = requestedAnalyses & 0xFFFCBE36FFFFFFFFLL;
  if ((requestedAnalyses & 0xFFFCBE36FFFFFFFFLL) != 0)
    requestedAnalyses |= 0x80200uLL;
  if (v21 | requestedAnalyses & 0x2000000000)
    v14->_requestedAnalyses = requestedAnalyses | ((requestedAnalyses & 0x2000000000) >> 20);
  -[VCPPhotoAnalyzer processExistingAnalyses:](v14, "processExistingAnalyses:", v10);
  if (objc_msgSend(*p_asset, "isMovie"))
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v13;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%@ Analyzing degraded version of Movie", buf, 0xCu);
    }
    -[NSMutableDictionary vcp_addFlags:](v14->_analysis, "vcp_addFlags:", 0x40000);
  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    MediaAnalysisTypeShortDescription(v14->_requestedAnalyses);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = v13;
    v35 = 2112;
    v36 = v22;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Initial to process (%@)", buf, 0x16u);

  }
  v23 = objc_msgSend(*p_asset, "isLivePhoto");
  v24 = v14->_requestedAnalyses;
  if (!v23)
    goto LABEL_21;
  v25 = v24 & 0x4000AF47FCA400D0;
  v14->_irisAnalyses = v24 & 0x4000AF47FCA400D0;
  v14->_requirePHFaceAnalysis = (v24 & 0x40000000) != 0;
  if ((v24 & 0x80) != 0)
  {
    v25 |= 8uLL;
    v14->_irisAnalyses = v25;
    v24 |= 0x200uLL;
    v14->_requestedAnalyses = v24;
    if ((v25 & 0x40000) == 0)
    {
LABEL_18:
      if ((v25 & 0x80000000) == 0)
        goto LABEL_19;
LABEL_30:
      v14->_irisAnalyses = v25 | 0x88;
      if ((v24 & 0x100000) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((v24 & 0x40000) == 0)
  {
    goto LABEL_18;
  }
  v24 |= 0x200uLL;
  v14->_requestedAnalyses = v24;
  if ((v25 & 0x80000000) != 0)
    goto LABEL_30;
LABEL_19:
  if ((v24 & 0x100000) != 0)
  {
LABEL_20:
    v24 |= 0x20008uLL;
    v14->_requestedAnalyses = v24;
  }
LABEL_21:
  if ((v24 & 0x2000000000200) != 0)
    v14->_requestedAnalyses = (v24 >> 6) & 8 | (v24 >> 1) & 0x1000000000000 | v24;
  -[NSMutableDictionary vcp_setVersion:](v14->_analysis, "vcp_setVersion:", 69);
  v26 = v14->_analysis;
  -[VCPAsset modificationDate](v14->_asset, "modificationDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary vcp_setDateModified:](v26, "vcp_setDateModified:", v27);

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    MediaAnalysisTypeShortDescription(v14->_requestedAnalyses);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    MediaAnalysisTypeShortDescription(v14->_irisAnalyses);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v34 = v13;
    v35 = 2112;
    v36 = v28;
    v37 = 2112;
    v38 = v29;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ Initialized to process (%@), iris (%@)", buf, 0x20u);

  }
LABEL_27:

  return v14;
}

+ (id)analyzerWithVCPAsset:(id)a3 forAnalysisTypes:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithVCPAsset:withExistingAnalysis:forAnalysisTypes:", v5, 0, a4);

  return v6;
}

- (VCPPhotoAnalyzer)initWithPHAsset:(id)a3 existingAnalysis:(id)a4 analysisTypes:(unint64_t)a5 downloadedData:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  VCPPhotoAnalyzer *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  unint64_t requestedAnalyses;
  int v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *analysis;
  void *v24;
  int v25;
  _BOOL4 v26;
  _BOOL4 v27;
  void *phFaceResults;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSDictionary *v33;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  +[VCPPhotosAsset assetWithPHAsset:downloadedData:](VCPPhotosAsset, "assetWithPHAsset:downloadedData:", v11, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MediaAnalysisStripOutdatedAnalysis(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[VCPPhotoAnalyzer initWithVCPAsset:withExistingAnalysis:forAnalysisTypes:](self, "initWithVCPAsset:withExistingAnalysis:forAnalysisTypes:", v13, v14, a5);

  if (v15)
  {
    objc_storeStrong((id *)&v15->_phAsset, a3);
    if ((v15->_requestedAnalyses & 0x200) != 0)
    {
      if ((objc_msgSend(v11, "vcp_needSceneProcessing") & 1) != 0)
      {
        v15->_preAnalysisSharpnessScore = -1.0;
        if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "localIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v37 = v16;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "  [%@] missing Pre Analysis result", buf, 0xCu);

        }
      }
      else
      {
        objc_msgSend(v11, "mediaAnalysisProperties");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v11, "mediaAnalysisProperties");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "blurrinessScore");
          v15->_preAnalysisSharpnessScore = v19;

        }
        else
        {
          v15->_preAnalysisSharpnessScore = -1.0;
        }
      }
    }
    requestedAnalyses = v15->_requestedAnalyses;
    if (((requestedAnalyses & 0xC) == 4
       || (requestedAnalyses & 8) != 0 && objc_msgSend(MEMORY[0x1E0CD1398], "vcp_usePHFace"))
      && (objc_msgSend(v11, "vcp_needsFaceProcessing") & 1) == 0)
    {
      v35 = 0;
      v21 = objc_msgSend(v11, "vcp_queryPHFaces:results:", &v15->_phFaceFlags, &v35);
      v22 = (NSMutableDictionary *)v35;
      analysis = v22;
      if (v21)
      {

        v15->_status = 3;
        analysis = v15->_analysis;
        v15->_analysis = 0;
      }
      else
      {
        if (v22 && -[NSMutableDictionary count](v22, "count"))
        {
          -[NSMutableDictionary objectForKey:](analysis, "objectForKey:", CFSTR("FaceQualityFlag"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "intValue");

          if ((v15->_requestedAnalyses & 0x40000) != 0
            && ((v26 = -[VCPAsset isLivePhoto](v15->_asset, "isLivePhoto"), !v25) ? (v27 = v26) : (v27 = 0), v27))
          {
            phFaceResults = v15->_phFaceResults;
            v15->_phFaceResults = 0;
          }
          else
          {
            v30 = (void *)MEMORY[0x1E0C99D80];
            -[NSMutableDictionary objectForKeyedSubscript:](analysis, "objectForKeyedSubscript:", CFSTR("FaceResults"));
            phFaceResults = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](analysis, "objectForKeyedSubscript:", CFSTR("ShotTypeResults"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "dictionaryWithObjectsAndKeys:", phFaceResults, CFSTR("FaceResults"), v31, CFSTR("ShotTypeResults"), 0);
            v32 = objc_claimAutoreleasedReturnValue();
            v33 = v15->_phFaceResults;
            v15->_phFaceResults = (NSDictionary *)v32;

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
          v29 = objc_claimAutoreleasedReturnValue();
          phFaceResults = v15->_phFaceResults;
          v15->_phFaceResults = (NSDictionary *)v29;
        }

      }
    }
  }

  return v15;
}

- (VCPPhotoAnalyzer)initWithPHAsset:(id)a3 withExistingAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5
{
  return -[VCPPhotoAnalyzer initWithPHAsset:existingAnalysis:analysisTypes:downloadedData:](self, "initWithPHAsset:existingAnalysis:analysisTypes:downloadedData:", a3, a4, a5, 0);
}

- (void)setSharedContext:(id)a3
{
  objc_storeStrong((id *)&self->_sharedContext, a3);
}

- (void)processExistingAnalyses:(id)a3
{
  void *v4;
  uint64_t v5;
  NSMutableDictionary *analysis;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("performedAnalysisTypes"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_msgSend(v8, "vcp_types");
      analysis = self->_analysis;
      self->_requestedAnalyses &= ~v5;
      objc_msgSend(v8, "vcp_results");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary vcp_addEntriesFromResults:](analysis, "vcp_addEntriesFromResults:", v7);

      -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", objc_msgSend(v8, "vcp_types"));
    }
  }

}

- (id)existingAnalysisForMovieAnalyzer
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableDictionary vcp_types](self->_analysis, "vcp_types");
  -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObjectForKey:", CFSTR("FaceResults"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("FacePrintResults"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("FeatureVectorResults"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("SceneprintResults"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("SaliencyResults"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("HumanPoseResults"));
  if (v5)
  {
    v11[0] = CFSTR("version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NSMutableDictionary vcp_version](self->_analysis, "vcp_version"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v11[1] = CFSTR("dateModified");
    -[NSMutableDictionary vcp_dateModified](self->_analysis, "vcp_dateModified");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v7;
    v11[2] = CFSTR("performedAnalysisTypes");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3 & 0xFFFFFFFFFFBFE7F3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = CFSTR("metadataRanges");
    v12[2] = v8;
    v12[3] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateDegradedFlagForMajorDimension:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint8_t v8[16];

  if ((-[NSMutableDictionary vcp_degraded](self->_analysis, "vcp_degraded") & 1) == 0)
  {
    v5 = -[VCPAsset pixelWidth](self->_asset, "pixelWidth");
    v6 = -[VCPAsset pixelHeight](self->_asset, "pixelHeight");
    v7 = v5 <= v6 ? v6 : v5;
    if (a3 <= 0x5FF && v7 >= 0x600)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "  Analyzing degraded version of Photo", v8, 2u);
      }
      -[NSMutableDictionary vcp_addFlags:](self->_analysis, "vcp_addFlags:", 0x40000);
    }
  }
}

- (int)downscaleImage:(__CVBuffer *)a3 scaledImage:(__CVBuffer *)a4 majorDimension:(int)a5
{
  int Width;
  int Height;
  int v11;
  int v12;
  int v13;
  __CVBuffer *v14;

  *a4 = 0;
  if (!a3)
    return -50;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (Width <= Height)
    v11 = Height;
  else
    v11 = Width;
  if (v11 <= a5)
  {
    v14 = (__CVBuffer *)CFRetain(a3);
    v13 = 0;
    goto LABEL_11;
  }
  Scaler::Scale(&self->_scaler, a3, a4, (Width * a5 / v11) & 0xFFFFFFFE, (Height * a5 / v11) & 0xFFFFFFFE, 875704422);
  v13 = v12;
  if (v12 && *a4)
  {
    CFRelease(*a4);
    v14 = 0;
LABEL_11:
    *a4 = v14;
  }
  return v13;
}

- (int)checkFaceDominant
{
  NSDictionary *phFaceResults;
  void *v4;
  id v5;
  VCPExifAnalyzer *v6;
  VCPExifAnalyzer *v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;
  NSRect v24;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = -[NSMutableDictionary vcp_flags](self->_analysis, "vcp_flags");
  phFaceResults = self->_phFaceResults;
  if (phFaceResults)
  {
    -[NSDictionary objectForKeyedSubscript:](phFaceResults, "objectForKeyedSubscript:", CFSTR("FaceResults"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VCPAsset exif](self->_asset, "exif");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[VCPExifAnalyzer initWithProperties:forAnalysisTypes:]([VCPExifAnalyzer alloc], "initWithProperties:forAnalysisTypes:", v5, 4);
      v7 = v6;
      if (!v6)
      {
        v4 = 0;
        v8 = -108;
        goto LABEL_23;
      }
      v20 = 0;
      v8 = -[VCPExifAnalyzer analyzeAsset:results:](v6, "analyzeAsset:results:", &v21, &v20);
      v9 = v20;
      v10 = v9;
      if (v8)
      {

        v4 = 0;
LABEL_22:

        goto LABEL_23;
      }
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FaceResults"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

  }
  if (!objc_msgSend(v4, "count"))
  {
    v8 = 0;
    goto LABEL_25;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("attributes"), (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("faceBounds"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = NSRectFromString((NSString *)v10);
        if (v24.size.height * v24.size.width > 0.200000003)
        {
          v8 = 0;
          self->_faceDominated = 1;
          v4 = v5;
          goto LABEL_22;
        }

      }
      v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v11)
        continue;
      break;
    }
  }
  v8 = 0;
  v4 = v5;
LABEL_23:

LABEL_25:
  return v8;
}

- (void)_reportPetsAnalysisWithResults:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  NSString *v15;
  double width;
  double height;
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
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[7];
  _QWORD v33[7];
  _BYTE v34[128];
  uint64_t v35;
  NSRect v36;
  CGRect v37;
  CGRect v38;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PetsResults"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PetsFaceResults"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = v26;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v29;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("attributes"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("petsBounds"));
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();

        v36 = NSRectFromString(v15);
        v38.origin.x = v36.origin.x;
        v38.origin.y = v36.origin.y;
        width = v36.size.width;
        height = v36.size.height;
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = v7;
        v36.size.height = v8;
        v38.size.width = width;
        v38.size.height = height;
        v37 = CGRectUnion(v36, v38);
        x = v37.origin.x;
        y = v37.origin.y;
        v7 = v37.size.width;
        v8 = v37.size.height;
        if (width * height > v12)
          v12 = width * height;

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 0.0;
  }

  +[VCPMADCoreAnalyticsManager sharedManager](VCPMADCoreAnalyticsManager, "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = CFSTR("AssetType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCPAsset mediaType](self->_asset, "mediaType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v19;
  v32[1] = CFSTR("SceneType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSDictionary count](self->_phFaceResults, "count") != 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v20;
  v33[2] = &unk_1E6B74DB0;
  v32[2] = CFSTR("ResourceType");
  v32[3] = CFSTR("NumberOfPetsDetected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v21;
  v32[4] = CFSTR("AggregatedBoundingBoxSizeRatio");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 * v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v22;
  v32[5] = CFSTR("LargestBoundingBoxSizeRatio");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[5] = v23;
  v32[6] = CFSTR("NumberOfPetFacesDetected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendEvent:withAnalytics:", CFSTR("com.apple.mediaanalysisd.analysis.pets"), v25);

}

- (int)runBlock:(id)a3 queue:(id)a4
{
  uint64_t (**v5)(_QWORD);
  NSObject *v6;
  int v7;
  _QWORD v9[4];
  uint64_t (**v10)(_QWORD);
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v5 = (uint64_t (**)(_QWORD))a3;
  v6 = a4;
  if (v6)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __35__VCPPhotoAnalyzer_runBlock_queue___block_invoke;
    v9[3] = &unk_1E6B1AFC0;
    v11 = &v12;
    v10 = v5;
    dispatch_sync(v6, v9);
    v7 = *((_DWORD *)v13 + 6);

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = v5[2](v5);
  }

  return v7;
}

uint64_t __35__VCPPhotoAnalyzer_runBlock_queue___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)analyzeImage:(unint64_t *)a3 performedAnalyses:(unint64_t *)a4 cancel:(id)a5
{
  uint64_t (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  size_t Width;
  size_t Height;
  size_t v17;
  unint64_t requestedAnalyses;
  _BOOL4 v20;
  void **v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  int v29;
  NSObject *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  NSObject *v33;
  VCPJunkAnalyzer *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  os_signpost_id_t v40;
  NSObject *v41;
  NSObject *v42;
  VCPImageBlurAnalyzer *v43;
  id v44;
  float v45;
  NSMutableDictionary *analysis;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  os_signpost_id_t v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unint64_t *v61;
  VCPImageLivePhotoBlurAnalyzer *v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  os_signpost_id_t v67;
  NSObject *v68;
  NSObject *v69;
  uint64_t v70;
  NSObject *v71;
  NSObject *v72;
  BOOL v73;
  unint64_t v74;
  uint64_t v75;
  _BOOL4 v76;
  void **v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint8_t *v83;
  const void *v84;
  unint64_t v85;
  void *v86;
  NSObject *v87;
  os_signpost_id_t v88;
  NSObject *v89;
  NSObject *v90;
  VCPImagePetsKeypointsAnalyzer *v91;
  void *v92;
  void *v93;
  void *v94;
  NSObject *v95;
  NSObject *v96;
  NSObject *v97;
  NSObject *v98;
  os_signpost_id_t v99;
  NSObject *v100;
  NSObject *v101;
  unint64_t v102;
  VCPImageHandsAnalyzer *v103;
  VCPImageHandsAnalyzer *v104;
  NSObject *v105;
  NSObject *v106;
  NSObject *v107;
  os_signpost_id_t v108;
  NSObject *v109;
  NSObject *v110;
  unint64_t v111;
  VCPImagePetsAnalyzer *v112;
  NSObject *v113;
  NSObject *v114;
  BOOL v115;
  uint64_t v116;
  int HasANE;
  void *v118;
  PHAsset *phAsset;
  NSObject *v120;
  id v121;
  NSObject *v122;
  os_signpost_id_t v123;
  NSObject *v124;
  NSObject *v125;
  void *v126;
  void *v127;
  int v128;
  int v129;
  NSObject *v130;
  NSObject *v131;
  NSObject *v132;
  NSObject *v133;
  os_signpost_id_t v134;
  NSObject *v135;
  NSObject *v136;
  VCPImageHandsAnalyzer *v137;
  NSObject *v138;
  NSObject *v139;
  NSObject *v140;
  NSObject *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  os_signpost_id_t spidb;
  os_signpost_id_t v148;
  os_signpost_id_t v149;
  os_signpost_id_t v150;
  os_signpost_id_t v151;
  os_signpost_id_t v152;
  void *v153;
  int v154;
  unint64_t *v155;
  id v157;
  _QWORD v158[4];
  id v159;
  VCPPhotoAnalyzer *v160;
  uint64_t (**v161)(_QWORD);
  const void *v162[2];
  _QWORD v163[5];
  uint64_t (**v164)(_QWORD);
  const void *v165[2];
  id v166;
  id v167;
  id v168;
  uint8_t v169[16];
  _QWORD v170[5];
  const void *v171;
  _QWORD v172[5];
  uint64_t (**v173)(_QWORD);
  uint8_t *v174;
  _QWORD v175[5];
  uint64_t (**v176)(_QWORD);
  uint8_t *v177;
  const void *v178;
  _QWORD v179[5];
  uint64_t (**v180)(_QWORD);
  uint8_t *v181;
  _QWORD v182[5];
  uint64_t (**v183)(_QWORD);
  uint8_t *v184;
  void *v185;
  unint64_t *v186;
  id v187;
  id v188;
  _QWORD v189[5];
  uint64_t (**v190)(_QWORD);
  const void *v191[2];
  id v192;
  _QWORD v193[5];
  uint64_t (**v194)(_QWORD);
  uint8_t *v195;
  unint64_t *v196;
  id v197;
  _QWORD v198[5];
  uint64_t (**v199)(_QWORD);
  void *v200;
  unint64_t *v201;
  _QWORD v202[5];
  uint64_t (**v203)(_QWORD);
  uint8_t *v204;
  void *v205;
  unint64_t *v206;
  uint8_t v207[8];
  uint8_t *v208;
  uint64_t v209;
  uint64_t (*v210)(uint64_t, uint64_t);
  void (*v211)(uint64_t);
  id v212;
  void *v213;
  _QWORD v214[6];
  uint8_t buf[8];
  uint8_t *v216;
  uint64_t v217;
  uint64_t (*v218)(uint64_t, uint64_t);
  const void **(*v219)(uint64_t);
  void *v220;
  const void *v221;

  v7 = (uint64_t (**)(_QWORD))a5;
  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPPhotoAnalyzer_Image", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v216 = buf;
  v217 = 0x3812000000;
  v218 = __Block_byref_object_copy__54;
  v219 = __Block_byref_object_dispose__54;
  v220 = &unk_1B706A4DA;
  v221 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v214[0] = MEMORY[0x1E0C809B0];
  v214[1] = 3221225472;
  v214[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke;
  v214[3] = &unk_1E6B1AFE8;
  v214[4] = self;
  v214[5] = buf;
  -[VCPPhotoAnalyzerSharedContext queueDecode](self->_sharedContext, "queueDecode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VCPPhotoAnalyzer runBlock:queue:](self, "runBlock:queue:", v214, v13);

  if (!v14)
  {
    Width = CVPixelBufferGetWidth(*((CVPixelBufferRef *)v216 + 6));
    Height = CVPixelBufferGetHeight(*((CVPixelBufferRef *)v216 + 6));
    if (Width <= Height)
      v17 = Height;
    else
      v17 = Width;
    -[VCPPhotoAnalyzer updateDegradedFlagForMajorDimension:](self, "updateDegradedFlagForMajorDimension:", v17);
    v213 = 0;
    v14 = -[VCPPhotoAnalyzer downscaleImage:scaledImage:majorDimension:](self, "downscaleImage:scaledImage:majorDimension:", *((_QWORD *)v216 + 6), &v213, 580);
    if (v14)
      goto LABEL_9;
    if (v7 && (v7[2](v7) & 1) != 0)
    {
      v14 = -128;
LABEL_9:
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&v213);
      goto LABEL_10;
    }
    requestedAnalyses = self->_requestedAnalyses;
    if ((requestedAnalyses & 8) == 0)
    {
      v154 = 0;
      goto LABEL_36;
    }
    v20 = -[VCPAsset isPano](self->_asset, "isPano");
    v21 = (void **)(v216 + 48);
    if (!v20)
      v21 = &v213;
    v22 = *v21;
    *(_QWORD *)v207 = 0;
    v208 = v207;
    v209 = 0x3032000000;
    v210 = __Block_byref_object_copy__395;
    v211 = __Block_byref_object_dispose__396;
    v212 = 0;
    if (objc_msgSend(MEMORY[0x1E0CD1398], "vcp_usePHFace") && self->_phFaceResults)
    {
      if ((objc_msgSend(MEMORY[0x1E0CD1398], "vcp_usePHFaceExpression") & 1) == 0)
      {
        -[NSDictionary objectForKeyedSubscript:](self->_phFaceResults, "objectForKeyedSubscript:", CFSTR("FaceResults"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          if (objc_msgSend(v23, "count"))
          {
            v198[0] = MEMORY[0x1E0C809B0];
            v198[1] = 3221225472;
            v198[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_400;
            v198[3] = &unk_1E6B1B038;
            v198[4] = self;
            v200 = v22;
            v201 = a3;
            v199 = v7;
            -[VCPPhotoAnalyzerSharedContext queueFace](self->_sharedContext, "queueFace");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[VCPPhotoAnalyzer runBlock:queue:](self, "runBlock:queue:", v198, v25);

            if (v26)
            {
              v154 = v26;

LABEL_27:
              v29 = 0;
LABEL_34:
              _Block_object_dispose(v207, 8);

              if (!v29)
              {
                v14 = v154;
                goto LABEL_9;
              }
              requestedAnalyses = self->_requestedAnalyses;
              v12 = MEMORY[0x1E0C809B0];
LABEL_36:
              v155 = a3;
              if ((requestedAnalyses & 0x100) != 0)
              {
                VCPSignPostLog();
                v30 = objc_claimAutoreleasedReturnValue();
                v31 = os_signpost_id_generate(v30);

                VCPSignPostLog();
                v32 = objc_claimAutoreleasedReturnValue();
                v33 = v32;
                if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
                {
                  *(_WORD *)v207 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "VCPPhotoAnalyzer_Image_VCPImageJunkAnalyzer", ", v207, 2u);
                }

                v34 = objc_alloc_init(VCPJunkAnalyzer);
                v197 = 0;
                v14 = -[VCPJunkAnalyzer analyzePixelBuffer:flags:results:cancel:](v34, "analyzePixelBuffer:flags:results:cancel:", v213, v155, &v197, v7);
                v35 = v197;
                if (v14)
                  goto LABEL_41;
                -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v35);
                *a4 |= 0x100uLL;
                VCPSignPostLog();
                v36 = objc_claimAutoreleasedReturnValue();
                v37 = v36;
                if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
                {
                  *(_WORD *)v207 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v37, OS_SIGNPOST_INTERVAL_END, v31, "VCPPhotoAnalyzer_Image_VCPImageJunkAnalyzer", ", v207, 2u);
                }

                requestedAnalyses = self->_requestedAnalyses;
                a3 = v155;
                v12 = MEMORY[0x1E0C809B0];
              }
              if ((requestedAnalyses & 0x200) != 0)
              {
                v193[0] = v12;
                v193[1] = 3221225472;
                v193[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_405;
                v193[3] = &unk_1E6B1B060;
                v193[4] = self;
                v195 = buf;
                v196 = a3;
                v194 = v7;
                -[VCPPhotoAnalyzerSharedContext queueBlur](self->_sharedContext, "queueBlur");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = -[VCPPhotoAnalyzer runBlock:queue:](self, "runBlock:queue:", v193, v38);

                if (v14)
                  goto LABEL_9;
                *a4 |= 0x200uLL;
              }
              if (+[VCPPhotoAnalyzer isLivePhotoKeyFrameEnabled](VCPPhotoAnalyzer, "isLivePhotoKeyFrameEnabled")&& (self->_requestedAnalyses & 0x40000) != 0&& -[VCPAsset isLivePhoto](self->_asset, "isLivePhoto"))
              {
                VCPSignPostLog();
                v39 = objc_claimAutoreleasedReturnValue();
                v40 = os_signpost_id_generate(v39);

                VCPSignPostLog();
                v41 = objc_claimAutoreleasedReturnValue();
                v42 = v41;
                v148 = v40 - 1;
                if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
                {
                  *(_WORD *)v207 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v40, "VCPPhotoAnalyzer_Image_VCPLowResImageBlurAnalyzer", ", v207, 2u);
                }
                spid = v40;

                v43 = -[VCPImageBlurAnalyzer initWithFaceResults:sdof:]([VCPImageBlurAnalyzer alloc], "initWithFaceResults:sdof:", 0, -[VCPAsset isSDOF](self->_asset, "isSDOF"));
                v192 = 0;
                v14 = -[VCPImageBlurAnalyzer analyzePixelBuffer:flags:results:cancel:](v43, "analyzePixelBuffer:flags:results:cancel:", v213, v155, &v192, v7);
                v44 = v192;
                if (v14)
                  goto LABEL_75;
                -[VCPImageBlurAnalyzer textureScore](v43, "textureScore");
                self->_imageBlurTextureScore = v45;
                analysis = self->_analysis;
                objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("BlurResults"));
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary vcp_setResult:forKey:](analysis, "vcp_setResult:forKey:", v47, CFSTR("KeyFrameBlurResults"));
                v12 = MEMORY[0x1E0C809B0];

                VCPSignPostLog();
                v48 = objc_claimAutoreleasedReturnValue();
                v49 = v48;
                if (v148 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
                {
                  *(_WORD *)v207 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v49, OS_SIGNPOST_INTERVAL_END, spid, "VCPPhotoAnalyzer_Image_VCPLowResImageBlurAnalyzer", ", v207, 2u);
                }

                a3 = v155;
              }
              if ((self->_requestedAnalyses & 0x80000) != 0)
              {
                v189[0] = v12;
                v189[1] = 3321888768;
                v189[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_409;
                v189[3] = &unk_1E6B11AD0;
                v191[0] = v213;
                if (v213)
                  CFRetain(v213);
                v191[1] = a3;
                v190 = v7;
                v189[4] = self;
                -[VCPPhotoAnalyzerSharedContext queueExposure](self->_sharedContext, "queueExposure");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = -[VCPPhotoAnalyzer runBlock:queue:](self, "runBlock:queue:", v189, v50);

                CF<opaqueCMSampleBuffer *>::~CF(v191);
                a3 = v155;
                if (v14)
                  goto LABEL_9;
                *a4 |= 0x80000uLL;
              }
              if ((self->_irisAnalyses & 0x80) != 0)
              {
                VCPSignPostLog();
                v51 = objc_claimAutoreleasedReturnValue();
                v52 = os_signpost_id_generate(v51);

                VCPSignPostLog();
                v53 = objc_claimAutoreleasedReturnValue();
                v54 = v53;
                v149 = v52 - 1;
                if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
                {
                  *(_WORD *)v207 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v52, "VCPPhotoAnalyzer_Image_VCPImageLivePhotoBlurAnalyzer", ", v207, 2u);
                }
                spida = v52;

                -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("IrisObjectsResults"));
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = (id)objc_msgSend(v56, "count");

                if (v44)
                {
                  -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("IrisObjectsResults"));
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("attributes"));
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("objectBounds"));
                  v61 = v155;
                  v44 = (id)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v61 = v155;
                }
                v62 = -[VCPImageLivePhotoBlurAnalyzer initWithMovingObjectsResults:]([VCPImageLivePhotoBlurAnalyzer alloc], "initWithMovingObjectsResults:", v44);
                v63 = *((_QWORD *)v216 + 6);
                v188 = 0;
                v14 = -[VCPImageLivePhotoBlurAnalyzer analyzePixelBuffer:flags:results:cancel:](v62, "analyzePixelBuffer:flags:results:cancel:", v63, v61, &v188, v7);
                v43 = (VCPImageBlurAnalyzer *)v188;
                if (v14)
                {

LABEL_75:
                  goto LABEL_9;
                }
                -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v43);
                VCPSignPostLog();
                v64 = objc_claimAutoreleasedReturnValue();
                v65 = v64;
                if (v149 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
                {
                  *(_WORD *)v207 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v65, OS_SIGNPOST_INTERVAL_END, spida, "VCPPhotoAnalyzer_Image_VCPImageLivePhotoBlurAnalyzer", ", v207, 2u);
                }

                a3 = v155;
              }
              if ((self->_requestedAnalyses & 0x2000) != 0)
              {
                VCPSignPostLog();
                v66 = objc_claimAutoreleasedReturnValue();
                v67 = os_signpost_id_generate(v66);

                VCPSignPostLog();
                v68 = objc_claimAutoreleasedReturnValue();
                v69 = v68;
                if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
                {
                  *(_WORD *)v207 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v69, OS_SIGNPOST_INTERVAL_BEGIN, v67, "VCPPhotoAnalyzer_Image_VCPImageCompositionAnalyzer", ", v207, 2u);
                }

                v34 = objc_alloc_init(VCPImageCompositionAnalyzer);
                v70 = *((_QWORD *)v216 + 6);
                v187 = 0;
                v14 = -[VCPJunkAnalyzer analyzePixelBuffer:flags:results:cancel:](v34, "analyzePixelBuffer:flags:results:cancel:", v70, v155, &v187, v7);
                v35 = v187;
                if (v14)
                {
LABEL_41:

                  goto LABEL_9;
                }
                -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v35);
                *a4 |= 0x2000uLL;
                VCPSignPostLog();
                v71 = objc_claimAutoreleasedReturnValue();
                v72 = v71;
                if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
                {
                  *(_WORD *)v207 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v72, OS_SIGNPOST_INTERVAL_END, v67, "VCPPhotoAnalyzer_Image_VCPImageCompositionAnalyzer", ", v207, 2u);
                }

                a3 = v155;
              }
              *(_QWORD *)v207 = 0;
              v208 = v207;
              v209 = 0x3032000000;
              v210 = __Block_byref_object_copy__395;
              v211 = __Block_byref_object_dispose__396;
              v212 = 0;
              v73 = +[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled");
              v74 = self->_requestedAnalyses;
              v75 = MEMORY[0x1E0C809B0];
              if ((v73 & BYTE6(v74) & 1) == 1)
              {
                v76 = -[VCPAsset isPano](self->_asset, "isPano");
                v77 = (void **)(v216 + 48);
                if (!v76)
                  v77 = &v213;
                v78 = *v77;
                v182[0] = v75;
                v182[1] = 3221225472;
                v182[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_417;
                v182[3] = &unk_1E6B1B088;
                v182[4] = self;
                v185 = v78;
                v186 = a3;
                v183 = v7;
                v184 = v207;
                -[VCPPhotoAnalyzerSharedContext queueBackbone](self->_sharedContext, "queueBackbone");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = -[VCPPhotoAnalyzer runBlock:queue:](self, "runBlock:queue:", v182, v79);

                if (v14)
                  goto LABEL_192;
                *a4 |= 0x1000000000000uLL;
                v74 = self->_requestedAnalyses;
              }
              if ((v74 & 0x2000000000000) != 0)
              {
                if (*((_QWORD *)v208 + 5)
                  && (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 3
                   || +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 4))
                {
                  v75 = MEMORY[0x1E0C809B0];
                  v179[0] = MEMORY[0x1E0C809B0];
                  v179[1] = 3221225472;
                  v179[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_421;
                  v179[3] = &unk_1E6B1B0B0;
                  v181 = v207;
                  v179[4] = self;
                  v180 = v7;
                  -[VCPPhotoAnalyzerSharedContext queueCaption](self->_sharedContext, "queueCaption");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  v14 = -[VCPPhotoAnalyzer runBlock:queue:](self, "runBlock:queue:", v179, v80);

                  if (v14)
                    goto LABEL_192;
                }
                else
                {
                  v75 = MEMORY[0x1E0C809B0];
                  v175[0] = MEMORY[0x1E0C809B0];
                  v175[1] = 3321888768;
                  v175[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_424;
                  v175[3] = &unk_1E6B11B08;
                  v175[4] = self;
                  v177 = buf;
                  v178 = v213;
                  if (v213)
                    CFRetain(v213);
                  v176 = v7;
                  -[VCPPhotoAnalyzerSharedContext queueBackbone](self->_sharedContext, "queueBackbone");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  v14 = -[VCPPhotoAnalyzer runBlock:queue:](self, "runBlock:queue:", v175, v81);

                  CF<opaqueCMSampleBuffer *>::~CF(&v178);
                  a3 = v155;
                  if (v14)
                    goto LABEL_192;
                }
                *a4 |= 0x2000000000000uLL;
                v74 = self->_requestedAnalyses;
              }
              if ((v74 & 0x100000000) == 0)
                goto LABEL_107;
              v172[0] = v75;
              v172[1] = 3221225472;
              v172[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_425;
              v172[3] = &unk_1E6B1B0B0;
              v174 = buf;
              v172[4] = self;
              v173 = v7;
              -[VCPPhotoAnalyzerSharedContext queueCaption](self->_sharedContext, "queueCaption");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = -[VCPPhotoAnalyzer runBlock:queue:](self, "runBlock:queue:", v172, v82);

              if (!v14)
              {
                *a4 |= 0x100000000uLL;
LABEL_107:
                v83 = v216;
                v84 = (const void *)*((_QWORD *)v216 + 6);
                if (v84)
                {
                  CFRelease(v84);
                  *((_QWORD *)v83 + 6) = 0;
                }
                v85 = self->_requestedAnalyses;
                if ((v85 & 0x800) != 0)
                {
                  v170[0] = MEMORY[0x1E0C809B0];
                  v170[1] = 3321888768;
                  v170[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_427;
                  v170[3] = &unk_1E6B11A98;
                  v171 = v213;
                  if (v213)
                    CFRetain(v213);
                  v170[4] = self;
                  -[VCPPhotoAnalyzerSharedContext queueDescriptor](self->_sharedContext, "queueDescriptor");
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  v14 = -[VCPPhotoAnalyzer runBlock:queue:](self, "runBlock:queue:", v170, v86);

                  CF<opaqueCMSampleBuffer *>::~CF(&v171);
                  a3 = v155;
                  if (v14)
                    goto LABEL_192;
                  *a4 |= 0x800uLL;
                  v85 = self->_requestedAnalyses;
                }
                if ((v85 & 0x1000) != 0)
                {
                  VCPSignPostLog();
                  v98 = objc_claimAutoreleasedReturnValue();
                  v99 = os_signpost_id_generate(v98);

                  VCPSignPostLog();
                  v100 = objc_claimAutoreleasedReturnValue();
                  v101 = v100;
                  v102 = v99 - 1;
                  if (v99 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v100))
                  {
                    *(_WORD *)v169 = 0;
                    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v101, OS_SIGNPOST_INTERVAL_BEGIN, v99, "VCPPhotoAnalyzer_Image_VCPImageSaliencyAnalyzer", ", v169, 2u);
                  }

                  +[VCPImageSaliencyAnalyzer analyzerWith:prune:](VCPImageSaliencyAnalyzer, "analyzerWith:prune:", 3, 1);
                  v103 = (VCPImageHandsAnalyzer *)objc_claimAutoreleasedReturnValue();
                  v104 = v103;
                  if (!v103)
                  {
LABEL_189:
                    v95 = 0;
                    v14 = -108;
                    goto LABEL_190;
                  }
                  v151 = v99;
                  v168 = 0;
                  v14 = -[VCPImageHandsAnalyzer analyzePixelBuffer:flags:results:cancel:](v103, "analyzePixelBuffer:flags:results:cancel:", v213, v155, &v168, v7);
                  v95 = v168;
                  if (v14)
                  {
LABEL_190:

                    goto LABEL_191;
                  }
                  -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v95);
                  *a4 |= 0x1000uLL;
                  VCPSignPostLog();
                  v105 = objc_claimAutoreleasedReturnValue();
                  v106 = v105;
                  if (v102 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v105))
                  {
                    *(_WORD *)v169 = 0;
                    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v106, OS_SIGNPOST_INTERVAL_END, v151, "VCPPhotoAnalyzer_Image_VCPImageSaliencyAnalyzer", ", v169, 2u);
                  }

                  v85 = self->_requestedAnalyses;
                  a3 = v155;
                  if ((v85 & 0x20000) == 0)
                  {
LABEL_116:
                    if ((v85 & 0x2000000000) == 0)
                      goto LABEL_147;
                    goto LABEL_117;
                  }
                }
                else if ((v85 & 0x20000) == 0)
                {
                  goto LABEL_116;
                }
                VCPSignPostLog();
                v107 = objc_claimAutoreleasedReturnValue();
                v108 = os_signpost_id_generate(v107);

                VCPSignPostLog();
                v109 = objc_claimAutoreleasedReturnValue();
                v110 = v109;
                v111 = v108 - 1;
                if (v108 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
                {
                  *(_WORD *)v169 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v110, OS_SIGNPOST_INTERVAL_BEGIN, v108, "VCPPhotoAnalyzer_Image_VCPImagePetsAnalyzer", ", v169, 2u);
                }

                v112 = -[VCPImagePetsAnalyzer initWithMaxNumRegions:]([VCPImagePetsAnalyzer alloc], "initWithMaxNumRegions:", 5);
                v91 = (VCPImagePetsKeypointsAnalyzer *)v112;
                if (!v112)
                  goto LABEL_162;
                v152 = v108;
                v167 = 0;
                v14 = -[VCPImagePetsAnalyzer analyzePixelBuffer:flags:results:cancel:](v112, "analyzePixelBuffer:flags:results:cancel:", v213, v155, &v167, v7);
                v95 = v167;
                if (v14)
                  goto LABEL_163;
                -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v95);
                *a4 |= 0x20000uLL;
                VCPSignPostLog();
                v113 = objc_claimAutoreleasedReturnValue();
                v114 = v113;
                if (v111 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v113))
                {
                  *(_WORD *)v169 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v114, OS_SIGNPOST_INTERVAL_END, v152, "VCPPhotoAnalyzer_Image_VCPImagePetsAnalyzer", ", v169, 2u);
                }

                -[VCPPhotoAnalyzer _reportPetsAnalysisWithResults:](self, "_reportPetsAnalysisWithResults:", v95);
                v85 = self->_requestedAnalyses;
                a3 = v155;
                if ((v85 & 0x2000000000) == 0)
                {
LABEL_147:
                  if ((v85 & 0x400000) != 0)
                  {
                    v115 = +[VCPCNNEspressoContext supportGPU](VCPCNNEspressoContext, "supportGPU");
                    v116 = MEMORY[0x1E0C809B0];
                    if (v115 || (HasANE = DeviceHasANE(), v116 = MEMORY[0x1E0C809B0], HasANE))
                    {
                      v163[0] = v116;
                      v163[1] = 3321888768;
                      v163[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_438;
                      v163[3] = &unk_1E6B11AD0;
                      v165[0] = v213;
                      if (v213)
                        CFRetain(v213);
                      v165[1] = a3;
                      v163[4] = self;
                      v164 = v7;
                      -[VCPPhotoAnalyzerSharedContext queueHumanPose](self->_sharedContext, "queueHumanPose");
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      v14 = -[VCPPhotoAnalyzer runBlock:queue:](self, "runBlock:queue:", v163, v118);

                      CF<opaqueCMSampleBuffer *>::~CF(v165);
                      if (v14)
                        goto LABEL_192;
                    }
                    *a4 |= 0x400000uLL;
                  }
                  phAsset = self->_phAsset;
                  if (phAsset && (self->_requestedAnalyses & 0x40000000) != 0)
                  {
                    if (!-[PHAsset vcp_isLivePhoto](phAsset, "vcp_isLivePhoto") || (*((_BYTE *)a4 + 3) & 0x40) != 0)
                    {
                      v153 = (void *)MEMORY[0x1BCCA1B2C]();
                      VCPSignPostLog();
                      v122 = objc_claimAutoreleasedReturnValue();
                      v123 = os_signpost_id_generate(v122);

                      VCPSignPostLog();
                      v124 = objc_claimAutoreleasedReturnValue();
                      v125 = v124;
                      if (v123 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v124))
                      {
                        *(_WORD *)v169 = 0;
                        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v125, OS_SIGNPOST_INTERVAL_BEGIN, v123, "VCPPhotoAnalyzer_Image_VCPImageHumanActionAnalyzer", ", v169, 2u);
                      }

                      -[VCPAsset faces](self->_asset, "faces");
                      v126 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!objc_msgSend(v126, "count"))
                        goto LABEL_172;
                      v158[0] = MEMORY[0x1E0C809B0];
                      v158[1] = 3321888768;
                      v158[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_441;
                      v158[3] = &unk_1E6B11B40;
                      v159 = v126;
                      v160 = self;
                      v162[0] = v213;
                      if (v213)
                        CFRetain(v213);
                      v162[1] = v155;
                      v161 = v7;
                      -[VCPPhotoAnalyzerSharedContext queueHumanAction](self->_sharedContext, "queueHumanAction");
                      v127 = (void *)objc_claimAutoreleasedReturnValue();
                      v128 = -[VCPPhotoAnalyzer runBlock:queue:](self, "runBlock:queue:", v158, v127);

                      CF<opaqueCMSampleBuffer *>::~CF(v162);
                      if (v128)
                      {
                        v129 = 0;
                        v154 = v128;
                      }
                      else
                      {
LABEL_172:
                        VCPSignPostLog();
                        v130 = objc_claimAutoreleasedReturnValue();
                        v131 = v130;
                        if (v123 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v130))
                        {
                          *(_WORD *)v169 = 0;
                          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v131, OS_SIGNPOST_INTERVAL_END, v123, "VCPPhotoAnalyzer_Image_VCPImageHumanActionAnalyzer", ", v169, 2u);
                        }

                        v129 = 1;
                      }

                      objc_autoreleasePoolPop(v153);
                      v14 = v154;
                      if (!v129)
                        goto LABEL_192;
                      *a4 |= 0x40000000uLL;
                    }
                    else if ((int)MediaAnalysisLogLevel() >= 6)
                    {
                      v120 = MEMORY[0x1E0C81028];
                      v121 = MEMORY[0x1E0C81028];
                      if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)v169 = 0;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Human action on Live Photo requires paired movie, skip analyzing still", v169, 2u);
                      }

                    }
                  }
                  if ((self->_requestedAnalyses & 0x2000000) == 0)
                    goto LABEL_179;
                  VCPSignPostLog();
                  v133 = objc_claimAutoreleasedReturnValue();
                  v134 = os_signpost_id_generate(v133);

                  VCPSignPostLog();
                  v135 = objc_claimAutoreleasedReturnValue();
                  v136 = v135;
                  if (v134 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v135))
                  {
                    *(_WORD *)v169 = 0;
                    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v136, OS_SIGNPOST_INTERVAL_BEGIN, v134, "VCPPhotoAnalyzer_Image_VCPImageHandsAnalyzer", ", v169, 2u);
                  }

                  LODWORD(v144) = 2;
                  HIDWORD(v142) = (int)(float)CVPixelBufferGetWidth((CVPixelBufferRef)v213);
                  LODWORD(v143) = (int)(float)CVPixelBufferGetHeight((CVPixelBufferRef)v213);
                  LOBYTE(v142) = 1;
                  v137 = -[VCPImageHandsAnalyzer initWithKeypointsOption:forceCPU:sharedModel:enableHandDetection:enableANSTHandDetection:enableRejectHandsNearBoundaries:enableHandObject:sourceWidth:sourceHeight:modelName:revision:options:]([VCPImageHandsAnalyzer alloc], "initWithKeypointsOption:forceCPU:sharedModel:enableHandDetection:enableANSTHandDetection:enableRejectHandsNearBoundaries:enableHandObject:sourceWidth:sourceHeight:modelName:revision:options:", 5, 0, 1, 1, 0, 0, v142, v143, CFSTR("hand_keypoint_detector_lite.espresso.net"), v144, 0);
                  v104 = v137;
                  if (v137)
                  {
                    v157 = 0;
                    v14 = -[VCPImageHandsAnalyzer analyzePixelBuffer:flags:results:cancel:](v137, "analyzePixelBuffer:flags:results:cancel:", v213, v155, &v157, v7);
                    v138 = v157;
                    v139 = v138;
                    if (!v14)
                    {
                      -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v138);
                      *a4 |= 0x2000000uLL;
                      VCPSignPostLog();
                      v140 = objc_claimAutoreleasedReturnValue();
                      v141 = v140;
                      if (v134 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v140))
                      {
                        *(_WORD *)v169 = 0;
                        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v141, OS_SIGNPOST_INTERVAL_END, v134, "VCPPhotoAnalyzer_Image_VCPImageHandsAnalyzer", ", v169, 2u);
                      }

LABEL_179:
                      VCPSignPostLog();
                      v132 = objc_claimAutoreleasedReturnValue();
                      v95 = v132;
                      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v132))
                      {
                        *(_WORD *)v169 = 0;
                        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v95, OS_SIGNPOST_INTERVAL_END, v9, "VCPPhotoAnalyzer_Image", ", v169, 2u);
                      }
                      v14 = 0;
                      goto LABEL_191;
                    }
                    v95 = v138;
                    goto LABEL_190;
                  }
                  goto LABEL_189;
                }
LABEL_117:
                if (!+[VCPCNNEspressoContext supportGPU](VCPCNNEspressoContext, "supportGPU")
                  && !DeviceHasANE())
                {
LABEL_128:
                  *a4 |= 0x2000000000uLL;
                  v85 = self->_requestedAnalyses;
                  goto LABEL_147;
                }
                VCPSignPostLog();
                v87 = objc_claimAutoreleasedReturnValue();
                v88 = os_signpost_id_generate(v87);

                VCPSignPostLog();
                v89 = objc_claimAutoreleasedReturnValue();
                v90 = v89;
                if (v88 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
                {
                  *(_WORD *)v169 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v90, OS_SIGNPOST_INTERVAL_BEGIN, v88, "VCPPhotoAnalyzer_Image_VCPImagePetKeypointsAnalyzer", ", v169, 2u);
                }

                v91 = -[VCPImagePetsKeypointsAnalyzer initWithMaxNumRegions:forceCPU:sharedModel:]([VCPImagePetsKeypointsAnalyzer alloc], "initWithMaxNumRegions:forceCPU:sharedModel:", 5, 0, 1);
                if (v91)
                {
                  v150 = v88 - 1;
                  v92 = v213;
                  -[NSMutableDictionary objectForKeyedSubscript:](self->_analysis, "objectForKeyedSubscript:", CFSTR("metadataRanges"));
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("PetsResults"));
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  spidb = v88;
                  v166 = 0;
                  v14 = -[VCPImagePetsKeypointsAnalyzer analyzePixelBuffer:flags:petsDetections:results:cancel:](v91, "analyzePixelBuffer:flags:petsDetections:results:cancel:", v92, v155, v94, &v166, v7);
                  v95 = v166;

                  if (!v14)
                  {
                    -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v95);
                    VCPSignPostLog();
                    v96 = objc_claimAutoreleasedReturnValue();
                    v97 = v96;
                    if (v150 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
                    {
                      *(_WORD *)v169 = 0;
                      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v97, OS_SIGNPOST_INTERVAL_END, spidb, "VCPPhotoAnalyzer_Image_VCPImagePetKeypointsAnalyzer", ", v169, 2u);
                    }

                    a3 = v155;
                    goto LABEL_128;
                  }
LABEL_163:

LABEL_191:
                  goto LABEL_192;
                }
LABEL_162:
                v95 = 0;
                v14 = -108;
                goto LABEL_163;
              }
LABEL_192:
              _Block_object_dispose(v207, 8);

              goto LABEL_9;
            }
          }
        }
        if (self->_phFaceResults)
          *a4 |= 0xCuLL;

      }
      v154 = 0;
    }
    else
    {
      v202[0] = MEMORY[0x1E0C809B0];
      v202[1] = 3221225472;
      v202[2] = __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_397;
      v202[3] = &unk_1E6B1B010;
      v206 = a3;
      v205 = v22;
      v204 = v207;
      v203 = v7;
      v202[4] = self;
      -[VCPPhotoAnalyzerSharedContext queueFace](self->_sharedContext, "queueFace");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[VCPPhotoAnalyzer runBlock:queue:](self, "runBlock:queue:", v202, v27);

      if (v28)
      {
        v154 = v28;
        goto LABEL_27;
      }
      v154 = 0;
      *a4 |= 0xCuLL;
    }
    v29 = 1;
    goto LABEL_34;
  }
LABEL_10:
  _Block_object_dispose(buf, 8);
  CF<opaqueCMSampleBuffer *>::~CF(&v221);

  return v14;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke(uint64_t a1)
{
  uint64_t v3;

  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "imageWithPreferredDimension:", 1536);
  CF<__CVBuffer *>::operator=((const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), (const void **)&v3);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&v3);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48))
    return 0;
  else
    return 4294967278;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_397(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[8];
  id obj;
  uint8_t buf[16];

  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPPhotoAnalyzer_Image_VCPImageFaceDetector", ", buf, 2u);
  }

  +[VCPImageFaceDetector faceDetector](VCPImageFaceDetector, "faceDetector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[7];
  v8 = a1[8];
  v9 = a1[5];
  v10 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v6, "analyzePixelBuffer:flags:results:cancel:", v7, v8, &obj, v9);
  objc_storeStrong((id *)(v10 + 40), obj);
  if (!(_DWORD)v11)
  {
    objc_msgSend(*(id *)(a1[4] + 16), "vcp_addEntriesFromResults:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
    VCPSignPostLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_END, v3, "VCPPhotoAnalyzer_Image_VCPImageFaceDetector", ", v15, 2u);
    }

  }
  return v11;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_400(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  VCPImageFaceExpressionAnalyzer *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[8];
  id v16;
  uint8_t buf[16];

  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPPhotoAnalyzer_Image_VCPImageFaceExpressionAnalyzer", ", buf, 2u);
  }

  v6 = -[VCPImageFaceExpressionAnalyzer initWithFaceResults:]([VCPImageFaceExpressionAnalyzer alloc], "initWithFaceResults:", *(_QWORD *)(a1[4] + 32));
  v7 = a1[6];
  v8 = a1[7];
  v16 = 0;
  v9 = -[VCPImageFaceExpressionAnalyzer analyzePixelBuffer:flags:results:cancel:](v6, "analyzePixelBuffer:flags:results:cancel:", v7, v8, &v16, a1[5]);
  v10 = v16;
  if (!(_DWORD)v9)
  {
    objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", CFSTR("ShotTypeResults"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(*(id *)(a1[4] + 16), "vcp_setResult:forKey:", v11, CFSTR("ShotTypeResults"));
    objc_msgSend(*(id *)(a1[4] + 16), "vcp_addEntriesFromResults:", v10);
    VCPSignPostLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_END, v3, "VCPPhotoAnalyzer_Image_VCPImageFaceExpressionAnalyzer", ", v15, 2u);
    }

  }
  return v9;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_405(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  VCPImageBlurAnalyzer *v6;
  void *v7;
  VCPImageBlurAnalyzer *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  uint8_t v28[8];
  id v29;
  uint8_t buf[16];

  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPPhotoAnalyzer_Image_VCPImageBlurAnalyzer", ", buf, 2u);
  }

  v6 = [VCPImageBlurAnalyzer alloc];
  objc_msgSend(*(id *)(a1[4] + 16), "vcp_results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VCPImageBlurAnalyzer initWithFaceResults:sdof:](v6, "initWithFaceResults:sdof:", v7, objc_msgSend(*(id *)(a1[4] + 48), "isSDOF"));

  objc_msgSend(*(id *)(a1[4] + 16), "vcp_results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MetaStabilizationResults"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1[4] + 16), "vcp_results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MetaItemPTSResultsKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MetaStabilizationFrameResults"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 48), "originalPhotoOffsetSeconds");
  v15 = v14;
  objc_msgSend(*(id *)(a1[4] + 48), "exposureTimeSeconds");
  LODWORD(v17) = v16;
  LODWORD(v18) = v15;
  -[VCPImageBlurAnalyzer setGyroSharpnessParam:homographyResults:livePhotoStillDisplayTime:imageExposureTime:](v8, "setGyroSharpnessParam:homographyResults:livePhotoStillDisplayTime:imageExposureTime:", v12, v13, v18, v17);

  v19 = a1[7];
  v20 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 48);
  v21 = a1[5];
  LODWORD(v22) = *(_DWORD *)(a1[4] + 60);
  v29 = 0;
  v23 = -[VCPImageBlurAnalyzer analyzePixelBuffer:flags:withPreAnalysisScore:results:cancel:](v8, "analyzePixelBuffer:flags:withPreAnalysisScore:results:cancel:", v20, v19, &v29, v21, v22);
  v24 = v29;
  if (!(_DWORD)v23)
  {
    objc_msgSend(*(id *)(a1[4] + 16), "vcp_addEntriesFromResults:", v24);
    VCPSignPostLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)v28 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v26, OS_SIGNPOST_INTERVAL_END, v3, "VCPPhotoAnalyzer_Image_VCPImageBlurAnalyzer", ", v28, 2u);
    }

  }
  return v23;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_409(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  VCPImageExposureAnalyzer *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[8];
  id v15;
  uint8_t buf[16];

  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPPhotoAnalyzer_Image_VCPImageExposureAnalyzer", ", buf, 2u);
  }

  v6 = objc_alloc_init(VCPImageExposureAnalyzer);
  v7 = a1[6];
  v8 = a1[7];
  v15 = 0;
  v9 = -[VCPImageExposureAnalyzer analyzePixelBuffer:flags:results:cancel:](v6, "analyzePixelBuffer:flags:results:cancel:", v7, v8, &v15, a1[5]);
  v10 = v15;
  if (!(_DWORD)v9)
  {
    objc_msgSend(*(id *)(a1[4] + 16), "vcp_addEntriesFromResults:", v10);
    VCPSignPostLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v12, OS_SIGNPOST_INTERVAL_END, v3, "VCPPhotoAnalyzer_Image_VCPImageExposureAnalyzer", ", v14, 2u);
    }

  }
  return v9;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_417(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  VCPImageBackboneAnalyzer *v6;
  VCPImageBackboneAnalyzer *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v18[8];
  id v19;
  uint8_t buf[16];

  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPPhotoAnalyzer_Image_VCPImageBackboneAnalyzer", ", buf, 2u);
  }

  v6 = -[VCPImageBackboneAnalyzer initWithRequestedAnalyses:andRevision:useSharedModel:]([VCPImageBackboneAnalyzer alloc], "initWithRequestedAnalyses:andRevision:useSharedModel:", *(_QWORD *)(a1[4] + 8), 0, 1);
  v7 = v6;
  if (v6)
  {
    v8 = a1[7];
    v9 = a1[8];
    v19 = 0;
    v10 = -[VCPImageBackboneAnalyzer analyzePixelBuffer:flags:results:cancel:](v6, "analyzePixelBuffer:flags:results:cancel:", v8, v9, &v19, a1[5]);
    v11 = v19;
    if (!(_DWORD)v10)
    {
      objc_msgSend(*(id *)(a1[4] + 16), "vcp_appendResults:", v11);
      -[VCPImageBackboneAnalyzer spatialEmbedding](v7, "spatialEmbedding");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1[6] + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      VCPSignPostLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)v18 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v16, OS_SIGNPOST_INTERVAL_END, v3, "VCPPhotoAnalyzer_Image_VCPImageBackboneAnalyzer", ", v18, 2u);
      }

      v10 = 0;
    }
  }
  else
  {
    v11 = 0;
    v10 = 4294967188;
  }

  return v10;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_421(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  VCPImageCaptionAnalyzer *v6;
  VCPImageCaptionAnalyzer *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[8];
  id v16;
  uint8_t buf[16];

  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPCSUImageCaptionAnalyzer", ", buf, 2u);
  }

  v6 = -[VCPImageCaptionAnalyzer initWithCaptionModelType:captionSafetyType:]([VCPImageCaptionAnalyzer alloc], "initWithCaptionModelType:captionSafetyType:", 3, 0);
  v7 = v6;
  if (v6)
  {
    v8 = a1[5];
    v9 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v16 = 0;
    v10 = -[VCPImageCaptionAnalyzer analyzeEmbedding:flags:results:cancel:](v6, "analyzeEmbedding:flags:results:cancel:", v9, 0, &v16, v8);
    v11 = v16;
    if (!(_DWORD)v10)
    {
      objc_msgSend(*(id *)(a1[4] + 16), "vcp_addEntriesFromResults:", v11);
      VCPSignPostLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)v15 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_END, v3, "VCPCSUImageCaptionAnalyzer", ", v15, 2u);
      }

      v10 = 0;
    }
  }
  else
  {
    v11 = 0;
    v10 = 4294967278;
  }

  return v10;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_424(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t *v6;
  uint64_t v7;
  VCPImageCaptionAnalyzer *v8;
  VCPImageCaptionAnalyzer *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[8];
  id v16;
  uint8_t buf[16];

  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPCSUImageCaptionAnalyzer", ", buf, 2u);
  }

  if (objc_msgSend(*(id *)(a1[4] + 48), "isPano"))
    v6 = (uint64_t *)(*(_QWORD *)(a1[6] + 8) + 48);
  else
    v6 = a1 + 7;
  v7 = *v6;
  v8 = -[VCPImageCaptionAnalyzer initWithCaptionModelType:captionSafetyType:]([VCPImageCaptionAnalyzer alloc], "initWithCaptionModelType:captionSafetyType:", 3, 0);
  v9 = v8;
  if (v8)
  {
    v16 = 0;
    v10 = -[VCPImageCaptionAnalyzer analyzePixelBuffer:flags:results:cancel:](v8, "analyzePixelBuffer:flags:results:cancel:", v7, 0, &v16, a1[5]);
    v11 = v16;
    if (!(_DWORD)v10)
    {
      objc_msgSend(*(id *)(a1[4] + 16), "vcp_addEntriesFromResults:", v11);
      VCPSignPostLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)v15 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_END, v3, "VCPCSUImageCaptionAnalyzer", ", v15, 2u);
      }

      v10 = 0;
    }
  }
  else
  {
    v11 = 0;
    v10 = 4294967278;
  }

  return v10;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_425(_QWORD *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  VCPImageCaptionAnalyzer *v6;
  VCPImageCaptionAnalyzer *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[8];
  id v16;
  uint8_t buf[16];

  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPPhotoAnalyzer_Image_VCPImageCaptionAnalyzer", ", buf, 2u);
  }

  v6 = -[VCPImageCaptionAnalyzer initWithCaptionModelType:captionSafetyType:]([VCPImageCaptionAnalyzer alloc], "initWithCaptionModelType:captionSafetyType:", 1, 0);
  v7 = v6;
  if (v6)
  {
    v8 = a1[5];
    v9 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 48);
    v16 = 0;
    v10 = -[VCPImageCaptionAnalyzer analyzePixelBuffer:flags:results:cancel:](v6, "analyzePixelBuffer:flags:results:cancel:", v9, 0, &v16, v8);
    v11 = v16;
    if (!(_DWORD)v10)
    {
      objc_msgSend(*(id *)(a1[4] + 16), "vcp_addEntriesFromResults:", v11);
      VCPSignPostLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)v15 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_END, v3, "VCPPhotoAnalyzer_Image_VCPImageCaptionAnalyzer", ", v15, 2u);
      }

      v10 = 0;
    }
  }
  else
  {
    v11 = 0;
    v10 = 4294967278;
  }

  return v10;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_427(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint8_t v17[16];
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPPhotoAnalyzer_Image_VCPImageDescriptor", ", v17, 2u);
  }

  +[VCPImageDescriptor descriptorWithImage:](VCPImageDescriptor, "descriptorWithImage:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  VCPSignPostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v8, OS_SIGNPOST_INTERVAL_END, v3, "VCPPhotoAnalyzer_Image_VCPImageDescriptor", ", v17, 2u);
  }

  if (v6)
  {
    objc_msgSend(v6, "serialize");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      v19 = v9;
      v20 = CFSTR("attributes");
      v18 = CFSTR("featureVector");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "vcp_setResult:forKey:", v14, CFSTR("FeatureVectorResults"));

      v15 = 0;
    }
    else
    {
      v15 = 4294967188;
    }

  }
  else
  {
    v15 = 4294967188;
  }

  return v15;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_438(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  size_t Width;
  float v7;
  VCPImageHumanPoseAnalyzer *v8;
  _BOOL8 v9;
  double v10;
  void *v11;
  VCPImageHumanPoseAnalyzer *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t v20[8];
  id v21;
  uint8_t buf[16];

  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPPhotoAnalyzer_Image_VCPImageHumanPoseAnalyzer", ", buf, 2u);
  }

  Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 48));
  v7 = (float)Width / (float)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 48));
  v8 = [VCPImageHumanPoseAnalyzer alloc];
  v9 = +[VCPImageHumanPoseAnalyzer saveKeypoints](VCPImageHumanPoseAnalyzer, "saveKeypoints");
  *(float *)&v10 = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[VCPImageHumanPoseAnalyzer initWithKeypointsOption:aspectRatio:lightweight:forceCPU:sharedModel:flushModel:](v8, "initWithKeypointsOption:aspectRatio:lightweight:forceCPU:sharedModel:flushModel:", v9, v11, 0, 0, 1, 0);

  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 56);
  v21 = 0;
  v15 = -[VCPImageHumanPoseAnalyzer analyzePixelBuffer:flags:results:cancel:](v12, "analyzePixelBuffer:flags:results:cancel:", v13, v14, &v21, *(_QWORD *)(a1 + 40));
  v16 = v21;
  if (!(_DWORD)v15)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "vcp_addEntriesFromResults:", v16);
    VCPSignPostLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v18, OS_SIGNPOST_INTERVAL_END, v3, "VCPPhotoAnalyzer_Image_VCPImageHumanPoseAnalyzer", ", v20, 2u);
    }

  }
  return v15;
}

uint64_t __58__VCPPhotoAnalyzer_analyzeImage_performedAnalyses_cancel___block_invoke_441(_QWORD *a1)
{
  VCPImageHumanActionAnalyzer *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  VCPImageHumanActionAnalyzer *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v12;

  v2 = [VCPImageHumanActionAnalyzer alloc];
  v3 = a1[4];
  objc_msgSend(*(id *)(a1[5] + 16), "vcp_results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HumanActionClassificationResults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VCPImageHumanActionAnalyzer initWithPHFaces:existingResults:](v2, "initWithPHFaces:existingResults:", v3, v5);

  if (v6)
  {
    v7 = a1[7];
    v8 = a1[8];
    v12 = 0;
    v9 = -[VCPImageHumanActionAnalyzer analyzePixelBuffer:flags:results:cancel:](v6, "analyzePixelBuffer:flags:results:cancel:", v7, v8, &v12, a1[6]);
    v10 = v12;
    if (!(_DWORD)v9)
    {
      objc_msgSend(*(id *)(a1[5] + 16), "vcp_addEntriesFromResults:", v10);
      v9 = 0;
    }
  }
  else
  {
    v10 = 0;
    v9 = 4294967188;
  }

  return v9;
}

- (id)analyzeAsset:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  PHAsset *phAsset;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  VCPPhotosQuickFaceDetectionManager *v19;
  void *v20;
  VCPPhotosQuickFaceDetectionManager *v21;
  int v22;
  char v23;
  void *v24;
  VCPExifAnalyzer *v25;
  VCPExifAnalyzer *v26;
  int v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  VCPAsset *asset;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  os_signpost_id_t v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  int v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  NSMutableDictionary *analysis;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  BOOL v54;
  NSMutableDictionary *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  BOOL v60;
  NSMutableDictionary *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  BOOL v66;
  NSMutableDictionary *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  double v78;
  VCPImageQualityAnalyzer *v79;
  void *v80;
  _BOOL4 v81;
  NSMutableDictionary *v82;
  float v83;
  void *v84;
  BOOL v85;
  NSObject *v86;
  os_signpost_id_t v87;
  NSObject *v88;
  NSObject *v89;
  VCPEffectsAnalyzer *v90;
  void *v91;
  NSObject *v92;
  VCPAsset *v93;
  id v94;
  void *v95;
  id v96;
  NSObject *v97;
  NSObject *v98;
  unint64_t requestedAnalyses;
  NSObject *v100;
  NSObject *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  VCPFaceAnalyzer *v105;
  id v106;
  NSObject *v107;
  os_signpost_id_t v108;
  NSObject *v109;
  NSObject *v110;
  VCPParallaxAnalyzer *v111;
  void *v112;
  VCPParallaxAnalyzer *v113;
  PHAsset *v114;
  id v115;
  void *v116;
  NSObject *v117;
  NSObject *v118;
  NSObject *v119;
  os_signpost_id_t v120;
  NSObject *v121;
  NSObject *v122;
  VCPParallaxAnalyzer *v123;
  void *v124;
  VCPParallaxAnalyzer *v125;
  PHAsset *v126;
  id v127;
  void *v128;
  NSObject *v129;
  NSObject *v130;
  NSObject *v131;
  os_signpost_id_t v132;
  NSObject *v133;
  NSObject *v134;
  VCPWatchFaceAnalyzer *v135;
  VCPWatchFaceAnalyzer *v136;
  PHAsset *v137;
  id v138;
  void *v139;
  int64_t v140;
  NSObject *v141;
  NSObject *v142;
  NSObject *v143;
  NSObject *v144;
  NSObject *v145;
  os_signpost_id_t v146;
  NSObject *v147;
  NSObject *v148;
  VCPLivePhotoKeyFrameAnalyzer *v149;
  NSMutableDictionary *v150;
  int v151;
  int v152;
  int v153;
  int v154;
  float imageBlurTextureScore;
  _BOOL8 v156;
  double v157;
  double v158;
  double v159;
  NSMutableDictionary *v160;
  NSObject *v161;
  NSObject *v162;
  NSMutableDictionary *v163;
  void *v165;
  void *v166;
  BOOL v167;
  void *v168;
  void *v169;
  void *v170;
  unint64_t i;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  BOOL v178;
  void *v179;
  void *v180;
  void *v181;
  NSMutableDictionary *v182;
  NSObject *v183;
  void *v184;
  void *v185;
  BOOL v186;
  void *v187;
  void *v188;
  BOOL v189;
  void *v190;
  void *v191;
  BOOL v192;
  void *v193;
  void *v194;
  void *v195;
  unint64_t j;
  void *v197;
  void *v198;
  NSMutableDictionary *v199;
  void *v200;
  _BOOL4 v201;
  uint64_t v202;
  NSObject *v203;
  char *v204;
  void *v205;
  int v206;
  os_signpost_id_t spid;
  unint64_t v208;
  id v209;
  id v210;
  id v211;
  id v212;
  id v213;
  id v214;
  uint8_t v215[16];
  uint64_t v216;
  uint64_t v217;
  uint8_t buf[8];
  _QWORD v219[3];

  v219[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_status != 1)
    goto LABEL_167;
  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  spid = v9;
  v208 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPPhotoAnalyzer", ", buf, 2u);
  }

  v217 = 0;
  *(_QWORD *)buf = 0;
  v12 = -[NSMutableDictionary vcp_flags](self->_analysis, "vcp_flags");
  v216 = 0;
  v217 = v12;
  if ((self->_requestedAnalyses & 8) != 0
    && objc_msgSend(MEMORY[0x1E0CD1398], "vcp_usePHFace")
    && objc_msgSend(MEMORY[0x1E0CD1398], "vcp_usePHFaceExpression")
    && self->_phFaceResults)
  {
    -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:");
    v217 |= self->_phFaceFlags;
    *(_QWORD *)buf |= 0xCuLL;
  }
  if (self->_requirePHFaceAnalysis
    && (phAsset = self->_phAsset) != 0
    && !-[PHAsset vcp_quickFaceClassificationDone](phAsset, "vcp_quickFaceClassificationDone"))
  {
    v14 = (void *)MEMORY[0x1BCCA1B2C]();
    VCPSignPostLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_signpost_id_generate(v15);

    VCPSignPostLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)v215 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VCPPhotoAnalyzer_VCPPhotosQuickFaceDetection", ", v215, 2u);
    }

    v19 = [VCPPhotosQuickFaceDetectionManager alloc];
    -[PHAsset photoLibrary](self->_phAsset, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[VCPPhotosQuickFaceDetectionManager initWithPhotoLibrary:](v19, "initWithPhotoLibrary:", v20);

    if (v21)
    {
      v22 = -[VCPPhotosQuickFaceDetectionManager processAsset:](v21, "processAsset:", self->_phAsset);
      if (v22)
      {
        v206 = v22;
        v23 = 0;
      }
      else
      {
        VCPSignPostLog();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          *(_WORD *)v215 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v30, OS_SIGNPOST_INTERVAL_END, v16, "VCPPhotoAnalyzer_VCPPhotosQuickFaceDetection", ", v215, 2u);
        }

        v206 = 0;
        v23 = 1;
      }
    }
    else
    {
      v23 = 0;
      v206 = -18;
    }

    objc_autoreleasePoolPop(v14);
    v27 = v206;
    if ((v23 & 1) == 0)
    {
LABEL_139:
      if (!v27)
        goto LABEL_163;
      goto LABEL_140;
    }
  }
  else
  {
    v206 = 0;
  }
  if ((self->_requestedAnalyses & 0xC) == 4)
  {
    if (self->_phFaceResults)
    {
      -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:");
      v217 |= self->_phFaceFlags;
      *(_QWORD *)buf |= 4uLL;
    }
    else
    {
      -[VCPAsset exif](self->_asset, "exif");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = -[VCPExifAnalyzer initWithProperties:forAnalysisTypes:]([VCPExifAnalyzer alloc], "initWithProperties:forAnalysisTypes:", v24, self->_requestedAnalyses);
        v26 = v25;
        if (!v25)
        {

          goto LABEL_161;
        }
        v214 = 0;
        v27 = -[VCPExifAnalyzer analyzeAsset:results:](v25, "analyzeAsset:results:", &v217, &v214);
        v28 = v214;
        if (v27)
        {

          goto LABEL_139;
        }
        -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v28);
        *(_QWORD *)buf |= 4uLL;

      }
    }
  }
  if (self->_irisAnalyses)
  {
    if (-[VCPAsset isMovieResourceLocalAvailable](self->_asset, "isMovieResourceLocalAvailable")
      || -[VCPPhotoAnalyzer allowStreaming](self, "allowStreaming"))
    {
      asset = self->_asset;
      -[VCPPhotoAnalyzer existingAnalysisForMovieAnalyzer](self, "existingAnalysisForMovieAnalyzer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[VCPMovieAnalyzer analyzerWithVCPAsset:withExistingAnalysis:forAnalysisTypes:withOptions:](VCPMovieAnalyzer, "analyzerWithVCPAsset:withExistingAnalysis:forAnalysisTypes:withOptions:", asset, v32, self->_irisAnalyses, v7);
      v33 = objc_claimAutoreleasedReturnValue();

      v27 = -[VCPPhotoAnalyzer checkFaceDominant](self, "checkFaceDominant");
      if (v27)
      {

        goto LABEL_139;
      }
      -[NSObject setFaceDominated:](v33, "setFaceDominated:", self->_faceDominated);
      -[NSObject setAllowStreaming:](v33, "setAllowStreaming:", -[VCPPhotoAnalyzer allowStreaming](self, "allowStreaming"));
      -[NSObject setOnDemand:](v33, "setOnDemand:", -[VCPPhotoAnalyzer onDemand](self, "onDemand"));
      if (!v33)
        goto LABEL_161;
      VCPSignPostLog();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = os_signpost_id_generate(v34);

      VCPSignPostLog();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        *(_WORD *)v215 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v35, "VCPPhotoAnalyzer_VCPMovieAnalyzer", ", v215, 2u);
      }

      -[NSObject analyzeAsset:streamed:](v33, "analyzeAsset:streamed:", v6, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      VCPSignPostLog();
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_WORD *)v215 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v40, OS_SIGNPOST_INTERVAL_END, v35, "VCPPhotoAnalyzer_VCPMovieAnalyzer", ", v215, 2u);
      }

      if (-[NSObject status](v33, "status") == 4)
      {
        v27 = -128;
LABEL_93:

        goto LABEL_139;
      }
      if (-[NSObject status](v33, "status") != 2)
      {
        v27 = -18;
        goto LABEL_93;
      }
      v42 = objc_msgSend(v38, "vcp_flags");
      v217 |= v42 & 0x20000000;
      v43 = objc_msgSend(v38, "vcp_types");
      v44 = objc_alloc(MEMORY[0x1E0C99E08]);
      objc_msgSend(v38, "vcp_results");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v205 = (void *)objc_msgSend(v44, "initWithDictionary:", v45);

      if (!v205)
      {

        v27 = -108;
LABEL_140:
        v140 = 3;
        if (v27 == -128)
          v140 = 4;
        goto LABEL_162;
      }
      objc_msgSend(v205, "removeObjectForKey:", CFSTR("FaceResults"));
      objc_msgSend(v205, "removeObjectForKey:", CFSTR("FacePrintResults"));
      objc_msgSend(v205, "removeObjectForKey:", CFSTR("FeatureVectorResults"));
      objc_msgSend(v205, "removeObjectForKey:", CFSTR("SceneprintResults"));
      objc_msgSend(v205, "removeObjectForKey:", CFSTR("SaliencyResults"));
      objc_msgSend(v205, "removeObjectForKey:", CFSTR("HumanPoseResults"));
      -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v205);
      *(_QWORD *)buf |= v43 & 0xFFFFFFFFFFBFE7F3;
      -[NSObject privateResults](v33, "privateResults");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("MetaFocusResults"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47 == 0;

      if (!v48)
      {
        analysis = self->_analysis;
        -[NSObject privateResults](v33, "privateResults");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("MetaFocusResults"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary vcp_setResult:forKey:](analysis, "vcp_setResult:forKey:", v51, CFSTR("MetaFocusResults"));

      }
      -[NSObject privateResults](v33, "privateResults", v205);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("MetaMotionResults"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53 == 0;

      if (!v54)
      {
        v55 = self->_analysis;
        -[NSObject privateResults](v33, "privateResults");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("MetaMotionResults"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary vcp_setResult:forKey:](v55, "vcp_setResult:forKey:", v57, CFSTR("MetaMotionResults"));

      }
      -[NSObject privateResults](v33, "privateResults");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("MetaItemPTSResultsKey"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v59 == 0;

      if (!v60)
      {
        v61 = self->_analysis;
        -[NSObject privateResults](v33, "privateResults");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("MetaItemPTSResultsKey"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary vcp_setResult:forKey:](v61, "vcp_setResult:forKey:", v63, CFSTR("MetaItemPTSResultsKey"));

      }
      -[NSObject privateResults](v33, "privateResults");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("MetaStabilizationResults"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65 == 0;

      if (!v66)
      {
        v67 = self->_analysis;
        -[NSObject privateResults](v33, "privateResults");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("MetaStabilizationResults"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary vcp_setResult:forKey:](v67, "vcp_setResult:forKey:", v69, CFSTR("MetaStabilizationResults"));

      }
      goto LABEL_66;
    }
    if (self->_irisAnalyses && (int)MediaAnalysisLogLevel() >= 6)
    {
      v33 = MEMORY[0x1E0C81028];
      v41 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v215 = 0;
        _os_log_impl(&dword_1B6C4A000, v33, OS_LOG_TYPE_INFO, "Live Photo w/o local movie resource and streaming not allowed, skip paired movie analysis", v215, 2u);
      }
LABEL_66:

    }
  }
  if ((self->_requestedAnalyses & 0x32821424A3B08 & (~*(_QWORD *)buf | 0x3280140000000)) != 0
    || (self->_irisAnalyses & 0x40080) != 0)
  {
    v27 = -[VCPPhotoAnalyzer analyzeImage:performedAnalyses:cancel:](self, "analyzeImage:performedAnalyses:cancel:", &v217, buf, v6);
    if (v27)
      goto LABEL_139;
    -[NSMutableDictionary vcp_removeResultForKey:](self->_analysis, "vcp_removeResultForKey:", CFSTR("IrisObjectsResults"));
    -[NSMutableDictionary vcp_removeResultForKey:](self->_analysis, "vcp_removeResultForKey:", CFSTR("MetaItemPTSResultsKey"));
    -[NSMutableDictionary vcp_removeResultForKey:](self->_analysis, "vcp_removeResultForKey:", CFSTR("MetaStabilizationResults"));
  }
  else
  {
    -[VCPAsset exif](self->_asset, "exif");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v70;
    if (v70)
    {
      objc_msgSend(v70, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v73;
      if (!v72 || !v73)
      {

        goto LABEL_161;
      }
      v75 = objc_msgSend(v72, "unsignedIntegerValue");
      v76 = objc_msgSend(v74, "unsignedIntegerValue");
      if (v75 <= v76)
        v77 = v76;
      else
        v77 = v75;
      -[VCPPhotoAnalyzer updateDegradedFlagForMajorDimension:](self, "updateDegradedFlagForMajorDimension:", v77);

    }
  }
  -[NSMutableDictionary vcp_quality](self->_analysis, "vcp_quality");
  if (v78 == -1.0)
  {
    v79 = objc_alloc_init(VCPImageQualityAnalyzer);
    -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPAsset photoOffsetSeconds](self->_asset, "photoOffsetSeconds");
    v81 = -[VCPImageQualityAnalyzer analyzeImageQuality:irisPhotoOffsetSec:cancel:](v79, "analyzeImageQuality:irisPhotoOffsetSec:cancel:", v80, v6) == 0;

    if (v81)
    {
      v82 = self->_analysis;
      -[VCPImageQualityAnalyzer qualityScore](v79, "qualityScore");
      -[NSMutableDictionary vcp_setQuality:](v82, "vcp_setQuality:", v83);
    }

  }
  if ((self->_requestedAnalyses & 0x100000) != 0 && -[VCPAsset isLivePhoto](self->_asset, "isLivePhoto"))
  {
    -[VCPAsset originalMovie](self->_asset, "originalMovie");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v84 == 0;

    if (v85)
    {
      if ((int)MediaAnalysisLogLevel() < 4)
        goto LABEL_104;
      v92 = MEMORY[0x1E0C81028];
      v96 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v215 = 0;
        _os_log_impl(&dword_1B6C4A000, v92, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] PhotoAnalyzer - Original movie is not available, skip effects analysis", v215, 2u);
      }
    }
    else
    {
      VCPSignPostLog();
      v86 = objc_claimAutoreleasedReturnValue();
      v87 = os_signpost_id_generate(v86);

      VCPSignPostLog();
      v88 = objc_claimAutoreleasedReturnValue();
      v89 = v88;
      if (v87 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
      {
        *(_WORD *)v215 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v89, OS_SIGNPOST_INTERVAL_BEGIN, v87, "VCPPhotoAnalyzer_VCPEffectsAnalyzer", ", v215, 2u);
      }

      v90 = [VCPEffectsAnalyzer alloc];
      -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = -[VCPEffectsAnalyzer initWithAnalysisResults:](v90, "initWithAnalysisResults:", v91);

      if (!v92)
        goto LABEL_161;
      v93 = self->_asset;
      v213 = 0;
      v27 = -[NSObject analyzeAsset:onDemand:cancel:statsFlags:results:](v92, "analyzeAsset:onDemand:cancel:statsFlags:results:", v93, 0, v6, &v216, &v213);
      v94 = v213;
      v95 = v94;
      if (v27)
      {

        goto LABEL_139;
      }
      -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v94);
      *(_QWORD *)buf |= 0x100000uLL;
      VCPSignPostLog();
      v97 = objc_claimAutoreleasedReturnValue();
      v98 = v97;
      if (v87 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v97))
      {
        *(_WORD *)v215 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v98, OS_SIGNPOST_INTERVAL_END, v87, "VCPPhotoAnalyzer_VCPEffectsAnalyzer", ", v215, 2u);
      }

    }
  }
LABEL_104:
  requestedAnalyses = self->_requestedAnalyses;
  if ((requestedAnalyses & 0x800000000) != 0)
  {
    VCPSignPostLog();
    v107 = objc_claimAutoreleasedReturnValue();
    v108 = os_signpost_id_generate(v107);

    VCPSignPostLog();
    v109 = objc_claimAutoreleasedReturnValue();
    v110 = v109;
    if (v108 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
    {
      *(_WORD *)v215 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v110, OS_SIGNPOST_INTERVAL_BEGIN, v108, "VCPPhotoAnalyzer_VCPParallaxAnalyzer", ", v215, 2u);
    }

    v111 = [VCPParallaxAnalyzer alloc];
    -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = -[VCPParallaxAnalyzer initWithOptions:andExistingResults:](v111, "initWithOptions:andExistingResults:", v7, v112);

    if (!v113)
      goto LABEL_161;
    v114 = self->_phAsset;
    v212 = 0;
    v27 = -[VCPParallaxAnalyzer analyzeAsset:cancel:results:](v113, "analyzeAsset:cancel:results:", v114, v6, &v212);
    v115 = v212;
    v116 = v115;
    if (v27)
    {

      goto LABEL_139;
    }
    -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v115);
    *(_QWORD *)buf |= 0x800000000uLL;
    VCPSignPostLog();
    v117 = objc_claimAutoreleasedReturnValue();
    v118 = v117;
    if (v108 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v117))
    {
      *(_WORD *)v215 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v118, OS_SIGNPOST_INTERVAL_END, v108, "VCPPhotoAnalyzer_VCPParallaxAnalyzer", ", v215, 2u);
    }

    requestedAnalyses = self->_requestedAnalyses;
    if ((requestedAnalyses & 0x8000000000) == 0)
    {
LABEL_106:
      if ((requestedAnalyses & 0x400000000000) == 0)
        goto LABEL_107;
LABEL_133:
      VCPSignPostLog();
      v131 = objc_claimAutoreleasedReturnValue();
      v132 = os_signpost_id_generate(v131);

      VCPSignPostLog();
      v133 = objc_claimAutoreleasedReturnValue();
      v134 = v133;
      if (v132 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v133))
      {
        *(_WORD *)v215 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v134, OS_SIGNPOST_INTERVAL_BEGIN, v132, "VCPPhotoAnalyzer_VCPWatchFaceAnalyzer", ", v215, 2u);
      }

      v135 = -[VCPWatchFaceAnalyzer initWithOptions:]([VCPWatchFaceAnalyzer alloc], "initWithOptions:", v7);
      v136 = v135;
      if (!v135)
        goto LABEL_161;
      v137 = self->_phAsset;
      v210 = 0;
      v27 = -[VCPWatchFaceAnalyzer analyzeAsset:cancel:results:](v135, "analyzeAsset:cancel:results:", v137, v6, &v210);
      v138 = v210;
      v139 = v138;
      if (v27)
      {

        goto LABEL_139;
      }
      -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v138);
      *(_QWORD *)buf |= 0x400000000000uLL;
      VCPSignPostLog();
      v141 = objc_claimAutoreleasedReturnValue();
      v142 = v141;
      if (v132 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v141))
      {
        *(_WORD *)v215 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v142, OS_SIGNPOST_INTERVAL_END, v132, "VCPPhotoAnalyzer_VCPWatchFaceAnalyzer", ", v215, 2u);
      }

      if ((self->_requestedAnalyses & 0x1000000000) == 0)
        goto LABEL_152;
      goto LABEL_108;
    }
  }
  else if ((requestedAnalyses & 0x8000000000) == 0)
  {
    goto LABEL_106;
  }
  VCPSignPostLog();
  v119 = objc_claimAutoreleasedReturnValue();
  v120 = os_signpost_id_generate(v119);

  VCPSignPostLog();
  v121 = objc_claimAutoreleasedReturnValue();
  v122 = v121;
  if (v120 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v121))
  {
    *(_WORD *)v215 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v122, OS_SIGNPOST_INTERVAL_BEGIN, v120, "VCPPhotoAnalyzer_VCPParallaxExport", ", v215, 2u);
  }

  v123 = [VCPParallaxAnalyzer alloc];
  -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = -[VCPParallaxAnalyzer initWithOptions:andExistingResults:](v123, "initWithOptions:andExistingResults:", v7, v124);

  if (!v125)
    goto LABEL_161;
  v126 = self->_phAsset;
  v211 = 0;
  v27 = -[VCPParallaxAnalyzer exportWallpaperForAsset:cancel:results:](v125, "exportWallpaperForAsset:cancel:results:", v126, v6, &v211);
  v127 = v211;
  v128 = v127;
  if (v27)
  {

    goto LABEL_139;
  }
  -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v127);
  *(_QWORD *)buf |= 0x8000000000uLL;
  VCPSignPostLog();
  v129 = objc_claimAutoreleasedReturnValue();
  v130 = v129;
  if (v120 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v129))
  {
    *(_WORD *)v215 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v130, OS_SIGNPOST_INTERVAL_END, v120, "VCPPhotoAnalyzer_VCPParallaxExport", ", v215, 2u);
  }

  requestedAnalyses = self->_requestedAnalyses;
  if ((requestedAnalyses & 0x400000000000) != 0)
    goto LABEL_133;
LABEL_107:
  if ((requestedAnalyses & 0x1000000000) != 0)
  {
LABEL_108:
    VCPSignPostLog();
    v100 = objc_claimAutoreleasedReturnValue();
    v204 = (char *)os_signpost_id_generate(v100);

    VCPSignPostLog();
    v101 = objc_claimAutoreleasedReturnValue();
    v102 = v101;
    if ((unint64_t)(v204 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
    {
      *(_WORD *)v215 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v102, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v204, "VCPPhotoAnalyzer_VCPFaceQualityAnalysis", ", v215, 2u);
    }

    -[PHAsset photoLibrary](self->_phAsset, "photoLibrary");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:](VCPPhotosFaceProcessingContext, "contextWithPhotoLibrary:", v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    v105 = -[VCPFaceAnalyzer initWithContext:]([VCPFaceAnalyzer alloc], "initWithContext:", v104);
    v209 = 0;
    v27 = -[VCPFaceAnalyzer analyzeFaceQuality:withAsset:andCancelBlock:](v105, "analyzeFaceQuality:withAsset:andCancelBlock:", &v209, self->_phAsset, v6);
    v106 = v209;
    if (v27)
    {

      goto LABEL_139;
    }
    -[NSMutableDictionary vcp_addEntriesFromResults:](self->_analysis, "vcp_addEntriesFromResults:", v106);
    *(_QWORD *)buf |= 0x1000000000uLL;
    VCPSignPostLog();
    v143 = objc_claimAutoreleasedReturnValue();
    v144 = v143;
    if ((unint64_t)(v204 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v143))
    {
      *(_WORD *)v215 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v144, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v204, "VCPPhotoAnalyzer_VCPFaceQualityAnalysis", ", v215, 2u);
    }

  }
LABEL_152:
  if (!+[VCPPhotoAnalyzer isLivePhotoKeyFrameEnabled](VCPPhotoAnalyzer, "isLivePhotoKeyFrameEnabled", v204)|| (self->_requestedAnalyses & 0x40000) == 0|| !-[VCPAsset isLivePhoto](self->_asset, "isLivePhoto"))
  {
    -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "objectForKeyedSubscript:");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = v166 == 0;

    if (!v167)
    {
      -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "objectForKeyedSubscript:", CFSTR("FaceResults"));
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      v170 = (void *)objc_msgSend(v169, "mutableCopy");

      for (i = 0; objc_msgSend(v170, "count") > i; ++i)
      {
        objc_msgSend(v170, "objectAtIndexedSubscript:", i);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        v173 = (void *)objc_msgSend(v172, "mutableCopy");

        objc_msgSend(v173, "objectForKeyedSubscript:", CFSTR("attributes"));
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        v175 = (void *)objc_msgSend(v174, "mutableCopy");

        objc_msgSend(v175, "removeObjectForKey:", CFSTR("faceQuality"));
        objc_msgSend(v173, "setObject:forKey:", v175, CFSTR("attributes"));
        objc_msgSend(v170, "setObject:atIndexedSubscript:", v173, i);

      }
      -[NSMutableDictionary vcp_setResult:forKey:](self->_analysis, "vcp_setResult:forKey:", v170, CFSTR("FaceResults"));

    }
    -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "objectForKeyedSubscript:", CFSTR("ExposureResults"));
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = v177 == 0;

    if (v178)
    {
LABEL_176:
      -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("MetaFocusResults"));
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      v186 = v185 == 0;

      if (!v186)
        -[NSMutableDictionary vcp_removeResultForKey:](self->_analysis, "vcp_removeResultForKey:", CFSTR("MetaFocusResults"));
      -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "objectForKeyedSubscript:", CFSTR("MetaMotionResults"));
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      v189 = v188 == 0;

      if (!v189)
        -[NSMutableDictionary vcp_removeResultForKey:](self->_analysis, "vcp_removeResultForKey:", CFSTR("MetaMotionResults"));
      -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "objectForKeyedSubscript:", CFSTR("CameraMotionResults"));
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      v192 = v191 == 0;

      if (!v192)
      {
        -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v193, "objectForKeyedSubscript:", CFSTR("CameraMotionResults"));
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        v195 = (void *)objc_msgSend(v194, "mutableCopy");

        for (j = 0; objc_msgSend(v195, "count") > j; ++j)
        {
          objc_msgSend(v195, "objectAtIndexedSubscript:", j);
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          v198 = (void *)objc_msgSend(v197, "mutableCopy");

          objc_msgSend(v198, "removeObjectForKey:", CFSTR("quality"));
          objc_msgSend(v195, "setObject:atIndexedSubscript:", v198, j);

        }
        -[NSMutableDictionary vcp_setResult:forKey:](self->_analysis, "vcp_setResult:forKey:", v195, CFSTR("CameraMotionResults"));

      }
      v199 = self->_analysis;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v199, "setObject:forKey:", v200, CFSTR("dateAnalyzed"));

      -[NSMutableDictionary vcp_addTypes:](self->_analysis, "vcp_addTypes:", *(_QWORD *)buf);
      -[NSMutableDictionary vcp_addFlags:](self->_analysis, "vcp_addFlags:", v217);
      v201 = -[VCPAsset isLivePhoto](self->_asset, "isLivePhoto");
      v202 = 1;
      if (v201)
        v202 = 2;
      v216 |= v202;
      -[NSMutableDictionary vcp_addStatsFlags:](self->_analysis, "vcp_addStatsFlags:");
      self->_status = 2;
      v27 = v206;
      if (!v206)
        goto LABEL_163;
      goto LABEL_140;
    }
    -[NSMutableDictionary vcp_results](self->_analysis, "vcp_results");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "objectForKeyedSubscript:", CFSTR("ExposureResults"));
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "objectAtIndexedSubscript:", 0);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = (VCPLivePhotoKeyFrameAnalyzer *)objc_msgSend(v181, "mutableCopy");

    -[VCPLivePhotoKeyFrameAnalyzer removeObjectForKey:](v149, "removeObjectForKey:", CFSTR("attributes"));
    v182 = self->_analysis;
    v219[0] = v149;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v219, 1);
    v183 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary vcp_setResult:forKey:](v182, "vcp_setResult:forKey:", v183, CFSTR("ExposureResults"));
LABEL_175:

    goto LABEL_176;
  }
  VCPSignPostLog();
  v145 = objc_claimAutoreleasedReturnValue();
  v146 = os_signpost_id_generate(v145);

  VCPSignPostLog();
  v147 = objc_claimAutoreleasedReturnValue();
  v148 = v147;
  if (v146 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v147))
  {
    *(_WORD *)v215 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v148, OS_SIGNPOST_INTERVAL_BEGIN, v146, "VCPPhotoAnalyzer_VCPLivePhotoKeyFrameAnalyzer", ", v215, 2u);
  }

  v149 = -[VCPLivePhotoKeyFrameAnalyzer initWithWidth:height:]([VCPLivePhotoKeyFrameAnalyzer alloc], "initWithWidth:height:", -[VCPAsset pixelWidth](self->_asset, "pixelWidth"), -[VCPAsset pixelHeight](self->_asset, "pixelHeight"));
  if (v149)
  {
    v150 = self->_analysis;
    -[VCPAsset photoOffsetSeconds](self->_asset, "photoOffsetSeconds");
    v152 = v151;
    -[VCPAsset originalPhotoOffsetSeconds](self->_asset, "originalPhotoOffsetSeconds");
    v154 = v153;
    imageBlurTextureScore = self->_imageBlurTextureScore;
    v156 = -[VCPAsset hadFlash](self->_asset, "hadFlash");
    LODWORD(v157) = v152;
    LODWORD(v158) = v154;
    *(float *)&v159 = imageBlurTextureScore;
    v27 = -[VCPLivePhotoKeyFrameAnalyzer analyzeLivePhotoKeyFrame:irisPhotoOffsetSec:originalIrisPhotoOffsetSec:photoTextureScore:hadFlash:cancel:](v149, "analyzeLivePhotoKeyFrame:irisPhotoOffsetSec:originalIrisPhotoOffsetSec:photoTextureScore:hadFlash:cancel:", v150, v156, v6, v157, v158, v159);
    if (v27)
    {

      goto LABEL_139;
    }
    -[NSMutableDictionary vcp_removeResultForKey:](self->_analysis, "vcp_removeResultForKey:", CFSTR("KeyFrameBlurResults"));
    VCPSignPostLog();
    v203 = objc_claimAutoreleasedReturnValue();
    v183 = v203;
    if (v146 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v203))
    {
      *(_WORD *)v215 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v183, OS_SIGNPOST_INTERVAL_END, v146, "VCPPhotoAnalyzer_VCPLivePhotoKeyFrameAnalyzer", ", v215, 2u);
    }
    goto LABEL_175;
  }
LABEL_161:
  v140 = 3;
LABEL_162:
  self->_status = v140;
  v160 = self->_analysis;
  self->_analysis = 0;

LABEL_163:
  VCPSignPostLog();
  v161 = objc_claimAutoreleasedReturnValue();
  v162 = v161;
  if (v208 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v161))
  {
    *(_WORD *)v215 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v162, OS_SIGNPOST_INTERVAL_END, spid, "VCPPhotoAnalyzer", ", v215, 2u);
  }

LABEL_167:
  v163 = self->_analysis;

  return v163;
}

- (BOOL)allowStreaming
{
  return self->_allowStreaming;
}

- (void)setAllowStreaming:(BOOL)a3
{
  self->_allowStreaming = a3;
}

- (BOOL)onDemand
{
  return self->_onDemand;
}

- (void)setOnDemand:(BOOL)a3
{
  self->_onDemand = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedContext, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.pool_.value_);
  objc_storeStrong((id *)&self->_phAsset, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_phFaceResults, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_DWORD *)self + 24) = 0;
  return self;
}

@end
