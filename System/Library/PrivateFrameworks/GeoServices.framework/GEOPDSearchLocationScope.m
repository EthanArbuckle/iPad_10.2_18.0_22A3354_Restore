@implementation GEOPDSearchLocationScope

- (GEOPDSearchLocationScope)init
{
  GEOPDSearchLocationScope *v2;
  GEOPDSearchLocationScope *v3;
  GEOPDSearchLocationScope *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchLocationScope;
  v2 = -[GEOPDSearchLocationScope init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchLocationScope)initWithData:(id)a3
{
  GEOPDSearchLocationScope *v3;
  GEOPDSearchLocationScope *v4;
  GEOPDSearchLocationScope *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchLocationScope;
  v3 = -[GEOPDSearchLocationScope initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
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
  v8.super_class = (Class)GEOPDSearchLocationScope;
  -[GEOPDSearchLocationScope description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchLocationScope dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchLocationScope _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  int v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  int v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  id v34;
  id v35;
  const __CFString *v36;
  double v37;
  int v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  -[GEOPDSearchLocationScope readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 113) & 0x20) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchLocationScopeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v7 = *(id *)(a1 + 16);
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v7, "jsonRepresentation");
    else
      objc_msgSend(v7, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("center"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 113) & 0x40) == 0)
  {
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = v10;
      objc_sync_enter(v11);
      GEOPDSearchLocationScopeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRegion_tags);
      objc_sync_exit(v11);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v12 = *(id *)(a1 + 32);
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("mapRegion");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("map_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  v16 = *(_DWORD *)(a1 + 112);
  if ((v16 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("scopeDistanceLimitKm");
    else
      v18 = CFSTR("scope_distance_limit_km");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

    v16 = *(_DWORD *)(a1 + 112);
    if ((v16 & 8) == 0)
    {
LABEL_20:
      if ((v16 & 4) == 0)
        goto LABEL_37;
      goto LABEL_33;
    }
  }
  else if ((v16 & 8) == 0)
  {
    goto LABEL_20;
  }
  v19 = *(int *)(a1 + 80);
  if (v19 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 80));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1E1C03800[v19];
  }
  if (a2)
    v21 = CFSTR("scopeDistanceType");
  else
    v21 = CFSTR("scope_distance_type");
  objc_msgSend(v4, "setObject:forKey:", v20, v21);

  if ((*(_DWORD *)(a1 + 112) & 4) != 0)
  {
LABEL_33:
    v22 = *(int *)(a1 + 76);
    if (v22 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E1C03820[v22];
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("locationScopeType"));

  }
LABEL_37:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 113) & 0x80) == 0)
  {
    v24 = *(void **)(a1 + 8);
    if (v24)
    {
      v25 = v24;
      objc_sync_enter(v25);
      GEOPDSearchLocationScopeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMultiMapRegion_tags);
      objc_sync_exit(v25);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v26 = *(id *)(a1 + 40);
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v26, "jsonRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("multiMapRegion");
    }
    else
    {
      objc_msgSend(v26, "dictionaryRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("multi_map_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
  v30 = *(_DWORD *)(a1 + 112);
  if ((v30 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v40 = CFSTR("displayRegionLimitKm");
    else
      v40 = CFSTR("display_region_limit_km");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

    v30 = *(_DWORD *)(a1 + 112);
    if ((v30 & 0x800) == 0)
    {
LABEL_47:
      if ((v30 & 0x1000) == 0)
        goto LABEL_48;
      goto LABEL_76;
    }
  }
  else if ((v30 & 0x800) == 0)
  {
    goto LABEL_47;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 109));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v42 = CFSTR("isBlendingScope");
  else
    v42 = CFSTR("is_blending_scope");
  objc_msgSend(v4, "setObject:forKey:", v41, v42);

  v30 = *(_DWORD *)(a1 + 112);
  if ((v30 & 0x1000) == 0)
  {
LABEL_48:
    if ((v30 & 0x400) == 0)
      goto LABEL_53;
    goto LABEL_49;
  }
LABEL_76:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 110));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v44 = CFSTR("isMixedIntent");
  else
    v44 = CFSTR("is_mixed_intent");
  objc_msgSend(v4, "setObject:forKey:", v43, v44);

  if ((*(_DWORD *)(a1 + 112) & 0x400) != 0)
  {
LABEL_49:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 108));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v32 = CFSTR("hasBelowStreetGeo");
    else
      v32 = CFSTR("has_below_street_geo");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
