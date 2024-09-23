@implementation GEOWaypointInfo

- (GEOWaypointInfo)init
{
  GEOWaypointInfo *v2;
  GEOWaypointInfo *v3;
  GEOWaypointInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOWaypointInfo;
  v2 = -[GEOWaypointInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWaypointInfo)initWithData:(id)a3
{
  GEOWaypointInfo *v3;
  GEOWaypointInfo *v4;
  GEOWaypointInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOWaypointInfo;
  v3 = -[GEOWaypointInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_7419);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasName
{
  -[GEOWaypointInfo _readName]((uint64_t)self);
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOWaypointInfo _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readPosition
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPosition_tags_7420);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasPosition
{
  -[GEOWaypointInfo _readPosition]((uint64_t)self);
  return self->_position != 0;
}

- (GEOLatLng)position
{
  -[GEOWaypointInfo _readPosition]((uint64_t)self);
  return self->_position;
}

- (void)setPosition:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  objc_storeStrong((id *)&self->_position, a3);
}

- (int)source
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_source;
  else
    return 0;
}

- (void)setSource:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4098;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasSource
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)sourceAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C08858[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SERVICE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readStyleAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_7421);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasStyleAttributes
{
  -[GEOWaypointInfo _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOWaypointInfo _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readArtwork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtwork_tags_7422);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasArtwork
{
  -[GEOWaypointInfo _readArtwork]((uint64_t)self);
  return self->_artwork != 0;
}

- (GEOPBTransitArtwork)artwork
{
  -[GEOWaypointInfo _readArtwork]((uint64_t)self);
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1010u;
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void)_readEvChargingInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvChargingInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasEvChargingInfo
{
  -[GEOWaypointInfo _readEvChargingInfo]((uint64_t)self);
  return self->_evChargingInfo != 0;
}

- (GEOEVChargingInfo)evChargingInfo
{
  -[GEOWaypointInfo _readEvChargingInfo]((uint64_t)self);
  return self->_evChargingInfo;
}

- (void)setEvChargingInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  objc_storeStrong((id *)&self->_evChargingInfo, a3);
}

- (void)_readArInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasArInfo
{
  -[GEOWaypointInfo _readArInfo]((uint64_t)self);
  return self->_arInfo != 0;
}

- (GEOARInfo)arInfo
{
  -[GEOWaypointInfo _readArInfo]((uint64_t)self);
  return self->_arInfo;
}

- (void)setArInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  objc_storeStrong((id *)&self->_arInfo, a3);
}

- (void)_readLocalizedAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedAddress_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasLocalizedAddress
{
  -[GEOWaypointInfo _readLocalizedAddress]((uint64_t)self);
  return self->_localizedAddress != 0;
}

- (GEOAddress)localizedAddress
{
  -[GEOWaypointInfo _readLocalizedAddress]((uint64_t)self);
  return self->_localizedAddress;
}

- (void)setLocalizedAddress:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1040u;
  objc_storeStrong((id *)&self->_localizedAddress, a3);
}

- (void)_readUniqueWaypointId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUniqueWaypointId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasUniqueWaypointId
{
  -[GEOWaypointInfo _readUniqueWaypointId]((uint64_t)self);
  return self->_uniqueWaypointId != 0;
}

- (GEOWaypointUUID)uniqueWaypointId
{
  -[GEOWaypointInfo _readUniqueWaypointId]((uint64_t)self);
  return self->_uniqueWaypointId;
}

- (void)setUniqueWaypointId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1400u;
  objc_storeStrong((id *)&self->_uniqueWaypointId, a3);
}

- (void)_readWaypointCaption
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 120) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypointCaption_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasWaypointCaption
{
  -[GEOWaypointInfo _readWaypointCaption]((uint64_t)self);
  return self->_waypointCaption != 0;
}

- (GEOFormattedString)waypointCaption
{
  -[GEOWaypointInfo _readWaypointCaption]((uint64_t)self);
  return self->_waypointCaption;
}

