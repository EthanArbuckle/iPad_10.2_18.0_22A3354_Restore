@implementation CSVADSignalExtractor

- (CSVADSignalExtractor)initWithToken:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  CSVADSignalExtractor *v8;
  CSVADSignalExtractor *v9;
  uint64_t v10;
  NSMutableArray *speechDetectedRanges;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSVADSignalExtractor;
  v8 = -[CSVADSignalExtractor init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    *(_WORD *)&v8->_hasSpeechEverDetected = 0;
    objc_storeWeak((id *)&v8->_delegate, v7);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    speechDetectedRanges = v9->_speechDetectedRanges;
    v9->_speechDetectedRanges = (NSMutableArray *)v10;

    v9->_lastSpeechStartSampleCount = 0;
    v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[CSVADSignalExtractor initWithToken:delegate:]";
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s Token : %{public}@", buf, 0x16u);
    }
  }

  return v9;
}

- (void)reset
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVADSignalExtractor reset]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  *(_WORD *)&self->_hasSpeechEverDetected = 0;
  self->_lastSpeechStartSampleCount = 0;
  -[NSMutableArray removeAllObjects](self->_speechDetectedRanges, "removeAllObjects");
}

- (BOOL)hasSpeechDetectedFromStartSampleCount:(unint64_t)a3 toEndSampleCount:(unint64_t)a4
{
  CSFRangeUtils *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t lastSpeechStartSampleCount;
  BOOL v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = -[CSFRangeUtils initWithStartPoint:endPoint:]([CSFRangeUtils alloc], "initWithStartPoint:endPoint:", a3, a4);
  if (!v6)
    goto LABEL_13;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = self->_speechDetectedRanges;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasIntersectionWithRange:", v6, (_QWORD)v20))
        {
          v15 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            objc_msgSend(v12, "description");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[CSFRangeUtils description](v6, "description");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v25 = "-[CSVADSignalExtractor hasSpeechDetectedFromStartSampleCount:toEndSampleCount:]";
            v26 = 2114;
            v27 = v17;
            v28 = 2114;
            v29 = v18;
            _os_log_impl(&dword_1B502E000, v16, OS_LOG_TYPE_DEFAULT, "%s Intersection detected : cached(%{public}@) vs. input(%{public}@)", buf, 0x20u);

          }
          goto LABEL_17;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      if (v9)
        continue;
      break;
    }
  }

  lastSpeechStartSampleCount = self->_lastSpeechStartSampleCount;
  if (lastSpeechStartSampleCount - 1 < a4
    || !lastSpeechStartSampleCount
    && !-[NSMutableArray count](self->_speechDetectedRanges, "count")
    && self->_hasSpeechEverDetected)
  {
LABEL_17:
    v14 = 1;
  }
  else
  {
LABEL_13:
    v14 = 0;
  }

  return v14;
}

- (void)processBufferSampleWithIndex:(unint64_t)a3 startSampleCount:(unint64_t)a4 isSampleRepresentSpeech:(BOOL)a5 vadToSpeechRatio:(unint64_t)a6
{
  unint64_t v9;
  NSObject *v10;
  id WeakRetained;
  char v12;
  id v13;
  CSFRangeUtils *v14;
  unint64_t v15;
  NSObject *v16;
  id v18;
  char v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_isSpeechDetected || !a5)
  {
    if (self->_isSpeechDetected && !a5)
    {
      self->_isSpeechDetected = 0;
      v9 = a4 + a6 * a3;
      v10 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315650;
        v22 = "-[CSVADSignalExtractor processBufferSampleWithIndex:startSampleCount:isSampleRepresentSpeech:vadToSpeechRatio:]";
        v23 = 2050;
        v24 = v9;
        v25 = 2050;
        v26 = a4;
        _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Detected speech end at %{public}llu (startSampleCount = %{public}llu)", (uint8_t *)&v21, 0x20u);
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        v13 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v13, "vadSignalExtractor:didDetectedSpeechEndAtSampleCount:", self, v9);

      }
      v14 = -[CSFRangeUtils initWithStartPoint:endPoint:]([CSFRangeUtils alloc], "initWithStartPoint:endPoint:", self->_lastSpeechStartSampleCount, v9);
      -[NSMutableArray addObject:](self->_speechDetectedRanges, "addObject:", v14);
      self->_lastSpeechStartSampleCount = 0;

    }
  }
  else
  {
    *(_WORD *)&self->_hasSpeechEverDetected = 257;
    v15 = a4 + a6 * a3;
    v16 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315650;
      v22 = "-[CSVADSignalExtractor processBufferSampleWithIndex:startSampleCount:isSampleRepresentSpeech:vadToSpeechRatio:]";
      v23 = 2050;
      v24 = v15;
      v25 = 2050;
      v26 = a4;
      _os_log_impl(&dword_1B502E000, v16, OS_LOG_TYPE_DEFAULT, "%s Detected speech start at %{public}llu (startSampleCount = %{public}llu)", (uint8_t *)&v21, 0x20u);
    }
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      v20 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v20, "vadSignalExtractor:didDetectedSpeechStartAtSampleCount:", self, v15);

    }
    self->_lastSpeechStartSampleCount = v15;
  }
}

- (BOOL)hasSpeechEverDetected
{
  return self->_hasSpeechEverDetected;
}

- (BOOL)isSpeechDetected
{
  return self->_isSpeechDetected;
}

- (void)setIsSpeechDetected:(BOOL)a3
{
  self->_isSpeechDetected = a3;
}

- (CSVADSignalExtractorDelegate)delegate
{
  return (CSVADSignalExtractorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)speechDetectedRanges
{
  return self->_speechDetectedRanges;
}

- (void)setSpeechDetectedRanges:(id)a3
{
  objc_storeStrong((id *)&self->_speechDetectedRanges, a3);
}

- (unint64_t)lastSpeechStartSampleCount
{
  return self->_lastSpeechStartSampleCount;
}

- (void)setLastSpeechStartSampleCount:(unint64_t)a3
{
  self->_lastSpeechStartSampleCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechDetectedRanges, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
