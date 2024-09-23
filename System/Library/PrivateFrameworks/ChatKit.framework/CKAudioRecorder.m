@implementation CKAudioRecorder

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CKVoiceController setDelegate:](self->_voiceController, "setDelegate:", 0);
  -[CKVoiceController releaseAudioSession](self->_voiceController, "releaseAudioSession");
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdleTimerDisabled:", 0);

  v5.receiver = self;
  v5.super_class = (Class)CKAudioRecorder;
  -[CKAudioRecorder dealloc](&v5, sel_dealloc);
}

- (CKAudioRecorder)init
{
  CKAudioRecorder *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAudioRecorder;
  v2 = -[CKAudioRecorder init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_applicationDidEnterBackground_, *MEMORY[0x1E0CEB288], 0);
    -[CKAudioRecorder resetState](v2, "resetState");

  }
  return v2;
}

- (double)duration
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[CKAudioRecorder startDate](self, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v4 = v3;
    objc_msgSend(v2, "timeIntervalSinceReferenceDate");
    v6 = v4 - v5;
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (void)startRecordingForRaiseGesture
{
  -[CKAudioRecorder startRecordingForRaiseGesture:shouldPlaySound:](self, "startRecordingForRaiseGesture:shouldPlaySound:", 1, 0);
}

- (void)startRecordingAndPlaySound:(BOOL)a3
{
  -[CKAudioRecorder startRecordingForRaiseGesture:shouldPlaySound:](self, "startRecordingForRaiseGesture:shouldPlaySound:", 0, a3);
}

- (void)startRecordingForRaiseGesture:(BOOL)a3 shouldPlaySound:(BOOL)a4
{
  _BOOL4 v4;
  int v5;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  CKVoiceController *v10;
  CKVoiceController *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CKVoiceController *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[4];
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v4 = a4;
  v5 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v20 = v5;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "startRecordingForRaiseGesture: %d", buf, 8u);
    }

  }
  -[CKAudioRecorder setRecording:](self, "setRecording:", 1);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdleTimerDisabled:", 1);

  if (v5)
    v9 = 1768764005;
  else
    v9 = 1768780647;
  -[CKAudioRecorder setShouldPlayStartSound:](self, "setShouldPlayStartSound:", v4 & ~v5);
  -[CKAudioRecorder voiceController](self, "voiceController");
  v10 = (CKVoiceController *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    -[CKVoiceController setActivationMode:](v10, "setActivationMode:", v9);
  }
  else
  {
    v12 = *MEMORY[0x1E0C89970];
    v17[0] = *MEMORY[0x1E0C898C8];
    v17[1] = v12;
    v18[0] = &unk_1E2870A50;
    v18[1] = &unk_1E28714C0;
    v13 = *MEMORY[0x1E0C89930];
    v17[2] = *MEMORY[0x1E0C898E0];
    v17[3] = v13;
    v18[2] = &unk_1E2870A68;
    v18[3] = &unk_1E2870A80;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [CKVoiceController alloc];
    +[CKAudioSessionController queue](CKAudioSessionController, "queue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CKVoiceController initWithActivationMode:recordSettings:queue:](v15, "initWithActivationMode:recordSettings:queue:", v9, v14, v16);

    -[CKVoiceController setDelegate:](v11, "setDelegate:", self);
    -[CKAudioRecorder setVoiceController:](self, "setVoiceController:", v11);

  }
  if (-[CKAudioRecorder isPaused](self, "isPaused"))
    -[CKAudioRecorder openExistingAudioFile](self, "openExistingAudioFile");
  else
    -[CKAudioRecorder createNewAudioFile](self, "createNewAudioFile");
  -[CKVoiceController record](v11, "record");

}

- (void)openExistingAudioFile
{
  const __CFURL *v3;
  OSStatus v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  AudioFileID outAudioFile;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  outAudioFile = -[CKAudioRecorder fileID](self, "fileID");
  -[CKAudioRecorder fileURL](self, "fileURL");
  v3 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v4 = AudioFileOpenURL(v3, kAudioFileReadWritePermission, 0x63616666u, &outAudioFile);

  v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v4, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v7;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "AudioFileOpenURL error %@", buf, 0xCu);

      }
    }
    -[CKAudioRecorder voiceController](self, "voiceController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAudioRecorder voiceControllerDidFinishRecording:successfully:](self, "voiceControllerDidFinishRecording:successfully:", v8, 0);

  }
  else
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        -[CKAudioRecorder fileURL](self, "fileURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v10;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Opened existing audio file with fileURL: %@", buf, 0xCu);

      }
    }
    -[CKAudioRecorder setFileID:](self, "setFileID:", outAudioFile);
  }
}

