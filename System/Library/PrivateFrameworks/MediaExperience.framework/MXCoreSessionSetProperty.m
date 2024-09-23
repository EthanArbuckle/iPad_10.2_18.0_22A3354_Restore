@implementation MXCoreSessionSetProperty

void __MXCoreSessionSetProperty_block_invoke()
{
  CMSMUtility_UpdateSomeLongFormVideoClientIsActiveOverAirPlayVideo();
  CMSMUtility_UpdateSomeLongFormVideoClientIsPlayingOverAirPlayVideo();
  CMSMNotificationUtility_PostVideoStreamsDidChange();
}

@end
