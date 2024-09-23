@implementation CSAudioFileManager

+ (id)_sharedAudioLoggingQueue
{
  if (_sharedAudioLoggingQueue_onceToken != -1)
    dispatch_once(&_sharedAudioLoggingQueue_onceToken, &__block_literal_global_10505);
  return (id)_sharedAudioLoggingQueue_sharedQueue;
}

+ (void)generateDeviceAudioLogging:(id)a3 speechId:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_sharedAudioLoggingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__CSAudioFileManager_generateDeviceAudioLogging_speechId___block_invoke;
  v11[3] = &unk_1E6880E88;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

}

+ (void)_readDataFromFileHandle:(id)a3 toFileHandle:(id)a4
{
  id v5;
  id v6;
  float v7;
  float v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  _BYTE v36[18];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (float)(10
             * (unint64_t)+[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels"));
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  v9 = (unint64_t)(float)((float)(v8 * v7)
                               * (float)+[CSConfig inputRecordingSampleByteDepth](CSConfig, "inputRecordingSampleByteDepth"));
  v10 = objc_msgSend(v5, "seekToEndOfFile");
  objc_msgSend(v5, "seekToFileOffset:", 16);
  v32 = 0;
  objc_msgSend(v5, "readDataOfLength:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getBytes:length:", &v32, 8);

  v12 = (id)objc_msgSend(v5, "readDataOfLength:", v32);
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v5, "readDataOfLength:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithData:encoding:", v14, 4);

  if (objc_msgSend(v15, "isEqualToString:", CFSTR("FLLR")))
  {
    *(_WORD *)buf = 0;
    objc_msgSend(v5, "readDataOfLength:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "getBytes:length:", buf, 2);

    v17 = (id)objc_msgSend(v5, "readDataOfLength:", *(unsigned __int16 *)buf);
  }
  v18 = (id)objc_msgSend(v5, "readDataOfLength:", 8);
  v19 = objc_msgSend(v5, "offsetInFile");
  if (v10 - v19 >= v9)
    v20 = v9;
  else
    v20 = v10 - v19;
  v21 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    v23 = objc_msgSend(v5, "offsetInFile");
    *(_DWORD *)buf = 136315650;
    v34 = "+[CSAudioFileManager _readDataFromFileHandle:toFileHandle:]";
    v35 = 1026;
    *(_DWORD *)v36 = v20;
    *(_WORD *)&v36[4] = 2050;
    *(_QWORD *)&v36[6] = v23;
    _os_log_impl(&dword_1B502E000, v22, OS_LOG_TYPE_DEFAULT, "%s Start copying %{public}u bytes of data to crashreporter with wav file header offset %{public}llu", buf, 0x1Cu);

  }
  objc_msgSend(v5, "readDataOfLength:", v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24 && objc_msgSend(v24, "length"))
  {
    v31 = 0;
    objc_msgSend(v6, "writeData:error:", v25, &v31);
    v26 = v31;
    v27 = CSLogCategoryAudio;
    if (v26 && os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v29 = v27;
      objc_msgSend(v26, "localizedDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v34 = "+[CSAudioFileManager _readDataFromFileHandle:toFileHandle:]";
      v35 = 2114;
      *(_QWORD *)v36 = v6;
      *(_WORD *)&v36[8] = 2114;
      *(_QWORD *)&v36[10] = v30;
      _os_log_error_impl(&dword_1B502E000, v29, OS_LOG_TYPE_ERROR, "%s Unable to writeData to %{public}@ : %{public}@", buf, 0x20u);

      v27 = CSLogCategoryAudio;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "+[CSAudioFileManager _readDataFromFileHandle:toFileHandle:]";
      _os_log_impl(&dword_1B502E000, v27, OS_LOG_TYPE_DEFAULT, "%s Finished copying data to crashreporter.", buf, 0xCu);
    }

  }
  else
  {
    v28 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "+[CSAudioFileManager _readDataFromFileHandle:toFileHandle:]";
      v35 = 2114;
      *(_QWORD *)v36 = v5;
      _os_log_error_impl(&dword_1B502E000, v28, OS_LOG_TYPE_ERROR, "%s Failed to read data from %{public}@", buf, 0x16u);
    }
  }

}

+ (id)createAudioFileWriterForOpportuneSpeakListenerWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4
{
  void *v7;
  int v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  _OWORD v15[2];
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;

  objc_msgSend(MEMORY[0x1E0CFE980], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "opportuneSpeakingFileLoggingIsEnabled");

  if (!v8)
    return 0;
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assistantAudioFileLogDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)&a3->mBytesPerPacket;
  v17[0] = *(_OWORD *)&a3->mSampleRate;
  v17[1] = v11;
  v18 = *(_QWORD *)&a3->mBitsPerChannel;
  v12 = *(_OWORD *)&a4->mBytesPerPacket;
  v15[0] = *(_OWORD *)&a4->mSampleRate;
  v15[1] = v12;
  v16 = *(_QWORD *)&a4->mBitsPerChannel;
  objc_msgSend(a1, "_createAudioFileWriterForOpportuneSpeakListenerWithLoggingDir:inputFormat:outputFormat:", v10, v17, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)createAudioFileWriterForPHSTrainingWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4
{
  void *v7;
  int v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  _OWORD v15[2];
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;

  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "personalizedSiriEnrollmentAudioLoggingEnabled");

  if (!v8)
    return 0;
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assistantAudioFileLogDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)&a3->mBytesPerPacket;
  v17[0] = *(_OWORD *)&a3->mSampleRate;
  v17[1] = v11;
  v18 = *(_QWORD *)&a3->mBitsPerChannel;
  v12 = *(_OWORD *)&a4->mBytesPerPacket;
  v15[0] = *(_OWORD *)&a4->mSampleRate;
  v15[1] = v12;
  v16 = *(_QWORD *)&a4->mBitsPerChannel;
  objc_msgSend(a1, "_createAudioFileWriterForPHSTrainingWithLoggingDir:inputFormat:outputFormat:", v10, v17, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)createAudioFileWriterForRemoteVADWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4 withLoggingUUID:(id)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  _OWORD v17[2];
  uint64_t v18;
  _OWORD v19[2];
  uint64_t v20;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CFE980], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileLoggingIsEnabled");

  if (v10)
  {
    +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assistantAudioFileLogDirectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_OWORD *)&a3->mBytesPerPacket;
    v19[0] = *(_OWORD *)&a3->mSampleRate;
    v19[1] = v13;
    v20 = *(_QWORD *)&a3->mBitsPerChannel;
    v14 = *(_OWORD *)&a4->mBytesPerPacket;
    v17[0] = *(_OWORD *)&a4->mSampleRate;
    v17[1] = v14;
    v18 = *(_QWORD *)&a4->mBitsPerChannel;
    objc_msgSend(a1, "_createAudioFileWriterWithLoggingDir:withLoggingUUID:inputFormat:outputFormat:", v12, v8, v19, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)createAudioFileWriterWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4 withLoggingUUID:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  _OWORD v18[2];
  uint64_t v19;
  _OWORD v20[2];
  uint64_t v21;

  v8 = a5;
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (!CSIsHorseman_isHorseman)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CFE980], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "fileLoggingIsEnabled"))
  {
    +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fileLoggingIsEnabled");

    if (v11)
      goto LABEL_7;
LABEL_8:
    v16 = 0;
    goto LABEL_9;
  }

