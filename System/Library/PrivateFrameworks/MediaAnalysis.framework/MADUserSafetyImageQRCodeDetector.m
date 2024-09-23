@implementation MADUserSafetyImageQRCodeDetector

- (id)sensitivityFromQRCodeInImage:(id)a3 signpostPayload:(id)a4
{
  void *v4;
  id v7;
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  unsigned int v19;
  const void *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = (id)objc_opt_class();
    v9 = v22;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] running...", buf, 0xCu);

  }
  -[MADUserSafetyQRCodeDetector sensitivity](self, "sensitivity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (!v11)
    goto LABEL_19;
  v14 = (void *)MEMORY[0x1BCCA1B2C]();
  v20 = 0;
  v19 = 0;
  v15 = objc_msgSend(v7, "loadLowResPixelBuffer:orientation:", &v20, &v19);
  if (v15)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v22 = v16;
      v17 = v16;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] image loading failed", buf, 0xCu);

    }
    -[MADUserSafetyQRCodeDetector sensitivity](self, "sensitivity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MADUserSafetyQRCodeDetector processPixelBuffer:orientation:signpostPayload:](self, "processPixelBuffer:orientation:signpostPayload:", v20, v19, v8);
  }
  CF<opaqueCMSampleBuffer *>::~CF(&v20);
  objc_autoreleasePoolPop(v14);
  if (!v15)
  {
LABEL_19:
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v22 = v12;
      v13 = v12;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] complete", buf, 0xCu);

    }
    -[MADUserSafetyQRCodeDetector sensitivity](self, "sensitivity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

@end
