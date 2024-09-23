@implementation ATXPBERMEvent

- (uint64_t)setEventDate:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 60) |= 4u;
    *(double *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)setHasEventDate:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 4;
    else
      v2 = 0;
    *(_BYTE *)(result + 60) = *(_BYTE *)(result + 60) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasEventDate
{
  if (result)
    return (*(unsigned __int8 *)(result + 60) >> 2) & 1;
  return result;
}

- (uint64_t)eventType
{
  if (result)
  {
    if ((*(_BYTE *)(result + 60) & 8) != 0)
      return *(unsigned int *)(result + 40);
    else
      return 0;
  }
  return result;
}

- (uint64_t)setEventType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 60) |= 8u;
    *(_DWORD *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setHasEventType:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 8;
    else
      v2 = 0;
    *(_BYTE *)(result + 60) = *(_BYTE *)(result + 60) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasEventType
{
  if (result)
    return (*(unsigned __int8 *)(result + 60) >> 3) & 1;
  return result;
}

- (__CFString)eventTypeAsString:(__CFString *)a1
{
  if (a1)
  {
    if (!(_DWORD)a2)
      return CFSTR("Unknown");
    if ((_DWORD)a2 == 1)
    {
      a1 = CFSTR("AddedEntry");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (uint64_t)StringAsEventType:(uint64_t)a1
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
      a1 = 0;
    else
      a1 = objc_msgSend(v4, "isEqualToString:", CFSTR("AddedEntry"));
  }

  return a1;
}

- (uint64_t)setDateEngaged:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 60) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasDateEngaged:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 60) = *(_BYTE *)(result + 60) & 0xFE | a2;
  return result;
}

- (uint64_t)hasDateEngaged
{
  if (result)
    return *(_BYTE *)(result + 60) & 1;
  return result;
}

- (uint64_t)setEngagementType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 60) |= 2u;
    *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasEngagementType:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 60) = *(_BYTE *)(result + 60) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasEngagementType
{
  if (result)
    return (*(unsigned __int8 *)(result + 60) >> 1) & 1;
  return result;
}

- (uint64_t)executableType
{
  if (result)
  {
    if ((*(_BYTE *)(result + 60) & 0x10) != 0)
      return *(unsigned int *)(result + 56);
    else
      return 0;
  }
  return result;
}

- (uint64_t)setExecutableType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 60) |= 0x10u;
    *(_DWORD *)(result + 56) = a2;
  }
  return result;
}

- (uint64_t)setHasExecutableType:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 16;
    else
      v2 = 0;
    *(_BYTE *)(result + 60) = *(_BYTE *)(result + 60) & 0xEF | v2;
  }
  return result;
}

- (uint64_t)hasExecutableType
{
  if (result)
    return (*(unsigned __int8 *)(result + 60) >> 4) & 1;
  return result;
}

- (__CFString)executableTypeAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 6)
      return off_1E4D581E8[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsExecutableType:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("string")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("action")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("heroAppPrediction")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("infoSuggestion")) & 1) != 0)
    {
      v6 = 4;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("linkAction")))
    {
      v6 = 5;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasExecutable
{
  if (result)
    return *(_QWORD *)(result + 48) != 0;
  return result;
}

- (uint64_t)clearClientModelIds
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "removeAllObjects");
  return result;
}

- (void)addClientModelId:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)clientModelIdsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "count");
  return result;
}

- (id)clientModelIdAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[4], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (uint64_t)clientModelIdType
{
  objc_opt_self();
  return objc_opt_class();
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
  v8.super_class = (Class)ATXPBERMEvent;
  -[ATXPBERMEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBERMEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  int eventType;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t executableType;
  __CFString *v11;
  NSData *executable;
  NSMutableArray *clientModelIds;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_eventDate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("eventDate"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  eventType = self->_eventType;
  if (eventType)
  {
    if (eventType == 1)
    {
      v7 = CFSTR("AddedEntry");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = CFSTR("Unknown");
  }
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("eventType"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateEngaged);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("dateEngaged"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_engagementType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("engagementType"));

  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_20;
LABEL_16:
  executableType = self->_executableType;
  if (executableType >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_executableType);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E4D581E8[executableType];
  }
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("executableType"));

LABEL_20:
  executable = self->_executable;
  if (executable)
    objc_msgSend(v3, "setObject:forKey:", executable, CFSTR("executable"));
  clientModelIds = self->_clientModelIds;
  if (clientModelIds)
    objc_msgSend(v3, "setObject:forKey:", clientModelIds, CFSTR("clientModelId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBERMEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_executable)
    PBDataWriterWriteDataField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_clientModelIds;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(uint64_t)a1
{
  char v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id *v10;

  v10 = a2;
  if (!a1)
    goto LABEL_19;
  v3 = *(_BYTE *)(a1 + 60);
  if ((v3 & 4) != 0)
  {
    v4 = v10;
    v10[3] = *(id *)(a1 + 24);
    *((_BYTE *)v10 + 60) |= 4u;
    v3 = *(_BYTE *)(a1 + 60);
    if ((v3 & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  v4 = v10;
  if ((*(_BYTE *)(a1 + 60) & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 10) = *(_DWORD *)(a1 + 40);
    *((_BYTE *)v4 + 60) |= 8u;
    v3 = *(_BYTE *)(a1 + 60);
  }
LABEL_7:
  if ((v3 & 1) == 0)
  {
    if ((v3 & 2) == 0)
      goto LABEL_9;
LABEL_21:
    v4[2] = *(id *)(a1 + 16);
    *((_BYTE *)v4 + 60) |= 2u;
    if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v4[1] = *(id *)(a1 + 8);
  *((_BYTE *)v4 + 60) |= 1u;
  v3 = *(_BYTE *)(a1 + 60);
  if ((v3 & 2) != 0)
    goto LABEL_21;
LABEL_9:
  if ((v3 & 0x10) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 14) = *(_DWORD *)(a1 + 56);
    *((_BYTE *)v4 + 60) |= 0x10u;
  }
LABEL_11:
  v5 = *(void **)(a1 + 48);
  if (v5)
    -[ATXPBERMEvent setExecutable:]((uint64_t)v10, v5);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    if (v10)
      objc_msgSend(v10[4], "removeAllObjects");
    v6 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXPBERMEvent addClientModelId:]((uint64_t)v10, v9);

      }
    }
  }
LABEL_19:

}

- (void)setExecutable:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_eventDate;
    *(_BYTE *)(v5 + 60) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 40) = self->_eventType;
  *(_BYTE *)(v5 + 60) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *(double *)(v5 + 8) = self->_dateEngaged;
  *(_BYTE *)(v5 + 60) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_18:
  *(_QWORD *)(v5 + 16) = self->_engagementType;
  *(_BYTE *)(v5 + 60) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 56) = self->_executableType;
    *(_BYTE *)(v5 + 60) |= 0x10u;
  }
