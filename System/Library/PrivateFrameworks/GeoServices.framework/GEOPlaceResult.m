@implementation GEOPlaceResult

- (GEOPlaceResult)init
{
  GEOPlaceResult *v2;
  GEOPlaceResult *v3;
  GEOPlaceResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceResult;
  v2 = -[GEOPlaceResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPlaceResult)initWithData:(id)a3
{
  GEOPlaceResult *v3;
  GEOPlaceResult *v4;
  GEOPlaceResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPlaceResult;
  v3 = -[GEOPlaceResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPlace
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 145) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlace_tags_5);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (GEOPlace)place
{
  -[GEOPlaceResult _readPlace]((uint64_t)self);
  return self->_place;
}

- (void)setPlace:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10400u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (void)_readAdditionalPlaces
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 144) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdditionalPlaces_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)additionalPlaces
{
  -[GEOPlaceResult _readAdditionalPlaces]((uint64_t)self);
  return self->_additionalPlaces;
}

- (void)setAdditionalPlaces:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *additionalPlaces;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  additionalPlaces = self->_additionalPlaces;
  self->_additionalPlaces = v4;

}

- (void)clearAdditionalPlaces
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  -[NSMutableArray removeAllObjects](self->_additionalPlaces, "removeAllObjects");
}

- (void)addAdditionalPlace:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPlaceResult _readAdditionalPlaces]((uint64_t)self);
  -[GEOPlaceResult _addNoFlagsAdditionalPlace:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsAdditionalPlace:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)additionalPlacesCount
{
  -[GEOPlaceResult _readAdditionalPlaces]((uint64_t)self);
  return -[NSMutableArray count](self->_additionalPlaces, "count");
}

- (id)additionalPlaceAtIndex:(unint64_t)a3
{
  -[GEOPlaceResult _readAdditionalPlaces]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_additionalPlaces, "objectAtIndex:", a3);
}

+ (Class)additionalPlaceType
{
  return (Class)objc_opt_class();
}

- (void)_readSuggestedQuery
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 145) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestedQuery_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasSuggestedQuery
{
  -[GEOPlaceResult _readSuggestedQuery]((uint64_t)self);
  return self->_suggestedQuery != 0;
}

- (NSString)suggestedQuery
{
  -[GEOPlaceResult _readSuggestedQuery]((uint64_t)self);
  return self->_suggestedQuery;
}

- (void)setSuggestedQuery:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x12000u;
  objc_storeStrong((id *)&self->_suggestedQuery, a3);
}

- (unsigned)travelTime
{
  return self->_travelTime;
}

- (void)setTravelTime:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10008u;
  self->_travelTime = a3;
}

- (void)setHasTravelTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65544;
  else
    v3 = 0x10000;
  self->_flags = ($66C0C4ECE49E8B6147DBDEB385FCD304)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTravelTime
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unsigned)travelDistance
{
  return self->_travelDistance;
}

- (void)setTravelDistance:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10004u;
  self->_travelDistance = a3;
}

- (void)setHasTravelDistance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65540;
  else
    v3 = 0x10000;
  self->_flags = ($66C0C4ECE49E8B6147DBDEB385FCD304)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasTravelDistance
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readTokenEntity
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 145) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokenEntity_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasTokenEntity
{
  -[GEOPlaceResult _readTokenEntity]((uint64_t)self);
  return self->_tokenEntity != 0;
}

- (GEOAddress)tokenEntity
{
  -[GEOPlaceResult _readTokenEntity]((uint64_t)self);
  return self->_tokenEntity;
}

- (void)setTokenEntity:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x14000u;
  objc_storeStrong((id *)&self->_tokenEntity, a3);
}

- (void)_readQuad
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 145) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuad_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasQuad
{
  -[GEOPlaceResult _readQuad]((uint64_t)self);
  return self->_quad != 0;
}

- (NSString)quad
{
  -[GEOPlaceResult _readQuad]((uint64_t)self);
  return self->_quad;
}

- (void)setQuad:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10800u;
  objc_storeStrong((id *)&self->_quad, a3);
}

- (void)_readUnmatchedStrings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 145) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUnmatchedStrings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)unmatchedStrings
{
  -[GEOPlaceResult _readUnmatchedStrings]((uint64_t)self);
  return self->_unmatchedStrings;
}

- (void)setUnmatchedStrings:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *unmatchedStrings;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  unmatchedStrings = self->_unmatchedStrings;
  self->_unmatchedStrings = v4;

}

- (void)clearUnmatchedStrings
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  -[NSMutableArray removeAllObjects](self->_unmatchedStrings, "removeAllObjects");
}

- (void)addUnmatchedString:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPlaceResult _readUnmatchedStrings]((uint64_t)self);
  -[GEOPlaceResult _addNoFlagsUnmatchedString:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsUnmatchedString:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 112);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v5;

      v4 = *(void **)(a1 + 112);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)unmatchedStringsCount
{
  -[GEOPlaceResult _readUnmatchedStrings]((uint64_t)self);
  return -[NSMutableArray count](self->_unmatchedStrings, "count");
}

- (id)unmatchedStringAtIndex:(unint64_t)a3
{
  -[GEOPlaceResult _readUnmatchedStrings]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_unmatchedStrings, "objectAtIndex:", a3);
}

+ (Class)unmatchedStringType
{
  return (Class)objc_opt_class();
}

- (void)_readNamedFeatures
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 145) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNamedFeatures_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)namedFeatures
{
  -[GEOPlaceResult _readNamedFeatures]((uint64_t)self);
  return self->_namedFeatures;
}

- (void)setNamedFeatures:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *namedFeatures;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  namedFeatures = self->_namedFeatures;
  self->_namedFeatures = v4;

}

- (void)clearNamedFeatures
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  -[NSMutableArray removeAllObjects](self->_namedFeatures, "removeAllObjects");
}

