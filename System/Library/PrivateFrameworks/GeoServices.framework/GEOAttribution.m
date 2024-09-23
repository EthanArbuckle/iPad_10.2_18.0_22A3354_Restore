@implementation GEOAttribution

- (GEOAttribution)init
{
  GEOAttribution *v2;
  GEOAttribution *v3;
  GEOAttribution *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAttribution;
  v2 = -[GEOAttribution init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (NSMutableArray)resources
{
  -[GEOAttribution _readResources]((uint64_t)self);
  return self->_resources;
}

- (void)_readResources
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResources_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSString)url
{
  -[GEOAttribution _readUrl]((uint64_t)self);
  return self->_url;
}

- (void)_readUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUrl_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (GEOTileSetRegion)regionAtIndex:(SEL)a3
{
  GEOTileSetRegion *result;
  unint64_t regionsCount;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  GEOTileSetRegion *v13;

  -[GEOAttribution _readRegions]((uint64_t)self);
  regionsCount = self->_regionsCount;
  if (regionsCount <= a4)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a4, regionsCount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise");

  }
  v13 = &self->_regions[a4];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v13->var0;
  *(_QWORD *)&retstr->var4 = *(_QWORD *)&v13->var4;
  return result;
}

- (unint64_t)regionsCount
{
  -[GEOAttribution _readRegions]((uint64_t)self);
  return self->_regionsCount;
}

- (void)_readRegions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegions_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
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
      v8 = (int *)&readAll__recursiveTag_16;
    else
      v8 = (int *)&readAll__nonRecursiveTag_16;
    GEOAttributionReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOAttributionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

- (uint64_t)_reserveRegions:(uint64_t)a1
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
    v4 = *(_QWORD *)(a1 + 32);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 40);
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
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 24 * v9, 0xA796A5AEuLL);
    if (result)
    {
      *(_QWORD *)(a1 + 40) = v9;
      *(_QWORD *)(a1 + 24) = result;
      bzero((void *)(result + 24 * *(_QWORD *)(a1 + 32)), 24 * (v9 - *(_QWORD *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (void)_addNoFlagsResource:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 104);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v5;

      v4 = *(void **)(a1 + 104);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (GEOAttribution)initWithData:(id)a3
{
  GEOAttribution *v3;
  GEOAttribution *v4;
  GEOAttribution *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAttribution;
  v3 = -[GEOAttribution initWithData:](&v7, sel_initWithData_, a3);
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

  -[GEOAttribution clearRegions](self, "clearRegions");
  v3.receiver = self;
  v3.super_class = (Class)GEOAttribution;
  -[GEOAttribution dealloc](&v3, sel_dealloc);
}

- (void)_readBadge
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBadge_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasBadge
{
  -[GEOAttribution _readBadge]((uint64_t)self);
  return self->_badge != 0;
}

- (NSString)badge
{
  -[GEOAttribution _readBadge]((uint64_t)self);
  return self->_badge;
}

- (void)setBadge:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2020u;
  objc_storeStrong((id *)&self->_badge, a3);
}

- (void)_readLogo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLogo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasLogo
{
  -[GEOAttribution _readLogo]((uint64_t)self);
  return self->_logo != 0;
}

- (NSString)logo
{
  -[GEOAttribution _readLogo]((uint64_t)self);
  return self->_logo;
}

- (void)setLogo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2080u;
  objc_storeStrong((id *)&self->_logo, a3);
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasName
{
  -[GEOAttribution _readName]((uint64_t)self);
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOAttribution _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2100u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)hasUrl
{
  -[GEOAttribution _readUrl]((uint64_t)self);
  return self->_url != 0;
}

- (void)setUrl:(id)a3
{
  *(_WORD *)&self->_flags |= 0x3000u;
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)_readBadgeChecksum
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBadgeChecksum_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasBadgeChecksum
{
  -[GEOAttribution _readBadgeChecksum]((uint64_t)self);
  return self->_badgeChecksum != 0;
}

- (NSString)badgeChecksum
{
  -[GEOAttribution _readBadgeChecksum]((uint64_t)self);
  return self->_badgeChecksum;
}

- (void)setBadgeChecksum:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  objc_storeStrong((id *)&self->_badgeChecksum, a3);
}

- (void)_readLogoChecksum
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLogoChecksum_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasLogoChecksum
{
  -[GEOAttribution _readLogoChecksum]((uint64_t)self);
  return self->_logoChecksum != 0;
}

- (NSString)logoChecksum
{
  -[GEOAttribution _readLogoChecksum]((uint64_t)self);
  return self->_logoChecksum;
}

- (void)setLogoChecksum:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2040u;
  objc_storeStrong((id *)&self->_logoChecksum, a3);
}

