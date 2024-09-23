@implementation IKAppPlaylistBridge

- (IKAppPlaylistBridge)initWithAppContext:(id)a3 jsPlaylist:(id)a4
{
  id v6;
  id v7;
  IKAppPlaylistBridge *v8;
  id *v9;
  _QWORD v11[4];
  id v12;
  id *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IKAppPlaylistBridge;
  v8 = -[IKAppPlaylistBridge init](&v21, sel_init);
  if (v8)
  {
    if (initWithAppContext_jsPlaylist__onceToken != -1)
      dispatch_once(&initWithAppContext_jsPlaylist__onceToken, &__block_literal_global_8);
    objc_storeWeak((id *)&v8->_appContext, v6);
    objc_storeWeak((id *)&v8->_jsPlaylist, v7);
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__10;
    v19 = __Block_byref_object_dispose__10;
    v20 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__IKAppPlaylistBridge_initWithAppContext_jsPlaylist___block_invoke_1;
    v11[3] = &unk_1E9F4CF20;
    v14 = &v15;
    v12 = v6;
    v9 = v8;
    v13 = v9;
    objc_msgSend(v12, "evaluateDelegateBlockSync:", v11);
    objc_msgSend((id)_globalPlaylists, "addObject:", v16[5]);
    objc_storeWeak(v9 + 1, (id)v16[5]);

    _Block_object_dispose(&v15, 8);
  }

  return v8;
}

void __53__IKAppPlaylistBridge_initWithAppContext_jsPlaylist___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
  v1 = (void *)_globalPlaylists;
  _globalPlaylists = v0;

}

void __53__IKAppPlaylistBridge_initWithAppContext_jsPlaylist___block_invoke_1(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForPlaylist:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)cleanup
{
  IKAppPlaylist **p_appPlaylist;
  id WeakRetained;
  void *v4;
  id v5;
  _QWORD block[5];

  p_appPlaylist = &self->_appPlaylist;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appPlaylist);
  v4 = (void *)_globalPlaylists;
  v5 = objc_loadWeakRetained((id *)p_appPlaylist);
  objc_msgSend(v4, "removeObject:", v5);

  objc_storeWeak((id *)p_appPlaylist, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__IKAppPlaylistBridge_cleanup__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __30__IKAppPlaylistBridge_cleanup__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (id)item:(int64_t)a3
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__IKAppPlaylistBridge_item___block_invoke;
  v5[3] = &unk_1E9F4CF48;
  v5[4] = &v6;
  v5[5] = a3;
  -[IKAppPlaylistBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__IKAppPlaylistBridge_item___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "appPlaylist");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bridge");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)replaceItemsAt:(int64_t)a3 count:(unint64_t)a4 with:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v8 = a5;
  v9 = objc_msgSend(v8, "count");
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a3, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __49__IKAppPlaylistBridge_replaceItemsAt_count_with___block_invoke;
  v22 = &unk_1E9F4CF70;
  v23 = v8;
  v24 = v10;
  v25 = v11;
  v26 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = v8;
  -[IKAppPlaylistBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", &v19);
  v17 = (void *)objc_msgSend(v13, "copy", v19, v20, v21, v22);

  return v17;
}

void __49__IKAppPlaylistBridge_replaceItemsAt_count_with___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v10), "appMediaItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "appPlaylist");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectsAtIndexes:", *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appPlaylist");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectsAtIndexes:", *(_QWORD *)(a1 + 40));

  objc_msgSend(v4, "appPlaylist");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "insertObjects:atIndexes:", v5, *(_QWORD *)(a1 + 48));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = v13;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(a1 + 56);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "bridge", (_QWORD)v23);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v22);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

}

- (unint64_t)length
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__IKAppPlaylistBridge_length__block_invoke;
  v4[3] = &unk_1E9F4CF98;
  v4[4] = &v5;
  -[IKAppPlaylistBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __29__IKAppPlaylistBridge_length__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appPlaylist");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "count");

}

- (void)setEndAction:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__IKAppPlaylistBridge_setEndAction___block_invoke;
  v3[3] = &__block_descriptor_40_e46_v24__0__IKAppContext_8__IKAppPlaylistBridge_16l;
  v3[4] = a3;
  -[IKAppPlaylistBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v3);
}

void __36__IKAppPlaylistBridge_setEndAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appPlaylist");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndAction:", *(_QWORD *)(a1 + 32));

}

- (int64_t)endAction
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__IKAppPlaylistBridge_endAction__block_invoke;
  v4[3] = &unk_1E9F4CF98;
  v4[4] = &v5;
  -[IKAppPlaylistBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __32__IKAppPlaylistBridge_endAction__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appPlaylist");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "endAction");

}

- (void)setRepeatMode:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__IKAppPlaylistBridge_setRepeatMode___block_invoke;
  v3[3] = &__block_descriptor_40_e46_v24__0__IKAppContext_8__IKAppPlaylistBridge_16l;
  v3[4] = a3;
  -[IKAppPlaylistBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v3);
}

void __37__IKAppPlaylistBridge_setRepeatMode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appPlaylist");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRepeatMode:", *(_QWORD *)(a1 + 32));

}

- (int64_t)repeatMode
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__IKAppPlaylistBridge_repeatMode__block_invoke;
  v4[3] = &unk_1E9F4CF98;
  v4[4] = &v5;
  -[IKAppPlaylistBridge _evaluateDelegateBlockSync:](self, "_evaluateDelegateBlockSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __33__IKAppPlaylistBridge_repeatMode__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "appPlaylist");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "repeatMode");

}

- (void)_evaluateDelegateBlockSync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[IKAppPlaylistBridge appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__IKAppPlaylistBridge__evaluateDelegateBlockSync___block_invoke;
  v7[3] = &unk_1E9F4CA00;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "evaluateDelegateBlockSync:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __50__IKAppPlaylistBridge__evaluateDelegateBlockSync___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, WeakRetained);
  }

}

- (IKAppPlaylist)appPlaylist
{
  return (IKAppPlaylist *)objc_loadWeakRetained((id *)&self->_appPlaylist);
}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (IKJSPlaylist)jsPlaylist
{
  return (IKJSPlaylist *)objc_loadWeakRetained((id *)&self->_jsPlaylist);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_jsPlaylist);
  objc_destroyWeak((id *)&self->_appContext);
  objc_destroyWeak((id *)&self->_appPlaylist);
}

@end
