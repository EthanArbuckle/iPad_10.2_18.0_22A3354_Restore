@implementation GEOProactiveItem

- (int)proactiveItemType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_proactiveItemType;
  else
    return 0;
}

- (void)setProactiveItemType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_proactiveItemType = a3;
}

- (void)setHasProactiveItemType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasProactiveItemType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)proactiveItemTypeAsString:(int)a3
{
  if (a3 < 0x17)
    return off_1E1C031E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsProactiveItemType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_ADDRESS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_FAVORITE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_PARKED_CAR")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_CALENDAR")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_BOOKED_CAR")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_TABLE_RESERVATION")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_TABLE_QUEUE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_APP_CONNECTION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_RESUME_NAV")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_TRANSIT_NAV")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_RECENTS_AND_PINS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_LOW_GAS")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_VENUES")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_FIM_HOTEL")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_FIM_CAR_RENTAL")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_FIM_FLIGHT")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_FIM_TICKETED_EVENT")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_PORTRAIT")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_USERPLACE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_VEHICLEADVERTISEMENT")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_RATING_REQUEST")) & 1) != 0)
  {
    v4 = 21;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_TYPE_FAVORITE_BUTTON")))
  {
    v4 = 22;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)timeSinceStart
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_timeSinceStart;
  else
    return -1;
}

- (void)setTimeSinceStart:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_timeSinceStart = a3;
}

- (void)setHasTimeSinceStart:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTimeSinceStart
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x40u;
  self->_visible = a3;
}

- (void)setHasVisible:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasVisible
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (BOOL)tapped
{
  return self->_tapped;
}

- (void)setTapped:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_tapped = a3;
}

- (void)setHasTapped:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasTapped
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (BOOL)shared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_shared = a3;
}

- (void)setHasShared:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasShared
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (BOOL)edited
{
  return self->_edited;
}

- (void)setEdited:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_edited = a3;
}

