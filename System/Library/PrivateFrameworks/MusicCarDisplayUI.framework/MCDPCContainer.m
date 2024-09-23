@implementation MCDPCContainer

- (id)_initWithModel:(id)a3 rootItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  MCDPCContainer *v11;
  MCDPCContainer *v12;
  void *v13;
  uint64_t v14;
  NSString *identifier;
  void **p_indexPath;
  id v17;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *cachedItemsByIndicies;
  uint64_t v21;
  NSMutableDictionary *cachedIndiciesByIdentifier;
  dispatch_queue_t v23;
  OS_dispatch_queue *serialAccessContainerQueue;
  void *v25;
  id WeakRetained;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[MCDPCContainer init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_model, v8);
    objc_storeWeak((id *)&v12->_rootItem, v9);
    objc_msgSend(v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v14;

    p_indexPath = (void **)&v12->_indexPath;
    objc_storeStrong((id *)&v12->_indexPath, a5);
    if (!v12->_indexPath)
    {
      v17 = objc_alloc_init(MEMORY[0x24BDD15D8]);
      v18 = *p_indexPath;
      *p_indexPath = v17;

    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    cachedItemsByIndicies = v12->_cachedItemsByIndicies;
    v12->_cachedItemsByIndicies = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    cachedIndiciesByIdentifier = v12->_cachedIndiciesByIdentifier;
    v12->_cachedIndiciesByIdentifier = (NSMutableDictionary *)v21;

    v23 = dispatch_queue_create("com.apple.MusicCarDisplayUI.playableContent.serialContainerAccess", 0);
    serialAccessContainerQueue = v12->_serialAccessContainerQueue;
    v12->_serialAccessContainerQueue = (OS_dispatch_queue *)v23;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&v12->_model);
    objc_msgSend(v25, "addObserver:selector:name:object:", v12, sel__contentItemsUpdated_, CFSTR("didUpdateContent"), WeakRetained);

    objc_msgSend(v25, "addObserver:selector:name:object:", v12, sel__nowPlayingIdentifiersDidChange_, CFSTR("MCDBrowsableContentNowPlayingIdentifiersUpdatedNotification"), 0);
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MCDPCContainer;
  -[MCDPCContainer dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[MCDPCContainer setCachedCount:](self, "setCachedCount:", 0);
  -[MCDPCContainer serialAccessContainerQueue](self, "serialAccessContainerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__MCDPCContainer_invalidate__block_invoke;
  block[3] = &unk_24FD78200;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __28__MCDPCContainer_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCachedItemsByIndicies:", v2);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCachedIndiciesByIdentifier:", v3);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSString *identifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _MCDStringFromIndexPath(self->_indexPath);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  -[NSMutableDictionary keyEnumerator](self->_cachedItemsByIndicies, "keyEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p - [%@:%@] - %@>"), v5, self, v6, identifier, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_contentItemsUpdated:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id WeakRetained;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  _QWORD block[7];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[4];
  uint64_t v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  objc_msgSend(v21, "userInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", CFSTR("items"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCDBrowsableContentUtilities sharedInstance](MCDBrowsableContentUtilities, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  MCDGeneralLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FBAA000, v6, OS_LOG_TYPE_DEFAULT, "Content items updated, preparing to find indicies to update", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v28;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v34 = __Block_byref_object_copy__1;
        v35 = __Block_byref_object_dispose__1;
        v36 = 0;
        -[MCDPCContainer serialAccessContainerQueue](self, "serialAccessContainerQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __39__MCDPCContainer__contentItemsUpdated___block_invoke;
        block[3] = &unk_24FD78790;
        block[5] = v11;
        block[6] = buf;
        block[4] = self;
        dispatch_sync(v12, block);

        v13 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (v13)
        {
          -[MCDPCContainer cachedItemForIndex:](self, "cachedItemForIndex:", objc_msgSend(v13, "integerValue"));
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v11)
          {
            -[NSObject identifier](v14, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setCurrentlyPlaying:](v15, "setCurrentlyPlaying:", objc_msgSend(v23, "containsObject:", v16));

            objc_msgSend(v24, "addIndex:", objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "integerValue"));
          }
        }
        else
        {
          MCDGeneralLogging();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v11, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[MCDPCContainer _contentItemsUpdated:].cold.1(v17, v31, &v32, v15);
          }
        }

        _Block_object_dispose(buf, 8);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v24, "count") && (*(_BYTE *)&self->44 & 2) != 0)
  {
    MCDGeneralLogging();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[MCDPCContainer identifier](self, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v24;
      _os_log_impl(&dword_22FBAA000, v18, OS_LOG_TYPE_DEFAULT, "Contents updated for container: %{public}@, indicies: %{public}@", buf, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "container:didInvalidateIndicies:", self, v24);

  }
}

