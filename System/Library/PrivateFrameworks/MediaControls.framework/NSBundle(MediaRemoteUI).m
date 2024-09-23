@implementation NSBundle(MediaRemoteUI)

+ (id)mediaRemoteUIBundle
{
  if (mediaRemoteUIBundle___once != -1)
    dispatch_once(&mediaRemoteUIBundle___once, &__block_literal_global_32);
  return (id)mediaRemoteUIBundle___mediaRemoteUIBundle;
}

+ (uint64_t)mru_isFaceTimeBundleIdentifier:()MediaRemoteUI
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mru_FaceTimeBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

+ (const)mru_FaceTimeBundleIdentifier
{
  return CFSTR("com.apple.facetime");
}

+ (uint64_t)mru_isHome
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "mru_isHomeBundleIdentifier:", v3);

  return v4;
}

+ (uint64_t)mru_isSpringBoard
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "mru_isSpringBoardBundleIdentifier:", v3);

  return v4;
}

+ (uint64_t)mru_isMediaRemoteUI
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "mru_isMediaRemoteUIBundleIdentifier:", v3);

  return v4;
}

+ (uint64_t)mru_isProximityControl
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "mru_isProximityControlBundleIdentifier:", v3);

  return v4;
}

+ (uint64_t)mru_isSiri
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "mru_isSiriBundleIdentifier:", v3);

  return v4;
}

+ (const)mru_TVRemoteIdentifier
{
  return CFSTR("com.apple.TVRemoteUIService");
}

+ (uint64_t)mru_isHomeBundleIdentifier:()MediaRemoteUI
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.home"));

  return v4;
}

+ (uint64_t)mru_isSpringBoardBundleIdentifier:()MediaRemoteUI
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.springboard"));

  return v4;
}

+ (uint64_t)mru_isMediaRemoteUIBundleIdentifier:()MediaRemoteUI
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mediaremoteui"));

  return v4;
}

+ (uint64_t)mru_isMediaRemoteDaemonBundleIdentifier:()MediaRemoteUI
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mediaremoted"));

  return v4;
}

+ (uint64_t)mru_isProximityControlBundleIdentifier:()MediaRemoteUI
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.proximitycontrold")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.pcviewservice"));

  }
  return v5;
}

+ (uint64_t)mru_isSiriBundleIdentifier:()MediaRemoteUI
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri"));

  return v4;
}

+ (uint64_t)mru_isSoundScapesIdentifier:()MediaRemoteUI
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.soundscapes"));

  return v4;
}

+ (uint64_t)mru_isMusicBundleIdentifier:()MediaRemoteUI
{
  return MRMediaRemoteApplicationIsSystemMediaApplication();
}

+ (uint64_t)mru_isPodcastsBundleIdentifier:()MediaRemoteUI
{
  return MRMediaRemoteApplicationIsSystemPodcastApplication();
}

@end
