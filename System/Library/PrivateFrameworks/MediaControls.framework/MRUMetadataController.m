@implementation MRUMetadataController

- (MRUMetadataController)initWithDataSource:(id)a3
{
  id v5;
  MRUMetadataController *v6;
  uint64_t v7;
  NSHashTable *observers;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRUMetadataController;
  v6 = -[MRUMetadataController init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_dataSource, a3);
    -[MRUMetadataDataSource setDelegate:](v6->_dataSource, "setDelegate:", v6);
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), objc_opt_class(), self->_dataSource);
}

- (BOOL)appSupportsHaptics
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;

  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[MRUMetadataDataSource bundleID](self->_dataSource, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v7);

  LOBYTE(v4) = AXApplicationSupportsHapticMusic();
  return (char)v4;
}

- (void)setDataSource:(id)a3
{
  MRUMetadataDataSource *v5;
  MRUMetadataDataSource *dataSource;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (MRUMetadataDataSource *)a3;
  dataSource = self->_dataSource;
  if (dataSource != v5)
  {
    -[MRUMetadataDataSource setDelegate:](dataSource, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_dataSource, a3);
    -[MRUMetadataDataSource setDelegate:](self->_dataSource, "setDelegate:", self);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = (id)-[NSHashTable copy](self->_observers, "copy");
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v16)
    {
      v15 = *(_QWORD *)v18;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[MRUMetadataDataSource bundleID](v5, "bundleID");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "metadataController:didChangeBundleID:", self, v9);

          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[MRUMetadataDataSource artwork](v5, "artwork");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "metadataController:didChangeArtwork:", self, v10);

          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[MRUMetadataDataSource nowPlayingInfo](v5, "nowPlayingInfo");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "metadataController:didChangeNowPlayingInfo:", self, v11);

          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[MRUMetadataDataSource timeControls](v5, "timeControls");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "metadataController:didChangeTimeControls:", self, v12);

          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[MRUMetadataDataSource transportControls](v5, "transportControls");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "metadataController:didChangeTransportControls:", self, v13);

          }
          ++v7;
        }
        while (v16 != v7);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v16);
    }

  }
}

- (NSString)bundleID
{
  void *v2;
  void *v3;

  -[MRUMetadataDataSource bundleID](self->_dataSource, "bundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (MRUArtwork)artwork
{
  return (MRUArtwork *)-[MRUMetadataDataSource artwork](self->_dataSource, "artwork");
}

- (MRUNowPlayingInfo)nowPlayingInfo
{
  return (MRUNowPlayingInfo *)-[MRUMetadataDataSource nowPlayingInfo](self->_dataSource, "nowPlayingInfo");
}

- (MRUTimeControls)timeControls
{
  return (MRUTimeControls *)-[MRUMetadataDataSource timeControls](self->_dataSource, "timeControls");
}

- (MRUTransportControls)transportControls
{
  return (MRUTransportControls *)-[MRUMetadataDataSource transportControls](self->_dataSource, "transportControls");
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)representsLongFormVideoContentWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(2, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__MRUMetadataController_representsLongFormVideoContentWithCompletion___block_invoke;
  v7[3] = &unk_1E5819B40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __70__MRUMetadataController_representsLongFormVideoContentWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v2 = (void *)MEMORY[0x1E0CC2318];
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "bundleIdRepresentsLongFormVideoContent:", v3);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__MRUMetadataController_representsLongFormVideoContentWithCompletion___block_invoke_2;
  v4[3] = &unk_1E581A148;
  v5 = *(id *)(a1 + 40);
  v6 = (char)v2;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __70__MRUMetadataController_representsLongFormVideoContentWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)metadataDataSource:(id)a3 didChangeBundleID:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "metadataController:didChangeBundleID:", self, v5);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)metadataDataSource:(id)a3 didChangeArtwork:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "metadataController:didChangeArtwork:", self, v5);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)metadataDataSource:(id)a3 didChangeNowPlayingInfo:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "metadataController:didChangeNowPlayingInfo:", self, v5);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)metadataDataSource:(id)a3 didChangeTimeControls:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "metadataController:didChangeTimeControls:", self, v5);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)metadataDataSource:(id)a3 didChangeTransportControls:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "metadataController:didChangeTransportControls:", self, v5);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (MRUMetadataDataSource)dataSource
{
  return self->_dataSource;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
