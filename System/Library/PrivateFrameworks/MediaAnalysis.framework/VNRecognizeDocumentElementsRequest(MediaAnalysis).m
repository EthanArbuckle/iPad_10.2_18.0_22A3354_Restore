@implementation VNRecognizeDocumentElementsRequest(MediaAnalysis)

+ (id)vcp_sceneRequest
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0CEDFD8]);
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "setRevision:", 1);
    objc_msgSend(v1, "setMetalContextPriority:", 1);
    objc_msgSend(v1, "setPreferBackgroundProcessing:", 1);
    if (DeviceHasANE())
    {
      objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "setProcessingDevice:", v2);

    }
    objc_msgSend(v1, "textElements");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRecognize:", 1);

    objc_msgSend(v1, "machineReadableCodeElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRecognize:", 1);

    objc_msgSend(v1, "documentElements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRecognize:", 1);

    v6 = v1;
  }
  else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = objc_opt_class();
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create %@", (uint8_t *)&v8, 0xCu);
  }

  return v1;
}

@end
