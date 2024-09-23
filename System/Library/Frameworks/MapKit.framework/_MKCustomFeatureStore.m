@implementation _MKCustomFeatureStore

- (unsigned)sceneState
{
  return self->_sceneState;
}

- (unsigned)sceneID
{
  return self->_sceneID;
}

- (BOOL)isClusteringEnabled
{
  return self->_isClusteringEnabled;
}

- (id)annotationsInMapRect:(id)a3
{
  void *v3;
  void *v4;

  -[MKQuadTrie itemsInMapRect:](self->_annotationsTrie, "itemsInMapRect:", a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (_MKCustomFeatureStore)init
{
  return -[_MKCustomFeatureStore initWithClustering:](self, "initWithClustering:", 0);
}

- (_MKCustomFeatureStore)initWithClustering:(BOOL)a3
{
  _MKCustomFeatureStore *v4;
  _MKCustomFeatureStore *v5;
  MKQuadTrie *v6;
  MKQuadTrie *annotationsTrie;
  NSMutableSet *v8;
  NSMutableSet *globalAnnotations;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_MKCustomFeatureStore;
  v4 = -[_MKCustomFeatureStore init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_sceneID = 256;
    v4->_isClusteringEnabled = a3;
    v6 = -[MKQuadTrie initWithInitialRegion:minimumSize:maximumItems:]([MKQuadTrie alloc], "initWithInitialRegion:minimumSize:maximumItems:", 100, 0.0, 0.0, 268435456.0, 268435456.0, 1024.0, 1024.0);
    annotationsTrie = v5->_annotationsTrie;
    v5->_annotationsTrie = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    globalAnnotations = v5->_globalAnnotations;
    v5->_globalAnnotations = v8;

  }
  return v5;
}

- (void)addAnnotations:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  char *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD *v45;
  _QWORD *v46;
  unint64_t v47;
  id v48;
  id v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v48 = 0;
  v49 = 0;
  v34 = a3;
  PartitionAnnotations(v34, &v49, &v48);
  v4 = v49;
  v35 = v48;
  v36 = v4;
  if (objc_msgSend(v4, "count"))
  {
    v45 = 0;
    v46 = 0;
    v47 = 0;
    std::vector<GEOPosition2d>::reserve((void **)&v45, objc_msgSend(v34, "count"));
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v42 != v7)
            objc_enumerationMutation(v5);
          v9 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v9, "coordinate");
          if (v11 >= -180.0
            && v11 <= 180.0
            && v10 >= -90.0
            && v10 <= 90.0
            && !-[MKQuadTrie contains:](self->_annotationsTrie, "contains:", v9))
          {
            objc_msgSend(v9, "feature");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setDataSource:", self);

            objc_msgSend(v9, "coordinate");
            GEOMapPointForCoordinate();
            v15 = v13;
            v16 = v14;
            v17 = v46;
            if ((unint64_t)v46 >= v47)
            {
              v19 = v45;
              v20 = ((char *)v46 - (char *)v45) >> 4;
              v21 = v20 + 1;
              if ((unint64_t)(v20 + 1) >> 60)
                std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
              v22 = v47 - (_QWORD)v45;
              if ((uint64_t)(v47 - (_QWORD)v45) >> 3 > v21)
                v21 = v22 >> 3;
              if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0)
                v23 = 0xFFFFFFFFFFFFFFFLL;
              else
                v23 = v21;
              if (v23)
                v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CLLocationCoordinate2D>>(v23);
              else
                v24 = 0;
              v25 = (_QWORD *)(v23 + 16 * v20);
              *v25 = v15;
              v25[1] = v16;
              v26 = (char *)v25;
              if (v17 != v19)
              {
                do
                {
                  *((_OWORD *)v26 - 1) = *((_OWORD *)v17 - 1);
                  v26 -= 16;
                  v17 -= 2;
                }
                while (v17 != v19);
                v17 = v45;
              }
              v18 = v25 + 2;
              v45 = v26;
              v47 = v23 + 16 * v24;
              if (v17)
                operator delete(v17);
            }
            else
            {
              *v46 = v13;
              v17[1] = v14;
              v18 = v17 + 2;
            }
            v46 = v18;
            -[MKQuadTrie insert:](self->_annotationsTrie, "insert:", v9);
          }

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      }
      while (v6);
    }

    v27 = v45;
    if (v45 != v46)
    {
      GEOMapRectBoundingMapPoints();
      -[_MKCustomFeatureStore _invalidateRect:](self, "_invalidateRect:");
    }
    if (v27)
      operator delete(v27);
  }
  if (objc_msgSend(v35, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v28 = v35;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v38 != v30)
            objc_enumerationMutation(v28);
          v32 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * j);
          objc_msgSend(v32, "feature");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setDataSource:", self);

          -[NSMutableSet addObject:](self->_globalAnnotations, "addObject:", v32);
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      }
      while (v29);
    }

    -[_MKCustomFeatureStore _invalidateGlobalAnnotations](self, "_invalidateGlobalAnnotations");
  }

}

