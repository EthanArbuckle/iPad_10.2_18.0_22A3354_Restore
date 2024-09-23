@implementation AVCCaptionsToken

- (AVCCaptionsToken)initWithText:(id)a3 confidence:(double)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  AVCCaptionsToken *v9;
  objc_super v11;
  uint64_t v12;

  length = a5.length;
  location = a5.location;
  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)AVCCaptionsToken;
  v9 = -[AVCCaptionsToken init](&v11, sel_init);
  if (v9)
  {
    if (a3)
    {
      v9->_text = (NSString *)objc_msgSend(a3, "copy");
      v9->_confidence = a4;
      v9->_range.location = location;
      v9->_range.length = length;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCCaptionsToken initWithText:confidence:range:].cold.1();
      }

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVCCaptionsToken;
  -[AVCCaptionsToken dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: confidence[%f] range[%@]"), v5, *(_QWORD *)&self->_confidence, NSStringFromRange(self->_range));
}

- (NSString)text
{
  return self->_text;
}

- (double)confidence
{
  return self->_confidence;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)initWithText:confidence:range:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCCaptions [%s] %s:%d Invalid closed captions token received", v2, v3, v4, v5, 2u);
}

@end
