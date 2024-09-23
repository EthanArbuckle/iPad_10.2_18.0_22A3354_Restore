@implementation GEORouteDetails

- (GEORouteDetails)initWithResultIndex:(int)a3
{
  uint64_t v3;
  GEORouteDetails *v4;
  GEORouteDetails *v5;
  GEORouteDetails *v6;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)GEORouteDetails;
  v4 = -[GEORouteDetails init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if ((v3 & 0x80000000) == 0)
      -[GEORouteDetails setResultIndex:](v4, "setResultIndex:", v3);
    v6 = v5;
  }

  return v5;
}

+ (id)routeDetailsWithResultIndex:(int)a3
{
  if (a3 < 0)
    return 0;
  else
    return -[GEORouteDetails initWithResultIndex:]([GEORouteDetails alloc], "initWithResultIndex:", *(_QWORD *)&a3);
}

+ (id)routeDetailsWithResultIndex:(int)a3 stepID:(int)a4
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(a1, "routeDetailsWithResultIndex:", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 0x80000000) == 0)
    objc_msgSend(v5, "setStepID:", v4);
  return v6;
}

+ (id)routeDetailsWithResultIndex:(int)a3 stepID:(int)a4 nearRoute:(BOOL)a5 nearCurrentlyDisplayedStep:(BOOL)a6 userTrackingOn:(BOOL)a7 timeSinceResponse:(double)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  void *v13;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  objc_msgSend(a1, "routeDetailsWithResultIndex:stepID:", *(_QWORD *)&a3, *(_QWORD *)&a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "setIsNearRoute:", 1);
    if (!v10)
    {
LABEL_3:
      if (!v9)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if (!v10)
  {
    goto LABEL_3;
  }
  objc_msgSend(v13, "setIsNearCurrentlyDisplayedStep:", 1);
  if (v9)
LABEL_4:
    objc_msgSend(v13, "setIsUserTrackingOn:", 1);
LABEL_5:
  if (a8 > 0.0)
    objc_msgSend(v13, "setTimeSinceRouteResponse:", a8);
  return v13;
}

- (int)resultIndex
{
  return self->_resultIndex;
}

- (void)setResultIndex:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_resultIndex = a3;
}

- (void)setHasResultIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasResultIndex
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasStepID
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)isNearRoute
{
  return self->_isNearRoute;
}

- (void)setIsNearRoute:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_isNearRoute = a3;
}

- (void)setHasIsNearRoute:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIsNearRoute
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (BOOL)isNearCurrentlyDisplayedStep
{
  return self->_isNearCurrentlyDisplayedStep;
}

- (void)setIsNearCurrentlyDisplayedStep:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_isNearCurrentlyDisplayedStep = a3;
}

- (void)setHasIsNearCurrentlyDisplayedStep:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsNearCurrentlyDisplayedStep
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)isUserTrackingOn
{
  return self->_isUserTrackingOn;
}

- (void)setIsUserTrackingOn:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_isUserTrackingOn = a3;
}

- (void)setHasIsUserTrackingOn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasIsUserTrackingOn
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (double)timeSinceRouteResponse
{
  return self->_timeSinceRouteResponse;
}

- (void)setTimeSinceRouteResponse:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_timeSinceRouteResponse = a3;
}

- (void)setHasTimeSinceRouteResponse:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTimeSinceRouteResponse
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEORouteDetails;
  -[GEORouteDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (!a1)
  {
    v2 = 0;
    return v2;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(a1 + 28);
  if ((v3 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 16));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("resultIndex"));

    v3 = *(_BYTE *)(a1 + 28);
  }
  if ((v3 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("stepID"));

    v3 = *(_BYTE *)(a1 + 28);
    if ((v3 & 0x10) == 0)
    {
LABEL_6:
      if ((v3 & 8) == 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else if ((v3 & 0x10) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 25));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("isNearRoute"));

  v3 = *(_BYTE *)(a1 + 28);
  if ((v3 & 8) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("isNearCurrentlyDisplayedStep"));

  v3 = *(_BYTE *)(a1 + 28);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 1) == 0)
      return v2;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 26));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("isUserTrackingOn"));

  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("timeSinceRouteResponse"));

  }
  return v2;
}

