@implementation GEOPolyLocationShiftResponse

- (GEOPolyLocationShiftResponse)init
{
  GEOPolyLocationShiftResponse *v2;
  GEOPolyLocationShiftResponse *v3;
  GEOPolyLocationShiftResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPolyLocationShiftResponse;
  v2 = -[GEOPolyLocationShiftResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPolyLocationShiftResponse)initWithData:(id)a3
{
  GEOPolyLocationShiftResponse *v3;
  GEOPolyLocationShiftResponse *v4;
  GEOPolyLocationShiftResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPolyLocationShiftResponse;
  v3 = -[GEOPolyLocationShiftResponse initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPolyLocationShiftResponse;
  -[GEOPolyLocationShiftResponse dealloc](&v3, sel_dealloc);
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_status = a3;
}

- (id)statusAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C13F48[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_SHIFT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_NO_SHIFT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FAILURE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPolyLocationShiftResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)parametersCount
{
  -[GEOPolyLocationShiftResponse _readParameters]((uint64_t)self);
  return self->_parameters.count;
}

- (double)parameters
{
  -[GEOPolyLocationShiftResponse _readParameters]((uint64_t)self);
  return self->_parameters.list;
}

- (void)clearParameters
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  PBRepeatedDoubleClear();
}

- (void)addParameters:(double)a3
{
  -[GEOPolyLocationShiftResponse _readParameters]((uint64_t)self);
  if (self)
    PBRepeatedDoubleAdd();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
}

- (double)parametersAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_parameters;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPolyLocationShiftResponse _readParameters]((uint64_t)self);
  p_parameters = &self->_parameters;
  count = self->_parameters.count;
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
  return p_parameters->list[a3];
}

- (void)setParameters:(double *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  PBRepeatedDoubleSet();
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_radius = a3;
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
  v8.super_class = (Class)GEOPolyLocationShiftResponse;
  -[GEOPolyLocationShiftResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPolyLocationShiftResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPolyLocationShiftResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(int *)(a1 + 68);
    if (v5 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C13F48[v5];
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("status"));

    if (*(_QWORD *)(a1 + 24))
    {
      PBRepeatedDoubleNSArray();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("parameters"));

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("radius"));

    objc_msgSend((id)a1, "center");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
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
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPolyLocationShiftResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPolyLocationShiftResponse)initWithDictionary:(id)a3
{
  return (GEOPolyLocationShiftResponse *)-[GEOPolyLocationShiftResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  GEOLatLng *v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_34;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_34;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("LOCATION_SHIFT")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("LOCATION_NO_SHIFT")) & 1) != 0)
    {
      v8 = 1;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("FAILURE")))
    {
      v8 = 2;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_14:
    objc_msgSend(a1, "setStatus:", v8);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("parameters"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "doubleValue", (_QWORD)v22);
            objc_msgSend(a1, "addParameters:");
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("radius"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v16, "doubleValue");
    objc_msgSend(a1, "setRadius:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("center"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v19 = -[GEOLatLng initWithJSON:](v18, "initWithJSON:", v17);
    else
      v19 = -[GEOLatLng initWithDictionary:](v18, "initWithDictionary:", v17);
    v20 = (void *)v19;
    objc_msgSend(a1, "setCenter:", v19, (_QWORD)v22);

  }
LABEL_34:

  return a1;
}

- (GEOPolyLocationShiftResponse)initWithJSON:(id)a3
{
  return (GEOPolyLocationShiftResponse *)-[GEOPolyLocationShiftResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_70;
    else
      v8 = (int *)&readAll__nonRecursiveTag_70;
    GEOPolyLocationShiftResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOLatLng readAll:](self->_center, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPolyLocationShiftResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPolyLocationShiftResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  unint64_t v5;
  void *v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 7) == 0)
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
      goto LABEL_9;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPolyLocationShiftResponse readAll:](self, "readAll:", 0);
  PBDataWriterWriteInt32Field();
  if (self->_parameters.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      ++v5;
    }
    while (v5 < self->_parameters.count);
  }
  PBDataWriterWriteDoubleField();
  v6 = v9;
  if (self->_center)
  {
    PBDataWriterWriteSubmessage();
LABEL_9:
    v6 = v9;
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPolyLocationShiftResponse _readCenter]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_center, "hasGreenTeaWithValue:", v3);
}