- (void)addNamedFeature:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPlaceResult _readNamedFeatures]((uint64_t)self);
  -[GEOPlaceResult _addNoFlagsNamedFeature:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsNamedFeature:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)namedFeaturesCount
{
  -[GEOPlaceResult _readNamedFeatures]((uint64_t)self);
  return -[NSMutableArray count](self->_namedFeatures, "count");
}

- (id)namedFeatureAtIndex:(unint64_t)a3
{
  -[GEOPlaceResult _readNamedFeatures]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_namedFeatures, "objectAtIndex:", a3);
}

+ (Class)namedFeatureType
{
  return (Class)objc_opt_class();
}

- (void)_readRevgeoRequestTemplate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 145) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRevgeoRequestTemplate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasRevgeoRequestTemplate
{
  -[GEOPlaceResult _readRevgeoRequestTemplate]((uint64_t)self);
  return self->_revgeoRequestTemplate != 0;
}

- (GEOPlaceSearchRequest)revgeoRequestTemplate
{
  -[GEOPlaceResult _readRevgeoRequestTemplate]((uint64_t)self);
  return self->_revgeoRequestTemplate;
}

- (void)setRevgeoRequestTemplate:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x11000u;
  objc_storeStrong((id *)&self->_revgeoRequestTemplate, a3);
}

- (void)_readMatchedTokens
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 144) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMatchedTokens_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)matchedTokens
{
  -[GEOPlaceResult _readMatchedTokens]((uint64_t)self);
  return self->_matchedTokens;
}

- (void)setMatchedTokens:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *matchedTokens;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  matchedTokens = self->_matchedTokens;
  self->_matchedTokens = v4;

}

- (void)clearMatchedTokens
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  -[NSMutableArray removeAllObjects](self->_matchedTokens, "removeAllObjects");
}

- (void)addMatchedToken:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPlaceResult _readMatchedTokens]((uint64_t)self);
  -[GEOPlaceResult _addNoFlagsMatchedToken:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsMatchedToken:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)matchedTokensCount
{
  -[GEOPlaceResult _readMatchedTokens]((uint64_t)self);
  return -[NSMutableArray count](self->_matchedTokens, "count");
}

- (id)matchedTokenAtIndex:(unint64_t)a3
{
  -[GEOPlaceResult _readMatchedTokens]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_matchedTokens, "objectAtIndex:", a3);
}

+ (Class)matchedTokenType
{
  return (Class)objc_opt_class();
}

- (unint64_t)flyoverTourMuid
{
  return self->_flyoverTourMuid;
}

- (void)setFlyoverTourMuid:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x10001u;
  self->_flyoverTourMuid = a3;
}

- (void)setHasFlyoverTourMuid:(BOOL)a3
{
  self->_flags = ($66C0C4ECE49E8B6147DBDEB385FCD304)(*(_DWORD *)&self->_flags & 0xFFFEFFFE | a3 | 0x10000);
}

- (BOOL)hasFlyoverTourMuid
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)cacheControl
{
  os_unfair_lock_s *p_readerLock;
  $66C0C4ECE49E8B6147DBDEB385FCD304 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 2) != 0)
    return self->_cacheControl;
  else
    return 0;
}

- (void)setCacheControl:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10002u;
  self->_cacheControl = a3;
}

- (void)setHasCacheControl:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65538;
  else
    v3 = 0x10000;
  self->_flags = ($66C0C4ECE49E8B6147DBDEB385FCD304)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasCacheControl
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)cacheControlAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0F140[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCacheControl:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CACHEABILITY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNCACHEABLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CACHEABLE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readDisambiguationLabels
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 144) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisambiguationLabels_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)disambiguationLabels
{
  -[GEOPlaceResult _readDisambiguationLabels]((uint64_t)self);
  return self->_disambiguationLabels;
}

- (void)setDisambiguationLabels:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *disambiguationLabels;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  disambiguationLabels = self->_disambiguationLabels;
  self->_disambiguationLabels = v4;

}

- (void)clearDisambiguationLabels
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  -[NSMutableArray removeAllObjects](self->_disambiguationLabels, "removeAllObjects");
}

- (void)addDisambiguationLabel:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPlaceResult _readDisambiguationLabels]((uint64_t)self);
  -[GEOPlaceResult _addNoFlagsDisambiguationLabel:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsDisambiguationLabel:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)disambiguationLabelsCount
{
  -[GEOPlaceResult _readDisambiguationLabels]((uint64_t)self);
  return -[NSMutableArray count](self->_disambiguationLabels, "count");
}

- (id)disambiguationLabelAtIndex:(unint64_t)a3
{
  -[GEOPlaceResult _readDisambiguationLabels]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_disambiguationLabels, "objectAtIndex:", a3);
}

+ (Class)disambiguationLabelType
{
  return (Class)objc_opt_class();
}

- (void)_readNamedFields
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 145) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNamedFields_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)namedFields
{
  -[GEOPlaceResult _readNamedFields]((uint64_t)self);
  return self->_namedFields;
}

- (void)setNamedFields:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *namedFields;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  namedFields = self->_namedFields;
  self->_namedFields = v4;

}

- (void)clearNamedFields
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  -[NSMutableArray removeAllObjects](self->_namedFields, "removeAllObjects");
}

- (void)addNamedField:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPlaceResult _readNamedFields]((uint64_t)self);
  -[GEOPlaceResult _addNoFlagsNamedField:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsNamedField:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)namedFieldsCount
{
  -[GEOPlaceResult _readNamedFields]((uint64_t)self);
  return -[NSMutableArray count](self->_namedFields, "count");
}

- (id)namedFieldAtIndex:(unint64_t)a3
{
  -[GEOPlaceResult _readNamedFields]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_namedFields, "objectAtIndex:", a3);
}

