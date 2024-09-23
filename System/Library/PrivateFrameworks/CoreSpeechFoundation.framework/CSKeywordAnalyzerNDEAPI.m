@implementation CSKeywordAnalyzerNDEAPI

- (CSKeywordAnalyzerNDEAPI)initWithBlob:(id)a3
{
  id v4;
  CSKeywordAnalyzerNDEAPI *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;
  NSMutableData *currentBlob;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  CSKeywordAnalyzerNDEAPI *v18;
  const char *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CSKeywordAnalyzerNDEAPI;
  v5 = -[CSKeywordAnalyzerNDEAPI init](&v21, sel_init);
  if (v5)
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_retainAutorelease(v4);
        v8 = v6;
        v9 = objc_msgSend(v7, "bytes");
        v10 = objc_msgSend(v7, "length");
        *(_DWORD *)buf = 136315650;
        v23 = "-[CSKeywordAnalyzerNDEAPI initWithBlob:]";
        v24 = 2048;
        v25 = v9;
        v26 = 1024;
        v27 = v10;
        _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s Initializaing NDEAPI with blob : %p(%dbytes)", buf, 0x1Cu);

      }
      v11 = objc_alloc(MEMORY[0x1E0C99DF0]);
      v12 = objc_msgSend(v11, "initWithLength:", *MEMORY[0x1E0DC8670]);
      currentBlob = v5->_currentBlob;
      v5->_currentBlob = (NSMutableData *)v12;

      v14 = (void *)-[NSMutableData bytes](v5->_currentBlob, "bytes");
      v15 = objc_retainAutorelease(v4);
      memcpy(v14, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
      nde_enable_multiinstance();
      +[CSNDEObjectFactory sharedInstance](CSNDEObjectFactory, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_ndeObject = (void **)objc_msgSend(v16, "createNDEObject:", v5->_currentBlob);

      if (v5->_ndeObject)
        goto LABEL_6;
      v6 = CSLogContextFacilityCoreSpeech;
      if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
LABEL_12:
        v18 = 0;
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315138;
      v23 = "-[CSKeywordAnalyzerNDEAPI initWithBlob:]";
      v19 = "%s Failed to initialize CSKeywordAnalyerNDEAPI";
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      *(_DWORD *)buf = 136315138;
      v23 = "-[CSKeywordAnalyzerNDEAPI initWithBlob:]";
      v19 = "%s CSKeywordAnalyerNDEAPI couldn't initialized since blob is nil";
    }
    _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
    goto LABEL_12;
  }
LABEL_6:
  v17 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[CSKeywordAnalyzerNDEAPI initWithBlob:]";
    _os_log_impl(&dword_1B502E000, v17, OS_LOG_TYPE_DEFAULT, "%s CSKeywordAnalyerNDEAPI created", buf, 0xCu);
  }
  v18 = v5;
LABEL_13:

  return v18;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_ndeObject)
  {
    +[CSNDEObjectFactory sharedInstance](CSNDEObjectFactory, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "destoryNDEObject:", self->_ndeObject);

    self->_ndeObject = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CSKeywordAnalyzerNDEAPI;
  -[CSKeywordAnalyzerNDEAPI dealloc](&v4, sel_dealloc);
}

- (id)checkForTriggerWithBytes:(const signed __int16 *)a3 withNumberOfSamples:(int64_t)a4
{
  id v5;
  id v6;
  CSKeywordAnalyzerNDEAPIResult *v7;
  CSKeywordAnalyzerNDEAPIResult *lastResult;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v6 = objc_retainAutorelease((id)objc_msgSend(v5, "initWithLength:", *MEMORY[0x1E0DC8678]));
  objc_msgSend(v6, "bytes");
  nde_process_v2();
  v7 = -[CSKeywordAnalyzerNDEAPIResult initWithBlob:isEarlyDetected:]([CSKeywordAnalyzerNDEAPIResult alloc], "initWithBlob:isEarlyDetected:", v6, 0);
  lastResult = self->_lastResult;
  self->_lastResult = v7;

  return 0;
}

- (id)processAudioChunk:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "numSamples");
  if (+[CSConfig inputRecordingIsFloat](CSConfig, "inputRecordingIsFloat"))
  {
    objc_msgSend(v4, "dataForChannel:", self->_activeChannel);
    v6 = objc_claimAutoreleasedReturnValue();

    +[CSFLPCMTypeConverter convertToShortLPCMBufFromFloatLPCMBuf:](CSFLPCMTypeConverter, "convertToShortLPCMBufFromFloatLPCMBuf:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)v6;
  }
  else
  {
    objc_msgSend(v4, "dataForChannel:", self->_activeChannel);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v8 = objc_retainAutorelease(v7);
  -[CSKeywordAnalyzerNDEAPI checkForTriggerWithBytes:withNumberOfSamples:](self, "checkForTriggerWithBytes:withNumberOfSamples:", objc_msgSend(v8, "bytes"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)getLastResult
{
  return self->_lastResult;
}

- (void)reset
{
  nde_reset();
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (CSKeywordAnalyzerNDEAPIScoreDelegate)delegate
{
  return (CSKeywordAnalyzerNDEAPIScoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastResult, 0);
  objc_storeStrong((id *)&self->_currentBlob, 0);
}

@end
