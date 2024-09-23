@implementation MusicKit_SoftLinking_MPSectionedCollection(MusicKit_SoftLinking_MPCPlayerResponseTracklist)

- (void)enumeratePlayerSectionsUsingBlock:()MusicKit_SoftLinking_MPCPlayerResponseTracklist
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "_underlyingSectionedCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __129__MusicKit_SoftLinking_MPSectionedCollection_MusicKit_SoftLinking_MPCPlayerResponseTracklist__enumeratePlayerSectionsUsingBlock___block_invoke;
  v7[3] = &unk_1E9C05C40;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateSectionsUsingBlock:", v7);

}

- (void)enumeratePlayerItemsInSectionAtIndex:()MusicKit_SoftLinking_MPCPlayerResponseTracklist usingBlock:
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  objc_msgSend(a1, "_underlyingSectionedCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __143__MusicKit_SoftLinking_MPSectionedCollection_MusicKit_SoftLinking_MPCPlayerResponseTracklist__enumeratePlayerItemsInSectionAtIndex_usingBlock___block_invoke;
  v9[3] = &unk_1E9C05C40;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v9);

}

@end
