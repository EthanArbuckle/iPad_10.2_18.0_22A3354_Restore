@implementation NSBundle(NMSAdditions)

+ (id)nanoMusicSyncBundle
{
  if (nanoMusicSyncBundle_onceToken != -1)
    dispatch_once(&nanoMusicSyncBundle_onceToken, &__block_literal_global_12);
  return (id)nanoMusicSyncBundle___nanoMusicSyncBundle;
}

@end
