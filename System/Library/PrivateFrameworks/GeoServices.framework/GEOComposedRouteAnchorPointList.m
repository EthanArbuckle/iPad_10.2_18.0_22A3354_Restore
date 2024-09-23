@implementation GEOComposedRouteAnchorPointList

- (GEOComposedRouteAnchorPointList)init
{
  GEOComposedRouteAnchorPointList *v2;
  uint64_t v3;
  geo_isolater *anchorPointsIsolater;
  uint64_t v5;
  NSMutableArray *elements;
  GEOComposedRouteAnchorPointList *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOComposedRouteAnchorPointList;
  v2 = -[GEOComposedRouteAnchorPointList init](&v9, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    anchorPointsIsolater = v2->_anchorPointsIsolater;
    v2->_anchorPointsIsolater = (geo_isolater *)v3;

    v5 = objc_opt_new();
    elements = v2->_elements;
    v2->_elements = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (GEOComposedRouteAnchorPointList)initWithAnchorPoints:(id)a3
{
  id v4;
  GEOComposedRouteAnchorPointList *v5;
  GEOComposedRouteAnchorPointList *v6;
  GEOComposedRouteAnchorPointList *v7;

  v4 = a3;
  v5 = -[GEOComposedRouteAnchorPointList init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[GEOComposedRouteAnchorPointList appendAnchorPoints:](v5, "appendAnchorPoints:", v4);
    v7 = v6;
  }

  return v6;
}

+ (GEOComposedRouteAnchorPointList)listWithAnchorPoints:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAnchorPoints:", v4);

  return (GEOComposedRouteAnchorPointList *)v5;
}

- (NSArray)anchorPoints
{
  return (NSArray *)-[NSMutableArray _geo_map:](self->_elements, "_geo_map:", &__block_literal_global_77);
}

id __47__GEOComposedRouteAnchorPointList_anchorPoints__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return *(id *)(a2 + 8);
  else
    return 0;
}

- (BOOL)startAndEndAreTheSame
{
  void *v3;
  void *v4;
  char v5;
  geo_isolater *v7;

  v7 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  if (-[NSMutableArray count](self->_elements, "count"))
  {
    if ((unint64_t)-[NSMutableArray count](self->_elements, "count") < 2)
    {
      v5 = 1;
    }
    else
    {
      -[NSMutableArray firstObject](self->_elements, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray lastObject](self->_elements, "lastObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "isInConjunctionWith:", v4);

    }
  }
  else
  {
    v5 = 0;
  }
  _geo_isolate_unlock();

  return v5;
}

- (BOOL)isOutAndBackAllowed
{
  BOOL v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  geo_isolater *v9;

  v9 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  if ((unint64_t)-[NSMutableArray count](self->_elements, "count") >= 2)
  {
    -[NSMutableArray lastObject](self->_elements, "lastObject");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = *(void **)(v4 + 24);
    else
      v6 = 0;
    v7 = v6;
    v3 = (unint64_t)objc_msgSend(v7, "count") < 2;

  }
  else
  {
    v3 = 0;
  }
  _geo_isolate_unlock();

  return v3;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_elements, "count");
}

- (GEOComposedRouteAnchorPoint)firstObject
{
  _QWORD *v2;
  void *v3;
  GEOComposedRouteAnchorPoint *v4;

  -[NSMutableArray firstObject](self->_elements, "firstObject");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v2 = (_QWORD *)v2[1];
  v4 = v2;

  return v4;
}

- (GEOComposedRouteAnchorPoint)lastObject
{
  _QWORD *v2;
  void *v3;
  GEOComposedRouteAnchorPoint *v4;

  -[NSMutableArray lastObject](self->_elements, "lastObject");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v2 = (_QWORD *)v2[1];
  v4 = v2;

  return v4;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->_elements, "objectAtIndexedSubscript:", a3);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v3 = (_QWORD *)v3[1];
  v5 = v3;

  return v5;
}

