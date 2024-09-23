@implementation GEOActiveResourceFilter

- (BOOL)_isFilterStaleThresholdExpired
{
  _BOOL4 v3;
  double Double;
  double Current;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = -[GEOActiveResourceFilter hasLastTimestamp](self, "hasLastTimestamp");
  if (v3)
  {
    if (-[GEOActiveResourceFilter whichFilter](self, "whichFilter") - 1 > 2)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      Double = GEOConfigGetDouble(GeoServicesConfig_ResourceFilterStaleInterval, (uint64_t)off_1EDF4D388);
      Current = CFAbsoluteTimeGetCurrent();
      -[GEOActiveResourceFilter lastTimestamp](self, "lastTimestamp");
      v7 = Current - v6;
      v8 = CFAbsoluteTimeGetCurrent();
      -[GEOActiveResourceFilter lastTimestamp](self, "lastTimestamp");
      v10 = v8 - v9;
      if (v7 < 0.0)
        v10 = -v10;
      LOBYTE(v3) = v10 > Double;
    }
  }
  return v3;
}

- (void)resetFilter
{
  NSString *name;

  self->_scale = 0;
  self->_scenario = 0;
  name = self->_name;
  self->_name = 0;

  self->_whichFilter = 0;
}

- (double)lastTimestamp
{
  return self->_lastTimestamp;
}

- (void)setLastTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_lastTimestamp = a3;
}

- (void)setHasLastTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLastTimestamp
{
  return *(_BYTE *)&self->_flags & 1;
}

- (int)scale
{
  if (self->_whichFilter == 1)
    return self->_scale;
  else
    return 0;
}

- (void)setScale:(int)a3
{
  -[GEOActiveResourceFilter resetFilter](self, "resetFilter");
  self->_scale = a3;
  self->_whichFilter = 1;
}

- (id)scaleAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C07DD8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsScale:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_1X")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_2X")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_3X")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)scenario
{
  if (self->_whichFilter == 2)
    return self->_scenario;
  else
    return 0;
}

- (void)setScenario:(int)a3
{
  -[GEOActiveResourceFilter resetFilter](self, "resetFilter");
  self->_scenario = a3;
  self->_whichFilter = 2;
}

- (id)scenarioAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C07DF8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsScenario:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_CARPLAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_NAVIGATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_HIGHVISIBILITY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_EXPLICIT")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)name
{
  if (self->_whichFilter == 3)
    return self->_name;
  else
    return (NSString *)0;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)a3;
  -[GEOActiveResourceFilter resetFilter](self, "resetFilter");
  name = self->_name;
  self->_name = v4;

  if (v4)
    self->_whichFilter = 3;
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
  v8.super_class = (Class)GEOActiveResourceFilter;
  -[GEOActiveResourceFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOActiveResourceFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOActiveResourceFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  switch(v5)
  {
    case 3:
      objc_msgSend((id)a1, "name");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
LABEL_16:

        break;
      }
      v9 = CFSTR("name");
LABEL_15:
      objc_msgSend(v4, "setObject:forKey:", v7, v9);
      goto LABEL_16;
    case 2:
      v8 = *(int *)(a1 + 36);
      if (v8 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 36));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E1C07DF8[v8];
      }
      v9 = CFSTR("scenario");
      goto LABEL_15;
    case 1:
      v6 = *(int *)(a1 + 32);
      if (v6 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E1C07DD8[v6];
      }
      v9 = CFSTR("scale");
      goto LABEL_15;
  }
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("lastTimestamp"));

  }
  v11 = *(void **)(a1 + 8);
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __53__GEOActiveResourceFilter__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E1C00600;
      v15 = v14;
      v19 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOActiveResourceFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOActiveResourceFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOActiveResourceFilter)initWithDictionary:(id)a3
{
  return (GEOActiveResourceFilter *)-[GEOActiveResourceFilter _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastTimestamp"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "doubleValue");
        objc_msgSend(a1, "setLastTimestamp:");
      }

    }
  }

  return a1;
}

