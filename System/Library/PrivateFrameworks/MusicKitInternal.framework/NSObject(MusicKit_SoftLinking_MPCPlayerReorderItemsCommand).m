@implementation NSObject(MusicKit_SoftLinking_MPCPlayerReorderItemsCommand)

- (id)_musicKit_self_reorderItemsCommand
{
  id v2;

  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1F0135A88))
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (id)musicKit_reorderItemsCommand_moveItem:()MusicKit_SoftLinking_MPCPlayerReorderItemsCommand afterItem:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_musicKit_self_reorderItemsCommand");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moveItem:afterItem:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)musicKit_reorderItemsCommand_moveItem:()MusicKit_SoftLinking_MPCPlayerReorderItemsCommand beforeItem:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_musicKit_self_reorderItemsCommand");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moveItem:beforeItem:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