- (void)_readCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPolyLocationShiftResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_9);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEOPolyLocationShiftResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 14) = self->_readerMarkPos;
  *((_DWORD *)v8 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_DWORD *)v8 + 17) = self->_status;
  if (-[GEOPolyLocationShiftResponse parametersCount](self, "parametersCount"))
  {
    objc_msgSend(v8, "clearParameters");
    v4 = -[GEOPolyLocationShiftResponse parametersCount](self, "parametersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPolyLocationShiftResponse parametersAtIndex:](self, "parametersAtIndex:", i);
        objc_msgSend(v8, "addParameters:");
      }
    }
  }
  v7 = v8;
  v8[6] = *(id *)&self->_radius;
  if (self->_center)
  {
    objc_msgSend(v8, "setCenter:");
    v7 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
    -[GEOPolyLocationShiftResponse readAll:](self, "readAll:", 0);
    *(_DWORD *)(v5 + 68) = self->_status;
    PBRepeatedDoubleCopy();
    *(double *)(v5 + 48) = self->_radius;
    v8 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
    v7 = *(PBDataReader **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v8;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPolyLocationShiftResponseReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOLatLng *center;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOPolyLocationShiftResponse readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        self->_status == *((_DWORD *)v4 + 17))
    && PBRepeatedDoubleIsEqual()
    && self->_radius == *((double *)v4 + 6))
  {
    center = self->_center;
    if ((unint64_t)center | v4[5])
      v6 = -[GEOLatLng isEqual:](center, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t status;
  uint64_t v4;
  double radius;
  double v6;
  long double v7;
  double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  -[GEOPolyLocationShiftResponse readAll:](self, "readAll:", 1);
  status = self->_status;
  v4 = PBRepeatedDoubleHash();
  radius = self->_radius;
  v6 = -radius;
  if (radius >= 0.0)
    v6 = self->_radius;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = fmod(v7, 1.84467441e19);
  v10 = 2654435761u * (unint64_t)v9;
  v11 = v10 + (unint64_t)v8;
  if (v8 <= 0.0)
    v11 = 2654435761u * (unint64_t)v9;
  v12 = v10 - (unint64_t)fabs(v8);
  if (v8 >= 0.0)
    v12 = v11;
  return (2654435761 * status) ^ -[GEOLatLng hash](self->_center, "hash") ^ v4 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  GEOLatLng *center;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  self->_status = *((_DWORD *)v10 + 17);
  v4 = objc_msgSend(v10, "parametersCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v10, "parametersAtIndex:", i);
      -[GEOPolyLocationShiftResponse addParameters:](self, "addParameters:");
    }
  }
  v7 = v10;
  self->_radius = *((double *)v10 + 6);
  center = self->_center;
  v9 = *((_QWORD *)v10 + 5);
  if (center)
  {
    if (v9)
    {
      -[GEOLatLng mergeFrom:](center, "mergeFrom:");
LABEL_9:
      v7 = v10;
    }
  }
  else if (v9)
  {
    -[GEOPolyLocationShiftResponse setCenter:](self, "setCenter:");
    goto LABEL_9;
  }

}

- (BOOL)hasCenter
{
  -[GEOPolyLocationShiftResponse _readCenter]((uint64_t)self);
  return self->_center != 0;
}

- (GEOLatLng)center
{
  -[GEOPolyLocationShiftResponse _readCenter]((uint64_t)self);
  return self->_center;
}

- (void)setCenter:(id)a3
{
  *(_BYTE *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_center, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
