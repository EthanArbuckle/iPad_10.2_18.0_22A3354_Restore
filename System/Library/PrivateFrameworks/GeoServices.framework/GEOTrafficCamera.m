@implementation GEOTrafficCamera

- (GEOTrafficCamera)init
{
  GEOTrafficCamera *v2;
  GEOTrafficCamera *v3;
  GEOTrafficCamera *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTrafficCamera;
  v2 = -[GEOTrafficCamera init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTrafficCamera)initWithData:(id)a3
{
  GEOTrafficCamera *v3;
  GEOTrafficCamera *v4;
  GEOTrafficCamera *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTrafficCamera;
  v3 = -[GEOTrafficCamera initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficCameraReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIdentifier_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasIdentifier
{
  -[GEOTrafficCamera _readIdentifier]((uint64_t)self);
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOTrafficCamera _readIdentifier]((uint64_t)self);
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2064;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C08788[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPEED_LIMIT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RED_LIGHT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUS_LANE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMERGENCY_LANE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SURVEILLANCE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER_VIOLATION")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readPosition
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficCameraReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPosition_tags_6692);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasPosition
{
  -[GEOTrafficCamera _readPosition]((uint64_t)self);
  return self->_position != 0;
}

- (GEOLatLng)position
{
  -[GEOTrafficCamera _readPosition]((uint64_t)self);
  return self->_position;
}

- (void)setPosition:(id)a3
{
  *(_WORD *)&self->_flags |= 0x900u;
  objc_storeStrong((id *)&self->_position, a3);
}

- (unsigned)highlightDistance
{
  return self->_highlightDistance;
}

- (void)setHighlightDistance:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_highlightDistance = a3;
}

- (void)setHasHighlightDistance:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2056;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasHighlightDistance
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readInfoCard
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficCameraReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInfoCard_tags_6693);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasInfoCard
{
  -[GEOTrafficCamera _readInfoCard]((uint64_t)self);
  return self->_infoCard != 0;
}

- (GEOMiniCard)infoCard
{
  -[GEOTrafficCamera _readInfoCard]((uint64_t)self);
  return self->_infoCard;
}

- (void)setInfoCard:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_infoCard, a3);
}

- (void)_readSpeedLimitText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficCameraReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpeedLimitText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasSpeedLimitText
{
  -[GEOTrafficCamera _readSpeedLimitText]((uint64_t)self);
  return self->_speedLimitText != 0;
}

- (NSString)speedLimitText
{
  -[GEOTrafficCamera _readSpeedLimitText]((uint64_t)self);
  return self->_speedLimitText;
}

- (void)setSpeedLimitText:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_speedLimitText, a3);
}

- (double)speedThreshold
{
  return self->_speedThreshold;
}

- (void)setSpeedThreshold:(double)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_speedThreshold = a3;
}

- (void)setHasSpeedThreshold:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasSpeedThreshold
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readSpeedingCard
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 100) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficCameraReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpeedingCard_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasSpeedingCard
{
  -[GEOTrafficCamera _readSpeedingCard]((uint64_t)self);
  return self->_speedingCard != 0;
}

- (GEOMiniCard)speedingCard
{
  -[GEOTrafficCamera _readSpeedingCard]((uint64_t)self);
  return self->_speedingCard;
}

- (void)setSpeedingCard:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_speedingCard, a3);
}

- (unsigned)cameraPriority
{
  return self->_cameraPriority;
}

- (void)setCameraPriority:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_cameraPriority = a3;
}

- (void)setHasCameraPriority:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2050;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasCameraPriority
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unsigned)countryCodeStyleId
{
  return self->_countryCodeStyleId;
}

- (void)setCountryCodeStyleId:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_countryCodeStyleId = a3;
}

