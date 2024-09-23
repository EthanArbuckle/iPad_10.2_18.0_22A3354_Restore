@implementation AEChatKitStatisticsManager

- (void)reportPayloadSentFromSource:(int64_t)a3
{
  AEChatKitSendAnalyticsEventAssetSentFromSource(a3);
}

@end
