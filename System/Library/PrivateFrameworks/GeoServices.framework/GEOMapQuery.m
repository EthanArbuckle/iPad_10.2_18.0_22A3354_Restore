@implementation GEOMapQuery

- (GEOMapQuery)init
{
  GEOMapQuery *v2;
  GEOMapQuery *v3;
  GEOMapQuery *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMapQuery;
  v2 = -[GEOMapQuery init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapQuery)initWithData:(id)a3
{
  GEOMapQuery *v3;
  GEOMapQuery *v4;
  GEOMapQuery *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOMapQuery;
  v3 = -[GEOMapQuery initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMapRegion
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 121) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOMapQueryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRegion_tags_4);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)_readUserLocation
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 121) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOMapQueryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserLocation_tags_1);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (id)userLocation
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOMapQuery _readUserLocation]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)setUserLocation:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 120) |= 0x8000u;
  *(_DWORD *)(a1 + 120) |= 0x10000u;
  objc_storeStrong((id *)(a1 + 56), a2);

}

- (void)_readPlaceSearchRequest
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 121) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOMapQueryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceSearchRequest_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (id)placeSearchRequest
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOMapQuery _readPlaceSearchRequest]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setPlaceSearchRequest:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 120) |= 0x2000u;
  *(_DWORD *)(a1 + 120) |= 0x10000u;
  objc_storeStrong((id *)(a1 + 40), a2);

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
  v8.super_class = (Class)GEOMapQuery;
  -[GEOMapQuery description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapQuery dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapQuery _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  -[GEOMapQuery readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 121) & 0x40) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOMapQueryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuery_tags_2);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v7 = *(id *)(a1 + 48);
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("query"));

  v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 0x100) != 0)
  {
    v12 = *(_DWORD *)(a1 + 104);
    if (v12 == 1)
    {
      v13 = CFSTR("SEARCH_REQUEST_TYPE");
    }
    else if (v12 == 2)
    {
      v13 = CFSTR("GEOCODE_REQUEST_TYPE");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 104));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("requestType"));

    v8 = *(_DWORD *)(a1 + 120);
    if ((v8 & 0x10) == 0)
    {
LABEL_9:
      if ((v8 & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_45;
    }
  }
  else if ((v8 & 0x10) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 88));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("mapCenterX"));

  v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 0x20) == 0)
  {
LABEL_10:
    if ((v8 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 92));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("mapCenterY"));

  v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 0x40) == 0)
  {
LABEL_11:
    if ((v8 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 96));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("mapSpanX"));

  v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 0x80) == 0)
  {
LABEL_12:
    if ((v8 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 100));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("mapSpanY"));

  v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 0x800) == 0)
  {
LABEL_13:
    if ((v8 & 2) == 0)
      goto LABEL_14;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 116));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("zoomlevel"));

  v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 2) == 0)
  {
LABEL_14:
    if ((v8 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_53;
  }
LABEL_49:
  v28 = *(int *)(a1 + 76);
  if (v28 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = off_1E1C0CE28[v28];
  }
  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("clientImgFmt"));

  v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 0x200) == 0)
  {
LABEL_15:
    if ((v8 & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 108));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("tilesizeX"));

  v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 0x400) == 0)
  {
LABEL_16:
    if ((v8 & 8) == 0)
      goto LABEL_17;
LABEL_55:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 84));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("clientImgMaxWidth"));

    if ((*(_DWORD *)(a1 + 120) & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 112));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("tilesizeY"));

  v8 = *(_DWORD *)(a1 + 120);
  if ((v8 & 8) != 0)
    goto LABEL_55;
LABEL_17:
  if ((v8 & 4) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 80));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("clientImgMaxHeight"));

  }
LABEL_19:
  -[GEOMapQuery _readMapRegion](a1);
  v10 = *(id *)(a1 + 32);
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v10, "jsonRepresentation");
    else
      objc_msgSend(v10, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("mapRegion"));

  }
  -[GEOMapQuery userLocation]((id *)a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v15, "jsonRepresentation");
    else
      objc_msgSend(v15, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("userLocation"));

  }
  if ((*(_BYTE *)(a1 + 120) & 1) != 0)
  {
    _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 16));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("sessionID"));

  }
  -[GEOMapQuery placeSearchRequest]((id *)a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v19, "jsonRepresentation");
    else
      objc_msgSend(v19, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("placeSearchRequest"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapQuery _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_39;
      else
        v6 = (int *)&readAll__nonRecursiveTag_39;
      GEOMapQueryReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 32), "readAll:", 1);
      objc_msgSend(*(id *)(a1 + 56), "readAll:", 1);
      objc_msgSend(*(id *)(a1 + 40), "readAll:", 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapQueryReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $D9FAB42B35A4C93C96F7009395098545 flags;
  $D9FAB42B35A4C93C96F7009395098545 v7;
  PBDataReader *v8;
  void *v9;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x15000) == 0)
    {
      if ((*(_WORD *)&flags & 0x8000) != 0)
      {
        if (GEOLocationIsDirty((os_unfair_lock_s *)self->_userLocation))
          goto LABEL_3;
        flags = self->_flags;
      }
      if ((*(_WORD *)&flags & 0x2000) == 0
        || (GEOPlaceSearchRequestIsDirty((os_unfair_lock_s *)self->_placeSearchRequest) & 1) == 0)
      {
        v8 = self->_reader;
        objc_sync_enter(v8);
        *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
        -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
        -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "writeData:", v9);
        os_unfair_lock_unlock(p_readerLock);

        objc_sync_exit(v8);
        goto LABEL_25;
      }
    }
  }
