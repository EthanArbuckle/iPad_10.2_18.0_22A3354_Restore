@implementation VNRequest(MediaAnalysis)

+ (uint64_t)mad_includeEntityNet
{
  return 1;
}

- (id)vcp_idealDimension
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  NSSelectorFromString(CFSTR("supportedImageSizeSet"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "supportedImageSizeSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count"))
    {
      v3 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pixelsWideRange");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (double)(unint64_t)objc_msgSend(v5, "idealDimension");
      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pixelsHighRange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "valueWithSize:", v6, (double)(unint64_t)objc_msgSend(v8, "idealDimension"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        -[VNRequest(MediaAnalysis) vcp_idealDimension].cold.1(a1);
      v9 = 0;
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to query ideal dimension for request %@ because the request does not conform to VNImageIdealImageSizeProviding protocol", (uint8_t *)&v12, 0xCu);

    }
    v9 = 0;
  }
  return v9;
}

- (void)vcp_idealDimension
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Failed to query ideal dimension for request %@ due to empty supportedImageSizeSet", (uint8_t *)&v2, 0xCu);

}

@end
