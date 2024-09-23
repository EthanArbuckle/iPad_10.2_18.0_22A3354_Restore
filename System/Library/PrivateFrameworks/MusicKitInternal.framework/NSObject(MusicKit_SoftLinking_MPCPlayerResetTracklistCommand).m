@implementation NSObject(MusicKit_SoftLinking_MPCPlayerResetTracklistCommand)

- (id)_musicKit_self_resetTracklistCommand
{
  id v2;

  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1F0135968))
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (id)musicKit_resetTracklistCommand_replaceCommandRequestWithPlaybackIntent:()MusicKit_SoftLinking_MPCPlayerResetTracklistCommand replaceIntent:
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if ((unint64_t)(a4 - 1) >= 3)
    v5 = 0;
  else
    v5 = a4;
  v6 = a3;
  objc_msgSend(a1, "_musicKit_self_resetTracklistCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_underlyingPlaybackIntent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "replaceWithPlaybackIntent:replaceIntent:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)musicKit_resetTracklistCommand_clearCommandRequest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_resetTracklistCommand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clear");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_resetTracklistCommand_clearUpNextItemsCommandRequest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_resetTracklistCommand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clearUpNextItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
