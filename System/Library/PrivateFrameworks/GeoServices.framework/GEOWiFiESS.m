@implementation GEOWiFiESS

- (GEOWiFiESS)init
{
  GEOWiFiESS *v2;
  GEOWiFiESS *v3;
  GEOWiFiESS *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiESS;
  v2 = -[GEOWiFiESS init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiESS)initWithData:(id)a3
{
  GEOWiFiESS *v3;
  GEOWiFiESS *v4;
  GEOWiFiESS *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiESS;
  v3 = -[GEOWiFiESS initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOWiFiESS;
  -[GEOWiFiESS dealloc](&v3, sel_dealloc);
}

- (void)_readIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiESSReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIdentifier_tags_137);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasIdentifier
{
  -[GEOWiFiESS _readIdentifier]((uint64_t)self);
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOWiFiESS _readIdentifier]((uint64_t)self);
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)_readBss
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiESSReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBss_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)bss
{
  -[GEOWiFiESS _readBss]((uint64_t)self);
  return self->_bss;
}

- (void)setBss:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *bss;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  bss = self->_bss;
  self->_bss = v4;

}

- (void)clearBss
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  -[NSMutableArray removeAllObjects](self->_bss, "removeAllObjects");
}

- (void)addBss:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOWiFiESS _readBss]((uint64_t)self);
  -[GEOWiFiESS _addNoFlagsBss:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsBss:(uint64_t)a1
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

- (unint64_t)bssCount
{
  -[GEOWiFiESS _readBss]((uint64_t)self);
  return -[NSMutableArray count](self->_bss, "count");
}

- (id)bssAtIndex:(unint64_t)a3
{
  -[GEOWiFiESS _readBss]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_bss, "objectAtIndex:", a3);
}

+ (Class)bssType
{
  return (Class)objc_opt_class();
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiESSReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_7);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasName
{
  -[GEOWiFiESS _readName]((uint64_t)self);
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOWiFiESS _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x900u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readAuthTraits
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiESSReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAuthTraits_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)authTraitsCount
{
  -[GEOWiFiESS _readAuthTraits]((uint64_t)self);
  return self->_authTraits.count;
}

- (int)authTraits
{
  -[GEOWiFiESS _readAuthTraits]((uint64_t)self);
  return self->_authTraits.list;
}

- (void)clearAuthTraits
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  PBRepeatedInt32Clear();
}

- (void)addAuthTraits:(int)a3
{
  -[GEOWiFiESS _readAuthTraits]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (int)authTraitsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_authTraits;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOWiFiESS _readAuthTraits]((uint64_t)self);
  p_authTraits = &self->_authTraits;
  count = self->_authTraits.count;
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
  return p_authTraits->list[a3];
}

- (void)setAuthTraits:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  PBRepeatedInt32Set();
}

- (id)authTraitsAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C09E50[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAuthTraits:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_AUTH_TRAIT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPEN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEP")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WPA")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EAP")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readQualities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiESSReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQualities_tags_139);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)qualities
{
  -[GEOWiFiESS _readQualities]((uint64_t)self);
  return self->_qualities;
}

- (void)setQualities:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *qualities;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  qualities = self->_qualities;
  self->_qualities = v4;

}

- (void)clearQualities
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  -[NSMutableArray removeAllObjects](self->_qualities, "removeAllObjects");
}

- (void)addQualities:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOWiFiESS _readQualities]((uint64_t)self);
  -[GEOWiFiESS _addNoFlagsQualities:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsQualities:(uint64_t)a1
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

- (unint64_t)qualitiesCount
{
  -[GEOWiFiESS _readQualities]((uint64_t)self);
  return -[NSMutableArray count](self->_qualities, "count");
}

- (id)qualitiesAtIndex:(unint64_t)a3
{
  -[GEOWiFiESS _readQualities]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_qualities, "objectAtIndex:", a3);
}

+ (Class)qualitiesType
{
  return (Class)objc_opt_class();
}

