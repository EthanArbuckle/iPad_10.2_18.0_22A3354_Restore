@implementation CAMTimelapseSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_41);
  return (id)sharedInstance___sharedInstance_0;
}

void __38__CAMTimelapseSettings_sharedInstance__block_invoke()
{
  CAMTimelapseSettings *v0;
  void *v1;

  v0 = objc_alloc_init(CAMTimelapseSettings);
  v1 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;

}

- (CAMTimelapseSettings)init
{
  CAMTimelapseSettings *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMTimelapseSettings;
  result = -[CAMTimelapseSettings init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_initialCaptureTimeInterval = xmmword_1DB9A7850;
    result->_maxOutputLength = 40.0;
  }
  return result;
}

- (int64_t)maxOutputFrames
{
  double v3;
  double v4;
  double v5;

  -[CAMTimelapseSettings maxOutputLength](self, "maxOutputLength");
  v4 = v3;
  -[CAMTimelapseSettings maxOutputFPS](self, "maxOutputFPS");
  return (uint64_t)(v4 * v5);
}

- (int64_t)_averageMovieBitrateForWidth:(int64_t)a3 height:(int64_t)a4 useHEVC:(BOOL)a5
{
  int64_t v5;
  CAMTimelapseSettings *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CMTime v13;
  CMTime v14;

  if (a5)
    return 15000000;
  v6 = self;
  -[CAMTimelapseSettings _outputSettingsPresetForWidth:height:](self, "_outputSettingsPresetForWidth:height:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B2D0], "outputSettingsAssistantWithPreset:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = (int)v6->_maxOutputFPS;
  CMTimeMake(&v14, 1, (int32_t)v6);
  objc_msgSend(v8, "setSourceVideoAverageFrameDuration:", &v14);
  CMTimeMake(&v13, 1, (int32_t)v6);
  objc_msgSend(v8, "setSourceVideoMinFrameDuration:", &v13);
  objc_msgSend(v8, "videoSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0C8AEB8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C8AE20]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (uint64_t)((double)objc_msgSend(v11, "integerValue") * 1.25);

  return v5;
}

- (int64_t)maxMovieFileLengthForWidth:(int64_t)a3 height:(int64_t)a4 useHEVC:(BOOL)a5
{
  uint64_t v6;
  double v7;

  v6 = -[CAMTimelapseSettings _averageMovieBitrateForWidth:height:useHEVC:](self, "_averageMovieBitrateForWidth:height:useHEVC:", a3, a4, a5);
  -[CAMTimelapseSettings maxOutputLength](self, "maxOutputLength");
  return (uint64_t)(v7 * (double)v6 * 1.05 * 0.125);
}

- (int64_t)minAvailableBytesNeededForCaptureForWidth:(int64_t)a3 height:(int64_t)a4 useHEVC:(BOOL)a5
{
  return -[CAMTimelapseSettings maxMovieFileLengthForWidth:height:useHEVC:](self, "maxMovieFileLengthForWidth:height:useHEVC:", a3, a4, a5)+ 60 * (972800 * a3 * a4 / 2073600);
}

- (id)_outputSettingsPresetForWidth:(int64_t)a3 height:(int64_t)a4
{
  void *v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0C8B2D0], "availableOutputSettingsPresets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 >= a4)
    v8 = a4;
  else
    v8 = a3;
  if (a3 <= a4)
    v9 = a4;
  else
    v9 = a3;
  if (v9 == 1920 && v8 == 1080)
  {
    v10 = (_QWORD *)MEMORY[0x1E0C8ABA8];
  }
  else if (v9 == 1280 && v8 == 720)
  {
    v10 = (_QWORD *)MEMORY[0x1E0C8ABA0];
  }
  else
  {
    if (v9 != 960 || v8 != 540)
      goto LABEL_17;
    v10 = (_QWORD *)MEMORY[0x1E0C8ABC0];
  }
  v11 = (void *)*v10;
  if ((objc_msgSend(v6, "containsObject:", *v10) & 1) == 0)
LABEL_17:
    v11 = (void *)*MEMORY[0x1E0C8ABB8];
  v12 = v11;

  return v12;
}

- (id)outputSettingsForWidth:(int64_t)a3 height:(int64_t)a4 videoFormatDescription:(opaqueCMFormatDescription *)a5 framesPerSecond:(int64_t)a6 frameCount:(int64_t)a7 useHEVC:(BOOL)a8
{
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
  void *v26;
  _BOOL4 v28;
  void *v30;
  CMTime v31;
  CMTime v32;

  v28 = a8;
  v13 = (double)a7 / (double)a6;
  -[CAMTimelapseSettings _outputSettingsPresetForWidth:height:](self, "_outputSettingsPresetForWidth:height:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B2D0], "outputSettingsAssistantWithPreset:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake(&v32, 1, a6);
  objc_msgSend(v14, "setSourceVideoAverageFrameDuration:", &v32);
  CMTimeMake(&v31, 1, a6);
  objc_msgSend(v14, "setSourceVideoMinFrameDuration:", &v31);
  objc_msgSend(v14, "setSourceVideoFormat:", a5);
  objc_msgSend(v14, "videoSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "setObject:forKey:", *MEMORY[0x1E0C8AF38], *MEMORY[0x1E0C8AF30]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v17, *MEMORY[0x1E0C8AF60]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v18, *MEMORY[0x1E0C8AEF0]);

  v19 = *MEMORY[0x1E0C8AEB8];
  objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0C8AEB8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", v22, *MEMORY[0x1E0CED1F8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", v23, *MEMORY[0x1E0CECFD0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", v24, *MEMORY[0x1E0CECFC8]);

  if (v28)
  {
    objc_msgSend(v16, "setObject:forKey:", *MEMORY[0x1E0C8AE78], *MEMORY[0x1E0C8AE68]);
    objc_msgSend(v21, "setObject:forKey:", *MEMORY[0x1E0CED9B0], *MEMORY[0x1E0C8AF20]);
    objc_msgSend(v21, "removeObjectForKey:", *MEMORY[0x1E0C8AEE8]);
    objc_msgSend(v21, "setObject:forKey:", &unk_1EA3B0F70, *MEMORY[0x1E0CED098]);
    objc_msgSend(v21, "setObject:forKey:", &unk_1EA3B0F88, *MEMORY[0x1E0CED0C0]);
  }
  v25 = -[CAMTimelapseSettings _averageMovieBitrateForWidth:height:useHEVC:](self, "_averageMovieBitrateForWidth:height:useHEVC:", a3, a4, v28);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", v26, *MEMORY[0x1E0C8AE20]);

  objc_msgSend(v16, "setObject:forKey:", v21, v19);
  return v16;
}

- (int64_t)maxMovieWriteAttempts
{
  return 5;
}

- (double)waitTimeBeforeNextWriteForNumberOfPreviousAttempts:(int64_t)a3
{
  if (a3 < 1)
    return 0.0;
  else
    return (double)(10 * (1 << (a3 - 1)));
}

- (int64_t)maxFailedStateReadAttempts
{
  return 10;
}

- (double)initialCaptureTimeInterval
{
  return self->_initialCaptureTimeInterval;
}

- (double)maxOutputFPS
{
  return self->_maxOutputFPS;
}

- (double)maxOutputLength
{
  return self->_maxOutputLength;
}

@end