- (unint64_t)nextAnchorPointIndexAfter:(id)a3
{
  float var1;
  unsigned int var0;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;

  var1 = a3.var1;
  if (a3.var1 < 0.0)
    return 0x7FFFFFFFFFFFFFFFLL;
  var0 = a3.var0;
  if (!-[NSMutableArray count](self->_elements, "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = -[NSMutableArray count](self->_elements, "count") - 1;
  -[NSMutableArray objectAtIndexedSubscript:](self->_elements, "objectAtIndexedSubscript:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = *(void **)(v7 + 8);
  else
    v9 = 0;
  v10 = v9;

  v11 = objc_msgSend(v10, "routeCoordinate");
  if (var0 != (_DWORD)v11)
  {
    if (var0 >= v11)
      goto LABEL_7;
    goto LABEL_9;
  }
  if (var1 < *((float *)&v11 + 1))
  {
LABEL_9:
    if (v6 < 2)
      goto LABEL_24;
    v12 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_elements, "objectAtIndexedSubscript:", (v6 + v12) >> 1);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = *(void **)(v13 + 8);
      else
        v15 = 0;
      v16 = v15;

      v17 = objc_msgSend(v16, "routeCoordinate");
      if (var0 == (_DWORD)v17)
      {
        if (var1 != *((float *)&v17 + 1) && var1 < *((float *)&v17 + 1))
        {
LABEL_20:
          v6 = (v6 + v12) >> 1;
          goto LABEL_21;
        }
      }
      else if (var0 < v17)
      {
        goto LABEL_20;
      }
      v12 = (v6 + v12) >> 1;
LABEL_21:
      if (v12 + 1 >= v6)
        goto LABEL_24;
    }
  }
LABEL_7:
  v6 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_24:

  return v6;
}

- (id)nextAnchorPointAfter:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = -[GEOComposedRouteAnchorPointList nextAnchorPointIndexAfter:](self, "nextAnchorPointIndexAfter:", a3);
  if (v4 >= -[NSMutableArray count](self->_elements, "count"))
  {
    v8 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_elements, "objectAtIndexedSubscript:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = *(void **)(v5 + 8);
    else
      v7 = 0;
    v8 = v7;

  }
  return v8;
}

- (id)anchorPointsAfter:(id)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = -[GEOComposedRouteAnchorPointList nextAnchorPointIndexAfter:](self, "nextAnchorPointIndexAfter:", a3);
  if (v4 >= -[NSMutableArray count](self->_elements, "count"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_elements, "count") - v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    while (v4 < -[NSMutableArray count](self->_elements, "count"))
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_elements, "objectAtIndexedSubscript:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6)
        v8 = *(void **)(v6 + 8);
      else
        v8 = 0;
      v9 = v8;

      objc_msgSend(v5, "addObject:", v9);
      ++v4;
    }
    +[GEOComposedRouteAnchorPointList listWithAnchorPoints:](GEOComposedRouteAnchorPointList, "listWithAnchorPoints:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)appendAnchorPoint:(id)a3
{
  id v4;
  _GEOAnchorPointListElement *v5;
  geo_isolater *v6;

  v4 = a3;
  v6 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  v5 = -[_GEOAnchorPointListElement initWithAnchorPoint:]([_GEOAnchorPointListElement alloc], "initWithAnchorPoint:", v4);
  -[NSMutableArray addObject:](self->_elements, "addObject:", v5);

  _geo_isolate_unlock();
}

- (void)appendAnchorPoints:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  _GEOAnchorPointListElement *v12;
  _GEOAnchorPointListElement *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  geo_isolater *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[GEOComposedRouteAnchorPointList _existingConjunctElementAtAnchorPointPosition:](self, "_existingConjunctElementAtAnchorPointPosition:", v9, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "duplicate");
          v12 = (_GEOAnchorPointListElement *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = -[_GEOAnchorPointListElement initWithAnchorPoint:]([_GEOAnchorPointListElement alloc], "initWithAnchorPoint:", v9);
        }
        v13 = v12;
        -[NSMutableArray addObject:](self->_elements, "addObject:", v12);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v6);
  }

  _geo_isolate_unlock();
}

- (unint64_t)indexOfAnchorPoint:(id)a3
{
  id v4;
  unint64_t v5;
  NSMutableArray *elements;
  _QWORD v8[4];
  id v9;
  geo_isolater *v10;

  v4 = a3;
  v10 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    elements = self->_elements;
    if (elements)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __54__GEOComposedRouteAnchorPointList_indexOfAnchorPoint___block_invoke;
      v8[3] = &unk_1E1C09DE8;
      v9 = v4;
      v5 = -[NSMutableArray indexOfObjectPassingTest:](elements, "indexOfObjectPassingTest:", v8);

    }
  }
  _geo_isolate_unlock();

  return v5;
}

