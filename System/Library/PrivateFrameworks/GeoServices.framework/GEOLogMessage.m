@implementation GEOLogMessage

- (NSMutableArray)logMsgEvents
{
  return self->_logMsgEvents;
}

- (void)setLogMsgEvents:(id)a3
{
  objc_storeStrong((id *)&self->_logMsgEvents, a3);
}

- (void)clearLogMsgEvents
{
  -[NSMutableArray removeAllObjects](self->_logMsgEvents, "removeAllObjects");
}

- (void)addLogMsgEvent:(id)a3
{
  id v4;
  NSMutableArray *logMsgEvents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  logMsgEvents = self->_logMsgEvents;
  v8 = v4;
  if (!logMsgEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_logMsgEvents;
    self->_logMsgEvents = v6;

    v4 = v8;
    logMsgEvents = self->_logMsgEvents;
  }
  -[NSMutableArray addObject:](logMsgEvents, "addObject:", v4);

}

- (unint64_t)logMsgEventsCount
{
  return -[NSMutableArray count](self->_logMsgEvents, "count");
}

- (id)logMsgEventAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_logMsgEvents, "objectAtIndex:", a3);
}

+ (Class)logMsgEventType
{
  return (Class)objc_opt_class();
}

- (int)logMessageType
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_logMessageType;
  else
    return 0;
}

- (void)setLogMessageType:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_logMessageType = a3;
}

- (void)setHasLogMessageType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLogMessageType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)logMessageTypeAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 <= 11999)
  {
    v3 = CFSTR("LOG_MESSAGE_TYPE_UNKNOWN");
    switch(a3)
    {
      case 0:
        return v3;
      case 1:
        return CFSTR("DEBUGLOG");
      case 2:
        return CFSTR("CURATED_COLLECTION_SESSION");
      case 3:
        return CFSTR("FIFTEEN_MONTH_SESSION");
      case 4:
        return CFSTR("PRESSURE_DATA_SESSION");
      case 5:
        return CFSTR("POI_BUSYNESS_DATA_SESSION");
      case 6:
        return CFSTR("FIFTEEN_MONTH_USER_SESSION");
      case 7:
        return CFSTR("NETWORK_SELECTION_HARVEST_SESSION");
      default:
        if (a3 == 10000)
        {
          result = CFSTR("USAGE");
        }
        else
        {
          if (a3 != 11000)
            goto LABEL_33;
          result = CFSTR("SHORT_SESSION_USAGE");
        }
        break;
    }
  }
  else
  {
    if (a3 <= 29999)
    {
      if (a3 <= 13999)
      {
        if (a3 == 12000)
          return CFSTR("LONG_SESSION_USAGE");
        if (a3 == 13000)
          return CFSTR("SESSIONLESS_USAGE");
      }
      else
      {
        switch(a3)
        {
          case 14000:
            return CFSTR("LONG_SESSION_LOG_FRAMEWORK_USAGE");
          case 15000:
            return CFSTR("COHORTS_SESSION_USAGE");
          case 20000:
            v3 = CFSTR("PERFORMANCE");
            return v3;
        }
      }
LABEL_33:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    switch(a3)
    {
      case 50000:
        result = CFSTR("REALTIME_TRAFFIC_PROBE");
        break;
      case 50001:
        result = CFSTR("BATCH_TRAFFIC_PROBE");
        break;
      case 50002:
        result = CFSTR("WIFI_CONNECTION_QUALITY_PROBE_COLLECTION");
        break;
      case 50003:
        result = CFSTR("LOG_DISCARD_EVENT");
        break;
      default:
        if (a3 == 30000)
        {
          result = CFSTR("NAVIGATION_TRACE");
        }
        else
        {
          if (a3 != 40000)
            goto LABEL_33;
          result = CFSTR("TELEMETRY");
        }
        break;
    }
  }
  return result;
}