- (void)setResources:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *resources;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  resources = self->_resources;
  self->_resources = v4;

}

- (void)clearResources
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[NSMutableArray removeAllObjects](self->_resources, "removeAllObjects");
}

- (void)addResource:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOAttribution _readResources]((uint64_t)self);
  -[GEOAttribution _addNoFlagsResource:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unint64_t)resourcesCount
{
  -[GEOAttribution _readResources]((uint64_t)self);
  return -[NSMutableArray count](self->_resources, "count");
}

- (id)resourceAtIndex:(unint64_t)a3
{
  -[GEOAttribution _readResources]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_resources, "objectAtIndex:", a3);
}

+ (Class)resourceType
{
  return (Class)objc_opt_class();
}

- (GEOTileSetRegion)regions
{
  -[GEOAttribution _readRegions]((uint64_t)self);
  return self->_regions;
}

- (void)clearRegions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_regionsSpace = 0;
  self->_regionsCount = 0;
  free(self->_regions);
  self->_regions = 0;
}

- (void)addRegion:(GEOTileSetRegion *)a3
{
  GEOTileSetRegion v5;

  -[GEOAttribution _readRegions]((uint64_t)self);
  v5 = *a3;
  if (self && -[GEOAttribution _reserveRegions:]((uint64_t)self, 1uLL))
    self->_regions[self->_regionsCount++] = v5;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)setRegions:(GEOTileSetRegion *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[GEOAttribution clearRegions](self, "clearRegions");
  if (-[GEOAttribution _reserveRegions:]((uint64_t)self, a4))
  {
    memcpy(self->_regions, a3, 24 * a4);
    self->_regionsCount = a4;
  }
}

- (unsigned)dataSet
{
  return self->_dataSet;
}

- (void)setDataSet:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_dataSet = a3;
}

- (void)setHasDataSet:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasDataSet
{
  return *(_WORD *)&self->_flags & 1;
}

- (unsigned)linkDisplayStringIndex
{
  return self->_linkDisplayStringIndex;
}

- (void)setLinkDisplayStringIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_linkDisplayStringIndex = a3;
}

- (void)setHasLinkDisplayStringIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8194;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasLinkDisplayStringIndex
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readPlainTextURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlainTextURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasPlainTextURL
{
  -[GEOAttribution _readPlainTextURL]((uint64_t)self);
  return self->_plainTextURL != 0;
}

- (NSString)plainTextURL
{
  -[GEOAttribution _readPlainTextURL]((uint64_t)self);
  return self->_plainTextURL;
}

- (void)setPlainTextURL:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2400u;
  objc_storeStrong((id *)&self->_plainTextURL, a3);
}

- (void)_readPlainTextURLSHA256Checksum
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlainTextURLSHA256Checksum_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasPlainTextURLSHA256Checksum
{
  -[GEOAttribution _readPlainTextURLSHA256Checksum]((uint64_t)self);
  return self->_plainTextURLSHA256Checksum != 0;
}

- (NSData)plainTextURLSHA256Checksum
{
  -[GEOAttribution _readPlainTextURLSHA256Checksum]((uint64_t)self);
  return self->_plainTextURLSHA256Checksum;
}