- (void)_readAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiESSReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributes_tags_140);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)attributesCount
{
  -[GEOWiFiESS _readAttributes]((uint64_t)self);
  return self->_attributes.count;
}

- (int)attributes
{
  -[GEOWiFiESS _readAttributes]((uint64_t)self);
  return self->_attributes.list;
}

- (void)clearAttributes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  PBRepeatedInt32Clear();
}

- (void)addAttributes:(int)a3
{
  -[GEOWiFiESS _readAttributes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (int)attributesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_attributes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOWiFiESS _readAttributes]((uint64_t)self);
  p_attributes = &self->_attributes;
  count = self->_attributes.count;
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
  return p_attributes->list[a3];
}

- (void)setAttributes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  PBRepeatedInt32Set();
}

- (id)attributesAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C09E78[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAttributes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISCAPTIVE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISMOVING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISPUBLIC")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISSUSPICIOUS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ISLOWQUALITY")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(int64_t)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_uniqueIdentifier = a3;
}

- (void)setHasUniqueIdentifier:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasUniqueIdentifier
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readOwnerIdentifiers
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiESSReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOwnerIdentifiers_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)ownerIdentifiers
{
  -[GEOWiFiESS _readOwnerIdentifiers]((uint64_t)self);
  return self->_ownerIdentifiers;
}

- (void)setOwnerIdentifiers:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *ownerIdentifiers;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  ownerIdentifiers = self->_ownerIdentifiers;
  self->_ownerIdentifiers = v4;

}

- (void)clearOwnerIdentifiers
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  -[NSMutableArray removeAllObjects](self->_ownerIdentifiers, "removeAllObjects");
}

- (void)addOwnerIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOWiFiESS _readOwnerIdentifiers]((uint64_t)self);
  -[GEOWiFiESS _addNoFlagsOwnerIdentifier:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsOwnerIdentifier:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)ownerIdentifiersCount
{
  -[GEOWiFiESS _readOwnerIdentifiers]((uint64_t)self);
  return -[NSMutableArray count](self->_ownerIdentifiers, "count");
}

- (id)ownerIdentifierAtIndex:(unint64_t)a3
{
  -[GEOWiFiESS _readOwnerIdentifiers]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_ownerIdentifiers, "objectAtIndex:", a3);
}

+ (Class)ownerIdentifierType
{
  return (Class)objc_opt_class();
}

- (int)networkType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_networkType;
  else
    return 0;
}

- (void)setNetworkType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_networkType = a3;
}

- (void)setHasNetworkType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2050;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasNetworkType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)networkTypeAsString:(int)a3
{
  if (a3 < 0x11)
    return off_1E1C09EA8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNetworkType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIVATE_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIVATE_WITH_GUEST_ACCESS_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHARGEABLE_PUBLIC_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREE_PUBLIC_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONAL_DEVICE_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMERGENCY_SERVICE_ONLY_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_1")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_2")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_3")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_4")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_5")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_6")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_7")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_8")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEST_OR_EXPERIMENTAL_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WILDCARD_NETWORK_TYPE")))
  {
    v4 = 16;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)venueGroup
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_venueGroup;
  else
    return 0;
}

- (void)setVenueGroup:(int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_venueGroup = a3;
}

- (void)setHasVenueGroup:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2052;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasVenueGroup
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)venueGroupAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E1C09F30[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsVenueGroup:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_VENUE_GROUP")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ASSEMBLY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDUCATIONAL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FACTORY_AND_INDUSTRIAL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INSTITUTIONAL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MERCANTILE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESIDENTIAL")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STORAGE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UTILITY_AND_MISC")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VEHICULAR")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OUTDOOR")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)venueType
{
  return self->_venueType;
}

- (void)setVenueType:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_venueType = a3;
}

