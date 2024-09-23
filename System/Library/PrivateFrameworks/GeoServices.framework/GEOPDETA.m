@implementation GEOPDETA

- (GEOPDETA)init
{
  GEOPDETA *v2;
  GEOPDETA *v3;
  GEOPDETA *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDETA;
  v2 = -[GEOPDETA init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDETA)initWithData:(id)a3
{
  GEOPDETA *v3;
  GEOPDETA *v4;
  GEOPDETA *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDETA;
  v3 = -[GEOPDETA initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEtaRouteIncidents
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(_WORD *)(a1 + 72) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDETAReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtaRouteIncidents_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
}

- (void)addEtaRouteIncident:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDETA _readEtaRouteIncidents](a1);
    -[GEOPDETA _addNoFlagsEtaRouteIncident:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 72) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_WORD *)(a1 + 72) |= 0x100u;
  }
}

- (void)_addNoFlagsEtaRouteIncident:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDETA;
  -[GEOPDETA description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDETA dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDETA _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  __CFString *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  const __CFString *v29;
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
  -[GEOPDETA readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 72);
  if ((v5 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("time"));

    v5 = *(_WORD *)(a1 + 72);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 52));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("distance"));

    v5 = *(_WORD *)(a1 + 72);
  }
  if ((v5 & 0x10) != 0)
  {
    v8 = *(int *)(a1 + 68);
    if (v8 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E1C0B920[v8];
    }
    if (a2)
      v10 = CFSTR("transportType");
    else
      v10 = CFSTR("transport_type");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

    v5 = *(_WORD *)(a1 + 72);
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("historicTravelTime");
    else
      v12 = CFSTR("historic_travel_time");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(_WORD *)(a1 + 72) & 0x80) == 0)
  {
    v13 = *(void **)(a1 + 8);
    if (v13)
    {
      v14 = v13;
      objc_sync_enter(v14);
      GEOPDETAReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteTrafficDetail_tags);
      objc_sync_exit(v14);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  v15 = *(id *)(a1 + 32);
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("routeTrafficDetail");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("route_traffic_detail");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  if ((*(_WORD *)(a1 + 72) & 4) != 0)
  {
    v19 = *(int *)(a1 + 60);
    if (v19 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E1C0B8E0[v19];
    }
    if (a2)
      v21 = CFSTR("licensePlateRestrictionImpact");
    else
      v21 = CFSTR("license_plate_restriction_impact");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v23 = *(id *)(a1 + 24);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v40 != v25)
            objc_enumerationMutation(v23);
          v27 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v27, "jsonRepresentation");
          else
            objc_msgSend(v27, "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v24);
    }

    if (a2)
      v29 = CFSTR("etaRouteIncident");
    else
      v29 = CFSTR("eta_route_incident");
    objc_msgSend(v4, "setObject:forKey:", v22, v29);

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
      v37[2] = __38__GEOPDETA__dictionaryRepresentation___block_invoke;
      v37[3] = &unk_1E1C00600;
      v34 = v33;
      v38 = v34;
      objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v37);
      v35 = v34;

    }
    else
    {
      v35 = v31;
    }
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDETA _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_3116;
      else
        v6 = (int *)&readAll__nonRecursiveTag_3117;
      GEOPDETAReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDETACallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __38__GEOPDETA__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDETAReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  PBDataReader *v7;
  void *v8;
  __int16 v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    flags = (__int16)self->_flags;
    if ((flags & 0x100) == 0)
    {
      if ((flags & 0x80) != 0)
      {
        if (GEORouteTrafficDetailIsDirty((uint64_t)self->_routeTrafficDetail))
          goto LABEL_8;
        flags = (__int16)self->_flags;
      }
      if ((flags & 0x40) == 0)
      {
        v7 = self->_reader;
        objc_sync_enter(v7);
        *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
        -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
        -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "writeData:", v8);
        os_unfair_lock_unlock(p_readerLock);

        objc_sync_exit(v7);
        goto LABEL_25;
      }
    }
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDETA readAll:]((uint64_t)self, 0);
  v9 = (__int16)self->_flags;
  if ((v9 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v9 = (__int16)self->_flags;
    if ((v9 & 1) == 0)
    {
LABEL_10:
      if ((v9 & 0x10) == 0)
        goto LABEL_11;
LABEL_28:
      PBDataWriterWriteInt32Field();
      if ((*(_WORD *)&self->_flags & 2) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((v9 & 1) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field();
  v9 = (__int16)self->_flags;
  if ((v9 & 0x10) != 0)
    goto LABEL_28;
LABEL_11:
  if ((v9 & 2) != 0)
LABEL_12:
    PBDataWriterWriteUint32Field();
LABEL_13:
  if (self->_routeTrafficDetail)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_flags & 4) != 0)
    PBDataWriterWriteInt32Field();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = self->_etaRouteIncidents;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
LABEL_25:

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
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
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
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDETAReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_20;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDETA readAll:]((uint64_t)self, 0);
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_time;
    *(_WORD *)(v5 + 72) |= 8u;
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0)
        goto LABEL_8;
LABEL_23:
      *(_DWORD *)(v5 + 68) = self->_transportType;
      *(_WORD *)(v5 + 72) |= 0x10u;
      if ((*(_WORD *)&self->_flags & 2) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 52) = self->_distance;
  *(_WORD *)(v5 + 72) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_23;
LABEL_8:
  if ((flags & 2) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 56) = self->_historicTravelTime;
    *(_WORD *)(v5 + 72) |= 2u;
  }
