@implementation PHAsset(Stickers)

- (id)vcp_animatedStickerScore
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "vcp_isLivePhoto"))
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a1, "localIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] Asset is not Live Photo; omitting sticker score",
        (uint8_t *)&v10,
        0xCu);

    }
    goto LABEL_9;
  }
  if ((objc_msgSend(a1, "vcp_needsFullAnalysisProcessing") & 1) != 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a1, "localIdentifier");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v2;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] Analysis unavailable or outdated; omitting sticker score",
        (uint8_t *)&v10,
        0xCu);

    }
LABEL_9:
    v4 = 0;
    return v4;
  }
  objc_msgSend(a1, "mediaAnalysisProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "videoStickerSuggestionScore");
    v10 = 138412802;
    v11 = v6;
    v12 = 2048;
    v13 = v7;
    v14 = 1024;
    v15 = objc_msgSend(v5, "mediaAnalysisVersion");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] Animated Sticker Score: %0.3f (v%d)", (uint8_t *)&v10, 0x1Cu);

  }
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "videoStickerSuggestionScore");
  objc_msgSend(v8, "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