- (int)StringAsLogMessageType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOG_MESSAGE_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEBUGLOG")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION_SESSION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIFTEEN_MONTH_SESSION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRESSURE_DATA_SESSION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_BUSYNESS_DATA_SESSION")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIFTEEN_MONTH_USER_SESSION")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NETWORK_SELECTION_HARVEST_SESSION")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USAGE")) & 1) != 0)
  {
    v4 = 10000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHORT_SESSION_USAGE")) & 1) != 0)
  {
    v4 = 11000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LONG_SESSION_USAGE")) & 1) != 0)
  {
    v4 = 12000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SESSIONLESS_USAGE")) & 1) != 0)
  {
    v4 = 13000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LONG_SESSION_LOG_FRAMEWORK_USAGE")) & 1) != 0)
  {
    v4 = 14000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COHORTS_SESSION_USAGE")) & 1) != 0)
  {
    v4 = 15000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERFORMANCE")) & 1) != 0)
  {
    v4 = 20000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAVIGATION_TRACE")) & 1) != 0)
  {
    v4 = 30000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TELEMETRY")) & 1) != 0)
  {
    v4 = 40000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REALTIME_TRAFFIC_PROBE")) & 1) != 0)
  {
    v4 = 50000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BATCH_TRAFFIC_PROBE")) & 1) != 0)
  {
    v4 = 50001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_CONNECTION_QUALITY_PROBE_COLLECTION")) & 1) != 0)
  {
    v4 = 50002;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LOG_DISCARD_EVENT")))
  {
    v4 = 50003;
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
  v8.super_class = (Class)GEOLogMessage;
  -[GEOLogMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMessage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  char v14;
  int v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 8), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = *(id *)(a1 + 8);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("logMsgEvent");
    else
      v13 = CFSTR("log_msg_event");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  v14 = *(_BYTE *)(a1 + 24);
  if ((v14 & 2) != 0)
  {
    v15 = *(_DWORD *)(a1 + 20);
    if (v15 <= 11999)
    {
      v16 = CFSTR("LOG_MESSAGE_TYPE_UNKNOWN");
      switch(v15)
      {
        case 0:
          goto LABEL_53;
        case 1:
          v16 = CFSTR("DEBUGLOG");
          break;
        case 2:
          v16 = CFSTR("CURATED_COLLECTION_SESSION");
          break;
        case 3:
          v16 = CFSTR("FIFTEEN_MONTH_SESSION");
          break;
        case 4:
          v16 = CFSTR("PRESSURE_DATA_SESSION");
          break;
        case 5:
          v16 = CFSTR("POI_BUSYNESS_DATA_SESSION");
          break;
        case 6:
          v16 = CFSTR("FIFTEEN_MONTH_USER_SESSION");
          break;
        case 7:
          v16 = CFSTR("NETWORK_SELECTION_HARVEST_SESSION");
          break;
        default:
          if (v15 == 10000)
          {
            v16 = CFSTR("USAGE");
          }
          else
          {
            if (v15 != 11000)
              goto LABEL_41;
            v16 = CFSTR("SHORT_SESSION_USAGE");
          }
          break;
      }
      goto LABEL_53;
    }
    if (v15 > 29999)
    {
      switch(v15)
      {
        case 50000:
          v16 = CFSTR("REALTIME_TRAFFIC_PROBE");
          break;
        case 50001:
          v16 = CFSTR("BATCH_TRAFFIC_PROBE");
          break;
        case 50002:
          v16 = CFSTR("WIFI_CONNECTION_QUALITY_PROBE_COLLECTION");
          break;
        case 50003:
          v16 = CFSTR("LOG_DISCARD_EVENT");
          break;
        default:
          if (v15 == 30000)
          {
            v16 = CFSTR("NAVIGATION_TRACE");
          }
          else
          {
            if (v15 != 40000)
              goto LABEL_41;
            v16 = CFSTR("TELEMETRY");
          }
          break;
      }
      goto LABEL_53;
    }
    if (v15 <= 13999)
    {
      if (v15 == 12000)
      {
        v16 = CFSTR("LONG_SESSION_USAGE");
        goto LABEL_53;
      }
      if (v15 == 13000)
      {
        v16 = CFSTR("SESSIONLESS_USAGE");
        goto LABEL_53;
      }
    }
    else
    {
      switch(v15)
      {
        case 14000:
          v16 = CFSTR("LONG_SESSION_LOG_FRAMEWORK_USAGE");
          goto LABEL_53;
        case 15000:
          v16 = CFSTR("COHORTS_SESSION_USAGE");
          goto LABEL_53;
        case 20000:
          v16 = CFSTR("PERFORMANCE");
LABEL_53:
          if (a2)
            v17 = CFSTR("logMessageType");
          else
            v17 = CFSTR("log_message_type");
          objc_msgSend(v4, "setObject:forKey:", v16, v17);

          v14 = *(_BYTE *)(a1 + 24);
          goto LABEL_57;
      }
    }
LABEL_41:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 20));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
LABEL_57:
  if ((v14 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("groupRetryCount");
    else
      v19 = CFSTR("group_retry_count");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMessage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMessage)initWithDictionary:(id)a3
{
  return (GEOLogMessage *)-[GEOLogMessage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  GEOLogMsgEvent *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_77;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_77;
  if (a3)
    v6 = CFSTR("logMsgEvent");
  else
    v6 = CFSTR("log_msg_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = v5;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = [GEOLogMsgEvent alloc];
            if ((a3 & 1) != 0)
              v15 = -[GEOLogMsgEvent initWithJSON:](v14, "initWithJSON:", v13);
            else
              v15 = -[GEOLogMsgEvent initWithDictionary:](v14, "initWithDictionary:", v13);
            v16 = (void *)v15;
            objc_msgSend(a1, "addLogMsgEvent:", v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    v5 = v24;
  }

  if (a3)
    v17 = CFSTR("logMessageType");
  else
    v17 = CFSTR("log_message_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v18;
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("LOG_MESSAGE_TYPE_UNKNOWN")) & 1) != 0)
    {
      v20 = 0;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("DEBUGLOG")) & 1) != 0)
    {
      v20 = 1;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("CURATED_COLLECTION_SESSION")) & 1) != 0)
    {
      v20 = 2;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("FIFTEEN_MONTH_SESSION")) & 1) != 0)
    {
      v20 = 3;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("PRESSURE_DATA_SESSION")) & 1) != 0)
    {
      v20 = 4;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("POI_BUSYNESS_DATA_SESSION")) & 1) != 0)
    {
      v20 = 5;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("FIFTEEN_MONTH_USER_SESSION")) & 1) != 0)
    {
      v20 = 6;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("NETWORK_SELECTION_HARVEST_SESSION")) & 1) != 0)
    {
      v20 = 7;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("USAGE")) & 1) != 0)
    {
      v20 = 10000;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("SHORT_SESSION_USAGE")) & 1) != 0)
    {
      v20 = 11000;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("LONG_SESSION_USAGE")) & 1) != 0)
    {
      v20 = 12000;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("SESSIONLESS_USAGE")) & 1) != 0)
    {
      v20 = 13000;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("LONG_SESSION_LOG_FRAMEWORK_USAGE")) & 1) != 0)
    {
      v20 = 14000;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("COHORTS_SESSION_USAGE")) & 1) != 0)
    {
      v20 = 15000;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("PERFORMANCE")) & 1) != 0)
    {
      v20 = 20000;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("NAVIGATION_TRACE")) & 1) != 0)
    {
      v20 = 30000;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("TELEMETRY")) & 1) != 0)
    {
      v20 = 40000;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("REALTIME_TRAFFIC_PROBE")) & 1) != 0)
    {
      v20 = 50000;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("BATCH_TRAFFIC_PROBE")) & 1) != 0)
    {
      v20 = 50001;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("WIFI_CONNECTION_QUALITY_PROBE_COLLECTION")) & 1) != 0)
    {
      v20 = 50002;
    }
    else if (objc_msgSend(v19, "isEqualToString:", CFSTR("LOG_DISCARD_EVENT")))
    {
      v20 = 50003;
    }
    else
    {
      v20 = 0;
    }

    goto LABEL_70;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_msgSend(v18, "intValue");
