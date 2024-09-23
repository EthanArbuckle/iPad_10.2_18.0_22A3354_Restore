@implementation PHAsset(FullAnalysis)

+ (unint64_t)vcp_fullAnalysisTypesForAssetType:()FullAnalysis
{
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((a3 & 3) != 0)
  {
    v4 = (a3 << 62 >> 63) & 0x32C04C1A41090 | *(_QWORD *)"\b\nH@";
    goto LABEL_9;
  }
  if ((a3 & 4) != 0)
  {
    v4 = 0x32C0040E4D898;
LABEL_9:
    if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled"))
      return v4;
    else
      return v4 & 0xFFFEF7FFFFFFFFFFLL;
  }
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unexpected media type (%lu)", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

+ (uint64_t)vcp_fullAnalysisImageOnlyTypes
{
  uint64_t v0;

  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled"))
    v0 = 0x1000000000000;
  else
    v0 = 0;
  if (+[VCPVideoCaptionAnalyzer mode](VCPVideoCaptionAnalyzer, "mode") == 1)
    return v0 | 0x2000000000000;
  else
    return v0;
}

- (unint64_t)vcp_fullAnalysisTypes
{
  uint64_t v2;
  unint64_t v3;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isPhoto"))
  {
    v2 = *(_QWORD *)"\b\nH@";
    if (objc_msgSend(a1, "vcp_isLivePhoto"))
      v2 = *(_QWORD *)"\b\nH@" | 0x40032C04D5A41090;
    if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled"))
      v3 = v2;
    else
      v3 = v2 & 0xFFFEF7FFFFFFFFFFLL;
LABEL_10:
    if (+[VCPVideoCaptionAnalyzer mode](VCPVideoCaptionAnalyzer, "mode") == 1)
      return v3;
    else
      return v3 & 0xFFFDDFFFFFFFFFFFLL;
  }
  if (objc_msgSend(a1, "isVideo"))
  {
    v3 = 0x40032C0040E4D898;
    if (!+[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled"))
      v3 = 0x4002240040E4D898;
    goto LABEL_10;
  }
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "localIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 1024;
    v9 = objc_msgSend(a1, "mediaType");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Unexpected media type (%d)", (uint8_t *)&v6, 0x12u);

  }
  return 0;
}

- (unint64_t)vcp_fullAnalysisTypesForResources:()FullAnalysis
{
  id v4;
  uint64_t v5;
  _BOOL4 v6;
  int64_t v7;
  unint64_t v8;
  void *v9;
  _BOOL4 v10;
  unint64_t v11;
  int v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(a1, "isPhoto"))
  {
    if (objc_msgSend(a1, "isVideo"))
    {
      if (objc_msgSend(a1, "vcp_isVideoSlowmo")
        && (objc_msgSend(v4, "vcp_hasLocalSlowmo:", objc_msgSend(a1, "vcp_hasAdjustments:", v4)) & 1) != 0
        || (objc_msgSend(a1, "vcp_isVideoSlowmo") & 1) == 0
        && objc_msgSend(v4, "vcp_hasLocalMovie:", objc_msgSend(a1, "hasAdjustments")))
      {
        v6 = +[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled");
        v7 = +[VCPVideoCaptionAnalyzer mode](VCPVideoCaptionAnalyzer, "mode");
        v8 = 0x40032C0040E4D898;
        goto LABEL_21;
      }
      if (objc_msgSend(v4, "vcp_hasLocalPhoto:", objc_msgSend(a1, "hasAdjustments")))
      {
        v6 = +[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled");
        v7 = +[VCPVideoCaptionAnalyzer mode](VCPVideoCaptionAnalyzer, "mode");
        v8 = 0x3000000000800;
LABEL_21:
        if (!v6)
          v8 &= 0x7FFEF7FFFFFFFFFFuLL;
        goto LABEL_23;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "localIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v9;
      v15 = 1024;
      v16 = objc_msgSend(a1, "mediaType");
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Unexpected media type (%d)", (uint8_t *)&v13, 0x12u);

    }
    v11 = 0;
    goto LABEL_27;
  }
  if (objc_msgSend(v4, "vcp_hasLocalPhoto:", objc_msgSend(a1, "hasAdjustments")))
  {
    v5 = *(_QWORD *)"\b\nH@";
    if (objc_msgSend(a1, "vcp_isLivePhoto")
      && objc_msgSend(v4, "vcp_hasLocalMovie:", objc_msgSend(a1, "hasAdjustments")))
    {
      v5 = *(_QWORD *)"\b\nH@" | 0x40032C04D5A41090;
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = +[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled");
  v7 = +[VCPVideoCaptionAnalyzer mode](VCPVideoCaptionAnalyzer, "mode");
  v8 = v5 & 0xFFFEF7FFFFFFFFFFLL;
  if (v10)
    v8 = v5;
LABEL_23:
  if (v7 == 1)
    v11 = v8;
  else
    v11 = v8 & 0xFFFDDFFFFFFFFFFFLL;
LABEL_27:

  return v11;
}

@end
