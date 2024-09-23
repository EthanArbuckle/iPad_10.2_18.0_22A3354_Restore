@implementation GEOVLFARState

- (unsigned)relativeTimestampMs
{
  return self->_relativeTimestampMs;
}

- (void)setRelativeTimestampMs:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_relativeTimestampMs = a3;
}

- (void)setHasRelativeTimestampMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasRelativeTimestampMs
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)geoTrackingState
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_geoTrackingState;
  else
    return 0;
}

- (void)setGeoTrackingState:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_geoTrackingState = a3;
}

- (void)setHasGeoTrackingState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasGeoTrackingState
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)geoTrackingStateAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C23918[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGeoTrackingState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFARGeoTrackingState_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFARGeoTrackingState_NOT_AVAILABLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFARGeoTrackingState_INITIALIZING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFARGeoTrackingState_LOCALIZING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VLFARGeoTrackingState_LOCALIZED")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)geoTrackingStateReason
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_geoTrackingStateReason;
  else
    return 0;
}

- (void)setGeoTrackingStateReason:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_geoTrackingStateReason = a3;
}

- (void)setHasGeoTrackingStateReason:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasGeoTrackingStateReason
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)geoTrackingStateReasonAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E1C23940[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGeoTrackingStateReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_NONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_NOT_AVAILABLE_AT_LOCATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_NEED_LOCATION_PERMISSIONS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_WORLD_TRACKING_UNSTABLE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_WAITING_FOR_LOCATION")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_WAITING_FOR_AVAILABILITY_CHECK")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_GEO_DATA_NOT_LOADED")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_DEVICE_POINTED_TOO_LOW")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_VISUAL_LOCALIZATION_FAILED")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
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
  v8.super_class = (Class)GEOVLFARState;
  -[GEOVLFARState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLFARState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFARState _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  const __CFString *v13;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 20);
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("relativeTimestampMs");
    else
      v7 = CFSTR("relative_timestamp_ms");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 20);
    if ((v5 & 2) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0)
        return v4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)(a1 + 20) & 2) == 0)
  {
    goto LABEL_4;
  }
  v8 = *(int *)(a1 + 12);
  if (v8 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 12));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E1C23918[v8];
  }
  if (a2)
    v10 = CFSTR("geoTrackingState");
  else
    v10 = CFSTR("geo_tracking_state");
  objc_msgSend(v4, "setObject:forKey:", v9, v10);

  if ((*(_BYTE *)(a1 + 20) & 1) != 0)
  {
LABEL_17:
    v11 = *(int *)(a1 + 8);
    if (v11 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 8));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E1C23940[v11];
    }
    if (a2)
      v13 = CFSTR("geoTrackingStateReason");
    else
      v13 = CFSTR("geo_tracking_state_reason");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFARState _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFARState)initWithDictionary:(id)a3
{
  return (GEOVLFARState *)-[GEOVLFARState _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("relativeTimestampMs");
      else
        v6 = CFSTR("relative_timestamp_ms");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRelativeTimestampMs:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("geoTrackingState");
      else
        v8 = CFSTR("geo_tracking_state");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("VLFARGeoTrackingState_UNKNOWN")) & 1) != 0)
        {
          v11 = 0;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("VLFARGeoTrackingState_NOT_AVAILABLE")) & 1) != 0)
        {
          v11 = 1;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("VLFARGeoTrackingState_INITIALIZING")) & 1) != 0)
        {
          v11 = 2;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("VLFARGeoTrackingState_LOCALIZING")) & 1) != 0)
        {
          v11 = 3;
        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("VLFARGeoTrackingState_LOCALIZED")))
        {
          v11 = 4;
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_27;
        v11 = objc_msgSend(v9, "intValue");
      }
      objc_msgSend(a1, "setGeoTrackingState:", v11);
LABEL_27:

      if (a3)
        v12 = CFSTR("geoTrackingStateReason");
      else
        v12 = CFSTR("geo_tracking_state_reason");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v13;
        if ((objc_msgSend(v14, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_UNKNOWN")) & 1) != 0)
        {
          v15 = 0;
        }
        else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_NONE")) & 1) != 0)
        {
          v15 = 1;
        }
        else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_NOT_AVAILABLE_AT_LOCATION")) & 1) != 0)
        {
          v15 = 2;
        }
        else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_NEED_LOCATION_PERMISSIONS")) & 1) != 0)
        {
          v15 = 3;
        }
        else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_WORLD_TRACKING_UNSTABLE")) & 1) != 0)
        {
          v15 = 4;
        }
        else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_WAITING_FOR_LOCATION")) & 1) != 0)
        {
          v15 = 5;
        }
        else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_WAITING_FOR_AVAILABILITY_CHECK")) & 1) != 0)
        {
          v15 = 6;
        }
        else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_GEO_DATA_NOT_LOADED")) & 1) != 0)
        {
          v15 = 7;
        }
        else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_DEVICE_POINTED_TOO_LOW")) & 1) != 0)
        {
          v15 = 8;
        }
        else if (objc_msgSend(v14, "isEqualToString:", CFSTR("VLFARGeoTrackingStateReason_VISUAL_LOCALIZATION_FAILED")))
        {
          v15 = 9;
        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_56:

          goto LABEL_57;
        }
        v15 = objc_msgSend(v13, "intValue");
      }
      objc_msgSend(a1, "setGeoTrackingStateReason:", v15);
      goto LABEL_56;
    }
  }
LABEL_57:

  return a1;
}

- (GEOVLFARState)initWithJSON:(id)a3
{
  return (GEOVLFARState *)-[GEOVLFARState _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFARStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFARStateReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOVLFARState readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v5[3] = self->_geoTrackingState;
    *((_BYTE *)v5 + 20) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v5[4] = self->_relativeTimestampMs;
  *((_BYTE *)v5 + 20) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    v5[2] = self->_geoTrackingStateReason;
    *((_BYTE *)v5 + 20) |= 1u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_relativeTimestampMs;
    *((_BYTE *)result + 20) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_geoTrackingState;
  *((_BYTE *)result + 20) |= 2u;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 2) = self->_geoTrackingStateReason;
  *((_BYTE *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOVLFARState readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0 || self->_relativeTimestampMs != *((_DWORD *)v4 + 4))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 20) & 4) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_geoTrackingState != *((_DWORD *)v4 + 3))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_geoTrackingStateReason != *((_DWORD *)v4 + 2))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOVLFARState readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v3 = 2654435761 * self->_relativeTimestampMs;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_geoTrackingState;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_geoTrackingStateReason;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 20);
  if ((v4 & 4) == 0)
  {
    if ((*((_BYTE *)v5 + 20) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    self->_geoTrackingState = *((_DWORD *)v5 + 3);
    *(_BYTE *)&self->_flags |= 2u;
    if ((*((_BYTE *)v5 + 20) & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_relativeTimestampMs = *((_DWORD *)v5 + 4);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 20);
  if ((v4 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 1) != 0)
  {
LABEL_4:
    self->_geoTrackingStateReason = *((_DWORD *)v5 + 2);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_5:

}

@end