LABEL_53:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 114) & 1) == 0)
  {
    v33 = *(void **)(a1 + 8);
    if (v33)
    {
      v34 = v33;
      objc_sync_enter(v34);
      GEOPDSearchLocationScopeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWinDistanceGeohash4_tags);
      objc_sync_exit(v34);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v35 = *(id *)(a1 + 56);
  if (v35)
  {
    if (a2)
      v36 = CFSTR("winDistanceGeohash4");
    else
      v36 = CFSTR("win_distance_geohash4");
    objc_msgSend(v4, "setObject:forKey:", v35, v36);
  }

  v38 = *(_DWORD *)(a1 + 112);
  if ((v38 & 0x10) != 0)
  {
    LODWORD(v37) = *(_DWORD *)(a1 + 84);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v46 = CFSTR("winDistanceKmMean");
    else
      v46 = CFSTR("win_distance_km_mean");
    objc_msgSend(v4, "setObject:forKey:", v45, v46);

    v38 = *(_DWORD *)(a1 + 112);
    if ((v38 & 0x20) == 0)
    {
LABEL_63:
      if ((v38 & 0x40) == 0)
        goto LABEL_64;
      goto LABEL_89;
    }
  }
  else if ((v38 & 0x20) == 0)
  {
    goto LABEL_63;
  }
  LODWORD(v37) = *(_DWORD *)(a1 + 88);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v48 = CFSTR("winDistanceKmP50");
  else
    v48 = CFSTR("win_distance_km_p50");
  objc_msgSend(v4, "setObject:forKey:", v47, v48);

  v38 = *(_DWORD *)(a1 + 112);
  if ((v38 & 0x40) == 0)
  {
LABEL_64:
    if ((v38 & 0x80) == 0)
      goto LABEL_65;
    goto LABEL_93;
  }
LABEL_89:
  LODWORD(v37) = *(_DWORD *)(a1 + 92);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v50 = CFSTR("winDistanceKmP80");
  else
    v50 = CFSTR("win_distance_km_p80");
  objc_msgSend(v4, "setObject:forKey:", v49, v50);

  v38 = *(_DWORD *)(a1 + 112);
  if ((v38 & 0x80) == 0)
  {
LABEL_65:
    if ((v38 & 0x100) == 0)
      goto LABEL_66;
    goto LABEL_97;
  }
LABEL_93:
  LODWORD(v37) = *(_DWORD *)(a1 + 96);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v52 = CFSTR("winDistanceKmP90");
  else
    v52 = CFSTR("win_distance_km_p90");
  objc_msgSend(v4, "setObject:forKey:", v51, v52);

  v38 = *(_DWORD *)(a1 + 112);
  if ((v38 & 0x100) == 0)
  {
LABEL_66:
    if ((v38 & 0x200) == 0)
      return v4;
    goto LABEL_101;
  }
LABEL_97:
  LODWORD(v37) = *(_DWORD *)(a1 + 100);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v54 = CFSTR("winDistanceKmP95");
  else
    v54 = CFSTR("win_distance_km_p95");
  objc_msgSend(v4, "setObject:forKey:", v53, v54);

  if ((*(_DWORD *)(a1 + 112) & 0x200) != 0)
  {
LABEL_101:
    LODWORD(v37) = *(_DWORD *)(a1 + 104);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v56 = CFSTR("winDistanceKmP99");
    else
      v56 = CFSTR("win_distance_km_p99");
    objc_msgSend(v4, "setObject:forKey:", v55, v56);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchLocationScope _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_9;
      else
        v6 = (int *)&readAll__nonRecursiveTag_9;
      GEOPDSearchLocationScopeReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 16), "readAll:", 1);
      objc_msgSend(*(id *)(a1 + 32), "readAll:", 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchLocationScopeReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  $45F5D1E4115E45601B8BB285A9200E71 flags;
  $45F5D1E4115E45601B8BB285A9200E71 v6;
  $45F5D1E4115E45601B8BB285A9200E71 v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0x3E000) == 0)
    {
      v8 = self->_reader;
      objc_sync_enter(v8);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "writeData:", v9);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v8);
      goto LABEL_41;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchLocationScope readAll:]((uint64_t)self, 0);
  if (self->_center)
    PBDataWriterWriteSubmessage();
  if (self->_mapRegion)
    PBDataWriterWriteSubmessage();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&flags & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_flags & 4) != 0)
