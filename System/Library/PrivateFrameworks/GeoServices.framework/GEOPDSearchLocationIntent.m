@implementation GEOPDSearchLocationIntent

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  id *v3;

  if (result)
  {
    v3 = (id *)result;
    -[GEOPDSearchLocationIntent _readCenter](result);
    if ((objc_msgSend(v3[2], "hasGreenTeaWithValue:", a2) & 1) != 0)
      return 1;
    -[GEOPDSearchLocationIntent _readDisplayMapRegion]((uint64_t)v3);
    if ((objc_msgSend(v3[3], "hasGreenTeaWithValue:", a2) & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[GEOPDSearchLocationIntent _readMapRegion]((uint64_t)v3);
      return objc_msgSend(v3[5], "hasGreenTeaWithValue:", a2);
    }
  }
  return result;
}

- (GEOPDSearchLocationIntent)init
{
  GEOPDSearchLocationIntent *v2;
  GEOPDSearchLocationIntent *v3;
  GEOPDSearchLocationIntent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchLocationIntent;
  v2 = -[GEOPDSearchLocationIntent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchLocationIntent)initWithData:(id)a3
{
  GEOPDSearchLocationIntent *v3;
  GEOPDSearchLocationIntent *v4;
  GEOPDSearchLocationIntent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchLocationIntent;
  v3 = -[GEOPDSearchLocationIntent initWithData:](&v7, sel_initWithData_, a3);
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

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 76) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchLocationIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRegion_tags_784);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)_readCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchLocationIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_785);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)_readDisplayMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchLocationIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayMapRegion_tags_786);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
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
  v8.super_class = (Class)GEOPDSearchLocationIntent;
  -[GEOPDSearchLocationIntent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchLocationIntent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchLocationIntent _dictionaryRepresentation:]((uint64_t)self, 0);
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
  __int16 v12;
  uint64_t v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  -[GEOPDSearchLocationIntent readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchLocationIntent _readMapRegion](a1);
  v5 = *(id *)(a1 + 40);
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("mapRegion");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("map_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  -[GEOPDSearchLocationIntent _readCenter](a1);
  v9 = *(id *)(a1 + 16);
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v9, "jsonRepresentation");
    else
      objc_msgSend(v9, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("center"));

  }
  v12 = *(_WORD *)(a1 + 76);
  if ((v12 & 4) != 0)
  {
    v13 = *(int *)(a1 + 68);
    if (v13 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E1C0A678[v13];
    }
    if (a2)
      v15 = CFSTR("locationType");
    else
      v15 = CFSTR("location_type");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

    v12 = *(_WORD *)(a1 + 76);
  }
  if ((v12 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("distanceInKm");
    else
      v23 = CFSTR("distance_in_km");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

    v12 = *(_WORD *)(a1 + 76);
    if ((v12 & 8) == 0)
    {
LABEL_22:
      if ((v12 & 2) == 0)
        goto LABEL_23;
LABEL_39:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v27 = CFSTR("venueId");
      else
        v27 = CFSTR("venue_id");
      objc_msgSend(v4, "setObject:forKey:", v26, v27);

      if ((*(_WORD *)(a1 + 76) & 0x10) == 0)
        goto LABEL_28;
      goto LABEL_24;
    }
  }
  else if ((v12 & 8) == 0)
  {
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v25 = CFSTR("isDerivedFromGeoIntent");
  else
    v25 = CFSTR("is_derived_from_geo_intent");
  objc_msgSend(v4, "setObject:forKey:", v24, v25);

  v12 = *(_WORD *)(a1 + 76);
  if ((v12 & 2) != 0)
    goto LABEL_39;
LABEL_23:
  if ((v12 & 0x10) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 73));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("isDerivedFromPoiIntent");
    else
      v17 = CFSTR("is_derived_from_poi_intent");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
LABEL_28:
  -[GEOPDSearchLocationIntent _readDisplayMapRegion](a1);
  v18 = *(id *)(a1 + 24);
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("displayMapRegion");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("display_map_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchLocationIntent _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_807;
      else
        v6 = (int *)&readAll__nonRecursiveTag_808;
      GEOPDSearchLocationIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 40), "readAll:", 1);
      objc_msgSend(*(id *)(a1 + 16), "readAll:", 1);
      objc_msgSend(*(id *)(a1 + 24), "readAll:", 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchLocationIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x1E0) == 0)
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
      goto LABEL_21;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchLocationIntent readAll:]((uint64_t)self, 0);
  if (self->_mapRegion)
    PBDataWriterWriteSubmessage();
  if (self->_center)
    PBDataWriterWriteSubmessage();
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_9:
      if ((flags & 8) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_10:
    if ((flags & 2) == 0)
      goto LABEL_11;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_11:
    if ((flags & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
LABEL_12:
    PBDataWriterWriteBOOLField();
LABEL_13:
  if (self->_displayMapRegion)
    PBDataWriterWriteSubmessage();
LABEL_21:

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
  __int16 flags;
  id v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchLocationIntent readAll:]((uint64_t)self, 0);
    v9 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v9;

    v11 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v11;

    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      *(_DWORD *)(v5 + 68) = self->_locationType;
      *(_WORD *)(v5 + 76) |= 4u;
      flags = (__int16)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_7:
        if ((flags & 8) == 0)
          goto LABEL_8;
        goto LABEL_15;
      }
    }
    else if ((flags & 1) == 0)
    {
      goto LABEL_7;
    }
    *(double *)(v5 + 32) = self->_distanceInKm;
    *(_WORD *)(v5 + 76) |= 1u;
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_8:
      if ((flags & 2) == 0)
        goto LABEL_9;
      goto LABEL_16;
    }