LABEL_7:
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assistantAudioFileLogDirectory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_OWORD *)&a3->mBytesPerPacket;
  v20[0] = *(_OWORD *)&a3->mSampleRate;
  v20[1] = v14;
  v21 = *(_QWORD *)&a3->mBitsPerChannel;
  v15 = *(_OWORD *)&a4->mBytesPerPacket;
  v18[0] = *(_OWORD *)&a4->mSampleRate;
  v18[1] = v15;
  v19 = *(_QWORD *)&a4->mBitsPerChannel;
  objc_msgSend(a1, "_createAudioFileWriterWithLoggingDir:withLoggingUUID:inputFormat:outputFormat:", v13, v8, v20, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v16;
}

+ (id)createSelectiveChannelAudioFileWriterWithChannelBitset:(unint64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CSSelectiveChannelAudioFileWriter *v16;
  CSSelectiveChannelAudioFileWriter *v17;
  _OWORD v19[2];
  uint64_t v20;
  _OWORD v21[2];
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (!CSIsHorseman_isHorseman)
    goto LABEL_8;
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "fileLoggingIsEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CFE980], "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fileLoggingIsEnabled");

    if (v7)
      goto LABEL_7;
LABEL_8:
    v17 = 0;
    return v17;
  }

LABEL_7:
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "_getDateLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@.wav"), CFSTR("CS-"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileURLWithPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = +[CSUtils getNumElementInBitset:](CSUtils, "getNumElementInBitset:", a3);
  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:", v15);
  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  +[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmInterleavedASBDWithSampleRate:numberOfChannels:", v15);
  v16 = [CSSelectiveChannelAudioFileWriter alloc];
  v21[0] = v26;
  v21[1] = v27;
  v22 = v28;
  v19[0] = v23;
  v19[1] = v24;
  v20 = v25;
  v17 = -[CSSelectiveChannelAudioFileWriter initWithURL:inputFormat:outputFormat:channelBitset:](v16, "initWithURL:inputFormat:outputFormat:channelBitset:", v14, v21, v19, a3);

  return v17;
}

+ (id)createAudioFileWriterForAdBlockerWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4 withAccessoryID:(id)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  _OWORD v17[2];
  uint64_t v18;
  _OWORD v19[2];
  uint64_t v20;

  v8 = a5;
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isAdBlockerAudioLoggingEnabled");

  if (v10)
  {
    +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "voiceTriggerAudioLogDirectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_OWORD *)&a3->mBytesPerPacket;
    v19[0] = *(_OWORD *)&a3->mSampleRate;
    v19[1] = v13;
    v20 = *(_QWORD *)&a3->mBitsPerChannel;
    v14 = *(_OWORD *)&a4->mBytesPerPacket;
    v17[0] = *(_OWORD *)&a4->mSampleRate;
    v17[1] = v14;
    v18 = *(_QWORD *)&a4->mBitsPerChannel;
    objc_msgSend(a1, "_createAudioFileWriterForAdBlockerWithLoggingDir:inputFormat:outputFormat:withAccessoryID:", v12, v19, v17, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)createAudioFileWriterForOSDWithInputFormat:(AudioStreamBasicDescription *)a3 outputFormat:(AudioStreamBasicDescription *)a4
{
  void *v7;
  int v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  _OWORD v15[2];
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;

  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEndpointEnhancedLoggingEnabled");

  if (!v8)
    return 0;
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assistantAudioFileLogDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)&a3->mBytesPerPacket;
  v17[0] = *(_OWORD *)&a3->mSampleRate;
  v17[1] = v11;
  v18 = *(_QWORD *)&a3->mBitsPerChannel;
  v12 = *(_OWORD *)&a4->mBytesPerPacket;
  v15[0] = *(_OWORD *)&a4->mSampleRate;
  v15[1] = v12;
  v16 = *(_QWORD *)&a4->mBitsPerChannel;
  objc_msgSend(a1, "_createAudioFileWriterForOSDWithLoggingDir:inputFormat:outputFormat:", v10, v17, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_createAudioFileWriterForAdBlockerWithLoggingDir:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5 withAccessoryID:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  CSPlainAudioFileWriter *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  CSPlainAudioFileWriter *v21;
  uint64_t v23;
  _OWORD v24[2];
  uint64_t v25;
  _BYTE buf[32];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "_getDateLabel");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v11)
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@/%@%@%@.wav"), v10, CFSTR("Ads-"), v13, v11);
  else
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@/%@%@.wav"), v10, CFSTR("Ads-"), v13, v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[CSAudioFileManager _createAudioFileWriterForAdBlockerWithLoggingDir:inputFormat:outputFormat:"
                         "withAccessoryID:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v15;
    _os_log_impl(&dword_1B502E000, v16, OS_LOG_TYPE_DEFAULT, "%s Logging audio file into : %{public}@", buf, 0x16u);
  }
  +[CSAudioFileManager pruneLogFiles](CSAudioFileManager, "pruneLogFiles");
  v17 = [CSPlainAudioFileWriter alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a4->mSampleRate;
  *(_OWORD *)&buf[16] = v19;
  v27 = *(_QWORD *)&a4->mBitsPerChannel;
  v20 = *(_OWORD *)&a5->mBytesPerPacket;
  v24[0] = *(_OWORD *)&a5->mSampleRate;
  v24[1] = v20;
  v25 = *(_QWORD *)&a5->mBitsPerChannel;
  v21 = -[CSPlainAudioFileWriter initWithURL:inputFormat:outputFormat:](v17, "initWithURL:inputFormat:outputFormat:", v18, buf, v24);

  return v21;
}