void __39__MCDPCContainer__contentItemsUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "cachedIndiciesByIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_nowPlayingIdentifiersDidChange:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *serialAccessContainerQueue;
  NSObject *v21;
  id WeakRetained;
  id v23;
  void *v24;
  id obj;
  _QWORD block[5];
  id v27;
  __int128 *p_buf;
  uint8_t v29[16];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 buf;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  +[MCDBrowsableContentUtilities sharedInstance](MCDBrowsableContentUtilities, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nowPlayingIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  MCDGeneralLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_22FBAA000, v6, OS_LOG_TYPE_DEFAULT, "Now Playing Identifiers changed, checking to see what is now playing", (uint8_t *)&buf, 2u);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[MCDPCContainer cachedItemsByIndicies](self, "cachedItemsByIndicies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v31;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v10);
        -[MCDPCContainer cachedItemsByIndicies](self, "cachedItemsByIndicies");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "currentlyPlaying");
        v16 = objc_msgSend(v5, "containsObject:", v14);
        MCDGeneralLogging();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if ((_DWORD)v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v14;
            _os_log_impl(&dword_22FBAA000, v18, OS_LOG_TYPE_DEFAULT, "Item currently playing. Identifier: %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v14;
          _os_log_debug_impl(&dword_22FBAA000, v18, OS_LOG_TYPE_DEBUG, "Item not currently playing. Identifier: %{public}@", (uint8_t *)&buf, 0xCu);
        }

        objc_msgSend(v13, "setCurrentlyPlaying:", v16);
        if (v15 != objc_msgSend(v13, "currentlyPlaying"))
        {
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v35 = 0x3032000000;
          v36 = __Block_byref_object_copy__1;
          v37 = __Block_byref_object_dispose__1;
          v38 = 0;
          MCDGeneralLogging();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v29 = 0;
            _os_log_impl(&dword_22FBAA000, v19, OS_LOG_TYPE_DEFAULT, "Item currently playing has changed, updating indicies", v29, 2u);
          }

          serialAccessContainerQueue = self->_serialAccessContainerQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __50__MCDPCContainer__nowPlayingIdentifiersDidChange___block_invoke;
          block[3] = &unk_24FD78790;
          p_buf = &buf;
          block[4] = self;
          v27 = v14;
          dispatch_sync(serialAccessContainerQueue, block);
          objc_msgSend(v24, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "integerValue"));

          _Block_object_dispose(&buf, 8);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v24, "count") && (*(_BYTE *)&self->44 & 2) != 0)
  {
    MCDGeneralLogging();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_22FBAA000, v21, OS_LOG_TYPE_DEFAULT, "Indicies invalidated based on now playing identifiers", (uint8_t *)&buf, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "container:didInvalidateIndicies:", self, v24);

  }
}

void __50__MCDPCContainer__nowPlayingIdentifiersDidChange___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 72), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  char v5;
  char v6;
  char v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_BYTE *)&self->44 = *(_BYTE *)&self->44 & 0xFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_BYTE *)&self->44 = *(_BYTE *)&self->44 & 0xFB | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_BYTE *)&self->44 = *(_BYTE *)&self->44 & 0xF7 | v7;
    objc_storeWeak((id *)&self->_delegate, obj);
  }

}

- (NSString)title
{
  id WeakRetained;
  void *v4;

  if (-[NSIndexPath length](self->_indexPath, "length"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_rootItem);
    objc_msgSend(WeakRetained, "title");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_model);
    objc_msgSend(WeakRetained, "appTitle");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)appTitle
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  objc_msgSend(WeakRetained, "appTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setShowPlaybackProgress:(BOOL)a3
{
  self->_showPlaybackProgress = a3;
}

- (int64_t)showCurrentlyPlayingIndex
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MCDPCContainer cachedItemsByIndicies](self, "cachedItemsByIndicies", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[MCDPCContainer cachedItemsByIndicies](self, "cachedItemsByIndicies");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v10, "integerValue");
        if ((objc_msgSend(v12, "currentlyPlaying") & (v13 < v8)) != 0)
          v8 = v13;

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (void)setCount:(int64_t)a3
{
  id WeakRetained;
  id v6;

  if (self->_cachedCount != a3)
  {
    if ((*(_BYTE *)&self->44 & 4) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "containerWillChangeCount:", self);

    }
    -[MCDPCContainer setCachedCount:](self, "setCachedCount:", a3);
    if ((*(_BYTE *)&self->44 & 8) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "containerDidChangeCount:", self);

    }
  }
}