+ (Class)namedFieldType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOPlaceResult;
  -[GEOPlaceResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPlaceResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPlaceResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  const __CFString *v46;
  uint64_t v47;
  __CFString *v48;
  const __CFString *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t n;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  _QWORD v74[4];
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
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
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "place");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("place"));

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v9 = *(id *)(a1 + 24);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v93;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v93 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("additionalPlace"));
  }
  objc_msgSend((id)a1, "suggestedQuery");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("suggestedQuery"));

  v17 = *(_DWORD *)(a1 + 144);
  if ((v17 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 140));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("travelTime"));

    v17 = *(_DWORD *)(a1 + 144);
  }
  if ((v17 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 136));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("travelDistance"));

  }
  objc_msgSend((id)a1, "tokenEntity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v20, "jsonRepresentation");
    else
      objc_msgSend(v20, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("tokenEntity"));

  }
  objc_msgSend((id)a1, "quad");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("quad"));

  if (*(_QWORD *)(a1 + 112))
  {
    objc_msgSend((id)a1, "unmatchedStrings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("unmatchedString"));

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v26 = *(id *)(a1 + 56);
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v89;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v89 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v31, "jsonRepresentation");
          else
            objc_msgSend(v31, "dictionaryRepresentation");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v32);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
      }
      while (v28);
    }

    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("namedFeature"));
  }
  objc_msgSend((id)a1, "revgeoRequestTemplate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v33, "jsonRepresentation");
    else
      objc_msgSend(v33, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("revgeoRequestTemplate"));

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v37 = *(id *)(a1 + 48);
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v85;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v85 != v40)
            objc_enumerationMutation(v37);
          v42 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v42, "jsonRepresentation");
          else
            objc_msgSend(v42, "dictionaryRepresentation");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v43);

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
      }
      while (v39);
    }

    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("matchedToken"));
  }
  v44 = *(_DWORD *)(a1 + 144);
  if ((v44 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v46 = CFSTR("flyoverTourMuid");
    else
      v46 = CFSTR("flyover_tour_muid");
    objc_msgSend(v4, "setObject:forKey:", v45, v46);

    v44 = *(_DWORD *)(a1 + 144);
  }
  if ((v44 & 2) != 0)
  {
    v47 = *(int *)(a1 + 132);
    if (v47 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 132));
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = off_1E1C0F140[v47];
    }
    if (a2)
      v49 = CFSTR("cacheControl");
    else
      v49 = CFSTR("cache_control");
    objc_msgSend(v4, "setObject:forKey:", v48, v49);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v51 = *(id *)(a1 + 32);
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v81;
      do
      {
        for (m = 0; m != v53; ++m)
        {
          if (*(_QWORD *)v81 != v54)
            objc_enumerationMutation(v51);
          v56 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v56, "jsonRepresentation");
          else
            objc_msgSend(v56, "dictionaryRepresentation");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v57);

        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
      }
      while (v53);
    }

    if (a2)
      v58 = CFSTR("disambiguationLabel");
    else
      v58 = CFSTR("disambiguation_label");
    objc_msgSend(v4, "setObject:forKey:", v50, v58);

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v60 = *(id *)(a1 + 64);
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v77;
      do
      {
        for (n = 0; n != v62; ++n)
        {
          if (*(_QWORD *)v77 != v63)
            objc_enumerationMutation(v60);
          v65 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v65, "jsonRepresentation");
          else
            objc_msgSend(v65, "dictionaryRepresentation");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "addObject:", v66);

        }
        v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
      }
      while (v62);
    }

    objc_msgSend(v4, "setObject:forKey:", v59, CFSTR("namedField"));
  }
  v67 = *(void **)(a1 + 16);
  if (v67)
  {
    objc_msgSend(v67, "dictionaryRepresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v68;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v68, "count"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __44__GEOPlaceResult__dictionaryRepresentation___block_invoke;
      v74[3] = &unk_1E1C00600;
      v71 = v70;
      v75 = v71;
      objc_msgSend(v69, "enumerateKeysAndObjectsUsingBlock:", v74);
      v72 = v71;

      v69 = v72;
    }
    objc_msgSend(v4, "setObject:forKey:", v69, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPlaceResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOPlaceResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPlaceResult)initWithDictionary:(id)a3
{
  return (GEOPlaceResult *)-[GEOPlaceResult _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(uint64_t)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  GEOPlace *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  GEOPlace *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  GEOAddress *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  uint64_t v45;
  GEONamedFeature *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  GEOPlaceSearchRequest *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  uint64_t v59;
  GEOMatchedToken *v60;
  uint64_t v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  id v67;
  uint64_t v68;
  const __CFString *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t n;
  void *v75;
  GEOLocalizedDisambiguationLabel *v76;
  void *v77;
  uint64_t v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  GEONamedField *v93;
  void *v94;
  uint64_t v95;
  void *v97;
  id v98;
  id obj;
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
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_137;
  }
  v6 = (void *)objc_msgSend(a1, "init");
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("place"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = [GEOPlace alloc];
      if ((a3 & 1) != 0)
        v9 = -[GEOPlace initWithJSON:](v8, "initWithJSON:", v7);
      else
        v9 = -[GEOPlace initWithDictionary:](v8, "initWithDictionary:", v7);
      v10 = (void *)v9;
      objc_msgSend(v6, "setPlace:", v9);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("additionalPlace"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v98 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v121;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v121 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = [GEOPlace alloc];
              if ((a3 & 1) != 0)
                v19 = -[GEOPlace initWithJSON:](v18, "initWithJSON:", v17);
              else
                v19 = -[GEOPlace initWithDictionary:](v18, "initWithDictionary:", v17);
              v20 = (void *)v19;
              objc_msgSend(v6, "addAdditionalPlace:", v19);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
        }
        while (v14);
      }

      v5 = v98;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suggestedQuery"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      objc_msgSend(v6, "setSuggestedQuery:", v22);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("travelTime"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setTravelTime:", objc_msgSend(v23, "unsignedIntValue"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("travelDistance"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setTravelDistance:", objc_msgSend(v24, "unsignedIntValue"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tokenEntity"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = [GEOAddress alloc];
      if ((a3 & 1) != 0)
        v27 = -[GEOAddress initWithJSON:](v26, "initWithJSON:", v25);
      else
        v27 = -[GEOAddress initWithDictionary:](v26, "initWithDictionary:", v25);
      v28 = (void *)v27;
      objc_msgSend(v6, "setTokenEntity:", v27);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("quad"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = (void *)objc_msgSend(v29, "copy");
      objc_msgSend(v6, "setQuad:", v30);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("unmatchedString"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      v32 = v31;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v117;
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v117 != v35)
              objc_enumerationMutation(v32);
            v37 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v38 = (void *)objc_msgSend(v37, "copy");
              objc_msgSend(v6, "addUnmatchedString:", v38);

            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
        }
        while (v34);
      }

      v5 = v98;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("namedFeature"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v40 = v39;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v112, v127, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v113;
        do
        {
          for (k = 0; k != v42; ++k)
          {
            if (*(_QWORD *)v113 != v43)
              objc_enumerationMutation(v40);
            v45 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v46 = [GEONamedFeature alloc];
              if ((a3 & 1) != 0)
                v47 = -[GEONamedFeature initWithJSON:](v46, "initWithJSON:", v45);
              else
                v47 = -[GEONamedFeature initWithDictionary:](v46, "initWithDictionary:", v45);
              v48 = (void *)v47;
              objc_msgSend(v6, "addNamedFeature:", v47);

            }
          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v112, v127, 16);
        }
        while (v42);
      }

      v5 = v98;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("revgeoRequestTemplate"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v50 = [GEOPlaceSearchRequest alloc];
      if ((a3 & 1) != 0)
        v51 = -[GEOPlaceSearchRequest initWithJSON:](v50, "initWithJSON:", v49);
      else
        v51 = -[GEOPlaceSearchRequest initWithDictionary:](v50, "initWithDictionary:", v49);
      v52 = (void *)v51;
      objc_msgSend(v6, "setRevgeoRequestTemplate:", v51);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchedToken"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v54 = v53;
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v108, v126, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v109;
        do
        {
          for (m = 0; m != v56; ++m)
          {
            if (*(_QWORD *)v109 != v57)
              objc_enumerationMutation(v54);
            v59 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v60 = [GEOMatchedToken alloc];
              if ((a3 & 1) != 0)
                v61 = -[GEOMatchedToken initWithJSON:](v60, "initWithJSON:", v59);
              else
                v61 = -[GEOMatchedToken initWithDictionary:](v60, "initWithDictionary:", v59);
              v62 = (void *)v61;
              objc_msgSend(v6, "addMatchedToken:", v61);

            }
          }
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v108, v126, 16);
        }
        while (v56);
      }

      v5 = v98;
    }

    if ((_DWORD)a3)
      v63 = CFSTR("flyoverTourMuid");
    else
      v63 = CFSTR("flyover_tour_muid");
    objc_msgSend(v5, "objectForKeyedSubscript:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setFlyoverTourMuid:", objc_msgSend(v64, "unsignedLongLongValue"));

    if ((_DWORD)a3)
      v65 = CFSTR("cacheControl");
    else
      v65 = CFSTR("cache_control");
    objc_msgSend(v5, "objectForKeyedSubscript:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = v66;
      if ((objc_msgSend(v67, "isEqualToString:", CFSTR("UNKNOWN_CACHEABILITY")) & 1) != 0)
      {
        v68 = 0;
      }
      else if ((objc_msgSend(v67, "isEqualToString:", CFSTR("UNCACHEABLE")) & 1) != 0)
      {
        v68 = 1;
      }
      else if (objc_msgSend(v67, "isEqualToString:", CFSTR("CACHEABLE")))
      {
        v68 = 2;
      }
      else
      {
        v68 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_99:

        if ((_DWORD)a3)
          v69 = CFSTR("disambiguationLabel");
        else
          v69 = CFSTR("disambiguation_label");
        objc_msgSend(v5, "objectForKeyedSubscript:", v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v106 = 0u;
          v107 = 0u;
          v104 = 0u;
          v105 = 0u;
          v97 = v70;
          obj = v70;
          v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
          if (v71)
          {
            v72 = v71;
            v73 = *(_QWORD *)v105;
            do
            {
              for (n = 0; n != v72; ++n)
              {
                if (*(_QWORD *)v105 != v73)
                  objc_enumerationMutation(obj);
                v75 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * n);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v76 = [GEOLocalizedDisambiguationLabel alloc];
                  if (v76)
                  {
                    v77 = v6;
                    v78 = a3;
                    v79 = v75;
                    v76 = -[GEOLocalizedDisambiguationLabel init](v76, "init");
                    if (v76)
                    {
                      objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("locale"));
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v81 = (void *)objc_msgSend(v80, "copy");
                        v82 = v81;
                        *(_BYTE *)&v76->_flags |= 2u;
                        *(_BYTE *)&v76->_flags |= 8u;
                        objc_storeStrong((id *)&v76->_locale, v81);

                      }
                      objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("string"));
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v84 = (void *)objc_msgSend(v83, "copy");
                        v85 = v84;
                        *(_BYTE *)&v76->_flags |= 4u;
                        *(_BYTE *)&v76->_flags |= 8u;
                        objc_storeStrong((id *)&v76->_string, v84);

                      }
                    }

                    a3 = v78;
                    v6 = v77;
                  }
                  objc_msgSend(v6, "addDisambiguationLabel:", v76);

                }
              }
              v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
            }
            while (v72);
          }

          v70 = v97;
          v5 = v98;
        }

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("namedField"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
          v87 = v86;
          v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v100, v124, 16);
          if (v88)
          {
            v89 = v88;
            v90 = *(_QWORD *)v101;
            do
            {
              v91 = 0;
              do
              {
                if (*(_QWORD *)v101 != v90)
                  objc_enumerationMutation(v87);
                v92 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v91);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v93 = [GEONamedField alloc];
                  if (v93)
                    v94 = (void *)-[GEONamedField _initWithDictionary:isJSON:](v93, v92, a3);
                  else
                    v94 = 0;
                  objc_msgSend(v6, "addNamedField:", v94);

                }
                ++v91;
              }
              while (v89 != v91);
              v95 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v100, v124, 16);
              v89 = v95;
            }
            while (v95);
          }

          v5 = v98;
        }

        goto LABEL_137;
      }
      v68 = objc_msgSend(v66, "intValue");
    }
    objc_msgSend(v6, "setCacheControl:", v68);
    goto LABEL_99;
  }