+ (id)_createAudioFileWriterForOpportuneSpeakListenerWithLoggingDir:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  CSPlainAudioFileWriter *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  CSPlainAudioFileWriter *v17;
  _OWORD v19[2];
  uint64_t v20;
  _BYTE buf[32];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a3;
  objc_msgSend(a1, "_getDateLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/%@%@.wav"), v9, CFSTR("OPP-"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[CSAudioFileManager _createAudioFileWriterForOpportuneSpeakListenerWithLoggingDir:inputFormat:outputFormat:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s Logging audio file into : %{public}@", buf, 0x16u);
  }
  +[CSAudioFileManager pruneLogFiles](CSAudioFileManager, "pruneLogFiles");
  v13 = [CSPlainAudioFileWriter alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a4->mSampleRate;
  *(_OWORD *)&buf[16] = v15;
  v22 = *(_QWORD *)&a4->mBitsPerChannel;
  v16 = *(_OWORD *)&a5->mBytesPerPacket;
  v19[0] = *(_OWORD *)&a5->mSampleRate;
  v19[1] = v16;
  v20 = *(_QWORD *)&a5->mBitsPerChannel;
  v17 = -[CSPlainAudioFileWriter initWithURL:inputFormat:outputFormat:](v13, "initWithURL:inputFormat:outputFormat:", v14, buf, v19);

  return v17;
}

+ (id)_createAudioFileWriterWithLoggingDir:(id)a3 withLoggingUUID:(id)a4 inputFormat:(AudioStreamBasicDescription *)a5 outputFormat:(AudioStreamBasicDescription *)a6
{
  void *v8;
  NSObject *v9;
  CSPlainAudioFileWriter *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  CSPlainAudioFileWriter *v14;
  _OWORD v16[2];
  uint64_t v17;
  _BYTE buf[32];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@%@.wav"), a3, CFSTR("CS-"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[CSAudioFileManager _createAudioFileWriterWithLoggingDir:withLoggingUUID:inputFormat:outputFormat:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Logging audio file into : %{public}@", buf, 0x16u);
  }
  +[CSAudioFileManager pruneLogFiles](CSAudioFileManager, "pruneLogFiles");
  v10 = [CSPlainAudioFileWriter alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)&a5->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a5->mSampleRate;
  *(_OWORD *)&buf[16] = v12;
  v19 = *(_QWORD *)&a5->mBitsPerChannel;
  v13 = *(_OWORD *)&a6->mBytesPerPacket;
  v16[0] = *(_OWORD *)&a6->mSampleRate;
  v16[1] = v13;
  v17 = *(_QWORD *)&a6->mBitsPerChannel;
  v14 = -[CSPlainAudioFileWriter initWithURL:inputFormat:outputFormat:](v10, "initWithURL:inputFormat:outputFormat:", v11, buf, v16);

  return v14;
}