- (void)createNewAudioFile
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  OSStatus Property;
  NSObject *v11;
  void *v12;
  void *v13;
  OSStatus v14;
  int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  UInt32 ioPropertyDataSize;
  id v20;
  AudioFileID outAudioFile;
  uint8_t v22[4];
  void *v23;
  AudioStreamBasicDescription buf;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  outAudioFile = 0;
  CKAttachmentTmpFileURL(CFSTR("Audio Message.caf"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v20);
  v6 = v20;

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "URLByDeletingLastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.mSampleRate) = 138412546;
        *(_QWORD *)((char *)&buf.mSampleRate + 4) = v8;
        LOWORD(buf.mFormatFlags) = 2112;
        *(_QWORD *)((char *)&buf.mFormatFlags + 2) = v6;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "-[NSFileManager createDirectoryAtURL:%@ withIntermediateDirectories:YES...] failed with error %@", (uint8_t *)&buf, 0x16u);

      }
    }
    -[CKAudioRecorder voiceController](self, "voiceController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAudioRecorder voiceControllerDidFinishRecording:successfully:](self, "voiceControllerDidFinishRecording:successfully:", v9, 0);

    goto LABEL_24;
  }
  memset(&buf.mFormatID, 0, 32);
  buf.mSampleRate = 24000.0;
  buf.mChannelsPerFrame = 1;
  buf.mFormatID = 1869641075;
  buf.mFramesPerPacket = 480;
  ioPropertyDataSize = 40;
  Property = AudioFormatGetProperty(0x666D7469u, 0, 0, &ioPropertyDataSize, &buf);
  if (Property)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], Property, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138412290;
        v23 = v12;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "AudioFormatGetProperty failed with error %@", v22, 0xCu);

      }
    }
LABEL_12:
    -[CKAudioRecorder voiceController](self, "voiceController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAudioRecorder voiceControllerDidFinishRecording:successfully:](self, "voiceControllerDidFinishRecording:successfully:", v13, 0);

    goto LABEL_24;
  }
  v14 = AudioFileCreateWithURL((CFURLRef)v3, 0x63616666u, &buf, 3u, &outAudioFile);
  v15 = IMOSLoggingEnabled();
  if (v14)
  {
    if (v15)
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v14, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138412290;
        v23 = v17;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "AudioFileCreateWithURL error %@", v22, 0xCu);

      }
    }
    goto LABEL_12;
  }
  if (v15)
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v22 = 138412290;
      v23 = v3;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Created new audio file with fileURL: %@", v22, 0xCu);
    }

  }
  -[CKAudioRecorder setFileURL:](self, "setFileURL:", v3);
  -[CKAudioRecorder setFileID:](self, "setFileID:", outAudioFile);
LABEL_24:

}

- (void)stopRecording:(id)a3
{
  -[CKAudioRecorder stopRecordingAndPlaySound:completion:](self, "stopRecordingAndPlaySound:completion:", 0, a3);
}

- (void)stopRecordingAndPlaySound:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  _DWORD v17[2];
  __int16 v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = _Block_copy(v6);
      v17[0] = 67109890;
      v17[1] = v4;
      v18 = 2112;
      v19 = v8;
      v20 = 1024;
      v21 = -[CKAudioRecorder isCancelled](self, "isCancelled");
      v22 = 1024;
      v23 = -[CKAudioRecorder isRecording](self, "isRecording");
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "stopRecordingAndPlaySound: %d completion: %@ (cancelled: %d isRecording: %d)", (uint8_t *)v17, 0x1Eu);

    }
  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdleTimerDisabled:", 0);

  if (-[CKAudioRecorder isRecording](self, "isRecording"))
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isAudioMessagesEntryViewRecordingEnabled");

    if ((v11 & 1) != 0
      || (-[CKAudioRecorder completion](self, "completion"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = v12 == 0,
          v12,
          v13))
    {
      -[CKAudioRecorder setShouldPlayStopSound:](self, "setShouldPlayStopSound:", v4);
      -[CKAudioRecorder setCompletion:](self, "setCompletion:", v6);
      -[CKAudioRecorder voiceController](self, "voiceController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stop");

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17[0]) = 0;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "No-op already stopped recording", (uint8_t *)v17, 2u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17[0]) = 0;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Can't stop audio recording which hasn't started", (uint8_t *)v17, 2u);
      }

    }
    if (v6)
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)cancelRecording
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Cancel recording", buf, 2u);
    }

  }
  -[CKAudioRecorder completion](self, "completion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "No-op already stopped recording", v6, 2u);
      }

    }
  }
  else
  {
    -[CKAudioRecorder setCancelled:](self, "setCancelled:", 1);
    -[CKAudioRecorder stopRecording:](self, "stopRecording:", 0);
  }
}

