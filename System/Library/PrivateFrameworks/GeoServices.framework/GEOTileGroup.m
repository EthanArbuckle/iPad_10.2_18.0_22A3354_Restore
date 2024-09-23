@implementation GEOTileGroup

- (unsigned)identifier
{
  return self->_identifier;
}

- (GEOTileGroup)init
{
  GEOTileGroup *v2;
  GEOTileGroup *v3;
  GEOTileGroup *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTileGroup;
  v2 = -[GEOTileGroup init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTileGroup)initWithData:(id)a3
{
  GEOTileGroup *v3;
  GEOTileGroup *v4;
  GEOTileGroup *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTileGroup;
  v3 = -[GEOTileGroup initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[GEOTileGroup clearTileSets](self, "clearTileSets");
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  -[GEOTileGroup clearRegionalResourceIndexs](self, "clearRegionalResourceIndexs");
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  -[GEOTileGroup clearHybridUnavailableRegions](self, "clearHybridUnavailableRegions");
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTileGroup;
  -[GEOTileGroup dealloc](&v3, sel_dealloc);
}

- (void)setIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_identifier = a3;
}

- (void)_readTileSets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTileSets_tags_1144);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)tileSetsCount
{
  -[GEOTileGroup _readTileSets]((uint64_t)self);
  return self->_tileSetsCount;
}

- (GEOVersionedTileSet)tileSets
{
  -[GEOTileGroup _readTileSets]((uint64_t)self);
  return self->_tileSets;
}

- (uint64_t)_reserveTileSets:(uint64_t)a1
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 224);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 232);
    if (v6 >= v5)
      return 1;
    v7 = v6 + a2;
    if (v6 + a2)
    {
      v8 = 1;
      while (1)
      {
        v9 = v8;
        if (v8 >= v7)
          break;
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9 < a2)
      return 0;
LABEL_12:
    if (8 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 216), 8 * v9, 0x62A81FEFuLL);
    if (result)
    {
      *(_QWORD *)(a1 + 232) = v9;
      *(_QWORD *)(a1 + 216) = result;
      bzero((void *)(result + 8 * *(_QWORD *)(a1 + 224)), 8 * (v9 - *(_QWORD *)(a1 + 224)));
      return 1;
    }
  }
  return result;
}

- (void)clearTileSets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_tileSetsSpace = 0;
  self->_tileSetsCount = 0;
  free(self->_tileSets);
  self->_tileSets = 0;
}

- (void)addTileSet:(GEOVersionedTileSet)a3
{
  -[GEOTileGroup _readTileSets]((uint64_t)self);
  if (self && -[GEOTileGroup _reserveTileSets:]((uint64_t)self, 1uLL))
    self->_tileSets[self->_tileSetsCount++] = a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (GEOVersionedTileSet)tileSetAtIndex:(unint64_t)a3
{
  unint64_t tileSetsCount;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[GEOTileGroup _readTileSets]((uint64_t)self);
  tileSetsCount = self->_tileSetsCount;
  if (tileSetsCount <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, tileSetsCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return self->_tileSets[a3];
}

- (void)setTileSets:(GEOVersionedTileSet *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[GEOTileGroup clearTileSets](self, "clearTileSets");
  if (-[GEOTileGroup _reserveTileSets:]((uint64_t)self, a4))
  {
    memcpy(self->_tileSets, a3, 8 * a4);
    self->_tileSetsCount = a4;
  }
}

- (void)_readStyleSheetIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleSheetIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)styleSheetIndexsCount
{
  -[GEOTileGroup _readStyleSheetIndexs]((uint64_t)self);
  return self->_styleSheetIndexs.count;
}

- (unsigned)styleSheetIndexs
{
  -[GEOTileGroup _readStyleSheetIndexs]((uint64_t)self);
  return self->_styleSheetIndexs.list;
}

- (void)clearStyleSheetIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedUInt32Clear();
}

- (void)addStyleSheetIndex:(unsigned int)a3
{
  -[GEOTileGroup _readStyleSheetIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unsigned)styleSheetIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_styleSheetIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTileGroup _readStyleSheetIndexs]((uint64_t)self);
  p_styleSheetIndexs = &self->_styleSheetIndexs;
  count = self->_styleSheetIndexs.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_styleSheetIndexs->list[a3];
}

- (void)setStyleSheetIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedUInt32Set();
}

- (void)_readTextureIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTextureIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)textureIndexsCount
{
  -[GEOTileGroup _readTextureIndexs]((uint64_t)self);
  return self->_textureIndexs.count;
}

- (unsigned)textureIndexs
{
  -[GEOTileGroup _readTextureIndexs]((uint64_t)self);
  return self->_textureIndexs.list;
}

- (void)clearTextureIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedUInt32Clear();
}

- (void)addTextureIndex:(unsigned int)a3
{
  -[GEOTileGroup _readTextureIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unsigned)textureIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_textureIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTileGroup _readTextureIndexs]((uint64_t)self);
  p_textureIndexs = &self->_textureIndexs;
  count = self->_textureIndexs.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_textureIndexs->list[a3];
}

- (void)setTextureIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedUInt32Set();
}

- (void)_readFontIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFontIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)fontIndexsCount
{
  -[GEOTileGroup _readFontIndexs]((uint64_t)self);
  return self->_fontIndexs.count;
}