uint64_t __54__GEOComposedRouteAnchorPointList_indexOfAnchorPoint___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  if (a2)
    v2 = *(void **)(a2 + 8);
  else
    v2 = 0;
  return objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 32));
}

- (void)removeAnchorPointAtIndex:(unint64_t)a3
{
  geo_isolater *v5;

  v5 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  -[GEOComposedRouteAnchorPointList _removeElementAtIndex:](self, "_removeElementAtIndex:", a3);
  -[GEOComposedRouteAnchorPointList _eraseSequentialDuplicateAnchors](self, "_eraseSequentialDuplicateAnchors");
  _geo_isolate_unlock();

}

- (void)removeAnchorPointWithID:(id)a3
{
  id v4;
  NSMutableArray *elements;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v11;
  id v12;
  geo_isolater *v13;

  v4 = a3;
  v13 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  elements = self->_elements;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __59__GEOComposedRouteAnchorPointList_removeAnchorPointWithID___block_invoke;
  v11 = &unk_1E1C09DE8;
  v6 = v4;
  v12 = v6;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](elements, "indexOfObjectPassingTest:", &v8);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[GEOComposedRouteAnchorPointList _removeElementAtIndex:](self, "_removeElementAtIndex:", v7, v8, v9, v10, v11);
    -[GEOComposedRouteAnchorPointList _eraseSequentialDuplicateAnchors](self, "_eraseSequentialDuplicateAnchors");
  }

  _geo_isolate_unlock();
}

uint64_t __59__GEOComposedRouteAnchorPointList_removeAnchorPointWithID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  if (a2)
    v6 = *(void **)(a2 + 8);
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v7, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v9)
    *a4 = 1;
  return v9;
}

- (void)removeFirstAnchorSharingPositionWith:(id)a3
{
  -[GEOComposedRouteAnchorPointList _removeFirstAnchorSharingPositionWith:enumerationOptions:](self, "_removeFirstAnchorSharingPositionWith:enumerationOptions:", a3, 0);
}

- (void)removeLastAnchorSharingPositionWith:(id)a3
{
  -[GEOComposedRouteAnchorPointList _removeFirstAnchorSharingPositionWith:enumerationOptions:](self, "_removeFirstAnchorSharingPositionWith:enumerationOptions:", a3, 2);
}

- (void)reverse
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *elements;
  geo_isolater *v8;

  v8 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  -[GEOComposedRouteAnchorPointList _elementsCopy](self, "_elementsCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSMutableArray *)objc_msgSend(v5, "mutableCopy");

  elements = self->_elements;
  self->_elements = v6;

  _geo_isolate_unlock();
}

- (void)createOutAndBack
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  geo_isolater *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  if ((unint64_t)-[NSMutableArray count](self->_elements, "count") > 1)
  {
    v4 = -[NSMutableArray count](self->_elements, "count");
    -[NSMutableArray reverseObjectEnumerator](self->_elements, "reverseObjectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subarrayWithRange:", 1, v4 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v3 = v7;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v24;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v10), "duplicate", (_QWORD)v23);
          v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](self->_elements, "addObject:", v11);
          if (v11)
            v12 = (void *)v11[3];
          else
            v12 = 0;
          v13 = v12;
          v14 = (unint64_t)objc_msgSend(v13, "count") < 3;

          if (!v14)
          {
            if (v11)
              v16 = (void *)v11[1];
            else
              v16 = 0;
            v17 = v16;
            objc_msgSend(v17, "locationCoordinate");
            v19 = v18;
            v21 = v20;

            GEOGetGEOComposedRouteAnchorPointListLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218240;
              v29 = v19;
              v30 = 2048;
              v31 = v21;
              _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_INFO, "End of a previous loop or outAndBack was found at %f, %f. Stopping outAndBack here.", buf, 0x16u);
            }

            goto LABEL_22;
          }

          ++v10;
        }
        while (v8 != v10);
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        v8 = v15;
        if (v15)
          continue;
        break;
      }
    }
LABEL_22:

  }
  else
  {
    GEOGetGEOComposedRouteAnchorPointListLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "Must have at least two anchor points to create out and back route.", buf, 2u);
    }
  }

  _geo_isolate_unlock();
}

