@implementation JFXExportController

- (JFXExportController)initWithWithComposition:(id)a3 presets:(id)a4 toFile:(id)a5 poster:(id)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  JFXExportController *v17;
  JFXExportController *v18;
  NSString *currentPreset;
  NSObject *v20;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)JFXExportController;
  v17 = -[JFXExportController init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_composition, a3);
    objc_storeStrong((id *)&v18->_presets, a4);
    v18->_exportingIndexPresets = 0;
    objc_storeStrong((id *)&v18->_exportPath, a5);
    currentPreset = v18->_currentPreset;
    v18->_currentPreset = 0;

    v18->_cancel = 0;
    v18->_status = 0;
    objc_storeStrong((id *)&v18->_poster, a6);
    objc_storeStrong((id *)&v18->_delegate, a7);
    if (!-[NSArray count](v18->_presets, "count"))
    {
      JFXLog_export();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[JFXExportController initWithWithComposition:presets:toFile:poster:delegate:].cold.1(v20);

    }
  }

  return v18;
}

+ (unint64_t)estimatedFileSizeForDuration:(int)a3 frameRate:(double)a4 preset:(id)a5 size:(CGSize)a6
{
  float v6;

  if (!a5)
    return 0;
  v6 = a4;
  return a3
       / vcvtps_u32_f32(v6)
       * (unint64_t)((double)(unint64_t)objc_msgSend(a1, "dataRateForPreset:size:", a5, a6.width, a6.height)* 0.125* 1.05);
}

+ (unint64_t)dataRateForPreset:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  uint64_t v9;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = objc_msgSend(a1, "videoDataRateForPreset:size:", v7, width, height);
  v9 = objc_msgSend(a1, "audioDataRateForPreset:", v7);

  return v9 + v8;
}

+ (unint64_t)videoDataRateForPreset:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  char v10;
  _BOOL4 IsSquare;
  char v12;
  unint64_t v13;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  if (videoDataRateForPreset_size__onceToken != -1)
    dispatch_once(&videoDataRateForPreset_size__onceToken, &__block_literal_global_40);
  objc_msgSend((id)videoDataRateForPreset_size__presetToDataRateLUT, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend((id)videoDataRateForPreset_size__presetToDataRateLUT, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

  }
  else
  {
    v9 = 10500000;
  }
  v10 = objc_msgSend(v6, "isEqualToString:", JFXAssetExportPresetLowQuality);
  IsSquare = CGSizeIsSquare(width, height);
  v12 = v10 ^ 1;
  if (!IsSquare)
    v12 = 0;
  v13 = v9 >> v12;

  return v13;
}

void __51__JFXExportController_videoDataRateForPreset_size___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[10];
  _QWORD v6[11];

  v6[10] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDB1970];
  v5[0] = JFXAssetExportPresetLowQuality;
  v5[1] = v0;
  v6[0] = &unk_24EE9BBD0;
  v6[1] = &unk_24EE9BBE8;
  v1 = *MEMORY[0x24BDB1950];
  v5[2] = *MEMORY[0x24BDB1978];
  v5[3] = v1;
  v6[2] = &unk_24EE9BC00;
  v6[3] = &unk_24EE9BC18;
  v5[4] = JFXAssetExportPresetHEVC1280x720;
  v5[5] = JFXAssetExportPresetHEVC1280x720HDR;
  v6[4] = &unk_24EE9BC18;
  v6[5] = &unk_24EE9BC18;
  v5[6] = *MEMORY[0x24BDB1958];
  v5[7] = JFXAssetExportPresetHEVC1920x1080;
  v6[6] = &unk_24EE9BC30;
  v6[7] = &unk_24EE9BC30;
  v2 = *MEMORY[0x24BDB1960];
  v5[8] = JFXAssetExportPresetHEVC1920x1080HDR;
  v5[9] = v2;
  v6[8] = &unk_24EE9BC30;
  v6[9] = &unk_24EE9BC48;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 10);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)videoDataRateForPreset_size__presetToDataRateLUT;
  videoDataRateForPreset_size__presetToDataRateLUT = v3;

}

+ (unint64_t)audioDataRateForPreset:(id)a3
{
  unint64_t v3;
  id v4;

  v3 = 256000;
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB1950]) & 1) == 0
    && !objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB1958]))
  {
    v3 = 128000;
  }

  return v3;
}