- (unsigned)fontIndexs
{
  -[GEOTileGroup _readFontIndexs]((uint64_t)self);
  return self->_fontIndexs.list;
}

- (void)clearFontIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedUInt32Clear();
}

- (void)addFontIndex:(unsigned int)a3
{
  -[GEOTileGroup _readFontIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unsigned)fontIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_fontIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTileGroup _readFontIndexs]((uint64_t)self);
  p_fontIndexs = &self->_fontIndexs;
  count = self->_fontIndexs.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_fontIndexs->list[a3];
}

- (void)setFontIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedUInt32Set();
}

- (void)_readIconIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIconIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)iconIndexsCount
{
  -[GEOTileGroup _readIconIndexs]((uint64_t)self);
  return self->_iconIndexs.count;
}

- (unsigned)iconIndexs
{
  -[GEOTileGroup _readIconIndexs]((uint64_t)self);
  return self->_iconIndexs.list;
}

- (void)clearIconIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedUInt32Clear();
}

- (void)addIconIndex:(unsigned int)a3
{
  -[GEOTileGroup _readIconIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unsigned)iconIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_iconIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTileGroup _readIconIndexs]((uint64_t)self);
  p_iconIndexs = &self->_iconIndexs;
  count = self->_iconIndexs.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_iconIndexs->list[a3];
}

- (void)setIconIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedUInt32Set();
}

- (void)_readRegionalResourceIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegionalResourceIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)regionalResourceIndexsCount
{
  -[GEOTileGroup _readRegionalResourceIndexs]((uint64_t)self);
  return self->_regionalResourceIndexsCount;
}

- (GEORegionalResourceIndex)regionalResourceIndexs
{
  -[GEOTileGroup _readRegionalResourceIndexs]((uint64_t)self);
  return self->_regionalResourceIndexs;
}

- (uint64_t)_reserveRegionalResourceIndexs:(uint64_t)a1
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 128);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 136);
    if (v6 >= v5)
      return 1;
    v7 = v6 + a2;
    if (v6 + a2)
    {
      v8 = 1;
      while (1)
      {
        v9 = v8;
        if (v8 >= v7)
          break;
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9 < a2)
      return 0;
LABEL_12:
    if (16 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 120), 16 * v9, 0xF0A10D9DuLL);
    if (result)
    {
      *(_QWORD *)(a1 + 136) = v9;
      *(_QWORD *)(a1 + 120) = result;
      bzero((void *)(result + 16 * *(_QWORD *)(a1 + 128)), 16 * (v9 - *(_QWORD *)(a1 + 128)));
      return 1;
    }
  }
  return result;
}

- (void)clearRegionalResourceIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_regionalResourceIndexsSpace = 0;
  self->_regionalResourceIndexsCount = 0;
  free(self->_regionalResourceIndexs);
  self->_regionalResourceIndexs = 0;
}

- (void)addRegionalResourceIndex:(GEORegionalResourceIndex)a3
{
  uint64_t v3;
  uint64_t v4;
  GEORegionalResourceIndex *v6;

  v3 = *(_QWORD *)&a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  -[GEOTileGroup _readRegionalResourceIndexs]((uint64_t)self);
  if (self && -[GEOTileGroup _reserveRegionalResourceIndexs:]((uint64_t)self, 1uLL))
  {
    v6 = &self->_regionalResourceIndexs[self->_regionalResourceIndexsCount];
    *(_QWORD *)&v6->var0 = v4;
    *(_QWORD *)&v6->var2 = v3;
    ++self->_regionalResourceIndexsCount;
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (GEORegionalResourceIndex)regionalResourceIndexAtIndex:(unint64_t)a3
{
  unint64_t regionalResourceIndexsCount;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  GEORegionalResourceIndex *v10;
  uint64_t v11;
  uint64_t v12;
  GEORegionalResourceIndex result;

  -[GEOTileGroup _readRegionalResourceIndexs]((uint64_t)self);
  regionalResourceIndexsCount = self->_regionalResourceIndexsCount;
  if (regionalResourceIndexsCount <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, regionalResourceIndexsCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  v10 = &self->_regionalResourceIndexs[a3];
  v11 = *(_QWORD *)&v10->var0;
  v12 = *(_QWORD *)&v10->var2;
  result.var2 = v12;
  result.var3 = *($162FAC071EAEBA15A6F8D573D0754DF6 *)((char *)&v12 + 4);
  result.var0 = v11;
  result.var1 = HIDWORD(v11);
  return result;
}

- (void)setRegionalResourceIndexs:(GEORegionalResourceIndex *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[GEOTileGroup clearRegionalResourceIndexs](self, "clearRegionalResourceIndexs");
  if (-[GEOTileGroup _reserveRegionalResourceIndexs:]((uint64_t)self, a4))
  {
    memcpy(self->_regionalResourceIndexs, a3, 16 * a4);
    self->_regionalResourceIndexsCount = a4;
  }
}

- (void)_readXmlIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readXmlIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)xmlIndexsCount
{
  -[GEOTileGroup _readXmlIndexs]((uint64_t)self);
  return self->_xmlIndexs.count;
}

- (unsigned)xmlIndexs
{
  -[GEOTileGroup _readXmlIndexs]((uint64_t)self);
  return self->_xmlIndexs.list;
}

- (void)clearXmlIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedUInt32Clear();
}

- (void)addXmlIndex:(unsigned int)a3
{
  -[GEOTileGroup _readXmlIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unsigned)xmlIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_xmlIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTileGroup _readXmlIndexs]((uint64_t)self);
  p_xmlIndexs = &self->_xmlIndexs;
  count = self->_xmlIndexs.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_xmlIndexs->list[a3];
}