- (void)voiceControllerDidStartRecording:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAudioRecorder setStartDate:](self, "setStartDate:", v4);

  -[CKAudioRecorder delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKAudioRecorder delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioRecorderDidStartRecording:", self);

  }
  if (-[CKAudioRecorder shouldPlayStartSound](self, "shouldPlayStartSound"))
  {
    -[CKAudioRecorder voiceController](self, "voiceController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playAlertSoundForType:", 1);

  }
}

- (void)voiceControllerDidFinishRecording:(id)a3 successfully:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  double v8;
  NSObject *v9;
  void *v10;
  OpaqueAudioFileID *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  _BOOL4 v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v29 = v4;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "voiceControllerDidFinishRecording:successfully: %d", buf, 8u);
    }

  }
  if (v4)
  {
    -[CKAudioRecorder duration](self, "duration");
    if (v8 < 0.5)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Recording cancelled because it is too short.", buf, 2u);
        }

      }
      -[CKAudioRecorder setCancelled:](self, "setCancelled:", 1);
    }
  }
  -[CKAudioRecorder fileURL](self, "fileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CKAudioRecorder fileID](self, "fileID");
  if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Closing Audio File", buf, 2u);
      }

    }
    AudioFileClose(v11);
  }
  if (v4 && !-[CKAudioRecorder isCancelled](self, "isCancelled"))
  {
    v26 = *MEMORY[0x1E0D37EF0];
    v27 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mediaObjectWithFileURL:filename:transcoderUserInfo:", v10, 0, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setTemporaryFileURL:", v10);
    objc_msgSend(v16, "setTotalPacketsCount:", -[CKAudioRecorder totalPacketsCount](self, "totalPacketsCount"));
    +[CKComposition audioCompositionWithMediaObject:](CKComposition, "audioCompositionWithMediaObject:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  -[CKAudioRecorder voiceController](self, "voiceController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKAudioRecorder shouldPlayStopSound](self, "shouldPlayStopSound"))
  {
    if (v4)
    {
      if (-[CKAudioRecorder isCancelled](self, "isCancelled"))
        v18 = 3;
      else
        v18 = 2;
    }
    else
    {
      v18 = 3;
    }
    objc_msgSend(v17, "playAlertSoundForType:", v18);
  }
  objc_msgSend(v17, "releaseAudioSession");
  -[CKAudioRecorder setRecording:](self, "setRecording:", 0);
  -[CKAudioRecorder completion](self, "completion");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v13);
  if (!v4)
  {
    -[CKAudioRecorder delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "audioRecorderRecordingDidFail:", self);

  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isAudioMessagesEntryViewRecordingEnabled");

  if (v23)
  {
    if (!-[CKAudioRecorder isPaused](self, "isPaused") || -[CKAudioRecorder isCancelled](self, "isCancelled"))
    {
      -[CKAudioRecorder resetState](self, "resetState");
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeItemAtURL:error:", v10, 0);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeItemAtURL:error:", v10, 0);

    -[CKAudioRecorder resetState](self, "resetState");
  }

}

- (void)voiceControllerRecordBufferAvailable:(id)a3 buffer:(id)a4
{
  id v6;
  id v7;
  int v8;
  UInt32 v9;
  UInt32 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  SInt64 v19;
  OSStatus v20;
  NSObject *v21;
  void *v22;
  UInt32 ioNumPackets;
  uint8_t buf[4];
  _DWORD v25[7];

  *(_QWORD *)&v25[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "packetDescriptionCount");
  v9 = objc_msgSend(v7, "bytesDataSize");
  v10 = v9;
  if (v8 && v9)
  {
    v11 = objc_msgSend(v7, "packetDescriptions");
    v12 = 0;
    while (1)
    {
      v13 = *(_QWORD *)v11;
      if ((*(_QWORD *)v11 & 0x8000000000000000) != 0)
      {
        if ((IMOSLoggingEnabled() & 1) == 0)
          goto LABEL_20;
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v25 = v17;
          _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Bad packet start offset %@. Skipping rest of record buffer.", buf, 0xCu);

        }
        goto LABEL_19;
      }
      v14 = *(unsigned int *)(v11 + 12);
      if (v14 > v10)
        break;
      ++v12;
      v11 += 16;
      if (v8 == v12)
      {
        LODWORD(v12) = v8;
        goto LABEL_20;
      }
    }
    if ((IMOSLoggingEnabled() & 1) == 0)
      goto LABEL_20;
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v25 = v18;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Bad packet size %@. Skipping rest of record buffer.", buf, 0xCu);

    }
