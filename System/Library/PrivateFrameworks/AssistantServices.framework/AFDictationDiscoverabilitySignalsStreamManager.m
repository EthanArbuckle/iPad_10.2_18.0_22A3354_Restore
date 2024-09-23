@implementation AFDictationDiscoverabilitySignalsStreamManager

+ (void)sendDictationRequestStartedEventWithBundleIdentifier:(id)a3 context:(id)a4 userInfo:(id)a5
{
  +[AFTipKitDonator donateDictationEventStartedForBundleId:context:userInfo:](AFTipKitDonator, "donateDictationEventStartedForBundleId:context:userInfo:", a3, a4, a5);
}

+ (void)sendSiriRequestStartedEventWithBundleIdentifier:(id)a3 context:(id)a4 userInfo:(id)a5
{
  +[AFTipKitDonator donateSiriEventStartedForBundleId:context:userInfo:](AFTipKitDonator, "donateSiriEventStartedForBundleId:context:userInfo:", a3, a4, a5);
}

+ (void)sendSendMessageSentEventWithBundleIdentifier:(id)a3 context:(id)a4 userInfo:(id)a5
{
  +[AFTipKitDonator donateMessageSentForBundleId:context:userInfo:](AFTipKitDonator, "donateMessageSentForBundleId:context:userInfo:", a3, a4, a5);
}

@end