- (void)setXmlIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedUInt32Set();
}

- (void)_readAttributionIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributionIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)attributionIndexsCount
{
  -[GEOTileGroup _readAttributionIndexs]((uint64_t)self);
  return self->_attributionIndexs.count;
}

- (unsigned)attributionIndexs
{
  -[GEOTileGroup _readAttributionIndexs]((uint64_t)self);
  return self->_attributionIndexs.list;
}

- (void)clearAttributionIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedUInt32Clear();
}

- (void)addAttributionIndex:(unsigned int)a3
{
  -[GEOTileGroup _readAttributionIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unsigned)attributionIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_attributionIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTileGroup _readAttributionIndexs]((uint64_t)self);
  p_attributionIndexs = &self->_attributionIndexs;
  count = self->_attributionIndexs.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_attributionIndexs->list[a3];
}

- (void)setAttributionIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedUInt32Set();
}

- (void)_readHybridUnavailableRegions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHybridUnavailableRegions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)hybridUnavailableRegionsCount
{
  -[GEOTileGroup _readHybridUnavailableRegions]((uint64_t)self);
  return self->_hybridUnavailableRegionsCount;
}

- (GEOTileSetRegion)hybridUnavailableRegions
{
  -[GEOTileGroup _readHybridUnavailableRegions]((uint64_t)self);
  return self->_hybridUnavailableRegions;
}

- (uint64_t)_reserveHybridUnavailableRegions:(uint64_t)a1
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 80);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 88);
    if (v6 >= v5)
      return 1;
    v7 = v6 + a2;
    if (v6 + a2)
    {
      v8 = 1;
      while (1)
      {
        v9 = v8;
        if (v8 >= v7)
          break;
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9 < a2)
      return 0;
LABEL_12:
    if (24 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 72), 24 * v9, 0x698C193uLL);
    if (result)
    {
      *(_QWORD *)(a1 + 88) = v9;
      *(_QWORD *)(a1 + 72) = result;
      bzero((void *)(result + 24 * *(_QWORD *)(a1 + 80)), 24 * (v9 - *(_QWORD *)(a1 + 80)));
      return 1;
    }
  }
  return result;
}

- (void)clearHybridUnavailableRegions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_hybridUnavailableRegionsSpace = 0;
  self->_hybridUnavailableRegionsCount = 0;
  free(self->_hybridUnavailableRegions);
  self->_hybridUnavailableRegions = 0;
}

- (void)addHybridUnavailableRegion:(GEOTileSetRegion *)a3
{
  GEOTileSetRegion v5;

  -[GEOTileGroup _readHybridUnavailableRegions]((uint64_t)self);
  v5 = *a3;
  if (self && -[GEOTileGroup _reserveHybridUnavailableRegions:]((uint64_t)self, 1uLL))
    self->_hybridUnavailableRegions[self->_hybridUnavailableRegionsCount++] = v5;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (GEOTileSetRegion)hybridUnavailableRegionAtIndex:(SEL)a3
{
  GEOTileSetRegion *result;
  unint64_t hybridUnavailableRegionsCount;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  GEOTileSetRegion *v13;

  -[GEOTileGroup _readHybridUnavailableRegions]((uint64_t)self);
  hybridUnavailableRegionsCount = self->_hybridUnavailableRegionsCount;
  if (hybridUnavailableRegionsCount <= a4)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a4, hybridUnavailableRegionsCount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise");

  }
  v13 = &self->_hybridUnavailableRegions[a4];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v13->var0;
  *(_QWORD *)&retstr->var4 = *(_QWORD *)&v13->var4;
  return result;
}

- (void)setHybridUnavailableRegions:(GEOTileSetRegion *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[GEOTileGroup clearHybridUnavailableRegions](self, "clearHybridUnavailableRegions");
  if (-[GEOTileGroup _reserveHybridUnavailableRegions:]((uint64_t)self, a4))
  {
    memcpy(self->_hybridUnavailableRegions, a3, 24 * a4);
    self->_hybridUnavailableRegionsCount = a4;
  }
}

- (void)_readResourceIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResourceIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)resourceIndexsCount
{
  -[GEOTileGroup _readResourceIndexs]((uint64_t)self);
  return self->_resourceIndexs.count;
}

- (unsigned)resourceIndexs
{
  -[GEOTileGroup _readResourceIndexs]((uint64_t)self);
  return self->_resourceIndexs.list;
}

- (void)clearResourceIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedUInt32Clear();
}

- (void)addResourceIndex:(unsigned int)a3
{
  -[GEOTileGroup _readResourceIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unsigned)resourceIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_resourceIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTileGroup _readResourceIndexs]((uint64_t)self);
  p_resourceIndexs = &self->_resourceIndexs;
  count = self->_resourceIndexs.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_resourceIndexs->list[a3];
}