LABEL_10:
    PBDataWriterWriteInt32Field();
LABEL_11:
  if (self->_multiMapRegion)
    PBDataWriterWriteSubmessage();
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = self->_flags;
    if ((*(_WORD *)&v6 & 0x800) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&v6 & 0x1000) == 0)
        goto LABEL_16;
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&v6 & 0x800) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteBOOLField();
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v6 & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_32:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_flags & 0x400) != 0)
LABEL_17:
    PBDataWriterWriteBOOLField();
LABEL_18:
  if (self->_winDistanceGeohash4)
    PBDataWriterWriteStringField();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    v7 = self->_flags;
    if ((*(_BYTE *)&v7 & 0x20) == 0)
    {
LABEL_22:
      if ((*(_BYTE *)&v7 & 0x40) == 0)
        goto LABEL_23;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
    goto LABEL_22;
  }
  PBDataWriterWriteFloatField();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v7 & 0x80) == 0)
      goto LABEL_24;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteFloatField();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x80) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v7 & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteFloatField();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v7 & 0x200) == 0)
      goto LABEL_41;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteFloatField();
  if ((*(_DWORD *)&self->_flags & 0x200) != 0)
LABEL_39:
    PBDataWriterWriteFloatField();
LABEL_41:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  $45F5D1E4115E45601B8BB285A9200E71 flags;
  id v14;
  void *v15;
  $45F5D1E4115E45601B8BB285A9200E71 v16;
  uint64_t v17;
  void *v18;
  $45F5D1E4115E45601B8BB285A9200E71 v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchLocationScope readAll:]((uint64_t)self, 0);
    v9 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v9;

    v11 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v11;

    flags = self->_flags;
    if ((*(_BYTE *)&flags & 2) != 0)
    {
      *(double *)(v5 + 48) = self->_scopeDistanceLimitKm;
      *(_DWORD *)(v5 + 112) |= 2u;
      flags = self->_flags;
      if ((*(_BYTE *)&flags & 8) == 0)
      {
LABEL_7:
        if ((*(_BYTE *)&flags & 4) == 0)
          goto LABEL_9;
        goto LABEL_8;
      }
    }
    else if ((*(_BYTE *)&flags & 8) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 80) = self->_scopeDistanceType;
    *(_DWORD *)(v5 + 112) |= 8u;
    if ((*(_DWORD *)&self->_flags & 4) == 0)
    {
LABEL_9:
      v14 = -[GEOPDSearchMultiMapRegion copyWithZone:](self->_multiMapRegion, "copyWithZone:", a3);
      v15 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v14;

      v16 = self->_flags;
      if ((*(_BYTE *)&v16 & 1) != 0)
      {
        *(double *)(v5 + 24) = self->_displayRegionLimitKm;
        *(_DWORD *)(v5 + 112) |= 1u;
        v16 = self->_flags;
        if ((*(_WORD *)&v16 & 0x800) == 0)
        {
LABEL_11:
          if ((*(_WORD *)&v16 & 0x1000) == 0)
            goto LABEL_12;
          goto LABEL_27;
        }
      }
      else if ((*(_WORD *)&v16 & 0x800) == 0)
      {
        goto LABEL_11;
      }
      *(_BYTE *)(v5 + 109) = self->_isBlendingScope;
      *(_DWORD *)(v5 + 112) |= 0x800u;
      v16 = self->_flags;
      if ((*(_WORD *)&v16 & 0x1000) == 0)
      {
LABEL_12:
        if ((*(_WORD *)&v16 & 0x400) == 0)
          goto LABEL_14;
        goto LABEL_13;
      }
LABEL_27:
      *(_BYTE *)(v5 + 110) = self->_isMixedIntent;
      *(_DWORD *)(v5 + 112) |= 0x1000u;
      if ((*(_DWORD *)&self->_flags & 0x400) == 0)
      {
LABEL_14:
        v17 = -[NSString copyWithZone:](self->_winDistanceGeohash4, "copyWithZone:", a3);
        v18 = *(void **)(v5 + 56);
        *(_QWORD *)(v5 + 56) = v17;

        v19 = self->_flags;
        if ((*(_BYTE *)&v19 & 0x10) != 0)
        {
          *(float *)(v5 + 84) = self->_winDistanceKmMean;
          *(_DWORD *)(v5 + 112) |= 0x10u;
          v19 = self->_flags;
          if ((*(_BYTE *)&v19 & 0x20) == 0)
          {
LABEL_16:
            if ((*(_BYTE *)&v19 & 0x40) == 0)
              goto LABEL_17;
            goto LABEL_31;
          }
        }
        else if ((*(_BYTE *)&v19 & 0x20) == 0)
        {
          goto LABEL_16;
        }
        *(float *)(v5 + 88) = self->_winDistanceKmP50;
        *(_DWORD *)(v5 + 112) |= 0x20u;
        v19 = self->_flags;
        if ((*(_BYTE *)&v19 & 0x40) == 0)
        {
LABEL_17:
          if ((*(_BYTE *)&v19 & 0x80) == 0)
            goto LABEL_18;
          goto LABEL_32;
        }
LABEL_31:
        *(float *)(v5 + 92) = self->_winDistanceKmP80;
        *(_DWORD *)(v5 + 112) |= 0x40u;
        v19 = self->_flags;
        if ((*(_BYTE *)&v19 & 0x80) == 0)
        {
LABEL_18:
          if ((*(_WORD *)&v19 & 0x100) == 0)
            goto LABEL_19;
          goto LABEL_33;
        }
LABEL_32:
        *(float *)(v5 + 96) = self->_winDistanceKmP90;
        *(_DWORD *)(v5 + 112) |= 0x80u;
        v19 = self->_flags;
        if ((*(_WORD *)&v19 & 0x100) == 0)
        {
LABEL_19:
          if ((*(_WORD *)&v19 & 0x200) == 0)
            return (id)v5;
LABEL_20:
          *(float *)(v5 + 104) = self->_winDistanceKmP99;
          *(_DWORD *)(v5 + 112) |= 0x200u;
          return (id)v5;
        }
LABEL_33:
        *(float *)(v5 + 100) = self->_winDistanceKmP95;
        *(_DWORD *)(v5 + 112) |= 0x100u;
        if ((*(_DWORD *)&self->_flags & 0x200) == 0)
          return (id)v5;
        goto LABEL_20;
      }
LABEL_13:
      *(_BYTE *)(v5 + 108) = self->_hasBelowStreetGeo;
      *(_DWORD *)(v5 + 112) |= 0x400u;
      goto LABEL_14;
    }
