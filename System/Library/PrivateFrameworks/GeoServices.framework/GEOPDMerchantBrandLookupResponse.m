@implementation GEOPDMerchantBrandLookupResponse

- (GEOPDMerchantBrandLookupResponse)init
{
  GEOPDMerchantBrandLookupResponse *v2;
  GEOPDMerchantBrandLookupResponse *v3;
  GEOPDMerchantBrandLookupResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDMerchantBrandLookupResponse;
  v2 = -[GEOPDMerchantBrandLookupResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMerchantBrandLookupResponse)initWithData:(id)a3
{
  GEOPDMerchantBrandLookupResponse *v3;
  GEOPDMerchantBrandLookupResponse *v4;
  GEOPDMerchantBrandLookupResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDMerchantBrandLookupResponse;
  v3 = -[GEOPDMerchantBrandLookupResponse initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDMerchantBrandLookupResponse;
  -[GEOPDMerchantBrandLookupResponse dealloc](&v3, sel_dealloc);
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readScope
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 144) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantBrandLookupResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readScope_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasScope
{
  -[GEOPDMerchantBrandLookupResponse _readScope]((uint64_t)self);
  return self->_scope != 0;
}

- (NSString)scope
{
  -[GEOPDMerchantBrandLookupResponse _readScope]((uint64_t)self);
  return self->_scope;
}

- (void)setScope:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_scope, a3);
}

- (void)_readGeoHashs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 144) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantBrandLookupResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGeoHashs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)geoHashs
{
  -[GEOPDMerchantBrandLookupResponse _readGeoHashs]((uint64_t)self);
  return self->_geoHashs;
}

- (void)setGeoHashs:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *geoHashs;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  geoHashs = self->_geoHashs;
  self->_geoHashs = v4;

}

- (void)clearGeoHashs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_geoHashs, "removeAllObjects");
}

- (void)addGeoHash:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDMerchantBrandLookupResponse _readGeoHashs]((uint64_t)self);
  -[GEOPDMerchantBrandLookupResponse _addNoFlagsGeoHash:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsGeoHash:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 96);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v5;

      v4 = *(void **)(a1 + 96);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)geoHashsCount
{
  -[GEOPDMerchantBrandLookupResponse _readGeoHashs]((uint64_t)self);
  return -[NSMutableArray count](self->_geoHashs, "count");
}

- (id)geoHashAtIndex:(unint64_t)a3
{
  -[GEOPDMerchantBrandLookupResponse _readGeoHashs]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_geoHashs, "objectAtIndex:", a3);
}

+ (Class)geoHashType
{
  return (Class)objc_opt_class();
}

- (void)_readChildBrandMuids
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 144) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantBrandLookupResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChildBrandMuids_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (unint64_t)childBrandMuidsCount
{
  -[GEOPDMerchantBrandLookupResponse _readChildBrandMuids]((uint64_t)self);
  return self->_childBrandMuids.count;
}

- (unint64_t)childBrandMuids
{
  -[GEOPDMerchantBrandLookupResponse _readChildBrandMuids]((uint64_t)self);
  return self->_childBrandMuids.list;
}

- (void)clearChildBrandMuids
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  PBRepeatedUInt64Clear();
}

- (void)addChildBrandMuid:(unint64_t)a3
{
  -[GEOPDMerchantBrandLookupResponse _readChildBrandMuids]((uint64_t)self);
  if (self)
    PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (unint64_t)childBrandMuidAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_childBrandMuids;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDMerchantBrandLookupResponse _readChildBrandMuids]((uint64_t)self);
  p_childBrandMuids = &self->_childBrandMuids;
  count = self->_childBrandMuids.count;
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
  return p_childBrandMuids->list[a3];
}

- (void)setChildBrandMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  PBRepeatedUInt64Set();
}

- (void)_readVariantBrandMuids
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 144) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantBrandLookupResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVariantBrandMuids_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (unint64_t)variantBrandMuidsCount
{
  -[GEOPDMerchantBrandLookupResponse _readVariantBrandMuids]((uint64_t)self);
  return self->_variantBrandMuids.count;
}

