@implementation HFAudioRecorder

- (HFAudioRecorder)initWithAudioRecorderDelegate:(id)a3
{
  id v4;
  HFAudioRecorder *v5;
  HFAudioRecorder *v6;
  uint64_t v7;
  NSDateFormatter *dateFormatter;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  HFAudioRecorder *v15;
  void *v16;
  void *v17;
  id v19;
  objc_super v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HFAudioRecorder;
  v5 = -[HFAudioRecorder init](&v20, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  objc_storeWeak((id *)&v5->_audioRecorderDelegate, v4);
  v7 = objc_opt_new();
  dateFormatter = v6->_dateFormatter;
  v6->_dateFormatter = (NSDateFormatter *)v7;

  v6->_recordingDurationLimit = -1.0;
  v6->_recordingStopSource = 0;
  -[HFAudioRecorder _createSystemSounds](v6, "_createSystemSounds");
  -[HFAudioRecorder _registerAudioSessionObservers](v6, "_registerAudioSessionObservers");
  -[HFAudioRecorder _setupAudioFileForRecording](v6, "_setupAudioFileForRecording");
  v9 = objc_alloc(MEMORY[0x1E0C89AE0]);
  -[HFAudioRecorder recordingAudiofileURL](v6, "recordingAudiofileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAudioRecorder _audioRecorderSettings](v6, "_audioRecorderSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v12 = (void *)objc_msgSend(v9, "initWithURL:settings:error:", v10, v11, &v19);
  v13 = v19;
  -[HFAudioRecorder setAudioRecorder:](v6, "setAudioRecorder:", v12);

  if (!v13)
  {
    -[HFAudioRecorder audioRecorder](v6, "audioRecorder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", v6);

    -[HFAudioRecorder audioRecorder](v6, "audioRecorder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMeteringEnabled:", 1);

LABEL_7:
    v15 = v6;
    goto LABEL_8;
  }
  HFLogForCategory(0xBuLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_error_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_ERROR, "-[AVVoiceController initWithContext:...] failed with error %@", buf, 0xCu);
  }

  -[HFAudioRecorder setAudioRecorder:](v6, "setAudioRecorder:", 0);
  v15 = 0;
LABEL_8:

  return v15;
}

- (HFAudioRecorder)initWithActivationMode:(int64_t)a3 delegate:(id)a4
{
  return -[HFAudioRecorder initWithAudioRecorderDelegate:](self, "initWithAudioRecorderDelegate:", a4);
}

- (void)dealloc
{
  AVAudioRecorder *audioRecorder;
  objc_super v4;

  -[AVAudioRecorder setDelegate:](self->_audioRecorder, "setDelegate:", 0);
  -[HFAudioRecorder _deactivateRecordingAudioSession](self, "_deactivateRecordingAudioSession");
  -[HFAudioRecorder _cleanup](self, "_cleanup");
  audioRecorder = self->_audioRecorder;
  self->_audioRecorder = 0;

  v4.receiver = self;
  v4.super_class = (Class)HFAudioRecorder;
  -[HFAudioRecorder dealloc](&v4, sel_dealloc);
}

- (void)prepareRecording
{
  NSObject *v3;
  uint8_t v4[16];

  HFLogForCategory(0xBuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "Calling prepareRecording", v4, 2u);
  }

  -[HFAudioRecorder _activateRecordingAudioSession](self, "_activateRecordingAudioSession");
}