- (void)setWaypointCaption:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1800u;
  objc_storeStrong((id *)&self->_waypointCaption, a3);
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
  v8.super_class = (Class)GEOWaypointInfo;
  -[GEOWaypointInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWaypointInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWaypointInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v46[4];
  id v47;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 120) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("muid"));

  }
  objc_msgSend((id)a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("name"));

  objc_msgSend((id)a1, "position");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v7, "jsonRepresentation");
    else
      objc_msgSend(v7, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("position"));

  }
  if ((*(_WORD *)(a1 + 120) & 2) != 0)
  {
    v10 = *(int *)(a1 + 116);
    if (v10 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 116));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E1C08858[v10];
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("source"));

  }
  objc_msgSend((id)a1, "styleAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  objc_msgSend((id)a1, "artwork");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v16, "jsonRepresentation");
    else
      objc_msgSend(v16, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("artwork"));

  }
  objc_msgSend((id)a1, "evChargingInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("evChargingInfo");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("ev_charging_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  objc_msgSend((id)a1, "arInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("arInfo");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("ar_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  objc_msgSend((id)a1, "localizedAddress");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v27, "jsonRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("localizedAddress");
    }
    else
    {
      objc_msgSend(v27, "dictionaryRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("localized_address");
    }
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  objc_msgSend((id)a1, "uniqueWaypointId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "jsonRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("uniqueWaypointId");
    }
    else
    {
      objc_msgSend(v31, "dictionaryRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("unique_waypoint_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
  objc_msgSend((id)a1, "waypointCaption");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v35, "jsonRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("waypointCaption");
    }
    else
    {
      objc_msgSend(v35, "dictionaryRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("waypoint_caption");
    }
    objc_msgSend(v4, "setObject:forKey:", v37, v38);

  }
  v39 = *(void **)(a1 + 16);
  if (v39)
  {
    objc_msgSend(v39, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v40, "count"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __45__GEOWaypointInfo__dictionaryRepresentation___block_invoke;
      v46[3] = &unk_1E1C00600;
      v43 = v42;
      v47 = v43;
      objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", v46);
      v44 = v43;

      v41 = v44;
    }
    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWaypointInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOWaypointInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOWaypointInfo)initWithDictionary:(id)a3
{
  return (GEOWaypointInfo *)-[GEOWaypointInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  GEOLatLng *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  GEOStyleAttributes *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  GEOPBTransitArtwork *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  GEOEVChargingInfo *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  GEOARInfo *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  GEOAddress *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  GEOWaypointUUID *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  GEOFormattedString *v46;
  uint64_t v47;
  void *v48;

  v5 = a2;
  if (!a1)
    goto LABEL_77;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_77;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMuid:", objc_msgSend(v6, "unsignedLongLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setName:", v8);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("position"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v11 = -[GEOLatLng initWithJSON:](v10, "initWithJSON:", v9);
    else
      v11 = -[GEOLatLng initWithDictionary:](v10, "initWithDictionary:", v9);
    v12 = (void *)v11;
    objc_msgSend(a1, "setPosition:", v11);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v13;
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v15 = 0;
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("USER")) & 1) != 0)
    {
      v15 = 1;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("SERVICE")))
    {
      v15 = 2;
    }
    else
    {
      v15 = 0;
    }

    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_msgSend(v13, "intValue");
LABEL_23:
    objc_msgSend(a1, "setSource:", v15);
  }

  if (a3)
    v16 = CFSTR("styleAttributes");
  else
    v16 = CFSTR("style_attributes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [GEOStyleAttributes alloc];
    if ((a3 & 1) != 0)
      v19 = -[GEOStyleAttributes initWithJSON:](v18, "initWithJSON:", v17);
    else
      v19 = -[GEOStyleAttributes initWithDictionary:](v18, "initWithDictionary:", v17);
    v20 = (void *)v19;
    objc_msgSend(a1, "setStyleAttributes:", v19);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artwork"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = [GEOPBTransitArtwork alloc];
    if ((a3 & 1) != 0)
      v23 = -[GEOPBTransitArtwork initWithJSON:](v22, "initWithJSON:", v21);
    else
      v23 = -[GEOPBTransitArtwork initWithDictionary:](v22, "initWithDictionary:", v21);
    v24 = (void *)v23;
    objc_msgSend(a1, "setArtwork:", v23);

  }
  if (a3)
    v25 = CFSTR("evChargingInfo");
  else
    v25 = CFSTR("ev_charging_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = [GEOEVChargingInfo alloc];
    if ((a3 & 1) != 0)
      v28 = -[GEOEVChargingInfo initWithJSON:](v27, "initWithJSON:", v26);
    else
      v28 = -[GEOEVChargingInfo initWithDictionary:](v27, "initWithDictionary:", v26);
    v29 = (void *)v28;
    objc_msgSend(a1, "setEvChargingInfo:", v28);

  }
  if (a3)
    v30 = CFSTR("arInfo");
  else
    v30 = CFSTR("ar_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = [GEOARInfo alloc];
    if ((a3 & 1) != 0)
      v33 = -[GEOARInfo initWithJSON:](v32, "initWithJSON:", v31);
    else
      v33 = -[GEOARInfo initWithDictionary:](v32, "initWithDictionary:", v31);
    v34 = (void *)v33;
    objc_msgSend(a1, "setArInfo:", v33);

  }
  if (a3)
    v35 = CFSTR("localizedAddress");
  else
    v35 = CFSTR("localized_address");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = [GEOAddress alloc];
    if ((a3 & 1) != 0)
      v38 = -[GEOAddress initWithJSON:](v37, "initWithJSON:", v36);
    else
      v38 = -[GEOAddress initWithDictionary:](v37, "initWithDictionary:", v36);
    v39 = (void *)v38;
    objc_msgSend(a1, "setLocalizedAddress:", v38);

  }
  if (a3)
    v40 = CFSTR("uniqueWaypointId");
  else
    v40 = CFSTR("unique_waypoint_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = [GEOWaypointUUID alloc];
    if (v42)
      v43 = (void *)-[GEOWaypointUUID _initWithDictionary:isJSON:]((uint64_t)v42, v41);
    else
      v43 = 0;
    objc_msgSend(a1, "setUniqueWaypointId:", v43);

  }
  if (a3)
    v44 = CFSTR("waypointCaption");
  else
    v44 = CFSTR("waypoint_caption");
  objc_msgSend(v5, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = [GEOFormattedString alloc];
    if ((a3 & 1) != 0)
      v47 = -[GEOFormattedString initWithJSON:](v46, "initWithJSON:", v45);
    else
      v47 = -[GEOFormattedString initWithDictionary:](v46, "initWithDictionary:", v45);
    v48 = (void *)v47;
    objc_msgSend(a1, "setWaypointCaption:", v47);

  }
