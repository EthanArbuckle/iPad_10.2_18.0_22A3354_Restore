@implementation NSObject(MusicKit_SoftLinking_MPCPlayerInsertItemsCommand)

- (id)_musicKit_self_insertItemsCommand
{
  id v2;

  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1F0135A28))
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (id)musicKit_insertItemsCommand_insertAfterPlayingItemCommandRequestWithPlaybackIntent:()MusicKit_SoftLinking_MPCPlayerInsertItemsCommand
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_musicKit_self_insertItemsCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_underlyingPlaybackIntent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "insertAfterPlayingItemWithPlaybackIntent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)musicKit_insertItemsCommand_insertAtEndOfTracklistCommandRequestWithPlaybackIntent:()MusicKit_SoftLinking_MPCPlayerInsertItemsCommand
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_musicKit_self_insertItemsCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_underlyingPlaybackIntent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "insertAtEndOfTracklistWithPlaybackIntent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)musicKit_insertItemsCommand_insertAtEndOfUpNextCommandRequestWithPlaybackIntent:()MusicKit_SoftLinking_MPCPlayerInsertItemsCommand
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_musicKit_self_insertItemsCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_underlyingPlaybackIntent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "insertAtEndOfUpNextWithPlaybackIntent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)musicKit_insertItemCommand_insertAfterLastSection
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_insertItemsCommand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "insertAfterLastSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
