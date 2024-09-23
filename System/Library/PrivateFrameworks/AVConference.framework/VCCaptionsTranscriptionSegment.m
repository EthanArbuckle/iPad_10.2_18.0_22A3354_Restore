@implementation VCCaptionsTranscriptionSegment

- (VCCaptionsTranscriptionSegment)initWithConfidence:(unsigned int)a3 text:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  VCCaptionsTranscriptionSegment *v9;
  objc_super v11;
  uint64_t v12;

  length = a5.length;
  location = a5.location;
  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCCaptionsTranscriptionSegment;
  v9 = -[VCCaptionsTranscriptionSegment init](&v11, sel_init);
  if (v9)
  {
    v9->_text = (NSString *)objc_msgSend(a4, "copy");
    v9->_range.location = location;
    v9->_range.length = length;
    v9->_confidence = a3;
    if (a3 >= 0x65)
    {

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
  v3.super_class = (Class)VCCaptionsTranscriptionSegment;
  -[VCCaptionsTranscriptionSegment dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[VCCaptionsTranscriptionSegment initWithConfidence:text:range:](+[VCCaptionsTranscriptionSegment allocWithZone:](VCCaptionsTranscriptionSegment, "allocWithZone:", a3), "initWithConfidence:text:range:", self->_confidence, self->_text, self->_range.location, self->_range.length);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_text, CFSTR("segmentText"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_confidence, CFSTR("segmentConfidence"));
  objc_msgSend(a3, "encodeInt32:forKey:", LODWORD(self->_range.length), CFSTR("segmentLength"));
  objc_msgSend(a3, "encodeInt32:forKey:", LODWORD(self->_range.location), CFSTR("segmentLocation"));
}

- (VCCaptionsTranscriptionSegment)initWithCoder:(id)a3
{
  VCCaptionsTranscriptionSegment *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VCCaptionsTranscriptionSegment;
  v4 = -[VCCaptionsTranscriptionSegment init](&v6, sel_init);
  if (v4)
  {
    if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("segmentConfidence")) & 1) != 0)
    {
      v4->_confidence = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("segmentConfidence"));
      if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("segmentLength")) & 1) != 0)
      {
        v4->_range.length = (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("segmentLength"));
        if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("segmentLocation")) & 1) != 0)
        {
          v4->_range.location = (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("segmentLocation"));
          if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("segmentText")) & 1) != 0)
          {
            v4->_text = (NSString *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("segmentText"));
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCCaptionsTranscriptionSegment initWithCoder:].cold.1();
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCCaptionsTranscriptionSegment initWithCoder:].cold.2();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCaptionsTranscriptionSegment initWithCoder:].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCaptionsTranscriptionSegment initWithCoder:].cold.4();
    }
    if (!v4->_text)
    {

      return 0;
    }
  }
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p> confidence=%u range=%@"), v5, self, self->_confidence, NSStringFromRange(self->_range));
}

- (unint64_t)hash
{
  uint64_t confidence;

  confidence = self->_confidence;
  return -[NSString hash](self->_text, "hash") ^ confidence ^ self->_range.length ^ self->_range.location;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL result;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = objc_msgSend(a3, "confidence");
  if (v5 != -[VCCaptionsTranscriptionSegment confidence](self, "confidence"))
    return 0;
  v6 = objc_msgSend(a3, "range");
  v8 = v7;
  v10 = -[VCCaptionsTranscriptionSegment range](self, "range");
  result = 0;
  if (v6 == v10 && v8 == v9)
    return objc_msgSend((id)objc_msgSend(a3, "text"), "isEqual:", -[VCCaptionsTranscriptionSegment text](self, "text"));
  return result;
}

- (unsigned)confidence
{
  return self->_confidence;
}

- (NSString)text
{
  return self->_text;
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decode segment text", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decode is local", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decode is local", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decode update number", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
