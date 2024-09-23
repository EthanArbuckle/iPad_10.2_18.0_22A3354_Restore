@implementation GEOArrivalRegion

- (BOOL)hasArrivalRegion
{
  return self->_arrivalRegion != 0;
}

- (GEOMapRegion)arrivalRegion
{
  return self->_arrivalRegion;
}

- (void)setArrivalRegion:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalRegion, a3);
}

- (int)arrivalRegionAction
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_arrivalRegionAction;
  else
    return 1;
}

- (void)setArrivalRegionAction:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_arrivalRegionAction = a3;
}

- (void)setHasArrivalRegionAction:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasArrivalRegionAction
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)arrivalRegionActionAsString:(int)a3
{
  if ((a3 - 1) < 8)
    return off_1E1C07F20[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsArrivalRegionAction:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_ACTION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISSUE_ARRIVAL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISSUE_ARRIVAL_OFF_ROUTE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("END_NAVIGATION_TIMEOUT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRE_ARRIVAL_MODE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARKING_SUGGEST_WALKING")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INITIATE_APPROACHING")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PREPARE_TO_PARK")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (unsigned)endNavigationTimeoutThreshold
{
  return self->_endNavigationTimeoutThreshold;
}

- (void)setEndNavigationTimeoutThreshold:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_endNavigationTimeoutThreshold = a3;
}

- (void)setHasEndNavigationTimeoutThreshold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasEndNavigationTimeoutThreshold
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)routeEndDistanceThresholdCm
{
  return self->_routeEndDistanceThresholdCm;
}

- (void)setRouteEndDistanceThresholdCm:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_routeEndDistanceThresholdCm = a3;
}

- (void)setHasRouteEndDistanceThresholdCm:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasRouteEndDistanceThresholdCm
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOArrivalRegion;
  -[GEOArrivalRegion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOArrivalRegion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOArrivalRegion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  char v9;
  unsigned int v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "arrivalRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("arrivalRegion");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("arrival_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  v9 = *(_BYTE *)(a1 + 36);
  if ((v9 & 1) != 0)
  {
    v10 = *(_DWORD *)(a1 + 24) - 1;
    if (v10 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 24));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E1C07F20[v10];
    }
    if (a2)
      v12 = CFSTR("arrivalRegionAction");
    else
      v12 = CFSTR("arrival_region_action");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

    v9 = *(_BYTE *)(a1 + 36);
  }
  if ((v9 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("endNavigationTimeoutThreshold");
    else
      v14 = CFSTR("end_navigation_timeout_threshold");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

    v9 = *(_BYTE *)(a1 + 36);
  }
  if ((v9 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("routeEndDistanceThresholdCm");
    else
      v16 = CFSTR("route_end_distance_threshold_cm");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  v17 = *(void **)(a1 + 8);
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __46__GEOArrivalRegion__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOArrivalRegion _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOArrivalRegion__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOArrivalRegion)initWithDictionary:(id)a3
{
  return (GEOArrivalRegion *)-[GEOArrivalRegion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOMapRegion *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v5 = a2;
  if (!a1)
    goto LABEL_47;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_47;
  if (a3)
    v6 = CFSTR("arrivalRegion");
  else
    v6 = CFSTR("arrival_region");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [GEOMapRegion alloc];
    if ((a3 & 1) != 0)
      v9 = -[GEOMapRegion initWithJSON:](v8, "initWithJSON:", v7);
    else
      v9 = -[GEOMapRegion initWithDictionary:](v8, "initWithDictionary:", v7);
    v10 = (void *)v9;
    objc_msgSend(a1, "setArrivalRegion:", v9);

  }
  if (a3)
    v11 = CFSTR("arrivalRegionAction");
  else
    v11 = CFSTR("arrival_region_action");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("NO_ACTION")) & 1) != 0)
    {
      v14 = 1;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ISSUE_ARRIVAL")) & 1) != 0)
    {
      v14 = 2;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ISSUE_ARRIVAL_OFF_ROUTE")) & 1) != 0)
    {
      v14 = 3;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("END_NAVIGATION_TIMEOUT")) & 1) != 0)
    {
      v14 = 4;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PRE_ARRIVAL_MODE")) & 1) != 0)
    {
      v14 = 5;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PARKING_SUGGEST_WALKING")) & 1) != 0)
    {
      v14 = 6;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("INITIATE_APPROACHING")) & 1) != 0)
    {
      v14 = 7;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("PREPARE_TO_PARK")))
    {
      v14 = 8;
    }
    else
    {
      v14 = 1;
    }

    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_msgSend(v12, "intValue");
