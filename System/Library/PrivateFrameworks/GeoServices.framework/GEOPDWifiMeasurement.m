@implementation GEOPDWifiMeasurement

- (GEOPDWifiMeasurement)init
{
  GEOPDWifiMeasurement *v2;
  GEOPDWifiMeasurement *v3;
  GEOPDWifiMeasurement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDWifiMeasurement;
  v2 = -[GEOPDWifiMeasurement init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDWifiMeasurement)initWithData:(id)a3
{
  GEOPDWifiMeasurement *v3;
  GEOPDWifiMeasurement *v4;
  GEOPDWifiMeasurement *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDWifiMeasurement;
  v3 = -[GEOPDWifiMeasurement initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDWifiMeasurementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocations_tags_5775);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)locations
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDWifiMeasurement _readLocations]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)addLocation:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDWifiMeasurement _readLocations](a1);
    -[GEOPDWifiMeasurement _addNoFlagsLocation:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsLocation:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readWifiAccessPoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDWifiMeasurementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWifiAccessPoints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)addWifiAccessPoint:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDWifiMeasurement _readWifiAccessPoints](a1);
    -[GEOPDWifiMeasurement _addNoFlagsWifiAccessPoint:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsWifiAccessPoint:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDWifiMeasurement;
  -[GEOPDWifiMeasurement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDWifiMeasurement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDWifiMeasurement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  const __CFString *v21;
  char v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDWifiMeasurement readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v6 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v41 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("location"));
  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v14 = *(id *)(a1 + 48);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v37 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v19, "jsonRepresentation");
          else
            objc_msgSend(v19, "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v16);
    }

    if (a2)
      v21 = CFSTR("wifiAccessPoint");
    else
      v21 = CFSTR("wifi_access_point");
    objc_msgSend(v4, "setObject:forKey:", v13, v21);

  }
  v22 = *(_BYTE *)(a1 + 68);
  if ((v22 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v24 = CFSTR("entryTime");
    else
      v24 = CFSTR("entry_time");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

    v22 = *(_BYTE *)(a1 + 68);
  }
  if ((v22 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("exitTime");
    else
      v26 = CFSTR("exit_time");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  v27 = *(void **)(a1 + 16);
  if (v27)
  {
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __50__GEOPDWifiMeasurement__dictionaryRepresentation___block_invoke;
      v34[3] = &unk_1E1C00600;
      v31 = v30;
      v35 = v31;
      objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v34);
      v32 = v31;

      v29 = v32;
    }
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDWifiMeasurement _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_5789;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5790;
      GEOPDWifiMeasurementReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDWifiMeasurementCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __50__GEOPDWifiMeasurement__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDWifiMeasurementReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  char flags;
  PBDataReader *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x38) == 0))
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v16);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDWifiMeasurement readAll:]((uint64_t)self, 0);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_locations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = self->_wifiAccessPoints;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v11);
    }

    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint64Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint64Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  char flags;
  PBUnknownFields *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDWifiMeasurementReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDWifiMeasurement readAll:]((uint64_t)self, 0);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = self->_locations;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDWifiMeasurement addLocation:](v5, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = self->_wifiAccessPoints;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v22);
        -[GEOPDWifiMeasurement addWifiAccessPoint:](v5, v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v15);
  }

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_entryTime;
    *(_BYTE *)(v5 + 68) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_exitTime;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
  v20 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *locations;
  NSMutableArray *wifiAccessPoints;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOPDWifiMeasurement readAll:]((uint64_t)self, 1);
  -[GEOPDWifiMeasurement readAll:]((uint64_t)v4, 1);
  locations = self->_locations;
  if ((unint64_t)locations | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](locations, "isEqual:"))
      goto LABEL_15;
  }
  wifiAccessPoints = self->_wifiAccessPoints;
  if ((unint64_t)wifiAccessPoints | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](wifiAccessPoints, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_entryTime != *((_QWORD *)v4 + 3))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 68) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_exitTime != *((_QWORD *)v4 + 4))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  -[GEOPDWifiMeasurement readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_locations, "hash");
  v4 = -[NSMutableArray hash](self->_wifiAccessPoints, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5 = 2654435761u * self->_entryTime;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761u * self->_exitTime;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiAccessPoints, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