+ (id)_createAudioFileWriterForPHSTrainingWithLoggingDir:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  CSPlainAudioFileWriter *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  CSPlainAudioFileWriter *v17;
  _OWORD v19[2];
  uint64_t v20;
  _BYTE buf[32];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a3;
  objc_msgSend(a1, "_getDateLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/%@%@.wav"), v9, CFSTR("PHS-"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[CSAudioFileManager _createAudioFileWriterForPHSTrainingWithLoggingDir:inputFormat:outputFormat:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s Logging audio file into : %{public}@", buf, 0x16u);
  }
  v13 = [CSPlainAudioFileWriter alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a4->mSampleRate;
  *(_OWORD *)&buf[16] = v15;
  v22 = *(_QWORD *)&a4->mBitsPerChannel;
  v16 = *(_OWORD *)&a5->mBytesPerPacket;
  v19[0] = *(_OWORD *)&a5->mSampleRate;
  v19[1] = v16;
  v20 = *(_QWORD *)&a5->mBitsPerChannel;
  v17 = -[CSPlainAudioFileWriter initWithURL:inputFormat:outputFormat:](v13, "initWithURL:inputFormat:outputFormat:", v14, buf, v19);

  return v17;
}

+ (id)_createAudioFileWriterForOSDWithLoggingDir:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  CSPlainAudioFileWriter *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  CSPlainAudioFileWriter *v17;
  _OWORD v19[2];
  uint64_t v20;
  _BYTE buf[32];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a3;
  objc_msgSend(a1, "_getDateLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/%@%@.wav"), v9, CFSTR("OSD-"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[CSAudioFileManager _createAudioFileWriterForOSDWithLoggingDir:inputFormat:outputFormat:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s Logging audio file into : %{public}@", buf, 0x16u);
  }
  v13 = [CSPlainAudioFileWriter alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a4->mSampleRate;
  *(_OWORD *)&buf[16] = v15;
  v22 = *(_QWORD *)&a4->mBitsPerChannel;
  v16 = *(_OWORD *)&a5->mBytesPerPacket;
  v19[0] = *(_OWORD *)&a5->mSampleRate;
  v19[1] = v16;
  v20 = *(_QWORD *)&a5->mBitsPerChannel;
  v17 = -[CSPlainAudioFileWriter initWithURL:inputFormat:outputFormat:](v13, "initWithURL:inputFormat:outputFormat:", v14, buf, v19);

  return v17;
}

+ (id)_getDateLabel
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy_MM_dd-HHmmss.SSS"));
  objc_msgSend(v3, "stringFromDate:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)removeOpportunisticAudioLoggingOlderThanNDays:(float)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0C99E98];
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assistantAudioFileLogDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("^%@*"), CFSTR("OPP-"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  +[CSUtils removeLogFilesInDirectory:matchingPattern:beforeDays:](CSUtils, "removeLogFilesInDirectory:matchingPattern:beforeDays:", v6, v7, v8);

}

+ (void)removeLogFilesOlderThanNDays:(float)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0C99E98];
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assistantAudioFileLogDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  +[CSUtils removeLogFilesInDirectory:matchingPattern:beforeDays:](CSUtils, "removeLogFilesInDirectory:matchingPattern:beforeDays:", v7, CFSTR(".*"), v8);

  v9 = (void *)MEMORY[0x1E0C99E98];
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "voiceTriggerAudioLogDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a3;
  +[CSUtils removeLogFilesInDirectory:matchingPattern:beforeDays:](CSUtils, "removeLogFilesInDirectory:matchingPattern:beforeDays:", v11, CFSTR(".*"), v12);

}

+ (void)removeRemoteP2PLogFilesOlderThanNDays:(float)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0C99E98];
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteP2pLogDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  +[CSUtils removeLogFilesInDirectory:matchingPattern:beforeDays:](CSUtils, "removeLogFilesInDirectory:matchingPattern:beforeDays:", v7, CFSTR(".*"), v8);

  v9 = (void *)MEMORY[0x1E0C99E98];
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "remoteGradingDataDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a3;
  +[CSUtils removeLogFilesInDirectory:matchingPattern:beforeDays:](CSUtils, "removeLogFilesInDirectory:matchingPattern:beforeDays:", v11, CFSTR(".*"), v12);

}

