@implementation PHAsset(MediaAnalysisVisualSearchProcessing)

+ (uint64_t)enableStickerScore
{
  return 1;
}

- (uint64_t)vcp_needsVisualSearchProcessing
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "visualSearchProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "algorithmVersion");
  if (v3 >= (int)VCPPhotosVisualSearchAlgorithmVersion())
  {
    objc_msgSend(v2, "adjustmentVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v2, "adjustmentVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "adjustmentVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "isEqualToDate:", v7) ^ 1;

    }
    else
    {
      v4 = 1;
    }

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)vcp_needsStickerGatingProcessing
{
  void *v2;
  _BOOL8 v3;

  if (!objc_msgSend(MEMORY[0x1E0CD1398], "enableStickerScore"))
    return 0;
  objc_msgSend(a1, "visualSearchProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "stickerAlgorithmVersion") < 1;

  return v3;
}

- (uint64_t)vcp_needsPECProcessing
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;

  objc_msgSend(a1, "sceneAnalysisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "privateEncryptedComputeAnalysisVersion") == 5)
  {
    objc_msgSend(v2, "privateEncryptedComputeAnalysisTimestamp");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "adjustmentVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToDate:", v4);

    v6 = v5 ^ 1u;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

@end
