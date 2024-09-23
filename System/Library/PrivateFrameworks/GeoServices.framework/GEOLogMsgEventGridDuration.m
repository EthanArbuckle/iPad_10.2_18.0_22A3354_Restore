@implementation GEOLogMsgEventGridDuration

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDurationMs
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)endState
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_endState;
  else
    return 0;
}

- (void)setEndState:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_endState = a3;
}

- (void)setHasEndState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasEndState
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)endStateAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C22558[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEndState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GRID_END_STATE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GRID_END_STATE_COMPLETE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GRID_END_STATE_ERROR")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GRID_END_STATE_CANCELED")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSMutableArray)endStateErrorReasons
{
  return self->_endStateErrorReasons;
}

- (void)setEndStateErrorReasons:(id)a3
{
  objc_storeStrong((id *)&self->_endStateErrorReasons, a3);
}

- (void)clearEndStateErrorReasons
{
  -[NSMutableArray removeAllObjects](self->_endStateErrorReasons, "removeAllObjects");
}

- (void)addEndStateErrorReason:(id)a3
{
  id v4;
  NSMutableArray *endStateErrorReasons;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  endStateErrorReasons = self->_endStateErrorReasons;
  v8 = v4;
  if (!endStateErrorReasons)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_endStateErrorReasons;
    self->_endStateErrorReasons = v6;

    v4 = v8;
    endStateErrorReasons = self->_endStateErrorReasons;
  }
  -[NSMutableArray addObject:](endStateErrorReasons, "addObject:", v4);

}

- (unint64_t)endStateErrorReasonsCount
{
  return -[NSMutableArray count](self->_endStateErrorReasons, "count");
}

- (id)endStateErrorReasonAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_endStateErrorReasons, "objectAtIndex:", a3);
}

+ (Class)endStateErrorReasonType
{
  return (Class)objc_opt_class();
}

- (int)previousState
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    return self->_previousState;
  else
    return 1;
}

- (void)setPreviousState:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_previousState = a3;
}

- (void)setHasPreviousState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasPreviousState
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)previousStateAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E1C22578[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPreviousState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREVIOUS_STATE_NONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREVIOUS_STATE_GRID")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PREVIOUS_STATE_MAP")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (int)displayType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_displayType;
  else
    return 1;
}

- (void)setDisplayType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_displayType = a3;
}

- (void)setHasDisplayType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDisplayType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)displayTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("DISPLAY_TYPE_MAP");
  if (a3 == 2)
  {
    v3 = CFSTR("DISPLAY_TYPE_NAVIGATION");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDisplayType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISPLAY_TYPE_MAP")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("DISPLAY_TYPE_NAVIGATION")))
      v4 = 2;
    else
      v4 = 1;
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
  v8.super_class = (Class)GEOLogMsgEventGridDuration;
  -[GEOLogMsgEventGridDuration description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventGridDuration dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventGridDuration _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const __CFString *v19;
  char v20;
  unsigned int v21;
  __CFString *v22;
  const __CFString *v23;
  int v24;
  __CFString *v25;
  const __CFString *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("durationMs");
    else
      v7 = CFSTR("duration_ms");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 32);
  }
  if ((v5 & 4) != 0)
  {
    v8 = *(int *)(a1 + 24);
    if (v8 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E1C22558[v8];
    }
    if (a2)
      v10 = CFSTR("endState");
    else
      v10 = CFSTR("end_state");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if (objc_msgSend(*(id *)(a1 + 8), "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = *(id *)(a1 + 8);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v17, "jsonRepresentation");
          else
            objc_msgSend(v17, "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v14);
    }

    if (a2)
      v19 = CFSTR("endStateErrorReason");
    else
      v19 = CFSTR("end_state_error_reason");
    objc_msgSend(v4, "setObject:forKey:", v11, v19);

  }
  v20 = *(_BYTE *)(a1 + 32);
  if ((v20 & 8) != 0)
  {
    v21 = *(_DWORD *)(a1 + 28) - 1;
    if (v21 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 28));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E1C22578[v21];
    }
    if (a2)
      v23 = CFSTR("previousState");
    else
      v23 = CFSTR("previous_state");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

    v20 = *(_BYTE *)(a1 + 32);
  }
  if ((v20 & 1) != 0)
  {
    v24 = *(_DWORD *)(a1 + 16);
    if (v24 == 1)
    {
      v25 = CFSTR("DISPLAY_TYPE_MAP");
    }
    else if (v24 == 2)
    {
      v25 = CFSTR("DISPLAY_TYPE_NAVIGATION");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 16));
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (a2)
      v26 = CFSTR("displayType");
    else
      v26 = CFSTR("display_type");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventGridDuration _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventGridDuration)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventGridDuration *)-[GEOLogMsgEventGridDuration _initWithDictionary:isJSON:](self, a3, 0);
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
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  GEOLogMsgEventGridDurationEndStateErrorInfo *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("durationMs");
      else
        v6 = CFSTR("duration_ms");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDurationMs:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("endState");
      else
        v8 = CFSTR("end_state");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("GRID_END_STATE_UNKNOWN")) & 1) != 0)
        {
          v11 = 0;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("GRID_END_STATE_COMPLETE")) & 1) != 0)
        {
          v11 = 1;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("GRID_END_STATE_ERROR")) & 1) != 0)
        {
          v11 = 2;
        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("GRID_END_STATE_CANCELED")))
        {
          v11 = 3;
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
          goto LABEL_25;
        v11 = objc_msgSend(v9, "intValue");
      }
      objc_msgSend(a1, "setEndState:", v11);