LABEL_3:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOMapQuery readAll:]((uint64_t)self, 0);
  if (self->_query)
    PBDataWriterWriteStringField();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = self->_flags;
    if ((*(_BYTE *)&v7 & 0x10) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&v7 & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_28;
    }
  }
  else if ((*(_BYTE *)&v7 & 0x10) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&v7 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&v7 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x80) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v7 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&v7 & 2) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 2) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v7 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v7 & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&v7 & 8) == 0)
      goto LABEL_15;
LABEL_35:
    PBDataWriterWriteInt32Field();
    if ((*(_DWORD *)&self->_flags & 4) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 8) != 0)
    goto LABEL_35;
LABEL_15:
  if ((*(_BYTE *)&v7 & 4) != 0)
LABEL_16:
    PBDataWriterWriteInt32Field();
LABEL_17:
  if (self->_mapRegion)
    PBDataWriterWriteSubmessage();
  if (self->_userLocation)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterPlaceMark();
    PBDataWriterWriteUint64Field();
    PBDataWriterWriteUint64Field();
    PBDataWriterRecallMark();
  }
  if (self->_placeSearchRequest)
    PBDataWriterWriteSubmessage();
LABEL_25:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  $D9FAB42B35A4C93C96F7009395098545 flags;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

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
      GEOMapQueryReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_20;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOMapQuery readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_query, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_requestType;
    *(_DWORD *)(v5 + 120) |= 0x100u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x10) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&flags & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&flags & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 88) = self->_mapCenterX;
  *(_DWORD *)(v5 + 120) |= 0x10u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 92) = self->_mapCenterY;
  *(_DWORD *)(v5 + 120) |= 0x20u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&flags & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 96) = self->_mapSpanX;
  *(_DWORD *)(v5 + 120) |= 0x40u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&flags & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 100) = self->_mapSpanY;
  *(_DWORD *)(v5 + 120) |= 0x80u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 116) = self->_zoomlevel;
  *(_DWORD *)(v5 + 120) |= 0x800u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 76) = self->_clientImgFmt;
  *(_DWORD *)(v5 + 120) |= 2u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 108) = self->_tilesizeX;
  *(_DWORD *)(v5 + 120) |= 0x200u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_15;