- (void)setHasEdited:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasEdited
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasDeleted
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
  v8.super_class = (Class)GEOProactiveItem;
  -[GEOProactiveItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOProactiveItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOProactiveItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 1) != 0)
  {
    v6 = *(int *)(a1 + 8);
    if (v6 >= 0x17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 8));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C031E8[v6];
    }
    if (a2)
      v8 = CFSTR("proactiveItemType");
    else
      v8 = CFSTR("proactive_item_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 24);
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 12));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("timeSinceStart");
    else
      v10 = CFSTR("time_since_start");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 0x40) == 0)
    {
LABEL_12:
      if ((v5 & 0x20) == 0)
        goto LABEL_13;
      goto LABEL_22;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 20));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("visible"));

  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 19));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("tapped"));

  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 0x10) == 0)
  {
LABEL_14:
    if ((v5 & 8) == 0)
      goto LABEL_15;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 18));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("shared"));

  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 8) == 0)
  {
LABEL_15:
    if ((v5 & 4) == 0)
      return v4;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 17));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("edited"));

  if ((*(_BYTE *)(a1 + 24) & 4) != 0)
  {
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 16));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("deleted"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOProactiveItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOProactiveItem)initWithDictionary:(id)a3
{
  return (GEOProactiveItem *)-[GEOProactiveItem _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a2;
  if (!a1)
    goto LABEL_74;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_74;
  if (a3)
    v6 = CFSTR("proactiveItemType");
  else
    v6 = CFSTR("proactive_item_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_ADDRESS")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_FAVORITE")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_PARKED_CAR")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_CALENDAR")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_BOOKED_CAR")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_TABLE_RESERVATION")) & 1) != 0)
    {
      v9 = 6;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_TABLE_QUEUE")) & 1) != 0)
    {
      v9 = 7;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_APP_CONNECTION")) & 1) != 0)
    {
      v9 = 8;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_RESUME_NAV")) & 1) != 0)
    {
      v9 = 9;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_TRANSIT_NAV")) & 1) != 0)
    {
      v9 = 10;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_RECENTS_AND_PINS")) & 1) != 0)
    {
      v9 = 11;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_LOW_GAS")) & 1) != 0)
    {
      v9 = 12;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_VENUES")) & 1) != 0)
    {
      v9 = 13;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_FIM_HOTEL")) & 1) != 0)
    {
      v9 = 14;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_FIM_CAR_RENTAL")) & 1) != 0)
    {
      v9 = 15;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_FIM_FLIGHT")) & 1) != 0)
    {
      v9 = 16;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_FIM_TICKETED_EVENT")) & 1) != 0)
    {
      v9 = 17;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_PORTRAIT")) & 1) != 0)
    {
      v9 = 18;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_USERPLACE")) & 1) != 0)
    {
      v9 = 19;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_VEHICLEADVERTISEMENT")) & 1) != 0)
    {
      v9 = 20;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_RATING_REQUEST")) & 1) != 0)
    {
      v9 = 21;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_TYPE_FAVORITE_BUTTON")))
    {
      v9 = 22;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_57;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_57:
    objc_msgSend(a1, "setProactiveItemType:", v9);
  }

  if (a3)
    v10 = CFSTR("timeSinceStart");
  else
    v10 = CFSTR("time_since_start");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTimeSinceStart:", objc_msgSend(v11, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("visible"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setVisible:", objc_msgSend(v12, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tapped"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTapped:", objc_msgSend(v13, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shared"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setShared:", objc_msgSend(v14, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("edited"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEdited:", objc_msgSend(v15, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deleted"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDeleted:", objc_msgSend(v16, "BOOLValue"));

LABEL_74:
  return a1;
}

- (GEOProactiveItem)initWithJSON:(id)a3
{
  return (GEOProactiveItem *)-[GEOProactiveItem _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOProactiveItemIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOProactiveItemReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0)
      goto LABEL_7;
LABEL_15:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_15;
LABEL_7:
  if ((flags & 4) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOProactiveItem readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5[2] = self->_proactiveItemType;
    *((_BYTE *)v5 + 24) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[3] = self->_timeSinceStart;
  *((_BYTE *)v5 + 24) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)v5 + 20) = self->_visible;
  *((_BYTE *)v5 + 24) |= 0x40u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)v5 + 19) = self->_tapped;
  *((_BYTE *)v5 + 24) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0)
      goto LABEL_7;
LABEL_15:
    *((_BYTE *)v5 + 17) = self->_edited;
    *((_BYTE *)v5 + 24) |= 8u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  *((_BYTE *)v5 + 18) = self->_shared;
  *((_BYTE *)v5 + 24) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_15;
LABEL_7:
  if ((flags & 4) != 0)
  {
LABEL_8:
    *((_BYTE *)v5 + 16) = self->_deleted;
    *((_BYTE *)v5 + 24) |= 4u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_proactiveItemType;
    *((_BYTE *)result + 24) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_timeSinceStart;
  *((_BYTE *)result + 24) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)result + 20) = self->_visible;
  *((_BYTE *)result + 24) |= 0x40u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)result + 19) = self->_tapped;
  *((_BYTE *)result + 24) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_BYTE *)result + 18) = self->_shared;
  *((_BYTE *)result + 24) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_7:
    if ((flags & 4) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_BYTE *)result + 17) = self->_edited;
  *((_BYTE *)result + 24) |= 8u;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    return result;
LABEL_8:
  *((_BYTE *)result + 16) = self->_deleted;
  *((_BYTE *)result + 24) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_46;
  -[GEOProactiveItem readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_proactiveItemType != *((_DWORD *)v4 + 2))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_timeSinceStart != *((_DWORD *)v4 + 3))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 0x40) == 0)
      goto LABEL_46;
    if (self->_visible)
    {
      if (!*((_BYTE *)v4 + 20))
        goto LABEL_46;
    }
    else if (*((_BYTE *)v4 + 20))
    {
      goto LABEL_46;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 0x40) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 0x20) == 0)
      goto LABEL_46;
    if (self->_tapped)
    {
      if (!*((_BYTE *)v4 + 19))
        goto LABEL_46;
    }
    else if (*((_BYTE *)v4 + 19))
    {
      goto LABEL_46;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 0x10) == 0)
      goto LABEL_46;
    if (self->_shared)
    {
      if (!*((_BYTE *)v4 + 18))
        goto LABEL_46;
    }
    else if (*((_BYTE *)v4 + 18))
    {
      goto LABEL_46;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 0x10) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 8) == 0)
      goto LABEL_46;
    if (self->_edited)
    {
      if (!*((_BYTE *)v4 + 17))
        goto LABEL_46;
    }
    else if (*((_BYTE *)v4 + 17))
    {
      goto LABEL_46;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 8) != 0)
  {
    goto LABEL_46;
  }
  v5 = (*((_BYTE *)v4 + 24) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) != 0)
    {
      if (self->_deleted)
      {
        if (!*((_BYTE *)v4 + 16))
          goto LABEL_46;
      }
      else if (*((_BYTE *)v4 + 16))
      {
        goto LABEL_46;
      }
      v5 = 1;
      goto LABEL_47;
    }
LABEL_46:
    v5 = 0;
  }
LABEL_47:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  -[GEOProactiveItem readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_proactiveItemType;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_timeSinceStart;
      if ((*(_BYTE *)&self->_flags & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_visible;
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_tapped;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_shared;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_7;
LABEL_14:
    v8 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_8;
LABEL_15:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_14;
LABEL_7:
  v8 = 2654435761 * self->_edited;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_15;
LABEL_8:
  v9 = 2654435761 * self->_deleted;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 1) != 0)
  {
    self->_proactiveItemType = *((_DWORD *)v5 + 2);
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v5 + 24);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v5 + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_timeSinceStart = *((_DWORD *)v5 + 3);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 0x40) == 0)
  {
LABEL_4:
    if ((v4 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_visible = *((_BYTE *)v5 + 20);
  *(_BYTE *)&self->_flags |= 0x40u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 0x20) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_tapped = *((_BYTE *)v5 + 19);
  *(_BYTE *)&self->_flags |= 0x20u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 8) == 0)
      goto LABEL_7;
LABEL_15:
    self->_edited = *((_BYTE *)v5 + 17);
    *(_BYTE *)&self->_flags |= 8u;
    if ((*((_BYTE *)v5 + 24) & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  self->_shared = *((_BYTE *)v5 + 18);
  *(_BYTE *)&self->_flags |= 0x10u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 8) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v4 & 4) != 0)
  {
LABEL_8:
    self->_deleted = *((_BYTE *)v5 + 16);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_9:

}

@end
