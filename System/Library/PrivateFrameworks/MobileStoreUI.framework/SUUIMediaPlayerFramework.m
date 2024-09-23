@implementation SUUIMediaPlayerFramework

void *__SUUIMediaPlayerFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/MediaPlayer.framework/MediaPlayer", 1);
  SUUIMediaPlayerFramework_sHandle = (uint64_t)result;
  return result;
}

@end
