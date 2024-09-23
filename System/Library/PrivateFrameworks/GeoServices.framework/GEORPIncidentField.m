@implementation GEORPIncidentField

- (BOOL)hasSiriType
{
  return self->_siriType != 0;
}

- (NSString)siriType
{
  return self->_siriType;
}

- (void)setSiriType:(id)a3
{
  objc_storeStrong((id *)&self->_siriType, a3);
}

- (int)trafficType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_trafficType;
  else
    return 0;
}

- (void)setTrafficType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_trafficType = a3;
}

- (void)setHasTrafficType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTrafficType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)trafficTypeAsString:(int)a3
{
  if (a3 < 0x12)
    return off_1E1C13538[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTrafficType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROAD_CLOSURE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LANE_CLOSURE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEATHER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EVENT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCIDENT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAZARD")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROADWORKS")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAMP_CLOSURE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_CLOSURE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MANEUVER_CLOSURE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AREA_ADVISORY")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AREA_CLOSURE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONGESTION_ZONE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPEED_CHECK")) & 1) != 0)
  {
    v4 = 16;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NO_THOROUGHFARE_CLOSURE")))
  {
    v4 = 17;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)displayIncidentOnMap
{
  return (*(_BYTE *)&self->_flags & 2) == 0 || self->_displayIncidentOnMap;
}

- (void)setDisplayIncidentOnMap:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_displayIncidentOnMap = a3;
}

- (void)setHasDisplayIncidentOnMap:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDisplayIncidentOnMap
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEORPIncidentField;
  -[GEORPIncidentField description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPIncidentField dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPIncidentField _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  char v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "siriType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("siriType");
      else
        v6 = CFSTR("siri_type");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    v7 = *(_BYTE *)(a1 + 24);
    if ((v7 & 1) != 0)
    {
      v8 = *(int *)(a1 + 16);
      if (v8 >= 0x12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E1C13538[v8];
      }
      if (a2)
        v10 = CFSTR("trafficType");
      else
        v10 = CFSTR("traffic_type");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

      v7 = *(_BYTE *)(a1 + 24);
    }
    if ((v7 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 20));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v12 = CFSTR("displayIncidentOnMap");
      else
        v12 = CFSTR("display_incident_on_map");
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
  return -[GEORPIncidentField _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPIncidentField)initWithDictionary:(id)a3
{
  return (GEORPIncidentField *)-[GEORPIncidentField _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;

  v5 = a2;
  if (!a1)
    goto LABEL_59;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_59;
  if (a3)
    v6 = CFSTR("siriType");
  else
    v6 = CFSTR("siri_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setSiriType:", v8);

  }
  if (a3)
    v9 = CFSTR("trafficType");
  else
    v9 = CFSTR("traffic_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ROAD_CLOSURE")) & 1) != 0)
    {
      v12 = 1;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LANE_CLOSURE")) & 1) != 0)
    {
      v12 = 2;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("WEATHER")) & 1) != 0)
    {
      v12 = 3;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("EVENT")) & 1) != 0)
    {
      v12 = 4;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ACCIDENT")) & 1) != 0)
    {
      v12 = 5;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HAZARD")) & 1) != 0)
    {
      v12 = 6;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ROADWORKS")) & 1) != 0)
    {
      v12 = 7;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RAMP_CLOSURE")) & 1) != 0)
    {
      v12 = 8;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
    {
      v12 = 9;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TRAFFIC")) & 1) != 0)
    {
      v12 = 10;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("WALKING_CLOSURE")) & 1) != 0)
    {
      v12 = 11;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MANEUVER_CLOSURE")) & 1) != 0)
    {
      v12 = 12;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AREA_ADVISORY")) & 1) != 0)
    {
      v12 = 13;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AREA_CLOSURE")) & 1) != 0)
    {
      v12 = 14;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CONGESTION_ZONE")) & 1) != 0)
    {
      v12 = 15;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SPEED_CHECK")) & 1) != 0)
    {
      v12 = 16;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("NO_THOROUGHFARE_CLOSURE")))
    {
      v12 = 17;
    }
    else
    {
      v12 = 0;
    }

    goto LABEL_52;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(v10, "intValue");
LABEL_52:
    objc_msgSend(a1, "setTrafficType:", v12);
  }

  if (a3)
    v13 = CFSTR("displayIncidentOnMap");
  else
    v13 = CFSTR("display_incident_on_map");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDisplayIncidentOnMap:", objc_msgSend(v14, "BOOLValue"));

LABEL_59:
  return a1;
}

- (GEORPIncidentField)initWithJSON:(id)a3
{
  return (GEORPIncidentField *)-[GEORPIncidentField _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPIncidentFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPIncidentFieldReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_siriType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEORPIncidentField readAll:](self, "readAll:", 0);
  if (self->_siriType)
    objc_msgSend(v5, "setSiriType:");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_trafficType;
    *((_BYTE *)v5 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v5 + 20) = self->_displayIncidentOnMap;
    *((_BYTE *)v5 + 24) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_siriType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_trafficType;
    *(_BYTE *)(v5 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 20) = self->_displayIncidentOnMap;
    *(_BYTE *)(v5 + 24) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *siriType;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEORPIncidentField readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  siriType = self->_siriType;
  if ((unint64_t)siriType | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](siriType, "isEqual:"))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_trafficType != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_11;
  }
  v6 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0)
    {
LABEL_11:
      v6 = 0;
      goto LABEL_12;
    }
    if (self->_displayIncidentOnMap)
    {
      if (!*((_BYTE *)v4 + 20))
        goto LABEL_11;
    }
    else if (*((_BYTE *)v4 + 20))
    {
      goto LABEL_11;
    }
    v6 = 1;
  }
LABEL_12:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  -[GEORPIncidentField readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_siriType, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4 = 2654435761 * self->_trafficType;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_displayIncidentOnMap;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  if (*((_QWORD *)v5 + 1))
    -[GEORPIncidentField setSiriType:](self, "setSiriType:");
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 1) != 0)
  {
    self->_trafficType = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v5 + 24);
  }
  if ((v4 & 2) != 0)
  {
    self->_displayIncidentOnMap = *((_BYTE *)v5 + 20);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriType, 0);
}

@end