+ (void)pruneLogFiles
{
  void *v2;
  id v3;

  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSAudioFileManager pruneNumberOfGradingFilesTo:](CSAudioFileManager, "pruneNumberOfGradingFilesTo:", objc_msgSend(v2, "maxNumGradingFiles"));

  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[CSAudioFileManager pruneNumberOfLogFilesTo:](CSAudioFileManager, "pruneNumberOfLogFilesTo:", objc_msgSend(v3, "maxNumLoggingFiles"));

}

+ (void)pruneNumberOfLogFilesTo:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("PCM-"), CFSTR("OPUS_"), CFSTR("OPP-"), CFSTR("Ads-"), CFSTR("PHS-"), CFSTR("OSD-"), 0);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v36 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E0C99E98];
        +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "assistantAudioFileLogDirectory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "URLWithString:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("^%@*"), v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[CSUtils clearLogFilesInDirectory:matchingPattern:exceedNumber:](CSUtils, "clearLogFilesInDirectory:matchingPattern:exceedNumber:", v12, v13, a3);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v5);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("-triggered"), CFSTR("-almost"), CFSTR("-rejected"), CFSTR("-activation"), CFSTR("-selfTrigger"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v14;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        v17 = (void *)MEMORY[0x1E0C99E98];
        +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "voiceTriggerAudioLogDirectory");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "URLWithString:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)?.wav$"), v16, CFSTR("-synced"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[CSUtils clearLogFilesInDirectory:matchingPattern:exceedNumber:](CSUtils, "clearLogFilesInDirectory:matchingPattern:exceedNumber:", v20, v21, a3);

        v22 = (void *)MEMORY[0x1E0C99E98];
        +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "voiceTriggerAudioLogDirectory");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "URLWithString:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)?.json$"), v16, CFSTR("-synced"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[CSUtils clearLogFilesInDirectory:matchingPattern:exceedNumber:](CSUtils, "clearLogFilesInDirectory:matchingPattern:exceedNumber:", v25, v26, a3);

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v29);
  }

}

