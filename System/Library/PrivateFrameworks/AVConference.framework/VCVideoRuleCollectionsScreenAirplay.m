@implementation VCVideoRuleCollectionsScreenAirplay

+ (id)sharedInstance
{
  return +[VCVideoRuleCollectionsScreenAirplayEmbedded sharedInstance](VCVideoRuleCollectionsScreenAirplayEmbedded, "sharedInstance");
}

+ (unsigned)tilesPerFrameForHDRMode:(unint64_t)a3
{
  return +[VCHardwareSettings tilesPerVideoFrameForHardwareSettingsMode:hdrMode:](VCHardwareSettings, "tilesPerVideoFrameForHardwareSettingsMode:hdrMode:", 4, a3);
}

@end