- (unint64_t)variantBrandMuids
{
  -[GEOPDMerchantBrandLookupResponse _readVariantBrandMuids]((uint64_t)self);
  return self->_variantBrandMuids.list;
}

- (void)clearVariantBrandMuids
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  PBRepeatedUInt64Clear();
}

- (void)addVariantBrandMuid:(unint64_t)a3
{
  -[GEOPDMerchantBrandLookupResponse _readVariantBrandMuids]((uint64_t)self);
  if (self)
    PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (unint64_t)variantBrandMuidAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_variantBrandMuids;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDMerchantBrandLookupResponse _readVariantBrandMuids]((uint64_t)self);
  p_variantBrandMuids = &self->_variantBrandMuids;
  count = self->_variantBrandMuids.count;
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
  return p_variantBrandMuids->list[a3];
}

- (void)setVariantBrandMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  PBRepeatedUInt64Set();
}

- (BOOL)isPrimaryVariant
{
  return self->_isPrimaryVariant;
}

- (void)setIsPrimaryVariant:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_isPrimaryVariant = a3;
}

- (void)setHasIsPrimaryVariant:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 516;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasIsPrimaryVariant
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unint64_t)relatedGlobalBrandMuid
{
  return self->_relatedGlobalBrandMuid;
}

- (void)setRelatedGlobalBrandMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_relatedGlobalBrandMuid = a3;
}

- (void)setHasRelatedGlobalBrandMuid:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 514;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasRelatedGlobalBrandMuid
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readAbstractOfBrandMuids
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 144) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantBrandLookupResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbstractOfBrandMuids_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (unint64_t)abstractOfBrandMuidsCount
{
  -[GEOPDMerchantBrandLookupResponse _readAbstractOfBrandMuids]((uint64_t)self);
  return self->_abstractOfBrandMuids.count;
}

- (unint64_t)abstractOfBrandMuids
{
  -[GEOPDMerchantBrandLookupResponse _readAbstractOfBrandMuids]((uint64_t)self);
  return self->_abstractOfBrandMuids.list;
}

- (void)clearAbstractOfBrandMuids
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  PBRepeatedUInt64Clear();
}

- (void)addAbstractOfBrandMuid:(unint64_t)a3
{
  -[GEOPDMerchantBrandLookupResponse _readAbstractOfBrandMuids]((uint64_t)self);
  if (self)
    PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (unint64_t)abstractOfBrandMuidAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_abstractOfBrandMuids;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDMerchantBrandLookupResponse _readAbstractOfBrandMuids]((uint64_t)self);
  p_abstractOfBrandMuids = &self->_abstractOfBrandMuids;
  count = self->_abstractOfBrandMuids.count;
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
  return p_abstractOfBrandMuids->list[a3];
}

