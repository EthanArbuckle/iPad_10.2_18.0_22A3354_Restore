@implementation REVideoPlayerItemsLooper

- (REVideoPlayerItemsLooper)initWithPlayer:(id)a3 assets:(id)a4
{
  id v6;
  id v7;
  REVideoPlayerItemsLooper *v8;
  REVideoPlayerItemsLooper *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[REVideoPlayerItemsLooper init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[REVideoPlayerItemsLooper setPlayer:](v8, "setPlayer:", v6);
    -[REVideoPlayerItemsLooper setLoopedAssets:](v9, "setLoopedAssets:", v7);
    -[REVideoPlayerItemsLooper enqueueAssetItems](v9, "enqueueAssetItems");
    -[REVideoPlayerItemsLooper observeLastAndEnqueueAssetItems](v9, "observeLastAndEnqueueAssetItems");
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)REVideoPlayerItemsLooper;
  -[REVideoPlayerItemsLooper dealloc](&v4, sel_dealloc);
}

- (void)enqueueAssetItems
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[REVideoPlayerItemsLooper loopedAssets](self, "loopedAssets", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        -[REVideoPlayerItemsLooper player](self, "player");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithAsset:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "insertItem:afterItem:", v9, 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)observeLastAndEnqueueAssetItems
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[REVideoPlayerItemsLooper player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_playerItemAtEnd_, *MEMORY[0x24BDB1FA8], v5);

  -[REVideoPlayerItemsLooper enqueueAssetItems](self, "enqueueAssetItems");
  -[REVideoPlayerItemsLooper player](self, "player");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "play");

}

- (void)playerItemAtEnd:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[REVideoPlayerItemsLooper observeLastAndEnqueueAssetItems](self, "observeLastAndEnqueueAssetItems");
}

- (AVQueuePlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (NSArray)loopedAssets
{
  return self->_loopedAssets;
}

- (void)setLoopedAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loopedAssets, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