+ (id)presetNameForCGSize:(CGSize)a3
{
  double v3;
  id *v4;

  v3 = a3.width * a3.height;
  if (v3 >= 8294400.0)
  {
    v4 = (id *)MEMORY[0x24BDB1960];
  }
  else if (v3 >= 2073600.0)
  {
    v4 = (id *)MEMORY[0x24BDB1958];
  }
  else if (v3 >= 921600.0)
  {
    v4 = (id *)MEMORY[0x24BDB1950];
  }
  else
  {
    v4 = (id *)MEMORY[0x24BDB1978];
    if (v3 < 518400.0)
      v4 = (id *)MEMORY[0x24BDB1970];
  }
  return *v4;
}

- (void)nextPreset
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = -[JFXExportController exportingIndexPresets](self, "exportingIndexPresets");
  -[JFXExportController presets](self, "presets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 >= v5)
  {
    -[JFXExportController setCurrentPreset:](self, "setCurrentPreset:", 0);
  }
  else
  {
    -[JFXExportController presets](self, "presets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", self->_exportingIndexPresets);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXExportController setCurrentPreset:](self, "setCurrentPreset:", v7);

    -[JFXExportController setExportingIndexPresets:](self, "setExportingIndexPresets:", -[JFXExportController exportingIndexPresets](self, "exportingIndexPresets") + 1);
  }
}

- (void)beginAsynchronousExport
{
  double v3;
  _QWORD block[5];

  -[JFXExportController nextPreset](self, "nextPreset");
  -[JFXExportController analyticsForSessionBegin](self, "analyticsForSessionBegin");
  LODWORD(v3) = 0;
  -[JFXExportController updateProgressViewWithProgress:reduced:](self, "updateProgressViewWithProgress:reduced:", 0, v3);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__JFXExportController_beginAsynchronousExport__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __46__JFXExportController_beginAsynchronousExport__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "continueExportAfterDelay");
}

- (void)closeSessionWithStatus:(int64_t)a3
{
  -[JFXExportController analyticsForSessionCompleteWithStatus:](self, "analyticsForSessionCompleteWithStatus:", a3);
  +[JFXExportController cancelPreviousPerformRequestsWithTarget:](JFXExportController, "cancelPreviousPerformRequestsWithTarget:", self);
  -[JFXExportController stopProgressTimer](self, "stopProgressTimer");
  -[JFXExportController informDelegateOfCompletion](self, "informDelegateOfCompletion");
}

- (void)informDelegateOfCompletion
{
  uint64_t v3;

  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (-[JFXExportController cancel](self, "cancel"))
      v3 = 3;
    else
      v3 = 2 * (-[JFXExportController status](self, "status") != 3);
    -[JFXExportDelegate didFinishExport:](self->_delegate, "didFinishExport:", v3);
  }
}

- (void)startProgressTimer
{
  void *v3;
  void *v4;
  id v5;

  -[JFXExportController stopProgressTimer](self, "stopProgressTimer");
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_serviceProgressTimer_, 0, 1, 0.5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXExportController setProgressTimer:](self, "setProgressTimer:", v3);

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdleTimerDisabled:", 0);

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdleTimerDisabled:", 1);

}

- (void)stopProgressTimer
{
  NSTimer *progressTimer;

  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    -[NSTimer invalidate](progressTimer, "invalidate");
    -[JFXExportController setProgressTimer:](self, "setProgressTimer:", 0);
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_23_0);
  }
}

void __40__JFXExportController_stopProgressTimer__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setIdleTimerDisabled:", 1);

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdleTimerDisabled:", 0);

}

- (void)serviceProgressTimer:(id)a3
{
  void *v4;
  id v5;

  -[JFXExportController progress](self, "progress", a3);
  -[JFXExportController updateProgressViewWithProgress:reduced:](self, "updateProgressViewWithProgress:reduced:", 1);
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdleTimerDisabled:", 0);

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdleTimerDisabled:", 1);

}

- (float)progress
{
  return 0.5;
}

