@implementation VCCaptionsTranscription

- (void)setUpUtteranceStartTimestamp:(double)a3 andUtteranceDuration:(double)a4
{
  uint64_t v5;
  NSObject *v6;
  double utteranceStartTimestamp;
  double utteranceDuration;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  self->_utteranceStartTimestamp = a3;
  self->_utteranceDuration = a4;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      utteranceStartTimestamp = self->_utteranceStartTimestamp;
      utteranceDuration = self->_utteranceDuration;
      v9 = 136316162;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCCaptionsTranscription setUpUtteranceStartTimestamp:andUtteranceDuration:]";
      v13 = 1024;
      v14 = 49;
      v15 = 2048;
      v16 = utteranceStartTimestamp;
      v17 = 2048;
      v18 = utteranceDuration;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d utteranceStartTimestamp=%f utteranceDuration=%f", (uint8_t *)&v9, 0x30u);
    }
  }
}

- (VCCaptionsTranscription)initWithUtteranceNumber:(unsigned int)a3 updateNumber:(unsigned int)a4 isLocal:(BOOL)a5 isFinal:(BOOL)a6 streamToken:(int64_t)a7
{
  VCCaptionsTranscription *v12;
  VCCaptionsTranscription *v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)VCCaptionsTranscription;
  v12 = -[VCCaptionsTranscription init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_utteranceNumber = a3;
    v12->_updateNumber = a4;
    v12->_isLocal = a5;
    v12->_isFinal = a6;
    v12->_segments = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13->_streamToken = a7;
    *(int64x2_t *)&v13->_utteranceStartTimestamp = vdupq_n_s64(0x7FF8000000000000uLL);
  }
  return v13;
}

- (VCCaptionsTranscription)initWithSFTranscription:(id)a3 taskInfo:(id)a4 isLocal:(BOOL)a5 isFinal:(BOOL)a6
{
  VCCaptionsTranscription *v8;
  VCCaptionsTranscription *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  VCCaptionsTranscriptionSegment *v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = -[VCCaptionsTranscription initWithUtteranceNumber:updateNumber:isLocal:isFinal:streamToken:](self, "initWithUtteranceNumber:updateNumber:isLocal:isFinal:streamToken:", objc_msgSend(a4, "utteranceNumber"), objc_msgSend(a4, "updateNumber"), a5, a6, objc_msgSend(a4, "token"));
  if (v8)
  {
    v9 = v8;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = (void *)objc_msgSend(a3, "segments");
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      v14 = 0.0;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v17 = [VCCaptionsTranscriptionSegment alloc];
          objc_msgSend(v16, "confidence");
          v19 = (float)(v18 * 100.0);
          v20 = objc_msgSend(v16, "substring");
          v21 = objc_msgSend(v16, "substringRange");
          v23 = -[VCCaptionsTranscriptionSegment initWithConfidence:text:range:](v17, "initWithConfidence:text:range:", v19, v20, v21, v22);
          if (!v23)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCCaptionsTranscription initWithSFTranscription:taskInfo:isLocal:isFinal:].cold.2();
            }

            return 0;
          }
          v24 = (void *)v23;
          -[NSMutableArray addObject:](v9->_segments, "addObject:", v23);

          objc_msgSend(v16, "duration");
          v14 = v14 + v25;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      v14 = 0.0;
    }
    -[VCCaptionsTranscription setUpUtteranceStartTimestamp:andUtteranceDuration:](v9, "setUpUtteranceStartTimestamp:andUtteranceDuration:", VCCaptionTaskInfo_HostTime((uint64_t)a4), v14);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCaptionsTranscription initWithSFTranscription:taskInfo:isLocal:isFinal:].cold.1();
    }
    return 0;
  }
  return v9;
}

