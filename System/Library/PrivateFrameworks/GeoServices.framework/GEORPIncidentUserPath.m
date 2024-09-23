@implementation GEORPIncidentUserPath

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPIncidentUserPath;
  -[GEORPIncidentUserPath dealloc](&v3, sel_dealloc);
}

- (unint64_t)userPathsCount
{
  return self->_userPaths.count;
}

- (int)userPaths
{
  return self->_userPaths.list;
}

- (void)clearUserPaths
{
  PBRepeatedInt32Clear();
}

- (void)addUserPath:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)userPathAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_userPaths;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_userPaths = &self->_userPaths;
  count = self->_userPaths.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_userPaths->list[a3];
}

- (void)setUserPaths:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)userPathsAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C02C00[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUserPaths:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_PATH_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_PATH_SIRI")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_PATH_NAV_TRAY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_PATH_DODGEBALL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_PATH_RAP")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_PATH_REPORT_ICON")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("USER_PATH_INCIDENT_CARD")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)reportedFromCarplay
{
  return self->_reportedFromCarplay;
}

- (void)setReportedFromCarplay:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_reportedFromCarplay = a3;
}

- (void)setHasReportedFromCarplay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasReportedFromCarplay
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)navigationActive
{
  return self->_navigationActive;
}

- (void)setNavigationActive:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_navigationActive = a3;
}

- (void)setHasNavigationActive:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasNavigationActive
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)transportType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_transportType;
  else
    return 0;
}

- (void)setTransportType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTransportType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C02C38[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransportType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARE")))
  {
    v4 = 6;
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
  v8.super_class = (Class)GEORPIncidentUserPath;
  -[GEORPIncidentUserPath description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPIncidentUserPath dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPIncidentUserPath _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  char v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  const __CFString *v18;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 16))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_QWORD *)(a1 + 8);
    if (*(_QWORD *)(a1 + 16))
    {
      v7 = 0;
      do
      {
        v8 = *(int *)(*v6 + 4 * v7);
        if (v8 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = off_1E1C02C00[v8];
        }
        objc_msgSend(v5, "addObject:", v9);

        ++v7;
        v6 = (_QWORD *)(a1 + 8);
      }
      while (v7 < *(_QWORD *)(a1 + 16));
    }
    if (a2)
      v10 = CFSTR("userPath");
    else
      v10 = CFSTR("user_path");
    objc_msgSend(v4, "setObject:forKey:", v5, v10);

  }
  v11 = *(_BYTE *)(a1 + 40);
  if ((v11 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 37));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("reportedFromCarplay");
    else
      v13 = CFSTR("reported_from_carplay");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

    v11 = *(_BYTE *)(a1 + 40);
    if ((v11 & 2) == 0)
    {
LABEL_15:
      if ((v11 & 1) == 0)
        return v4;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)(a1 + 40) & 2) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 36));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v15 = CFSTR("navigationActive");
  else
    v15 = CFSTR("navigation_active");
  objc_msgSend(v4, "setObject:forKey:", v14, v15);

  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
LABEL_25:
    v16 = *(int *)(a1 + 32);
    if (v16 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E1C02C38[v16];
    }
    if (a2)
      v18 = CFSTR("transportType");
    else
      v18 = CFSTR("transport_type");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPIncidentUserPath _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPIncidentUserPath)initWithDictionary:(id)a3
{
  return (GEORPIncidentUserPath *)-[GEORPIncidentUserPath _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v26;
  int v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_69;
  }
  v6 = (void *)objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("userPath");
    else
      v7 = CFSTR("user_path");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = a3;
      v28 = v5;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v26 = v8;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (!v10)
        goto LABEL_34;
      v11 = v10;
      v12 = *(_QWORD *)v30;
      while (1)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v14;
            if ((objc_msgSend(v15, "isEqualToString:", CFSTR("USER_PATH_UNKNOWN")) & 1) != 0)
            {
              v16 = 0;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("USER_PATH_SIRI")) & 1) != 0)
            {
              v16 = 1;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("USER_PATH_NAV_TRAY")) & 1) != 0)
            {
              v16 = 2;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("USER_PATH_DODGEBALL")) & 1) != 0)
            {
              v16 = 3;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("USER_PATH_RAP")) & 1) != 0)
            {
              v16 = 4;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("USER_PATH_REPORT_ICON")) & 1) != 0)
            {
              v16 = 5;
            }
            else if (objc_msgSend(v15, "isEqualToString:", CFSTR("USER_PATH_INCIDENT_CARD")))
            {
              v16 = 6;
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
              goto LABEL_32;
            v16 = objc_msgSend(v14, "intValue");
          }
          objc_msgSend(v6, "addUserPath:", v16);