LABEL_10:
  v10 = -[GEORouteTrafficDetail copyWithZone:](self->_routeTrafficDetail, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_licensePlateRestrictionImpact;
    *(_WORD *)(v5 + 72) |= 4u;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_etaRouteIncidents;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v19);
        -[GEOPDETA addEtaRouteIncident:](v5, v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_20:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  GEORouteTrafficDetail *routeTrafficDetail;
  NSMutableArray *etaRouteIncidents;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[GEOPDETA readAll:]((uint64_t)self, 1);
  -[GEOPDETA readAll:]((uint64_t)v4, 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 36);
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_time != *((_DWORD *)v4 + 16))
      goto LABEL_32;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_distance != *((_DWORD *)v4 + 13))
      goto LABEL_32;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_32;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_transportType != *((_DWORD *)v4 + 17))
      goto LABEL_32;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_historicTravelTime != *((_DWORD *)v4 + 14))
      goto LABEL_32;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_32;
  }
  routeTrafficDetail = self->_routeTrafficDetail;
  if ((unint64_t)routeTrafficDetail | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORouteTrafficDetail isEqual:](routeTrafficDetail, "isEqual:"))
    {
LABEL_32:
      v9 = 0;
      goto LABEL_33;
    }
    flags = (__int16)self->_flags;
    v6 = *((_WORD *)v4 + 36);
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_licensePlateRestrictionImpact != *((_DWORD *)v4 + 15))
      goto LABEL_32;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_32;
  }
  etaRouteIncidents = self->_etaRouteIncidents;
  if ((unint64_t)etaRouteIncidents | *((_QWORD *)v4 + 3))
    v9 = -[NSMutableArray isEqual:](etaRouteIncidents, "isEqual:");
  else
    v9 = 1;
LABEL_33:

  return v9;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  -[GEOPDETA readAll:]((uint64_t)self, 1);
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    v4 = 2654435761 * self->_time;
    if ((flags & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_distance;
      if ((flags & 0x10) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((flags & 2) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((flags & 1) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((flags & 0x10) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_transportType;
  if ((flags & 2) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_historicTravelTime;
    goto LABEL_10;
  }
LABEL_9:
  v7 = 0;
LABEL_10:
  v8 = -[GEORouteTrafficDetail hash](self->_routeTrafficDetail, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v9 = 2654435761 * self->_licensePlateRestrictionImpact;
  else
    v9 = 0;
  return v5 ^ v4 ^ v6 ^ v7 ^ v9 ^ v8 ^ -[NSMutableArray hash](self->_etaRouteIncidents, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeTrafficDetail, 0);
  objc_storeStrong((id *)&self->_etaRouteIncidents, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
