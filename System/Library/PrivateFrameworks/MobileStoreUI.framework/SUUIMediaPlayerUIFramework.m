@implementation SUUIMediaPlayerUIFramework

void *__SUUIMediaPlayerUIFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MediaPlayerUI.framework/MediaPlayerUI", 1);
  SUUIMediaPlayerUIFramework_sHandle = (uint64_t)result;
  return result;
}

@end