- (void)closeLoop
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[8];
  geo_isolater *v7;

  v7 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  if ((unint64_t)-[NSMutableArray count](self->_elements, "count") > 1)
  {
    -[NSMutableArray firstObject](self->_elements, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "duplicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_elements, "addObject:", v5);

  }
  else
  {
    GEOGetGEOComposedRouteAnchorPointListLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "Must have at least two anchor points to close loop.", v6, 2u);
    }

  }
  _geo_isolate_unlock();

}

- (id)_existingConjunctElementAtAnchorPointPosition:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSMutableArray *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "locationCoordinate");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = self->_elements;
  v11 = (_QWORD *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v13);
        if (v14)
          v15 = (void *)v14[1];
        else
          v15 = 0;
        objc_msgSend(v15, "locationCoordinate", (_QWORD)v21);
        if (vabdd_f64(v5, v18) < 0.00000000999999994
          && vabdd_f64(v7, v16) < 0.00000000999999994
          && vabdd_f64(v9, v17) < 0.00000000999999994)
        {
          v11 = v14;
          goto LABEL_17;
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v11 = (_QWORD *)v19;
    }
    while (v19);
  }
LABEL_17:

  return v11;
}

- (void)_removeElementAtIndex:(unint64_t)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;

  if (-[NSMutableArray count](self->_elements, "count") > a3)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_elements, "objectAtIndexedSubscript:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    v8 = (_QWORD *)v5;
    if (v5)
    {
      v6 = *(id *)(v5 + 24);
      v7 = v8[2];
    }
    else
    {
      v6 = 0;
      v7 = 0;
    }
    objc_msgSend(v6, "removeObject:", v7);

    -[NSMutableArray removeObjectAtIndex:](self->_elements, "removeObjectAtIndex:", a3);
  }
}

- (void)_removeFirstAnchorSharingPositionWith:(id)a3 enumerationOptions:(unint64_t)a4
{
  id v6;
  NSMutableArray *elements;
  uint64_t v8;
  id v9;
  unint64_t v10;
  void *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  geo_isolater *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  elements = self->_elements;
  v8 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __92__GEOComposedRouteAnchorPointList__removeFirstAnchorSharingPositionWith_enumerationOptions___block_invoke;
  v23[3] = &unk_1E1C09DE8;
  v9 = v6;
  v24 = v9;
  v10 = -[NSMutableArray indexOfObjectWithOptions:passingTest:](elements, "indexOfObjectWithOptions:passingTest:", 0, v23);
  if (v10 >= -[NSMutableArray count](self->_elements, "count"))
  {
    v11 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_elements, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = self->_elements;
  v17 = v8;
  v18 = 3221225472;
  v19 = __92__GEOComposedRouteAnchorPointList__removeFirstAnchorSharingPositionWith_enumerationOptions___block_invoke_2;
  v20 = &unk_1E1C09E10;
  v13 = v9;
  v21 = v13;
  v14 = v11;
  v22 = v14;
  v15 = -[NSMutableArray indexOfObjectWithOptions:passingTest:](v12, "indexOfObjectWithOptions:passingTest:", a4, &v17);
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    GEOGetGEOComposedRouteAnchorPointListLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v13;
      _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "Could not find matching anchor point for removal: %@", buf, 0xCu);
    }

  }
  else
  {
    -[GEOComposedRouteAnchorPointList _removeElementAtIndex:](self, "_removeElementAtIndex:", v15, v17, v18, v19, v20, v21);
    -[GEOComposedRouteAnchorPointList _eraseSequentialDuplicateAnchors](self, "_eraseSequentialDuplicateAnchors");
  }

  _geo_isolate_unlock();
}

uint64_t __92__GEOComposedRouteAnchorPointList__removeFirstAnchorSharingPositionWith_enumerationOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (a2)
    v3 = *(void **)(a2 + 8);
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqual:", v6);
  return v7;
}

uint64_t __92__GEOComposedRouteAnchorPointList__removeFirstAnchorSharingPositionWith_enumerationOptions___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v4 = v3;
  if (v3)
    v5 = (void *)v3[1];
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "isEqual:", v8);
  if ((v6 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    if (v4)
      v10 = (void *)v4[3];
    else
      v10 = 0;
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      v12 = *(_QWORD *)(v11 + 16);
    else
      v12 = 0;
    v13 = v10;
    v9 = objc_msgSend(v13, "containsObject:", v12);

  }
  return v9;
}

