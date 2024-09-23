@implementation VCVideoRuleCollectionsScreenSecondary

+ (id)sharedInstance
{
  return +[VCVideoRuleCollectionsScreenSecondaryEmbedded sharedInstance](VCVideoRuleCollectionsScreenSecondaryEmbedded, "sharedInstance");
}

+ (unsigned)tilesPerFrame
{
  return +[VCHardwareSettings tilesPerVideoFrameForHardwareSettingsMode:](VCHardwareSettings, "tilesPerVideoFrameForHardwareSettingsMode:", 3);
}

@end