- (void)setHasCountryCodeStyleId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2052;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasCountryCodeStyleId
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOTrafficCamera;
  -[GEOTrafficCamera description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTrafficCamera dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTrafficCamera _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  __int16 v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v37[4];
  id v38;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("identifier"));

  if ((*(_WORD *)(a1 + 100) & 0x10) != 0)
  {
    v6 = *(int *)(a1 + 96);
    if (v6 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 96));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C08788[v6];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("type"));

  }
  objc_msgSend((id)a1, "position");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("position"));

  }
  if ((*(_WORD *)(a1 + 100) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("highlightDistance");
    else
      v12 = CFSTR("highlight_distance");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend((id)a1, "infoCard");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("infoCard");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("info_card");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  objc_msgSend((id)a1, "speedLimitText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (a2)
      v18 = CFSTR("speedLimitText");
    else
      v18 = CFSTR("speed_limit_text");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);
  }

  if ((*(_WORD *)(a1 + 100) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("speedThreshold");
    else
      v20 = CFSTR("speed_threshold");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  objc_msgSend((id)a1, "speedingCard");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("speedingCard");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("speeding_card");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  v25 = *(_WORD *)(a1 + 100);
  if ((v25 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v27 = CFSTR("cameraPriority");
    else
      v27 = CFSTR("camera_priority");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

    v25 = *(_WORD *)(a1 + 100);
  }
  if ((v25 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 88));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v29 = CFSTR("countryCodeStyleId");
    else
      v29 = CFSTR("country_code_style_id");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
  v30 = *(void **)(a1 + 16);
  if (v30)
  {
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __46__GEOTrafficCamera__dictionaryRepresentation___block_invoke;
      v37[3] = &unk_1E1C00600;
      v34 = v33;
      v38 = v34;
      objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v37);
      v35 = v34;

      v32 = v35;
    }
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTrafficCamera _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOTrafficCamera__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTrafficCamera)initWithDictionary:(id)a3
{
  return (GEOTrafficCamera *)-[GEOTrafficCamera _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  GEOLatLng *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEOMiniCard *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  GEOMiniCard *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;

  v5 = a2;
  if (!a1)
    goto LABEL_72;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_72;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(a1, "setIdentifier:", v7);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v10 = 0;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SPEED_LIMIT")) & 1) != 0)
    {
      v10 = 1;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RED_LIGHT")) & 1) != 0)
    {
      v10 = 2;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("BUS_LANE")) & 1) != 0)
    {
      v10 = 3;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("EMERGENCY_LANE")) & 1) != 0)
    {
      v10 = 4;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SURVEILLANCE")) & 1) != 0)
    {
      v10 = 5;
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("OTHER_VIOLATION")))
    {
      v10 = 6;
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v8, "intValue");
LABEL_24:
    objc_msgSend(a1, "setType:", v10);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("position"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v13 = -[GEOLatLng initWithJSON:](v12, "initWithJSON:", v11);
    else
      v13 = -[GEOLatLng initWithDictionary:](v12, "initWithDictionary:", v11);
    v14 = (void *)v13;
    objc_msgSend(a1, "setPosition:", v13);

  }
  if (a3)
    v15 = CFSTR("highlightDistance");
  else
    v15 = CFSTR("highlight_distance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setHighlightDistance:", objc_msgSend(v16, "unsignedIntValue"));

  if (a3)
    v17 = CFSTR("infoCard");
  else
    v17 = CFSTR("info_card");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = [GEOMiniCard alloc];
    if ((a3 & 1) != 0)
      v20 = -[GEOMiniCard initWithJSON:](v19, "initWithJSON:", v18);
    else
      v20 = -[GEOMiniCard initWithDictionary:](v19, "initWithDictionary:", v18);
    v21 = (void *)v20;
    objc_msgSend(a1, "setInfoCard:", v20);

  }
  if (a3)
    v22 = CFSTR("speedLimitText");
  else
    v22 = CFSTR("speed_limit_text");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(a1, "setSpeedLimitText:", v24);

  }
  if (a3)
    v25 = CFSTR("speedThreshold");
  else
    v25 = CFSTR("speed_threshold");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v26, "doubleValue");
    objc_msgSend(a1, "setSpeedThreshold:");
  }

  if (a3)
    v27 = CFSTR("speedingCard");
  else
    v27 = CFSTR("speeding_card");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = [GEOMiniCard alloc];
    if ((a3 & 1) != 0)
      v30 = -[GEOMiniCard initWithJSON:](v29, "initWithJSON:", v28);
    else
      v30 = -[GEOMiniCard initWithDictionary:](v29, "initWithDictionary:", v28);
    v31 = (void *)v30;
    objc_msgSend(a1, "setSpeedingCard:", v30);

  }
  if (a3)
    v32 = CFSTR("cameraPriority");
  else
    v32 = CFSTR("camera_priority");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCameraPriority:", objc_msgSend(v33, "unsignedIntValue"));

  if (a3)
    v34 = CFSTR("countryCodeStyleId");
  else
    v34 = CFSTR("country_code_style_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCountryCodeStyleId:", objc_msgSend(v35, "unsignedIntValue"));

LABEL_72:
  return a1;
}