- (void)setHasVenueType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2056;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasVenueType
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
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
  v8.super_class = (Class)GEOWiFiESS;
  -[GEOWiFiESS description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiESS dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiESS _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  unint64_t v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  unint64_t v30;
  uint64_t v31;
  __CFString *v32;
  void *v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __CFString *v37;
  uint64_t v38;
  __CFString *v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("identifier"));

    if (objc_msgSend(*(id *)(a1 + 64), "count"))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v7 = *(id *)(a1 + 64);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v47 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            if ((a2 & 1) != 0)
              objc_msgSend(v12, "jsonRepresentation");
            else
              objc_msgSend(v12, "dictionaryRepresentation");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        }
        while (v9);
      }

      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("bss"));
    }
    objc_msgSend((id)a1, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("name"));

    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (_QWORD *)(a1 + 40);
      if (*(_QWORD *)(a1 + 48))
      {
        v17 = 0;
        do
        {
          v18 = *(int *)(*v16 + 4 * v17);
          if (v18 >= 5)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v18);
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v19 = off_1E1C09E50[v18];
          }
          objc_msgSend(v15, "addObject:", v19);

          ++v17;
          v16 = (_QWORD *)(a1 + 40);
        }
        while (v17 < *(_QWORD *)(a1 + 48));
      }
      objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("authTraits"));

    }
    if (objc_msgSend(*(id *)(a1 + 96), "count"))
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v21 = *(id *)(a1 + 96);
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v43 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
            if ((a2 & 1) != 0)
              objc_msgSend(v26, "jsonRepresentation");
            else
              objc_msgSend(v26, "dictionaryRepresentation");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v27);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        }
        while (v23);
      }

      objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("qualities"));
    }
    if (*(_QWORD *)(a1 + 24))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (_QWORD *)(a1 + 16);
      if (*(_QWORD *)(a1 + 24))
      {
        v30 = 0;
        do
        {
          v31 = *(int *)(*v29 + 4 * v30);
          if (v31 >= 6)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v31);
            v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v32 = off_1E1C09E78[v31];
          }
          objc_msgSend(v28, "addObject:", v32);

          ++v30;
          v29 = (_QWORD *)(a1 + 16);
        }
        while (v30 < *(_QWORD *)(a1 + 24));
      }
      objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("attributes"));

    }
    if ((*(_WORD *)(a1 + 136) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 104));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("uniqueIdentifier"));

    }
    if (*(_QWORD *)(a1 + 88))
    {
      objc_msgSend((id)a1, "ownerIdentifiers");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("ownerIdentifier"));

    }
    v35 = *(_WORD *)(a1 + 136);
    if ((v35 & 2) != 0)
    {
      v36 = *(int *)(a1 + 124);
      if (v36 >= 0x11)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 124));
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v37 = off_1E1C09EA8[v36];
      }
      objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("networkType"));

      v35 = *(_WORD *)(a1 + 136);
      if ((v35 & 4) == 0)
      {
LABEL_52:
        if ((v35 & 8) == 0)
          return v4;
        goto LABEL_62;
      }
    }
    else if ((v35 & 4) == 0)
    {
      goto LABEL_52;
    }
    v38 = *(int *)(a1 + 128);
    if (v38 >= 0xC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 128));
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = off_1E1C09F30[v38];
    }
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("venueGroup"));

    if ((*(_WORD *)(a1 + 136) & 8) == 0)
      return v4;
LABEL_62:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 132));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("venueType"));

    return v4;
  }
  return 0;
}

