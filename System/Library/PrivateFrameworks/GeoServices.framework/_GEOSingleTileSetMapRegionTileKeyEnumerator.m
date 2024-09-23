@implementation _GEOSingleTileSetMapRegionTileKeyEnumerator

- (_GEOSingleTileSetMapRegionTileKeyEnumerator)initWithMapRegion:(id)a3 tileSet:(id)a4 zoomMode:(int64_t)a5
{
  id v9;
  id v10;
  _GEOSingleTileSetMapRegionTileKeyEnumerator *v11;
  _GEOSingleTileSetMapRegionTileKeyEnumerator *v12;
  uint64_t v13;
  void *zoomLevels;
  uint64_t v15;
  NSArray *v16;
  NSArray *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _GEOSingleTileSetMapRegionTileKeyEnumerator *v22;
  objc_super v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_GEOSingleTileSetMapRegionTileKeyEnumerator;
  v11 = -[_GEOSingleTileSetMapRegionTileKeyEnumerator init](&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_region, a3);
    v12->_style = objc_msgSend(v10, "style");
    v12->_size = objc_msgSend(v10, "size");
    v12->_scale = objc_msgSend(v10, "scale");
    v12->_zoomMode = a5;
    if (a5 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v10, "minimumZoomLevelInRect:", 0.0, 0.0, 268435456.0, 268435456.0);
      v19 = objc_msgSend(v10, "largestZoomLevelLEQ:inRect:", 0xFFFFFFFFLL, 0.0, 0.0, 268435456.0, 268435456.0);
      if (v19 >= v18)
      {
        v20 = v19;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v17, "addObject:", v21);

          if (!(_DWORD)v20)
            break;
          v20 = objc_msgSend(v10, "largestZoomLevelLEQ:inRect:", (v20 - 1), 0.0, 0.0, 268435456.0, 268435456.0);
        }
        while (v20 >= v18);
      }
      zoomLevels = v12->_zoomLevels;
      v12->_zoomLevels = v17;
    }
    else
    {
      if (a5)
      {
LABEL_11:
        v22 = v12;
        goto LABEL_12;
      }
      v13 = objc_msgSend(v10, "largestZoomLevelLEQ:inRect:", 0xFFFFFFFFLL, 0.0, 0.0, 268435456.0, 268435456.0);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13);
      zoomLevels = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = zoomLevels;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v12->_zoomLevels;
      v12->_zoomLevels = (NSArray *)v15;

    }
    goto LABEL_11;
  }
LABEL_12:

  return v12;
}

- (BOOL)continueEnumeratingTileKeysWithBlock:(id)a3
{
  id v4;
  unint64_t currentZIndex;
  unint64_t v6;
  void *v7;
  unsigned int v8;
  GEOMapRegion *region;
  unsigned int style;
  int size;
  uint64_t scale;
  unsigned int currentOffset;
  unint64_t v14;
  BOOL v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  currentZIndex = self->_currentZIndex;
  if (currentZIndex >= -[NSArray count](self->_zoomLevels, "count"))
  {
    v15 = 1;
  }
  else
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    do
    {
      v6 = self->_currentZIndex;
      if (v6 >= -[NSArray count](self->_zoomLevels, "count"))
        break;
      -[NSArray objectAtIndexedSubscript:](self->_zoomLevels, "objectAtIndexedSubscript:", self->_currentZIndex);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntValue");

      region = self->_region;
      style = self->_style;
      size = self->_size;
      scale = self->_scale;
      currentOffset = self->_currentOffset;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __84___GEOSingleTileSetMapRegionTileKeyEnumerator_continueEnumeratingTileKeysWithBlock___block_invoke;
      v17[3] = &unk_1E1C14130;
      v18 = v4;
      v19 = &v20;
      v17[4] = self;
      if (_GEOEnumerateTileKeysForRegion(region, style, size, scale, v8, currentOffset, v17))
      {
        ++self->_currentZIndex;
        self->_currentOffset = 0;
      }

    }
    while (!*((_BYTE *)v21 + 24));
    v14 = self->_currentZIndex;
    v15 = v14 >= -[NSArray count](self->_zoomLevels, "count");
    _Block_object_dispose(&v20, 8);
  }

  return v15;
}

- (unint64_t)count
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_zoomLevels;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += _GEONumberOfTileKeysForRegion(self->_region, self->_style, self->_size, self->_scale, objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "unsignedIntValue", (_QWORD)v10));
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomLevels, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
