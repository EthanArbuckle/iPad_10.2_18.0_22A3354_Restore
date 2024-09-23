@implementation NSObject(MusicKit_SoftLinking_MPCPlayerChangeItemCommand)

- (id)_musicKit_self_changeItemCommand
{
  id v2;

  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1F0135BA8))
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (id)musicKit_changeItemCommand_previousItemCommandRequest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_changeItemCommand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "previousItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_changeItemCommand_previousItemDeferringToPlaybackQueuePositionCommandRequest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_changeItemCommand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "previousItemDeferringToPlaybackQueuePosition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_changeItemCommand_previousSectionCommandRequest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_changeItemCommand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "previousSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_changeItemCommand_previousChapterCommandRequest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_changeItemCommand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "previousChapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_changeItemCommand_nextItemCommandRequest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_changeItemCommand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "nextItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_changeItemCommand_nextSectionCommandRequest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_changeItemCommand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "nextSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_changeItemCommand_nextChapterCommandRequest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_changeItemCommand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "nextChapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_changeItemCommand_changeToItem:()MusicKit_SoftLinking_MPCPlayerChangeItemCommand
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_musicKit_self_changeItemCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeToItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