LABEL_30:
    *(_DWORD *)(v5 + 84) = self->_clientImgMaxWidth;
    *(_DWORD *)(v5 + 120) |= 8u;
    if ((*(_DWORD *)&self->_flags & 4) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_29:
  *(_DWORD *)(v5 + 112) = self->_tilesizeY;
  *(_DWORD *)(v5 + 120) |= 0x400u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
    goto LABEL_30;
LABEL_15:
  if ((*(_BYTE *)&flags & 4) != 0)
  {
LABEL_16:
    *(_DWORD *)(v5 + 80) = self->_clientImgMaxHeight;
    *(_DWORD *)(v5 + 120) |= 4u;
  }
LABEL_17:
  v12 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[GEOLocation copyWithZone:](self->_userLocation, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(GEOSessionID *)(v5 + 16) = self->_sessionID;
    *(_DWORD *)(v5 + 120) |= 1u;
  }
  v16 = -[GEOPlaceSearchRequest copyWithZone:](self->_placeSearchRequest, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v16;
LABEL_20:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *query;
  $D9FAB42B35A4C93C96F7009395098545 flags;
  int v7;
  GEOMapRegion *mapRegion;
  GEOLocation *userLocation;
  int v10;
  char v12;
  GEOPlaceSearchRequest *placeSearchRequest;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_71;
  -[GEOMapQuery readAll:]((uint64_t)self, 1);
  -[GEOMapQuery readAll:]((uint64_t)v4, 1);
  query = self->_query;
  if ((unint64_t)query | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](query, "isEqual:"))
      goto LABEL_71;
  }
  flags = self->_flags;
  v7 = *((_DWORD *)v4 + 30);
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_requestType != *((_DWORD *)v4 + 26))
      goto LABEL_71;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_mapCenterX != *((_DWORD *)v4 + 22))
      goto LABEL_71;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_mapCenterY != *((_DWORD *)v4 + 23))
      goto LABEL_71;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_mapSpanX != *((_DWORD *)v4 + 24))
      goto LABEL_71;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_mapSpanY != *((_DWORD *)v4 + 25))
      goto LABEL_71;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_zoomlevel != *((_DWORD *)v4 + 29))
      goto LABEL_71;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_clientImgFmt != *((_DWORD *)v4 + 19))
      goto LABEL_71;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_tilesizeX != *((_DWORD *)v4 + 27))
      goto LABEL_71;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_tilesizeY != *((_DWORD *)v4 + 28))
      goto LABEL_71;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_clientImgMaxWidth != *((_DWORD *)v4 + 21))
      goto LABEL_71;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_clientImgMaxHeight != *((_DWORD *)v4 + 20))
      goto LABEL_71;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_71;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 4) && !-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
    goto LABEL_71;
  userLocation = self->_userLocation;
  if ((unint64_t)userLocation | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOLocation isEqual:](userLocation, "isEqual:"))
      goto LABEL_71;
  }
  v10 = *((_DWORD *)v4 + 30);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v10 & 1) == 0)
      goto LABEL_71;
    if (self->_sessionID._high != *((_QWORD *)v4 + 2) || self->_sessionID._low != *((_QWORD *)v4 + 3))
      goto LABEL_71;
  }
  else if ((v10 & 1) != 0)
  {
LABEL_71:
    v12 = 0;
    goto LABEL_72;
  }
  placeSearchRequest = self->_placeSearchRequest;
  if ((unint64_t)placeSearchRequest | *((_QWORD *)v4 + 5))
    v12 = -[GEOPlaceSearchRequest isEqual:](placeSearchRequest, "isEqual:");
  else
    v12 = 1;
LABEL_72:

  return v12;
}

- (unint64_t)hash
{
  $D9FAB42B35A4C93C96F7009395098545 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;

  -[GEOMapQuery readAll:]((uint64_t)self, 1);
  v20 = -[NSString hash](self->_query, "hash");
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    v19 = 2654435761 * self->_requestType;
    if ((*(_BYTE *)&flags & 0x10) != 0)
    {
LABEL_3:
      v18 = 2654435761 * self->_mapCenterX;
      if ((*(_BYTE *)&flags & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v19 = 0;
    if ((*(_BYTE *)&flags & 0x10) != 0)
      goto LABEL_3;
  }
  v18 = 0;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
LABEL_4:
    v17 = 2654435761 * self->_mapCenterY;
    if ((*(_BYTE *)&flags & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v17 = 0;
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
LABEL_5:
    v16 = 2654435761 * self->_mapSpanX;
    if ((*(_BYTE *)&flags & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v16 = 0;
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
LABEL_6:
    v14 = 2654435761 * self->_mapSpanY;
    if ((*(_WORD *)&flags & 0x800) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v14 = 0;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
LABEL_7:
    v4 = 2654435761 * self->_zoomlevel;
    if ((*(_BYTE *)&flags & 2) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v4 = 0;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
LABEL_8:
    v5 = 2654435761 * self->_clientImgFmt;
    if ((*(_WORD *)&flags & 0x200) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v5 = 0;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
LABEL_9:
    v6 = 2654435761 * self->_tilesizeX;
    if ((*(_WORD *)&flags & 0x400) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v6 = 0;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
LABEL_10:
    v7 = 2654435761 * self->_tilesizeY;
    if ((*(_BYTE *)&flags & 8) != 0)
      goto LABEL_11;
LABEL_22:
    v8 = 0;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_21:
  v7 = 0;
  if ((*(_BYTE *)&flags & 8) == 0)
    goto LABEL_22;
LABEL_11:
  v8 = 2654435761 * self->_clientImgMaxWidth;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
LABEL_12:
    v9 = 2654435761 * self->_clientImgMaxHeight;
    goto LABEL_24;
  }
LABEL_23:
  v9 = 0;
LABEL_24:
  v10 = -[GEOMapRegion hash](self->_mapRegion, "hash", v14);
  v11 = -[GEOLocation hash](self->_userLocation, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v12 = PBHashBytes();
  else
    v12 = 0;
  return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[GEOPlaceSearchRequest hash](self->_placeSearchRequest, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_placeSearchRequest, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