- (GEOActiveResourceFilter)initWithJSON:(id)a3
{
  return (GEOActiveResourceFilter *)-[GEOActiveResourceFilter _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOActiveResourceFilterIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOActiveResourceFilterReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  unint64_t whichFilter;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteDoubleField();
  whichFilter = self->_whichFilter;
  if (whichFilter == 1)
  {
    PBDataWriterWriteInt32Field();
    whichFilter = self->_whichFilter;
  }
  if (whichFilter == 2)
  {
    PBDataWriterWriteInt32Field();
    whichFilter = self->_whichFilter;
  }
  if (whichFilter == 3)
    PBDataWriterWriteStringField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  unint64_t whichFilter;
  id *v5;
  uint64_t v6;
  int scenario;
  id *v8;

  v8 = (id *)a3;
  -[GEOActiveResourceFilter readAll:](self, "readAll:", 0);
  -[GEOActiveResourceFilter resetFilter](self, "resetFilter");
  whichFilter = self->_whichFilter;
  if (whichFilter == 3)
  {
    objc_storeStrong(v8 + 3, self->_name);
    v5 = v8;
  }
  else
  {
    if (whichFilter == 2)
    {
      v6 = 36;
      scenario = self->_scenario;
      v5 = v8;
    }
    else
    {
      v5 = v8;
      if (whichFilter != 1)
        goto LABEL_8;
      v6 = 32;
      scenario = self->_scale;
    }
    *(_DWORD *)((char *)v5 + v6) = scenario;
  }
LABEL_8:
  v5[6] = (id)self->_whichFilter;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5[2] = *(id *)&self->_lastTimestamp;
    *((_BYTE *)v5 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  unint64_t whichFilter;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  whichFilter = self->_whichFilter;
  if (whichFilter == 3)
  {
    v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v10 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v9;

  }
  else
  {
    if (whichFilter == 2)
    {
      v8 = 36;
    }
    else
    {
      if (whichFilter != 1)
        goto LABEL_8;
      v8 = 32;
    }
    *(_DWORD *)(v5 + v8) = *(_DWORD *)((char *)&self->super.super.isa + v8);
  }
LABEL_8:
  *(_QWORD *)(v6 + 48) = self->_whichFilter;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v6 + 16) = self->_lastTimestamp;
    *(_BYTE *)(v6 + 40) |= 1u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  unint64_t whichFilter;
  uint64_t v6;
  BOOL v7;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOActiveResourceFilter readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  whichFilter = self->_whichFilter;
  if (whichFilter != *((_QWORD *)v4 + 6))
    goto LABEL_15;
  if (whichFilter == 3)
  {
    if (!-[NSString isEqual:](self->_name, "isEqual:", *((_QWORD *)v4 + 3)))
      goto LABEL_15;
  }
  else
  {
    if (whichFilter == 2)
    {
      v6 = 36;
    }
    else
    {
      if (whichFilter != 1)
        goto LABEL_11;
      v6 = 32;
    }
    if (*(_DWORD *)((char *)&self->super.super.isa + v6) != *(_DWORD *)&v4[v6])
      goto LABEL_15;
  }
LABEL_11:
  v7 = (v4[40] & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[40] & 1) != 0 && self->_lastTimestamp == *((double *)v4 + 2))
    {
      v7 = 1;
      goto LABEL_16;
    }
LABEL_15:
    v7 = 0;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  unint64_t whichFilter;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  double lastTimestamp;
  double v8;
  long double v9;
  double v10;

  -[GEOActiveResourceFilter readAll:](self, "readAll:", 1);
  whichFilter = self->_whichFilter;
  v4 = 2654435761u * whichFilter;
  if (whichFilter == 3)
  {
    v4 ^= -[NSString hash](self->_name, "hash");
  }
  else
  {
    if (whichFilter == 2)
    {
      v5 = 36;
    }
    else
    {
      if (whichFilter != 1)
        goto LABEL_8;
      v5 = 32;
    }
    v4 ^= 2654435761 * *(int *)((char *)&self->super.super.isa + v5);
  }
LABEL_8:
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    lastTimestamp = self->_lastTimestamp;
    v8 = -lastTimestamp;
    if (lastTimestamp >= 0.0)
      v8 = self->_lastTimestamp;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  return v6 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  id *v7;

  v7 = (id *)a3;
  objc_msgSend(v7, "readAll:", 0);
  -[GEOActiveResourceFilter resetFilter](self, "resetFilter");
  v4 = v7;
  v5 = v7[6];
  if (v5 == (id)3)
  {
    objc_storeStrong((id *)&self->_name, v7[3]);
    v4 = v7;
  }
  else
  {
    if (v5 == (id)2)
    {
      v6 = 36;
    }
    else
    {
      if (v5 != (id)1)
        goto LABEL_8;
      v6 = 32;
    }
    *(_DWORD *)((char *)&self->super.super.isa + v6) = *(_DWORD *)((char *)v7 + v6);
  }
LABEL_8:
  self->_whichFilter = (unint64_t)v4[6];
  if (((_BYTE)v4[5] & 1) != 0)
  {
    *(_QWORD *)&self->_lastTimestamp = v4[2];
    *(_BYTE *)&self->_flags |= 1u;
  }

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
    -[GEOActiveResourceFilter readAll:](self, "readAll:", 0);
}

- (unint64_t)whichFilter
{
  return self->_whichFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