- (id)jsonRepresentation
{
  return -[GEOWiFiESS _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOWiFiESS)initWithDictionary:(id)a3
{
  return (GEOWiFiESS *)-[GEOWiFiESS _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  GEOWiFiBSS *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  GEOWiFiQualityProfile *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t n;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
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
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_174;
  }
  v6 = (void *)objc_msgSend(a1, "init");
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v6, "setIdentifier:", v8);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bss"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v67 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v66 = v9;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v85;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v85 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = [GEOWiFiBSS alloc];
              if ((a3 & 1) != 0)
                v17 = -[GEOWiFiBSS initWithJSON:](v16, "initWithJSON:", v15);
              else
                v17 = -[GEOWiFiBSS initWithDictionary:](v16, "initWithDictionary:", v15);
              v18 = (void *)v17;
              objc_msgSend(v6, "addBss:", v17, v66);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
        }
        while (v12);
      }

      v9 = v66;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = (void *)objc_msgSend(v19, "copy");
      objc_msgSend(v6, "setName:", v20);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("authTraits"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v66 = v21;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
      if (!v23)
        goto LABEL_45;
      v24 = v23;
      v25 = *(_QWORD *)v81;
      while (1)
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v81 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v28 = v27;
            if ((objc_msgSend(v28, "isEqualToString:", CFSTR("UNKNOWN_AUTH_TRAIT")) & 1) != 0)
            {
              v29 = 0;
            }
            else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("OPEN")) & 1) != 0)
            {
              v29 = 1;
            }
            else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("WEP")) & 1) != 0)
            {
              v29 = 2;
            }
            else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("WPA")) & 1) != 0)
            {
              v29 = 3;
            }
            else if (objc_msgSend(v28, "isEqualToString:", CFSTR("EAP")))
            {
              v29 = 4;
            }
            else
            {
              v29 = 0;
            }

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            v29 = objc_msgSend(v27, "intValue");
          }
          objc_msgSend(v6, "addAuthTraits:", v29, v66);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
        if (!v24)
        {
LABEL_45:

          v21 = v66;
          v5 = v67;
          break;
        }
      }
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("qualities"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v66 = v30;
      v31 = v30;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v77;
        do
        {
          for (k = 0; k != v33; ++k)
          {
            if (*(_QWORD *)v77 != v34)
              objc_enumerationMutation(v31);
            v36 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v37 = [GEOWiFiQualityProfile alloc];
              if ((a3 & 1) != 0)
                v38 = -[GEOWiFiQualityProfile initWithJSON:](v37, "initWithJSON:", v36);
              else
                v38 = -[GEOWiFiQualityProfile initWithDictionary:](v37, "initWithDictionary:", v36);
              v39 = (void *)v38;
              objc_msgSend(v6, "addQualities:", v38, v66);

            }
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
        }
        while (v33);
      }

      v30 = v66;
      v5 = v67;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attributes"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v66 = v40;
      v41 = v40;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
      if (!v42)
        goto LABEL_86;
      v43 = v42;
      v44 = *(_QWORD *)v73;
      while (1)
      {
        for (m = 0; m != v43; ++m)
        {
          if (*(_QWORD *)v73 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v47 = v46;
            if ((objc_msgSend(v47, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
            {
              v48 = 0;
            }
            else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("ISCAPTIVE")) & 1) != 0)
            {
              v48 = 1;
            }
            else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("ISMOVING")) & 1) != 0)
            {
              v48 = 2;
            }
            else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("ISPUBLIC")) & 1) != 0)
            {
              v48 = 3;
            }
            else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("ISSUSPICIOUS")) & 1) != 0)
            {
              v48 = 4;
            }
            else if (objc_msgSend(v47, "isEqualToString:", CFSTR("ISLOWQUALITY")))
            {
              v48 = 5;
            }
            else
            {
              v48 = 0;
            }

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            v48 = objc_msgSend(v46, "intValue");
          }
          objc_msgSend(v6, "addAttributes:", v48, v66);
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
        if (!v43)
        {
LABEL_86:

          v40 = v66;
          v5 = v67;
          break;
        }
      }
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uniqueIdentifier"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setUniqueIdentifier:", objc_msgSend(v49, "longLongValue"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ownerIdentifier"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v51 = v50;
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v68, v88, 16);
      if (v52)
      {
        v53 = v52;
        v54 = *(_QWORD *)v69;
        do
        {
          for (n = 0; n != v53; ++n)
          {
            if (*(_QWORD *)v69 != v54)
              objc_enumerationMutation(v51);
            v56 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * n);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v57 = (void *)objc_msgSend(v56, "copy");
              objc_msgSend(v6, "addOwnerIdentifier:", v57);

            }
          }
          v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v68, v88, 16);
        }
        while (v53);
      }

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("networkType"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = v58;
      if ((objc_msgSend(v59, "isEqualToString:", CFSTR("UNKNOWN_NETWORK_TYPE")) & 1) != 0)
      {
        v60 = 0;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("PRIVATE_NETWORK_TYPE")) & 1) != 0)
      {
        v60 = 1;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("PRIVATE_WITH_GUEST_ACCESS_NETWORK_TYPE")) & 1) != 0)
      {
        v60 = 2;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("CHARGEABLE_PUBLIC_NETWORK_TYPE")) & 1) != 0)
      {
        v60 = 3;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("FREE_PUBLIC_NETWORK_TYPE")) & 1) != 0)
      {
        v60 = 4;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("PERSONAL_DEVICE_NETWORK_TYPE")) & 1) != 0)
      {
        v60 = 5;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("EMERGENCY_SERVICE_ONLY_NETWORK_TYPE")) & 1) != 0)
      {
        v60 = 6;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_1")) & 1) != 0)
      {
        v60 = 7;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_2")) & 1) != 0)
      {
        v60 = 8;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_3")) & 1) != 0)
      {
        v60 = 9;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_4")) & 1) != 0)
      {
        v60 = 10;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_5")) & 1) != 0)
      {
        v60 = 11;
      }
      else
      {
        if ((objc_msgSend(v59, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_6")) & 1) != 0)
        {
          v60 = 12;
        }
        else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_7")) & 1) != 0)
        {
          v60 = 13;
        }
        else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_8")) & 1) != 0)
        {
          v60 = 14;
        }
        else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("TEST_OR_EXPERIMENTAL_NETWORK_TYPE")) & 1) != 0)
        {
          v60 = 15;
        }
        else if (objc_msgSend(v59, "isEqualToString:", CFSTR("WILDCARD_NETWORK_TYPE")))
        {
          v60 = 16;
        }
        else
        {
          v60 = 0;
        }
        v5 = v67;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_141;
      v60 = objc_msgSend(v58, "intValue");
    }
    objc_msgSend(v6, "setNetworkType:", v60, v66);
LABEL_141:

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("venueGroup"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v62 = v61;
      if ((objc_msgSend(v62, "isEqualToString:", CFSTR("UNKNOWN_VENUE_GROUP")) & 1) != 0)
      {
        v63 = 0;
      }
      else if ((objc_msgSend(v62, "isEqualToString:", CFSTR("ASSEMBLY")) & 1) != 0)
      {
        v63 = 1;
      }
      else if ((objc_msgSend(v62, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
      {
        v63 = 2;
      }
      else if ((objc_msgSend(v62, "isEqualToString:", CFSTR("EDUCATIONAL")) & 1) != 0)
      {
        v63 = 3;
      }
      else if ((objc_msgSend(v62, "isEqualToString:", CFSTR("FACTORY_AND_INDUSTRIAL")) & 1) != 0)
      {
        v63 = 4;
      }
      else if ((objc_msgSend(v62, "isEqualToString:", CFSTR("INSTITUTIONAL")) & 1) != 0)
      {
        v63 = 5;
      }
      else if ((objc_msgSend(v62, "isEqualToString:", CFSTR("MERCANTILE")) & 1) != 0)
      {
        v63 = 6;
      }
      else if ((objc_msgSend(v62, "isEqualToString:", CFSTR("RESIDENTIAL")) & 1) != 0)
      {
        v63 = 7;
      }
      else if ((objc_msgSend(v62, "isEqualToString:", CFSTR("STORAGE")) & 1) != 0)
      {
        v63 = 8;
      }
      else if ((objc_msgSend(v62, "isEqualToString:", CFSTR("UTILITY_AND_MISC")) & 1) != 0)
      {
        v63 = 9;
      }
      else if ((objc_msgSend(v62, "isEqualToString:", CFSTR("VEHICULAR")) & 1) != 0)
      {
        v63 = 10;
      }
      else if (objc_msgSend(v62, "isEqualToString:", CFSTR("OUTDOOR")))
      {
        v63 = 11;
      }
      else
      {
        v63 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_171:

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("venueType"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "setVenueType:", objc_msgSend(v64, "unsignedIntValue"));

        goto LABEL_174;
      }
      v63 = objc_msgSend(v61, "intValue");
    }
    objc_msgSend(v6, "setVenueGroup:", v63, v66);
    goto LABEL_171;
  }
LABEL_174:

  return v6;
}

- (GEOWiFiESS)initWithJSON:(id)a3
{
  return (GEOWiFiESS *)-[GEOWiFiESS _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_155;
    else
      v8 = (int *)&readAll__nonRecursiveTag_156;
    GEOWiFiESSReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOWiFiESSCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiESSIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiESSReadAllFrom((uint64_t)self, a3, 0);
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  unint64_t v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  __int16 flags;
  PBDataReader *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOWiFiESSIsDirty((uint64_t)self) & 1) == 0)
  {
    v21 = self->_reader;
    objc_sync_enter(v21);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v22);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v21);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOWiFiESS readAll:](self, "readAll:", 0);
    if (self->_identifier)
      PBDataWriterWriteStringField();
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v6 = self->_bss;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v7);
    }

    if (self->_name)
      PBDataWriterWriteStringField();
    if (self->_authTraits.count)
    {
      v10 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v10 < self->_authTraits.count);
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = self->_qualities;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v12);
    }

    if (self->_attributes.count)
    {
      v15 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v15;
      }
      while (v15 < self->_attributes.count);
    }
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt64Field();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = self->_ownerIdentifiers;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v24;
      do
      {
        for (k = 0; k != v17; ++k)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v16);
          PBDataWriterWriteStringField();
        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      }
      while (v17);
    }

    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
      PBDataWriterWriteUint32Field();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOWiFiESS _readBss]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_bss;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
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
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t m;
  unint64_t v18;
  unint64_t v19;
  uint64_t n;
  void *v21;
  __int16 flags;
  id *v23;

  v23 = (id *)a3;
  -[GEOWiFiESS readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v23 + 1, self->_reader);
  *((_DWORD *)v23 + 28) = self->_readerMarkPos;
  *((_DWORD *)v23 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_identifier)
    objc_msgSend(v23, "setIdentifier:");
  if (-[GEOWiFiESS bssCount](self, "bssCount"))
  {
    objc_msgSend(v23, "clearBss");
    v4 = -[GEOWiFiESS bssCount](self, "bssCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOWiFiESS bssAtIndex:](self, "bssAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addBss:", v7);

      }
    }
  }
  if (self->_name)
    objc_msgSend(v23, "setName:");
  if (-[GEOWiFiESS authTraitsCount](self, "authTraitsCount"))
  {
    objc_msgSend(v23, "clearAuthTraits");
    v8 = -[GEOWiFiESS authTraitsCount](self, "authTraitsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(v23, "addAuthTraits:", -[GEOWiFiESS authTraitsAtIndex:](self, "authTraitsAtIndex:", j));
    }
  }
  if (-[GEOWiFiESS qualitiesCount](self, "qualitiesCount"))
  {
    objc_msgSend(v23, "clearQualities");
    v11 = -[GEOWiFiESS qualitiesCount](self, "qualitiesCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
      {
        -[GEOWiFiESS qualitiesAtIndex:](self, "qualitiesAtIndex:", k);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addQualities:", v14);

      }
    }
  }
  if (-[GEOWiFiESS attributesCount](self, "attributesCount"))
  {
    objc_msgSend(v23, "clearAttributes");
    v15 = -[GEOWiFiESS attributesCount](self, "attributesCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
        objc_msgSend(v23, "addAttributes:", -[GEOWiFiESS attributesAtIndex:](self, "attributesAtIndex:", m));
    }
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    v23[13] = (id)self->_uniqueIdentifier;
    *((_WORD *)v23 + 68) |= 1u;
  }
  if (-[GEOWiFiESS ownerIdentifiersCount](self, "ownerIdentifiersCount"))
  {
    objc_msgSend(v23, "clearOwnerIdentifiers");
    v18 = -[GEOWiFiESS ownerIdentifiersCount](self, "ownerIdentifiersCount");
    if (v18)
    {
      v19 = v18;
      for (n = 0; n != v19; ++n)
      {
        -[GEOWiFiESS ownerIdentifierAtIndex:](self, "ownerIdentifierAtIndex:", n);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addOwnerIdentifier:", v21);

      }
    }
  }
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 4) == 0)
      goto LABEL_29;
