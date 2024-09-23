@implementation MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel

- (unint64_t)type
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_voiceGuidanceLevel, CFSTR("_voiceGuidanceLevel"));
}

- (MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel)initWithCoder:(id)a3
{
  id v4;
  MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel *v5;
  MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel;
  v5 = -[MNNavigationServiceCallbackParameters initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_voiceGuidanceLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_voiceGuidanceLevel"));
    v6 = v5;
  }

  return v5;
}

- (unint64_t)voiceGuidanceLevel
{
  return self->_voiceGuidanceLevel;
}

- (void)setVoiceGuidanceLevel:(unint64_t)a3
{
  self->_voiceGuidanceLevel = a3;
}

@end
