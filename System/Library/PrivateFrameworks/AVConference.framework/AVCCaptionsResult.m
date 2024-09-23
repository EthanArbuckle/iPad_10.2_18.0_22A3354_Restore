@implementation AVCCaptionsResult

- (AVCCaptionsResult)initWithCapacity:(int64_t)a3 utteranceComplete:(BOOL)a4 utteranceNumber:(unsigned int)a5 updateNumber:(unsigned int)a6 utteranceStartTimestamp:(double)a7 utteranceDuration:(double)a8
{
  AVCCaptionsResult *v14;
  uint64_t v15;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)AVCCaptionsResult;
  v14 = -[AVCCaptionsResult init](&v17, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    v14->_tokens = (NSMutableArray *)v15;
    if (v15)
    {
      v14->_utteranceComplete = a4;
      v14->_utteranceNumber = a5;
      v14->_updateNumber = a6;
      v14->_utteranceStartTimestamp = a7;
      v14->_utteranceDuration = a8;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCCaptionsResult initWithCapacity:utteranceComplete:utteranceNumber:updateNumber:utteranceStartTimestamp:utteranceDuration:].cold.1();
      }

      return 0;
    }
  }
  return v14;
}

- (BOOL)addTokenWithString:(id)a3 confidence:(double)a4 range:(_NSRange)a5
{
  AVCCaptionsToken *v6;

  v6 = -[AVCCaptionsToken initWithText:confidence:range:]([AVCCaptionsToken alloc], "initWithText:confidence:range:", a3, a5.location, a5.length, a4);
  if (v6)
  {
    -[NSMutableArray addObject:](self->_tokens, "addObject:", v6);

  }
  return v6 != 0;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVCCaptionsResult;
  -[AVCCaptionsResult dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  const char *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)AVCCaptionsResult;
  v4 = -[AVCCaptionsResult description](&v7, sel_description);
  if (self->_utteranceComplete)
    v5 = "YES";
  else
    v5 = "NO";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ tokens=%@, utteranceCompleted=%s, utteranceStartTimestamp=%f, utteranceDuration=%f"), v4, self->_tokens, v5, *(_QWORD *)&self->_utteranceStartTimestamp, *(_QWORD *)&self->_utteranceDuration);
}

- (NSArray)segments
{
  return &self->_tokens->super;
}

- (NSString)text
{
  return (NSString *)+[VCCaptionsUtilities formattedTextWithTranscription:](VCCaptionsUtilities, "formattedTextWithTranscription:", self);
}

- (BOOL)utteranceComplete
{
  return self->_utteranceComplete;
}

- (NSArray)tokens
{
  return &self->_tokens->super;
}

- (unsigned)utteranceNumber
{
  return self->_utteranceNumber;
}

- (unsigned)updateNumber
{
  return self->_updateNumber;
}

- (double)utteranceStartTimestamp
{
  return self->_utteranceStartTimestamp;
}

- (double)utteranceDuration
{
  return self->_utteranceDuration;
}

- (void)initWithCapacity:utteranceComplete:utteranceNumber:updateNumber:utteranceStartTimestamp:utteranceDuration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCCaptions [%s] %s:%d Failed to allocate closed captions token array", v2, v3, v4, v5, 2u);
}

@end
