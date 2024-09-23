@implementation AVPlayerInitializeIAPD

BOOL __AVPlayerInitializeIAPD_block_invoke()
{
  _BOOL8 result;

  sAVPlayerIAPDReadWriteQueue = (uint64_t)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avplayer.iapd");
  result = +[AVPlayer isIAPDExtendedModeActive](AVPlayer, "isIAPDExtendedModeActive");
  sAVPlayerIAPDExtendedModeIsActive = result;
  return result;
}

@end