LABEL_33:
    *((_DWORD *)v23 + 32) = self->_venueGroup;
    *((_WORD *)v23 + 68) |= 4u;
    if ((*(_WORD *)&self->_flags & 8) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
  *((_DWORD *)v23 + 31) = self->_networkType;
  *((_WORD *)v23 + 68) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_33;
LABEL_29:
  if ((flags & 8) != 0)
  {
LABEL_30:
    *((_DWORD *)v23 + 33) = self->_venueType;
    *((_WORD *)v23 + 68) |= 8u;
  }
LABEL_31:

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
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  __int16 flags;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOWiFiESS readAll:](self, "readAll:", 0);
    v9 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v9;

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v11 = self->_bss;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(v11);
          v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "copyWithZone:", a3);
          objc_msgSend((id)v5, "addBss:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v12);
    }

    v16 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v16;

    PBRepeatedInt32Copy();
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v18 = self->_qualities;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v35 != v20)
            objc_enumerationMutation(v18);
          v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "copyWithZone:", a3);
          objc_msgSend((id)v5, "addQualities:", v22);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v19);
    }

    PBRepeatedInt32Copy();
    if ((*(_WORD *)&self->_flags & 1) != 0)
    {
      *(_QWORD *)(v5 + 104) = self->_uniqueIdentifier;
      *(_WORD *)(v5 + 136) |= 1u;
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = self->_ownerIdentifiers;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v31;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v23);
          v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v30);
          objc_msgSend((id)v5, "addOwnerIdentifier:", v27);

        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v24);
    }

    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 124) = self->_networkType;
      *(_WORD *)(v5 + 136) |= 2u;
      flags = (__int16)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_30:
        if ((flags & 8) == 0)
          return (id)v5;
