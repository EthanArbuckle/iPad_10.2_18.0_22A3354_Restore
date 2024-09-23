@implementation VNImageBasedRequest(MediaAnalysis)

+ (uint64_t)_allowANE
{
  return 1;
}

- (uint64_t)_configureRequestWithRevision:()MediaAnalysis
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setMetalContextPriority:", 1);
  objc_msgSend(a1, "setPreferBackgroundProcessing:", 1);
  if (DeviceHasANE() && objc_msgSend((id)objc_opt_class(), "_allowANE"))
  {
    objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setProcessingDevice:", v5);

  }
  v10 = 0;
  v6 = objc_msgSend(a1, "setRevision:error:", a3, &v10);
  v7 = v10;
  if ((v6 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = objc_opt_class();
    *(_DWORD *)buf = 138412802;
    v12 = v8;
    v13 = 2048;
    v14 = a3;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to set %@::setRevision %lu: %@", buf, 0x20u);
  }

  return v6;
}

+ (id)vcp_sceneRequestWithRequestClass:()MediaAnalysis andRevision:
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  int v12;
  objc_class *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(a3);
  v7 = v6;
  if (!v6)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v12 = 138412290;
    v13 = a3;
    v9 = MEMORY[0x1E0C81028];
    v10 = "Failed to create %@";
    goto LABEL_10;
  }
  if ((objc_msgSend(v6, "_configureRequestWithRevision:", a4) & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v12 = 138412290;
    v13 = a3;
    v9 = MEMORY[0x1E0C81028];
    v10 = "Failed to configure %@";
LABEL_10:
    _os_log_impl(&dword_1B6C4A000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0xCu);
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  v8 = v7;
LABEL_12:

  return v8;
}

@end