- (void)startRecording
{
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  if (!-[HFAudioRecorder isAudioSessionActive](self, "isAudioSessionActive"))
    -[HFAudioRecorder _activateRecordingAudioSession](self, "_activateRecordingAudioSession");
  -[HFAudioRecorder audioRecorder](self, "audioRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAudioRecorder recordingDurationLimit](self, "recordingDurationLimit");
  v4 = objc_msgSend(v3, "recordForDuration:");

  HFLogForCategory(0xBuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "AVAudioRecorder failed to start recording", buf, 2u);
    }

    -[HFAudioRecorder audioRecorderDelegate](self, "audioRecorderDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "conformsToProtocol:", &unk_1F0476468))
    {
      -[HFAudioRecorder audioRecorderDelegate](self, "audioRecorderDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0)
      {
LABEL_16:
        -[HFAudioRecorder _cleanup](self, "_cleanup");
        return;
      }
      -[HFAudioRecorder audioRecorderDelegate](self, "audioRecorderDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "audioRecorderFailedToStartRecording:", v14);

    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "AVAudioRecorder started recording successfully", v15, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  -[HFAudioRecorder setRecordingStartTimeInterval:](self, "setRecordingStartTimeInterval:");

  -[HFAudioRecorder _startPowerMeteringTimer](self, "_startPowerMeteringTimer");
  -[HFAudioRecorder setRecording:](self, "setRecording:", 1);
  -[HFAudioRecorder audioRecorderDelegate](self, "audioRecorderDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1F0476468) & 1) != 0)
  {
    -[HFAudioRecorder audioRecorderDelegate](self, "audioRecorderDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
      return;
    -[HFAudioRecorder audioRecorderDelegate](self, "audioRecorderDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "audioRecorderDidStartRecording:", self);
  }

}

- (void)stopRecording
{
  id v3;

  -[HFAudioRecorder _deregisterAudioSessionObservers](self, "_deregisterAudioSessionObservers");
  -[HFAudioRecorder audioRecorder](self, "audioRecorder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

}

- (double)currentRecordedDuration
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  int v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HFAudioRecorder recordingStopTimeInterval](self, "recordingStopTimeInterval");
  if (v3 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSince1970");
    v6 = v5;

  }
  else
  {
    -[HFAudioRecorder recordingStopTimeInterval](self, "recordingStopTimeInterval");
    v6 = v7;
  }
  -[HFAudioRecorder recordingStartTimeInterval](self, "recordingStartTimeInterval");
  v9 = v6 - v8;
  HFLogForCategory(0xBuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = v9;
    _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Recorded so far %f", (uint8_t *)&v12, 0xCu);
  }

  return v9;
}

- (void)playAlertSoundForType:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  if (a3 == 1)
  {
    v7 = v6;
    -[HFAudioRecorder _playStopRecordingToneWithCompletion:](self, "_playStopRecordingToneWithCompletion:", v6);
    goto LABEL_5;
  }
  if (!a3)
  {
    v7 = v6;
    -[HFAudioRecorder _playStartRecordingToneWithCompletion:](self, "_playStartRecordingToneWithCompletion:", v6);
LABEL_5:
    v6 = v7;
  }

}

- (void)audioRecorderDidFinishRecording:(id)a3 successfully:(BOOL)a4
{
  NSObject *v5;
  void *v6;
  OpaqueAudioFileID *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint8_t v15[16];

  HFLogForCategory(0xBuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "AVAudioRecorder stopped recording", v15, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  -[HFAudioRecorder setRecordingStopTimeInterval:](self, "setRecordingStopTimeInterval:");

  -[HFAudioRecorder _stopPowerMeteringTimer](self, "_stopPowerMeteringTimer");
  -[HFAudioRecorder setRecording:](self, "setRecording:", 0);
  v7 = -[HFAudioRecorder recordingAudiofileID](self, "recordingAudiofileID");
  if (v7)
  {
    AudioFileClose(v7);
    -[HFAudioRecorder audioRecorderDelegate](self, "audioRecorderDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1F0476468))
    {
      -[HFAudioRecorder audioRecorderDelegate](self, "audioRecorderDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0)
      {
LABEL_8:
        -[HFAudioRecorder _deactivateRecordingAudioSession](self, "_deactivateRecordingAudioSession");
        return;
      }
      -[HFAudioRecorder audioRecorderDelegate](self, "audioRecorderDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAudioRecorder recordingAudiofileURL](self, "recordingAudiofileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "audioRecorderFinishedRecording:audioFile:", self, v11);

    }
    goto LABEL_8;
  }
  -[HFAudioRecorder audioRecorderDelegate](self, "audioRecorderDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "conformsToProtocol:", &unk_1F0476468))
    goto LABEL_12;
  -[HFAudioRecorder audioRecorderDelegate](self, "audioRecorderDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[HFAudioRecorder audioRecorderDelegate](self, "audioRecorderDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "audioRecorderFailedToFinishRecording:", self);
LABEL_12:

  }
  -[HFAudioRecorder _cleanup](self, "_cleanup");
}

- (void)audioSessionDidInterrupt:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0xBuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Audio Session was interrupted [%@]", (uint8_t *)&v6, 0xCu);
  }

  -[HFAudioRecorder setRecordingStopSource:](self, "setRecordingStopSource:", 1);
  -[HFAudioRecorder stopRecording](self, "stopRecording");

}

- (void)audioSessionMediaServicesWereLost:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0xBuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Media Services Were Lost [%@]", (uint8_t *)&v6, 0xCu);
  }

  -[HFAudioRecorder setRecordingStopSource:](self, "setRecordingStopSource:", 2);
  -[HFAudioRecorder stopRecording](self, "stopRecording");

}

- (void)audioSessionMediaServicesWereReset:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0xBuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Media Services Were Reset [%@]", (uint8_t *)&v6, 0xCu);
  }

  -[HFAudioRecorder setRecordingStopSource:](self, "setRecordingStopSource:", 2);
  -[HFAudioRecorder stopRecording](self, "stopRecording");

}

- (void)audioSessionRouteChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HFAudioRecorder isAudioSessionActive](self, "isAudioSessionActive"))
  {
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C89880]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    if ((unint64_t)(v7 - 1) <= 1)
    {
      HFLogForCategory(0xBuLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Audio Session Route Changed [%@]", (uint8_t *)&v10, 0xCu);
      }

      -[HFAudioRecorder setRecordingStopSource:](self, "setRecordingStopSource:", 3);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAudioRecorder setRouteChangeReason:](self, "setRouteChangeReason:", v9);

      -[HFAudioRecorder stopRecording](self, "stopRecording");
    }
  }

}

