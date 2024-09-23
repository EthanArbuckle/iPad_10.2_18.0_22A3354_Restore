@implementation WFAudioRecorder

- (WFAudioRecorder)initWithOutputFormat:(int64_t)a3 destinationURL:(id)a4
{
  id v7;
  WFAudioRecorder *v8;
  WFAudioRecorder *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  uint64_t v25;
  id v26;
  AVAudioRecorder *recorder;
  WFAudioRecorder *v28;
  id v30;
  objc_super v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[7];
  _QWORD v38[7];
  _QWORD v39[7];
  _QWORD v40[7];
  _QWORD v41[4];
  _QWORD v42[6];

  v42[4] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)WFAudioRecorder;
  v8 = -[WFAudioRecorder init](&v31, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_15;
  objc_storeStrong((id *)&v8->_outputURL, a4);
  if (a3)
  {
    if (a3 == 2)
    {
      getAVFormatIDKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v10;
      v38[0] = &unk_24F93B420;
      getAVSampleRateKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v11;
      v38[1] = &unk_24F93C728;
      getAVNumberOfChannelsKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2] = v12;
      v38[2] = &unk_24F93B3F0;
      getAVLinearPCMIsFloatKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v37[3] = v13;
      v19 = MEMORY[0x24BDBD1C0];
      v38[3] = MEMORY[0x24BDBD1C0];
      getAVLinearPCMIsBigEndianKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37[4] = v20;
      v38[4] = v19;
      getAVLinearPCMBitDepthKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v37[5] = v21;
      v38[5] = &unk_24F93B438;
      getAVEncoderAudioQualityKey();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37[6] = v22;
      v38[6] = &unk_24F93B408;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (a3 != 1)
      {
        v14 = 0;
        goto LABEL_10;
      }
      getAVFormatIDKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v10;
      v42[0] = &unk_24F93B3D8;
      getAVSampleRateKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v11;
      v42[1] = &unk_24F93C728;
      getAVNumberOfChannelsKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v41[2] = v12;
      v42[2] = &unk_24F93B3F0;
      getAVEncoderAudioQualityKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v41[3] = v13;
      v42[3] = &unk_24F93B408;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    getAVFormatIDKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v10;
    v40[0] = &unk_24F93B420;
    getAVSampleRateKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v11;
    v40[1] = &unk_24F93C728;
    getAVNumberOfChannelsKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v12;
    v40[2] = &unk_24F93B3F0;
    getAVLinearPCMIsFloatKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v13;
    v15 = MEMORY[0x24BDBD1C0];
    v40[3] = MEMORY[0x24BDBD1C0];
    getAVLinearPCMIsBigEndianKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = v16;
    v40[4] = v15;
    getAVLinearPCMBitDepthKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39[5] = v17;
    v40[5] = &unk_24F93B438;
    getAVEncoderAudioQualityKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39[6] = v18;
    v40[6] = &unk_24F93B408;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:
  v33 = 0;
  v34 = &v33;
  v35 = 0x2050000000;
  v23 = (void *)getAVAudioRecorderClass_softClass;
  v36 = getAVAudioRecorderClass_softClass;
  if (!getAVAudioRecorderClass_softClass)
  {
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __getAVAudioRecorderClass_block_invoke;
    v32[3] = &unk_24F8BB430;
    v32[4] = &v33;
    __getAVAudioRecorderClass_block_invoke((uint64_t)v32);
    v23 = (void *)v34[3];
  }
  v24 = objc_retainAutorelease(v23);
  _Block_object_dispose(&v33, 8);
  v30 = 0;
  v25 = objc_msgSend([v24 alloc], "initWithURL:settings:error:", v7, v14, &v30);
  v26 = v30;
  recorder = v9->_recorder;
  v9->_recorder = (AVAudioRecorder *)v25;

  if (v26)
    NSLog(CFSTR("AVAutoRecorder failed to initialize: %@"), v26);
  -[AVAudioRecorder setDelegate:](v9->_recorder, "setDelegate:", v9);
  v9->_recordingDuration = 0.0;
  v28 = v9;

LABEL_15:
  return v9;
}

- (BOOL)isRecording
{
  void *v2;
  char v3;

  -[WFAudioRecorder recorder](self, "recorder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRecording");

  return v3;
}

- (void)startRecording
{
  void *v3;
  void **v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  -[WFAudioRecorder setHasFinished:](self, "setHasFinished:", 0);
  objc_msgSend(getAVAudioSessionClass_41198(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v4 = (void **)getAVAudioSessionCategoryPlayAndRecordSymbolLoc_ptr;
  v29 = getAVAudioSessionCategoryPlayAndRecordSymbolLoc_ptr;
  if (!getAVAudioSessionCategoryPlayAndRecordSymbolLoc_ptr)
  {
    v5 = AVFoundationLibrary_41186();
    v4 = (void **)dlsym(v5, "AVAudioSessionCategoryPlayAndRecord");
    v27[3] = (uint64_t)v4;
    getAVAudioSessionCategoryPlayAndRecordSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v26, 8);
  if (v4)
  {
    v6 = *v4;
    v25 = 0;
    v7 = v6;
    v8 = objc_msgSend(v3, "setCategory:withOptions:error:", v7, 5, &v25);
    v9 = v25;

    if ((v8 & 1) == 0)
      NSLog(CFSTR("Failed to set audio session record category: %@"), v9);
    v24 = v9;
    v10 = objc_msgSend(v3, "setActive:error:", 1, &v24);
    v11 = v24;

    if ((v10 & 1) == 0)
      NSLog(CFSTR("Failed to set audio session active: %@"), v11);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    getAVAudioSessionInterruptionNotification();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_audioInterruption_, v13, v3);

    +[WFRecordingStatusManager sharedManager](WFRecordingStatusManager, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRecording:", 1);

    -[WFAudioRecorder setRunningUpdateTimer:](self, "setRunningUpdateTimer:", 1);
    -[WFAudioRecorder recordingDuration](self, "recordingDuration");
    v16 = v15;
    -[WFAudioRecorder recorder](self, "recorder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16 == 0.0)
    {
      objc_msgSend(v17, "record");
    }
    else
    {
      -[WFAudioRecorder recordingDuration](self, "recordingDuration");
      objc_msgSend(v18, "recordForDuration:");
    }

    -[WFAudioRecorder delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[WFAudioRecorder delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "audioRecorder:didStartRecording:error:", self, 1, 0);

    }
    -[WFAudioRecorder countdownFire:](self, "countdownFire:", self->_updateTimer);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAudioSessionCategoryPlayAndRecord(void)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("WFAudioRecorder.m"), 29, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)finishRecording
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!-[WFAudioRecorder hasFinished](self, "hasFinished"))
  {
    -[WFAudioRecorder setHasFinished:](self, "setHasFinished:", 1);
    -[WFAudioRecorder setRunningUpdateTimer:](self, "setRunningUpdateTimer:", 0);
    -[WFAudioRecorder recorder](self, "recorder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stop");

    objc_msgSend(getAVAudioSessionClass_41198(), "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:withOptions:error:", 0, 1, 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    getAVAudioSessionInterruptionNotification();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, v5, v7);

    +[WFRecordingStatusManager sharedManager](WFRecordingStatusManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRecording:", 0);

  }
}

- (void)recordForDuration:(double)a3
{
  -[WFAudioRecorder setRecordingDuration:](self, "setRecordingDuration:", a3);
  -[WFAudioRecorder startRecording](self, "startRecording");
}

- (void)pauseRecording
{
  id v3;

  if (-[WFAudioRecorder isRecording](self, "isRecording"))
  {
    if (!-[WFAudioRecorder paused](self, "paused"))
    {
      -[WFAudioRecorder setPaused:](self, "setPaused:", 1);
      -[WFAudioRecorder recorder](self, "recorder");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pause");

    }
  }
}

- (void)resumeRecording
{
  id v3;

  if (-[WFAudioRecorder paused](self, "paused"))
  {
    -[WFAudioRecorder setPaused:](self, "setPaused:", 0);
    -[WFAudioRecorder recorder](self, "recorder");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "record");

  }
}

- (void)audioInterruption:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v6 = (_QWORD *)getAVAudioSessionInterruptionTypeKeySymbolLoc_ptr;
  v15 = getAVAudioSessionInterruptionTypeKeySymbolLoc_ptr;
  if (!getAVAudioSessionInterruptionTypeKeySymbolLoc_ptr)
  {
    v7 = AVFoundationLibrary_41186();
    v6 = dlsym(v7, "AVAudioSessionInterruptionTypeKey");
    v13[3] = (uint64_t)v6;
    getAVAudioSessionInterruptionTypeKeySymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v12, 8);
  if (v6)
  {
    objc_msgSend(v5, "objectForKey:", *v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    if (v9)
    {
      if (v9 == 1)
        -[WFAudioRecorder pauseRecording](self, "pauseRecording");
    }
    else
    {
      -[WFAudioRecorder resumeRecording](self, "resumeRecording");
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSNotificationName getAVAudioSessionInterruptionTypeKey(void)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("WFAudioRecorder.m"), 31, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)countdownFire:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  char v8;
  id v9;

  -[WFAudioRecorder recorder](self, "recorder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTime");
  v6 = v5;

  -[WFAudioRecorder delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WFAudioRecorder delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "audioRecorder:didProgressToTime:", self, v6);

  }
}

- (BOOL)runningUpdateTimer
{
  void *v2;
  BOOL v3;

  -[WFAudioRecorder updateTimer](self, "updateTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setRunningUpdateTimer:(BOOL)a3
{
  _BOOL4 v3;
  NSTimer *v5;
  NSTimer *updateTimer;
  NSTimer *v7;

  v3 = a3;
  if (-[WFAudioRecorder runningUpdateTimer](self, "runningUpdateTimer") != a3)
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_countdownFire_, 0, 1, 1.0);
      v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      updateTimer = self->_updateTimer;
      self->_updateTimer = v5;

      -[NSTimer setTolerance:](self->_updateTimer, "setTolerance:", 0.05);
    }
    else
    {
      -[NSTimer invalidate](self->_updateTimer, "invalidate");
      v7 = self->_updateTimer;
      self->_updateTimer = 0;

    }
  }
}

- (void)audioRecorderDidFinishRecording:(id)a3 successfully:(BOOL)a4
{
  void *v5;
  void *v6;

  -[WFAudioRecorder delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAudioRecorder outputURL](self, "outputURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "audioRecorder:didFinishWithDestinationURL:error:", self, v6, 0);

  -[WFAudioRecorder finishRecording](self, "finishRecording");
}

- (void)audioRecorderEncodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[WFAudioRecorder delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "audioRecorder:didFinishWithDestinationURL:error:", self, 0, v5);

  -[WFAudioRecorder finishRecording](self, "finishRecording");
}

- (WFAudioRecorderDelegate)delegate
{
  return (WFAudioRecorderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)outputFormat
{
  return self->_outputFormat;
}

- (void)setOutputFormat:(int64_t)a3
{
  self->_outputFormat = a3;
}

- (double)recordingDuration
{
  return self->_recordingDuration;
}

- (void)setRecordingDuration:(double)a3
{
  self->_recordingDuration = a3;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
  objc_storeStrong((id *)&self->_outputURL, a3);
}

- (AVAudioRecorder)recorder
{
  return self->_recorder;
}

- (void)setRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_recorder, a3);
}

- (NSTimer)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_updateTimer, a3);
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (BOOL)hasFinished
{
  return self->_hasFinished;
}

- (void)setHasFinished:(BOOL)a3
{
  self->_hasFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_recorder, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)formattedStringWithDuration:(double)a3 elapsedTime:(double)a4
{
  double v4;
  id v5;
  void *v6;

  if (a3 == 0.0)
    v4 = a4;
  else
    v4 = a3 - a4;
  v5 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  objc_msgSend(v5, "setUnitsStyle:", 0);
  objc_msgSend(v5, "setZeroFormattingBehavior:", 0x10000);
  objc_msgSend(v5, "setAllowedUnits:", 192);
  if (v4 >= 3600.0)
    objc_msgSend(v5, "setAllowedUnits:", objc_msgSend(v5, "allowedUnits") | 0x20);
  objc_msgSend(v5, "stringFromTimeInterval:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
