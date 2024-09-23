@implementation GEOLogMsgEventDirectionsRequestDetails

- (BOOL)navStarted
{
  return self->_navStarted;
}

- (void)setNavStarted:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_navStarted = a3;
}

- (void)setHasNavStarted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasNavStarted
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (int)purpose
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_purpose;
  else
    return 0;
}

- (void)setPurpose:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_purpose = a3;
}

- (void)setHasPurpose:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasPurpose
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)purposeAsString:(int)a3
{
  if (a3 < 0xB)
    return off_1E1C224D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPurpose:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PURPOSE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PURPOSE_TEST_OR_DEBUG")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PURPOSE_ETA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PURPOSE_QUICK_ETA")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PURPOSE_ROUTE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PURPOSE_REROUTE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PURPOSE_ROUTE_GENIUS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PURPOSE_SEARCH_ALONG_ROUTE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PURPOSE_DODGEBALL_OUTSIDE_OF_MAPS")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PURPOSE_TIME_TO_LEAVE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PURPOSE_LAUNCH_AND_GO")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)origin
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_origin;
  else
    return 0;
}

- (void)setOrigin:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasOrigin
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)originAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C22530[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOrigin:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_HOME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_WORK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_OTHER_PROMINENT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_NON_PROMINENT")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)destination
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_destination;
  else
    return 0;
}

- (void)setDestination:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_destination = a3;
}

- (void)setHasDestination:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDestination
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)destinationAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C22530[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDestination:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_HOME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_WORK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_OTHER_PROMINENT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_NON_PROMINENT")))
  {
    v4 = 4;
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
  v8.super_class = (Class)GEOLogMsgEventDirectionsRequestDetails;
  -[GEOLogMsgEventDirectionsRequestDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventDirectionsRequestDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventDirectionsRequestDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 20));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("navStarted");
    else
      v7 = CFSTR("nav_started");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)(a1 + 24) & 4) == 0)
  {
    goto LABEL_4;
  }
  v8 = *(int *)(a1 + 16);
  if (v8 >= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E1C224D8[v8];
  }
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("purpose"));

  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0)
      return v4;
    goto LABEL_19;
  }
LABEL_15:
  v10 = *(int *)(a1 + 12);
  if (v10 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 12));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E1C22530[v10];
  }
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("origin"));

  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
LABEL_19:
    v12 = *(int *)(a1 + 8);
    if (v12 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 8));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E1C22530[v12];
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("destination"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventDirectionsRequestDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventDirectionsRequestDetails)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventDirectionsRequestDetails *)-[GEOLogMsgEventDirectionsRequestDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("navStarted");
      else
        v6 = CFSTR("nav_started");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNavStarted:", objc_msgSend(v7, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("purpose"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PURPOSE_UNKNOWN")) & 1) != 0)
        {
          v10 = 0;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PURPOSE_TEST_OR_DEBUG")) & 1) != 0)
        {
          v10 = 1;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PURPOSE_ETA")) & 1) != 0)
        {
          v10 = 2;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PURPOSE_QUICK_ETA")) & 1) != 0)
        {
          v10 = 3;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PURPOSE_ROUTE")) & 1) != 0)
        {
          v10 = 4;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PURPOSE_REROUTE")) & 1) != 0)
        {
          v10 = 5;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PURPOSE_ROUTE_GENIUS")) & 1) != 0)
        {
          v10 = 6;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PURPOSE_SEARCH_ALONG_ROUTE")) & 1) != 0)
        {
          v10 = 7;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PURPOSE_DODGEBALL_OUTSIDE_OF_MAPS")) & 1) != 0)
        {
          v10 = 8;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PURPOSE_TIME_TO_LEAVE")) & 1) != 0)
        {
          v10 = 9;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("PURPOSE_LAUNCH_AND_GO")))
        {
          v10 = 10;
        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_36;
        v10 = objc_msgSend(v8, "intValue");
      }
      objc_msgSend(a1, "setPurpose:", v10);
LABEL_36:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("origin"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("LOCATION_UNKNOWN")) & 1) != 0)
        {
          v13 = 0;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("LOCATION_HOME")) & 1) != 0)
        {
          v13 = 1;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("LOCATION_WORK")) & 1) != 0)
        {
          v13 = 2;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("LOCATION_OTHER_PROMINENT")) & 1) != 0)
        {
          v13 = 3;
        }
        else if (objc_msgSend(v12, "isEqualToString:", CFSTR("LOCATION_NON_PROMINENT")))
        {
          v13 = 4;
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_52;
        v13 = objc_msgSend(v11, "intValue");
      }
      objc_msgSend(a1, "setOrigin:", v13);
