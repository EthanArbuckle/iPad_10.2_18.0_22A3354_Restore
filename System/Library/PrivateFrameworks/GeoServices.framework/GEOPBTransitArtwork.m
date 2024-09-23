@implementation GEOPBTransitArtwork

- (GEOPBTransitArtwork)init
{
  GEOPBTransitArtwork *v2;
  GEOPBTransitArtwork *v3;
  GEOPBTransitArtwork *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitArtwork;
  v2 = -[GEOPBTransitArtwork init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitArtwork)initWithData:(id)a3
{
  GEOPBTransitArtwork *v3;
  GEOPBTransitArtwork *v4;
  GEOPBTransitArtwork *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitArtwork;
  v3 = -[GEOPBTransitArtwork initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)artworkType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_artworkType;
  else
    return 0;
}

- (void)setArtworkType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_artworkType = a3;
}

- (void)setHasArtworkType:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasArtworkType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)artworkTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C083A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsArtworkType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK_TYPE_SHIELD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK_TYPE_ICON")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)artworkUse
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_artworkUse;
  else
    return 0;
}

- (void)setArtworkUse:(int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_artworkUse = a3;
}

- (void)setHasArtworkUse:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 258;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasArtworkUse
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)artworkUseAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0xD && ((0x1EFBu >> a3) & 1) != 0)
  {
    v3 = off_1E1C083C0[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsArtworkUse:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK_USE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK_USE_LINE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK_USE_MODE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK_USE_SYSTEM")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK_USE_TRIP")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK_USE_ACCESS_POINT")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK_USE_STATION")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK_USE_MANEUVER")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK_USE_HALL")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK_USE_STATION_LINE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK_USE_VEHICLE_POSITION")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readShield
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitArtworkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShield_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasShield
{
  -[GEOPBTransitArtwork _readShield]((uint64_t)self);
  return self->_shield != 0;
}

- (GEOPBTransitShield)shield
{
  -[GEOPBTransitArtwork _readShield]((uint64_t)self);
  return self->_shield;
}

- (void)setShield:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_shield, a3);
}

- (void)_readIcon
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitArtworkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIcon_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasIcon
{
  -[GEOPBTransitArtwork _readIcon]((uint64_t)self);
  return self->_icon != 0;
}

- (GEOPBTransitIcon)icon
{
  -[GEOPBTransitArtwork _readIcon]((uint64_t)self);
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void)_readIconFallbackShield
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitArtworkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIconFallbackShield_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasIconFallbackShield
{
  -[GEOPBTransitArtwork _readIconFallbackShield]((uint64_t)self);
  return self->_iconFallbackShield != 0;
}

- (GEOPBTransitShield)iconFallbackShield
{
  -[GEOPBTransitArtwork _readIconFallbackShield]((uint64_t)self);
  return self->_iconFallbackShield;
}

- (void)setIconFallbackShield:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_iconFallbackShield, a3);
}

- (int)badge
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_badge;
  else
    return 0;
}

- (void)setBadge:(int)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  self->_badge = a3;
}

- (void)setHasBadge:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 260;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasBadge
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)badgeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("ARTWORK_BADGE_UNKNOWN");
  if (a3 == 1)
  {
    v3 = CFSTR("ARTWORK_BADGE_WARNING");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsBadge:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK_BADGE_UNKNOWN")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ARTWORK_BADGE_WARNING"));

  return v4;
}

- (void)_readAccessibilityString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitArtworkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAccessibilityString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAccessibilityString
{
  -[GEOPBTransitArtwork _readAccessibilityString]((uint64_t)self);
  return self->_accessibilityString != 0;
}

- (NSString)accessibilityString
{
  -[GEOPBTransitArtwork _readAccessibilityString]((uint64_t)self);
  return self->_accessibilityString;
}

