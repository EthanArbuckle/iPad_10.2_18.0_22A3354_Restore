@implementation GEOPairedDeviceSubscriptionStatesSummary

- (NSMutableDictionary)subscriptionStates
{
  return self->_subscriptionStates;
}

- (void)setSubscriptionStates:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionStates, a3);
}

- (void)clearSubscriptionStates
{
  -[NSMutableDictionary removeAllObjects](self->_subscriptionStates, "removeAllObjects");
}

- (void)setSubscriptionStatesValue:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *subscriptionStates;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  subscriptionStates = self->_subscriptionStates;
  if (!subscriptionStates)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_subscriptionStates;
    self->_subscriptionStates = v8;

    subscriptionStates = self->_subscriptionStates;
  }
  -[NSMutableDictionary setObject:forKey:](subscriptionStates, "setObject:forKey:", v10, v6);

}

- (id)subscriptionStatesForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_subscriptionStates, "objectForKey:", a3);
}

- (void)enumerateSubscriptionStatesUsingBlock:(id)a3
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_subscriptionStates, "enumerateKeysAndObjectsUsingBlock:", a3);
}

- (unint64_t)subscriptionStatesCount
{
  return -[NSMutableDictionary count](self->_subscriptionStates, "count");
}

+ (Class)subscriptionStatesType
{
  return (Class)objc_opt_class();
}

- (BOOL)isUpdateAvailable
{
  return self->_isUpdateAvailable;
}

- (void)setIsUpdateAvailable:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_isUpdateAvailable = a3;
}

- (void)setHasIsUpdateAvailable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsUpdateAvailable
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)lastUpdatedTimestamp
{
  return self->_lastUpdatedTimestamp;
}

- (void)setLastUpdatedTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_lastUpdatedTimestamp = a3;
}

- (void)setHasLastUpdatedTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLastUpdatedTimestamp
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
  v8.super_class = (Class)GEOPairedDeviceSubscriptionStatesSummary;
  -[GEOPairedDeviceSubscriptionStatesSummary description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPairedDeviceSubscriptionStatesSummary dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceSubscriptionStatesSummary _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  char v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  char v25;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v6 = *(void **)(a1 + 24);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __70__GEOPairedDeviceSubscriptionStatesSummary__dictionaryRepresentation___block_invoke;
    v23[3] = &unk_1E1C15618;
    v24 = v5;
    v25 = a2;
    v7 = v5;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v23);
    if (a2)
      v8 = CFSTR("subscriptionStates");
    else
      v8 = CFSTR("subscription_states");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  v9 = *(_BYTE *)(a1 + 36);
  if ((v9 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("isUpdateAvailable");
    else
      v11 = CFSTR("is_update_available");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

    v9 = *(_BYTE *)(a1 + 36);
  }
  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("lastUpdatedTimestamp");
    else
      v13 = CFSTR("last_updated_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  v14 = *(void **)(a1 + 8);
  if (v14)
  {
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __70__GEOPairedDeviceSubscriptionStatesSummary__dictionaryRepresentation___block_invoke_2;
      v21[3] = &unk_1E1C00600;
      v18 = v17;
      v22 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);
      v19 = v18;

      v16 = v19;
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPairedDeviceSubscriptionStatesSummary _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __70__GEOPairedDeviceSubscriptionStatesSummary__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  int v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 40);
  v6 = a2;
  if (v5)
    objc_msgSend(a3, "jsonRepresentation");
  else
    objc_msgSend(a3, "dictionaryRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, v6);

}

void __70__GEOPairedDeviceSubscriptionStatesSummary__dictionaryRepresentation___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (GEOPairedDeviceSubscriptionStatesSummary)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceSubscriptionStatesSummary *)-[GEOPairedDeviceSubscriptionStatesSummary _initWithDictionary:isJSON:](self, a3, 0);
}

- (_QWORD)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  GEOPairedDeviceSubscriptionStateSummary *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v24;
  int v25;
  id v26;
  _QWORD *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1 && (v27 = (_QWORD *)objc_msgSend(a1, "init")) != 0)
  {
    if (a3)
      v6 = CFSTR("subscriptionStates");
    else
      v6 = CFSTR("subscription_states");
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = a3;
      v26 = v5;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v27[3];
      v27[3] = v8;

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v24 = v7;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v10, "objectForKeyedSubscript:", v15, v24);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)v27[3];
            v18 = -[GEOPairedDeviceSubscriptionStateSummary initWithDictionary:]([GEOPairedDeviceSubscriptionStateSummary alloc], "initWithDictionary:", v16);
            objc_msgSend(v17, "setObject:forKey:", v18, v15);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v12);
      }

      v5 = v26;
      a3 = v25;
      v7 = v24;
    }

    if (a3)
      v19 = CFSTR("isUpdateAvailable");
    else
      v19 = CFSTR("is_update_available");
    objc_msgSend(v5, "objectForKeyedSubscript:", v19, v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v27, "setIsUpdateAvailable:", objc_msgSend(v20, "BOOLValue"));

    if (a3)
      v21 = CFSTR("lastUpdatedTimestamp");
    else
      v21 = CFSTR("last_updated_timestamp");
    objc_msgSend(v5, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v22, "doubleValue");
      objc_msgSend(v27, "setLastUpdatedTimestamp:");
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (GEOPairedDeviceSubscriptionStatesSummary)initWithJSON:(id)a3
{
  return (GEOPairedDeviceSubscriptionStatesSummary *)-[GEOPairedDeviceSubscriptionStatesSummary _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceSubscriptionStatesSummaryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceSubscriptionStatesSummaryReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableDictionary *subscriptionStates;
  char flags;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  subscriptionStates = self->_subscriptionStates;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__GEOPairedDeviceSubscriptionStatesSummary_writeTo___block_invoke;
  v8[3] = &unk_1E1C15640;
  v7 = v4;
  v9 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subscriptionStates, "enumerateKeysAndObjectsUsingBlock:", v8);

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
    PBDataWriterWriteDoubleField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v7);

}