LABEL_8:
    *(_DWORD *)(v5 + 76) = self->_locationScopeType;
    *(_DWORD *)(v5 + 112) |= 4u;
    goto LABEL_9;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDSearchLocationScopeReadAllFrom(v5, self->_reader);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *center;
  GEOMapRegion *mapRegion;
  $45F5D1E4115E45601B8BB285A9200E71 flags;
  int v8;
  GEOPDSearchMultiMapRegion *multiMapRegion;
  NSString *winDistanceGeohash4;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_86;
  -[GEOPDSearchLocationScope readAll:]((uint64_t)self, 1);
  -[GEOPDSearchLocationScope readAll:]((uint64_t)v4, 1);
  center = self->_center;
  if ((unint64_t)center | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:"))
      goto LABEL_86;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
      goto LABEL_86;
  }
  flags = self->_flags;
  v8 = *((_DWORD *)v4 + 28);
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_scopeDistanceLimitKm != *((double *)v4 + 6))
      goto LABEL_86;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_86;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_scopeDistanceType != *((_DWORD *)v4 + 20))
      goto LABEL_86;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_86;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_locationScopeType != *((_DWORD *)v4 + 19))
      goto LABEL_86;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_86;
  }
  multiMapRegion = self->_multiMapRegion;
  if ((unint64_t)multiMapRegion | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDSearchMultiMapRegion isEqual:](multiMapRegion, "isEqual:"))
      goto LABEL_86;
    flags = self->_flags;
    v8 = *((_DWORD *)v4 + 28);
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_displayRegionLimitKm != *((double *)v4 + 3))
      goto LABEL_86;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_86;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0)
      goto LABEL_86;
    if (self->_isBlendingScope)
    {
      if (!*((_BYTE *)v4 + 109))
        goto LABEL_86;
    }
    else if (*((_BYTE *)v4 + 109))
    {
      goto LABEL_86;
    }
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_86;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v8 & 0x1000) == 0)
      goto LABEL_86;
    if (self->_isMixedIntent)
    {
      if (!*((_BYTE *)v4 + 110))
        goto LABEL_86;
    }
    else if (*((_BYTE *)v4 + 110))
    {
      goto LABEL_86;
    }
  }
  else if ((v8 & 0x1000) != 0)
  {
    goto LABEL_86;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0)
      goto LABEL_86;
    if (self->_hasBelowStreetGeo)
    {
      if (!*((_BYTE *)v4 + 108))
        goto LABEL_86;
    }
    else if (*((_BYTE *)v4 + 108))
    {
      goto LABEL_86;
    }
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_86;
  }
  winDistanceGeohash4 = self->_winDistanceGeohash4;
  if (!((unint64_t)winDistanceGeohash4 | *((_QWORD *)v4 + 7)))
    goto LABEL_56;
  if (!-[NSString isEqual:](winDistanceGeohash4, "isEqual:"))
  {
LABEL_86:
    v11 = 0;
    goto LABEL_87;
  }
  flags = self->_flags;
  v8 = *((_DWORD *)v4 + 28);