- (void)setPlainTextURLSHA256Checksum:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2200u;
  objc_storeStrong((id *)&self->_plainTextURLSHA256Checksum, a3);
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
  v8.super_class = (Class)GEOAttribution;
  -[GEOAttribution description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAttribution dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAttribution _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  __int16 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "badge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("badge"));

  objc_msgSend((id)a1, "logo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("logo"));

  objc_msgSend((id)a1, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("name"));

  objc_msgSend((id)a1, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("url"));

  objc_msgSend((id)a1, "badgeChecksum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("badgeChecksum"));

  objc_msgSend((id)a1, "logoChecksum");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("logoChecksum"));

  if (objc_msgSend(*(id *)(a1 + 104), "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v12 = *(id *)(a1 + 104);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v40 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v17, "jsonRepresentation");
          else
            objc_msgSend(v17, "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v14);
    }

    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("resource"));
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
    {
      v20 = 0;
      v21 = 0;
      do
      {
        _GEOTileSetRegionDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 24) + v20));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v22);

        ++v21;
        v20 += 24;
      }
      while (v21 < *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("region"));

  }
  v23 = *(_WORD *)(a1 + 140);
  if ((v23 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 132));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("dataSet"));

    v23 = *(_WORD *)(a1 + 140);
  }
  if ((v23 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 136));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("linkDisplayStringIndex"));

  }
  objc_msgSend((id)a1, "plainTextURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("plainTextURL"));

  objc_msgSend((id)a1, "plainTextURLSHA256Checksum");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v27, "base64EncodedStringWithOptions:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("plainTextURLSHA256Checksum"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("plainTextURLSHA256Checksum"));
    }
  }

  v30 = *(void **)(a1 + 16);
  if (v30)
  {
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __44__GEOAttribution__dictionaryRepresentation___block_invoke;
      v37[3] = &unk_1E1C00600;
      v34 = v33;
      v38 = v34;
      objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v37);
      v35 = v34;

      v32 = v35;
    }
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAttribution _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOAttribution__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOAttribution)initWithDictionary:(id)a3
{
  return (GEOAttribution *)-[GEOAttribution _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  GEOResource *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("badge"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setBadge:", v7);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("logo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(a1, "setLogo:", v9);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setName:", v11);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(a1, "setUrl:", v13);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("badgeChecksum"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(a1, "setBadgeChecksum:", v15);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("logoChecksum"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(a1, "setLogoChecksum:", v17);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resource"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v42 = v18;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v52 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v25 = [GEOResource alloc];
                if ((a3 & 1) != 0)
                  v26 = -[GEOResource initWithJSON:](v25, "initWithJSON:", v24);
                else
                  v26 = -[GEOResource initWithDictionary:](v25, "initWithDictionary:", v24);
                v27 = (void *)v26;
                objc_msgSend(a1, "addResource:", v26);

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
          }
          while (v21);
        }

        v18 = v42;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("region"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v29 = v28;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v48;
          do
          {
            for (j = 0; j != v31; ++j)
            {
              if (*(_QWORD *)v48 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v45 = 0uLL;
                v46 = 0;
                _GEOTileSetRegionFromDictionaryRepresentation(v34, &v45);
                v43 = v45;
                v44 = v46;
                objc_msgSend(a1, "addRegion:", &v43);
              }
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          }
          while (v31);
        }

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dataSet"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDataSet:", objc_msgSend(v35, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("linkDisplayStringIndex"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLinkDisplayStringIndex:", objc_msgSend(v36, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("plainTextURL"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = (void *)objc_msgSend(v37, "copy");
        objc_msgSend(a1, "setPlainTextURL:", v38);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("plainTextURLSHA256Checksum"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v39, 0);
        objc_msgSend(a1, "setPlainTextURLSHA256Checksum:", v40);

      }
    }
  }

  return a1;
}