- (void)setAbstractOfBrandMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  PBRepeatedUInt64Set();
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
  v8.super_class = (Class)GEOPDMerchantBrandLookupResponse;
  -[GEOPDMerchantBrandLookupResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDMerchantBrandLookupResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMerchantBrandLookupResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  __int16 v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 144) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 104));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("muid"));

  }
  objc_msgSend((id)a1, "scope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("scope"));

  if (*(_QWORD *)(a1 + 96))
  {
    objc_msgSend((id)a1, "geoHashs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("geoHash");
    else
      v8 = CFSTR("geo_hash");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    PBRepeatedUInt64NSArray();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("childBrandMuid");
    else
      v10 = CFSTR("child_brand_muid");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if (*(_QWORD *)(a1 + 80))
  {
    PBRepeatedUInt64NSArray();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("variantBrandMuid");
    else
      v12 = CFSTR("variant_brand_muid");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  v13 = *(_WORD *)(a1 + 144);
  if ((v13 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 140));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("isPrimaryVariant");
    else
      v15 = CFSTR("is_primary_variant");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

    v13 = *(_WORD *)(a1 + 144);
  }
  if ((v13 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 112));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("relatedGlobalBrandMuid");
    else
      v17 = CFSTR("related_global_brand_muid");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt64NSArray();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("abstractOfBrandMuid");
    else
      v19 = CFSTR("abstract_of_brand_muid");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  v20 = *(void **)(a1 + 16);
  if (v20)
  {
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __62__GEOPDMerchantBrandLookupResponse__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v24 = v23;
      v28 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v27);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMerchantBrandLookupResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __62__GEOPDMerchantBrandLookupResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDMerchantBrandLookupResponse)initWithDictionary:(id)a3
{
  return (GEOPDMerchantBrandLookupResponse *)-[GEOPDMerchantBrandLookupResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  const __CFString *v27;
  void *v28;
  int v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  void *v47;
  int v49;
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
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMuid:", objc_msgSend(v6, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("scope"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setScope:", v8);

      }
      if (a3)
        v9 = CFSTR("geoHash");
      else
        v9 = CFSTR("geo_hash");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v49 = a3;
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v63 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v17 = (void *)objc_msgSend(v16, "copy");
                objc_msgSend(a1, "addGeoHash:", v17);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
          }
          while (v13);
        }

        a3 = v49;
      }

      if (a3)
        v18 = CFSTR("childBrandMuid");
      else
        v18 = CFSTR("child_brand_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = a3;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v21 = v19;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v59;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v59 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addChildBrandMuid:", objc_msgSend(v26, "unsignedLongLongValue"));
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
          }
          while (v23);
        }

        a3 = v20;
      }

      if (a3)
        v27 = CFSTR("variantBrandMuid");
      else
        v27 = CFSTR("variant_brand_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = a3;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v30 = v28;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v55;
          do
          {
            for (k = 0; k != v32; ++k)
            {
              if (*(_QWORD *)v55 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addVariantBrandMuid:", objc_msgSend(v35, "unsignedLongLongValue"));
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
          }
          while (v32);
        }

        a3 = v29;
      }

      if (a3)
        v36 = CFSTR("isPrimaryVariant");
      else
        v36 = CFSTR("is_primary_variant");
      objc_msgSend(v5, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsPrimaryVariant:", objc_msgSend(v37, "BOOLValue"));

      if (a3)
        v38 = CFSTR("relatedGlobalBrandMuid");
      else
        v38 = CFSTR("related_global_brand_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRelatedGlobalBrandMuid:", objc_msgSend(v39, "unsignedLongLongValue"));

      if (a3)
        v40 = CFSTR("abstractOfBrandMuid");
      else
        v40 = CFSTR("abstract_of_brand_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v42 = v41;
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v51;
          do
          {
            for (m = 0; m != v44; ++m)
            {
              if (*(_QWORD *)v51 != v45)
                objc_enumerationMutation(v42);
              v47 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addAbstractOfBrandMuid:", objc_msgSend(v47, "unsignedLongLongValue"));
            }
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
          }
          while (v44);
        }

      }
    }
  }

  return a1;
}