LABEL_137:

  return v6;
}

- (GEOPlaceResult)initWithJSON:(id)a3
{
  return (GEOPlaceResult *)-[GEOPlaceResult _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1753;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1754;
    GEOPlaceResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPlaceResultCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPlaceResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  $66C0C4ECE49E8B6147DBDEB385FCD304 flags;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  $66C0C4ECE49E8B6147DBDEB385FCD304 v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  PBDataReader *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPlaceResultIsDirty((uint64_t)self) & 1) == 0)
  {
    v32 = self->_reader;
    objc_sync_enter(v32);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v33);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v32);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPlaceResult readAll:](self, "readAll:", 0);
    PBDataWriterWriteSubmessage();
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v6 = self->_additionalPlaces;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v55;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v55 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
      }
      while (v7);
    }

    if (self->_suggestedQuery)
      PBDataWriterWriteStringField();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_tokenEntity)
      PBDataWriterWriteSubmessage();
    if (self->_quad)
      PBDataWriterWriteStringField();
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v11 = self->_unmatchedStrings;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v51;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v51 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteStringField();
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
      }
      while (v12);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v15 = self->_namedFeatures;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v47;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v47 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteSubmessage();
          ++v18;
        }
        while (v16 != v18);
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
      }
      while (v16);
    }

    if (self->_revgeoRequestTemplate)
      PBDataWriterWriteSubmessage();
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v19 = self->_matchedTokens;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v43;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v43 != v21)
            objc_enumerationMutation(v19);
          PBDataWriterWriteSubmessage();
          ++v22;
        }
        while (v20 != v22);
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
      }
      while (v20);
    }

    v23 = self->_flags;
    if ((*(_BYTE *)&v23 & 1) != 0)
    {
      PBDataWriterWriteUint64Field();
      v23 = self->_flags;
    }
    if ((*(_BYTE *)&v23 & 2) != 0)
      PBDataWriterWriteInt32Field();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v24 = self->_disambiguationLabels;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v38, v59, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v39;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v39 != v26)
            objc_enumerationMutation(v24);
          PBDataWriterWriteSubmessage();
          ++v27;
        }
        while (v25 != v27);
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v38, v59, 16);
      }
      while (v25);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v28 = self->_namedFields;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v34, v58, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v35;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v35 != v30)
            objc_enumerationMutation(v28);
          PBDataWriterWriteSubmessage();
          ++v31;
        }
        while (v29 != v31);
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v34, v58, 16);
      }
      while (v29);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v34);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOPlaceResultClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[GEOPlaceResult _readAdditionalPlaces]((uint64_t)self);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_additionalPlaces;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (_QWORD)v11) & 1) != 0)
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[GEOPlaceResult _readPlace]((uint64_t)self);
  if (-[GEOPlace hasGreenTeaWithValue:](self->_place, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPlaceResult _readRevgeoRequestTemplate]((uint64_t)self);
  return -[GEOPlaceSearchRequest hasGreenTeaWithValue:](self->_revgeoRequestTemplate, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  $66C0C4ECE49E8B6147DBDEB385FCD304 flags;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  $66C0C4ECE49E8B6147DBDEB385FCD304 v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t n;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t ii;
  void *v29;
  id *v30;

  v30 = (id *)a3;
  -[GEOPlaceResult readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v30 + 1, self->_reader);
  *((_DWORD *)v30 + 30) = self->_readerMarkPos;
  *((_DWORD *)v30 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  objc_msgSend(v30, "setPlace:", self->_place);
  if (-[GEOPlaceResult additionalPlacesCount](self, "additionalPlacesCount"))
  {
    objc_msgSend(v30, "clearAdditionalPlaces");
    v4 = -[GEOPlaceResult additionalPlacesCount](self, "additionalPlacesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPlaceResult additionalPlaceAtIndex:](self, "additionalPlaceAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addAdditionalPlace:", v7);

      }
    }
  }
  if (self->_suggestedQuery)
    objc_msgSend(v30, "setSuggestedQuery:");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    *((_DWORD *)v30 + 35) = self->_travelTime;
    *((_DWORD *)v30 + 36) |= 8u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    *((_DWORD *)v30 + 34) = self->_travelDistance;
    *((_DWORD *)v30 + 36) |= 4u;
  }
  if (self->_tokenEntity)
    objc_msgSend(v30, "setTokenEntity:");
  if (self->_quad)
    objc_msgSend(v30, "setQuad:");
  if (-[GEOPlaceResult unmatchedStringsCount](self, "unmatchedStringsCount"))
  {
    objc_msgSend(v30, "clearUnmatchedStrings");
    v9 = -[GEOPlaceResult unmatchedStringsCount](self, "unmatchedStringsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOPlaceResult unmatchedStringAtIndex:](self, "unmatchedStringAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addUnmatchedString:", v12);

      }
    }
  }
  if (-[GEOPlaceResult namedFeaturesCount](self, "namedFeaturesCount"))
  {
    objc_msgSend(v30, "clearNamedFeatures");
    v13 = -[GEOPlaceResult namedFeaturesCount](self, "namedFeaturesCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[GEOPlaceResult namedFeatureAtIndex:](self, "namedFeatureAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addNamedFeature:", v16);

      }
    }
  }
  if (self->_revgeoRequestTemplate)
    objc_msgSend(v30, "setRevgeoRequestTemplate:");
  if (-[GEOPlaceResult matchedTokensCount](self, "matchedTokensCount"))
  {
    objc_msgSend(v30, "clearMatchedTokens");
    v17 = -[GEOPlaceResult matchedTokensCount](self, "matchedTokensCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[GEOPlaceResult matchedTokenAtIndex:](self, "matchedTokenAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addMatchedToken:", v20);

      }
    }
  }
  v21 = self->_flags;
  if ((*(_BYTE *)&v21 & 1) != 0)
  {
    v30[5] = (id)self->_flyoverTourMuid;
    *((_DWORD *)v30 + 36) |= 1u;
    v21 = self->_flags;
  }
  if ((*(_BYTE *)&v21 & 2) != 0)
  {
    *((_DWORD *)v30 + 33) = self->_cacheControl;
    *((_DWORD *)v30 + 36) |= 2u;
  }
  if (-[GEOPlaceResult disambiguationLabelsCount](self, "disambiguationLabelsCount"))
  {
    objc_msgSend(v30, "clearDisambiguationLabels");
    v22 = -[GEOPlaceResult disambiguationLabelsCount](self, "disambiguationLabelsCount");
    if (v22)
    {
      v23 = v22;
      for (n = 0; n != v23; ++n)
      {
        -[GEOPlaceResult disambiguationLabelAtIndex:](self, "disambiguationLabelAtIndex:", n);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addDisambiguationLabel:", v25);

      }
    }
  }
  if (-[GEOPlaceResult namedFieldsCount](self, "namedFieldsCount"))
  {
    objc_msgSend(v30, "clearNamedFields");
    v26 = -[GEOPlaceResult namedFieldsCount](self, "namedFieldsCount");
    if (v26)
    {
      v27 = v26;
      for (ii = 0; ii != v27; ++ii)
      {
        -[GEOPlaceResult namedFieldAtIndex:](self, "namedFieldAtIndex:", ii);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addNamedField:", v29);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  $66C0C4ECE49E8B6147DBDEB385FCD304 flags;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  id v33;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  $66C0C4ECE49E8B6147DBDEB385FCD304 v40;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t n;
  void *v45;
  NSMutableArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t ii;
  void *v50;
  PBUnknownFields *v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 1) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPlaceResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_56;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPlaceResult readAll:](self, "readAll:", 0);
  v9 = -[GEOPlace copyWithZone:](self->_place, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v9;

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v11 = self->_additionalPlaces;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v74 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAdditionalPlace:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    }
    while (v12);
  }

  v16 = -[NSString copyWithZone:](self->_suggestedQuery, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v16;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_travelTime;
    *(_DWORD *)(v5 + 144) |= 8u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_travelDistance;
    *(_DWORD *)(v5 + 144) |= 4u;
  }
  v19 = -[GEOAddress copyWithZone:](self->_tokenEntity, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v19;

  v21 = -[NSString copyWithZone:](self->_quad, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v21;

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v23 = self->_unmatchedStrings;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v70 != v25)
          objc_enumerationMutation(v23);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addUnmatchedString:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
    }
    while (v24);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v28 = self->_namedFeatures;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v66;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v66 != v30)
          objc_enumerationMutation(v28);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNamedFeature:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
    }
    while (v29);
  }

  v33 = -[GEOPlaceSearchRequest copyWithZone:](self->_revgeoRequestTemplate, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v33;

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v35 = self->_matchedTokens;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v62;
    do
    {
      for (m = 0; m != v36; ++m)
      {
        if (*(_QWORD *)v62 != v37)
          objc_enumerationMutation(v35);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addMatchedToken:", v39);

      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
    }
    while (v36);
  }

  v40 = self->_flags;
  if ((*(_BYTE *)&v40 & 1) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_flyoverTourMuid;
    *(_DWORD *)(v5 + 144) |= 1u;
    v40 = self->_flags;
  }
  if ((*(_BYTE *)&v40 & 2) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_cacheControl;
    *(_DWORD *)(v5 + 144) |= 2u;
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v41 = self->_disambiguationLabels;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v58;
    do
    {
      for (n = 0; n != v42; ++n)
      {
        if (*(_QWORD *)v58 != v43)
          objc_enumerationMutation(v41);
        v45 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDisambiguationLabel:", v45);

      }
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
    }
    while (v42);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v46 = self->_namedFields;
  v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v53, v77, 16);
  if (v47)
  {
    v48 = *(_QWORD *)v54;
    do
    {
      for (ii = 0; ii != v47; ++ii)
      {
        if (*(_QWORD *)v54 != v48)
          objc_enumerationMutation(v46);
        v50 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * ii), "copyWithZone:", a3, (_QWORD)v53);
        objc_msgSend((id)v5, "addNamedField:", v50);

      }
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v53, v77, 16);
    }
    while (v47);
  }

  v51 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v51;