- (void)setResourceIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  PBRepeatedUInt32Set();
}

- (unsigned)muninVersionIndex
{
  return self->_muninVersionIndex;
}

- (void)setMuninVersionIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_muninVersionIndex = a3;
}

- (void)setHasMuninVersionIndex:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasMuninVersionIndex
{
  return *(_WORD *)&self->_flags & 1;
}

- (unsigned)offlineMetadataIndex
{
  return self->_offlineMetadataIndex;
}

- (void)setOfflineMetadataIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_offlineMetadataIndex = a3;
}

- (void)setHasOfflineMetadataIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8194;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasOfflineMetadataIndex
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOTileGroup;
  -[GEOTileGroup description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTileGroup dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTileGroup _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  __int16 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v35[4];
  id v36;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 276));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("identifier"));

  if (*(_QWORD *)(a1 + 224))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 224));
    if (*(_QWORD *)(a1 + 224))
    {
      v7 = 0;
      v8 = 0;
      do
      {
        _GEOVersionedTileSetDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 216) + v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v9);

        ++v8;
        v7 += 8;
      }
      while (v8 < *(_QWORD *)(a1 + 224));
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("tileSet"));

  }
  if (*(_QWORD *)(a1 + 176))
  {
    PBRepeatedUInt32NSArray();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("styleSheetIndex"));

  }
  if (*(_QWORD *)(a1 + 200))
  {
    PBRepeatedUInt32NSArray();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("textureIndex"));

  }
  if (*(_QWORD *)(a1 + 56))
  {
    PBRepeatedUInt32NSArray();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("fontIndex"));

  }
  if (*(_QWORD *)(a1 + 104))
  {
    PBRepeatedUInt32NSArray();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("iconIndex"));

  }
  if (*(_QWORD *)(a1 + 128))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 128));
    if (*(_QWORD *)(a1 + 128))
    {
      v15 = 0;
      v16 = 0;
      do
      {
        _GEORegionalResourceIndexDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 120) + v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v17);

        ++v16;
        v15 += 16;
      }
      while (v16 < *(_QWORD *)(a1 + 128));
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("regionalResourceIndex"));

  }
  if (*(_QWORD *)(a1 + 248))
  {
    PBRepeatedUInt32NSArray();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("xmlIndex"));

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt32NSArray();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("attributionIndex"));

  }
  if (*(_QWORD *)(a1 + 80))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 80));
    if (*(_QWORD *)(a1 + 80))
    {
      v21 = 0;
      v22 = 0;
      do
      {
        _GEOTileSetRegionDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 72) + v21));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v23);

        ++v22;
        v21 += 24;
      }
      while (v22 < *(_QWORD *)(a1 + 80));
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("hybridUnavailableRegion"));

  }
  if (*(_QWORD *)(a1 + 152))
  {
    PBRepeatedUInt32NSArray();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("resourceIndex"));

  }
  v25 = *(_WORD *)(a1 + 288);
  if ((v25 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 280));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("muninVersionIndex"));

    v25 = *(_WORD *)(a1 + 288);
  }
  if ((v25 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 284));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("offlineMetadataIndex"));

  }
  v28 = *(void **)(a1 + 16);
  if (v28)
  {
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v29, "count"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __42__GEOTileGroup__dictionaryRepresentation___block_invoke;
      v35[3] = &unk_1E1C00600;
      v32 = v31;
      v36 = v32;
      objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v35);
      v33 = v32;

      v30 = v33;
    }
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTileGroup _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __42__GEOTileGroup__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOTileGroup)initWithDictionary:(id)a3
{
  return (GEOTileGroup *)-[GEOTileGroup _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  __int128 v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identifier"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIdentifier:", objc_msgSend(v4, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("tileSet"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v120 = 0u;
        v121 = 0u;
        v118 = 0u;
        v119 = 0u;
        v6 = v5;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v119;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v119 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v10);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                *(_QWORD *)&v84 = 0;
                _GEOVersionedTileSetFromDictionaryRepresentation(v11, &v84);
                objc_msgSend(a1, "addTileSet:", (_QWORD)v84);
              }
              ++v10;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
          }
          while (v8);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("styleSheetIndex"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v116 = 0u;
        v117 = 0u;
        v114 = 0u;
        v115 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v114, v130, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v115;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v115 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v17);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addStyleSheetIndex:", objc_msgSend(v18, "unsignedIntValue"));
              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v114, v130, 16);
          }
          while (v15);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("textureIndex"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v112 = 0u;
        v113 = 0u;
        v110 = 0u;
        v111 = 0u;
        v20 = v19;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v110, v129, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v111;
          do
          {
            v24 = 0;
            do
            {
              if (*(_QWORD *)v111 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v24);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addTextureIndex:", objc_msgSend(v25, "unsignedIntValue"));
              ++v24;
            }
            while (v22 != v24);
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v110, v129, 16);
          }
          while (v22);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("fontIndex"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v106, v128, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v107;
          do
          {
            v31 = 0;
            do
            {
              if (*(_QWORD *)v107 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v31);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addFontIndex:", objc_msgSend(v32, "unsignedIntValue"));
              ++v31;
            }
            while (v29 != v31);
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v106, v128, 16);
          }
          while (v29);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("iconIndex"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v34 = v33;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v102, v127, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v103;
          do
          {
            v38 = 0;
            do
            {
              if (*(_QWORD *)v103 != v37)
                objc_enumerationMutation(v34);
              v39 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v38);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addIconIndex:", objc_msgSend(v39, "unsignedIntValue"));
              ++v38;
            }
            while (v36 != v38);
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v102, v127, 16);
          }
          while (v36);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("regionalResourceIndex"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v41 = v40;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v98, v126, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v99;
          do
          {
            v45 = 0;
            do
            {
              if (*(_QWORD *)v99 != v44)
                objc_enumerationMutation(v41);
              v46 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v45);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v84 = 0uLL;
                _GEORegionalResourceIndexFromDictionaryRepresentation(v46, (uint64_t)&v84);
                objc_msgSend(a1, "addRegionalResourceIndex:", v84);
              }
              ++v45;
            }
            while (v43 != v45);
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v98, v126, 16);
          }
          while (v43);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("xmlIndex"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        v48 = v47;
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v94, v125, 16);
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v95;
          do
          {
            v52 = 0;
            do
            {
              if (*(_QWORD *)v95 != v51)
                objc_enumerationMutation(v48);
              v53 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v52);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addXmlIndex:", objc_msgSend(v53, "unsignedIntValue"));
              ++v52;
            }
            while (v50 != v52);
            v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v94, v125, 16);
          }
          while (v50);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributionIndex"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        v55 = v54;
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v90, v124, 16);
        if (v56)
        {
          v57 = v56;
          v58 = *(_QWORD *)v91;
          do
          {
            v59 = 0;
            do
            {
              if (*(_QWORD *)v91 != v58)
                objc_enumerationMutation(v55);
              v60 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v59);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addAttributionIndex:", objc_msgSend(v60, "unsignedIntValue"));
              ++v59;
            }
            while (v57 != v59);
            v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v90, v124, 16);
          }
          while (v57);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hybridUnavailableRegion"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        v62 = v61;
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v86, v123, 16);
        if (v63)
        {
          v64 = v63;
          v65 = *(_QWORD *)v87;
          do
          {
            v66 = 0;
            do
            {
              if (*(_QWORD *)v87 != v65)
                objc_enumerationMutation(v62);
              v67 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v66);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v84 = 0uLL;
                v85 = 0;
                _GEOTileSetRegionFromDictionaryRepresentation(v67, &v84);
                v82 = v84;
                v83 = v85;
                objc_msgSend(a1, "addHybridUnavailableRegion:", &v82);
              }
              ++v66;
            }
            while (v64 != v66);
            v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v86, v123, 16);
          }
          while (v64);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("resourceIndex"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v69 = v68;
        v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v78, v122, 16);
        if (v70)
        {
          v71 = v70;
          v72 = *(_QWORD *)v79;
          do
          {
            v73 = 0;
            do
            {
              if (*(_QWORD *)v79 != v72)
                objc_enumerationMutation(v69);
              v74 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v73);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addResourceIndex:", objc_msgSend(v74, "unsignedIntValue", (_QWORD)v78));
              ++v73;
            }
            while (v71 != v73);
            v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v78, v122, 16);
          }
          while (v71);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("muninVersionIndex"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMuninVersionIndex:", objc_msgSend(v75, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("offlineMetadataIndex"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setOfflineMetadataIndex:", objc_msgSend(v76, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOTileGroup)initWithJSON:(id)a3
{
  return (GEOTileGroup *)-[GEOTileGroup _initWithDictionary:isJSON:](self, a3);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_1167;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1168;
    GEOTileGroupReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTileGroupIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTileGroupReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  __int16 flags;
  PBDataReader *v20;
  void *v21;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3FF8) == 0))
  {
    v20 = self->_reader;
    objc_sync_enter(v20);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v21);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v20);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTileGroup readAll:](self, "readAll:", 0);
    PBDataWriterWriteUint32Field();
    if (self->_tileSetsCount)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        PBDataWriterPlaceMark();
        PBDataWriterWriteUint32Field();
        PBDataWriterWriteUint32Field();
        PBDataWriterRecallMark();
        ++v7;
        v6 += 8;
      }
      while (v7 < self->_tileSetsCount);
    }
    if (self->_styleSheetIndexs.count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v8;
      }
      while (v8 < self->_styleSheetIndexs.count);
    }
    if (self->_textureIndexs.count)
    {
      v9 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v9 < self->_textureIndexs.count);
    }
    if (self->_fontIndexs.count)
    {
      v10 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v10;
      }
      while (v10 < self->_fontIndexs.count);
    }
    if (self->_iconIndexs.count)
    {
      v11 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v11;
      }
      while (v11 < self->_iconIndexs.count);
    }
    if (self->_regionalResourceIndexsCount)
    {
      v12 = 0;
      v13 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEORegionalResourceIndexWriteTo((uint64_t)&self->_regionalResourceIndexs[v12]);
        PBDataWriterRecallMark();
        ++v13;
        ++v12;
      }
      while (v13 < self->_regionalResourceIndexsCount);
    }
    if (self->_xmlIndexs.count)
    {
      v14 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v14;
      }
      while (v14 < self->_xmlIndexs.count);
    }
    if (self->_attributionIndexs.count)
    {
      v15 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v15;
      }
      while (v15 < self->_attributionIndexs.count);
    }
    if (self->_hybridUnavailableRegionsCount)
    {
      v16 = 0;
      v17 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v17;
        v16 += 24;
      }
      while (v17 < self->_hybridUnavailableRegionsCount);
    }
    if (self->_resourceIndexs.count)
    {
      v18 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v18;
      }
      while (v18 < self->_resourceIndexs.count);
    }
    flags = (__int16)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  unint64_t v14;
  unint64_t v15;
  uint64_t m;
  unint64_t v17;
  unint64_t v18;
  uint64_t n;
  unint64_t v20;
  unint64_t v21;
  uint64_t ii;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t jj;
  unint64_t v28;
  unint64_t v29;
  uint64_t kk;
  unint64_t v31;
  unint64_t v32;
  uint64_t mm;
  unint64_t v34;
  unint64_t v35;
  uint64_t nn;
  __int16 flags;
  _BYTE v38[24];

  v4 = (id *)a3;
  -[GEOTileGroup readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 66) = self->_readerMarkPos;
  *((_DWORD *)v4 + 67) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_DWORD *)v4 + 69) = self->_identifier;
  if (-[GEOTileGroup tileSetsCount](self, "tileSetsCount"))
  {
    objc_msgSend(v4, "clearTileSets");
    v5 = -[GEOTileGroup tileSetsCount](self, "tileSetsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v4, "addTileSet:", -[GEOTileGroup tileSetAtIndex:](self, "tileSetAtIndex:", i));
    }
  }
  if (-[GEOTileGroup styleSheetIndexsCount](self, "styleSheetIndexsCount"))
  {
    objc_msgSend(v4, "clearStyleSheetIndexs");
    v8 = -[GEOTileGroup styleSheetIndexsCount](self, "styleSheetIndexsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(v4, "addStyleSheetIndex:", -[GEOTileGroup styleSheetIndexAtIndex:](self, "styleSheetIndexAtIndex:", j));
    }
  }
  if (-[GEOTileGroup textureIndexsCount](self, "textureIndexsCount"))
  {
    objc_msgSend(v4, "clearTextureIndexs");
    v11 = -[GEOTileGroup textureIndexsCount](self, "textureIndexsCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(v4, "addTextureIndex:", -[GEOTileGroup textureIndexAtIndex:](self, "textureIndexAtIndex:", k));
    }
  }
  if (-[GEOTileGroup fontIndexsCount](self, "fontIndexsCount"))
  {
    objc_msgSend(v4, "clearFontIndexs");
    v14 = -[GEOTileGroup fontIndexsCount](self, "fontIndexsCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(v4, "addFontIndex:", -[GEOTileGroup fontIndexAtIndex:](self, "fontIndexAtIndex:", m));
    }
  }
  if (-[GEOTileGroup iconIndexsCount](self, "iconIndexsCount"))
  {
    objc_msgSend(v4, "clearIconIndexs");
    v17 = -[GEOTileGroup iconIndexsCount](self, "iconIndexsCount");
    if (v17)
    {
      v18 = v17;
      for (n = 0; n != v18; ++n)
        objc_msgSend(v4, "addIconIndex:", -[GEOTileGroup iconIndexAtIndex:](self, "iconIndexAtIndex:", n));
    }
  }
  if (-[GEOTileGroup regionalResourceIndexsCount](self, "regionalResourceIndexsCount"))
  {
    objc_msgSend(v4, "clearRegionalResourceIndexs");
    v20 = -[GEOTileGroup regionalResourceIndexsCount](self, "regionalResourceIndexsCount");
    if (v20)
    {
      v21 = v20;
      for (ii = 0; ii != v21; ++ii)
      {
        v23 = -[GEOTileGroup regionalResourceIndexAtIndex:](self, "regionalResourceIndexAtIndex:", ii);
        objc_msgSend(v4, "addRegionalResourceIndex:", v23, v24);
      }
    }
  }
  if (-[GEOTileGroup xmlIndexsCount](self, "xmlIndexsCount"))
  {
    objc_msgSend(v4, "clearXmlIndexs");
    v25 = -[GEOTileGroup xmlIndexsCount](self, "xmlIndexsCount");
    if (v25)
    {
      v26 = v25;
      for (jj = 0; jj != v26; ++jj)
        objc_msgSend(v4, "addXmlIndex:", -[GEOTileGroup xmlIndexAtIndex:](self, "xmlIndexAtIndex:", jj));
    }
  }
  if (-[GEOTileGroup attributionIndexsCount](self, "attributionIndexsCount"))
  {
    objc_msgSend(v4, "clearAttributionIndexs");
    v28 = -[GEOTileGroup attributionIndexsCount](self, "attributionIndexsCount");
    if (v28)
    {
      v29 = v28;
      for (kk = 0; kk != v29; ++kk)
        objc_msgSend(v4, "addAttributionIndex:", -[GEOTileGroup attributionIndexAtIndex:](self, "attributionIndexAtIndex:", kk));
    }
  }
  if (-[GEOTileGroup hybridUnavailableRegionsCount](self, "hybridUnavailableRegionsCount"))
  {
    objc_msgSend(v4, "clearHybridUnavailableRegions");
    v31 = -[GEOTileGroup hybridUnavailableRegionsCount](self, "hybridUnavailableRegionsCount");
    if (v31)
    {
      v32 = v31;
      for (mm = 0; mm != v32; ++mm)
      {
        -[GEOTileGroup hybridUnavailableRegionAtIndex:](self, "hybridUnavailableRegionAtIndex:", mm);
        objc_msgSend(v4, "addHybridUnavailableRegion:", v38);
      }
    }
  }
  if (-[GEOTileGroup resourceIndexsCount](self, "resourceIndexsCount"))
  {
    objc_msgSend(v4, "clearResourceIndexs");
    v34 = -[GEOTileGroup resourceIndexsCount](self, "resourceIndexsCount");
    if (v34)
    {
      v35 = v34;
      for (nn = 0; nn != v35; ++nn)
        objc_msgSend(v4, "addResourceIndex:", -[GEOTileGroup resourceIndexAtIndex:](self, "resourceIndexAtIndex:", nn));
    }
  }
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v4 + 70) = self->_muninVersionIndex;
    *((_WORD *)v4 + 144) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 71) = self->_offlineMetadataIndex;
    *((_WORD *)v4 + 144) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  PBDataReader *reader;
  PBDataReader *v6;
  id v7;
  unint64_t tileSetsCount;
  unint64_t regionalResourceIndexsCount;
  unint64_t hybridUnavailableRegionsCount;
  __int16 flags;
  PBUnknownFields *v12;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v6 = reader;
    objc_sync_enter(v6);
    if ((*(_WORD *)&self->_flags & 0x2000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTileGroupReadAllFrom(v4, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v7 = (id)v4;
      objc_sync_exit(v6);

      goto LABEL_16;
    }
    objc_sync_exit(v6);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTileGroup readAll:](self, "readAll:", 0);
  *(_DWORD *)(v4 + 276) = self->_identifier;
  tileSetsCount = self->_tileSetsCount;
  if (tileSetsCount)
  {
    -[GEOTileGroup _reserveTileSets:](v4, tileSetsCount);
    memcpy(*(void **)(v4 + 216), self->_tileSets, 8 * self->_tileSetsCount);
    *(_QWORD *)(v4 + 224) = self->_tileSetsCount;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  regionalResourceIndexsCount = self->_regionalResourceIndexsCount;
  if (regionalResourceIndexsCount)
  {
    -[GEOTileGroup _reserveRegionalResourceIndexs:](v4, regionalResourceIndexsCount);
    memcpy(*(void **)(v4 + 120), self->_regionalResourceIndexs, 16 * self->_regionalResourceIndexsCount);
    *(_QWORD *)(v4 + 128) = self->_regionalResourceIndexsCount;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  hybridUnavailableRegionsCount = self->_hybridUnavailableRegionsCount;
  if (hybridUnavailableRegionsCount)
  {
    -[GEOTileGroup _reserveHybridUnavailableRegions:](v4, hybridUnavailableRegionsCount);
    memcpy(*(void **)(v4 + 72), self->_hybridUnavailableRegions, 24 * self->_hybridUnavailableRegionsCount);
    *(_QWORD *)(v4 + 80) = self->_hybridUnavailableRegionsCount;
  }
  PBRepeatedUInt32Copy();
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 280) = self->_muninVersionIndex;
    *(_WORD *)(v4 + 288) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 284) = self->_offlineMetadataIndex;
    *(_WORD *)(v4 + 288) |= 2u;
  }
  v12 = self->_unknownFields;
  v7 = *(id *)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v12;