- (void)_invalidateRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_observers;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "dataSource:featuresDidChangeForRect:", self, v6, v5, var0, var1, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
    v4 = v8;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_annotationLocale, 0);
  objc_storeStrong((id *)&self->_annotationText, 0);
  objc_storeStrong((id *)&self->_clusterStyleAttributes, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_globalAnnotations, 0);
  objc_storeStrong((id *)&self->_annotationsTrie, 0);
}

- (void)showScene
{
  -[_MKCustomFeatureStore _setSceneState:](self, "_setSceneState:", 1);
}

- (void)hideScene
{
  -[_MKCustomFeatureStore _setSceneState:](self, "_setSceneState:", 0);
}

- (void)setClusterAnnotationText:(id)a3 locale:(id)a4
{
  id v6;
  NSString *v7;
  NSString *annotationText;
  NSString *v9;
  NSString *annotationLocale;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (NSString *)objc_msgSend(v11, "copy");
  annotationText = self->_annotationText;
  self->_annotationText = v7;

  v9 = (NSString *)objc_msgSend(v6, "copy");
  annotationLocale = self->_annotationLocale;
  self->_annotationLocale = v9;

}

- (void)setAnnotations:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSMutableSet *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;

  v23 = 0;
  v24 = 0;
  v22 = a3;
  PartitionAnnotations(v22, &v24, &v23);
  v4 = v24;
  v5 = v23;
  if (objc_msgSend(v4, "count"))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    -[MKQuadTrie allItems](self->_annotationsTrie, "allItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minusSet:", v8);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "minusSet:", v9);
    if (objc_msgSend(v11, "count"))
    {
      v12 = objc_msgSend(v11, "count");
      if (v12 == objc_msgSend(v8, "count"))
      {
        -[_MKCustomFeatureStore _clearTileAnnotations](self, "_clearTileAnnotations");
      }
      else
      {
        objc_msgSend(v11, "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MKCustomFeatureStore removeAnnotations:](self, "removeAnnotations:", v13);

      }
    }
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKCustomFeatureStore addAnnotations:](self, "addAnnotations:", v14);

    }
  }
  else
  {
    -[_MKCustomFeatureStore _clearTileAnnotations](self, "_clearTileAnnotations");
  }
  if (objc_msgSend(v5, "count"))
  {
    v15 = self->_globalAnnotations;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "minusSet:", v15);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "minusSet:", v16);
    if (objc_msgSend(v18, "count"))
    {
      v19 = objc_msgSend(v18, "count");
      if (v19 == -[NSMutableSet count](v15, "count"))
      {
        -[_MKCustomFeatureStore _clearGlobalAnnotations](self, "_clearGlobalAnnotations");
      }
      else
      {
        objc_msgSend(v18, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MKCustomFeatureStore removeAnnotations:](self, "removeAnnotations:", v20);

      }
    }
    if (objc_msgSend(v17, "count"))
    {
      objc_msgSend(v17, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKCustomFeatureStore addAnnotations:](self, "addAnnotations:", v21);

    }
  }
  else
  {
    -[_MKCustomFeatureStore _clearGlobalAnnotations](self, "_clearGlobalAnnotations");
  }

}

- (void)removeAnnotations:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  char *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD *v45;
  _QWORD *v46;
  unint64_t v47;
  id v48;
  id v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v48 = 0;
  v49 = 0;
  v34 = a3;
  PartitionAnnotations(v34, &v49, &v48);
  v4 = v49;
  v35 = v48;
  v36 = v4;
  if (objc_msgSend(v4, "count"))
  {
    v45 = 0;
    v46 = 0;
    v47 = 0;
    std::vector<GEOPosition2d>::reserve((void **)&v45, objc_msgSend(v4, "count"));
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v42 != v7)
            objc_enumerationMutation(v5);
          v9 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v9, "coordinate");
          if (v11 >= -180.0
            && v11 <= 180.0
            && v10 >= -90.0
            && v10 <= 90.0
            && -[MKQuadTrie contains:](self->_annotationsTrie, "contains:", v9))
          {
            objc_msgSend(v9, "feature");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setDataSource:", 0);

            objc_msgSend(v9, "coordinate");
            GEOMapPointForCoordinate();
            v15 = v13;
            v16 = v14;
            v17 = v46;
            if ((unint64_t)v46 >= v47)
            {
              v19 = v45;
              v20 = ((char *)v46 - (char *)v45) >> 4;
              v21 = v20 + 1;
              if ((unint64_t)(v20 + 1) >> 60)
                std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
              v22 = v47 - (_QWORD)v45;
              if ((uint64_t)(v47 - (_QWORD)v45) >> 3 > v21)
                v21 = v22 >> 3;
              if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0)
                v23 = 0xFFFFFFFFFFFFFFFLL;
              else
                v23 = v21;
              if (v23)
                v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CLLocationCoordinate2D>>(v23);
              else
                v24 = 0;
              v25 = (_QWORD *)(v23 + 16 * v20);
              *v25 = v15;
              v25[1] = v16;
              v26 = (char *)v25;
              if (v17 != v19)
              {
                do
                {
                  *((_OWORD *)v26 - 1) = *((_OWORD *)v17 - 1);
                  v26 -= 16;
                  v17 -= 2;
                }
                while (v17 != v19);
                v17 = v45;
              }
              v18 = v25 + 2;
              v45 = v26;
              v47 = v23 + 16 * v24;
              if (v17)
                operator delete(v17);
            }
            else
            {
              *v46 = v13;
              v17[1] = v14;
              v18 = v17 + 2;
            }
            v46 = v18;
            -[MKQuadTrie remove:](self->_annotationsTrie, "remove:", v9);
          }

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      }
      while (v6);
    }

    v27 = v45;
    if (v45 != v46)
    {
      GEOMapRectBoundingMapPoints();
      -[_MKCustomFeatureStore _invalidateRect:](self, "_invalidateRect:");
    }
    if (v27)
      operator delete(v27);
  }
  if (objc_msgSend(v35, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v28 = v35;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v38 != v30)
            objc_enumerationMutation(v28);
          v32 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * j);
          objc_msgSend(v32, "feature");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setDataSource:", 0);

          -[NSMutableSet removeObject:](self->_globalAnnotations, "removeObject:", v32);
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      }
      while (v29);
    }

    -[_MKCustomFeatureStore _invalidateGlobalAnnotations](self, "_invalidateGlobalAnnotations");
  }

}