LABEL_31:
        *(_DWORD *)(v5 + 132) = self->_venueType;
        *(_WORD *)(v5 + 136) |= 8u;
        return (id)v5;
      }
    }
    else if ((flags & 4) == 0)
    {
      goto LABEL_30;
    }
    *(_DWORD *)(v5 + 128) = self->_venueGroup;
    *(_WORD *)(v5 + 136) |= 4u;
    if ((*(_WORD *)&self->_flags & 8) == 0)
      return (id)v5;
    goto LABEL_31;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOWiFiESSReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSMutableArray *bss;
  NSString *name;
  NSMutableArray *qualities;
  __int16 flags;
  __int16 v10;
  NSMutableArray *ownerIdentifiers;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  -[GEOWiFiESS readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_34;
  }
  bss = self->_bss;
  if ((unint64_t)bss | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](bss, "isEqual:"))
      goto LABEL_34;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_34;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_34;
  qualities = self->_qualities;
  if ((unint64_t)qualities | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](qualities, "isEqual:"))
      goto LABEL_34;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_34;
  flags = (__int16)self->_flags;
  v10 = *((_WORD *)v4 + 68);
  if ((flags & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_uniqueIdentifier != *((_QWORD *)v4 + 13))
      goto LABEL_34;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_34;
  }
  ownerIdentifiers = self->_ownerIdentifiers;
  if ((unint64_t)ownerIdentifiers | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](ownerIdentifiers, "isEqual:"))
    {
LABEL_34:
      v12 = 0;
      goto LABEL_35;
    }
    flags = (__int16)self->_flags;
    v10 = *((_WORD *)v4 + 68);
  }
  if ((flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_networkType != *((_DWORD *)v4 + 31))
      goto LABEL_34;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_venueGroup != *((_DWORD *)v4 + 32))
      goto LABEL_34;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_34;
  }
  v12 = (v10 & 8) == 0;
  if ((flags & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_venueType != *((_DWORD *)v4 + 33))
      goto LABEL_34;
    v12 = 1;
  }
