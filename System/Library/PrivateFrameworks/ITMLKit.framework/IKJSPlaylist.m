@implementation IKJSPlaylist

- (IKJSPlaylist)init
{
  void *v3;
  IKJSPlaylist *v4;
  IKAppPlaylistBridge *v5;
  void *v6;
  uint64_t v7;
  IKAppPlaylistBridge *bridge;
  objc_super v10;

  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)IKJSPlaylist;
  v4 = -[IKJSObject initWithAppContext:](&v10, sel_initWithAppContext_, v3);

  if (v4)
  {
    v5 = [IKAppPlaylistBridge alloc];
    -[IKJSObject appContext](v4, "appContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[IKAppPlaylistBridge initWithAppContext:jsPlaylist:](v5, "initWithAppContext:jsPlaylist:", v6, v4);
    bridge = v4->_bridge;
    v4->_bridge = (IKAppPlaylistBridge *)v7;

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[IKAppPlaylistBridge cleanup](self->_bridge, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)IKJSPlaylist;
  -[IKJSPlaylist dealloc](&v3, sel_dealloc);
}

- (id)splice:(int64_t)a3 :(int64_t)a4 :(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  id obj;
  id obja;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = v8;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isObject"))
  {
    obj = (id)a3;
    objc_msgSend(v8, "toArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          -[IKJSObject appContext](self, "appContext");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "jsContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "virtualMachine");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addManagedReference:withOwner:", v14, self);

          objc_msgSend(v14, "bridge");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v18);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v11);
    }

    a3 = (int64_t)obj;
  }
  -[IKAppPlaylistBridge replaceItemsAt:count:with:](self->_bridge, "replaceItemsAt:count:with:", a3 & ~(a3 >> 63), a4 & ~(a4 >> 63), v33);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obja = v19;
  v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v37 != v23)
          objc_enumerationMutation(obja);
        v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        -[IKJSObject appContext](self, "appContext");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "jsContext");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "virtualMachine");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "jsMediaItem");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "removeManagedReference:withOwner:", v29, self);

        objc_msgSend(v25, "jsMediaItem");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v30);

      }
      v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v22);
  }

  return v20;
}

- (void)push:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[IKJSPlaylist length](self, "length");
  v5 = (void *)MEMORY[0x1E0CBE108];
  -[IKJSObject appContext](self, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithObject:inContext:", v10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[IKJSPlaylist splice:::](self, "splice:::", v4, 0, v8);
}

- (id)pop
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[IKJSPlaylist length](self, "length");
  if (v3)
  {
    -[IKAppPlaylistBridge replaceItemsAt:count:with:](self->_bridge, "replaceItemsAt:count:with:", v3 - 1, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject appContext](self, "appContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jsContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "virtualMachine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeManagedReference:withOwner:", v8, self);

    objc_msgSend(v4, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "jsMediaItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)item:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[IKAppPlaylistBridge item:](self->_bridge, "item:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "jsMediaItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)length
{
  return -[IKAppPlaylistBridge length](self->_bridge, "length");
}

- (void)setEndAction:(int64_t)a3
{
  -[IKAppPlaylistBridge setEndAction:](self->_bridge, "setEndAction:", a3);
}

- (int64_t)endAction
{
  return -[IKAppPlaylistBridge endAction](self->_bridge, "endAction");
}

- (void)setRepeatMode:(int64_t)a3
{
  -[IKAppPlaylistBridge setRepeatMode:](self->_bridge, "setRepeatMode:", a3);
}

- (int64_t)repeatMode
{
  return -[IKAppPlaylistBridge repeatMode](self->_bridge, "repeatMode");
}

- (IKAppPlaylistBridge)bridge
{
  return self->_bridge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridge, 0);
}

@end