LABEL_56:
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_winDistanceKmMean != *((float *)v4 + 21))
      goto LABEL_86;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_86;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_winDistanceKmP50 != *((float *)v4 + 22))
      goto LABEL_86;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_86;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_winDistanceKmP80 != *((float *)v4 + 23))
      goto LABEL_86;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_86;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_winDistanceKmP90 != *((float *)v4 + 24))
      goto LABEL_86;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_86;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_winDistanceKmP95 != *((float *)v4 + 25))
      goto LABEL_86;
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_86;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_winDistanceKmP99 != *((float *)v4 + 26))
      goto LABEL_86;
    v11 = 1;
  }
  else
  {
    v11 = (v8 & 0x200) == 0;
  }
LABEL_87:

  return v11;
}

- (unint64_t)hash
{
  $45F5D1E4115E45601B8BB285A9200E71 flags;
  unint64_t v4;
  double scopeDistanceLimitKm;
  double v6;
  long double v7;
  double v8;
  $45F5D1E4115E45601B8BB285A9200E71 v9;
  unint64_t v10;
  double displayRegionLimitKm;
  double v12;
  long double v13;
  double v14;
  NSUInteger v15;
  $45F5D1E4115E45601B8BB285A9200E71 v16;
  unint64_t v17;
  float winDistanceKmMean;
  double v19;
  long double v20;
  double v21;
  unint64_t v22;
  float winDistanceKmP50;
  double v24;
  long double v25;
  double v26;
  unint64_t v27;
  float winDistanceKmP80;
  double v29;
  long double v30;
  double v31;
  unint64_t v32;
  float winDistanceKmP90;
  double v34;
  long double v35;
  double v36;
  unint64_t v37;
  float winDistanceKmP95;
  double v39;
  long double v40;
  double v41;
  unint64_t v42;
  float winDistanceKmP99;
  double v44;
  long double v45;
  double v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;

  -[GEOPDSearchLocationScope readAll:]((uint64_t)self, 1);
  v56 = -[GEOLatLng hash](self->_center, "hash");
  v55 = -[GEOMapRegion hash](self->_mapRegion, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    scopeDistanceLimitKm = self->_scopeDistanceLimitKm;
    v6 = -scopeDistanceLimitKm;
    if (scopeDistanceLimitKm >= 0.0)
      v6 = self->_scopeDistanceLimitKm;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
    v53 = 2654435761 * self->_scopeDistanceType;
  else
    v53 = 0;
  v54 = v4;
  if ((*(_BYTE *)&flags & 4) != 0)
    v52 = 2654435761 * self->_locationScopeType;
  else
    v52 = 0;
  v51 = -[GEOPDSearchMultiMapRegion hash](self->_multiMapRegion, "hash");
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 1) != 0)
  {
    displayRegionLimitKm = self->_displayRegionLimitKm;
    v12 = -displayRegionLimitKm;
    if (displayRegionLimitKm >= 0.0)
      v12 = self->_displayRegionLimitKm;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((*(_WORD *)&v9 & 0x800) == 0)
  {
    v50 = 0;
    if ((*(_WORD *)&v9 & 0x1000) != 0)
      goto LABEL_25;
LABEL_28:
    v49 = 0;
    if ((*(_WORD *)&v9 & 0x400) != 0)
      goto LABEL_26;
    goto LABEL_29;
  }
  v50 = 2654435761 * self->_isBlendingScope;
  if ((*(_WORD *)&v9 & 0x1000) == 0)
    goto LABEL_28;
LABEL_25:
  v49 = 2654435761 * self->_isMixedIntent;
  if ((*(_WORD *)&v9 & 0x400) != 0)
  {
LABEL_26:
    v48 = 2654435761 * self->_hasBelowStreetGeo;
    goto LABEL_30;
  }
LABEL_29:
  v48 = 0;
LABEL_30:
  v15 = -[NSString hash](self->_winDistanceGeohash4, "hash");
  v16 = self->_flags;
  if ((*(_BYTE *)&v16 & 0x10) != 0)
  {
    winDistanceKmMean = self->_winDistanceKmMean;
    v19 = winDistanceKmMean;
    if (winDistanceKmMean < 0.0)
      v19 = -winDistanceKmMean;
    v20 = floor(v19 + 0.5);
    v21 = (v19 - v20) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0)
        v17 += (unint64_t)v21;
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    v17 = 0;
  }
  if ((*(_BYTE *)&v16 & 0x20) != 0)
  {
    winDistanceKmP50 = self->_winDistanceKmP50;
    v24 = winDistanceKmP50;
    if (winDistanceKmP50 < 0.0)
      v24 = -winDistanceKmP50;
    v25 = floor(v24 + 0.5);
    v26 = (v24 - v25) * 1.84467441e19;
    v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0)
        v22 += (unint64_t)v26;
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    v22 = 0;
  }
  if ((*(_BYTE *)&v16 & 0x40) != 0)
  {
    winDistanceKmP80 = self->_winDistanceKmP80;
    v29 = winDistanceKmP80;
    if (winDistanceKmP80 < 0.0)
      v29 = -winDistanceKmP80;
    v30 = floor(v29 + 0.5);
    v31 = (v29 - v30) * 1.84467441e19;
    v27 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
    if (v31 >= 0.0)
    {
      if (v31 > 0.0)
        v27 += (unint64_t)v31;
    }
    else
    {
      v27 -= (unint64_t)fabs(v31);
    }
  }
  else
  {
    v27 = 0;
  }
  if ((*(_BYTE *)&v16 & 0x80) != 0)
  {
    winDistanceKmP90 = self->_winDistanceKmP90;
    v34 = winDistanceKmP90;
    if (winDistanceKmP90 < 0.0)
      v34 = -winDistanceKmP90;
    v35 = floor(v34 + 0.5);
    v36 = (v34 - v35) * 1.84467441e19;
    v32 = 2654435761u * (unint64_t)fmod(v35, 1.84467441e19);
    if (v36 >= 0.0)
    {
      if (v36 > 0.0)
        v32 += (unint64_t)v36;
    }
    else
    {
      v32 -= (unint64_t)fabs(v36);
    }
  }
  else
  {
    v32 = 0;
  }
  if ((*(_WORD *)&v16 & 0x100) != 0)
  {
    winDistanceKmP95 = self->_winDistanceKmP95;
    v39 = winDistanceKmP95;
    if (winDistanceKmP95 < 0.0)
      v39 = -winDistanceKmP95;
    v40 = floor(v39 + 0.5);
    v41 = (v39 - v40) * 1.84467441e19;
    v37 = 2654435761u * (unint64_t)fmod(v40, 1.84467441e19);
    if (v41 >= 0.0)
    {
      if (v41 > 0.0)
        v37 += (unint64_t)v41;
    }
    else
    {
      v37 -= (unint64_t)fabs(v41);
    }
  }
  else
  {
    v37 = 0;
  }
  if ((*(_WORD *)&v16 & 0x200) != 0)
  {
    winDistanceKmP99 = self->_winDistanceKmP99;
    v44 = winDistanceKmP99;
    if (winDistanceKmP99 < 0.0)
      v44 = -winDistanceKmP99;
    v45 = floor(v44 + 0.5);
    v46 = (v44 - v45) * 1.84467441e19;
    v42 = 2654435761u * (unint64_t)fmod(v45, 1.84467441e19);
    if (v46 >= 0.0)
    {
      if (v46 > 0.0)
        v42 += (unint64_t)v46;
    }
    else
    {
      v42 -= (unint64_t)fabs(v46);
    }
  }
  else
  {
    v42 = 0;
  }
  return v55 ^ v56 ^ v54 ^ v53 ^ v52 ^ v51 ^ v10 ^ v50 ^ v49 ^ v48 ^ v15 ^ v17 ^ v22 ^ v27 ^ v32 ^ v37 ^ v42;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_winDistanceGeohash4, 0);
  objc_storeStrong((id *)&self->_multiMapRegion, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
