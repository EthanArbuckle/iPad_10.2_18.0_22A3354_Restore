@implementation MADVideoRemoveBackgroundSettings

- (MADVideoRemoveBackgroundSettings)init
{
  char *v2;
  MADVideoRemoveBackgroundSettings *v3;
  _BOOL4 autoplayTrimEnabled;
  _BOOL4 visionTrimEnabled;
  unint64_t visionTrimWindow;
  double visionTrimThreshold;
  double visionTrimMininumDuration;
  double visionPreferredVideoQualityThreshold;
  double visionPreferredLowQualityProportionThreshold;
  double visionPreferredWorstFrameScoreThreshold;
  double photosPreferredThreshold;
  objc_super v14;
  uint8_t buf[4];
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)MADVideoRemoveBackgroundSettings;
  v2 = -[MADVideoRemoveBackgroundSettings init](&v14, sel_init);
  v3 = (MADVideoRemoveBackgroundSettings *)v2;
  if (v2)
  {
    *((_WORD *)v2 + 4) = 256;
    *((_QWORD *)v2 + 2) = 5;
    *(_OWORD *)(v2 + 24) = xmmword_1B6FBCF30;
    *(_OWORD *)(v2 + 40) = xmmword_1B6FBCF40;
    *(_OWORD *)(v2 + 56) = xmmword_1B6FBCF50;
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      autoplayTrimEnabled = v3->_autoplayTrimEnabled;
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = autoplayTrimEnabled;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] AutoPlay Trim:        %d", buf, 8u);
    }
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      visionTrimEnabled = v3->_visionTrimEnabled;
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = visionTrimEnabled;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Vision Trim:          %d", buf, 8u);
    }
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      visionTrimWindow = v3->_visionTrimWindow;
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = visionTrimWindow;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Window:               %d", buf, 8u);
    }
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      visionTrimThreshold = v3->_visionTrimThreshold;
      *(_DWORD *)buf = 134217984;
      v16 = visionTrimThreshold;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Trim Threshold:       %0.2f", buf, 0xCu);
    }
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      visionTrimMininumDuration = v3->_visionTrimMininumDuration;
      *(_DWORD *)buf = 134217984;
      v16 = visionTrimMininumDuration;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Min Duration:         %0.3f", buf, 0xCu);
    }
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      visionPreferredVideoQualityThreshold = v3->_visionPreferredVideoQualityThreshold;
      *(_DWORD *)buf = 134217984;
      v16 = visionPreferredVideoQualityThreshold;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Pref Threshold[v]:    %0.2f", buf, 0xCu);
    }
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      visionPreferredLowQualityProportionThreshold = v3->_visionPreferredLowQualityProportionThreshold;
      *(_DWORD *)buf = 134217984;
      v16 = visionPreferredLowQualityProportionThreshold;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Pref Threshold[prop]: %0.2f", buf, 0xCu);
    }
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      visionPreferredWorstFrameScoreThreshold = v3->_visionPreferredWorstFrameScoreThreshold;
      *(_DWORD *)buf = 134217984;
      v16 = visionPreferredWorstFrameScoreThreshold;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Pref Threshold[wfs]:  %0.2f", buf, 0xCu);
    }
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      photosPreferredThreshold = v3->_photosPreferredThreshold;
      *(_DWORD *)buf = 134217984;
      v16 = photosPreferredThreshold;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Pref Threshold[ph]:   %0.2f", buf, 0xCu);
    }
  }
  return v3;
}

+ (id)sharedSettings
{
  if (+[MADVideoRemoveBackgroundSettings sharedSettings]::once != -1)
    dispatch_once(&+[MADVideoRemoveBackgroundSettings sharedSettings]::once, &__block_literal_global_158);
  return (id)+[MADVideoRemoveBackgroundSettings sharedSettings]::instance;
}

void __50__MADVideoRemoveBackgroundSettings_sharedSettings__block_invoke()
{
  MADVideoRemoveBackgroundSettings *v0;
  void *v1;

  v0 = objc_alloc_init(MADVideoRemoveBackgroundSettings);
  v1 = (void *)+[MADVideoRemoveBackgroundSettings sharedSettings]::instance;
  +[MADVideoRemoveBackgroundSettings sharedSettings]::instance = (uint64_t)v0;

}

+ (BOOL)autoplayTrimEnabled
{
  _BYTE *v2;
  char v3;

  +[MADVideoRemoveBackgroundSettings sharedSettings](MADVideoRemoveBackgroundSettings, "sharedSettings");
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[8];

  return v3;
}

+ (BOOL)visionTrimEnabled
{
  _BYTE *v2;
  char v3;

  +[MADVideoRemoveBackgroundSettings sharedSettings](MADVideoRemoveBackgroundSettings, "sharedSettings");
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[9];

  return v3;
}

+ (unint64_t)visionTrimWindow
{
  _QWORD *v2;
  unint64_t v3;

  +[MADVideoRemoveBackgroundSettings sharedSettings](MADVideoRemoveBackgroundSettings, "sharedSettings");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[2];

  return v3;
}

+ (double)visionTrimThreshold
{
  double *v2;
  double v3;

  +[MADVideoRemoveBackgroundSettings sharedSettings](MADVideoRemoveBackgroundSettings, "sharedSettings");
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  v3 = v2[3];

  return v3;
}

+ (double)visionTrimMininumDuration
{
  double *v2;
  double v3;

  +[MADVideoRemoveBackgroundSettings sharedSettings](MADVideoRemoveBackgroundSettings, "sharedSettings");
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  v3 = v2[4];

  return v3;
}

+ (double)visionPreferredVideoQualityThreshold
{
  double *v2;
  double v3;

  +[MADVideoRemoveBackgroundSettings sharedSettings](MADVideoRemoveBackgroundSettings, "sharedSettings");
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  v3 = v2[5];

  return v3;
}

+ (double)visionPreferredLowQualityProportionThreshold
{
  double *v2;
  double v3;

  +[MADVideoRemoveBackgroundSettings sharedSettings](MADVideoRemoveBackgroundSettings, "sharedSettings");
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  v3 = v2[6];

  return v3;
}

+ (double)visionPreferredWorstFrameScoreThreshold
{
  double *v2;
  double v3;

  +[MADVideoRemoveBackgroundSettings sharedSettings](MADVideoRemoveBackgroundSettings, "sharedSettings");
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  v3 = v2[7];

  return v3;
}

+ (double)photosPreferredThreshold
{
  double *v2;
  double v3;

  +[MADVideoRemoveBackgroundSettings sharedSettings](MADVideoRemoveBackgroundSettings, "sharedSettings");
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  v3 = v2[8];

  return v3;
}

@end
