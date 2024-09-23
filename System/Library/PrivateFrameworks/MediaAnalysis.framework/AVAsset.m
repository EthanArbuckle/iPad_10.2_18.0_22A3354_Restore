@implementation AVAsset

void __55__AVAsset_MediaAnalysis__vcp_keyFrameWithMaxDimension___block_invoke(uint64_t a1, CGImage *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  const void *v8;
  __CVBuffer **v9;
  const void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a2)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(const void **)(v7 + 48);
    v9 = (__CVBuffer **)(v7 + 48);
    v8 = v10;
    if (v10)
    {
      CFRelease(v8);
      *v9 = 0;
    }
    CGImage_CreateCVPixelBuffer(a2, v9);
  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to decode first frame (%@)", (uint8_t *)&v11, 0xCu);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __64__AVAsset_MediaAnalysis__vcp_frameAtTimeStamp_withMaxDimension___block_invoke(uint64_t a1, CGImage *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  const void *v8;
  __CVBuffer **v9;
  const void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a2)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(const void **)(v7 + 48);
    v9 = (__CVBuffer **)(v7 + 48);
    v8 = v10;
    if (v10)
    {
      CFRelease(v8);
      *v9 = 0;
    }
    CGImage_CreateCVPixelBuffer(a2, v9);
  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to decode first frame (%@)", (uint8_t *)&v11, 0xCu);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