- (GEOAttribution)initWithJSON:(id)a3
{
  return (GEOAttribution *)-[GEOAttribution _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAttributionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAttributionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  unint64_t v11;
  __int16 flags;
  PBDataReader *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3FF8) == 0))
  {
    v13 = self->_reader;
    objc_sync_enter(v13);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v14);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOAttribution readAll:](self, "readAll:", 0);
    if (self->_badge)
      PBDataWriterWriteStringField();
    if (self->_logo)
      PBDataWriterWriteStringField();
    if (self->_name)
      PBDataWriterWriteStringField();
    if (self->_url)
      PBDataWriterWriteStringField();
    if (self->_badgeChecksum)
      PBDataWriterWriteStringField();
    if (self->_logoChecksum)
      PBDataWriterWriteStringField();
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_resources;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    if (self->_regionsCount)
    {
      v10 = 0;
      v11 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v11;
        v10 += 24;
      }
      while (v11 < self->_regionsCount);
    }
    flags = (__int16)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_plainTextURL)
      PBDataWriterWriteStringField();
    if (self->_plainTextURLSHA256Checksum)
      PBDataWriterWriteDataField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  __int16 flags;
  _BYTE v13[24];

  v4 = (id *)a3;
  -[GEOAttribution readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 30) = self->_readerMarkPos;
  *((_DWORD *)v4 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_badge)
    objc_msgSend(v4, "setBadge:");
  if (self->_logo)
    objc_msgSend(v4, "setLogo:");
  if (self->_name)
    objc_msgSend(v4, "setName:");
  if (self->_url)
    objc_msgSend(v4, "setUrl:");
  if (self->_badgeChecksum)
    objc_msgSend(v4, "setBadgeChecksum:");
  if (self->_logoChecksum)
    objc_msgSend(v4, "setLogoChecksum:");
  if (-[GEOAttribution resourcesCount](self, "resourcesCount"))
  {
    objc_msgSend(v4, "clearResources");
    v5 = -[GEOAttribution resourcesCount](self, "resourcesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOAttribution resourceAtIndex:](self, "resourceAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addResource:", v8);

      }
    }
  }
  if (-[GEOAttribution regionsCount](self, "regionsCount"))
  {
    objc_msgSend(v4, "clearRegions");
    v9 = -[GEOAttribution regionsCount](self, "regionsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOAttribution regionAtIndex:](self, "regionAtIndex:", j);
        objc_msgSend(v4, "addRegion:", v13);
      }
    }
  }
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v4 + 33) = self->_dataSet;
    *((_WORD *)v4 + 70) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 34) = self->_linkDisplayStringIndex;
    *((_WORD *)v4 + 70) |= 2u;
  }
  if (self->_plainTextURL)
    objc_msgSend(v4, "setPlainTextURL:");
  if (self->_plainTextURLSHA256Checksum)
    objc_msgSend(v4, "setPlainTextURLSHA256Checksum:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  unint64_t regionsCount;
  __int16 flags;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  PBUnknownFields *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x2000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOAttributionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOAttribution readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_badge, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  v11 = -[NSString copyWithZone:](self->_logo, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v11;

  v13 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v13;

  v15 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v15;

  v17 = -[NSString copyWithZone:](self->_badgeChecksum, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v17;

  v19 = -[NSString copyWithZone:](self->_logoChecksum, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v19;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v21 = self->_resources;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v21);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v34);
        objc_msgSend((id)v5, "addResource:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v22);
  }

  regionsCount = self->_regionsCount;
  if (regionsCount)
  {
    -[GEOAttribution _reserveRegions:](v5, regionsCount);
    memcpy(*(void **)(v5 + 24), self->_regions, 24 * self->_regionsCount);
    *(_QWORD *)(v5 + 32) = self->_regionsCount;
  }
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_dataSet;
    *(_WORD *)(v5 + 140) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_linkDisplayStringIndex;
    *(_WORD *)(v5 + 140) |= 2u;
  }
  v28 = -[NSString copyWithZone:](self->_plainTextURL, "copyWithZone:", a3, (_QWORD)v34);
  v29 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v28;

  v30 = -[NSData copyWithZone:](self->_plainTextURLSHA256Checksum, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v30;

  v32 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v32;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  NSString *badge;
  NSString *logo;
  NSString *name;
  NSString *url;
  NSString *badgeChecksum;
  NSString *logoChecksum;
  NSMutableArray *resources;
  unint64_t regionsCount;
  char v13;
  __int16 flags;
  __int16 v16;
  NSString *plainTextURL;
  NSData *plainTextURLSHA256Checksum;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEOAttribution readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  badge = self->_badge;
  if ((unint64_t)badge | (unint64_t)v4[7])
  {
    if (!-[NSString isEqual:](badge, "isEqual:"))
      goto LABEL_18;
  }
  logo = self->_logo;
  if ((unint64_t)logo | (unint64_t)v4[9])
  {
    if (!-[NSString isEqual:](logo, "isEqual:"))
      goto LABEL_18;
  }
  name = self->_name;
  if ((unint64_t)name | (unint64_t)v4[10])
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_18;
  }
  url = self->_url;
  if ((unint64_t)url | (unint64_t)v4[14])
  {
    if (!-[NSString isEqual:](url, "isEqual:"))
      goto LABEL_18;
  }
  badgeChecksum = self->_badgeChecksum;
  if ((unint64_t)badgeChecksum | (unint64_t)v4[6])
  {
    if (!-[NSString isEqual:](badgeChecksum, "isEqual:"))
      goto LABEL_18;
  }
  logoChecksum = self->_logoChecksum;
  if ((unint64_t)logoChecksum | (unint64_t)v4[8])
  {
    if (!-[NSString isEqual:](logoChecksum, "isEqual:"))
      goto LABEL_18;
  }
  resources = self->_resources;
  if ((unint64_t)resources | (unint64_t)v4[13])
  {
    if (!-[NSMutableArray isEqual:](resources, "isEqual:"))
      goto LABEL_18;
  }
  regionsCount = self->_regionsCount;
  if ((const void *)regionsCount != v4[4] || memcmp(self->_regions, v4[3], 24 * regionsCount))
    goto LABEL_18;
  flags = (__int16)self->_flags;
  v16 = *((_WORD *)v4 + 70);
  if ((flags & 1) != 0)
  {
    if ((v16 & 1) == 0 || self->_dataSet != *((_DWORD *)v4 + 33))
      goto LABEL_18;
  }
  else if ((v16 & 1) != 0)
  {
    goto LABEL_18;
  }
  if ((flags & 2) == 0)
  {
    if ((v16 & 2) == 0)
      goto LABEL_30;
LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }
  if ((v16 & 2) == 0 || self->_linkDisplayStringIndex != *((_DWORD *)v4 + 34))
    goto LABEL_18;
LABEL_30:
  plainTextURL = self->_plainTextURL;
  if ((unint64_t)plainTextURL | (unint64_t)v4[12]
    && !-[NSString isEqual:](plainTextURL, "isEqual:"))
  {
    goto LABEL_18;
  }
  plainTextURLSHA256Checksum = self->_plainTextURLSHA256Checksum;
  if ((unint64_t)plainTextURLSHA256Checksum | (unint64_t)v4[11])
    v13 = -[NSData isEqual:](plainTextURLSHA256Checksum, "isEqual:");
  else
    v13 = 1;
LABEL_19:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  __int16 flags;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;

  -[GEOAttribution readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_badge, "hash");
  v4 = -[NSString hash](self->_logo, "hash");
  v5 = -[NSString hash](self->_name, "hash");
  v6 = -[NSString hash](self->_url, "hash");
  v7 = -[NSString hash](self->_badgeChecksum, "hash");
  v8 = -[NSString hash](self->_logoChecksum, "hash");
  v9 = -[NSMutableArray hash](self->_resources, "hash");
  v10 = PBHashBytes();
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    v12 = 2654435761 * self->_dataSet;
    if ((flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = 0;
  if ((flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v13 = 2654435761 * self->_linkDisplayStringIndex;
LABEL_6:
  v14 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  v15 = v12 ^ v13 ^ -[NSString hash](self->_plainTextURL, "hash");
  return v14 ^ v15 ^ -[NSData hash](self->_plainTextURLSHA256Checksum, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int16 v13;
  _QWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 7))
    -[GEOAttribution setBadge:](self, "setBadge:");
  if (*((_QWORD *)v4 + 9))
    -[GEOAttribution setLogo:](self, "setLogo:");
  if (*((_QWORD *)v4 + 10))
    -[GEOAttribution setName:](self, "setName:");
  if (*((_QWORD *)v4 + 14))
    -[GEOAttribution setUrl:](self, "setUrl:");
  if (*((_QWORD *)v4 + 6))
    -[GEOAttribution setBadgeChecksum:](self, "setBadgeChecksum:");
  if (*((_QWORD *)v4 + 8))
    -[GEOAttribution setLogoChecksum:](self, "setLogoChecksum:");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *((id *)v4 + 13);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        -[GEOAttribution addResource:](self, "addResource:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v10 = objc_msgSend(v4, "regionsCount");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
    {
      if (v4)
        objc_msgSend(v4, "regionAtIndex:", j);
      else
        memset(v14, 0, sizeof(v14));
      -[GEOAttribution addRegion:](self, "addRegion:", v14);
    }
  }
  v13 = *((_WORD *)v4 + 70);
  if ((v13 & 1) != 0)
  {
    self->_dataSet = *((_DWORD *)v4 + 33);
    *(_WORD *)&self->_flags |= 1u;
    v13 = *((_WORD *)v4 + 70);
  }
  if ((v13 & 2) != 0)
  {
    self->_linkDisplayStringIndex = *((_DWORD *)v4 + 34);
    *(_WORD *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 12))
    -[GEOAttribution setPlainTextURL:](self, "setPlainTextURL:");
  if (*((_QWORD *)v4 + 11))
    -[GEOAttribution setPlainTextURLSHA256Checksum:](self, "setPlainTextURLSHA256Checksum:");

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
      GEOAttributionReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_3);
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
  NSMutableArray *v7;
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

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2004u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOAttribution readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_resources;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_plainTextURL, 0);
  objc_storeStrong((id *)&self->_plainTextURLSHA256Checksum, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_logo, 0);
  objc_storeStrong((id *)&self->_logoChecksum, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_badgeChecksum, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