LABEL_15:
    *(_BYTE *)(v5 + 72) = self->_isDerivedFromGeoIntent;
    *(_WORD *)(v5 + 76) |= 8u;
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_9:
      if ((flags & 0x10) == 0)
      {
LABEL_11:
        v14 = -[GEOMapRegion copyWithZone:](self->_displayMapRegion, "copyWithZone:", a3);
        v8 = *(id *)(v5 + 24);
        *(_QWORD *)(v5 + 24) = v14;
        goto LABEL_12;
      }
LABEL_10:
      *(_BYTE *)(v5 + 73) = self->_isDerivedFromPoiIntent;
      *(_WORD *)(v5 + 76) |= 0x10u;
      goto LABEL_11;
    }
LABEL_16:
    *(_QWORD *)(v5 + 48) = self->_venueId;
    *(_WORD *)(v5 + 76) |= 2u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDSearchLocationIntentReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_12:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOMapRegion *mapRegion;
  GEOLatLng *center;
  __int16 flags;
  __int16 v8;
  char v9;
  GEOMapRegion *displayMapRegion;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  -[GEOPDSearchLocationIntent readAll:]((uint64_t)self, 1);
  -[GEOPDSearchLocationIntent readAll:]((uint64_t)v4, 1);
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
      goto LABEL_33;
  }
  center = self->_center;
  if ((unint64_t)center | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:"))
      goto LABEL_33;
  }
  flags = (__int16)self->_flags;
  v8 = *((_WORD *)v4 + 38);
  if ((flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_locationType != *((_DWORD *)v4 + 17))
      goto LABEL_33;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_distanceInKm != *((double *)v4 + 4))
      goto LABEL_33;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 8) != 0)
  {
    if ((v8 & 8) == 0)
      goto LABEL_33;
    if (self->_isDerivedFromGeoIntent)
    {
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_33;
    }
    else if (*((_BYTE *)v4 + 72))
    {
      goto LABEL_33;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_venueId != *((_QWORD *)v4 + 6))
      goto LABEL_33;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 0x10) == 0)
  {
    if ((v8 & 0x10) == 0)
      goto LABEL_39;
LABEL_33:
    v9 = 0;
    goto LABEL_34;
  }
  if ((v8 & 0x10) == 0)
    goto LABEL_33;
  if (!self->_isDerivedFromPoiIntent)
  {
    if (!*((_BYTE *)v4 + 73))
      goto LABEL_39;
    goto LABEL_33;
  }
  if (!*((_BYTE *)v4 + 73))
    goto LABEL_33;
LABEL_39:
  displayMapRegion = self->_displayMapRegion;
  if ((unint64_t)displayMapRegion | *((_QWORD *)v4 + 3))
    v9 = -[GEOMapRegion isEqual:](displayMapRegion, "isEqual:");
  else
    v9 = 1;
LABEL_34:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  __int16 flags;
  uint64_t v6;
  double distanceInKm;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  -[GEOPDSearchLocationIntent readAll:]((uint64_t)self, 1);
  v3 = -[GEOMapRegion hash](self->_mapRegion, "hash");
  v4 = -[GEOLatLng hash](self->_center, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v6 = 2654435761 * self->_locationType;
    if ((flags & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v11 = 0;
    goto LABEL_11;
  }
  v6 = 0;
  if ((flags & 1) == 0)
    goto LABEL_8;
LABEL_3:
  distanceInKm = self->_distanceInKm;
  v8 = -distanceInKm;
  if (distanceInKm >= 0.0)
    v8 = self->_distanceInKm;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_11:
  if ((flags & 8) == 0)
  {
    v12 = 0;
    if ((flags & 2) != 0)
      goto LABEL_13;
LABEL_16:
    v13 = 0;
    if ((flags & 0x10) != 0)
      goto LABEL_14;
LABEL_17:
    v14 = 0;
    return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ -[GEOMapRegion hash](self->_displayMapRegion, "hash");
  }
  v12 = 2654435761 * self->_isDerivedFromGeoIntent;
  if ((flags & 2) == 0)
    goto LABEL_16;
LABEL_13:
  v13 = 2654435761u * self->_venueId;
  if ((flags & 0x10) == 0)
    goto LABEL_17;
LABEL_14:
  v14 = 2654435761 * self->_isDerivedFromPoiIntent;
  return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ -[GEOMapRegion hash](self->_displayMapRegion, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_displayMapRegion, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