LABEL_77:

  return a1;
}

- (GEOWaypointInfo)initWithJSON:(id)a3
{
  return (GEOWaypointInfo *)-[GEOWaypointInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_7447;
    else
      v8 = (int *)&readAll__nonRecursiveTag_7448;
    GEOWaypointInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOWaypointInfoCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWaypointInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWaypointInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOWaypointInfoIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOWaypointInfo readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    v5 = v8;
    if (self->_name)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_position)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    if (self->_styleAttributes)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_artwork)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_evChargingInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_arInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_localizedAddress)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_uniqueWaypointId)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_waypointCaption)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOWaypointInfo _readPosition]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_position, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOWaypointInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 26) = self->_readerMarkPos;
  *((_DWORD *)v5 + 27) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    v5[7] = (id)self->_muid;
    *((_WORD *)v5 + 60) |= 1u;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    v4 = v5;
  }
  if (self->_position)
  {
    objc_msgSend(v5, "setPosition:");
    v4 = v5;
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 29) = self->_source;
    *((_WORD *)v4 + 60) |= 2u;
  }
  if (self->_styleAttributes)
  {
    objc_msgSend(v5, "setStyleAttributes:");
    v4 = v5;
  }
  if (self->_artwork)
  {
    objc_msgSend(v5, "setArtwork:");
    v4 = v5;
  }
  if (self->_evChargingInfo)
  {
    objc_msgSend(v5, "setEvChargingInfo:");
    v4 = v5;
  }
  if (self->_arInfo)
  {
    objc_msgSend(v5, "setArInfo:");
    v4 = v5;
  }
  if (self->_localizedAddress)
  {
    objc_msgSend(v5, "setLocalizedAddress:");
    v4 = v5;
  }
  if (self->_uniqueWaypointId)
  {
    objc_msgSend(v5, "setUniqueWaypointId:");
    v4 = v5;
  }
  if (self->_waypointCaption)
  {
    objc_msgSend(v5, "setWaypointCaption:");
    v4 = v5;
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
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  PBUnknownFields *v27;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOWaypointInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOWaypointInfo readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_muid;
    *(_WORD *)(v5 + 120) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v9;

  v11 = -[GEOLatLng copyWithZone:](self->_position, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v11;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 116) = self->_source;
    *(_WORD *)(v5 + 120) |= 2u;
  }
  v13 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v13;

  v15 = -[GEOPBTransitArtwork copyWithZone:](self->_artwork, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  v17 = -[GEOEVChargingInfo copyWithZone:](self->_evChargingInfo, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v17;

  v19 = -[GEOARInfo copyWithZone:](self->_arInfo, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v19;

  v21 = -[GEOAddress copyWithZone:](self->_localizedAddress, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v21;

  v23 = -[GEOWaypointUUID copyWithZone:](self->_uniqueWaypointId, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v23;

  v25 = -[GEOFormattedString copyWithZone:](self->_waypointCaption, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v25;

  v27 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v27;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSString *name;
  GEOLatLng *position;
  __int16 v8;
  GEOStyleAttributes *styleAttributes;
  GEOPBTransitArtwork *artwork;
  GEOEVChargingInfo *evChargingInfo;
  GEOARInfo *arInfo;
  GEOAddress *localizedAddress;
  GEOWaypointUUID *uniqueWaypointId;
  GEOFormattedString *waypointCaption;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[GEOWaypointInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 60);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_muid != *((_QWORD *)v4 + 7))
      goto LABEL_30;
  }
  else if ((v5 & 1) != 0)
  {
LABEL_30:
    v16 = 0;
    goto LABEL_31;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 8) && !-[NSString isEqual:](name, "isEqual:"))
    goto LABEL_30;
  position = self->_position;
  if ((unint64_t)position | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOLatLng isEqual:](position, "isEqual:"))
      goto LABEL_30;
  }
  v8 = *((_WORD *)v4 + 60);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_source != *((_DWORD *)v4 + 29))
      goto LABEL_30;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_30;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 10)
    && !-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
  {
    goto LABEL_30;
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPBTransitArtwork isEqual:](artwork, "isEqual:"))
      goto LABEL_30;
  }
  evChargingInfo = self->_evChargingInfo;
  if ((unint64_t)evChargingInfo | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOEVChargingInfo isEqual:](evChargingInfo, "isEqual:"))
      goto LABEL_30;
  }
  arInfo = self->_arInfo;
  if ((unint64_t)arInfo | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOARInfo isEqual:](arInfo, "isEqual:"))
      goto LABEL_30;
  }
  localizedAddress = self->_localizedAddress;
  if ((unint64_t)localizedAddress | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOAddress isEqual:](localizedAddress, "isEqual:"))
      goto LABEL_30;
  }
  uniqueWaypointId = self->_uniqueWaypointId;
  if ((unint64_t)uniqueWaypointId | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOWaypointUUID isEqual:](uniqueWaypointId, "isEqual:"))
      goto LABEL_30;
  }
  waypointCaption = self->_waypointCaption;
  if ((unint64_t)waypointCaption | *((_QWORD *)v4 + 12))
    v16 = -[GEOFormattedString isEqual:](waypointCaption, "isEqual:");
  else
    v16 = 1;