+ (void)pruneNumberOfGradingFilesTo:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E98];
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assistantAudioFileLogDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)?.wav$"), CFSTR("CS-"), CFSTR("-synced"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSUtils clearLogFilesInDirectory:matchingPattern:exceedNumber:](CSUtils, "clearLogFilesInDirectory:matchingPattern:exceedNumber:", v7, v8, a3);

  +[CSAudioFileManager cleanupOrphanedGradingFiles](CSAudioFileManager, "cleanupOrphanedGradingFiles");
}

+ (void)cleanupOrphanedGradingFiles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id obj;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  _QWORD v44[4];

  v44[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E98];
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assistantAudioFileLogDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__10430;
  v35 = __Block_byref_object_dispose__10431;
  v36 = 0;
  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v24, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = *MEMORY[0x1E0C99A90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id *)(v32 + 5);
  obj = (id)v32[5];
  objc_msgSend(v23, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, v8, 0, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v9, obj);

  v11 = v32[5];
  if (v11)
  {
    v12 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v39 = "+[CSAudioFileManager cleanupOrphanedGradingFiles]";
      v40 = 2114;
      v41 = v24;
      v42 = 2114;
      v43 = v11;
      _os_log_error_impl(&dword_1B502E000, v12, OS_LOG_TYPE_ERROR, "%s ERR: reading contents of gradingDir: %{public}@ with error %{public}@", buf, 0x20u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v18, "absoluteString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "lastPathComponent");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringByDeletingPathExtension");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v19) = v22 == 0;

          if ((_DWORD)v19)
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, v21);
          else
            objc_msgSend(v13, "removeObjectForKey:", v21);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
      }
      while (v15);
    }

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __49__CSAudioFileManager_cleanupOrphanedGradingFiles__block_invoke;
    v25[3] = &unk_1E6880BC0;
    v25[4] = &v31;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v25);

  }
  _Block_object_dispose(&v31, 8);

}

+ (id)audioFileWriterForAttentiveSiri
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  char v11;
  id v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  CSPlainAudioFileWriter *v21;
  void *v22;
  void *v23;
  void *v24;
  CSPlainAudioFileWriter *v25;
  void *v26;
  _BYTE v27[40];
  _BYTE v28[40];
  id v29;
  id v30;
  char v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAttentiveSiriAudioLoggingEnabled");

  if (!v3)
    return 0;
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantLogDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("attsiri"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v8 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v6, &v31);
  if (v8)
    v9 = v31 == 0;
  else
    v9 = 1;
  if (!v9)
    goto LABEL_22;
  if (v8)
  {
    v10 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "+[CSAudioFileManager audioFileWriterForAttentiveSiri]";
      v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Removing non-dir at AttentiveSiri AudioLog dir: %@", buf, 0x16u);
    }
    v30 = 0;
    v11 = objc_msgSend(v7, "removeItemAtPath:error:", v6, &v30);
    v12 = v30;
    if ((v11 & 1) == 0)
    {
      v13 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v33 = "+[CSAudioFileManager audioFileWriterForAttentiveSiri]";
        v34 = 2112;
        v35 = v6;
        v36 = 2112;
        v37 = v12;
        v14 = "%s Error removing %@: err: %@";
        v15 = v13;
        v16 = 32;
LABEL_18:
        _os_log_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
  }
  else
  {
    v12 = 0;
  }
  v18 = v12;
  v29 = v12;
  objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v29);
  v12 = v29;

  v19 = CSLogCategoryAudio;
  v20 = os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (v20)
    {
      *(_DWORD *)buf = 136315394;
      v33 = "+[CSAudioFileManager audioFileWriterForAttentiveSiri]";
      v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEFAULT, "%s Created AudioLogging dir for AttentiveSiri at: %@", buf, 0x16u);
    }
