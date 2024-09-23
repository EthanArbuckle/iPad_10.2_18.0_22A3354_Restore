@implementation GKRawTurnsDataSource

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4 updateNotifier:(id)a5
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  GKRawTurnsDataSource *v11;

  v6 = a5;
  v7 = (void *)MEMORY[0x1E0D253E0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__GKRawTurnsDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke;
  v9[3] = &unk_1E59C52E8;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v7, "loadTurnBasedMatchSummariesIncludingCompatibleBundleID:withCompletionHandler:", 1, v9);

}

void __75__GKRawTurnsDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__GKRawTurnsDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_2;
  v8[3] = &unk_1E59C4708;
  v6 = *(void **)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "addUpdate:error:", v8, a3);

}

uint64_t __75__GKRawTurnsDataSource_refreshContentsForDataType_userInfo_updateNotifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItems:", *(_QWORD *)(a1 + 40));
}

- (void)setItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "setState:", 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  v9.receiver = self;
  v9.super_class = (Class)GKRawTurnsDataSource;
  -[GKBasicCollectionViewDataSource setItems:](&v9, sel_setItems_, v4);

}

@end
