@implementation NSBundle(MediaPlayerCore)

+ (id)mediaPlaybackCoreBundle
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__NSBundle_MediaPlayerCore__mediaPlaybackCoreBundle__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (mediaPlaybackCoreBundle___once != -1)
    dispatch_once(&mediaPlaybackCoreBundle___once, v3);
  return (id)mediaPlaybackCoreBundle___mediaPlayerCoreBundle;
}

@end