- (void)_clearTileAnnotations
{
  MKQuadTrie *annotationsTrie;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  __n128 (*v8)(__n128 *, __n128 *);
  void (*v9)(uint64_t);
  const char *v10;
  void *__p;
  void *v12;
  uint64_t v13;

  v5 = 0;
  v6 = &v5;
  v7 = 0x4812000000;
  v8 = __Block_byref_object_copy__22;
  v9 = __Block_byref_object_dispose__22;
  v10 = "";
  __p = 0;
  v12 = 0;
  v13 = 0;
  annotationsTrie = self->_annotationsTrie;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46___MKCustomFeatureStore__clearTileAnnotations__block_invoke;
  v4[3] = &unk_1E20DF2F8;
  v4[4] = &v5;
  -[MKQuadTrie clearAllItemsPerforming:](annotationsTrie, "clearAllItemsPerforming:", v4);
  if (v6[6] != v6[7])
  {
    GEOMapRectBoundingMapPoints();
    -[_MKCustomFeatureStore _invalidateRect:](self, "_invalidateRect:");
  }
  _Block_object_dispose(&v5, 8);
  if (__p)
  {
    v12 = __p;
    operator delete(__p);
  }
}

- (void)_clearGlobalAnnotations
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_globalAnnotations, "count"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = self->_globalAnnotations;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "feature", (_QWORD)v8);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setDataSource:", 0);

          ++v6;
        }
        while (v4 != v6);
        v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

    -[NSMutableSet removeAllObjects](self->_globalAnnotations, "removeAllObjects");
    -[_MKCustomFeatureStore _invalidateGlobalAnnotations](self, "_invalidateGlobalAnnotations");
  }
}

- (unint64_t)annotationCount
{
  unint64_t v3;

  v3 = -[MKQuadTrie count](self->_annotationsTrie, "count");
  return -[NSMutableSet count](self->_globalAnnotations, "count") + v3;
}

- (id)allAnnotations
{
  void *v3;
  void *v4;
  void *v5;

  -[MKQuadTrie allItems](self->_annotationsTrie, "allItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet allObjects](self->_globalAnnotations, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_invalidateGlobalAnnotations
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_observers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "globalFeaturesDidChangeForDataSource:", self, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_setSceneState:(unsigned __int8)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_sceneState != a3)
  {
    self->_sceneState = a3;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = self->_observers;
    v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "dataSource:didChangeSceneState:", self, self->_sceneState, (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)setSceneID:(unsigned __int8)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_sceneID != a3)
  {
    self->_sceneID = a3;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = self->_observers;
    v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "dataSource:didChangeSceneID:", self, self->_sceneID, (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (id)globalAnnotations
{
  return (id)-[NSMutableSet allObjects](self->_globalAnnotations, "allObjects");
}

- (void)getClusterImageTextForClusterFeatureCount:(unint64_t)a3 text:(id *)a4 locale:(id *)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocale:", v7);

  objc_msgSend(v9, "setNumberStyle:", 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromNumber:", v8);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

}

- (void)getClusterAnnotationTextForClusterFeatureCount:(unint64_t)a3 text:(id *)a4 locale:(id *)a5
{
  NSString *v9;
  NSString *v10;
  id WeakRetained;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;

  v9 = self->_annotationText;
  v10 = self->_annotationLocale;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = v10;
  v15 = v9;
  objc_msgSend(WeakRetained, "customFeatureStore:annotationTextForClusterFeatureCount:text:locale:", self, a3, &v15, &v14);
  v12 = v15;

  v13 = v14;
  if (a4)
    *a4 = objc_retainAutorelease(v12);
  if (a5)
    *a5 = objc_retainAutorelease(v13);

}

- (GEOFeatureStyleAttributes)clusterStyleAttributes
{
  return self->_clusterStyleAttributes;
}

- (void)setClusterStyleAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MKCustomFeatureStoreDelegate)delegate
{
  return (MKCustomFeatureStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

@end