- (void)updateProgressViewWithProgress:(float)a3 reduced:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  unint64_t v8;
  void *v9;
  float v10;
  void *v11;
  char v12;
  float v13;
  double v14;
  id v15;

  v4 = a4;
  -[JFXExportController presets](self, "presets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 >= 2)
  {
    -[JFXExportController presets](self, "presets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1.0 / (double)(unint64_t)objc_msgSend(v9, "count");

    a3 = (float)(v10 * a3)
       + v10 * (float)(-[JFXExportController exportingIndexPresets](self, "exportingIndexPresets") - 1);
  }
  -[JFXExportController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    if (v4)
    {
      v13 = a3 * 0.95;
      a3 = v13;
    }
    -[JFXExportController delegate](self, "delegate");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v14 = a3;
    objc_msgSend(v15, "exportProgressedTo:", v14);

  }
}

- (id)metadataToAdd
{
  void *v3;
  void *v4;
  _QWORD *v5;
  UIImage *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXExportController poster](self, "poster");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (_QWORD *)MEMORY[0x24BDB1E48];
  if (v4)
  {
    -[JFXExportController poster](self, "poster");
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImageJPEGRepresentation(v6, 0.8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[JFXExportController poster](self, "poster");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    v10 = v9;

    if (v10 > 0.0 && v7)
    {
      objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setKeySpace:", *v5);
      objc_msgSend(v11, "setKey:", *MEMORY[0x24BDB1EE0]);
      objc_msgSend(v11, "setValue:", v7);
      objc_msgSend(v3, "arrayByAddingObject:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v12;
    }
    -[JFXExportController setPoster:](self, "setPoster:", 0);

  }
  objc_msgSend(MEMORY[0x24BDB25B8], "metadataItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setKeySpace:", *v5);
  objc_msgSend(v13, "setKey:", *MEMORY[0x24BDB1EE8]);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pathExtension");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:", v16);

  objc_msgSend(v3, "arrayByAddingObject:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (unint64_t)exportDuration
{
  uint64_t v3;

  v3 = mach_absolute_time();
  return v3 - -[JFXExportController exportStartTime](self, "exportStartTime");
}

- (void)analyticsForSessionBegin
{
  void *v3;
  char v4;
  void *v5;

  -[JFXExportController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[JFXExportController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exportAnalyticsForSessionBegin");

  }
  -[JFXExportController setExportStartTime:](self, "setExportStartTime:", mach_absolute_time());
}

- (void)analyticsForSessionCompleteWithStatus:(int64_t)a3
{
  void *v5;
  char v6;
  id v7;

  -[JFXExportController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[JFXExportController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exportAnalyticsForSessionCompleteWithStatus:exportMachDuration:", a3, -[JFXExportController exportDuration](self, "exportDuration"));

  }
}

- (unint64_t)exportStartTime
{
  return self->_exportStartTime;
}

- (void)setExportStartTime:(unint64_t)a3
{
  self->_exportStartTime = a3;
}

- (JFXComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
  objc_storeStrong((id *)&self->_composition, a3);
}

- (NSArray)presets
{
  return self->_presets;
}

- (void)setPresets:(id)a3
{
  objc_storeStrong((id *)&self->_presets, a3);
}

- (NSString)currentPreset
{
  return self->_currentPreset;
}

- (void)setCurrentPreset:(id)a3
{
  objc_storeStrong((id *)&self->_currentPreset, a3);
}

- (UIImage)poster
{
  return self->_poster;
}

- (void)setPoster:(id)a3
{
  objc_storeStrong((id *)&self->_poster, a3);
}

- (JFXExportDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSString)exportPath
{
  return self->_exportPath;
}

- (void)setExportPath:(id)a3
{
  objc_storeStrong((id *)&self->_exportPath, a3);
}

- (NSTimer)progressTimer
{
  return self->_progressTimer;
}

- (void)setProgressTimer:(id)a3
{
  objc_storeStrong((id *)&self->_progressTimer, a3);
}

- (unint64_t)exportingIndexPresets
{
  return self->_exportingIndexPresets;
}

- (void)setExportingIndexPresets:(unint64_t)a3
{
  self->_exportingIndexPresets = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)cancel
{
  return self->_cancel;
}

- (void)setCancel:(BOOL)a3
{
  self->_cancel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_exportPath, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_poster, 0);
  objc_storeStrong((id *)&self->_currentPreset, 0);
  objc_storeStrong((id *)&self->_presets, 0);
  objc_storeStrong((id *)&self->_composition, 0);
}

- (void)initWithWithComposition:(os_log_t)log presets:toFile:poster:delegate:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2269A9000, log, OS_LOG_TYPE_DEBUG, "export created with NO presets", v1, 2u);
}

@end