- (GEOTrafficCamera)initWithJSON:(id)a3
{
  return (GEOTrafficCamera *)-[GEOTrafficCamera _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_6714;
    else
      v8 = (int *)&readAll__nonRecursiveTag_6715;
    GEOTrafficCameraReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOLatLng readAll:](self->_position, "readAll:", 1);
    -[GEOMiniCard readAll:](self->_infoCard, "readAll:", 1);
    -[GEOMiniCard readAll:](self->_speedingCard, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTrafficCameraIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTrafficCameraReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  __int16 flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTrafficCameraIsDirty((uint64_t)self) & 1) == 0)
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
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTrafficCamera readAll:](self, "readAll:", 0);
    if (self->_identifier)
      PBDataWriterWriteStringField();
    v5 = v9;
    if ((*(_WORD *)&self->_flags & 0x10) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v9;
    }
    if (self->_position)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v9;
    }
    if (self->_infoCard)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_speedLimitText)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    if ((*(_WORD *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      v5 = v9;
    }
    if (self->_speedingCard)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v9;
      flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOTrafficCamera _readPosition]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_position, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOTrafficCamera readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 18) = self->_readerMarkPos;
  *((_DWORD *)v6 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_identifier)
    objc_msgSend(v6, "setIdentifier:");
  v4 = v6;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v6 + 24) = self->_type;
    *((_WORD *)v6 + 50) |= 0x10u;
  }
  if (self->_position)
  {
    objc_msgSend(v6, "setPosition:");
    v4 = v6;
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v4 + 23) = self->_highlightDistance;
    *((_WORD *)v4 + 50) |= 8u;
  }
  if (self->_infoCard)
  {
    objc_msgSend(v6, "setInfoCard:");
    v4 = v6;
  }
  if (self->_speedLimitText)
  {
    objc_msgSend(v6, "setSpeedLimitText:");
    v4 = v6;
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    v4[7] = *(id *)&self->_speedThreshold;
    *((_WORD *)v4 + 50) |= 1u;
  }
  if (self->_speedingCard)
  {
    objc_msgSend(v6, "setSpeedingCard:");
    v4 = v6;
  }
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_cameraPriority;
    *((_WORD *)v4 + 50) |= 2u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_countryCodeStyleId;
    *((_WORD *)v4 + 50) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  __int16 flags;
  PBUnknownFields *v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTrafficCameraReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTrafficCamera readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_type;
    *(_WORD *)(v5 + 100) |= 0x10u;
  }
  v11 = -[GEOLatLng copyWithZone:](self->_position, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_highlightDistance;
    *(_WORD *)(v5 + 100) |= 8u;
  }
  v13 = -[GEOMiniCard copyWithZone:](self->_infoCard, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  v15 = -[NSString copyWithZone:](self->_speedLimitText, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 56) = self->_speedThreshold;
    *(_WORD *)(v5 + 100) |= 1u;
  }
  v17 = -[GEOMiniCard copyWithZone:](self->_speedingCard, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v17;

  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_cameraPriority;
    *(_WORD *)(v5 + 100) |= 2u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_countryCodeStyleId;
    *(_WORD *)(v5 + 100) |= 4u;
  }
  v20 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  __int16 flags;
  __int16 v7;
  GEOLatLng *position;
  GEOMiniCard *infoCard;
  NSString *speedLimitText;
  __int16 v11;
  __int16 v12;
  GEOMiniCard *speedingCard;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  -[GEOTrafficCamera readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_38;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 50);
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 24))
      goto LABEL_38;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_38;
  }
  position = self->_position;
  if ((unint64_t)position | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOLatLng isEqual:](position, "isEqual:"))
      goto LABEL_38;
    flags = (__int16)self->_flags;
    v7 = *((_WORD *)v4 + 50);
  }
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_highlightDistance != *((_DWORD *)v4 + 23))
      goto LABEL_38;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_38;
  }
  infoCard = self->_infoCard;
  if ((unint64_t)infoCard | *((_QWORD *)v4 + 4) && !-[GEOMiniCard isEqual:](infoCard, "isEqual:"))
    goto LABEL_38;
  speedLimitText = self->_speedLimitText;
  if ((unint64_t)speedLimitText | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](speedLimitText, "isEqual:"))
      goto LABEL_38;
  }
  v11 = (__int16)self->_flags;
  v12 = *((_WORD *)v4 + 50);
  if ((v11 & 1) != 0)
  {
    if ((v12 & 1) == 0 || self->_speedThreshold != *((double *)v4 + 7))
      goto LABEL_38;
  }
  else if ((v12 & 1) != 0)
  {
    goto LABEL_38;
  }
  speedingCard = self->_speedingCard;
  if ((unint64_t)speedingCard | *((_QWORD *)v4 + 8))
  {
    if (-[GEOMiniCard isEqual:](speedingCard, "isEqual:"))
    {
      v11 = (__int16)self->_flags;
      v12 = *((_WORD *)v4 + 50);
      goto LABEL_29;
    }
LABEL_38:
    v14 = 0;
    goto LABEL_39;
  }
