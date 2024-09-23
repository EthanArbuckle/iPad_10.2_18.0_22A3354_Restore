@implementation AVIOKitOutputSettingsAssistantVideoEncoderCapabilities

- (BOOL)averageNonDroppableFrameIntervalIsSupportedByDefaultEncoderForVideoCodec:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("avc1"));
}

@end