LABEL_56:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPlace *place;
  NSMutableArray *additionalPlaces;
  NSString *suggestedQuery;
  $66C0C4ECE49E8B6147DBDEB385FCD304 flags;
  int v9;
  GEOAddress *tokenEntity;
  NSString *quad;
  NSMutableArray *unmatchedStrings;
  NSMutableArray *namedFeatures;
  GEOPlaceSearchRequest *revgeoRequestTemplate;
  NSMutableArray *matchedTokens;
  $66C0C4ECE49E8B6147DBDEB385FCD304 v16;
  int v17;
  NSMutableArray *disambiguationLabels;
  NSMutableArray *namedFields;
  char v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  -[GEOPlaceResult readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  place = self->_place;
  if ((unint64_t)place | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPlace isEqual:](place, "isEqual:"))
      goto LABEL_44;
  }
  additionalPlaces = self->_additionalPlaces;
  if ((unint64_t)additionalPlaces | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](additionalPlaces, "isEqual:"))
      goto LABEL_44;
  }
  suggestedQuery = self->_suggestedQuery;
  if ((unint64_t)suggestedQuery | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](suggestedQuery, "isEqual:"))
      goto LABEL_44;
  }
  flags = self->_flags;
  v9 = *((_DWORD *)v4 + 36);
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_travelTime != *((_DWORD *)v4 + 35))
      goto LABEL_44;
  }
  else if ((v9 & 8) != 0)
  {
LABEL_44:
    v20 = 0;
    goto LABEL_45;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_travelDistance != *((_DWORD *)v4 + 34))
      goto LABEL_44;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_44;
  }
  tokenEntity = self->_tokenEntity;
  if ((unint64_t)tokenEntity | *((_QWORD *)v4 + 13) && !-[GEOAddress isEqual:](tokenEntity, "isEqual:"))
    goto LABEL_44;
  quad = self->_quad;
  if ((unint64_t)quad | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](quad, "isEqual:"))
      goto LABEL_44;
  }
  unmatchedStrings = self->_unmatchedStrings;
  if ((unint64_t)unmatchedStrings | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](unmatchedStrings, "isEqual:"))
      goto LABEL_44;
  }
  namedFeatures = self->_namedFeatures;
  if ((unint64_t)namedFeatures | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](namedFeatures, "isEqual:"))
      goto LABEL_44;
  }
  revgeoRequestTemplate = self->_revgeoRequestTemplate;
  if ((unint64_t)revgeoRequestTemplate | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOPlaceSearchRequest isEqual:](revgeoRequestTemplate, "isEqual:"))
      goto LABEL_44;
  }
  matchedTokens = self->_matchedTokens;
  if ((unint64_t)matchedTokens | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](matchedTokens, "isEqual:"))
      goto LABEL_44;
  }
  v16 = self->_flags;
  v17 = *((_DWORD *)v4 + 36);
  if ((*(_BYTE *)&v16 & 1) != 0)
  {
    if ((v17 & 1) == 0 || self->_flyoverTourMuid != *((_QWORD *)v4 + 5))
      goto LABEL_44;
  }
  else if ((v17 & 1) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&v16 & 2) != 0)
  {
    if ((v17 & 2) == 0 || self->_cacheControl != *((_DWORD *)v4 + 33))
      goto LABEL_44;
  }
  else if ((v17 & 2) != 0)
  {
    goto LABEL_44;
  }
  disambiguationLabels = self->_disambiguationLabels;
  if ((unint64_t)disambiguationLabels | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](disambiguationLabels, "isEqual:"))
  {
    goto LABEL_44;
  }
  namedFields = self->_namedFields;
  if ((unint64_t)namedFields | *((_QWORD *)v4 + 8))
    v20 = -[NSMutableArray isEqual:](namedFields, "isEqual:");
  else
    v20 = 1;
