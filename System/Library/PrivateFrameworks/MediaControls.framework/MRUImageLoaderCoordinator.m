@implementation MRUImageLoaderCoordinator

+ (id)sharedCoordinator
{
  if (sharedCoordinator_onceToken != -1)
    dispatch_once(&sharedCoordinator_onceToken, &__block_literal_global_13);
  return (id)sharedCoordinator___shared;
}

void __46__MRUImageLoaderCoordinator_sharedCoordinator__block_invoke()
{
  MRUImageLoaderCoordinator *v0;
  void *v1;

  v0 = objc_alloc_init(MRUImageLoaderCoordinator);
  v1 = (void *)sharedCoordinator___shared;
  sharedCoordinator___shared = (uint64_t)v0;

}

- (MRUImageLoaderCoordinator)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRUImageLoaderCoordinator;
  v2 = -[MRUImageLoaderCoordinator init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    *(_OWORD *)(v2 + 24) = *MEMORY[0x1E0C9D820];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v5;

  }
  return (MRUImageLoaderCoordinator *)v2;
}

- (void)registerLoader:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MRUImageLoaderCoordinator loaders](self, "loaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[MRUImageLoaderCoordinator recalculateRequestSize](self, "recalculateRequestSize");
  -[MRUImageLoaderCoordinator recalculateArtworkIdentifiers](self, "recalculateArtworkIdentifiers");
}

- (void)unregisterLoader:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MRUImageLoaderCoordinator loaders](self, "loaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[MRUImageLoaderCoordinator recalculateRequestSize](self, "recalculateRequestSize");
  -[MRUImageLoaderCoordinator recalculateArtworkIdentifiers](self, "recalculateArtworkIdentifiers");
}

- (void)recalculateArtworkIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[MRUImageLoaderCoordinator loaders](self, "loaders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "lastVendedArtworkIdentifier", (_QWORD)v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "lastVendedArtworkIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v8);
  }

  -[MRUImageLoaderCoordinator registeredLoaderArtworkIdentifiers](self, "registeredLoaderArtworkIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v5, "isEqualToSet:", v15);

  if ((v16 & 1) == 0)
  {
    -[MRUImageLoaderCoordinator setRegisteredLoaderArtworkIdentifiers:](self, "setRegisteredLoaderArtworkIdentifiers:", v5);
    objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "verboseImageLoadingLogging");

    if (v18)
    {
      MCLogCategoryImageLoading();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        -[MRUImageLoaderCoordinator registeredLoaderArtworkIdentifiers](self, "registeredLoaderArtworkIdentifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v20;
        _os_log_impl(&dword_1AA991000, v19, OS_LOG_TYPE_DEFAULT, "[MRUImageLoaderCoordinator] [MRUImageLoaderCoordinator] artwork identifiers changed: %@.", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", (_QWORD)v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "postNotificationName:object:", CFSTR("MRUImageLoaderCoordinatorArtworkIdentifiersDidChangeNotification"), 0);

  }
}

- (void)recalculateRequestSize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;
  CGSize v28;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[MRUImageLoaderCoordinator loaders](self, "loaders", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "scaledFittingSize");
        if (v10 < (double)v6)
          v10 = (double)v6;
        v6 = (uint64_t)v10;
        v12 = (double)v7;
        if (v11 >= (double)v7)
          v12 = v11;
        v7 = (uint64_t)v12;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v5);
    v13 = (double)v6;
    v14 = (double)v7;
  }
  else
  {
    v13 = 0.0;
    v14 = 0.0;
  }

  -[MRUImageLoaderCoordinator requestSize](self, "requestSize");
  if (v16 != v13 || v15 != v14)
  {
    MCLogCategoryImageLoading();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v28.width = v13;
      v28.height = v14;
      NSStringFromCGSize(v28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_impl(&dword_1AA991000, v18, OS_LOG_TYPE_DEFAULT, "[MRUImageLoaderCoordinator] [MRUImageLoaderCoordinator] coordinated size changed to %@.", buf, 0xCu);

    }
    -[MRUImageLoaderCoordinator setRequestSize:](self, "setRequestSize:", v13, v14);
  }
}

- (CGSize)requestSize
{
  double width;
  double height;
  CGSize result;

  width = self->_requestSize.width;
  height = self->_requestSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setRequestSize:(CGSize)a3
{
  self->_requestSize = a3;
}

- (NSSet)registeredLoaderArtworkIdentifiers
{
  return self->_registeredLoaderArtworkIdentifiers;
}

- (void)setRegisteredLoaderArtworkIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_registeredLoaderArtworkIdentifiers, a3);
}

- (NSHashTable)loaders
{
  return self->_loaders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loaders, 0);
  objc_storeStrong((id *)&self->_registeredLoaderArtworkIdentifiers, 0);
}

@end
