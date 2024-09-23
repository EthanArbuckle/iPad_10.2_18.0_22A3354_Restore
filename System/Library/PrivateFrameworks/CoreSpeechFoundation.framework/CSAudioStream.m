@implementation CSAudioStream

- (CSAudioStream)initWithAudioStreamProvider:(id)a3 streamName:(id)a4 streamRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  CSAudioStream *v11;
  CSAudioStream *v12;
  void *v13;
  uint64_t v14;
  NSString *UUID;
  uint64_t v16;
  NSHashTable *tandemStreams;
  void *v18;
  NSObject *v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CSAudioStream;
  v11 = -[CSAudioStream init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    -[CSAudioStream setStreamProvider:](v11, "setStreamProvider:", v8);
    -[CSAudioStream setStreaming:](v12, "setStreaming:", 0);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();
    UUID = v12->_UUID;
    v12->_UUID = (NSString *)v14;

    -[CSAudioStream setName:](v12, "setName:", v9);
    -[CSAudioStream setStreamRequest:](v12, "setStreamRequest:", v10);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    tandemStreams = v12->_tandemStreams;
    v12->_tandemStreams = (NSHashTable *)v16;

    v12->_needsBoost12dB = 0;
    v18 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      -[CSAudioStream name](v12, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v24 = "-[CSAudioStream initWithAudioStreamProvider:streamName:streamRequest:]";
      v25 = 2114;
      v26 = v20;
      _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEFAULT, "%s stream %{public}@ initialized", buf, 0x16u);

    }
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[CSAudioStream name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSAudioStream dealloc]";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s stream %{public}@ is deallocated", buf, 0x16u);

  }
  v6.receiver = self;
  v6.super_class = (Class)CSAudioStream;
  -[CSAudioStream dealloc](&v6, sel_dealloc);
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  objc_msgSend(a3, "stringByAppendingFormat:", CFSTR("-%@"), self->_UUID);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  name = self->_name;
  self->_name = v4;

}

- (BOOL)prepareAudioStreamSyncWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CSAudioStream streamProvider](self, "streamProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "prepareAudioStreamSync:request:error:", self, v6, a4);

  return (char)a4;
}

- (void)prepareAudioStreamWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CSAudioStream streamProvider](self, "streamProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prepareAudioStream:request:completion:", self, v7, v6);

}

- (void)startAudioStreamWithOption:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  CSAudioStream *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CSAudioStream streamProvider](self, "streamProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioStream setStreamingUUID:](self, "setStreamingUUID:", v9);
    v10 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[CSAudioStream startAudioStreamWithOption:completion:]";
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Creating UUID for start audio stream request : %{public}@", buf, 0x16u);
    }
    -[CSAudioStream streamProvider](self, "streamProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__CSAudioStream_startAudioStreamWithOption_completion___block_invoke;
    v14[3] = &unk_1E687F3F0;
    v15 = v9;
    v16 = self;
    v17 = v7;
    v12 = v9;
    objc_msgSend(v11, "startAudioStream:option:completion:", self, v6, v14);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 958, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v13);

  }
}

- (void)stopAudioStreamWithOption:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  -[CSAudioStream streamProvider](self, "streamProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CSAudioStream setStreamingUUID:](self, "setStreamingUUID:", 0);
    -[CSAudioStream streamProvider](self, "streamProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__CSAudioStream_stopAudioStreamWithOption_completion___block_invoke;
    v11[3] = &unk_1E687EDC0;
    v11[4] = self;
    v12 = v7;
    objc_msgSend(v9, "stopAudioStream:option:completion:", self, v6, v11);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 958, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);

  }
}

- (BOOL)isStreaming
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[CSAudioStream name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315650;
    v8 = "-[CSAudioStream isStreaming]";
    v9 = 2114;
    v10 = v5;
    v11 = 1026;
    v12 = -[CSAudioStream streaming](self, "streaming");
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s AudioStream<%{public}@> is streaming : %{public}d", (uint8_t *)&v7, 0x1Cu);

  }
  return -[CSAudioStream streaming](self, "streaming");
}

- (id)recordSettings
{
  void *v2;
  void *v3;

  -[CSAudioStream streamProvider](self, "streamProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isNarrowBand
{
  void *v2;
  char v3;

  -[CSAudioStream streamProvider](self, "streamProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNarrowBand");

  return v3;
}

- (void)updateAudioStreamStartTimeInSampleCount:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[CSAudioStream name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v19 = "-[CSAudioStream updateAudioStreamStartTimeInSampleCount:]";
    v20 = 2114;
    v21 = v7;
    v22 = 2050;
    v23 = a3;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Stream %{public}@ set startTimeInSampleCount : %{public}llu", buf, 0x20u);

  }
  self->_startSampleCount = a3;
  self->_lastForwardedSampleCount = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CSAudioStream tandemStreams](self, "tandemStreams", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "updateAudioStreamStartTimeInSampleCount:", a3);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)setStartStreamOption:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_startStreamOption, a3);
  v6 = -[CSAudioStartStreamOption initTandemWithOption:]([CSAudioStartStreamOption alloc], "initTandemWithOption:", v5);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CSAudioStream tandemStreams](self, "tandemStreams", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setStartStreamOption:", v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)setScheduledFutureSample:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  self->_scheduledFutureSample = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CSAudioStream tandemStreams](self, "tandemStreams", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setScheduledFutureSample:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CSAudioStream setStreamingUUID:](self, "setStreamingUUID:", 0);
  -[CSAudioStream setStreaming:](self, "setStreaming:", 0);
  v7 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[CSAudioStream name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v25 = "-[CSAudioStream audioStreamProvider:didStopStreamUnexpectedly:]";
    v26 = 2114;
    v27 = v9;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s AudioStream<%{public}@> has received didStopStreamUnexpectedly", buf, 0x16u);

  }
  -[CSAudioStream delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[CSAudioStream delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "audioStreamProvider:didStopStreamUnexpectedly:", v6, a4);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CSAudioStream tandemStreams](self, "tandemStreams", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "audioStreamProvider:didStopStreamUnexpectedly:", v6, a4);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

  -[CSAudioStream tandemStreams](self, "tandemStreams");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeAllObjects");

}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CSAudioStream delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CSAudioStream delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "audioStreamProvider:audioBufferAvailable:", v10, v6);

  }
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4 lastForwardedSampleCount:(unint64_t)a5
{
  self->_lastForwardedSampleCount = a5;
  -[CSAudioStream audioStreamProvider:audioBufferAvailable:](self, "audioStreamProvider:audioBufferAvailable:", a3, a4);
}

- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CSAudioStream delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CSAudioStream delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "audioStreamProvider:audioChunkForTVAvailable:", v10, v6);

  }
}

- (void)audioStreamProvider:(id)a3 numSamplesAvailableInExclave:(unint64_t)a4 hostTime:(unint64_t)a5 arrivalHostTimeToAudioRecorder:(unint64_t)a6 exclaveSampleCount:(unint64_t)a7
{
  void *v12;
  char v13;
  void *v14;
  id v15;

  v15 = a3;
  -[CSAudioStream delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[CSAudioStream delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "audioStreamProvider:numSamplesAvailableInExclave:hostTime:arrivalHostTimeToAudioRecorder:exclaveSampleCount:", v15, a4, a5, a6, a7);

  }
}

- (void)audioStreamProvider:(id)a3 didHardwareConfigurationChange:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[CSAudioStream name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[CSAudioStream audioStreamProvider:didHardwareConfigurationChange:]";
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s AudioStream<%{public}@> has received didHardwareConfigurationChange", (uint8_t *)&v13, 0x16u);

  }
  -[CSAudioStream delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[CSAudioStream delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "audioStreamProvider:didHardwareConfigurationChange:", v6, a4);

  }
}

- (CSAudioStreamProviding)streamProvider
{
  return (CSAudioStreamProviding *)objc_loadWeakRetained((id *)&self->_streamProvider);
}

- (void)setStreamProvider:(id)a3
{
  objc_storeWeak((id *)&self->_streamProvider, a3);
}

- (CSAudioStreamProvidingDelegate)delegate
{
  return (CSAudioStreamProvidingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)startSampleCount
{
  return self->_startSampleCount;
}

- (unint64_t)lastForwardedSampleCount
{
  return self->_lastForwardedSampleCount;
}

- (BOOL)scheduledFutureSample
{
  return self->_scheduledFutureSample;
}

- (NSString)name
{
  return self->_name;
}

- (CSAudioStreamRequest)streamRequest
{
  return self->_streamRequest;
}

- (void)setStreamRequest:(id)a3
{
  objc_storeStrong((id *)&self->_streamRequest, a3);
}

- (NSString)UUID
{
  return self->_UUID;
}

- (CSAudioStartStreamOption)startStreamOption
{
  return self->_startStreamOption;
}

- (BOOL)isWeakStream
{
  return self->_isWeakStream;
}

- (void)setIsWeakStream:(BOOL)a3
{
  self->_isWeakStream = a3;
}

- (NSHashTable)tandemStreams
{
  return self->_tandemStreams;
}

- (BOOL)needsBoost12dB
{
  return self->_needsBoost12dB;
}

- (void)setNeedsBoost12dB:(BOOL)a3
{
  self->_needsBoost12dB = a3;
}

- (BOOL)streaming
{
  return self->_streaming;
}

- (void)setStreaming:(BOOL)a3
{
  self->_streaming = a3;
}

- (NSUUID)streamingUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStreamingUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamingUUID, 0);
  objc_storeStrong((id *)&self->_tandemStreams, 0);
  objc_storeStrong((id *)&self->_startStreamOption, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_streamRequest, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_streamProvider);
}

void __54__CSAudioStream_stopAudioStreamWithOption_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "streamingUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      objc_msgSend(*(id *)(a1 + 32), "setStreaming:", 0);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  objc_msgSend(*(id *)(a1 + 32), "tandemStreams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(a1 + 32);
      v12 = v10;
      objc_msgSend(v11, "tandemStreams");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v28 = "-[CSAudioStream stopAudioStreamWithOption:completion:]_block_invoke";
      v29 = 2050;
      v30 = objc_msgSend(v13, "count");
      _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s Delivering didStop to %{public}lu tandem stream(s)", buf, 0x16u);

    }
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "tandemStreams", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
        objc_msgSend(*(id *)(a1 + 32), "streamProvider");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "audioStreamProvider:didStopStreamUnexpectedly:", v20, 7);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  objc_msgSend(*(id *)(a1 + 32), "tandemStreams");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeAllObjects");

}

void __55__CSAudioStream_startAudioStreamWithOption_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if ((_DWORD)a2)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "streamingUUID", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v6, "isEqual:", v7);

    v5 = v9;
    if ((_DWORD)v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "setStreaming:", 1);
      v5 = v9;
    }
  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v9);
    v5 = v9;
  }

}

@end