LABEL_29:
  if ((v11 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_cameraPriority != *((_DWORD *)v4 + 21))
      goto LABEL_38;
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_38;
  }
  v14 = (v12 & 4) == 0;
  if ((v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_countryCodeStyleId != *((_DWORD *)v4 + 22))
      goto LABEL_38;
    v14 = 1;
  }
LABEL_39:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  double speedThreshold;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  __int16 flags;
  uint64_t v16;
  uint64_t v17;

  -[GEOTrafficCamera readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_identifier, "hash");
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
    v4 = 2654435761 * self->_type;
  else
    v4 = 0;
  v5 = -[GEOLatLng hash](self->_position, "hash");
  if ((*(_WORD *)&self->_flags & 8) != 0)
    v6 = 2654435761 * self->_highlightDistance;
  else
    v6 = 0;
  v7 = -[GEOMiniCard hash](self->_infoCard, "hash");
  v8 = -[NSString hash](self->_speedLimitText, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    speedThreshold = self->_speedThreshold;
    v11 = -speedThreshold;
    if (speedThreshold >= 0.0)
      v11 = self->_speedThreshold;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v14 = -[GEOMiniCard hash](self->_speedingCard, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v16 = 2654435761 * self->_cameraPriority;
    if ((flags & 4) != 0)
      goto LABEL_17;
LABEL_19:
    v17 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v16 ^ v17;
  }
  v16 = 0;
  if ((flags & 4) == 0)
    goto LABEL_19;
LABEL_17:
  v17 = 2654435761 * self->_countryCodeStyleId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOLatLng *position;
  uint64_t v6;
  GEOMiniCard *infoCard;
  uint64_t v8;
  GEOMiniCard *speedingCard;
  uint64_t v10;
  __int16 v11;
  _QWORD *v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  v4 = v12;
  if (v12[3])
  {
    -[GEOTrafficCamera setIdentifier:](self, "setIdentifier:");
    v4 = v12;
  }
  if ((*((_WORD *)v4 + 50) & 0x10) != 0)
  {
    self->_type = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_flags |= 0x10u;
  }
  position = self->_position;
  v6 = v4[5];
  if (position)
  {
    if (!v6)
      goto LABEL_11;
    -[GEOLatLng mergeFrom:](position, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[GEOTrafficCamera setPosition:](self, "setPosition:");
  }
  v4 = v12;
LABEL_11:
  if ((*((_WORD *)v4 + 50) & 8) != 0)
  {
    self->_highlightDistance = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_flags |= 8u;
  }
  infoCard = self->_infoCard;
  v8 = v4[4];
  if (infoCard)
  {
    if (!v8)
      goto LABEL_19;
    -[GEOMiniCard mergeFrom:](infoCard, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_19;
    -[GEOTrafficCamera setInfoCard:](self, "setInfoCard:");
  }
  v4 = v12;
LABEL_19:
  if (v4[6])
  {
    -[GEOTrafficCamera setSpeedLimitText:](self, "setSpeedLimitText:");
    v4 = v12;
  }
  if ((*((_WORD *)v4 + 50) & 1) != 0)
  {
    self->_speedThreshold = (double)v4[7];
    *(_WORD *)&self->_flags |= 1u;
  }
  speedingCard = self->_speedingCard;
  v10 = v4[8];
  if (speedingCard)
  {
    if (!v10)
      goto LABEL_29;
    -[GEOMiniCard mergeFrom:](speedingCard, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_29;
    -[GEOTrafficCamera setSpeedingCard:](self, "setSpeedingCard:");
  }
  v4 = v12;
LABEL_29:
  v11 = *((_WORD *)v4 + 50);
  if ((v11 & 2) != 0)
  {
    self->_cameraPriority = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 2u;
    v11 = *((_WORD *)v4 + 50);
  }
  if ((v11 & 4) != 0)
  {
    self->_countryCodeStyleId = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 4u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTrafficCameraReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6718);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x820u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTrafficCamera readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_position, "clearUnknownFields:", 1);
    -[GEOMiniCard clearUnknownFields:](self->_infoCard, "clearUnknownFields:", 1);
    -[GEOMiniCard clearUnknownFields:](self->_speedingCard, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speedingCard, 0);
  objc_storeStrong((id *)&self->_speedLimitText, 0);
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_infoCard, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