- (id)containerForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  MCDPCContainer *v8;
  id WeakRetained;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDPCContainer cachedIndexByIdentifier:](self, "cachedIndexByIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  v8 = [MCDPCContainer alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  -[NSIndexPath indexPathByAddingIndex:](self->_indexPath, "indexPathByAddingIndex:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MCDPCContainer _initWithModel:rootItem:indexPath:](v8, "_initWithModel:rootItem:indexPath:", WeakRetained, v4, v10);

  return v11;
}

- (id)containerAtIndex:(int64_t)a3
{
  MCDPCContainer *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v5 = [MCDPCContainer alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  -[MCDPCContainer cachedItemForIndex:](self, "cachedItemForIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSIndexPath indexPathByAddingIndex:](self->_indexPath, "indexPathByAddingIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MCDPCContainer _initWithModel:rootItem:indexPath:](v5, "_initWithModel:rootItem:indexPath:", WeakRetained, v7, v8);

  return v9;
}

- (void)updateRootItemWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  NSUInteger v6;
  id WeakRetained;
  void (**v8)(id, uint64_t);
  _QWORD v9[5];
  void (**v10)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (!-[NSIndexPath length](self->_indexPath, "length"))
    v4[2](v4, 1);
  -[NSIndexPath indexPathByRemovingLastIndex](self->_indexPath, "indexPathByRemovingLastIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSIndexPath indexAtPosition:](self->_indexPath, "indexAtPosition:", -[NSIndexPath length](self->_indexPath, "length") - 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__MCDPCContainer_updateRootItemWithCompletion___block_invoke;
  v9[3] = &unk_24FD787B8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(WeakRetained, "getChildrenAtIndexPath:inRange:completion:", v5, v6, 1, v9);

}

void __47__MCDPCContainer_updateRootItemWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id obj;

  objc_msgSend(a2, "firstObject");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  if (v4)
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 24), obj);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchContentWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  MCDGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MCDPCContainer identifier](self, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("ROOT");
    if (v6)
      v8 = (const __CFString *)v6;
    *(_DWORD *)buf = 138412290;
    v13 = v8;
    _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "Starting to refresh for %@", buf, 0xCu);

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__MCDPCContainer_fetchContentWithCompletion___block_invoke;
  v10[3] = &unk_24FD78808;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[MCDPCContainer getPlaybackProgressSupportForChildrenWithCompletion:](self, "getPlaybackProgressSupportForChildrenWithCompletion:", v10);

}

void __45__MCDPCContainer_fetchContentWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __45__MCDPCContainer_fetchContentWithCompletion___block_invoke_2;
  v2[3] = &unk_24FD787E0;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "getCountOfChildrenWithCompletion:", v2);

}

void __45__MCDPCContainer_fetchContentWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__MCDPCContainer_fetchContentWithCompletion___block_invoke_3;
  v4[3] = &unk_24FD787B8;
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "getChildrenInRange:completion:", 0, a2, v4);

}

uint64_t __45__MCDPCContainer_fetchContentWithCompletion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  MCDGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = CFSTR("ROOT");
    if (v3)
      v5 = (const __CFString *)v3;
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_22FBAA000, v2, OS_LOG_TYPE_DEFAULT, "Finishing refresh for %@", (uint8_t *)&v7, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)refreshWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  MCDGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "Starting to refresh all items, beginning with beginLoadingItem", buf, 2u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__MCDPCContainer_refreshWithCompletion___block_invoke;
  v7[3] = &unk_24FD78858;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[MCDPCContainer beginLoadingItemWithCompletion:](self, "beginLoadingItemWithCompletion:", v7);

}