- (void)_eraseSequentialDuplicateAnchors
{
  void *v3;
  unint64_t i;
  uint64_t v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;

  if ((unint64_t)-[NSMutableArray count](self->_elements, "count") >= 2)
  {
    -[NSMutableArray firstObject](self->_elements, "firstObject");
    v22 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)-[NSMutableArray count](self->_elements, "count") >= 2)
    {
      for (i = 1; i < -[NSMutableArray count](self->_elements, "count"); ++i)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_elements, "objectAtIndexedSubscript:", i);
        v5 = objc_claimAutoreleasedReturnValue();
        if (v22)
          v6 = (void *)v22[1];
        else
          v6 = 0;
        v7 = v6;
        objc_msgSend(v7, "locationCoordinate");
        v9 = v8;
        v11 = v10;
        v13 = v12;
        if (v5)
          v14 = *(void **)(v5 + 8);
        else
          v14 = 0;
        objc_msgSend(v14, "locationCoordinate");
        if (vabdd_f64(v9, v17) >= 0.000000999999997 || vabdd_f64(v11, v15) >= 0.000000999999997)
        {

        }
        else
        {
          v18 = vabdd_f64(v13, v16);

          if (v18 < 0.000000999999997)
          {
            if (v5)
            {
              v19 = *(id *)(v5 + 24);
              v20 = *(_QWORD *)(v5 + 16);
            }
            else
            {
              v19 = 0;
              v20 = 0;
            }
            objc_msgSend(v19, "removeObject:", v20);

            objc_msgSend(v3, "addIndex:", i);
            goto LABEL_16;
          }
        }
        v21 = (id)v5;

        v22 = v21;
LABEL_16:

      }
    }
    -[NSMutableArray removeObjectsAtIndexes:](self->_elements, "removeObjectsAtIndexes:", v3);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[GEOComposedRouteAnchorPointList _elementsCopy](self, "_elementsCopy");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (id)_elementsCopy
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_elements, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_elements;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9);
        v11 = (id *)objc_opt_new();
        if (v10)
        {
          v12 = (void *)objc_msgSend(*(id *)(v10 + 8), "copy");
          -[_GEOAnchorPointListElement setAnchorPoint:]((uint64_t)v11, v12);

          v13 = *(void **)(v10 + 16);
          if (!v11)
            goto LABEL_9;
LABEL_8:
          objc_storeStrong(v11 + 2, v13);
          goto LABEL_9;
        }
        v18 = (void *)objc_msgSend(0, "copy", (_QWORD)v21);
        -[_GEOAnchorPointListElement setAnchorPoint:]((uint64_t)v11, v18);

        v13 = 0;
        if (v11)
          goto LABEL_8;
LABEL_9:
        if (v10)
          v14 = *(_QWORD *)(v10 + 24);
        else
          v14 = 0;
        objc_msgSend(v4, "objectForKey:", v14, (_QWORD)v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v16 = objc_alloc(MEMORY[0x1E0C99E20]);
          if (v10)
          {
            v15 = (void *)objc_msgSend(v16, "initWithSet:", *(_QWORD *)(v10 + 24));
            v17 = *(_QWORD *)(v10 + 24);
          }
          else
          {
            v15 = (void *)objc_msgSend(v16, "initWithSet:", 0);
            v17 = 0;
          }
          objc_msgSend(v4, "setObject:forKey:", v15, v17);
        }
        -[_GEOAnchorPointListElement setConjunctElements:]((uint64_t)v11, v15);
        objc_msgSend(v3, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v7 = v19;
    }
    while (v19);
  }

  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  id *v10;
  unint64_t v11;
  _QWORD *v12;
  void *v13;
  geo_isolater *v15;

  v15 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  var0 = a3->var0;
  if (var0 >= -[NSMutableArray count](self->_elements, "count"))
  {
    a5 = 0;
  }
  else
  {
    if (-[NSMutableArray count](self->_elements, "count") - var0 <= a5)
      a5 = -[NSMutableArray count](self->_elements, "count") - var0;
    if (a5)
    {
      v10 = a4;
      v11 = a5;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_elements, "objectAtIndexedSubscript:", var0);
        v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        if (v12)
          v13 = (void *)v12[1];
        else
          v13 = 0;
        *v10++ = v13;

        ++var0;
        --v11;
      }
      while (v11);
    }
    a3->var0 += a5;
    a3->var1 = a4;
    a3->var2 = &self->_mutationsCount;
  }
  _geo_isolate_unlock();

  return a5;
}

