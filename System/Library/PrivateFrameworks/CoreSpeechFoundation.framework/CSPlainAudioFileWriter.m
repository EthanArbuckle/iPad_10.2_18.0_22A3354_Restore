@implementation CSPlainAudioFileWriter

- (CSPlainAudioFileWriter)initWithURL:(id)a3
{
  id v4;
  CSPlainAudioFileWriter *v5;
  uint64_t v7;
  _BYTE v8[40];

  v4 = a3;
  +[CSFAudioStreamBasicDescriptionFactory utteranceFileASBD](CSFAudioStreamBasicDescriptionFactory, "utteranceFileASBD");
  +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD](CSFAudioStreamBasicDescriptionFactory, "lpcmInt16ASBD");
  v5 = -[CSPlainAudioFileWriter initWithURL:inputFormat:outputFormat:](self, "initWithURL:inputFormat:outputFormat:", v4, v8, &v7);

  return v5;
}

- (CSPlainAudioFileWriter)initWithFilepath:(id)a3
{
  void *v4;
  CSPlainAudioFileWriter *v5;
  uint64_t v7;
  _BYTE v8[40];

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSFAudioStreamBasicDescriptionFactory utteranceFileASBD](CSFAudioStreamBasicDescriptionFactory, "utteranceFileASBD");
  +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD](CSFAudioStreamBasicDescriptionFactory, "lpcmInt16ASBD");
  v5 = -[CSPlainAudioFileWriter initWithURL:inputFormat:outputFormat:](self, "initWithURL:inputFormat:outputFormat:", v4, v8, &v7);

  return v5;
}

- (CSPlainAudioFileWriter)initWithURL:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5
{
  const __CFURL *v8;
  CSPlainAudioFileWriter *v9;
  CSPlainAudioFileWriter *v10;
  OSStatus v11;
  OSStatus v12;
  NSObject *v13;
  const __CFURL *v14;
  NSURL *fileURL;
  OpaqueExtAudioFile *fFile;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const __CFURL *v26;
  __int16 v27;
  OSStatus v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = (const __CFURL *)a3;
  v22.receiver = self;
  v22.super_class = (Class)CSPlainAudioFileWriter;
  v9 = -[CSPlainAudioFileWriter init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    a5->mSampleRate = a4->mSampleRate;
    v11 = ExtAudioFileCreateWithURL(v8, 0x57415645u, a5, 0, 1u, &v9->fFile);
    if (v11)
    {
      v12 = v11;
      v13 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v24 = "-[CSPlainAudioFileWriter initWithURL:inputFormat:outputFormat:]";
        v25 = 2114;
        v26 = v8;
        v27 = 1026;
        v28 = v12;
        _os_log_error_impl(&dword_1B502E000, v13, OS_LOG_TYPE_ERROR, "%s ::: Error creating output file %{public}@, err: %{public}d", buf, 0x1Cu);
      }
    }
    if (v10->fFile)
      v14 = v8;
    else
      v14 = 0;
    fileURL = v10->_fileURL;
    v10->_fileURL = (NSURL *)v14;

    fFile = v10->fFile;
    if (fFile)
      ExtAudioFileSetProperty(fFile, 0x63666D74u, 0x28u, a4);
    v10->isWriting = 1;
    v17 = *(_OWORD *)&a4->mSampleRate;
    v18 = *(_OWORD *)&a4->mBytesPerPacket;
    *(_QWORD *)&v10->inASBD.mBitsPerChannel = *(_QWORD *)&a4->mBitsPerChannel;
    *(_OWORD *)&v10->inASBD.mBytesPerPacket = v18;
    *(_OWORD *)&v10->inASBD.mSampleRate = v17;
    v19 = *(_OWORD *)&a5->mSampleRate;
    v20 = *(_OWORD *)&a5->mBytesPerPacket;
    *(_QWORD *)&v10->outASBD.mBitsPerChannel = *(_QWORD *)&a5->mBitsPerChannel;
    *(_OWORD *)&v10->outASBD.mSampleRate = v19;
    *(_OWORD *)&v10->outASBD.mBytesPerPacket = v20;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[CSPlainAudioFileWriter endAudio](self, "endAudio");
  v3.receiver = self;
  v3.super_class = (Class)CSPlainAudioFileWriter;
  -[CSPlainAudioFileWriter dealloc](&v3, sel_dealloc);
}