LABEL_16:

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  unint64_t tileSetsCount;
  unint64_t regionalResourceIndexsCount;
  unint64_t hybridUnavailableRegionsCount;
  __int16 flags;
  __int16 v9;
  BOOL v10;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  -[GEOTileGroup readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (self->_identifier != *((_DWORD *)v4 + 69))
    goto LABEL_26;
  tileSetsCount = self->_tileSetsCount;
  if ((const void *)tileSetsCount != v4[28])
    goto LABEL_26;
  if (memcmp(self->_tileSets, v4[27], 8 * tileSetsCount))
    goto LABEL_26;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_26;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_26;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_26;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_26;
  regionalResourceIndexsCount = self->_regionalResourceIndexsCount;
  if ((const void *)regionalResourceIndexsCount != v4[16])
    goto LABEL_26;
  if (memcmp(self->_regionalResourceIndexs, v4[15], 16 * regionalResourceIndexsCount))
    goto LABEL_26;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_26;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_26;
  hybridUnavailableRegionsCount = self->_hybridUnavailableRegionsCount;
  if ((const void *)hybridUnavailableRegionsCount != v4[10]
    || memcmp(self->_hybridUnavailableRegions, v4[9], 24 * hybridUnavailableRegionsCount)
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_26;
  }
  flags = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 144);
  if ((flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_muninVersionIndex != *((_DWORD *)v4 + 70))
      goto LABEL_26;
  }
  else if ((v9 & 1) != 0)
  {
LABEL_26:
    v10 = 0;
    goto LABEL_27;
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_offlineMetadataIndex != *((_DWORD *)v4 + 71))
      goto LABEL_26;
    v10 = 1;
  }
  else
  {
    v10 = (v9 & 2) == 0;
  }