- (id)description
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  geo_isolater *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  geo_assert_not_isolated();
  v18 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_elements, "count") + 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p list with %d anchor points:"), self, -[NSMutableArray count](self->_elements, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_elements;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        if (v9)
          v9 = (_QWORD *)v9[1];
        v10 = v9;
        objc_msgSend(v10, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n\t"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _geo_isolate_unlock();
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSMutableArray isEqualToArray:](self->_elements, "isEqualToArray:", v4[1]);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t i;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  geo_isolater *v20;

  v4 = a3;
  v20 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  v5 = self->_elements;
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("elements"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableArray count](self->_elements, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < -[NSMutableArray count](self->_elements, "count"); ++i)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_elements, "objectAtIndexedSubscript:", i);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (_QWORD *)v10;
    if (v10)
      v12 = *(void **)(v10 + 24);
    else
      v12 = 0;
    v13 = v12;
    objc_msgSend(v8, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      if (v11)
        v15 = (void *)v11[3];
      else
        v15 = 0;
      v16 = v15;
      objc_msgSend(v6, "addObject:", v16);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count") - 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v17 = (void *)v11[3];
      else
        v17 = 0;
      v18 = v17;
      objc_msgSend(v8, "setObject:forKey:", v14, v18);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v19);

  }
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("conjunctElements"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("lookup"));

  _geo_isolate_unlock();
}

- (GEOComposedRouteAnchorPointList)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteAnchorPointList *v5;
  uint64_t v6;
  NSMutableArray *elements;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  GEOComposedRouteAnchorPointList *v26;
  void *v28;
  uint8_t buf[16];

  v4 = a3;
  v5 = -[GEOComposedRouteAnchorPointList init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("elements"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v28, "mutableCopy");
    elements = v5->_elements;
    v5->_elements = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableArray count](v5->_elements, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("conjunctElements"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v15, objc_opt_class(), CFSTR("lookup"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSMutableArray count](v5->_elements, "count"))
    {
      v17 = 0;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](v5->_elements, "objectAtIndexedSubscript:", v17);
        v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(v20, "unsignedIntegerValue");
        if (v21 >= objc_msgSend(v14, "count"))
        {
          GEOGetGEOComposedRouteAnchorPointListLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_FAULT, "Error finding conjunct elements when deserializing.", buf, 2u);
          }

          if (v18)
            v24 = v18[2];
          else
            v24 = 0;
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v25 = v22;
        -[_GEOAnchorPointListElement setConjunctElements:]((uint64_t)v18, v22);

        ++v17;
      }
      while (v17 < -[NSMutableArray count](v5->_elements, "count"));
    }
    v26 = v5;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorPointsIsolater, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

