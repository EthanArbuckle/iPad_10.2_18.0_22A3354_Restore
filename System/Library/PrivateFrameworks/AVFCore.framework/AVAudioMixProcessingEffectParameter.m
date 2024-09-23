@implementation AVAudioMixProcessingEffectParameter

- (AVAudioMixProcessingEffectParameter)initWithFourCharCode:(unsigned int)a3 value:(float)a4
{
  AVAudioMixProcessingEffectParameter *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAudioMixProcessingEffectParameter;
  result = -[AVAudioMixProcessingEffectParameter init](&v7, sel_init);
  if (result)
  {
    result->_fourcc = a3;
    result->_value = a4;
  }
  return result;
}

+ (id)parameterWithFourCharCode:(unsigned int)a3 value:(float)a4
{
  uint64_t v5;
  AVAudioMixProcessingEffectParameter *v6;
  double v7;

  v5 = *(_QWORD *)&a3;
  v6 = [AVAudioMixProcessingEffectParameter alloc];
  *(float *)&v7 = a4;
  return -[AVAudioMixProcessingEffectParameter initWithFourCharCode:value:](v6, "initWithFourCharCode:value:", v5, v7);
}

- (BOOL)isEqual:(id)a3
{
  double v5;
  void *v6;
  double v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (a3 != self)
  {
    if (self->_fourcc == *((_DWORD *)a3 + 2))
    {
      *(float *)&v5 = self->_value;
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
      LODWORD(v7) = *((_DWORD *)a3 + 3);
      return objc_msgSend(v6, "isEqual:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7));
    }
    return 0;
  }
  return 1;
}

- (unint64_t)hash
{
  double v2;
  uint64_t v4;

  *(float *)&v2 = self->_value;
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2), "hash");
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_fourcc), "hash") ^ v4;
}

- (unsigned)fourcc
{
  return self->_fourcc;
}

- (float)value
{
  return self->_value;
}

@end
