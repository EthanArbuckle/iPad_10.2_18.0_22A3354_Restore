@implementation REVideoPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REVideoPayload)initWithAudioInputMode:(REVideoPayload *)self reverbSendLevel:(SEL)a2 diffuseSpillMapDimensions:(unsigned __int8)a3 specularSpillMapDimensions:(float)a4 diffuseSpillBlurSigma:(int)a5 specularSpillBlurSigma:(int)a6 desiredViewingMode:(unsigned __int8)a7 preventPlaybackUntilReady:(BOOL)a8
{
  uint64_t v8;
  uint64_t v9;
  REVideoPayload *result;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v17 = v8;
  v18 = v9;
  v19.receiver = self;
  v19.super_class = (Class)REVideoPayload;
  result = -[RESharedResourcePayload init](&v19, sel_init);
  if (result)
  {
    result->_audioInputMode = a3;
    result->_reverbSendLevel = a4;
    *(_QWORD *)&result->_diffuseSpillMapWidth = v17;
    *(_QWORD *)&result->_specularSpillMapWidth = v18;
    result->_diffuseSpillBlurSigma = a5;
    result->_specularSpillBlurSigma = a6;
    result->_desiredViewingMode = a7;
    result->_preventPlaybackUntilReady = a8;
  }
  return result;
}

- (REVideoPayload)initWithCoder:(id)a3
{
  id v4;
  REVideoPayload *v5;
  float v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REVideoPayload;
  v5 = -[RESharedResourcePayload initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_audioInputMode = objc_msgSend(v4, "decodeIntForKey:", CFSTR("audioInputMode"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("reverbSendLevel"));
    v5->_reverbSendLevel = v6;
    v5->_diffuseSpillMapWidth = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("diffuseSpillMapWidth"));
    v5->_diffuseSpillMapHeight = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("diffuseSpillMapHeight"));
    v5->_specularSpillMapWidth = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("specularSpillMapWidth"));
    v5->_specularSpillMapHeight = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("specularSpillMapHeight"));
    v5->_diffuseSpillBlurSigma = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("diffuseSpillBlurSigma"));
    v5->_specularSpillBlurSigma = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("specularSpillBlurSigma"));
    v5->_desiredViewingMode = objc_msgSend(v4, "decodeIntForKey:", CFSTR("desiredViewingMode"));
    v5->_preventPlaybackUntilReady = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preventPlaybackUntilReady"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", self->_audioInputMode, CFSTR("audioInputMode"));
  *(float *)&v4 = self->_reverbSendLevel;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("reverbSendLevel"), v4);
  objc_msgSend(v5, "encodeInt32:forKey:", self->_diffuseSpillMapWidth, CFSTR("diffuseSpillMapWidth"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_diffuseSpillMapHeight, CFSTR("diffuseSpillMapHeight"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_specularSpillMapWidth, CFSTR("specularSpillMapWidth"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_specularSpillMapHeight, CFSTR("specularSpillMapHeight"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_diffuseSpillBlurSigma, CFSTR("diffuseSpillBlurSigma"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_specularSpillBlurSigma, CFSTR("specularSpillBlurSigma"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_desiredViewingMode, CFSTR("desiredViewingMode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_preventPlaybackUntilReady, CFSTR("preventPlaybackUntilReady"));

}

- (unsigned)audioInputMode
{
  return self->_audioInputMode;
}

- (float)reverbSendLevel
{
  return self->_reverbSendLevel;
}

- (int)diffuseSpillMapWidth
{
  return self->_diffuseSpillMapWidth;
}

- (int)diffuseSpillMapHeight
{
  return self->_diffuseSpillMapHeight;
}

- (int)specularSpillMapWidth
{
  return self->_specularSpillMapWidth;
}

- (int)specularSpillMapHeight
{
  return self->_specularSpillMapHeight;
}

- (int)diffuseSpillBlurSigma
{
  return self->_diffuseSpillBlurSigma;
}

- (int)specularSpillBlurSigma
{
  return self->_specularSpillBlurSigma;
}

- (unsigned)desiredViewingMode
{
  return self->_desiredViewingMode;
}

- (BOOL)preventPlaybackUntilReady
{
  return self->_preventPlaybackUntilReady;
}

@end