- (void)setAccessibilityString:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_accessibilityString, a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitArtwork;
  -[GEOPBTransitArtwork description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBTransitArtwork dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitArtwork _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  int v22;
  __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v33[4];
  id v34;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 1) != 0)
  {
    v6 = *(int *)(a1 + 68);
    if (v6 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C083A8[v6];
    }
    if (a2)
      v8 = CFSTR("artworkType");
    else
      v8 = CFSTR("artwork_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_WORD *)(a1 + 80);
  }
  if ((v5 & 2) != 0)
  {
    v9 = *(int *)(a1 + 72);
    if (v9 < 0xD && ((0x1EFBu >> v9) & 1) != 0)
    {
      v10 = off_1E1C083C0[v9];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 72));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (a2)
      v11 = CFSTR("artworkUse");
    else
      v11 = CFSTR("artwork_use");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  objc_msgSend((id)a1, "shield");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v12, "jsonRepresentation");
    else
      objc_msgSend(v12, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("shield"));

  }
  objc_msgSend((id)a1, "icon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v15, "jsonRepresentation");
    else
      objc_msgSend(v15, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("icon"));

  }
  objc_msgSend((id)a1, "iconFallbackShield");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("iconFallbackShield");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("icon_fallback_shield");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  if ((*(_WORD *)(a1 + 80) & 4) != 0)
  {
    v22 = *(_DWORD *)(a1 + 76);
    if (v22)
    {
      if (v22 == 1)
      {
        v23 = CFSTR("ARTWORK_BADGE_WARNING");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 76));
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v23 = CFSTR("ARTWORK_BADGE_UNKNOWN");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("badge"));

  }
  objc_msgSend((id)a1, "accessibilityString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    if (a2)
      v25 = CFSTR("accessibilityString");
    else
      v25 = CFSTR("accessibility_string");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);
  }

  v26 = *(void **)(a1 + 16);
  if (v26)
  {
    objc_msgSend(v26, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __49__GEOPBTransitArtwork__dictionaryRepresentation___block_invoke;
      v33[3] = &unk_1E1C00600;
      v30 = v29;
      v34 = v30;
      objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v33);
      v31 = v30;

      v28 = v31;
    }
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitArtwork _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOPBTransitArtwork__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitArtwork)initWithDictionary:(id)a3
{
  return (GEOPBTransitArtwork *)-[GEOPBTransitArtwork _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  GEOPBTransitShield *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  GEOPBTransitIcon *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  GEOPBTransitShield *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  void *v32;

  v5 = a2;
  if (!a1)
    goto LABEL_81;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_81;
  if (a3)
    v6 = CFSTR("artworkType");
  else
    v6 = CFSTR("artwork_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ARTWORK_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ARTWORK_TYPE_SHIELD")) & 1) != 0)
    {
      v9 = 1;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("ARTWORK_TYPE_ICON")))
    {
      v9 = 2;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_18;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setArtworkType:", v9);
LABEL_18:

  if (a3)
    v10 = CFSTR("artworkUse");
  else
    v10 = CFSTR("artwork_use");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ARTWORK_USE_UNKNOWN")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ARTWORK_USE_LINE")) & 1) != 0)
    {
      v13 = 1;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ARTWORK_USE_MODE")) & 1) != 0)
    {
      v13 = 3;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ARTWORK_USE_SYSTEM")) & 1) != 0)
    {
      v13 = 4;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ARTWORK_USE_TRIP")) & 1) != 0)
    {
      v13 = 5;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ARTWORK_USE_ACCESS_POINT")) & 1) != 0)
    {
      v13 = 6;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ARTWORK_USE_STATION")) & 1) != 0)
    {
      v13 = 7;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ARTWORK_USE_MANEUVER")) & 1) != 0)
    {
      v13 = 9;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ARTWORK_USE_HALL")) & 1) != 0)
    {
      v13 = 10;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ARTWORK_USE_STATION_LINE")) & 1) != 0)
    {
      v13 = 11;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("ARTWORK_USE_VEHICLE_POSITION")))
    {
      v13 = 12;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_49;
    v13 = objc_msgSend(v11, "intValue");
  }
  objc_msgSend(a1, "setArtworkUse:", v13);
LABEL_49:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shield"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = [GEOPBTransitShield alloc];
    if ((a3 & 1) != 0)
      v16 = -[GEOPBTransitShield initWithJSON:](v15, "initWithJSON:", v14);
    else
      v16 = -[GEOPBTransitShield initWithDictionary:](v15, "initWithDictionary:", v14);
    v17 = (void *)v16;
    objc_msgSend(a1, "setShield:", v16);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("icon"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = [GEOPBTransitIcon alloc];
    if ((a3 & 1) != 0)
      v20 = -[GEOPBTransitIcon initWithJSON:](v19, "initWithJSON:", v18);
    else
      v20 = -[GEOPBTransitIcon initWithDictionary:](v19, "initWithDictionary:", v18);
    v21 = (void *)v20;
    objc_msgSend(a1, "setIcon:", v20);

  }
  if (a3)
    v22 = CFSTR("iconFallbackShield");
  else
    v22 = CFSTR("icon_fallback_shield");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = [GEOPBTransitShield alloc];
    if ((a3 & 1) != 0)
      v25 = -[GEOPBTransitShield initWithJSON:](v24, "initWithJSON:", v23);
    else
      v25 = -[GEOPBTransitShield initWithDictionary:](v24, "initWithDictionary:", v23);
    v26 = (void *)v25;
    objc_msgSend(a1, "setIconFallbackShield:", v25);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("badge"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = v27;
    if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ARTWORK_BADGE_UNKNOWN")) & 1) != 0)
      v29 = 0;
    else
      v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("ARTWORK_BADGE_WARNING"));

    goto LABEL_74;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = objc_msgSend(v27, "intValue");
LABEL_74:
    objc_msgSend(a1, "setBadge:", v29);
  }

  if (a3)
    v30 = CFSTR("accessibilityString");
  else
    v30 = CFSTR("accessibility_string");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(a1, "setAccessibilityString:", v32);

  }
LABEL_81:

  return a1;
}

- (GEOPBTransitArtwork)initWithJSON:(id)a3
{
  return (GEOPBTransitArtwork *)-[GEOPBTransitArtwork _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3505;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3506;
    GEOPBTransitArtworkReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOPBTransitShield readAll:](self->_shield, "readAll:", 1);
    -[GEOPBTransitIcon readAll:](self->_icon, "readAll:", 1);
    -[GEOPBTransitShield readAll:](self->_iconFallbackShield, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitArtworkIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitArtworkReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPBTransitArtworkIsDirty((uint64_t)self) & 1) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPBTransitArtwork readAll:](self, "readAll:", 0);
    flags = (__int16)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    v6 = v9;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v6 = v9;
    }
    if (self->_shield)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    if (self->_icon)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    if (self->_iconFallbackShield)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    if ((*(_WORD *)&self->_flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      v6 = v9;
    }
    if (self->_accessibilityString)
    {
      PBDataWriterWriteStringField();
      v6 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOPBTransitArtwork readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_artworkType;
    *((_WORD *)v6 + 40) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 18) = self->_artworkUse;
    *((_WORD *)v6 + 40) |= 2u;
  }
  if (self->_shield)
  {
    objc_msgSend(v6, "setShield:");
    v4 = v6;
  }
  if (self->_icon)
  {
    objc_msgSend(v6, "setIcon:");
    v4 = v6;
  }
  if (self->_iconFallbackShield)
  {
    objc_msgSend(v6, "setIconFallbackShield:");
    v4 = v6;
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v4 + 19) = self->_badge;
    *((_WORD *)v4 + 40) |= 4u;
  }
  if (self->_accessibilityString)
  {
    objc_msgSend(v6, "setAccessibilityString:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  PBUnknownFields *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPBTransitArtworkReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitArtwork readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_artworkType;
    *(_WORD *)(v5 + 80) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_artworkUse;
    *(_WORD *)(v5 + 80) |= 2u;
  }
  v10 = -[GEOPBTransitShield copyWithZone:](self->_shield, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[GEOPBTransitIcon copyWithZone:](self->_icon, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[GEOPBTransitShield copyWithZone:](self->_iconFallbackShield, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_badge;
    *(_WORD *)(v5 + 80) |= 4u;
  }
  v16 = -[NSString copyWithZone:](self->_accessibilityString, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  v18 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  GEOPBTransitShield *shield;
  GEOPBTransitIcon *icon;
  GEOPBTransitShield *iconFallbackShield;
  __int16 v10;
  NSString *accessibilityString;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[GEOPBTransitArtwork readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 40);
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_artworkType != *((_DWORD *)v4 + 17))
      goto LABEL_25;
  }
  else if ((v6 & 1) != 0)
  {
LABEL_25:
    v12 = 0;
    goto LABEL_26;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_artworkUse != *((_DWORD *)v4 + 18))
      goto LABEL_25;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_25;
  }
  shield = self->_shield;
  if ((unint64_t)shield | *((_QWORD *)v4 + 6) && !-[GEOPBTransitShield isEqual:](shield, "isEqual:"))
    goto LABEL_25;
  icon = self->_icon;
  if ((unint64_t)icon | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPBTransitIcon isEqual:](icon, "isEqual:"))
      goto LABEL_25;
  }
  iconFallbackShield = self->_iconFallbackShield;
  if ((unint64_t)iconFallbackShield | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPBTransitShield isEqual:](iconFallbackShield, "isEqual:"))
      goto LABEL_25;
  }
  v10 = *((_WORD *)v4 + 40);
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_badge != *((_DWORD *)v4 + 19))
      goto LABEL_25;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_25;
  }
  accessibilityString = self->_accessibilityString;
  if ((unint64_t)accessibilityString | *((_QWORD *)v4 + 3))
    v12 = -[NSString isEqual:](accessibilityString, "isEqual:");
  else
    v12 = 1;
