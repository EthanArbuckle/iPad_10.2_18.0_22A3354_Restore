@implementation MPMusicPlayerQueueDescriptor(MPCModelPlaybackAdditions)

- (uint64_t)playbackContexts
{
  return 0;
}

- (void)_addRequestingBundleIdentifierToPlaybackRequestEnvironment:()MPCModelPlaybackAdditions
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "requestingBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "setRequestingBundleIdentifier:", v4);
    objc_msgSend(a1, "requestingBundleVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRequestingBundleVersion:", v5);

  }
}

- (uint64_t)matchesStartItem:()MPCModelPlaybackAdditions
{
  return 1;
}

@end
