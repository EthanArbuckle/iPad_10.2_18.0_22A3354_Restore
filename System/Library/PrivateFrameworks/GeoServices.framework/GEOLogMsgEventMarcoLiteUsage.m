@implementation GEOLogMsgEventMarcoLiteUsage

- (unsigned)totalNavTime
{
  return self->_totalNavTime;
}

- (void)setTotalNavTime:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_totalNavTime = a3;
}

- (void)setHasTotalNavTime:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTotalNavTime
{
  return *(_BYTE *)&self->_flags & 1;
}

- (NSMutableArray)usageStates
{
  return self->_usageStates;
}

- (void)setUsageStates:(id)a3
{
  objc_storeStrong((id *)&self->_usageStates, a3);
}

- (void)clearUsageStates
{
  -[NSMutableArray removeAllObjects](self->_usageStates, "removeAllObjects");
}

- (void)addUsageStates:(id)a3
{
  id v4;
  NSMutableArray *usageStates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  usageStates = self->_usageStates;
  v8 = v4;
  if (!usageStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_usageStates;
    self->_usageStates = v6;

    v4 = v8;
    usageStates = self->_usageStates;
  }
  -[NSMutableArray addObject:](usageStates, "addObject:", v4);

}

- (unint64_t)usageStatesCount
{
  return -[NSMutableArray count](self->_usageStates, "count");
}

- (id)usageStatesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_usageStates, "objectAtIndex:", a3);
}

+ (Class)usageStatesType
{
  return (Class)objc_opt_class();
}

- (int)vioTrigger
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_vioTrigger;
  else
    return 0;
}

- (void)setVioTrigger:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_vioTrigger = a3;
}

- (void)setHasVioTrigger:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasVioTrigger
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)vioTriggerAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("MARCO_LITE_TRIGGERED");
  if (a3 == 1)
  {
    v3 = CFSTR("TREADSTONE_TRIGGERED");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsVioTrigger:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MARCO_LITE_TRIGGERED")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TREADSTONE_TRIGGERED"));

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
  v8.super_class = (Class)GEOLogMsgEventMarcoLiteUsage;
  -[GEOLogMsgEventMarcoLiteUsage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventMarcoLiteUsage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventMarcoLiteUsage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  int v16;
  __CFString *v17;
  const __CFString *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("totalNavTime");
    else
      v6 = CFSTR("total_nav_time");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (objc_msgSend(*(id *)(a1 + 8), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = *(id *)(a1 + 8);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    if (a2)
      v15 = CFSTR("usageStates");
    else
      v15 = CFSTR("usage_states");
    objc_msgSend(v4, "setObject:forKey:", v7, v15);

  }
  if ((*(_BYTE *)(a1 + 24) & 2) != 0)
  {
    v16 = *(_DWORD *)(a1 + 20);
    if (v16)
    {
      if (v16 == 1)
      {
        v17 = CFSTR("TREADSTONE_TRIGGERED");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 20));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v17 = CFSTR("MARCO_LITE_TRIGGERED");
    }
    if (a2)
      v18 = CFSTR("vioTrigger");
    else
      v18 = CFSTR("vio_trigger");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventMarcoLiteUsage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventMarcoLiteUsage)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventMarcoLiteUsage *)-[GEOLogMsgEventMarcoLiteUsage _initWithDictionary:isJSON:](self, a3, 0);
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
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  GEOMarcoLiteUsageState *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("totalNavTime");
      else
        v6 = CFSTR("total_nav_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTotalNavTime:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("usageStates");
      else
        v8 = CFSTR("usage_states");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v5;
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = [GEOMarcoLiteUsageState alloc];
                if ((a3 & 1) != 0)
                  v17 = -[GEOMarcoLiteUsageState initWithJSON:](v16, "initWithJSON:", v15);
                else
                  v17 = -[GEOMarcoLiteUsageState initWithDictionary:](v16, "initWithDictionary:", v15);
                v18 = (void *)v17;
                objc_msgSend(a1, "addUsageStates:", v17);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v12);
        }

        v5 = v24;
      }

      if (a3)
        v19 = CFSTR("vioTrigger");
      else
        v19 = CFSTR("vio_trigger");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v20;
        if ((objc_msgSend(v21, "isEqualToString:", CFSTR("MARCO_LITE_TRIGGERED")) & 1) != 0)
          v22 = 0;
        else
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("TREADSTONE_TRIGGERED"));

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_36:

          goto LABEL_37;
        }
        v22 = objc_msgSend(v20, "intValue");
      }
      objc_msgSend(a1, "setVioTrigger:", v22);
      goto LABEL_36;
    }
  }
LABEL_37:

  return a1;
}

- (GEOLogMsgEventMarcoLiteUsage)initWithJSON:(id)a3
{
  return (GEOLogMsgEventMarcoLiteUsage *)-[GEOLogMsgEventMarcoLiteUsage _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventMarcoLiteUsageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventMarcoLiteUsageReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteUint32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_usageStates;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_flags & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _DWORD *v8;

  v8 = a3;
  -[GEOLogMsgEventMarcoLiteUsage readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v8[4] = self->_totalNavTime;
    *((_BYTE *)v8 + 24) |= 1u;
  }
  if (-[GEOLogMsgEventMarcoLiteUsage usageStatesCount](self, "usageStatesCount"))
  {
    objc_msgSend(v8, "clearUsageStates");
    v4 = -[GEOLogMsgEventMarcoLiteUsage usageStatesCount](self, "usageStatesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLogMsgEventMarcoLiteUsage usageStatesAtIndex:](self, "usageStatesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addUsageStates:", v7);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v8[5] = self->_vioTrigger;
    *((_BYTE *)v8 + 24) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_totalNavTime;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_usageStates;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend((id)v6, "addUsageStates:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_vioTrigger;
    *(_BYTE *)(v6 + 24) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSMutableArray *usageStates;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOLogMsgEventMarcoLiteUsage readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 24);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_totalNavTime != *((_DWORD *)v4 + 4))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_14;
  }
  usageStates = self->_usageStates;
  if ((unint64_t)usageStates | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](usageStates, "isEqual:"))
    {
LABEL_14:
      v8 = 0;
      goto LABEL_15;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 24);
  }
  v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_vioTrigger != *((_DWORD *)v4 + 5))
      goto LABEL_14;
    v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOLogMsgEventMarcoLiteUsage readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_totalNavTime;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_usageStates, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v5 = 2654435761 * self->_vioTrigger;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    self->_totalNavTime = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[GEOLogMsgEventMarcoLiteUsage addUsageStates:](self, "addUsageStates:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    self->_vioTrigger = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageStates, 0);
}

@end