- (GEOPDMerchantBrandLookupResponse)initWithJSON:(id)a3
{
  return (GEOPDMerchantBrandLookupResponse *)-[GEOPDMerchantBrandLookupResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2961;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2962;
    GEOPDMerchantBrandLookupResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDMerchantBrandLookupResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDMerchantBrandLookupResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  unint64_t v11;
  __int16 flags;
  unint64_t v13;
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3F0) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDMerchantBrandLookupResponse readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_scope)
      PBDataWriterWriteStringField();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_geoHashs;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    if (self->_childBrandMuids.count)
    {
      v10 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v10;
      }
      while (v10 < self->_childBrandMuids.count);
    }
    if (self->_variantBrandMuids.count)
    {
      v11 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v11;
      }
      while (v11 < self->_variantBrandMuids.count);
    }
    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_abstractOfBrandMuids.count)
    {
      v13 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v13;
      }
      while (v13 < self->_abstractOfBrandMuids.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  __int16 flags;
  unint64_t v15;
  unint64_t v16;
  uint64_t m;
  id *v18;

  v18 = (id *)a3;
  -[GEOPDMerchantBrandLookupResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v18 + 1, self->_reader);
  *((_DWORD *)v18 + 32) = self->_readerMarkPos;
  *((_DWORD *)v18 + 33) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    v18[13] = (id)self->_muid;
    *((_WORD *)v18 + 72) |= 1u;
  }
  if (self->_scope)
    objc_msgSend(v18, "setScope:");
  if (-[GEOPDMerchantBrandLookupResponse geoHashsCount](self, "geoHashsCount"))
  {
    objc_msgSend(v18, "clearGeoHashs");
    v4 = -[GEOPDMerchantBrandLookupResponse geoHashsCount](self, "geoHashsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPDMerchantBrandLookupResponse geoHashAtIndex:](self, "geoHashAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addGeoHash:", v7);

      }
    }
  }
  if (-[GEOPDMerchantBrandLookupResponse childBrandMuidsCount](self, "childBrandMuidsCount"))
  {
    objc_msgSend(v18, "clearChildBrandMuids");
    v8 = -[GEOPDMerchantBrandLookupResponse childBrandMuidsCount](self, "childBrandMuidsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(v18, "addChildBrandMuid:", -[GEOPDMerchantBrandLookupResponse childBrandMuidAtIndex:](self, "childBrandMuidAtIndex:", j));
    }
  }
  if (-[GEOPDMerchantBrandLookupResponse variantBrandMuidsCount](self, "variantBrandMuidsCount"))
  {
    objc_msgSend(v18, "clearVariantBrandMuids");
    v11 = -[GEOPDMerchantBrandLookupResponse variantBrandMuidsCount](self, "variantBrandMuidsCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(v18, "addVariantBrandMuid:", -[GEOPDMerchantBrandLookupResponse variantBrandMuidAtIndex:](self, "variantBrandMuidAtIndex:", k));
    }
  }
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_BYTE *)v18 + 140) = self->_isPrimaryVariant;
    *((_WORD *)v18 + 72) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v18[14] = (id)self->_relatedGlobalBrandMuid;
    *((_WORD *)v18 + 72) |= 2u;
  }
  if (-[GEOPDMerchantBrandLookupResponse abstractOfBrandMuidsCount](self, "abstractOfBrandMuidsCount"))
  {
    objc_msgSend(v18, "clearAbstractOfBrandMuids");
    v15 = -[GEOPDMerchantBrandLookupResponse abstractOfBrandMuidsCount](self, "abstractOfBrandMuidsCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
        objc_msgSend(v18, "addAbstractOfBrandMuid:", -[GEOPDMerchantBrandLookupResponse abstractOfBrandMuidAtIndex:](self, "abstractOfBrandMuidAtIndex:", m));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int16 flags;
  PBUnknownFields *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDMerchantBrandLookupResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMerchantBrandLookupResponse readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 104) = self->_muid;
    *(_WORD *)(v5 + 144) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_scope, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v9;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = self->_geoHashs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend((id)v5, "addGeoHash:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 140) = self->_isPrimaryVariant;
    *(_WORD *)(v5 + 144) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 112) = self->_relatedGlobalBrandMuid;
    *(_WORD *)(v5 + 144) |= 2u;
  }
  PBRepeatedUInt64Copy();
  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSString *scope;
  NSMutableArray *geoHashs;
  __int16 flags;
  __int16 v9;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[GEOPDMerchantBrandLookupResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 72);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_muid != *((_QWORD *)v4 + 13))
      goto LABEL_27;
  }
  else if ((v5 & 1) != 0)
  {
    goto LABEL_27;
  }
  scope = self->_scope;
  if ((unint64_t)scope | *((_QWORD *)v4 + 15) && !-[NSString isEqual:](scope, "isEqual:"))
    goto LABEL_27;
  geoHashs = self->_geoHashs;
  if ((unint64_t)geoHashs | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](geoHashs, "isEqual:"))
      goto LABEL_27;
  }
  if (!PBRepeatedUInt64IsEqual() || !PBRepeatedUInt64IsEqual())
    goto LABEL_27;
  flags = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 72);
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) != 0)
    {
      if (self->_isPrimaryVariant)
      {
        if (!*((_BYTE *)v4 + 140))
          goto LABEL_27;
        goto LABEL_21;
      }
      if (!*((_BYTE *)v4 + 140))
        goto LABEL_21;
    }