- (VCCaptionsTranscription)initWithSTTranscriberMultisegmentResult:(id)a3 taskInfo:(id)a4 isLocal:(BOOL)a5 isFinal:(BOOL)a6
{
  VCCaptionsTranscription *v8;
  VCCaptionsTranscription *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  VCCaptionsTranscriptionSegment *v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  id v23;
  void *v24;
  _QWORD v25[4];
  CMTime time;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = -[VCCaptionsTranscription initWithUtteranceNumber:updateNumber:isLocal:isFinal:streamToken:](self, "initWithUtteranceNumber:updateNumber:isLocal:isFinal:streamToken:", objc_msgSend(a4, "utteranceNumber"), objc_msgSend(a4, "updateNumber"), a5, a6, objc_msgSend(a4, "token"));
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCaptionsTranscription initWithSTTranscriberMultisegmentResult:taskInfo:isLocal:isFinal:].cold.1();
    }
    return 0;
  }
  v9 = v8;
  v23 = a3;
  v10 = (void *)objc_msgSend(a3, "segments");
  if (objc_msgSend(v10, "count"))
  {
    v11 = 0;
    v24 = v10;
    while (1)
    {
      v12 = (void *)objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
      if (objc_msgSend((id)objc_msgSend(v12, "text"), "count"))
        break;
LABEL_8:
      ++v11;
      v10 = v24;
      if (v11 >= objc_msgSend(v24, "count"))
        goto LABEL_9;
    }
    v13 = 0;
    v14 = 0;
    while (1)
    {
      v15 = (void *)objc_msgSend((id)objc_msgSend(v12, "text"), "objectAtIndexedSubscript:", v14);
      v16 = objc_msgSend((id)objc_msgSend(v15, "text"), "length");
      v17 = [VCCaptionsTranscriptionSegment alloc];
      objc_msgSend(v15, "confidence");
      v19 = -[VCCaptionsTranscriptionSegment initWithConfidence:text:range:](v17, "initWithConfidence:text:range:", (v18 * 100.0), objc_msgSend(v15, "text"), v13, v16);
      if (!v19)
        break;
      v20 = (void *)v19;
      v13 += objc_msgSend((id)objc_msgSend(v15, "text"), "length");
      -[NSMutableArray addObject:](v9->_segments, "addObject:", v20);

      if (++v14 >= (unint64_t)objc_msgSend((id)objc_msgSend(v12, "text"), "count"))
        goto LABEL_8;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCaptionsTranscription initWithSTTranscriberMultisegmentResult:taskInfo:isLocal:isFinal:].cold.2();
    }

    return 0;
  }
LABEL_9:
  v21 = VCCaptionTaskInfo_HostTime((uint64_t)a4);
  if (v23)
    objc_msgSend(v23, "recognitionAudioRange");
  else
    memset(v25, 0, sizeof(v25));
  time = *(CMTime *)&v25[1];
  -[VCCaptionsTranscription setUpUtteranceStartTimestamp:andUtteranceDuration:](v9, "setUpUtteranceStartTimestamp:andUtteranceDuration:", v21, CMTimeGetSeconds(&time));
  return v9;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsTranscription;
  -[VCCaptionsTranscription dealloc](&v3, sel_dealloc);
}

- (NSString)formattedText
{
  NSString *result;

  result = &self->_formattedText->super;
  if (!result)
  {
    result = (NSString *)objc_msgSend(+[VCCaptionsUtilities formattedTextWithTranscription:](VCCaptionsUtilities, "formattedTextWithTranscription:", self), "copy");
    self->_formattedText = (NSMutableString *)result;
  }
  return result;
}

- (void)addSegment:(id)a3
{
  -[NSMutableArray addObject:](self->_segments, "addObject:", a3);

  self->_formattedText = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VCCaptionsTranscription *v5;
  NSMutableArray *segments;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = -[VCCaptionsTranscription initWithUtteranceNumber:updateNumber:isLocal:isFinal:streamToken:](+[VCCaptionsTranscription allocWithZone:](VCCaptionsTranscription, "allocWithZone:"), "initWithUtteranceNumber:updateNumber:isLocal:isFinal:streamToken:", self->_utteranceNumber, self->_updateNumber, self->_isLocal, self->_isFinal, self->_streamToken);
  -[VCCaptionsTranscription setUpUtteranceStartTimestamp:andUtteranceDuration:](v5, "setUpUtteranceStartTimestamp:andUtteranceDuration:", self->_utteranceStartTimestamp, self->_utteranceDuration);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  segments = self->_segments;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](segments, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(segments);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "copyWithZone:", a3);
        -[VCCaptionsTranscription addSegment:](v5, "addSegment:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](segments, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v8);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt32:forKey:", self->_utteranceNumber, CFSTR("utteranceNumber"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_updateNumber, CFSTR("updateNumber"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isLocal, CFSTR("isLocal"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isFinal, CFSTR("isFinal"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_segments, CFSTR("segments"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("utteranceStartTimestamp"), self->_utteranceStartTimestamp);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("utteranceDuration"), self->_utteranceDuration);
}

- (VCCaptionsTranscription)initWithCoder:(id)a3
{
  VCCaptionsTranscription *v4;
  double v5;
  double v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCCaptionsTranscription;
  v4 = -[VCCaptionsTranscription init](&v8, sel_init);
  if (v4)
  {
    if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("utteranceNumber")) & 1) != 0)
    {
      v4->_utteranceNumber = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("utteranceNumber"));
      if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("updateNumber")) & 1) != 0)
      {
        v4->_updateNumber = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("updateNumber"));
        if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("isLocal")) & 1) != 0)
        {
          v4->_isLocal = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isLocal"));
          if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("isFinal")) & 1) != 0)
          {
            v4->_isFinal = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isFinal"));
            if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("segments")) & 1) != 0)
            {
              v4->_segments = (NSMutableArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("segments")), "copy");
              if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("utteranceStartTimestamp")) & 1) != 0)
              {
                objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("utteranceStartTimestamp"));
                v4->_utteranceStartTimestamp = v5;
                if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("utteranceDuration")) & 1) != 0)
                {
                  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("utteranceDuration"));
                  v4->_utteranceDuration = v6;
                  return v4;
                }
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCCaptionsTranscription initWithCoder:].cold.1();
                }
              }
              else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[VCCaptionsTranscription initWithCoder:].cold.2();
              }
            }
            else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCCaptionsTranscription initWithCoder:].cold.3();
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCCaptionsTranscription initWithCoder:].cold.4();
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCCaptionsTranscription initWithCoder:].cold.5();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCaptionsTranscription initWithCoder:].cold.6();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCaptionsTranscription initWithCoder:].cold.7();
    }

    return 0;
  }
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p> utteranceNumber=%u, updateNumber=%u, isLocal=%d, isFinal=%d, streamToken=%ld, utteranceStartTimestamp=%f, utteranceDuration=%f, segments=%@"), NSStringFromClass(v4), self, self->_utteranceNumber, self->_updateNumber, self->_isLocal, self->_isFinal, self->_streamToken, *(_QWORD *)&self->_utteranceStartTimestamp, *(_QWORD *)&self->_utteranceDuration, self->_segments);
}