LABEL_52:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("destination"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v14;
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LOCATION_UNKNOWN")) & 1) != 0)
        {
          v16 = 0;
        }
        else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LOCATION_HOME")) & 1) != 0)
        {
          v16 = 1;
        }
        else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LOCATION_WORK")) & 1) != 0)
        {
          v16 = 2;
        }
        else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LOCATION_OTHER_PROMINENT")) & 1) != 0)
        {
          v16 = 3;
        }
        else if (objc_msgSend(v15, "isEqualToString:", CFSTR("LOCATION_NON_PROMINENT")))
        {
          v16 = 4;
        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_68:

          goto LABEL_69;
        }
        v16 = objc_msgSend(v14, "intValue");
      }
      objc_msgSend(a1, "setDestination:", v16);
      goto LABEL_68;
    }
  }
LABEL_69:

  return a1;
}

- (GEOLogMsgEventDirectionsRequestDetails)initWithJSON:(id)a3
{
  return (GEOLogMsgEventDirectionsRequestDetails *)-[GEOLogMsgEventDirectionsRequestDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventDirectionsRequestDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventDirectionsRequestDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteInt32Field();
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 1) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEOLogMsgEventDirectionsRequestDetails readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[20] = self->_navStarted;
    v5[24] |= 8u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *((_DWORD *)v5 + 3) = self->_origin;
      v5[24] |= 2u;
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 4) = self->_purpose;
  v5[24] |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 1) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 2) = self->_destination;
    v5[24] |= 1u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_BYTE *)result + 20) = self->_navStarted;
    *((_BYTE *)result + 24) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_purpose;
  *((_BYTE *)result + 24) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 3) = self->_origin;
  *((_BYTE *)result + 24) |= 2u;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 2) = self->_destination;
  *((_BYTE *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEOLogMsgEventDirectionsRequestDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 8) != 0)
    {
      if (self->_navStarted)
      {
        if (!*((_BYTE *)v4 + 20))
          goto LABEL_24;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 20))
        goto LABEL_10;
    }
LABEL_24:
    v5 = 0;
    goto LABEL_25;
  }
  if ((*((_BYTE *)v4 + 24) & 8) != 0)
    goto LABEL_24;
LABEL_10:
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0 || self->_purpose != *((_DWORD *)v4 + 4))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_origin != *((_DWORD *)v4 + 3))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_24;
  }
  v5 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_destination != *((_DWORD *)v4 + 2))
      goto LABEL_24;
    v5 = 1;
  }
LABEL_25:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOLogMsgEventDirectionsRequestDetails readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v3 = 2654435761 * self->_navStarted;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_purpose;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_flags & 1) != 0)
        goto LABEL_5;
LABEL_9:
      v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_origin;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_destination;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 8) != 0)
  {
    self->_navStarted = *((_BYTE *)v5 + 20);
    *(_BYTE *)&self->_flags |= 8u;
    v4 = *((_BYTE *)v5 + 24);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
LABEL_9:
      self->_origin = *((_DWORD *)v5 + 3);
      *(_BYTE *)&self->_flags |= 2u;
      if ((*((_BYTE *)v5 + 24) & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v5 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_purpose = *((_DWORD *)v5 + 4);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 1) != 0)
  {
LABEL_5:
    self->_destination = *((_DWORD *)v5 + 2);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_6:

}

@end
