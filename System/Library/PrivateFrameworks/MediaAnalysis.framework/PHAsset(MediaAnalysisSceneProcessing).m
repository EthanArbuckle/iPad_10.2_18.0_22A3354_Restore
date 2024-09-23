@implementation PHAsset(MediaAnalysisSceneProcessing)

- (uint64_t)vcp_needSceneProcessing
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;

  objc_msgSend(a1, "sceneAnalysisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sceneAnalysisVersion");
  if (VCPPhotosSceneProcessingVersionInternal() == v3)
  {
    objc_msgSend(v2, "sceneAnalysisTimestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "adjustmentVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToDate:", v5);

    v7 = v6 ^ 1u;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)vcp_confidenceForExtendedSceneIdentifier:()MediaAnalysisSceneProcessing
{
  void *v5;
  int v6;
  __int16 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sceneAnalysisProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sceneAnalysisVersion");
  if (VCPPhotosSceneProcessingVersionInternal() != v6)
  {
    v7 = objc_msgSend(v5, "sceneAnalysisVersion");
    if (*MEMORY[0x1E0D75710] != v7)
      goto LABEL_13;
  }
  objc_msgSend(v5, "sceneAnalysisTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "adjustmentVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToDate:", v9);

  if (v10)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(a1, "sceneClassifications", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v20;
      v14 = &unk_1E6B74690;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v16, "extendedSceneIdentifier") == a3)
          {
            v17 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v16, "confidence");
            objc_msgSend(v17, "numberWithDouble:");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      v14 = &unk_1E6B74690;
    }
LABEL_16:

  }
  else
  {
LABEL_13:
    v14 = 0;
  }

  return v14;
}

- (uint64_t)vcp_abnormalImageDimensionForSceneNet
{
  _BOOL8 v2;
  double v3;
  double v4;

  v2 = (unint64_t)objc_msgSend(a1, "pixelWidth") <= 0x12A
    && (unint64_t)objc_msgSend(a1, "pixelHeight") < 0x12B;
  if (objc_msgSend(a1, "pixelHeight"))
  {
    v3 = (double)(unint64_t)objc_msgSend(a1, "pixelWidth");
    v4 = v3 / (double)(unint64_t)objc_msgSend(a1, "pixelHeight");
  }
  else
  {
    v4 = 1.0;
  }
  if (v4 > 0.5 && v4 < 2.0)
    return v2;
  else
    return v2 | 2;
}

@end