- (unint64_t)hash
{
  unsigned int utteranceNumber;
  unsigned int updateNumber;
  _BOOL4 isLocal;
  _BOOL4 isFinal;
  uint64_t v7;
  int v8;
  int v9;

  utteranceNumber = self->_utteranceNumber;
  updateNumber = self->_updateNumber;
  isLocal = self->_isLocal;
  isFinal = self->_isFinal;
  v7 = -[NSMutableArray hash](self->_segments, "hash");
  if (isLocal)
    v8 = 4236;
  else
    v8 = 7112;
  if (isFinal)
    v9 = 4236;
  else
    v9 = 7112;
  return v7 ^ *(_QWORD *)&self->_utteranceStartTimestamp ^ updateNumber ^ utteranceNumber ^ v8 ^ v9 ^ *(_QWORD *)&self->_utteranceDuration;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  if (self == a3)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = objc_msgSend(a3, "utteranceNumber"),
          v5 == -[VCCaptionsTranscription utteranceNumber](self, "utteranceNumber"))
      && (v6 = objc_msgSend(a3, "updateNumber"), v6 == -[VCCaptionsTranscription updateNumber](self, "updateNumber"))
      && (v7 = objc_msgSend(a3, "isLocal"), v7 == -[VCCaptionsTranscription isLocal](self, "isLocal"))
      && (v8 = objc_msgSend(a3, "isFinal"), v8 == -[VCCaptionsTranscription isFinal](self, "isFinal")))
    {
      v9 = objc_msgSend((id)objc_msgSend(a3, "segments"), "isEqual:", -[VCCaptionsTranscription segments](self, "segments"));
      if (v9)
      {
        objc_msgSend(a3, "utteranceStartTimestamp");
        v11 = v10;
        -[VCCaptionsTranscription utteranceStartTimestamp](self, "utteranceStartTimestamp");
        v9 = VCMathUtils_DoubleEqualWithAccuracy(v11, v12, 0.0000625);
        if (v9)
        {
          objc_msgSend(a3, "utteranceDuration");
          v14 = v13;
          -[VCCaptionsTranscription utteranceDuration](self, "utteranceDuration");
          LOBYTE(v9) = VCMathUtils_DoubleEqualWithAccuracy(v14, v15, 0.0000625);
        }
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (unsigned)utteranceNumber
{
  return self->_utteranceNumber;
}

- (void)setUtteranceNumber:(unsigned int)a3
{
  self->_utteranceNumber = a3;
}

- (unsigned)updateNumber
{
  return self->_updateNumber;
}

- (void)setUpdateNumber:(unsigned int)a3
{
  self->_updateNumber = a3;
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (void)setIsLocal:(BOOL)a3
{
  self->_isLocal = a3;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (void)setIsFinal:(BOOL)a3
{
  self->_isFinal = a3;
}

- (NSArray)segments
{
  return &self->_segments->super;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (double)utteranceStartTimestamp
{
  return self->_utteranceStartTimestamp;
}

- (double)utteranceDuration
{
  return self->_utteranceDuration;
}

- (void)initWithSFTranscription:taskInfo:isLocal:isFinal:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to init captions transcription VCCaptionsTranscription from speech framework transcription.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithSFTranscription:taskInfo:isLocal:isFinal:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to init captions transcription segment from speech framework transcription.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithSTTranscriberMultisegmentResult:taskInfo:isLocal:isFinal:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to init captions transcription VCCaptionsTranscription from transcriber multisegment result.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithSTTranscriberMultisegmentResult:taskInfo:isLocal:isFinal:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to init captions transcription segment from transcriber multisegment result.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decode utterance duration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decode utterance start timestamp", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decode segments", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decode is final", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decode is local", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decode update number", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decode utterance number", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
