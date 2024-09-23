@implementation _SFDownloadIconCache

- (_SFDownloadIconCache)init
{
  _SFDownloadIconCache *v2;
  uint64_t v3;
  NSPointerArray *observers;
  NSMutableDictionary *v5;
  NSMutableDictionary *thumbnailCache;
  NSMutableDictionary *v7;
  NSMutableDictionary *utiCache;
  NSMutableSet *v9;
  NSMutableSet *activeRequestIdentifiers;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_SFDownloadIconCache;
  v2 = -[_SFDownloadIconCache init](&v12, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v3 = objc_claimAutoreleasedReturnValue();
  observers = v2->_observers;
  v2->_observers = (NSPointerArray *)v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  thumbnailCache = v2->_thumbnailCache;
  v2->_thumbnailCache = v5;

  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  utiCache = v2->_utiCache;
  v2->_utiCache = v7;

  v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  activeRequestIdentifiers = v2->_activeRequestIdentifiers;
  v2->_activeRequestIdentifiers = v9;

  return v2;
}

- (void)addCacheObserver:(id)a3
{
  -[NSPointerArray addPointer:](self->_observers, "addPointer:", a3);
}

- (void)removeCacheObserver:(id)a3
{
  id v4;
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_observers;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10) == v4)
        {

          if ((v8 ^ 0x7FFFFFFFFFFFFFFFLL) != v10)
            -[NSPointerArray removePointerAtIndex:](self->_observers, "removePointerAtIndex:", v8 + v10, (_QWORD)v12);
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }

LABEL_12:
}

- (id)iconForSource:(id)a3
{
  id v4;
  NSMutableDictionary *thumbnailCache;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  thumbnailCache = self->_thumbnailCache;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](thumbnailCache, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[_SFDownloadIconCache _startThumbnailRequestForSource:reportGenericIcons:](self, "_startThumbnailRequestForSource:reportGenericIcons:", v4, 0);
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
LABEL_5:
    objc_msgSend(v4, "uti");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDownloadIconCache _genericIconForUTI:](self, "_genericIconForUTI:", v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v9 = v7;
LABEL_6:

  return v9;
}

- (void)regenerateIconForSource:(id)a3
{
  -[_SFDownloadIconCache _startThumbnailRequestForSource:reportGenericIcons:](self, "_startThumbnailRequestForSource:reportGenericIcons:", a3, 1);
}

- (id)_genericIconForUTI:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  v5 = (id)*MEMORY[0x1E0CA5B20];
  v6 = v5;
  if (!v4)
    v4 = v5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_utiCache, "objectForKeyedSubscript:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[_SFDownloadIconCache _lookupGenericIconForType:](self, "_lookupGenericIconForType:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v7 = v8;
    }
    else
    {
      -[_SFDownloadIconCache _lookupGenericIconForType:](self, "_lookupGenericIconForType:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        v12 = v10;
      else
        v12 = (id)objc_opt_new();
      v7 = v12;

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_utiCache, "setObject:forKeyedSubscript:", v7, v4);
  }
  v13 = v7;

  return v13;
}

- (void)_startThumbnailRequestForSource:(id)a3 reportGenericIcons:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id from;
  id location;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](self->_activeRequestIdentifiers, "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(v6, "completedFileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_initWeak(&location, self);
      -[NSMutableSet addObject:](self->_activeRequestIdentifiers, "addObject:", v7);
      objc_initWeak(&from, v6);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __75___SFDownloadIconCache__startThumbnailRequestForSource_reportGenericIcons___block_invoke;
      v9[3] = &unk_1E4AC7448;
      v9[4] = self;
      v10 = v8;
      objc_copyWeak(&v11, &location);
      objc_copyWeak(&v12, &from);
      objc_msgSend(v10, "safari_accessingSecurityScopedResource:", v9);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v11);

      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else if (v4)
    {
      -[_SFDownloadIconCache _didGenerateThumbnail:forSource:](self, "_didGenerateThumbnail:forSource:", 0, v6);
    }

  }
}

- (void)_didGenerateThumbnail:(id)a3 forSource:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *activeRequestIdentifiers;
  void *v9;
  void *v10;
  NSMutableDictionary *thumbnailCache;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  activeRequestIdentifiers = self->_activeRequestIdentifiers;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](activeRequestIdentifiers, "removeObject:", v9);

  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  thumbnailCache = self->_thumbnailCache;
  objc_msgSend(v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](thumbnailCache, "setObject:forKeyedSubscript:", v10, v12);

  if (v6)
  {
    v13 = v6;
  }
  else
  {

    objc_msgSend(v7, "uti");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDownloadIconCache _genericIconForUTI:](self, "_genericIconForUTI:", v14);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSPointerArray allObjects](self->_observers, "allObjects", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "downloadIconCache:didGenerateNewIcon:forSource:", self, v13, v7);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v17);
  }

}

- (void)_generateThumbnailForURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CD32C8];
  v7 = a3;
  v8 = [v6 alloc];
  _SFScreenScale();
  v10 = (void *)objc_msgSend(v8, "initWithFileAtURL:size:scale:representationTypes:", v7, 4, 48.0, 48.0, v9);

  objc_msgSend(v10, "setIconMode:", 1);
  objc_msgSend(MEMORY[0x1E0CD32D0], "sharedGenerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67___SFDownloadIconCache__generateThumbnailForURL_completionHandler___block_invoke;
  v13[3] = &unk_1E4AC7470;
  v14 = v5;
  v12 = v5;
  objc_msgSend(v11, "generateRepresentationsForRequest:updateHandler:", v10, v13);

}

- (id)_lookupGenericIconForType:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CA58C8], "documentProxyForName:type:MIMEType:", 0, a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", v3, 13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_utiCache, 0);
  objc_storeStrong((id *)&self->_thumbnailCache, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