- (id)_audioRecorderSettings
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C89970];
  v5[0] = *MEMORY[0x1E0C898C8];
  v5[1] = v2;
  v6[0] = &unk_1EA7CC328;
  v6[1] = &unk_1EA7CD850;
  v3 = *MEMORY[0x1E0C89930];
  v5[2] = *MEMORY[0x1E0C898E0];
  v5[3] = v3;
  v6[2] = &unk_1EA7CC340;
  v6[3] = &unk_1EA7CC358;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_registerAudioSessionObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_audioSessionDidInterrupt_, *MEMORY[0x1E0C896F0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_audioSessionRouteChanged_, *MEMORY[0x1E0C89870], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_audioSessionMediaServicesWereLost_, *MEMORY[0x1E0C89730], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_audioSessionMediaServicesWereReset_, *MEMORY[0x1E0C89738], 0);

}

- (void)_deregisterAudioSessionObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C896F0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C89870], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C89730], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C89738], 0);

}

- (void)_setupAudioFileForRecording
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  OSStatus Property;
  OSStatus v22;
  const char *v23;
  OSStatus v24;
  OSStatus v25;
  UInt32 ioPropertyDataSize;
  id v27;
  AudioFileID outAudioFile;
  uint8_t v29[4];
  void *v30;
  AudioStreamBasicDescription buf;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  outAudioFile = 0;
  -[HFAudioRecorder dateFormatter](self, "dateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDateFormat:", CFSTR("MM-dd-yyyy"));

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAudioRecorder dateFormatter](self, "dateFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@.%@"), v6, v9, CFSTR("caf"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFUtilities sharedAnnouncementsDirectoryURL](HFUtilities, "sharedAnnouncementsDirectoryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v12, "stringByAppendingPathComponent:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPath:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLByDeletingLastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v27);
  v18 = v27;

  if (!v18)
  {
    memset(&buf.mFormatID, 0, 32);
    buf.mSampleRate = 24000.0;
    buf.mChannelsPerFrame = 1;
    buf.mFormatID = 1869641075;
    buf.mFramesPerPacket = 480;
    ioPropertyDataSize = 40;
    Property = AudioFormatGetProperty(0x666D7469u, 0, 0, &ioPropertyDataSize, &buf);
    if (Property)
    {
      v22 = Property;
      HFLogForCategory(0xBuLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v22, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v29 = 138412290;
      v30 = v20;
      v23 = "AudioFormatGetProperty failed with error [%@]";
    }
    else
    {
      v24 = AudioFileCreateWithURL((CFURLRef)v15, 0x63616666u, &buf, 3u, &outAudioFile);
      if (!v24)
      {
        -[HFAudioRecorder setRecordingAudiofileURL:](self, "setRecordingAudiofileURL:", v15);
        -[HFAudioRecorder setRecordingAudiofileID:](self, "setRecordingAudiofileID:", outAudioFile);
        goto LABEL_13;
      }
      v25 = v24;
      HFLogForCategory(0xBuLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v25, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v29 = 138412290;
      v30 = v20;
      v23 = "AudioFileCreateWithURL error %@";
    }
    _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, v23, v29, 0xCu);
    goto LABEL_11;
  }
  HFLogForCategory(0xBuLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v15, "URLByDeletingLastPathComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.mSampleRate) = 138412546;
    *(_QWORD *)((char *)&buf.mSampleRate + 4) = v20;
    LOWORD(buf.mFormatFlags) = 2112;
    *(_QWORD *)((char *)&buf.mFormatFlags + 2) = v18;
    _os_log_error_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_ERROR, "Error creating audio file at path [%@] - [%@]", (uint8_t *)&buf, 0x16u);
LABEL_11:

  }
