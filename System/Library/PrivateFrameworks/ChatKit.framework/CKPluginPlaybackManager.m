@implementation CKPluginPlaybackManager

- (CKPluginPlaybackManager)initWithPluginItems:(id)a3
{
  id v4;
  CKPluginPlaybackManager *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKPluginPlaybackManager;
  v5 = -[CKPluginPlaybackManager init](&v8, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    -[CKPluginPlaybackManager _setPluginItems:](v5, "_setPluginItems:", v6);

    -[CKPluginPlaybackManager _setPlayingBack:](v5, "_setPlayingBack:", 0);
    v5->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)_cleanup
{
  void *v3;

  -[CKPluginPlaybackManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pluginPlaybackManagerDidStopPlayback:", self);

  -[CKPluginPlaybackManager _setPluginItems:](self, "_setPluginItems:", 0);
}

- (void)startPlayback
{
  void *v3;
  unint64_t currentIndex;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  void (**v15)(_QWORD);
  _QWORD aBlock[5];

  if (self->_currentIndex == 0x7FFFFFFFFFFFFFFFLL)
    self->_currentIndex = 0;
  -[CKPluginPlaybackManager _pluginItems](self, "_pluginItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  currentIndex = self->_currentIndex;
  if (currentIndex < objc_msgSend(v3, "count"))
  {
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__CKPluginPlaybackManager_startPlayback__block_invoke;
    aBlock[3] = &unk_1E274A208;
    aBlock[4] = self;
    v6 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v3, "objectAtIndex:", self->_currentIndex);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKSnapshotUtilities snapshotForGUID:](CKSnapshotUtilities, "snapshotForGUID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v6[2](v6);
    }
    else
    {
      -[CKPluginPlaybackManager _setPlayingBack:](self, "_setPlayingBack:", 1);
      objc_msgSend(v7, "IMChatItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __40__CKPluginPlaybackManager_startPlayback__block_invoke_2;
      v13[3] = &unk_1E274C780;
      v14 = v7;
      v15 = v6;
      objc_msgSend(v12, "playbackWithCompletionBlock:", v13);

    }
  }

}

uint64_t __40__CKPluginPlaybackManager_startPlayback__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  _QWORD *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[1] + 1;
  objc_msgSend(v2, "_pluginItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = *(_QWORD **)(a1 + 32);
  if (v3 >= v5)
  {
    objc_msgSend(v6, "_cleanup");
    return objc_msgSend(*(id *)(a1 + 32), "_setPlayingBack:", 0);
  }
  else
  {
    ++v6[1];
    return objc_msgSend(*(id *)(a1 + 32), "startPlayback");
  }
}

uint64_t __40__CKPluginPlaybackManager_startPlayback__block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "IMChatItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "markAsPlayed");

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)addPluginItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  CKPluginPlaybackManager *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v15 = self;
  -[CKPluginPlaybackManager _pluginItems](self, "_pluginItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "IMChatItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "guid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "IMChatItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "guid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqualToString:", v13);

      if ((v14 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    -[CKPluginPlaybackManager _pluginItems](v15, "_pluginItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);
  }

}

- (void)stopPlayback
{
  void *v3;
  unint64_t currentIndex;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CKPluginPlaybackManager _setPlayingBack:](self, "_setPlayingBack:", 0);
  if (self->_currentIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CKPluginPlaybackManager _pluginItems](self, "_pluginItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    currentIndex = self->_currentIndex;
    v8 = v3;
    if (currentIndex < objc_msgSend(v3, "count"))
    {
      objc_msgSend(v8, "objectAtIndex:", self->_currentIndex);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "IMChatItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stopPlayback");

    }
    -[CKPluginPlaybackManager _cleanup](self, "_cleanup");

  }
}

- (void)dealloc
{
  objc_super v3;

  -[CKPluginPlaybackManager setDelegate:](self, "setDelegate:", 0);
  -[CKPluginPlaybackManager _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)CKPluginPlaybackManager;
  -[CKPluginPlaybackManager dealloc](&v3, sel_dealloc);
}

- (CKPluginPlaybackManagerDelegate)delegate
{
  return (CKPluginPlaybackManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isPlayingBack
{
  return self->_isPlayingBack;
}

- (void)_setPlayingBack:(BOOL)a3
{
  self->_isPlayingBack = a3;
}

- (NSMutableArray)_pluginItems
{
  return self->__pluginItems;
}

- (void)_setPluginItems:(id)a3
{
  objc_storeStrong((id *)&self->__pluginItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pluginItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