- (BOOL)endAudio
{
  OpaqueExtAudioFile *fFile;

  fFile = self->fFile;
  if (fFile)
    ExtAudioFileDispose(fFile);
  self->isWriting = 0;
  return 1;
}

- (BOOL)addSamples:(const void *)a3 numSamples:(int64_t)a4
{
  BOOL v4;
  AudioBufferList *v5;
  uint64_t mChannelsPerFrame;
  unsigned int v7;
  int v8;
  void **p_mData;
  OSStatus v10;
  OSStatus v11;
  NSObject *v12;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = 1;
  if (a4 >= 1 && self->isWriting)
  {
    v5 = (AudioBufferList *)&buf[-((24 * self->inASBD.mChannelsPerFrame + 15) & 0x3FFFFFFFF0)];
    mChannelsPerFrame = self->inASBD.mChannelsPerFrame;
    v5->mNumberBuffers = mChannelsPerFrame;
    if ((_DWORD)mChannelsPerFrame)
    {
      v7 = 0;
      v8 = self->inASBD.mBytesPerFrame * a4;
      p_mData = &v5->mBuffers[0].mData;
      do
      {
        *((_DWORD *)p_mData - 2) = 1;
        *((_DWORD *)p_mData - 1) = v8;
        *p_mData = (char *)a3 + v7;
        p_mData += 2;
        v7 += v8;
        --mChannelsPerFrame;
      }
      while (mChannelsPerFrame);
    }
    v10 = ExtAudioFileWrite(self->fFile, a4, v5);
    v4 = v10 == 0;
    if (v10)
    {
      v11 = v10;
      v12 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[CSPlainAudioFileWriter addSamples:numSamples:]";
        v16 = 2050;
        v17 = v11;
        _os_log_error_impl(&dword_1B502E000, v12, OS_LOG_TYPE_ERROR, "%s ::: Error writing to output wave file. : %{public}ld", buf, 0x16u);
      }
    }
  }
  return v4;
}

