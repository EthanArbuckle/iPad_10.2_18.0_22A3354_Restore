@implementation VCVideoRuleCollectionsMediaRecorderMac

- (VCVideoRuleCollectionsMediaRecorderMac)initWithHardwareSettings:(id)a3
{
  VCVideoRuleCollectionsMediaRecorderMac *result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCVideoRuleCollectionsMediaRecorderMac;
  result = -[VCVideoRuleCollectionsMediaRecorder init](&v5, sel_init);
  if (result)
    result->_hardwareSettings = (VCHardwareSettingsMacProtocol *)a3;
  return result;
}

+ (id)sharedInstance
{
  return 0;
}

- (unsigned)mediaRecorderCapabilities
{
  return 2;
}

- (id)mediaRecorderVideoCodecs
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", &unk_1E9EF5690, 0);
  if (-[VCHardwareSettingsMacProtocol supportHEVC](self->_hardwareSettings, "supportHEVC")
    && self->super._isHEIFAndHEVCFormatEnabled)
  {
    objc_msgSend(v3, "addObject:", &unk_1E9EF56A8);
  }
  return v3;
}

- (id)mediaRecorderImageTypes
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", &unk_1E9EF56C0, 0);
  v4 = v3;
  if (self->super._isHEIFAndHEVCFormatEnabled)
    objc_msgSend(v3, "addObject:", &unk_1E9EF56D8);
  return v4;
}

@end