LABEL_27:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 flags;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  unsigned int identifier;

  -[GEOTileGroup readAll:](self, "readAll:", 1);
  identifier = self->_identifier;
  v16 = PBHashBytes();
  v3 = PBRepeatedUInt32Hash();
  v4 = PBRepeatedUInt32Hash();
  v5 = PBRepeatedUInt32Hash();
  v6 = PBRepeatedUInt32Hash();
  v7 = PBHashBytes();
  v8 = PBRepeatedUInt32Hash();
  v9 = PBRepeatedUInt32Hash();
  v10 = PBHashBytes();
  v11 = PBRepeatedUInt32Hash();
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
    v13 = 2654435761 * self->_muninVersionIndex;
  else
    v13 = 0;
  if ((flags & 2) != 0)
    v14 = 2654435761 * self->_offlineMetadataIndex;
  else
    v14 = 0;
  return v16 ^ v3 ^ v4 ^ (2654435761 * identifier) ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  uint64_t v14;
  uint64_t v15;
  uint64_t m;
  uint64_t v17;
  uint64_t v18;
  uint64_t n;
  uint64_t v20;
  uint64_t v21;
  uint64_t ii;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t jj;
  uint64_t v28;
  uint64_t v29;
  uint64_t kk;
  uint64_t v31;
  uint64_t v32;
  uint64_t mm;
  uint64_t v34;
  uint64_t v35;
  uint64_t nn;
  __int16 v37;
  _QWORD v38[3];

  v4 = (unsigned int *)a3;
  objc_msgSend(v4, "readAll:", 0);
  self->_identifier = v4[69];
  v5 = objc_msgSend(v4, "tileSetsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[GEOTileGroup addTileSet:](self, "addTileSet:", objc_msgSend(v4, "tileSetAtIndex:", i));
  }
  v8 = objc_msgSend(v4, "styleSheetIndexsCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[GEOTileGroup addStyleSheetIndex:](self, "addStyleSheetIndex:", objc_msgSend(v4, "styleSheetIndexAtIndex:", j));
  }
  v11 = objc_msgSend(v4, "textureIndexsCount");
  if (v11)
  {
    v12 = v11;
    for (k = 0; k != v12; ++k)
      -[GEOTileGroup addTextureIndex:](self, "addTextureIndex:", objc_msgSend(v4, "textureIndexAtIndex:", k));
  }
  v14 = objc_msgSend(v4, "fontIndexsCount");
  if (v14)
  {
    v15 = v14;
    for (m = 0; m != v15; ++m)
      -[GEOTileGroup addFontIndex:](self, "addFontIndex:", objc_msgSend(v4, "fontIndexAtIndex:", m));
  }
  v17 = objc_msgSend(v4, "iconIndexsCount");
  if (v17)
  {
    v18 = v17;
    for (n = 0; n != v18; ++n)
      -[GEOTileGroup addIconIndex:](self, "addIconIndex:", objc_msgSend(v4, "iconIndexAtIndex:", n));
  }
  v20 = objc_msgSend(v4, "regionalResourceIndexsCount");
  if (v20)
  {
    v21 = v20;
    for (ii = 0; ii != v21; ++ii)
    {
      v23 = objc_msgSend(v4, "regionalResourceIndexAtIndex:", ii);
      -[GEOTileGroup addRegionalResourceIndex:](self, "addRegionalResourceIndex:", v23, v24);
    }
  }
  v25 = objc_msgSend(v4, "xmlIndexsCount");
  if (v25)
  {
    v26 = v25;
    for (jj = 0; jj != v26; ++jj)
      -[GEOTileGroup addXmlIndex:](self, "addXmlIndex:", objc_msgSend(v4, "xmlIndexAtIndex:", jj));
  }
  v28 = objc_msgSend(v4, "attributionIndexsCount");
  if (v28)
  {
    v29 = v28;
    for (kk = 0; kk != v29; ++kk)
      -[GEOTileGroup addAttributionIndex:](self, "addAttributionIndex:", objc_msgSend(v4, "attributionIndexAtIndex:", kk));
  }
  v31 = objc_msgSend(v4, "hybridUnavailableRegionsCount");
  if (v31)
  {
    v32 = v31;
    for (mm = 0; mm != v32; ++mm)
    {
      if (v4)
        objc_msgSend(v4, "hybridUnavailableRegionAtIndex:", mm);
      else
        memset(v38, 0, sizeof(v38));
      -[GEOTileGroup addHybridUnavailableRegion:](self, "addHybridUnavailableRegion:", v38);
    }
  }
  v34 = objc_msgSend(v4, "resourceIndexsCount");
  if (v34)
  {
    v35 = v34;
    for (nn = 0; nn != v35; ++nn)
      -[GEOTileGroup addResourceIndex:](self, "addResourceIndex:", objc_msgSend(v4, "resourceIndexAtIndex:", nn));
  }
  v37 = *((_WORD *)v4 + 144);
  if ((v37 & 1) != 0)
  {
    self->_muninVersionIndex = v4[70];
    *(_WORD *)&self->_flags |= 1u;
    v37 = *((_WORD *)v4 + 144);
  }
  if ((v37 & 2) != 0)
  {
    self->_offlineMetadataIndex = v4[71];
    *(_WORD *)&self->_flags |= 2u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTileGroupReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_1171);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2004u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOTileGroup readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