- (void)addContextKey:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id v58;
  _QWORD v59[5];
  _QWORD v60[7];

  v60[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSURL URLByDeletingPathExtension](self->_fileURL, "URLByDeletingPathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if ((v12 & 1) != 0)
  {
    if (v7)
    {
      v13 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v9, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dataWithContentsOfFile:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v51 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v15, 0, &v51);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v51;
        v18 = v17;
        if (!v16 || v17)
        {
          v45 = CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v54 = "-[CSPlainAudioFileWriter addContextKey:withContext:]";
            v55 = 2112;
            v56 = v9;
            v57 = 2112;
            v58 = v18;
            _os_log_error_impl(&dword_1B502E000, v45, OS_LOG_TYPE_ERROR, "%s Could not read existing %@ file: err: %@", buf, 0x20u);
          }
        }
        else
        {
          v19 = (void *)objc_msgSend(v16, "mutableCopy");
          objc_msgSend(v19, "setObject:forKey:", v7, v6);
          v50 = 0;
          objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v19, 1, &v50);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v50;
          if (v18 || !v20)
          {
            v46 = CSLogCategoryAudio;
            if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v54 = "-[CSPlainAudioFileWriter addContextKey:withContext:]";
              v55 = 2114;
              v56 = v9;
              v57 = 2114;
              v58 = v18;
              _os_log_error_impl(&dword_1B502E000, v46, OS_LOG_TYPE_ERROR, "%s ERR: Failed to create json %{public}@ with %{public}@", buf, 0x20u);
            }
          }
          else
          {
            objc_msgSend(v9, "path");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "writeToFile:atomically:", v21, 0);

          }
        }

      }
      else
      {
        v44 = CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v54 = "-[CSPlainAudioFileWriter addContextKey:withContext:]";
          v55 = 2112;
          v56 = v9;
          _os_log_error_impl(&dword_1B502E000, v44, OS_LOG_TYPE_ERROR, "%s Unable to read data from file: %@", buf, 0x16u);
        }
      }

    }
    else
    {
      v43 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v54 = "-[CSPlainAudioFileWriter addContextKey:withContext:]";
        _os_log_impl(&dword_1B502E000, v43, OS_LOG_TYPE_DEFAULT, "%s metaInfo passed is nil - Bailing out", buf, 0xCu);
      }
    }
  }
  else
  {
    v48 = v6;
    v49 = v7;
    v22 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v23 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLocale:", v24);

    objc_msgSend(v23, "setDateFormat:", CFSTR("yyyy_MM_dd-HHmmss.SSS"));
    v47 = v22;
    objc_msgSend(v23, "stringFromDate:", v22);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0C99E08];
    v59[0] = CFSTR("productType");
    +[CSUtils deviceProductType](CSUtils, "deviceProductType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v27;
    v59[1] = CFSTR("productVersion");
    +[CSUtils deviceProductVersion](CSUtils, "deviceProductVersion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v28;
    v59[2] = CFSTR("buildVersion");
    +[CSUtils deviceBuildVersion](CSUtils, "deviceBuildVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v60[2] = v29;
    v59[3] = CFSTR("liveOnHomePod");
    v30 = (void *)MEMORY[0x1E0CB37E8];
    if (CSIsHorseman_onceToken != -1)
      dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
    if (CSIsHorseman_isHorseman
      && (v31 = (void *)CFPreferencesCopyAppValue(CFSTR("ExperimentGroup"), CFSTR("com.apple.da"))) != 0)
    {
      v32 = v31;
      v33 = objc_msgSend(v31, "isEqualToString:", CFSTR("walkabout"));

    }
    else
    {
      v33 = 0;
    }
    objc_msgSend(v30, "numberWithBool:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v34;
    v59[4] = CFSTR("timeStamp");
    v36 = &stru_1E6885088;
    if (v25)
      v36 = v25;
    v60[3] = v34;
    v60[4] = v36;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dictionaryWithDictionary:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v48;
    if (v49)
      objc_msgSend(v38, "setObject:forKey:", v49, v48);
    v52 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v38, 1, &v52);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v52;
    if (v40 || !v39)
    {
      v42 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v54 = "-[CSPlainAudioFileWriter addContextKey:withContext:]";
        v55 = 2114;
        v56 = v9;
        v57 = 2114;
        v58 = v40;
        _os_log_error_impl(&dword_1B502E000, v42, OS_LOG_TYPE_ERROR, "%s ERR: Failed to create json %{public}@ with %{public}@", buf, 0x20u);
      }
    }
    else
    {
      objc_msgSend(v9, "path");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "writeToFile:atomically:", v41, 0);

    }
    v7 = v49;
  }

}

- (void)createAcousticMetaFileForContext:(id)a3 withContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[NSURL lastPathComponent](self->_fileURL, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("-SL.json"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSURL URLByDeletingLastPathComponent](self->_fileURL, "URLByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 1, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    if (v13 || !v12)
    {
      v15 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v18 = "-[CSPlainAudioFileWriter createAcousticMetaFileForContext:withContext:]";
        v19 = 2114;
        v20 = v11;
        v21 = 2114;
        v22 = v13;
        _os_log_error_impl(&dword_1B502E000, v15, OS_LOG_TYPE_ERROR, "%s ERR: Failed to create json %{public}@ with %{public}@", buf, 0x20u);
      }
    }
    else
    {
      objc_msgSend(v12, "writeToFile:atomically:", v11, 0);
    }

  }
  else
  {
    v14 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CSPlainAudioFileWriter createAcousticMetaFileForContext:withContext:]";
      _os_log_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEFAULT, "%s metaInfo passed is nil - Bailing out", buf, 0xCu);
    }
    v13 = 0;
  }

}

