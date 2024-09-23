@implementation VNDetectBarcodesRequest(MediaAnalysis)

+ (id)mad_defaultRequest
{
  id v0;
  int v1;
  char v2;
  uint64_t v3;
  char v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v12;
  _QWORD v13[2];
  uint8_t buf[4];
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0CEDE50]);
  v1 = _os_feature_enabled_impl();
  v2 = v1;
  if (v1)
    v3 = 3737841665;
  else
    v3 = 3737841664;
  v12 = 0;
  v4 = objc_msgSend(v0, "setRevision:error:", v3, &v12);
  v5 = v12;
  if ((v4 & 1) != 0)
  {
    v6 = *MEMORY[0x1E0CEE250];
    v13[0] = *MEMORY[0x1E0CEE278];
    v13[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setSymbologies:", v7);

    if ((v2 & 1) == 0)
      objc_msgSend(v0, "setUseSegmentationPregating:", 1);
    if (DeviceHasANE())
    {
      objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "setProcessingDevice:", v8);

    }
    v9 = v0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v15 = v3;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to set revision %u for VNDetectBarcodesRequest with error: %@", buf, 0x12u);

    }
    v9 = 0;
  }

  return v9;
}

@end
