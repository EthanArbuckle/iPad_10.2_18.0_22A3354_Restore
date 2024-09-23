@implementation VCSessionParticipantAudioStreamConfig

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionParticipantAudioStreamConfig;
  -[VCAudioStreamConfig dealloc](&v3, sel_dealloc);
}

- (VCAudioRuleCollection)audioRulesNegotiated
{
  return self->_audioRulesNegotiated;
}

- (void)setAudioRulesNegotiated:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 480);
}

- (VCAudioRuleCollection)audioRules
{
  return self->_audioRules;
}

- (void)setAudioRules:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 472);
}

@end