- (void)addContextKey:(id)a3 fromMetaFile:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        v15 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, &v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v15;
        v12 = v11;
        if (!v10 || v11)
        {
          v13 = CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v17 = "-[CSPlainAudioFileWriter addContextKey:fromMetaFile:]";
            v18 = 2112;
            v19 = v7;
            v20 = 2112;
            v21 = v12;
            _os_log_error_impl(&dword_1B502E000, v13, OS_LOG_TYPE_ERROR, "%s Could not read existing %@ file: err: %@", buf, 0x20u);
          }

          v10 = 0;
        }
        goto LABEL_14;
      }
      v14 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[CSPlainAudioFileWriter addContextKey:fromMetaFile:]";
        v18 = 2112;
        v19 = v7;
        _os_log_error_impl(&dword_1B502E000, v14, OS_LOG_TYPE_ERROR, "%s Unable to read data from file: %@", buf, 0x16u);
      }
    }
    v9 = 0;
    v10 = 0;
    v12 = 0;
LABEL_14:
    -[CSPlainAudioFileWriter addContextKey:withContext:](self, "addContextKey:withContext:", v6, v10);

  }
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
}

+ (void)saveAudioChunck:(id)a3 toURL:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  int v9;
  uint64_t v10;
  double v11;
  int v12;
  int v13;
  uint64_t v14;
  double v15;
  CSPlainAudioFileWriter *v16;
  CSPlainAudioFileWriter *v17;
  id v18;
  NSObject *v19;
  _OWORD v20[2];
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint8_t v25[16];
  __int128 v26;
  uint64_t v27;
  uint8_t buf[32];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[CSPlainAudioFileWriter saveAudioChunck:toURL:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s saveAudioChunk toURL: %{public}@", buf, 0x16u);
  }
  v29 = 0;
  memset(buf, 0, sizeof(buf));
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  v9 = v8;
  v10 = objc_msgSend(v5, "numChannels");
  LODWORD(v11) = v9;
  +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmNonInterleavedASBDWithSampleRate:numberOfChannels:", v10, v11);
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
  v13 = v12;
  v14 = objc_msgSend(v5, "numChannels");
  LODWORD(v15) = v13;
  +[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedASBDWithSampleRate:numberOfChannels:](CSFAudioStreamBasicDescriptionFactory, "lpcmInterleavedASBDWithSampleRate:numberOfChannels:", v14, v15);
  v16 = [CSPlainAudioFileWriter alloc];
  *(_OWORD *)v25 = *(_OWORD *)buf;
  v26 = *(_OWORD *)&buf[16];
  v27 = v29;
  v20[0] = v22;
  v20[1] = v23;
  v21 = v24;
  v17 = -[CSPlainAudioFileWriter initWithURL:inputFormat:outputFormat:](v16, "initWithURL:inputFormat:outputFormat:", v6, v25, v20);
  if (v5)
  {
    objc_msgSend(v5, "data");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CSPlainAudioFileWriter addSamples:numSamples:](v17, "addSamples:numSamples:", objc_msgSend(v18, "bytes"), objc_msgSend(v5, "numSamples"));

  }
  else
  {
    v19 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 136315138;
      *(_QWORD *)&v25[4] = "+[CSPlainAudioFileWriter saveAudioChunck:toURL:]";
      _os_log_error_impl(&dword_1B502E000, v19, OS_LOG_TYPE_ERROR, "%s Invalid request: nothing to write to file", v25, 0xCu);
    }
  }
  -[CSPlainAudioFileWriter endAudio](v17, "endAudio");

}

@end