LABEL_22:
    v22 = (void *)MEMORY[0x1E0CB3940];
    +[CSAudioFileManager _getDateLabel](CSAudioFileManager, "_getDateLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@.wav"), v23);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByAppendingPathComponent:", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = [CSPlainAudioFileWriter alloc];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSFAudioStreamBasicDescriptionFactory utteranceFileASBD](CSFAudioStreamBasicDescriptionFactory, "utteranceFileASBD");
    +[CSFAudioStreamBasicDescriptionFactory utteranceFileASBD](CSFAudioStreamBasicDescriptionFactory, "utteranceFileASBD");
    v21 = -[CSPlainAudioFileWriter initWithURL:inputFormat:outputFormat:](v25, "initWithURL:inputFormat:outputFormat:", v26, v28, v27);

    goto LABEL_23;
  }
  if (v20)
  {
    *(_DWORD *)buf = 136315394;
    v33 = "+[CSAudioFileManager audioFileWriterForAttentiveSiri]";
    v34 = 2112;
    v35 = v12;
    v14 = "%s Failed to create AudioLogging directory for AttentiveSiri: %@";
    v15 = v19;
    v16 = 22;
    goto LABEL_18;
  }
LABEL_19:
  v21 = 0;
LABEL_23:

  return v21;
}

void __49__CSAudioFileManager_cleanupOrphanedGradingFiles__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  char v12;
  NSObject *v13;
  uint64_t v14;
  id obj;
  char v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "+[CSAudioFileManager cleanupOrphanedGradingFiles]_block_invoke";
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Deleting orphaned grading file %{public}@", buf, 0x16u);
  }
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v5, &v16);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    obj = *(id *)(v11 + 40);
    v12 = objc_msgSend(v10, "removeItemAtPath:error:", v5, &obj);
    objc_storeStrong((id *)(v11 + 40), obj);

    if ((v12 & 1) == 0)
    {
      v13 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        *(_DWORD *)buf = 136315650;
        v18 = "+[CSAudioFileManager cleanupOrphanedGradingFiles]_block_invoke";
        v19 = 2114;
        v20 = v5;
        v21 = 2114;
        v22 = v14;
        _os_log_error_impl(&dword_1B502E000, v13, OS_LOG_TYPE_ERROR, "%s ERR: Failed to delete %{public}@ with error %{public}@", buf, 0x20u);
      }
    }
  }

}

