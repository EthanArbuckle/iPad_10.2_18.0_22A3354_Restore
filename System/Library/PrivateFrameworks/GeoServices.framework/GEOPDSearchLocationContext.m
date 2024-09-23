@implementation GEOPDSearchLocationContext

- (GEOPDSearchLocationContext)init
{
  GEOPDSearchLocationContext *v2;
  GEOPDSearchLocationContext *v3;
  GEOPDSearchLocationContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchLocationContext;
  v2 = -[GEOPDSearchLocationContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchLocationContext)initWithData:(id)a3
{
  GEOPDSearchLocationContext *v3;
  GEOPDSearchLocationContext *v4;
  GEOPDSearchLocationContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchLocationContext;
  v3 = -[GEOPDSearchLocationContext initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDeviceLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchLocationContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceLocation_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (void)setDeviceLocation:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 44) |= 1u;
    *(_BYTE *)(a1 + 44) |= 4u;
    objc_storeStrong((id *)(a1 + 16), a2);
  }

}

- (void)_readViewportInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchLocationContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewportInfo_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 44) |= 2u;
    *(_BYTE *)(a1 + 44) |= 4u;
    objc_storeStrong((id *)(a1 + 24), a2);
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
  v8.super_class = (Class)GEOPDSearchLocationContext;
  -[GEOPDSearchLocationContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchLocationContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchLocationContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;

  if (a1)
  {
    -[GEOPDSearchLocationContext readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchLocationContext _readDeviceLocation](a1);
    v5 = *(id *)(a1 + 16);
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("deviceLocation");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("device_location");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    -[GEOPDSearchLocationContext _readViewportInfo](a1);
    v9 = *(id *)(a1 + 24);
    v10 = v9;
    if (v9)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v9, "jsonRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("viewportInfo");
      }
      else
      {
        objc_msgSend(v9, "dictionaryRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("viewport_info");
      }
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchLocationContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_75;
      else
        v6 = (int *)&readAll__nonRecursiveTag_76;
      GEOPDSearchLocationContextReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 16), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOLatLng *v8;
  GEOLatLng *v9;
  GEOLatLng *v10;
  const __CFString *v11;
  void *v12;
  GEOPDSearchViewportInfo *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  GEOMapRegion *v17;
  GEOMapRegion *v18;
  GEOMapRegion *v19;
  const __CFString *v20;
  void *v21;
  unsigned int v22;
  const __CFString *v23;
  void *v24;
  id v25;
  int v26;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("deviceLocation");
      else
        v6 = CFSTR("device_location");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOLatLng initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOLatLng initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = v9;
        -[GEOPDSearchLocationContext setDeviceLocation:]((uint64_t)a1, v9);

      }
      if (a3)
        v11 = CFSTR("viewportInfo");
      else
        v11 = CFSTR("viewport_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_52;
      v13 = [GEOPDSearchViewportInfo alloc];
      if (!v13)
      {
LABEL_51:
        -[GEOPDSearchLocationContext setViewportInfo:]((uint64_t)a1, v13);

LABEL_52:
        goto LABEL_53;
      }
      v14 = v12;
      v13 = -[GEOPDSearchViewportInfo init](v13, "init");
      if (!v13)
      {
LABEL_50:

        goto LABEL_51;
      }
      if (a3)
        v15 = CFSTR("mapRegion");
      else
        v15 = CFSTR("map_region");
      objc_msgSend(v14, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = [GEOMapRegion alloc];
        if ((a3 & 1) != 0)
          v18 = -[GEOMapRegion initWithJSON:](v17, "initWithJSON:", v16);
        else
          v18 = -[GEOMapRegion initWithDictionary:](v17, "initWithDictionary:", v16);
        v19 = v18;
        -[GEOPDSearchViewportInfo setMapRegion:]((uint64_t)v13, v18);

      }
      if (a3)
        v20 = CFSTR("timeSinceMapViewportChanged");
      else
        v20 = CFSTR("time_since_map_viewport_changed");
      objc_msgSend(v14, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = objc_msgSend(v21, "unsignedIntValue");
        *(_BYTE *)&v13->_flags |= 2u;
        v13->_timeSinceMapViewportChanged = v22;
      }

      if (a3)
        v23 = CFSTR("mapType");
      else
        v23 = CFSTR("map_type");
      objc_msgSend(v14, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = v24;
        if ((objc_msgSend(v25, "isEqualToString:", CFSTR("MAP_TYPE_NONE")) & 1) != 0)
        {
          v26 = 0;
        }
        else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("MAP_TYPE_STANDARD")) & 1) != 0)
        {
          v26 = 1;
        }
        else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE")) & 1) != 0)
        {
          v26 = 2;
        }
        else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID")) & 1) != 0)
        {
          v26 = 3;
        }
        else if (objc_msgSend(v25, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")))
        {
          v26 = 4;
        }
        else
        {
          v26 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_49:

          goto LABEL_50;
        }
        v26 = objc_msgSend(v24, "intValue");
      }
      *(_BYTE *)&v13->_flags |= 1u;
      v13->_mapType = v26;
      goto LABEL_49;
    }
  }
