@implementation VCMediaControlInfo

- (VCMediaControlInfo)init
{
  VCMediaControlInfo *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaControlInfo;
  result = -[VCMediaControlInfo init](&v3, sel_init);
  if (result)
  {
    result->_vtableC.serializedSize = VCMediaControlInfo_SerializedSize;
    result->_vtableC.serialize = VCMediaControlInfo_SerializeBuffer;
  }
  return result;
}

- (VCMediaControlInfo)initWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5 version:(unsigned __int8)a6
{
  VCMediaControlInfo *v10;
  VCMediaControlInfo *v11;

  v10 = -[VCMediaControlInfo init](self, "init");
  v11 = v10;
  if (v10)
  {
    v10->_version = a6;
    if (-[VCMediaControlInfo configureWithBuffer:length:optionalControlInfo:](v10, "configureWithBuffer:length:optionalControlInfo:", a3, a4, a5) < 0)
    {

      return 0;
    }
  }
  return v11;
}

- (int)configureWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, a5, "-[VCMediaControlInfo configureWithBuffer:length:optionalControlInfo:]"), 0));
}

- (int)setInfo:(void *)a3 size:(unint64_t)a4 type:(unsigned int)a5
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, *(_QWORD *)&a5, "-[VCMediaControlInfo setInfo:size:type:]"), 0));
}

- (int)setInfoUnserialized:(id *)a3 type:(unsigned int)a4
{
  return 0;
}

- (BOOL)hasInfoType:(unsigned int)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaControlInfo hasInfoType:]"), 0));
}

- (int)getInfo:(void *)a3 bufferLength:(unint64_t)a4 infoSize:(unint64_t *)a5 type:(unsigned int)a6
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, a5, *(_QWORD *)&a6, "-[VCMediaControlInfo getInfo:bufferLength:infoSize:type:]"), 0));
}

- (int)getInfoUnserialized:(id *)a3 type:(unsigned int)a4
{
  return 0;
}

- (int)serializeToBuffer:(char *)a3 bufferLength:(unint64_t)a4 blobLength:(unint64_t *)a5
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, a5, "HRESULT VCMediaControlInfo_SerializeBuffer(VCMediaControlInfo *, uint8_t *, size_t, size_t *)"), 0));
}

- (unint64_t)serializedSize
{
  return self->_serializedSize;
}

- (unsigned)fecFeedbackVersion
{
  return self->_fecFeedbackVersion;
}

- (void)setFecFeedbackVersion:(unsigned __int8)a3
{
  self->_fecFeedbackVersion = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int8)a3
{
  self->_version = a3;
}

@end