void __58__CSAudioFileManager_generateDeviceAudioLogging_speechId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45[5];
  id v46;
  id v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
  {
    v2 = *(void **)(a1 + 32);
    if (v2)
    {
      objc_msgSend(v2, "fileURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        v4 = CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          v5 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 136315394;
          v49 = "+[CSAudioFileManager generateDeviceAudioLogging:speechId:]_block_invoke";
          v50 = 2114;
          v51 = v5;
          _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Extracted SpeechIdentifier: %{public}@", buf, 0x16u);
        }
        objc_msgSend(*(id *)(a1 + 32), "fileURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "URLByDeletingPathExtension");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "absoluteString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = *(_QWORD *)(a1 + 40);
        v12 = objc_msgSend(*(id *)(a1 + 32), "numberOfChannels");
        +[CSUtils deviceBuildVersion](CSUtils, "deviceBuildVersion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[CSUtils deviceHwRevision](CSUtils, "deviceHwRevision");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.speechId%@.chNum%02d.build%@.hwRev%@."), v9, v11, v12, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "dataUsingEncoding:", 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0CB3608];
        objc_msgSend(*(id *)(a1 + 32), "fileURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fileHandleForReadingAtPath:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v45[1] = (id)MEMORY[0x1E0C809B0];
        v45[2] = (id)3221225472;
        v45[3] = __58__CSAudioFileManager_generateDeviceAudioLogging_speechId___block_invoke_33;
        v45[4] = &unk_1E6880B98;
        v21 = v16;
        v46 = v21;
        v22 = v20;
        v47 = v22;
        if ((OSAWriteLogForSubmission() & 1) != 0)
        {
          v23 = *(void **)(a1 + 32);
          if (!v23)
            goto LABEL_21;
          objc_msgSend(v23, "fileURL");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
            goto LABEL_21;
          objc_msgSend(*(id *)(a1 + 32), "fileURL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "URLByDeletingLastPathComponent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "path");
          v27 = objc_claimAutoreleasedReturnValue();

          +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "assistantAudioFileLogDirectory");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[NSObject containsString:](v27, "containsString:", v29);

          if ((v30 & 1) == 0)
          {
            v31 = (void *)CSLogCategoryAudio;
            if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
            {
              v32 = *(void **)(a1 + 32);
              v33 = v31;
              objc_msgSend(v32, "fileURL");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v49 = "+[CSAudioFileManager generateDeviceAudioLogging:speechId:]_block_invoke";
              v50 = 2114;
              v51 = v34;
              _os_log_impl(&dword_1B502E000, v33, OS_LOG_TYPE_DEFAULT, "%s Plan removing the temp file %{public}@", buf, 0x16u);

            }
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "fileURL");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v45[0] = 0;
            objc_msgSend(v35, "removeItemAtURL:error:", v36, v45);
            v37 = v45[0];

            if (v37)
            {
              v38 = (void *)CSLogCategoryAudio;
              if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
              {
                v42 = *(void **)(a1 + 32);
                v43 = v38;
                objc_msgSend(v42, "fileURL");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v49 = "+[CSAudioFileManager generateDeviceAudioLogging:speechId:]_block_invoke";
                v50 = 2114;
                v51 = v44;
                v52 = 2114;
                v53 = v37;
                _os_log_error_impl(&dword_1B502E000, v43, OS_LOG_TYPE_ERROR, "%s Failed to remove temp file %{public}@ reason: %{public}@", buf, 0x20u);

              }
            }

          }
        }
        else
        {
          v39 = (void *)CSLogCategoryAudio;
          if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
          {
LABEL_21:

            return;
          }
          v40 = *(void **)(a1 + 32);
          v27 = v39;
          objc_msgSend(v40, "fileURL");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v49 = "+[CSAudioFileManager generateDeviceAudioLogging:speechId:]_block_invoke";
          v50 = 2114;
          v51 = v41;
          _os_log_error_impl(&dword_1B502E000, v27, OS_LOG_TYPE_ERROR, "%s OSA write log failed for file %{public}@", buf, 0x16u);

        }
        goto LABEL_21;
      }
    }
  }
}

void __58__CSAudioFileManager_generateDeviceAudioLogging_speechId___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v9 = 0;
  objc_msgSend(v3, "writeData:error:", v4, &v9);
  v5 = v9;
  if (v5)
  {
    v6 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      objc_msgSend(v5, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v11 = "+[CSAudioFileManager generateDeviceAudioLogging:speechId:]_block_invoke";
      v12 = 2114;
      v13 = v3;
      v14 = 2114;
      v15 = v8;
      _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s Unable to writeData to %{public}@ : %{public}@", buf, 0x20u);

    }
  }
  +[CSAudioFileManager _readDataFromFileHandle:toFileHandle:](CSAudioFileManager, "_readDataFromFileHandle:toFileHandle:", *(_QWORD *)(a1 + 40), v3);

}

void __46__CSAudioFileManager__sharedAudioLoggingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -2);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.CoreSpeech.AudioLogging", v2);
  v1 = (void *)_sharedAudioLoggingQueue_sharedQueue;
  _sharedAudioLoggingQueue_sharedQueue = (uint64_t)v0;

}

@end