LABEL_53:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchLocationContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 7) == 0))
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v6);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchLocationContext readAll:]((uint64_t)self, 0);
    if (self->_deviceLocation)
      PBDataWriterWriteSubmessage();
    if (self->_viewportInfo)
      PBDataWriterWriteSubmessage();
  }

}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v3 = result;
    -[GEOPDSearchLocationContext _readDeviceLocation](result);
    result = 1;
    if ((objc_msgSend(*(id *)(v3 + 16), "hasGreenTeaWithValue:", a2) & 1) == 0)
    {
      -[GEOPDSearchLocationContext _readViewportInfo](v3);
      v4 = *(_QWORD *)(v3 + 24);
      if (!v4 || (objc_msgSend(*(id *)(v4 + 8), "hasGreenTeaWithValue:", a2) & 1) == 0)
        return 0;
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchLocationContext readAll:]((uint64_t)self, 0);
    v8 = -[GEOLatLng copyWithZone:](self->_deviceLocation, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[GEOPDSearchViewportInfo copyWithZone:](self->_viewportInfo, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[3];
    v5[3] = v10;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDSearchLocationContextReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOLatLng *deviceLocation;
  GEOPDSearchViewportInfo *viewportInfo;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDSearchLocationContext readAll:]((uint64_t)self, 1),
         -[GEOPDSearchLocationContext readAll:]((uint64_t)v4, 1),
         deviceLocation = self->_deviceLocation,
         !((unint64_t)deviceLocation | v4[2]))
     || -[GEOLatLng isEqual:](deviceLocation, "isEqual:")))
  {
    viewportInfo = self->_viewportInfo;
    if ((unint64_t)viewportInfo | v4[3])
      v7 = -[GEOPDSearchViewportInfo isEqual:](viewportInfo, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  -[GEOPDSearchLocationContext readAll:]((uint64_t)self, 1);
  v3 = -[GEOLatLng hash](self->_deviceLocation, "hash");
  return -[GEOPDSearchViewportInfo hash](self->_viewportInfo, "hash") ^ v3;
}

- (void)mergeFrom:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    -[GEOPDSearchLocationContext readAll:]((uint64_t)v7, 0);
    v3 = *(void **)(a1 + 16);
    v4 = *((_QWORD *)v7 + 2);
    if (v3)
    {
      if (v4)
        objc_msgSend(v3, "mergeFrom:");
    }
    else if (v4)
    {
      -[GEOPDSearchLocationContext setDeviceLocation:](a1, *((void **)v7 + 2));
    }
    v5 = *(_QWORD *)(a1 + 24);
    v6 = (void *)*((_QWORD *)v7 + 3);
    if (v5)
    {
      if (v6)
        -[GEOPDSearchViewportInfo mergeFrom:](v5, v6);
    }
    else if (v6)
    {
      -[GEOPDSearchLocationContext setViewportInfo:](a1, v6);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_deviceLocation, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
