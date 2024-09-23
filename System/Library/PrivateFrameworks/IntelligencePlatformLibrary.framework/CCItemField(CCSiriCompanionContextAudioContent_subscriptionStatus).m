@implementation CCItemField(CCSiriCompanionContextAudioContent_subscriptionStatus)

- (uint64_t)siriCompanionContextAudioContentSubscriptionStatus
{
  uint64_t result;

  LODWORD(result) = objc_msgSend(a1, "uint32Value");
  if (result >= 4)
    return 0;
  else
    return result;
}

@end