LABEL_31:

  return v16;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  -[GEOWaypointInfo readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v3 = 2654435761u * self->_muid;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_name, "hash");
  v5 = -[GEOLatLng hash](self->_position, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v6 = 2654435761 * self->_source;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
  v9 = v8 ^ -[GEOPBTransitArtwork hash](self->_artwork, "hash");
  v10 = v7 ^ v9 ^ -[GEOEVChargingInfo hash](self->_evChargingInfo, "hash");
  v11 = -[GEOARInfo hash](self->_arInfo, "hash");
  v12 = v11 ^ -[GEOAddress hash](self->_localizedAddress, "hash");
  v13 = v12 ^ -[GEOWaypointUUID hash](self->_uniqueWaypointId, "hash");
  return v10 ^ v13 ^ -[GEOFormattedString hash](self->_waypointCaption, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  GEOLatLng *position;
  unint64_t v6;
  GEOStyleAttributes *styleAttributes;
  unint64_t v8;
  GEOPBTransitArtwork *artwork;
  unint64_t v10;
  GEOEVChargingInfo *evChargingInfo;
  unint64_t v12;
  GEOARInfo *arInfo;
  unint64_t v14;
  GEOAddress *localizedAddress;
  unint64_t v16;
  GEOWaypointUUID *uniqueWaypointId;
  void *v18;
  GEOFormattedString *waypointCaption;
  unint64_t v20;
  unint64_t *v21;

  v21 = (unint64_t *)a3;
  objc_msgSend(v21, "readAll:", 0);
  v4 = v21;
  if ((v21[15] & 1) != 0)
  {
    self->_muid = v21[7];
    *(_WORD *)&self->_flags |= 1u;
  }
  if (v21[8])
  {
    -[GEOWaypointInfo setName:](self, "setName:");
    v4 = v21;
  }
  position = self->_position;
  v6 = v4[9];
  if (position)
  {
    if (!v6)
      goto LABEL_11;
    -[GEOLatLng mergeFrom:](position, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[GEOWaypointInfo setPosition:](self, "setPosition:");
  }
  v4 = v21;
LABEL_11:
  if ((v4[15] & 2) != 0)
  {
    self->_source = *((_DWORD *)v4 + 29);
    *(_WORD *)&self->_flags |= 2u;
  }
  styleAttributes = self->_styleAttributes;
  v8 = v4[10];
  if (styleAttributes)
  {
    if (!v8)
      goto LABEL_19;
    -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_19;
    -[GEOWaypointInfo setStyleAttributes:](self, "setStyleAttributes:");
  }
  v4 = v21;
LABEL_19:
  artwork = self->_artwork;
  v10 = v4[4];
  if (artwork)
  {
    if (!v10)
      goto LABEL_25;
    -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_25;
    -[GEOWaypointInfo setArtwork:](self, "setArtwork:");
  }
  v4 = v21;
LABEL_25:
  evChargingInfo = self->_evChargingInfo;
  v12 = v4[5];
  if (evChargingInfo)
  {
    if (!v12)
      goto LABEL_31;
    -[GEOEVChargingInfo mergeFrom:](evChargingInfo, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_31;
    -[GEOWaypointInfo setEvChargingInfo:](self, "setEvChargingInfo:");
  }
  v4 = v21;
LABEL_31:
  arInfo = self->_arInfo;
  v14 = v4[3];
  if (arInfo)
  {
    if (!v14)
      goto LABEL_37;
    -[GEOARInfo mergeFrom:](arInfo, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_37;
    -[GEOWaypointInfo setArInfo:](self, "setArInfo:");
  }
  v4 = v21;
LABEL_37:
  localizedAddress = self->_localizedAddress;
  v16 = v4[6];
  if (localizedAddress)
  {
    if (!v16)
      goto LABEL_43;
    -[GEOAddress mergeFrom:](localizedAddress, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_43;
    -[GEOWaypointInfo setLocalizedAddress:](self, "setLocalizedAddress:");
  }
  v4 = v21;
LABEL_43:
  uniqueWaypointId = self->_uniqueWaypointId;
  v18 = (void *)v4[11];
  if (uniqueWaypointId)
  {
    if (!v18)
      goto LABEL_49;
    -[GEOWaypointUUID mergeFrom:]((uint64_t)uniqueWaypointId, v18);
  }
  else
  {
    if (!v18)
      goto LABEL_49;
    -[GEOWaypointInfo setUniqueWaypointId:](self, "setUniqueWaypointId:", v4[11]);
  }
  v4 = v21;
LABEL_49:
  waypointCaption = self->_waypointCaption;
  v20 = v4[12];
  if (waypointCaption)
  {
    if (v20)
    {
      -[GEOFormattedString mergeFrom:](waypointCaption, "mergeFrom:");
LABEL_54:
      v4 = v21;
    }
  }
  else if (v20)
  {
    -[GEOWaypointInfo setWaypointCaption:](self, "setWaypointCaption:");
    goto LABEL_54;
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
      GEOWaypointInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_7451);
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
  GEOWaypointUUID *uniqueWaypointId;
  PBUnknownFields *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1004u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOWaypointInfo readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_position, "clearUnknownFields:", 1);
    -[GEOStyleAttributes clearUnknownFields:](self->_styleAttributes, "clearUnknownFields:", 1);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_artwork, "clearUnknownFields:", 1);
    -[GEOEVChargingInfo clearUnknownFields:](self->_evChargingInfo, "clearUnknownFields:", 1);
    -[GEOARInfo clearUnknownFields:](self->_arInfo, "clearUnknownFields:", 1);
    -[GEOAddress clearUnknownFields:](self->_localizedAddress, "clearUnknownFields:", 1);
    uniqueWaypointId = self->_uniqueWaypointId;
    if (uniqueWaypointId)
    {
      v8 = uniqueWaypointId->_unknownFields;
      uniqueWaypointId->_unknownFields = 0;

    }
    -[GEOFormattedString clearUnknownFields:](self->_waypointCaption, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointCaption, 0);
  objc_storeStrong((id *)&self->_uniqueWaypointId, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_localizedAddress, 0);
  objc_storeStrong((id *)&self->_evChargingInfo, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_arInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOWaypointInfo)initWithSource:(int)a3
{
  uint64_t v3;
  GEOWaypointInfo *v4;
  GEOWaypointInfo *v5;
  GEOWaypointInfo *v6;

  v3 = *(_QWORD *)&a3;
  v4 = -[GEOWaypointInfo init](self, "init");
  v5 = v4;
  if (v4)
  {
    -[GEOWaypointInfo setSource:](v4, "setSource:", v3);
    v6 = v5;
  }

  return v5;
}

@end