LABEL_32:
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (!v11)
        {
LABEL_34:

          v5 = v28;
          a3 = v27;
          v8 = v26;
          break;
        }
      }
    }

    if (a3)
      v17 = CFSTR("reportedFromCarplay");
    else
      v17 = CFSTR("reported_from_carplay");
    objc_msgSend(v5, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setReportedFromCarplay:", objc_msgSend(v18, "BOOLValue"));

    if (a3)
      v19 = CFSTR("navigationActive");
    else
      v19 = CFSTR("navigation_active");
    objc_msgSend(v5, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setNavigationActive:", objc_msgSend(v20, "BOOLValue"));

    if (a3)
      v21 = CFSTR("transportType");
    else
      v21 = CFSTR("transport_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v22;
      if ((objc_msgSend(v23, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
      {
        v24 = 0;
      }
      else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
      {
        v24 = 1;
      }
      else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
      {
        v24 = 2;
      }
      else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
      {
        v24 = 3;
      }
      else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
      {
        v24 = 4;
      }
      else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
      {
        v24 = 5;
      }
      else if (objc_msgSend(v23, "isEqualToString:", CFSTR("RIDESHARE")))
      {
        v24 = 6;
      }
      else
      {
        v24 = 0;
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
      v24 = objc_msgSend(v22, "intValue");
    }
    objc_msgSend(v6, "setTransportType:", v24);
    goto LABEL_68;
  }
LABEL_69:

  return v6;
}

- (GEORPIncidentUserPath)initWithJSON:(id)a3
{
  return (GEORPIncidentUserPath *)-[GEORPIncidentUserPath _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPIncidentUserPathIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPIncidentUserPathReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  char flags;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_userPaths.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v7;
      ++v5;
    }
    while (v5 < self->_userPaths.count);
  }
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_6;
LABEL_10:
    PBDataWriterWriteBOOLField();
    v4 = v7;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  v4 = v7;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_10;
LABEL_6:
  if ((flags & 1) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
LABEL_8:

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  char flags;
  id v8;

  v8 = a3;
  -[GEORPIncidentUserPath readAll:](self, "readAll:", 0);
  if (-[GEORPIncidentUserPath userPathsCount](self, "userPathsCount"))
  {
    objc_msgSend(v8, "clearUserPaths");
    v4 = -[GEORPIncidentUserPath userPathsCount](self, "userPathsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v8, "addUserPath:", -[GEORPIncidentUserPath userPathAtIndex:](self, "userPathAtIndex:", i));
    }
  }
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_7;
LABEL_11:
    *((_BYTE *)v8 + 36) = self->_navigationActive;
    *((_BYTE *)v8 + 40) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_BYTE *)v8 + 37) = self->_reportedFromCarplay;
  *((_BYTE *)v8 + 40) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((flags & 1) != 0)
  {
LABEL_8:
    *((_DWORD *)v8 + 8) = self->_transportType;
    *((_BYTE *)v8 + 40) |= 1u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_BYTE *)(v4 + 36) = self->_navigationActive;
    *(_BYTE *)(v4 + 40) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      return (id)v4;
    goto LABEL_4;
  }
  *(_BYTE *)(v4 + 37) = self->_reportedFromCarplay;
  *(_BYTE *)(v4 + 40) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v4 + 32) = self->_transportType;
    *(_BYTE *)(v4 + 40) |= 1u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[GEORPIncidentUserPath readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_23;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0)
      goto LABEL_23;
    if (self->_reportedFromCarplay)
    {
      if (!*((_BYTE *)v4 + 37))
        goto LABEL_23;
    }
    else if (*((_BYTE *)v4 + 37))
    {
      goto LABEL_23;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) != 0)
    {
      if (self->_navigationActive)
      {
        if (!*((_BYTE *)v4 + 36))
          goto LABEL_23;
        goto LABEL_19;
      }
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_19;
    }
LABEL_23:
    v5 = 0;
    goto LABEL_24;
  }
  if ((*((_BYTE *)v4 + 40) & 2) != 0)
    goto LABEL_23;
LABEL_19:
  v5 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_transportType != *((_DWORD *)v4 + 8))
      goto LABEL_23;
    v5 = 1;
  }
LABEL_24:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEORPIncidentUserPath readAll:](self, "readAll:", 1);
  v3 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_reportedFromCarplay;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_navigationActive;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_transportType;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  char v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = objc_msgSend(v8, "userPathsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEORPIncidentUserPath addUserPath:](self, "addUserPath:", objc_msgSend(v8, "userPathAtIndex:", i));
  }
  v7 = *((_BYTE *)v8 + 40);
  if ((v7 & 4) == 0)
  {
    if ((*((_BYTE *)v8 + 40) & 2) == 0)
      goto LABEL_6;
LABEL_10:
    self->_navigationActive = *((_BYTE *)v8 + 36);
    *(_BYTE *)&self->_flags |= 2u;
    if ((*((_BYTE *)v8 + 40) & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  self->_reportedFromCarplay = *((_BYTE *)v8 + 37);
  *(_BYTE *)&self->_flags |= 4u;
  v7 = *((_BYTE *)v8 + 40);
  if ((v7 & 2) != 0)
    goto LABEL_10;
LABEL_6:
  if ((v7 & 1) != 0)
  {
LABEL_7:
    self->_transportType = *((_DWORD *)v8 + 8);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_8:

}

@end