void __40__MCDPCContainer_refreshWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[16];

  MCDGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FBAA000, v2, OS_LOG_TYPE_DEFAULT, "Begin Loading completed for refreshing all items", buf, 2u);
  }

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__MCDPCContainer_refreshWithCompletion___block_invoke_338;
  v4[3] = &unk_24FD78830;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "fetchContentWithCompletion:", v4);

}

void __40__MCDPCContainer_refreshWithCompletion___block_invoke_338(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  MCDGeneralLogging();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_22FBAA000, v1, OS_LOG_TYPE_DEFAULT, "Completed invalidation, resetting", v2, 2u);
  }

}

- (BOOL)isValidForRefreshedParent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  NSIndexPath *v14;
  NSIndexPath *indexPath;

  v4 = a3;
  if (v4 || -[NSIndexPath length](self->_indexPath, "length"))
  {
    objc_msgSend(v4, "containerAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = 0;
      while (1)
      {
        objc_msgSend(v5, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", self->_identifier);

        if (v9)
          break;
        objc_msgSend(v4, "containerAtIndex:", ++v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v10;
        if (!v11)
        {
          v12 = 0;
          v5 = v10;
          goto LABEL_10;
        }
      }
      objc_msgSend(v4, "indexPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "indexPathByAddingIndex:", v7);
      v14 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
      indexPath = self->_indexPath;
      self->_indexPath = v14;

      v12 = 1;
    }
    else
    {
      v12 = 0;
    }
LABEL_10:

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)beginLoadingItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[MCDPCContainer containerForItem:](self, "containerForItem:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginLoadingItemWithCompletion:", v6);

}

- (void)beginLoadingItemWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  MCDGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MCDPCContainer identifier](self, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("ROOT");
    if (v6)
      v8 = (const __CFString *)v6;
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_22FBAA000, v5, OS_LOG_TYPE_DEFAULT, "Preparing to begin loading item %@", buf, 0xCu);

  }
  -[MCDPCContainer model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDPCContainer indexPath](self, "indexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__MCDPCContainer_beginLoadingItemWithCompletion___block_invoke;
  v12[3] = &unk_24FD78858;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v9, "beginLoadingItemAtIndexPath:completion:", v10, v12);

}

void __49__MCDPCContainer_beginLoadingItemWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  MCDGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("ROOT");
    if (v5)
      v7 = (const __CFString *)v5;
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_22FBAA000, v4, OS_LOG_TYPE_DEFAULT, "Finished begin loading item %@", (uint8_t *)&v9, 0xCu);

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

- (void)getPlaybackProgressSupportForChildrenWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[MCDPCContainer model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDPCContainer indexPath](self, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__MCDPCContainer_getPlaybackProgressSupportForChildrenWithCompletion___block_invoke;
  v8[3] = &unk_24FD78808;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "getChildrenSupportsPlaybackProgressForIndexPath:withCompletion:", v6, v8);

}

void __70__MCDPCContainer_getPlaybackProgressSupportForChildrenWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setShowPlaybackProgress:", a2);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

- (void)getNowPlayingIdentifiersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[MCDPCContainer model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__MCDPCContainer_getNowPlayingIdentifiersWithCompletion___block_invoke;
  v7[3] = &unk_24FD78880;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getNowPlayingIdentifiersWithCompletion:", v7);

}

void __57__MCDPCContainer_getNowPlayingIdentifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  +[MCDBrowsableContentUtilities sharedInstance](MCDBrowsableContentUtilities, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNowPlayingIdentifiers:", v5);

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (void)getCountOfChildrenWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[MCDPCContainer model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDPCContainer indexPath](self, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__MCDPCContainer_getCountOfChildrenWithCompletion___block_invoke;
  v8[3] = &unk_24FD787E0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "getCountOfChildrenAtIndexPath:withCompletion:", v6, v8);

}

void __51__MCDPCContainer_getCountOfChildrenWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setCount:", a2);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

- (void)getChildrenInRange:(_NSRange)a3 completion:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  NSUInteger v13;
  NSUInteger v14;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[MCDPCContainer model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDPCContainer indexPath](self, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__MCDPCContainer_getChildrenInRange_completion___block_invoke;
  v11[3] = &unk_24FD788D0;
  v13 = location;
  v14 = length;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "getChildrenAtIndexPath:inRange:completion:", v9, location, length, v11);

}