LABEL_19:

LABEL_20:
    ioNumPackets = v12;
    v19 = -[CKAudioRecorder totalPacketsCount](self, "totalPacketsCount");
    v20 = AudioFileWritePackets(-[CKAudioRecorder fileID](self, "fileID"), 0, v10, (const AudioStreamPacketDescription *)objc_msgSend(v7, "packetDescriptions"), v19, &ioNumPackets, (const void *)objc_msgSend(v7, "data"));
    if (v20 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v20, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v25 = v22;
        _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "AudioFileWritePackets failed with error %@", buf, 0xCu);

      }
    }
    -[CKAudioRecorder setTotalPacketsCount:](self, "setTotalPacketsCount:", v19 + ioNumPackets);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v25[0] = v8;
      LOWORD(v25[1]) = 1024;
      *(_DWORD *)((char *)&v25[1] + 2) = v10;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "AVVCAudioBuffer contains %d packet descriptions, size %d. Ignoring", buf, 0xEu);
    }

  }
}

- (void)voiceController:(id)a3 didUpdateAveragePower:(float)a4
{
  double v5;
  id v6;

  -[CKAudioRecorder delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a4;
  objc_msgSend(v6, "audioRecorderDidUpdateAveragePower:", v5);

}

- (void)resumeRecording
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[CKAudioRecorder isPaused](self, "isPaused"))
  {
    -[CKAudioRecorder startRecordingForRaiseGesture:shouldPlaySound:](self, "startRecordingForRaiseGesture:shouldPlaySound:", 0, 1);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Cannot resume recording because the recording is not paused.", v4, 2u);
    }

  }
}

- (float)averagePower
{
  void *v2;
  float v3;
  float v4;

  -[CKAudioRecorder voiceController](self, "voiceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "averagePower");
  v4 = v3;

  return v4;
}

- (void)setRecording:(BOOL)a3
{
  id v4;

  if (self->_recording != a3)
  {
    self->_recording = a3;
    -[CKAudioRecorder delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioRecorderRecordingDidChange:", self);

  }
}

- (void)resetState
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Reseting audio recorder state", v6, 2u);
    }

  }
  -[CKAudioRecorder voiceController](self, "voiceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[CKAudioRecorder voiceController](self, "voiceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cleanup");

  -[CKAudioRecorder setVoiceController:](self, "setVoiceController:", 0);
  -[CKAudioRecorder setRecording:](self, "setRecording:", 0);
  -[CKAudioRecorder setCancelled:](self, "setCancelled:", 0);
  -[CKAudioRecorder setFileURL:](self, "setFileURL:", 0);
  -[CKAudioRecorder setStartDate:](self, "setStartDate:", 0);
  -[CKAudioRecorder setCompletion:](self, "setCompletion:", 0);
  -[CKAudioRecorder setShouldPlayStopSound:](self, "setShouldPlayStopSound:", 0);
  -[CKAudioRecorder setFileID:](self, "setFileID:", 0);
  -[CKAudioRecorder setTotalPacketsCount:](self, "setTotalPacketsCount:", 0);
  -[CKAudioRecorder setPaused:](self, "setPaused:", 0);
}

- (void)applicationDidEnterBackground:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAudioMessagesEntryViewRecordingEnabled");

  if ((v5 & 1) == 0)
  {
    if (-[CKAudioRecorder isRecording](self, "isRecording"))
      -[CKAudioRecorder cancelRecording](self, "cancelRecording");
  }
}

- (CKAudioRecorderDelegate)delegate
{
  return (CKAudioRecorderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)totalPacketsCount
{
  return self->_totalPacketsCount;
}

- (void)setTotalPacketsCount:(int64_t)a3
{
  self->_totalPacketsCount = a3;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (CKVoiceController)voiceController
{
  return self->_voiceController;
}

- (void)setVoiceController:(id)a3
{
  objc_storeStrong((id *)&self->_voiceController, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (BOOL)shouldPlayStartSound
{
  return self->_shouldPlayStartSound;
}

- (void)setShouldPlayStartSound:(BOOL)a3
{
  self->_shouldPlayStartSound = a3;
}

- (BOOL)shouldPlayStopSound
{
  return self->_shouldPlayStopSound;
}

- (void)setShouldPlayStopSound:(BOOL)a3
{
  self->_shouldPlayStopSound = a3;
}

- (OpaqueAudioFileID)fileID
{
  return self->_fileID;
}

- (void)setFileID:(OpaqueAudioFileID *)a3
{
  self->_fileID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_voiceController, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
