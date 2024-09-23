@implementation GEOTileEditionUpdate

- (GEOTileEditionUpdate)initWithActiveTileGroup:(id)a3 oldActiveTileGroup:(id)a4 dataSetDiffers:(BOOL)a5 flushEverything:(BOOL)a6
{
  uint64_t BOOL;
  _BOOL4 v7;
  id v10;
  id v11;
  GEOTileEditionUpdate *v12;
  uint64_t v13;
  NSObject *v14;
  GEOTileEditionUpdate *v15;
  GEOTileEditionUpdate *v16;
  _QWORD v18[4];
  GEOTileEditionUpdate *v19;
  id v20;
  uint8_t buf[16];

  BOOL = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = -[GEOTileEditionUpdate init](self, "init");
  if (v12)
  {
    if ((_DWORD)BOOL)
    {
      BOOL = GEOConfigGetBOOL(GeoServicesConfig_TileCacheFlushInvalidates, (uint64_t)off_1EDF4D418);
      v13 = BOOL ^ 1;
      if (!v7)
        goto LABEL_10;
    }
    else
    {
      v13 = 0;
      if (!v7)
      {
LABEL_10:
        -[GEOTileEditionUpdate setFlushEverything:](v12, "setFlushEverything:", v13);
        -[GEOTileEditionUpdate setInvalidateEverything:](v12, "setInvalidateEverything:", BOOL);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __114__GEOTileEditionUpdate_ManifestExtras__initWithActiveTileGroup_oldActiveTileGroup_dataSetDiffers_flushEverything___block_invoke;
        v18[3] = &unk_1E1C0AEF8;
        v15 = v12;
        v19 = v15;
        v20 = v11;
        objc_msgSend(v10, "iterateActiveTileSets:", v18);
        v16 = v15;

        goto LABEL_11;
      }
    }
    if (GEOConfigGetBOOL(GeoServicesConfig_DataSetChangeFlushesTileCache, (uint64_t)off_1EDF4D078))
    {
      GEOGetResourceManifestLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "Flushing tile cache due to DataSet change", buf, 2u);
      }

      BOOL = 0;
      v13 = 1;
    }
    goto LABEL_10;
  }
LABEL_11:

  return v12;
}

void __114__GEOTileEditionUpdate_ManifestExtras__initWithActiveTileGroup_oldActiveTileGroup_dataSetDiffers_flushEverything___block_invoke(uint64_t a1, void *a2, int a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  id v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  _BOOL4 v17;
  id v18;

  v11 = a2;
  v18 = v11;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addTileset:edition:provider:invalidateOnly:", a4, a5, a6, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "activeTileSetForTileType:scale:", objc_msgSend(v11, "style"), objc_msgSend(v11, "scale"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "size");
    if (v13 != objc_msgSend(v18, "size")
      || (v14 = objc_msgSend(v12, "version"), v14 != objc_msgSend(v18, "version")))
    {
      v15 = objc_msgSend(v12, "size");
      if (v15 == objc_msgSend(v18, "size"))
      {
        v16 = objc_msgSend(v12, "updateBehavior");
        v17 = v16 == objc_msgSend(v18, "updateBehavior");
      }
      else
      {
        v17 = 0;
      }
      if (objc_msgSend(v18, "updateBehavior") != 1)
        v17 = 0;
      objc_msgSend(*(id *)(a1 + 32), "addTileset:edition:provider:invalidateOnly:", a4, a5, a6, v17 & (GEOConfigGetBOOL(GeoServicesConfig_ForceFlushTileCacheOnVersionChange, (uint64_t)off_1EDF4D0E8) ^ 1));
    }

  }
}

- (GEOTileEditionUpdate)init
{
  GEOTileEditionUpdate *v2;
  NSMutableArray *v3;
  NSMutableArray *entries;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTileEditionUpdate;
  v2 = -[GEOTileEditionUpdate init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    entries = v2->_entries;
    v2->_entries = v3;

  }
  return v2;
}

- (void)addTileset:(id)a3 edition:(unsigned int)a4 provider:(unsigned int)a5 invalidateOnly:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int var0;
  GEOEditionEntry *v11;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  var0 = a3.var0;
  v11 = objc_alloc_init(GEOEditionEntry);
  -[GEOEditionEntry setTileset:](v11, "setTileset:", var0);
  -[GEOEditionEntry setEdition:](v11, "setEdition:", v8);
  -[GEOEditionEntry setProvider:](v11, "setProvider:", v7);
  -[GEOEditionEntry setInvalidateOnly:](v11, "setInvalidateOnly:", v6);
  -[NSMutableArray addObject:](self->_entries, "addObject:", v11);

}

- (unint64_t)tilesetCount
{
  return -[NSMutableArray count](self->_entries, "count");
}

- (void)tileset:(id *)a3 edition:(unsigned int *)a4 provider:(unsigned int *)a5 invalidateOnly:(BOOL *)a6 atIndex:(unint64_t)a7
{
  id v11;

  -[NSMutableArray objectAtIndex:](self->_entries, "objectAtIndex:", a7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  a3->var0 = objc_msgSend(v11, "tileset");
  *a4 = objc_msgSend(v11, "edition");
  *a5 = objc_msgSend(v11, "provider");
  *a6 = objc_msgSend(v11, "invalidateOnly");

}

- (BOOL)flushEverything
{
  return self->_flushEverything;
}

- (void)setFlushEverything:(BOOL)a3
{
  self->_flushEverything = a3;
}

- (BOOL)invalidateEverything
{
  return self->_invalidateEverything;
}

- (void)setInvalidateEverything:(BOOL)a3
{
  self->_invalidateEverything = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