uint64_t __52__GEOPairedDeviceSubscriptionStatesSummary_writeTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a2;
  PBDataWriterPlaceMark();
  PBDataWriterWriteStringField();

  PBDataWriterWriteSubmessage();
  return PBDataWriterRecallMark();
}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSMutableDictionary *subscriptionStates;
  char flags;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a3;
  -[GEOPairedDeviceSubscriptionStatesSummary readAll:](self, "readAll:", 0);
  if (-[GEOPairedDeviceSubscriptionStatesSummary subscriptionStatesCount](self, "subscriptionStatesCount"))
  {
    objc_msgSend(v9, "clearSubscriptionStates");
    v4 = v9;
    if (!*((_QWORD *)v9 + 3))
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v6 = (void *)*((_QWORD *)v9 + 3);
      *((_QWORD *)v9 + 3) = v5;

      v4 = v9;
    }
    subscriptionStates = self->_subscriptionStates;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__GEOPairedDeviceSubscriptionStatesSummary_copyTo___block_invoke;
    v10[3] = &unk_1E1C15640;
    v11 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subscriptionStates, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v9 + 32) = self->_isUpdateAvailable;
    *((_BYTE *)v9 + 36) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_QWORD *)v9 + 2) = *(_QWORD *)&self->_lastUpdatedTimestamp;
    *((_BYTE *)v9 + 36) |= 1u;
  }

}

void __51__GEOPairedDeviceSubscriptionStatesSummary_copyTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableDictionary *subscriptionStates;
  char flags;
  _QWORD v11[4];
  id v12;
  _NSZone *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (-[NSMutableDictionary count](self->_subscriptionStates, "count"))
  {
    objc_msgSend((id)v5, "clearSubscriptionStates");
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v6;

    subscriptionStates = self->_subscriptionStates;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__GEOPairedDeviceSubscriptionStatesSummary_copyWithZone___block_invoke;
    v11[3] = &unk_1E1C15668;
    v13 = a3;
    v12 = (id)v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subscriptionStates, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_isUpdateAvailable;
    *(_BYTE *)(v5 + 36) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 16) = self->_lastUpdatedTimestamp;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

void __57__GEOPairedDeviceSubscriptionStatesSummary_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  v7 = (id)objc_msgSend(a3, "copyWithZone:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v7, v6);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableDictionary *subscriptionStates;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOPairedDeviceSubscriptionStatesSummary readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  subscriptionStates = self->_subscriptionStates;
  if ((unint64_t)subscriptionStates | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableDictionary isEqual:](subscriptionStates, "isEqual:"))
      goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) != 0)
    {
      if (self->_isUpdateAvailable)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_16;
        goto LABEL_12;
      }
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_12;
    }
LABEL_16:
    v6 = 0;
    goto LABEL_17;
  }
  if ((*((_BYTE *)v4 + 36) & 2) != 0)
    goto LABEL_16;
LABEL_12:
  v6 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_lastUpdatedTimestamp != *((double *)v4 + 2))
      goto LABEL_16;
    v6 = 1;
  }
LABEL_17:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  double lastUpdatedTimestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  -[GEOPairedDeviceSubscriptionStatesSummary readAll:](self, "readAll:", 1);
  v3 = -[NSMutableDictionary hash](self->_subscriptionStates, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761 * self->_isUpdateAvailable;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    return v4 ^ v3 ^ v9;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_3:
  lastUpdatedTimestamp = self->_lastUpdatedTimestamp;
  v6 = -lastUpdatedTimestamp;
  if (lastUpdatedTimestamp >= 0.0)
    v6 = self->_lastUpdatedTimestamp;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  NSMutableDictionary *subscriptionStates;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  char v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  if (*((_QWORD *)v8 + 3))
  {
    subscriptionStates = self->_subscriptionStates;
    if (subscriptionStates)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](subscriptionStates, "addEntriesFromDictionary:");
    }
    else
    {
      v5 = (NSMutableDictionary *)objc_msgSend(*((id *)v8 + 3), "copy");
      v6 = self->_subscriptionStates;
      self->_subscriptionStates = v5;

    }
  }
  v7 = *((_BYTE *)v8 + 36);
  if ((v7 & 2) != 0)
  {
    self->_isUpdateAvailable = *((_BYTE *)v8 + 32);
    *(_BYTE *)&self->_flags |= 2u;
    v7 = *((_BYTE *)v8 + 36);
  }
  if ((v7 & 1) != 0)
  {
    self->_lastUpdatedTimestamp = *((double *)v8 + 2);
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
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPairedDeviceSubscriptionStatesSummary readAll:](self, "readAll:", 0);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NSMutableDictionary allValues](self->_subscriptionStates, "allValues", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionStates, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
