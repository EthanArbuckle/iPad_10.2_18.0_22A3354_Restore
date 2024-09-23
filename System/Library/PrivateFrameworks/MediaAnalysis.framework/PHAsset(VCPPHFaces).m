@implementation PHAsset(VCPPHFaces)

+ (uint64_t)vcp_usePHFace
{
  return 1;
}

+ (uint64_t)vcp_usePHFaceExpression
{
  return 0;
}

+ (float)mad_peopleThreshold
{
  return 0.8;
}

- (uint64_t)vcp_flagsForPHFace:()VCPPHFaces withFaceRect:
{
  id v9;
  uint64_t v10;
  double v11;

  v9 = a7;
  if (objc_msgSend(v9, "hasSmile"))
    v10 = 2;
  else
    v10 = 0;
  if (objc_msgSend(v9, "isLeftEyeClosed") && objc_msgSend(v9, "isRightEyeClosed"))
  {
    v10 |= 4uLL;
  }
  else if ((objc_msgSend(v9, "isLeftEyeClosed") & 1) != 0 || objc_msgSend(v9, "isRightEyeClosed"))
  {
    v10 |= 8uLL;
  }
  if (a3 >= a4)
    v11 = a3;
  else
    v11 = a4;
  if (v11 >= 0.449999988)
    v10 |= 0x10uLL;

  return v10;
}

- (double)vcp_faceRectFrom:()VCPPHFaces
{
  id v4;
  double v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  objc_msgSend(v4, "size");
  v7 = objc_msgSend(a1, "pixelWidth");
  if (v7 >= objc_msgSend(a1, "pixelHeight"))
  {
    objc_msgSend(a1, "pixelWidth");
    objc_msgSend(a1, "pixelHeight");
  }
  else
  {
    v8 = objc_msgSend(a1, "pixelHeight");
    v6 = v6 * (float)((float)v8 / (float)(unint64_t)objc_msgSend(a1, "pixelWidth"));
  }
  objc_msgSend(v4, "centerX");
  v10 = v9;
  objc_msgSend(v4, "centerX");
  v12 = v11;
  objc_msgSend(v4, "centerY");
  objc_msgSend(v4, "centerY");
  objc_msgSend(v4, "centerX");
  v14 = v13;
  objc_msgSend(v4, "centerY");
  v15 = 1.0 - v12;
  if (1.0 - v12 >= v10)
    v15 = v10;
  v16 = v15 + v15;
  if (v16 < v6)
    v6 = v16;

  return v14 - v6 * 0.5;
}

- (uint64_t)vcp_queryPHFaces:()VCPPHFaces results:
{
  uint64_t v4;
  float v5;
  uint64_t i;
  void *v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v38;
  id obj;
  uint64_t v40;
  void *v42;
  uint64_t v44;
  CGRect v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[3];
  _QWORD v51[3];
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  _QWORD v56[4];
  _QWORD v57[4];
  _QWORD v58[2];
  _QWORD v59[2];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  *a4 = 0;
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInAsset:options:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38 && objc_msgSend(v38, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v38;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
    if (v4)
    {
      v40 = *(_QWORD *)v47;
      v5 = 0.0;
      v44 = 1;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v47 != v40)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          memset(&v45, 0, sizeof(v45));
          objc_msgSend(a1, "vcp_faceRectFrom:", v7);
          v45.origin.x = v10;
          v45.origin.y = v11;
          v45.size.width = v8;
          v45.size.height = v9;
          if (v8 >= v9)
            v12 = v8;
          else
            v12 = v9;
          v13 = v12;
          if (v5 < v13)
            v5 = v13;
          v14 = objc_msgSend(a1, "vcp_flagsForPHFace:withFaceRect:", v7);
          v15 = MediaAnalysisFacePosition(&v45);
          objc_msgSend(v7, "poseYaw");
          *(float *)&v16 = v16;
          v17 = MediaAnalysisPoseYawFromRadian(*(float *)&v16);
          objc_msgSend(v7, "quality");
          v19 = v44;
          if (v44)
            v20 = v18 == -1.0;
          else
            v20 = 0;
          if (v20)
            v19 = 0;
          v44 = v19;
          v58[0] = CFSTR("flags");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v59[0] = v21;
          v58[1] = CFSTR("attributes");
          v56[0] = CFSTR("faceQuality");
          v22 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v7, "quality");
          objc_msgSend(v22, "numberWithDouble:");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v57[0] = v23;
          v56[1] = CFSTR("facePosition");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v57[1] = v24;
          v56[2] = CFSTR("faceBounds");
          NSStringFromRect(v45);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v57[2] = v25;
          v56[3] = CFSTR("facePoseYaw");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v57[3] = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 4);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v59[1] = v27;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v28);

          *a3 |= v14;
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
      }
      while (v4);
      v29 = v5;
    }
    else
    {
      v29 = 0.0;
      v44 = 1;
    }

    if (objc_msgSend(obj, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = MediaAnalysisShotType(v29);
      v54 = CFSTR("attributes");
      v52 = CFSTR("shotType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v32;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v34);

      *a3 |= 0x20uLL;
      v50[0] = CFSTR("FaceResults");
      v50[1] = CFSTR("ShotTypeResults");
      v51[0] = v42;
      v51[1] = v30;
      v50[2] = CFSTR("FaceQualityFlag");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v44);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v51[2] = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return 0;
}

- (id)vcp_PHFaces:()VCPPHFaces
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIncludeTorsoOnlyDetectionData:", 1);
  if (objc_msgSend(MEMORY[0x1E0CD16F0], "mad_clusterVideoFaces"))
    objc_msgSend(v6, "setIncludeMediaAnalysisProcessingRangeTypes:", 3);
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v6, "setFetchPropertySets:", v4);
  objc_msgSend(MEMORY[0x1E0CD1520], "fetchFacesInAsset:options:", a1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)vcp_quickFaceClassificationDone
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "faceAdjustmentVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "adjustmentVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToDate:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "faceAdjustmentVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1398], "quickClassificationFaceAdjustmentVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToDate:", v6);

  }
  return v4;
}

- (uint64_t)vcp_needsFaceProcessing
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t result;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  _BYTE v17[10];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "faceAdjustmentVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "faceAdjustmentVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "adjustmentVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToDate:", v4);

    if ((v5 & 1) != 0)
    {
      result = _os_feature_enabled_impl();
      if (!(_DWORD)result)
        return result;
      objc_msgSend(a1, "photoLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "mad_faceProcessingInternalVersion");

      if (v8 == objc_msgSend(a1, "faceAnalysisVersion"))
        return 0;
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(a1, "localIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412802;
        v15 = v13;
        v16 = 1024;
        *(_DWORD *)v17 = objc_msgSend(a1, "faceAnalysisVersion");
        *(_WORD *)&v17[4] = 1024;
        *(_DWORD *)&v17[6] = v8;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@][FaceAnalysisStateCheck] faceAnalysisVersion %d (target %d)", (uint8_t *)&v14, 0x18u);

      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "localIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "faceAdjustmentVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "adjustmentVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v10;
      v16 = 2112;
      *(_QWORD *)v17 = v11;
      *(_WORD *)&v17[8] = 2112;
      v18 = v12;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@][FaceAnalysisStateCheck] faceAdjustmentVersion %@ != adjustmentTimestamp %@", (uint8_t *)&v14, 0x20u);

    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a1, "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v9;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@][FaceAnalysisStateCheck] no faceAdjustmentVersion", (uint8_t *)&v14, 0xCu);

  }
  return 1;
}

@end