LABEL_26:

  return v12;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  -[GEOPBTransitArtwork readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    v4 = 2654435761 * self->_artworkType;
    if ((flags & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((flags & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_artworkUse;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[GEOPBTransitShield hash](self->_shield, "hash");
  v7 = -[GEOPBTransitIcon hash](self->_icon, "hash");
  v8 = -[GEOPBTransitShield hash](self->_iconFallbackShield, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v9 = 2654435761 * self->_badge;
  else
    v9 = 0;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSString hash](self->_accessibilityString, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  __int16 v5;
  GEOPBTransitShield *shield;
  uint64_t v7;
  GEOPBTransitIcon *icon;
  uint64_t v9;
  GEOPBTransitShield *iconFallbackShield;
  uint64_t v11;
  int *v12;

  v12 = (int *)a3;
  objc_msgSend(v12, "readAll:", 0);
  v4 = v12;
  v5 = *((_WORD *)v12 + 40);
  if ((v5 & 1) != 0)
  {
    self->_artworkType = v12[17];
    *(_WORD *)&self->_flags |= 1u;
    v5 = *((_WORD *)v12 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_artworkUse = v12[18];
    *(_WORD *)&self->_flags |= 2u;
  }
  shield = self->_shield;
  v7 = *((_QWORD *)v12 + 6);
  if (shield)
  {
    if (!v7)
      goto LABEL_11;
    -[GEOPBTransitShield mergeFrom:](shield, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    -[GEOPBTransitArtwork setShield:](self, "setShield:");
  }
  v4 = v12;
LABEL_11:
  icon = self->_icon;
  v9 = *((_QWORD *)v4 + 5);
  if (icon)
  {
    if (!v9)
      goto LABEL_17;
    -[GEOPBTransitIcon mergeFrom:](icon, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_17;
    -[GEOPBTransitArtwork setIcon:](self, "setIcon:");
  }
  v4 = v12;
LABEL_17:
  iconFallbackShield = self->_iconFallbackShield;
  v11 = *((_QWORD *)v4 + 4);
  if (iconFallbackShield)
  {
    if (!v11)
      goto LABEL_23;
    -[GEOPBTransitShield mergeFrom:](iconFallbackShield, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_23;
    -[GEOPBTransitArtwork setIconFallbackShield:](self, "setIconFallbackShield:");
  }
  v4 = v12;
LABEL_23:
  if ((v4[20] & 4) != 0)
  {
    self->_badge = v4[19];
    *(_WORD *)&self->_flags |= 4u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[GEOPBTransitArtwork setAccessibilityString:](self, "setAccessibilityString:");
    v4 = v12;
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
      GEOPBTransitArtworkReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3509);
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
  *(_WORD *)&self->_flags |= 0x108u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPBTransitArtwork readAll:](self, "readAll:", 0);
    -[GEOPBTransitShield clearUnknownFields:](self->_shield, "clearUnknownFields:", 1);
    -[GEOPBTransitIcon clearUnknownFields:](self->_icon, "clearUnknownFields:", 1);
    -[GEOPBTransitShield clearUnknownFields:](self->_iconFallbackShield, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shield, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_iconFallbackShield, 0);
  objc_storeStrong((id *)&self->_accessibilityString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (int)artworkSourceType
{
  int v2;
  int v3;

  v2 = -[GEOPBTransitArtwork artworkType](self, "artworkType");
  if (v2 == 2)
    v3 = 2;
  else
    v3 = 1;
  if (v2)
    return v3;
  else
    return 0;
}

- (int)artworkUseType
{
  int v2;

  v2 = -[GEOPBTransitArtwork artworkUse](self, "artworkUse") - 1;
  if (v2 > 0xB)
    return 0;
  else
    return dword_189CDF4E8[v2];
}

- (BOOL)hasRoutingIncidentBadge
{
  _BOOL4 v3;

  v3 = -[GEOPBTransitArtwork hasBadge](self, "hasBadge");
  if (v3)
    LOBYTE(v3) = -[GEOPBTransitArtwork badge](self, "badge") == 1;
  return v3;
}

- (GEOTransitTextDataSource)textDataSource
{
  return 0;
}

@end