LABEL_35:
    objc_msgSend(a1, "setArrivalRegionAction:", v14);
  }

  if (a3)
    v15 = CFSTR("endNavigationTimeoutThreshold");
  else
    v15 = CFSTR("end_navigation_timeout_threshold");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEndNavigationTimeoutThreshold:", objc_msgSend(v16, "unsignedIntValue"));

  if (a3)
    v17 = CFSTR("routeEndDistanceThresholdCm");
  else
    v17 = CFSTR("route_end_distance_threshold_cm");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRouteEndDistanceThresholdCm:", objc_msgSend(v18, "unsignedIntValue"));

LABEL_47:
  return a1;
}

- (GEOArrivalRegion)initWithJSON:(id)a3
{
  return (GEOArrivalRegion *)-[GEOArrivalRegion _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOArrivalRegionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOArrivalRegionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_arrivalRegion)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteUint32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_7:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOMapRegion hasGreenTeaWithValue:](self->_arrivalRegion, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOArrivalRegion readAll:](self, "readAll:", 0);
  if (self->_arrivalRegion)
    objc_msgSend(v5, "setArrivalRegion:");
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
LABEL_9:
    *((_DWORD *)v5 + 7) = self->_endNavigationTimeoutThreshold;
    *((_BYTE *)v5 + 36) |= 2u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_DWORD *)v5 + 6) = self->_arrivalRegionAction;
  *((_BYTE *)v5 + 36) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 4) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 8) = self->_routeEndDistanceThresholdCm;
    *((_BYTE *)v5 + 36) |= 4u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOMapRegion copyWithZone:](self->_arrivalRegion, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 28) = self->_endNavigationTimeoutThreshold;
    *(_BYTE *)(v5 + 36) |= 2u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 24) = self->_arrivalRegionAction;
  *(_BYTE *)(v5 + 36) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 32) = self->_routeEndDistanceThresholdCm;
    *(_BYTE *)(v5 + 36) |= 4u;
  }
LABEL_5:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOMapRegion *arrivalRegion;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEOArrivalRegion readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  arrivalRegion = self->_arrivalRegion;
  if ((unint64_t)arrivalRegion | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOMapRegion isEqual:](arrivalRegion, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_arrivalRegionAction != *((_DWORD *)v4 + 6))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_endNavigationTimeoutThreshold != *((_DWORD *)v4 + 7))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 36) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_routeEndDistanceThresholdCm != *((_DWORD *)v4 + 8))
      goto LABEL_18;
    v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOArrivalRegion readAll:](self, "readAll:", 1);
  v3 = -[GEOMapRegion hash](self->_arrivalRegion, "hash");
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_arrivalRegionAction;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_endNavigationTimeoutThreshold;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_routeEndDistanceThresholdCm;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  GEOMapRegion *arrivalRegion;
  uint64_t v5;
  char v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  arrivalRegion = self->_arrivalRegion;
  v5 = *((_QWORD *)v7 + 2);
  if (arrivalRegion)
  {
    if (v5)
      -[GEOMapRegion mergeFrom:](arrivalRegion, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOArrivalRegion setArrivalRegion:](self, "setArrivalRegion:");
  }
  v6 = *((_BYTE *)v7 + 36);
  if ((v6 & 1) == 0)
  {
    if ((*((_BYTE *)v7 + 36) & 2) == 0)
      goto LABEL_8;
LABEL_12:
    self->_endNavigationTimeoutThreshold = *((_DWORD *)v7 + 7);
    *(_BYTE *)&self->_flags |= 2u;
    if ((*((_BYTE *)v7 + 36) & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  self->_arrivalRegionAction = *((_DWORD *)v7 + 6);
  *(_BYTE *)&self->_flags |= 1u;
  v6 = *((_BYTE *)v7 + 36);
  if ((v6 & 2) != 0)
    goto LABEL_12;
LABEL_8:
  if ((v6 & 4) != 0)
  {
LABEL_9:
    self->_routeEndDistanceThresholdCm = *((_DWORD *)v7 + 8);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_10:

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOArrivalRegion readAll:](self, "readAll:", 0);
    -[GEOMapRegion clearUnknownFields:](self->_arrivalRegion, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalRegion, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
