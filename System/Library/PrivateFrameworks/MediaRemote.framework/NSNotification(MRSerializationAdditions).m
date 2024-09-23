@implementation NSNotification(MRSerializationAdditions)

- (id)playerPath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)mr_playbackQueue
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("kMRPlaybackQueueUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