LABEL_27:
    IsEqual = 0;
    goto LABEL_28;
  }
  if ((v9 & 4) != 0)
    goto LABEL_27;
LABEL_21:
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_relatedGlobalBrandMuid != *((_QWORD *)v4 + 14))
      goto LABEL_27;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_27;
  }
  IsEqual = PBRepeatedUInt64IsEqual();
LABEL_28:

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int16 flags;
  uint64_t v9;
  unint64_t v10;

  -[GEOPDMerchantBrandLookupResponse readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v3 = 2654435761u * self->_muid;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_scope, "hash");
  v5 = -[NSMutableArray hash](self->_geoHashs, "hash");
  v6 = PBRepeatedUInt64Hash();
  v7 = PBRepeatedUInt64Hash();
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v9 = 2654435761 * self->_isPrimaryVariant;
    if ((flags & 2) != 0)
      goto LABEL_6;
LABEL_8:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ PBRepeatedUInt64Hash();
  }
  v9 = 0;
  if ((flags & 2) == 0)
    goto LABEL_8;
LABEL_6:
  v10 = 2654435761u * self->_relatedGlobalBrandMuid;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ PBRepeatedUInt64Hash();
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
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t m;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_WORD *)v4 + 72) & 1) != 0)
  {
    self->_muid = *((_QWORD *)v4 + 13);
    *(_WORD *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v4 + 15))
    -[GEOPDMerchantBrandLookupResponse setScope:](self, "setScope:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *((id *)v4 + 12);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        -[GEOPDMerchantBrandLookupResponse addGeoHash:](self, "addGeoHash:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  v10 = objc_msgSend(v4, "childBrandMuidsCount");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
      -[GEOPDMerchantBrandLookupResponse addChildBrandMuid:](self, "addChildBrandMuid:", objc_msgSend(v4, "childBrandMuidAtIndex:", j, (_QWORD)v20));
  }
  v13 = objc_msgSend(v4, "variantBrandMuidsCount", (_QWORD)v20);
  if (v13)
  {
    v14 = v13;
    for (k = 0; k != v14; ++k)
      -[GEOPDMerchantBrandLookupResponse addVariantBrandMuid:](self, "addVariantBrandMuid:", objc_msgSend(v4, "variantBrandMuidAtIndex:", k));
  }
  v16 = *((_WORD *)v4 + 72);
  if ((v16 & 4) != 0)
  {
    self->_isPrimaryVariant = *((_BYTE *)v4 + 140);
    *(_WORD *)&self->_flags |= 4u;
    v16 = *((_WORD *)v4 + 72);
  }
  if ((v16 & 2) != 0)
  {
    self->_relatedGlobalBrandMuid = *((_QWORD *)v4 + 14);
    *(_WORD *)&self->_flags |= 2u;
  }
  v17 = objc_msgSend(v4, "abstractOfBrandMuidsCount");
  if (v17)
  {
    v18 = v17;
    for (m = 0; m != v18; ++m)
      -[GEOPDMerchantBrandLookupResponse addAbstractOfBrandMuid:](self, "addAbstractOfBrandMuid:", objc_msgSend(v4, "abstractOfBrandMuidAtIndex:", m));
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDMerchantBrandLookupResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2965);
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
  *(_WORD *)&self->_flags |= 0x208u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOPDMerchantBrandLookupResponse readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_geoHashs, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
