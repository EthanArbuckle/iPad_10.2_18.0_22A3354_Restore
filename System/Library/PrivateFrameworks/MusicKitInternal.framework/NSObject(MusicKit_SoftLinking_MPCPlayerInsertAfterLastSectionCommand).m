@implementation NSObject(MusicKit_SoftLinking_MPCPlayerInsertAfterLastSectionCommand)

- (id)_musicKit_self_insertAfterLastSectionCommand
{
  id v2;

  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1F01359C8))
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (id)musicKit_sectionMetadataObject
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_musicKit_self_insertAfterLastSectionCommand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadataObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)musicKit_insertWithPlaybackIntent:()MusicKit_SoftLinking_MPCPlayerInsertAfterLastSectionCommand
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_musicKit_self_insertAfterLastSectionCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_underlyingPlaybackIntent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "insertWithPlaybackIntent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