LABEL_35:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 flags;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  -[GEOWiFiESS readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSMutableArray hash](self->_bss, "hash");
  v5 = -[NSString hash](self->_name, "hash");
  v6 = PBRepeatedInt32Hash();
  v7 = -[NSMutableArray hash](self->_qualities, "hash");
  v8 = PBRepeatedInt32Hash();
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v9 = 2654435761 * self->_uniqueIdentifier;
  else
    v9 = 0;
  v10 = -[NSMutableArray hash](self->_ownerIdentifiers, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    v12 = 0;
    if ((flags & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v13 = 0;
    if ((flags & 8) != 0)
      goto LABEL_7;
LABEL_10:
    v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14;
  }
  v12 = 2654435761 * self->_networkType;
  if ((flags & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v13 = 2654435761 * self->_venueGroup;
  if ((flags & 8) == 0)
    goto LABEL_10;
LABEL_7:
  v14 = 2654435761 * self->_venueType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14;
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
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  uint64_t v18;
  uint64_t v19;
  uint64_t m;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t n;
  __int16 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 9))
    -[GEOWiFiESS setIdentifier:](self, "setIdentifier:");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = *((id *)v4 + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        -[GEOWiFiESS addBss:](self, "addBss:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 10))
    -[GEOWiFiESS setName:](self, "setName:");
  v10 = objc_msgSend(v4, "authTraitsCount");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
      -[GEOWiFiESS addAuthTraits:](self, "addAuthTraits:", objc_msgSend(v4, "authTraitsAtIndex:", j));
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = *((id *)v4 + 12);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v13);
        -[GEOWiFiESS addQualities:](self, "addQualities:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v15);
  }

  v18 = objc_msgSend(v4, "attributesCount");
  if (v18)
  {
    v19 = v18;
    for (m = 0; m != v19; ++m)
      -[GEOWiFiESS addAttributes:](self, "addAttributes:", objc_msgSend(v4, "attributesAtIndex:", m));
  }
  if ((*((_WORD *)v4 + 68) & 1) != 0)
  {
    self->_uniqueIdentifier = *((_QWORD *)v4 + 13);
    *(_WORD *)&self->_flags |= 1u;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v21 = *((id *)v4 + 11);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v28;
    do
    {
      for (n = 0; n != v23; ++n)
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v21);
        -[GEOWiFiESS addOwnerIdentifier:](self, "addOwnerIdentifier:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * n), (_QWORD)v27);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v23);
  }

  v26 = *((_WORD *)v4 + 68);
  if ((v26 & 2) == 0)
  {
    if ((v26 & 4) == 0)
      goto LABEL_36;
LABEL_40:
    self->_venueGroup = *((_DWORD *)v4 + 32);
    *(_WORD *)&self->_flags |= 4u;
    if ((*((_WORD *)v4 + 68) & 8) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
  self->_networkType = *((_DWORD *)v4 + 31);
  *(_WORD *)&self->_flags |= 2u;
  v26 = *((_WORD *)v4 + 68);
  if ((v26 & 4) != 0)
    goto LABEL_40;
LABEL_36:
  if ((v26 & 8) != 0)
  {
LABEL_37:
    self->_venueType = *((_DWORD *)v4 + 33);
    *(_WORD *)&self->_flags |= 8u;
  }
LABEL_38:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualities, 0);
  objc_storeStrong((id *)&self->_ownerIdentifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bss, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
