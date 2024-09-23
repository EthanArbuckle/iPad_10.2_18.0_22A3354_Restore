@implementation GEOMapItemURLExtras

+ (id)urlToPresentAction:(id)a3 present:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  GEORisonParser *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v6, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("present"));

  v11 = objc_alloc_init(GEORisonParser);
  v12 = (void *)MEMORY[0x1E0C99E98];
  v13 = (void *)MEMORY[0x1E0CB3940];
  -[GEORisonParser stringFromRisonObject:](v11, "stringFromRisonObject:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@:%@?%@"), CFSTR("map"), v7, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "URLWithString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)urlToPresentDirectionsForItems:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  GEOURLPresent *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = -[GEOURLPresent initWithDirectionsOptions:]([GEOURLPresent alloc], "initWithDirectionsOptions:", v6);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[GEOURLPresent addItem:]((uint64_t)v7, *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  +[GEOMapItemURLExtras urlToPresentAction:present:](GEOMapItemURLExtras, "urlToPresentAction:present:", CFSTR("directions"), v7, (_QWORD)v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)urlToPresentDirectionsFromCurrentLocationToMapItem:(id)a3 withOptions:(id)a4
{
  id v5;
  id v6;
  GEOURLItem *v7;
  GEOURLItem *v8;
  GEOURLItem *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(GEOURLItem);
  v8 = v7;
  if (v7)
  {
    *(_BYTE *)&v7->_flags |= 8u;
    *(_BYTE *)&v7->_flags |= 1u;
    v7->_currentLocation = 1;
  }
  v9 = objc_alloc_init(GEOURLItem);
  -[GEOURLItem setMapItem:](v9, "setMapItem:", v6);

  v13[0] = v8;
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOMapItemURLExtras urlToPresentDirectionsForItems:options:](GEOMapItemURLExtras, "urlToPresentDirectionsForItems:options:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_mapItemsFromPresentAction:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6
{
  void *v8;
  id v9;
  void *v10;
  id v12;

  v12 = 0;
  objc_msgSend(a1, "_mapItemsFromPresentAction:currentLocationIndices:options:", a3, &v12, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  v10 = v9;
  if (a5)
    *a5 = objc_msgSend(v9, "lastIndex");
  if (a4)
    *a4 = objc_msgSend(v10, "count") != 0;

  return v8;
}

+ (id)_mapItemsFromPresentAction:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  GEOURLPresent *v10;
  id *p_isa;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v7 = a3;
  if (a4)
  {
    v8 = objc_retainAutorelease(objc_alloc_init(MEMORY[0x1E0CB3788]));
    *a4 = v8;
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v7, 1);
  v10 = -[GEOURLPresent initWithData:]([GEOURLPresent alloc], "initWithData:", v9);
  p_isa = (id *)&v10->super.super.isa;
  if (a5)
  {
    -[GEOURLPresent options]((id *)&v10->super.super.isa);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[GEOURLPresent items](p_isa);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v13);
  if (v13)
  {
    v15 = 0;
    while (1)
    {
      -[GEOURLPresent items](p_isa);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndex:", v15);
      v17 = objc_claimAutoreleasedReturnValue();

      if (!v17)
        break;
      if (*(_BYTE *)(v17 + 44))
        goto LABEL_12;
      -[GEOURLItem _readMapItemStorage](v17);
      if (!*(_QWORD *)(v17 + 16))
        break;
      objc_msgSend((id)v17, "mapItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v18);

      if (*(_BYTE *)(v17 + 44))
LABEL_12:
        objc_msgSend(v8, "addIndex:", v15);

      if (v13 == ++v15)
        goto LABEL_14;
    }

    v19 = 0;
  }
  else
  {
LABEL_14:
    v19 = v14;
  }

  return v19;
}

+ (id)_mapItemsFromDirectionsAction:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6
{
  void *v8;
  id v9;
  void *v10;
  id v12;

  v12 = 0;
  objc_msgSend(a1, "_mapItemsFromDirectionsAction:currentLocationIndices:options:", a3, &v12, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  v10 = v9;
  if (a5)
    *a5 = objc_msgSend(v9, "lastIndex");
  if (a4)
    *a4 = objc_msgSend(v10, "count") != 0;

  return v8;
}

+ (id)_mapItemsFromDirectionsAction:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5
{
  void *v7;
  void *v8;

  if (a5)
    *a5 = 0;
  objc_msgSend(a3, "objectForKey:", CFSTR("present"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[GEOMapItemURLExtras _mapItemsFromPresentAction:currentLocationIndices:options:](GEOMapItemURLExtras, "_mapItemsFromPresentAction:currentLocationIndices:options:", v7, a4, a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)mapItemsFromURL:(id)a3 hasCurrentLocation:(BOOL *)a4 currentLocationIndex:(unint64_t *)a5 options:(id *)a6
{
  void *v8;
  id v9;
  void *v10;
  id v12;

  v12 = 0;
  objc_msgSend(a1, "mapItemsFromURL:currentLocationIndices:options:", a3, &v12, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  v10 = v9;
  if (a5)
    *a5 = objc_msgSend(v9, "lastIndex");
  if (a4)
    *a4 = objc_msgSend(v10, "count") != 0;

  return v8;
}

+ (id)mapItemsFromURL:(id)a3 currentLocationIndices:(id *)a4 options:(id *)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  GEORisonParser *v17;
  void *v18;

  v7 = a3;
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("map"));

  if (v9)
  {
    objc_msgSend(v7, "resourceSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hasPrefix:", CFSTR("//")))
    {
      objc_msgSend(v10, "substringFromIndex:", 2);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    v12 = objc_msgSend(v10, "rangeOfString:", CFSTR("?"));
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = 0;
    }
    else
    {
      v14 = v12;
      objc_msgSend(v10, "substringToIndex:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToString:", CFSTR("directions")))
      {
        objc_msgSend(v10, "substringFromIndex:", v14 + 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_alloc_init(GEORisonParser);
        -[GEORisonParser objectFromRisonString:](v17, "objectFromRisonString:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("directions")))
        {
          +[GEOMapItemURLExtras _mapItemsFromDirectionsAction:currentLocationIndices:options:](GEOMapItemURLExtras, "_mapItemsFromDirectionsAction:currentLocationIndices:options:", v18, a4, a5);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