LABEL_7:
  v8 = -[NSData copyWithZone:](self->_executable, "copyWithZone:", a3);
  v9 = (void *)v6[6];
  v6[6] = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_clientModelIds;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v17);
        -[ATXPBERMEvent addClientModelId:]((uint64_t)v6, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *executable;
  NSMutableArray *clientModelIds;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_eventDate != *((double *)v4 + 3))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
LABEL_31:
    v7 = 0;
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_eventType != *((_DWORD *)v4 + 10))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_dateEngaged != *((double *)v4 + 1))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_engagementType != *((_QWORD *)v4 + 2))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x10) == 0 || self->_executableType != *((_DWORD *)v4 + 14))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  executable = self->_executable;
  if ((unint64_t)executable | *((_QWORD *)v4 + 6) && !-[NSData isEqual:](executable, "isEqual:"))
    goto LABEL_31;
  clientModelIds = self->_clientModelIds;
  if ((unint64_t)clientModelIds | *((_QWORD *)v4 + 4))
    v7 = -[NSMutableArray isEqual:](clientModelIds, "isEqual:");
  else
    v7 = 1;
LABEL_32:

  return v7;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double eventDate;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  double dateEngaged;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    eventDate = self->_eventDate;
    v6 = -eventDate;
    if (eventDate >= 0.0)
      v6 = self->_eventDate;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 8) != 0)
  {
    v9 = 2654435761 * self->_eventType;
    if ((has & 1) != 0)
      goto LABEL_11;
LABEL_16:
    v14 = 0;
    goto LABEL_19;
  }
  v9 = 0;
  if ((has & 1) == 0)
    goto LABEL_16;
LABEL_11:
  dateEngaged = self->_dateEngaged;
  v11 = -dateEngaged;
  if (dateEngaged >= 0.0)
    v11 = self->_dateEngaged;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_19:
  if ((has & 2) != 0)
  {
    v15 = 2654435761u * self->_engagementType;
    if ((has & 0x10) != 0)
      goto LABEL_21;
LABEL_23:
    v16 = 0;
    goto LABEL_24;
  }
  v15 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_23;
LABEL_21:
  v16 = 2654435761 * self->_executableType;
LABEL_24:
  v17 = v9 ^ v4 ^ v14 ^ v15 ^ v16 ^ -[NSData hash](self->_executable, "hash");
  return v17 ^ -[NSMutableArray hash](self->_clientModelIds, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id *v3;
  id *v4;
  char v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_18;
  v5 = *((_BYTE *)v3 + 60);
  if ((v5 & 4) != 0)
  {
    *(_QWORD *)(a1 + 24) = v3[3];
    *(_BYTE *)(a1 + 60) |= 4u;
    v5 = *((_BYTE *)v3 + 60);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_21;
    }
  }
  else if ((*((_BYTE *)v3 + 60) & 8) == 0)
  {
    goto LABEL_4;
  }
  *(_DWORD *)(a1 + 40) = *((_DWORD *)v3 + 10);
  *(_BYTE *)(a1 + 60) |= 8u;
  v5 = *((_BYTE *)v3 + 60);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
LABEL_22:
    *(_QWORD *)(a1 + 16) = v3[2];
    *(_BYTE *)(a1 + 60) |= 2u;
    if ((*((_BYTE *)v3 + 60) & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  *(_QWORD *)(a1 + 8) = v3[1];
  *(_BYTE *)(a1 + 60) |= 1u;
  v5 = *((_BYTE *)v3 + 60);
  if ((v5 & 2) != 0)
    goto LABEL_22;
LABEL_6:
  if ((v5 & 0x10) != 0)
  {
LABEL_7:
    *(_DWORD *)(a1 + 56) = *((_DWORD *)v3 + 14);
    *(_BYTE *)(a1 + 60) |= 0x10u;
  }
LABEL_8:
  v6 = v3[6];
  if (v6)
    objc_storeStrong((id *)(a1 + 48), v6);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v4[4];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[ATXPBERMEvent addClientModelId:](a1, *(void **)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

LABEL_18:
}

- (double)eventDate
{
  if (a1)
    return *(double *)(a1 + 24);
  else
    return 0.0;
}

- (double)dateEngaged
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (uint64_t)engagementType
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)executable
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)clientModelIds
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (void)setClientModelIds:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executable, 0);
  objc_storeStrong((id *)&self->_clientModelIds, 0);
}

@end
