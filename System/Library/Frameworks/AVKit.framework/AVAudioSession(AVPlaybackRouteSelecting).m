@implementation AVAudioSession(AVPlaybackRouteSelecting)

- (uint64_t)prepareRouteSelectionForPlaybackWithCompletionHandler:()AVPlaybackRouteSelecting
{
  return objc_msgSend(a1, "prepareRouteSelectionForPlaybackFromBundleID:withCompletionHandler:", 0, a3);
}

@end