void __48__MCDPCContainer_getChildrenInRange_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v9 = a2;
  v10 = a5;
  objc_msgSend(*(id *)(a1 + 32), "serialAccessContainerQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__MCDPCContainer_getChildrenInRange_completion___block_invoke_2;
  block[3] = &unk_24FD788A8;
  v21 = *(_OWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v17 = v9;
  v18 = v12;
  v22 = a3;
  v23 = a4;
  v19 = v10;
  v20 = v13;
  v14 = v10;
  v15 = v9;
  dispatch_sync(v11, block);

}

void __48__MCDPCContainer_getChildrenInRange_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  +[MCDBrowsableContentUtilities sharedInstance](MCDBrowsableContentUtilities, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nowPlayingIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD *)(a1 + 64);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10
          && (v11 = (void *)v10,
              objc_msgSend(v9, "identifier"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              isKindOfClass = objc_opt_isKindOfClass(),
              v12,
              v11,
              (isKindOfClass & 1) == 0))
        {
          objc_msgSend(v9, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setCurrentlyPlaying:", objc_msgSend(v23, "containsObject:", v15));

          objc_msgSend(*(id *)(a1 + 40), "cachedItemsByIndicies");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, v17);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "cachedIndiciesByIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

          ++v3;
        }
        else
        {
          MCDGeneralLogging();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v9;
            _os_log_impl(&dword_22FBAA000, v14, OS_LOG_TYPE_DEFAULT, "Skipping item %@ without identifier", buf, 0xCu);
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v6);
  }

  MCDGeneralLogging();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22FBAA000, v21, OS_LOG_TYPE_DEFAULT, "Finished adding items to cache", buf, 2u);
  }

  v22 = *(_QWORD *)(a1 + 56);
  if (v22)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v22 + 16))(v22, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48));

}

- (id)cachedItemForIndex:(int64_t)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = 0;
  -[MCDPCContainer serialAccessContainerQueue](self, "serialAccessContainerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__MCDPCContainer_cachedItemForIndex___block_invoke;
  block[3] = &unk_24FD788F8;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __37__MCDPCContainer_cachedItemForIndex___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "cachedItemsByIndicies");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)cachedItemForIdentifier:(id)a3
{
  void *v4;
  void *v5;

  -[MCDPCContainer cachedIndexByIdentifier:](self, "cachedIndexByIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDPCContainer cachedItemForIndex:](self, "cachedItemForIndex:", objc_msgSend(v4, "integerValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cachedIndexByIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  -[MCDPCContainer serialAccessContainerQueue](self, "serialAccessContainerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__MCDPCContainer_cachedIndexByIdentifier___block_invoke;
  block[3] = &unk_24FD78790;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __42__MCDPCContainer_cachedIndexByIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "cachedIndiciesByIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (MCDPCItem)rootItem
{
  return (MCDPCItem *)objc_loadWeakRetained((id *)&self->_rootItem);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MCDPCModel)model
{
  return (MCDPCModel *)objc_loadWeakRetained((id *)&self->_model);
}

- (int64_t)cachedCount
{
  return self->_cachedCount;
}

- (void)setCachedCount:(int64_t)a3
{
  self->_cachedCount = a3;
}

- (BOOL)showPlaybackProgress
{
  return self->_showPlaybackProgress;
}

- (MCDPCContainerDelegate)delegate
{
  return (MCDPCContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)serialAccessContainerQueue
{
  return self->_serialAccessContainerQueue;
}

- (void)setSerialAccessContainerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialAccessContainerQueue, a3);
}

- (NSMutableDictionary)cachedIndiciesByIdentifier
{
  return self->_cachedIndiciesByIdentifier;
}

- (void)setCachedIndiciesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedIndiciesByIdentifier, a3);
}

- (NSMutableDictionary)cachedItemsByIndicies
{
  return self->_cachedItemsByIndicies;
}

- (void)setCachedItemsByIndicies:(id)a3
{
  objc_storeStrong((id *)&self->_cachedItemsByIndicies, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedItemsByIndicies, 0);
  objc_storeStrong((id *)&self->_cachedIndiciesByIdentifier, 0);
  objc_storeStrong((id *)&self->_serialAccessContainerQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_model);
  objc_destroyWeak((id *)&self->_rootItem);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)_contentItemsUpdated:(_QWORD *)a3 .cold.1(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_0_0(&dword_22FBAA000, a4, (uint64_t)a3, "Index was nil for %{public}@", a2);

}

@end