LABEL_45:

  return v20;
}

- (unint64_t)hash
{
  $66C0C4ECE49E8B6147DBDEB385FCD304 flags;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  $66C0C4ECE49E8B6147DBDEB385FCD304 v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSUInteger v18;
  uint64_t v19;
  unint64_t v20;

  -[GEOPlaceResult readAll:](self, "readAll:", 1);
  v20 = -[GEOPlace hash](self->_place, "hash");
  v19 = -[NSMutableArray hash](self->_additionalPlaces, "hash");
  v18 = -[NSString hash](self->_suggestedQuery, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    v4 = 2654435761 * self->_travelTime;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&flags & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_travelDistance;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[GEOAddress hash](self->_tokenEntity, "hash");
  v7 = -[NSString hash](self->_quad, "hash");
  v8 = -[NSMutableArray hash](self->_unmatchedStrings, "hash");
  v9 = -[NSMutableArray hash](self->_namedFeatures, "hash");
  v10 = -[GEOPlaceSearchRequest hash](self->_revgeoRequestTemplate, "hash");
  v11 = -[NSMutableArray hash](self->_matchedTokens, "hash");
  v12 = self->_flags;
  if ((*(_BYTE *)&v12 & 1) != 0)
  {
    v13 = 2654435761u * self->_flyoverTourMuid;
    if ((*(_BYTE *)&v12 & 2) != 0)
      goto LABEL_8;
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v13 = 0;
  if ((*(_BYTE *)&v12 & 2) == 0)
    goto LABEL_10;
LABEL_8:
  v14 = 2654435761 * self->_cacheControl;
LABEL_11:
  v15 = v19 ^ v20 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  v16 = v13 ^ v14 ^ -[NSMutableArray hash](self->_disambiguationLabels, "hash");
  return v15 ^ v16 ^ -[NSMutableArray hash](self->_namedFields, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOPlace *place;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  GEOAddress *tokenEntity;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  GEOPlaceSearchRequest *revgeoRequestTemplate;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  int v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t n;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t ii;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  place = self->_place;
  v6 = *((_QWORD *)v4 + 9);
  if (place)
  {
    if (v6)
      -[GEOPlace mergeFrom:](place, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOPlaceResult setPlace:](self, "setPlace:");
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v7 = *((id *)v4 + 3);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v64 != v10)
          objc_enumerationMutation(v7);
        -[GEOPlaceResult addAdditionalPlace:](self, "addAdditionalPlace:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 12))
    -[GEOPlaceResult setSuggestedQuery:](self, "setSuggestedQuery:");
  v12 = *((_DWORD *)v4 + 36);
  if ((v12 & 8) != 0)
  {
    self->_travelTime = *((_DWORD *)v4 + 35);
    *(_DWORD *)&self->_flags |= 8u;
    v12 = *((_DWORD *)v4 + 36);
  }
  if ((v12 & 4) != 0)
  {
    self->_travelDistance = *((_DWORD *)v4 + 34);
    *(_DWORD *)&self->_flags |= 4u;
  }
  tokenEntity = self->_tokenEntity;
  v14 = *((_QWORD *)v4 + 13);
  if (tokenEntity)
  {
    if (v14)
      -[GEOAddress mergeFrom:](tokenEntity, "mergeFrom:");
  }
  else if (v14)
  {
    -[GEOPlaceResult setTokenEntity:](self, "setTokenEntity:");
  }
  if (*((_QWORD *)v4 + 10))
    -[GEOPlaceResult setQuad:](self, "setQuad:");
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v15 = *((id *)v4 + 14);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v60 != v18)
          objc_enumerationMutation(v15);
        -[GEOPlaceResult addUnmatchedString:](self, "addUnmatchedString:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    }
    while (v17);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v20 = *((id *)v4 + 7);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v56;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v56 != v23)
          objc_enumerationMutation(v20);
        -[GEOPlaceResult addNamedFeature:](self, "addNamedFeature:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
    }
    while (v22);
  }

  revgeoRequestTemplate = self->_revgeoRequestTemplate;
  v26 = *((_QWORD *)v4 + 11);
  if (revgeoRequestTemplate)
  {
    if (v26)
      -[GEOPlaceSearchRequest mergeFrom:](revgeoRequestTemplate, "mergeFrom:");
  }
  else if (v26)
  {
    -[GEOPlaceResult setRevgeoRequestTemplate:](self, "setRevgeoRequestTemplate:");
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v27 = *((id *)v4 + 6);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v52;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v52 != v30)
          objc_enumerationMutation(v27);
        -[GEOPlaceResult addMatchedToken:](self, "addMatchedToken:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * m));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
    }
    while (v29);
  }

  v32 = *((_DWORD *)v4 + 36);
  if ((v32 & 1) != 0)
  {
    self->_flyoverTourMuid = *((_QWORD *)v4 + 5);
    *(_DWORD *)&self->_flags |= 1u;
    v32 = *((_DWORD *)v4 + 36);
  }
  if ((v32 & 2) != 0)
  {
    self->_cacheControl = *((_DWORD *)v4 + 33);
    *(_DWORD *)&self->_flags |= 2u;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v33 = *((id *)v4 + 4);
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v68, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v48;
    do
    {
      for (n = 0; n != v35; ++n)
      {
        if (*(_QWORD *)v48 != v36)
          objc_enumerationMutation(v33);
        -[GEOPlaceResult addDisambiguationLabel:](self, "addDisambiguationLabel:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * n));
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v68, 16);
    }
    while (v35);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v38 = *((id *)v4 + 8);
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v43, v67, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v44;
    do
    {
      for (ii = 0; ii != v40; ++ii)
      {
        if (*(_QWORD *)v44 != v41)
          objc_enumerationMutation(v38);
        -[GEOPlaceResult addNamedField:](self, "addNamedField:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * ii), (_QWORD)v43);
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v43, v67, 16);
    }
    while (v40);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPlaceResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1757);
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
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v3 = a3;
  v59 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10010u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPlaceResult readAll:](self, "readAll:", 0);
    -[GEOPlace clearUnknownFields:](self->_place, "clearUnknownFields:", 1);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v7 = self->_additionalPlaces;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v51;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v51 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v9);
    }

    -[GEOAddress clearUnknownFields:](self->_tokenEntity, "clearUnknownFields:", 1);
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v12 = self->_namedFeatures;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v47;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v47 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
      }
      while (v14);
    }

    -[GEOPlaceSearchRequest clearUnknownFields:](self->_revgeoRequestTemplate, "clearUnknownFields:", 1);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v17 = self->_matchedTokens;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v43;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v43 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v21++), "clearUnknownFields:", 1);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
      }
      while (v19);
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v22 = self->_disambiguationLabels;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v39;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v39 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v26);
          if (v27)
          {
            os_unfair_lock_lock_with_options();
            *(_BYTE *)(v27 + 52) |= 1u;
            *(_BYTE *)(v27 + 52) |= 8u;
            os_unfair_lock_unlock((os_unfair_lock_t)(v27 + 48));
            v28 = *(void **)(v27 + 16);
            *(_QWORD *)(v27 + 16) = 0;

            -[GEOLocalizedDisambiguationLabel readAll:](v27, 0);
          }
          ++v26;
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
      }
      while (v24);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v29 = self->_namedFields;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v35;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v35 != v32)
            objc_enumerationMutation(v29);
          -[GEONamedField clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v33++));
        }
        while (v31 != v33);
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
      }
      while (v31);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmatchedStrings, 0);
  objc_storeStrong((id *)&self->_tokenEntity, 0);
  objc_storeStrong((id *)&self->_suggestedQuery, 0);
  objc_storeStrong((id *)&self->_revgeoRequestTemplate, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_namedFields, 0);
  objc_storeStrong((id *)&self->_namedFeatures, 0);
  objc_storeStrong((id *)&self->_matchedTokens, 0);
  objc_storeStrong((id *)&self->_disambiguationLabels, 0);
  objc_storeStrong((id *)&self->_additionalPlaces, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)geoMapItem
{
  return -[_GEOPlaceItem initWithPlaceResult:]([_GEOPlaceItem alloc], "initWithPlaceResult:", self);
}

@end