- (GEORouteDetails)initWithDictionary:(id)a3
{
  return (GEORouteDetails *)-[GEORouteDetails _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("resultIndex"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setResultIndex:", objc_msgSend(v4, "intValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("stepID"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStepID:", objc_msgSend(v5, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isNearRoute"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsNearRoute:", objc_msgSend(v6, "BOOLValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isNearCurrentlyDisplayedStep"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsNearCurrentlyDisplayedStep:", objc_msgSend(v7, "BOOLValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isUserTrackingOn"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsUserTrackingOn:", objc_msgSend(v8, "BOOLValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timeSinceRouteResponse"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(a1, "setTimeSinceRouteResponse:");
      }

    }
  }

  return a1;
}

- (GEORouteDetails)initWithJSON:(id)a3
{
  return (GEORouteDetails *)-[GEORouteDetails _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 1) != 0)
LABEL_7:
    PBDataWriterWriteDoubleField();
LABEL_8:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEORouteDetails readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[4] = self->_resultIndex;
    *((_BYTE *)v5 + 28) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[5] = self->_stepID;
  *((_BYTE *)v5 + 28) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_BYTE *)v5 + 25) = self->_isNearRoute;
  *((_BYTE *)v5 + 28) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    *((_BYTE *)v5 + 26) = self->_isUserTrackingOn;
    *((_BYTE *)v5 + 28) |= 0x20u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *((_BYTE *)v5 + 24) = self->_isNearCurrentlyDisplayedStep;
  *((_BYTE *)v5 + 28) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 1) != 0)
  {
LABEL_7:
    *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_timeSinceRouteResponse;
    *((_BYTE *)v5 + 28) |= 1u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_resultIndex;
    *((_BYTE *)result + 28) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_stepID;
  *((_BYTE *)result + 28) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_BYTE *)result + 25) = self->_isNearRoute;
  *((_BYTE *)result + 28) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)result + 24) = self->_isNearCurrentlyDisplayedStep;
  *((_BYTE *)result + 28) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_BYTE *)result + 26) = self->_isUserTrackingOn;
  *((_BYTE *)result + 28) |= 0x20u;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return result;
LABEL_7:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_timeSinceRouteResponse;
  *((_BYTE *)result + 28) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  -[GEORouteDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_resultIndex != *((_DWORD *)v4 + 4))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_stepID != *((_DWORD *)v4 + 5))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 0x10) == 0)
      goto LABEL_40;
    if (self->_isNearRoute)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_40;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_40;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 8) == 0)
      goto LABEL_40;
    if (self->_isNearCurrentlyDisplayedStep)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_40;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_40;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 0x20) != 0)
    {
      if (self->_isUserTrackingOn)
      {
        if (!*((_BYTE *)v4 + 26))
          goto LABEL_40;
        goto LABEL_36;
      }
      if (!*((_BYTE *)v4 + 26))
        goto LABEL_36;
    }
LABEL_40:
    v5 = 0;
    goto LABEL_41;
  }
  if ((*((_BYTE *)v4 + 28) & 0x20) != 0)
    goto LABEL_40;
LABEL_36:
  v5 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_timeSinceRouteResponse != *((double *)v4 + 1))
      goto LABEL_40;
    v5 = 1;
  }
LABEL_41:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double timeSinceRouteResponse;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;

  -[GEORouteDetails readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_resultIndex;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_stepID;
      if ((*(_BYTE *)&self->_flags & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_isNearRoute;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_isNearCurrentlyDisplayedStep;
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      goto LABEL_6;
LABEL_15:
    v7 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_7;
LABEL_16:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    goto LABEL_15;
LABEL_6:
  v7 = 2654435761 * self->_isUserTrackingOn;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_16;
LABEL_7:
  timeSinceRouteResponse = self->_timeSinceRouteResponse;
  v9 = -timeSinceRouteResponse;
  if (timeSinceRouteResponse >= 0.0)
    v9 = self->_timeSinceRouteResponse;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 2) != 0)
  {
    self->_resultIndex = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v5 + 28);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v5 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_stepID = *((_DWORD *)v5 + 5);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 0x10) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_isNearRoute = *((_BYTE *)v5 + 25);
  *(_BYTE *)&self->_flags |= 0x10u;
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    self->_isUserTrackingOn = *((_BYTE *)v5 + 26);
    *(_BYTE *)&self->_flags |= 0x20u;
    if ((*((_BYTE *)v5 + 28) & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_isNearCurrentlyDisplayedStep = *((_BYTE *)v5 + 24);
  *(_BYTE *)&self->_flags |= 8u;
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v4 & 1) != 0)
  {
LABEL_7:
    self->_timeSinceRouteResponse = *((double *)v5 + 1);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_8:

}

@end