- (uint64_t)updateWithRoute:(id *)a1
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t j;
  _QWORD *v14;
  void *v15;
  id v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  GEORouteMatcher *v28;
  GEOLocation *v29;
  GEOLocation *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  _QWORD *v35;
  BOOL v36;
  _QWORD *v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL4 v42;
  const char *v43;
  NSObject *v44;
  uint32_t v45;
  NSObject *v46;
  id obj;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  int v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v52 = a2;
  if (!a1)
  {
    v40 = 0;
    goto LABEL_49;
  }
  v62 = a1[2];
  _geo_isolate_lock_data();
  objc_msgSend(v52, "coordinates");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v49, "pathsCount") == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1[1], "count"));
    v3 = objc_claimAutoreleasedReturnValue();
    v53 = a1;
    objc_msgSend(v49, "supportPointsForPathAtIndex:", 0);
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v59 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v8, "anchorPointID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9 == 0;

          if (!v10)
          {
            objc_msgSend(v8, "anchorPointID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, v11);

          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
      }
      while (v5);
    }

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v53[1];
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    if (v12)
    {
      v51 = *(_QWORD *)v55;
      while (2)
      {
        v50 = v12;
        for (j = 0; j != v50; ++j)
        {
          if (*(_QWORD *)v55 != v51)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD **)(*((_QWORD *)&v54 + 1) + 8 * j);
          if (v14)
            v15 = (void *)v14[1];
          else
            v15 = 0;
          v16 = v15;
          objc_msgSend(v16, "uniqueID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17 == 0;

          if (v18)
          {
            GEOGetGEOComposedRouteAnchorPointListLog();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1885A9000, v46, OS_LOG_TYPE_FAULT, "Anchor points must have a uniqueID.", buf, 2u);
            }

            v40 = 0;
            goto LABEL_43;
          }
          objc_msgSend(v16, "routeCoordinate");
          objc_msgSend(v16, "locationCoordinate");
          objc_msgSend(v16, "uniqueID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            v21 = objc_msgSend(v20, "routeCoordinate");
            objc_msgSend(v49, "coordinateForRouteCoordinate:", v21);
            v24 = v23;
            v26 = v25;
          }
          else
          {
            GEOGetGEOComposedRouteAnchorPointListLog();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_ERROR, "No matching anchor point was found in directions response. Attempting to snap anchor point manually.", buf, 2u);
            }

            v28 = -[GEORouteMatcher initWithRoute:auditToken:]([GEORouteMatcher alloc], "initWithRoute:auditToken:", v52, 0);
            v29 = [GEOLocation alloc];
            objc_msgSend(v16, "locationCoordinate");
            v30 = -[GEOLocation initWithGEOCoordinate:](v29, "initWithGEOCoordinate:");
            -[GEORouteMatcher matchToClosestPointOnRouteWithLocation:](v28, "matchToClosestPointOnRouteWithLocation:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v31, "routeCoordinate");
            objc_msgSend(v31, "locationCoordinate");
            v24 = v32;
            v26 = v33;

            v22 = 1.79769313e308;
          }
          objc_msgSend(v16, "updatedAnchorPointWithLocationCoordinate:routeCoordinate:", v21, v24, v26, v22);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53[1], "firstObject");
          v35 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          v36 = v14 == v35;

          if (v36)
          {
            v39 = 1;
          }
          else
          {
            objc_msgSend(v53[1], "lastObject");
            v37 = (_QWORD *)objc_claimAutoreleasedReturnValue();
            v38 = v14 == v37;

            if (v38)
            {
              v39 = 2;
            }
            else if (objc_msgSend(v53, "_isTurnAroundAnchorPoint:forRoute:", v34, v52))
            {
              v39 = 4;
            }
            else
            {
              v39 = 3;
            }
          }
          objc_msgSend(v34, "setAnchorPointType:", v39);
          objc_msgSend(v14, "updateWithSnappedAnchorPoint:", v34);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
        if (v12)
          continue;
        break;
      }
    }
    v40 = 1;
LABEL_43:

    goto LABEL_48;
  }
  v41 = objc_msgSend(v49, "pathsCount");
  GEOGetGEOComposedRouteAnchorPointListLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v42 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (v41)
  {
    if (v42)
    {
      *(_DWORD *)buf = 67109120;
      v66 = objc_msgSend(v49, "pathsCount");
      v43 = "User created routes only support 1 leg, but %d were found.";
      v44 = v3;
      v45 = 8;
LABEL_46:
      _os_log_impl(&dword_1885A9000, v44, OS_LOG_TYPE_ERROR, v43, buf, v45);
    }
  }
  else if (v42)
  {
    *(_WORD *)buf = 0;
    v43 = "No legs found when trying to set anchor points for user created route.";
    v44 = v3;
    v45 = 2;
    goto LABEL_46;
  }
  v40 = 0;
LABEL_48:

  _geo_isolate_unlock();
LABEL_49:

  return v40;
}

- (BOOL)_isTurnAroundAnchorPoint:(id)a3 forRoute:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;

  v5 = a4;
  v6 = objc_msgSend(a3, "routeCoordinate");
  v7 = objc_msgSend(v5, "routeCoordinateForDistance:beforeRouteCoordinate:", v6, 50.0);
  v8 = objc_msgSend(v5, "routeCoordinateForDistance:afterRouteCoordinate:", v6, 50.0);
  objc_msgSend(v5, "pointAtRouteCoordinate:", v7);
  v10 = v9;
  v12 = v11;
  objc_msgSend(v5, "pointAtRouteCoordinate:", v8);
  v14 = v13;
  v16 = v15;

  v17 = vabdd_f64(v14, v10) <= 0.000001;
  return vabdd_f64(v16, v12) <= 0.000001 && v17;
}

@end