LABEL_12:

LABEL_13:
}

- (void)_activateRecordingAudioSession
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0xBuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Now Activiation AudioSession", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C89688];
  v6 = *MEMORY[0x1E0C89748];
  v13 = 0;
  objc_msgSend(v4, "setCategory:mode:routeSharingPolicy:options:error:", v5, v6, 0, 12, &v13);
  v7 = v13;
  if (v7)
  {
    v8 = v7;
    HFLogForCategory(0xBuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      v10 = "AudioSession error setting category - [%@]";
LABEL_9:
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  objc_msgSend(v4, "setInterruptionFadeDuration:error:", &unk_1EA7CD860, 0);
  v12 = 0;
  objc_msgSend(v4, "setActive:error:", 1, &v12);
  v11 = v12;
  if (v11)
  {
    v8 = v11;
    HFLogForCategory(0xBuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      v10 = "AudioSession error activating audio session - [%@]";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  -[HFAudioRecorder setAudioSessionIsActive:](self, "setAudioSessionIsActive:", 1);
  HFLogForCategory(0xBuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "AudioSession activated  successfully", buf, 2u);
  }
LABEL_11:

}

- (void)_deactivateRecordingAudioSession
{
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0xBuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Releasing Audio Session", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v4, "setActive:withOptions:error:", 0, 1, &v7);
  v5 = v7;
  if (v5)
  {
    HFLogForCategory(0xBuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Error Deactivating audio session - [%@]", buf, 0xCu);
    }

  }
  -[HFAudioRecorder setAudioSessionIsActive:](self, "setAudioSessionIsActive:", 0);

}

- (void)_cleanup
{
  NSObject *v3;
  uint8_t v4[16];

  -[HFAudioRecorder setRecording:](self, "setRecording:", 0);
  -[HFAudioRecorder setRecordingAudiofileID:](self, "setRecordingAudiofileID:", 0);
  -[HFAudioRecorder setRecordingAudiofileURL:](self, "setRecordingAudiofileURL:", 0);
  -[HFAudioRecorder setTotalPacketsCount:](self, "setTotalPacketsCount:", 0);
  -[HFAudioRecorder setRecordingStartTimeInterval:](self, "setRecordingStartTimeInterval:", 0.0);
  -[HFAudioRecorder setRecordingStopTimeInterval:](self, "setRecordingStopTimeInterval:", 0.0);
  HFLogForCategory(0xBuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up current recording session is now complete", v4, 2u);
  }

}

- (void)_startPowerMeteringTimer
{
  void *v3;
  dispatch_source_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  -[HFAudioRecorder powerMeteringTimer](self, "powerMeteringTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[HFAudioRecorder _stopPowerMeteringTimer](self, "_stopPowerMeteringTimer");
  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  -[HFAudioRecorder setPowerMeteringTimer:](self, "setPowerMeteringTimer:", v4);

  -[HFAudioRecorder powerMeteringTimer](self, "powerMeteringTimer");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v5, 0, 0x3F940AAuLL, 0);

  objc_initWeak(&location, self);
  -[HFAudioRecorder powerMeteringTimer](self, "powerMeteringTimer");
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __43__HFAudioRecorder__startPowerMeteringTimer__block_invoke;
  v11 = &unk_1EA728AE8;
  objc_copyWeak(&v12, &location);
  dispatch_source_set_event_handler(v6, &v8);

  -[HFAudioRecorder powerMeteringTimer](self, "powerMeteringTimer", v8, v9, v10, v11);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __43__HFAudioRecorder__startPowerMeteringTimer__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "audioRecorder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateMeters");

  objc_msgSend(WeakRetained, "audioRecorder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "averagePowerForChannel:", 0);
  v4 = v3;

  objc_msgSend(WeakRetained, "audioRecorderDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "conformsToProtocol:", &unk_1F0476468))
    goto LABEL_4;
  objc_msgSend(WeakRetained, "audioRecorderDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  v8 = WeakRetained;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "audioRecorderDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = v4;
    objc_msgSend(v5, "didUpdateAveragePower:", v9);
LABEL_4:

    v8 = WeakRetained;
  }

}

- (void)_stopPowerMeteringTimer
{
  NSObject *v3;

  if (-[HFAudioRecorder _isPowerMeteringTimerValid](self, "_isPowerMeteringTimerValid"))
  {
    -[HFAudioRecorder powerMeteringTimer](self, "powerMeteringTimer");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v3);

  }
}

- (BOOL)_isPowerMeteringTimerValid
{
  void *v3;
  NSObject *v4;
  BOOL v5;

  -[HFAudioRecorder powerMeteringTimer](self, "powerMeteringTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HFAudioRecorder powerMeteringTimer](self, "powerMeteringTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_source_testcancel(v4) == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_createSystemSounds
{
  void *v3;
  const __CFURL *v4;
  void *v5;
  const __CFURL *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathForResource:ofType:", CFSTR("mic_open-Announce"), CFSTR("wav"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathForResource:ofType:", CFSTR("mic_closed-Announce"), CFSTR("wav"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  AudioServicesCreateSystemSoundID(v4, &self->_soundIDForRecordBegin);
  AudioServicesCreateSystemSoundID(v6, &self->_soundIDForRecordEnd);

}

- (void)_playStartRecordingToneWithCompletion:(id)a3
{
  AudioServicesPlaySystemSoundWithCompletion(self->_soundIDForRecordBegin, a3);
}

- (void)_playStopRecordingToneWithCompletion:(id)a3
{
  AudioServicesPlaySystemSoundWithCompletion(self->_soundIDForRecordEnd, a3);
}

- (double)recordingDurationLimit
{
  return self->_recordingDurationLimit;
}

- (void)setRecordingDurationLimit:(double)a3
{
  self->_recordingDurationLimit = a3;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (unint64_t)recordingStopSource
{
  return self->_recordingStopSource;
}

- (void)setRecordingStopSource:(unint64_t)a3
{
  self->_recordingStopSource = a3;
}

- (NSNumber)routeChangeReason
{
  return self->_routeChangeReason;
}

- (void)setRouteChangeReason:(id)a3
{
  objc_storeStrong((id *)&self->_routeChangeReason, a3);
}

- (HFAudioRecorderDelegate)audioRecorderDelegate
{
  return (HFAudioRecorderDelegate *)objc_loadWeakRetained((id *)&self->_audioRecorderDelegate);
}

- (void)setAudioRecorderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_audioRecorderDelegate, a3);
}

- (OS_dispatch_source)powerMeteringTimer
{
  return self->_powerMeteringTimer;
}

- (void)setPowerMeteringTimer:(id)a3
{
  objc_storeStrong((id *)&self->_powerMeteringTimer, a3);
}

- (BOOL)isAudioSessionActive
{
  return self->_audioSessionIsActive;
}

- (void)setAudioSessionIsActive:(BOOL)a3
{
  self->_audioSessionIsActive = a3;
}

- (AVAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (void)setAudioRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_audioRecorder, a3);
}

- (double)recordingStartTimeInterval
{
  return self->_recordingStartTimeInterval;
}

- (void)setRecordingStartTimeInterval:(double)a3
{
  self->_recordingStartTimeInterval = a3;
}

- (double)recordingStopTimeInterval
{
  return self->_recordingStopTimeInterval;
}

- (void)setRecordingStopTimeInterval:(double)a3
{
  self->_recordingStopTimeInterval = a3;
}

- (OpaqueAudioFileID)recordingAudiofileID
{
  return self->_recordingAudiofileID;
}

- (void)setRecordingAudiofileID:(OpaqueAudioFileID *)a3
{
  self->_recordingAudiofileID = a3;
}

- (NSURL)recordingAudiofileURL
{
  return self->_recordingAudiofileURL;
}

- (void)setRecordingAudiofileURL:(id)a3
{
  objc_storeStrong((id *)&self->_recordingAudiofileURL, a3);
}

- (int64_t)totalPacketsCount
{
  return self->_totalPacketsCount;
}

- (void)setTotalPacketsCount:(int64_t)a3
{
  self->_totalPacketsCount = a3;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (unsigned)soundIDForRecordBegin
{
  return self->_soundIDForRecordBegin;
}

- (void)setSoundIDForRecordBegin:(unsigned int)a3
{
  self->_soundIDForRecordBegin = a3;
}

- (unsigned)soundIDForRecordEnd
{
  return self->_soundIDForRecordEnd;
}

- (void)setSoundIDForRecordEnd:(unsigned int)a3
{
  self->_soundIDForRecordEnd = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_recordingAudiofileURL, 0);
  objc_storeStrong((id *)&self->_audioRecorder, 0);
  objc_storeStrong((id *)&self->_powerMeteringTimer, 0);
  objc_destroyWeak((id *)&self->_audioRecorderDelegate);
  objc_storeStrong((id *)&self->_routeChangeReason, 0);
}

@end