LABEL_25:

      if (a3)
        v12 = CFSTR("endStateErrorReason");
      else
        v12 = CFSTR("end_state_error_reason");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = v5;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v34 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v20 = [GEOLogMsgEventGridDurationEndStateErrorInfo alloc];
                if ((a3 & 1) != 0)
                  v21 = -[GEOLogMsgEventGridDurationEndStateErrorInfo initWithJSON:](v20, "initWithJSON:", v19);
                else
                  v21 = -[GEOLogMsgEventGridDurationEndStateErrorInfo initWithDictionary:](v20, "initWithDictionary:", v19);
                v22 = (void *)v21;
                objc_msgSend(a1, "addEndStateErrorReason:", v21);

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          }
          while (v16);
        }

        v5 = v32;
      }

      if (a3)
        v23 = CFSTR("previousState");
      else
        v23 = CFSTR("previous_state");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = v24;
        if ((objc_msgSend(v25, "isEqualToString:", CFSTR("PREVIOUS_STATE_NONE")) & 1) != 0)
        {
          v26 = 1;
        }
        else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("PREVIOUS_STATE_GRID")) & 1) != 0)
        {
          v26 = 2;
        }
        else if (objc_msgSend(v25, "isEqualToString:", CFSTR("PREVIOUS_STATE_MAP")))
        {
          v26 = 3;
        }
        else
        {
          v26 = 1;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_57;
        v26 = objc_msgSend(v24, "intValue");
      }
      objc_msgSend(a1, "setPreviousState:", v26);
LABEL_57:

      if (a3)
        v27 = CFSTR("displayType");
      else
        v27 = CFSTR("display_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = v28;
        v30 = 1;
        if ((objc_msgSend(v29, "isEqualToString:", CFSTR("DISPLAY_TYPE_MAP")) & 1) == 0)
        {
          if (objc_msgSend(v29, "isEqualToString:", CFSTR("DISPLAY_TYPE_NAVIGATION")))
            v30 = 2;
          else
            v30 = 1;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_69:

          goto LABEL_70;
        }
        v30 = objc_msgSend(v28, "intValue");
      }
      objc_msgSend(a1, "setDisplayType:", v30);
      goto LABEL_69;
    }
  }
LABEL_70:

  return a1;
}

- (GEOLogMsgEventGridDuration)initWithJSON:(id)a3
{
  return (GEOLogMsgEventGridDuration *)-[GEOLogMsgEventGridDuration _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventGridDurationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventGridDurationReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
    PBDataWriterWriteInt32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_endStateErrorReasons;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = (char)self->_flags;
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = (char)self->_flags;
  }
  if ((v11 & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  _DWORD *v10;

  v10 = a3;
  -[GEOLogMsgEventGridDuration readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v10[5] = self->_durationMs;
    *((_BYTE *)v10 + 32) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    v10[6] = self->_endState;
    *((_BYTE *)v10 + 32) |= 4u;
  }
  if (-[GEOLogMsgEventGridDuration endStateErrorReasonsCount](self, "endStateErrorReasonsCount"))
  {
    objc_msgSend(v10, "clearEndStateErrorReasons");
    v5 = -[GEOLogMsgEventGridDuration endStateErrorReasonsCount](self, "endStateErrorReasonsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOLogMsgEventGridDuration endStateErrorReasonAtIndex:](self, "endStateErrorReasonAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addEndStateErrorReason:", v8);

      }
    }
  }
  v9 = (char)self->_flags;
  if ((v9 & 8) != 0)
  {
    v10[7] = self->_previousState;
    *((_BYTE *)v10 + 32) |= 8u;
    v9 = (char)self->_flags;
  }
  if ((v9 & 1) != 0)
  {
    v10[4] = self->_displayType;
    *((_BYTE *)v10 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_durationMs;
    *(_BYTE *)(v5 + 32) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_endState;
    *(_BYTE *)(v5 + 32) |= 4u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_endStateErrorReasons;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend((id)v6, "addEndStateErrorReason:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (char)self->_flags;
  if ((v14 & 8) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_previousState;
    *(_BYTE *)(v6 + 32) |= 8u;
    v14 = (char)self->_flags;
  }
  if ((v14 & 1) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_displayType;
    *(_BYTE *)(v6 + 32) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSMutableArray *endStateErrorReasons;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEOLogMsgEventGridDuration readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 32);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_durationMs != *((_DWORD *)v4 + 5))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_endState != *((_DWORD *)v4 + 6))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_24;
  }
  endStateErrorReasons = self->_endStateErrorReasons;
  if ((unint64_t)endStateErrorReasons | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](endStateErrorReasons, "isEqual:"))
    {
LABEL_24:
      v8 = 0;
      goto LABEL_25;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 32);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_previousState != *((_DWORD *)v4 + 7))
      goto LABEL_24;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_24;
  }
  v8 = (v6 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_displayType != *((_DWORD *)v4 + 4))
      goto LABEL_24;
    v8 = 1;
  }
LABEL_25:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOLogMsgEventGridDuration readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_durationMs;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_endState;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSMutableArray hash](self->_endStateErrorReasons, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v6 = 2654435761 * self->_previousState;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_8;
LABEL_10:
    v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_10;
LABEL_8:
  v7 = 2654435761 * self->_displayType;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_durationMs = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v4 + 32);
  }
  if ((v5 & 4) != 0)
  {
    self->_endState = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_flags |= 4u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *((id *)v4 + 1);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[GEOLogMsgEventGridDuration addEndStateErrorReason:](self, "addEndStateErrorReason:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = *((_BYTE *)v4 + 32);
  if ((v11 & 8) != 0)
  {
    self->_previousState = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_flags |= 8u;
    v11 = *((_BYTE *)v4 + 32);
  }
  if ((v11 & 1) != 0)
  {
    self->_displayType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endStateErrorReasons, 0);
}

@end