LABEL_70:
    objc_msgSend(a1, "setLogMessageType:", v20);
  }

  if (a3)
    v21 = CFSTR("groupRetryCount");
  else
    v21 = CFSTR("group_retry_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setGroupRetryCount:", objc_msgSend(v22, "unsignedIntValue"));

LABEL_77:
  return a1;
}

- (GEOLogMessage)initWithJSON:(id)a3
{
  return (GEOLogMessage *)-[GEOLogMessage _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMessageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMessageReadAllFrom(self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char flags;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_logMsgEvents;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOLogMessageClearSensitiveFields((uint64_t)self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_logMsgEvents;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v11) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char flags;
  id v9;

  v9 = a3;
  -[GEOLogMessage readAll:](self, "readAll:", 0);
  if (-[GEOLogMessage logMsgEventsCount](self, "logMsgEventsCount"))
  {
    objc_msgSend(v9, "clearLogMsgEvents");
    v4 = -[GEOLogMessage logMsgEventsCount](self, "logMsgEventsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLogMessage logMsgEventAtIndex:](self, "logMsgEventAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addLogMsgEvent:", v7);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v9 + 5) = self->_logMessageType;
    *((_BYTE *)v9 + 24) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v9 + 4) = self->_groupRetryCount;
    *((_BYTE *)v9 + 24) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char flags;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_logMsgEvents;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend((id)v5, "addLogMsgEvent:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_logMessageType;
    *(_BYTE *)(v5 + 24) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_groupRetryCount;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *logMsgEvents;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOLogMessage readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  logMsgEvents = self->_logMsgEvents;
  if ((unint64_t)logMsgEvents | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](logMsgEvents, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_logMessageType != *((_DWORD *)v4 + 5))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_groupRetryCount != *((_DWORD *)v4 + 4))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOLogMessage readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_logMsgEvents, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761 * self->_logMessageType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_groupRetryCount;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[GEOLogMessage addLogMsgEvent:](self, "addLogMsgEvent:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 24);
  if ((v10 & 2) != 0)
  {
    self->_logMessageType = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_flags |= 2u;
    v10 = *((_BYTE *)v4 + 24);
  }
  if ((v10 & 1) != 0)
  {
    self->_groupRetryCount = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (unsigned)groupRetryCount
{
  return self->_groupRetryCount;
}

- (void)setGroupRetryCount:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_groupRetryCount = a3;
}

- (void)setHasGroupRetryCount:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasGroupRetryCount
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logMsgEvents, 0);
}

@end
