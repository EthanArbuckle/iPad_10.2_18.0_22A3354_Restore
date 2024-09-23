@implementation ADLogAnalyticsRequest

+ (id)options
{
  if (options_once_0 != -1)
    dispatch_once(&options_once_0, &__block_literal_global_1);
  return (id)options_sOptions_0;
}

void __32__ADLogAnalyticsRequest_options__block_invoke()
{
  void *v0;

  v0 = (void *)options_sOptions_0;
  options_sOptions_0 = (uint64_t)&unk_1E82BEB88;

}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (BOOL)hasContentiAdID
{
  return self->_contentiAdID != 0;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (void)clearEvents
{
  -[NSMutableArray removeAllObjects](self->_events, "removeAllObjects");
}

- (void)addEvents:(id)a3
{
  id v4;
  NSMutableArray *events;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  events = self->_events;
  v8 = v4;
  if (!events)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_events;
    self->_events = v6;

    v4 = v8;
    events = self->_events;
  }
  -[NSMutableArray addObject:](events, "addObject:", v4);

}

- (unint64_t)eventsCount
{
  return -[NSMutableArray count](self->_events, "count");
}

- (id)eventsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_events, "objectAtIndex:", a3);
}

+ (Class)eventsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)ADLogAnalyticsRequest;
  -[ADLogAnalyticsRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADLogAnalyticsRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *iAdID;
  NSString *bundleID;
  NSData *contentiAdID;
  NSData *dPID;
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  iAdID = self->_iAdID;
  if (iAdID)
    objc_msgSend(v3, "setObject:forKey:", iAdID, CFSTR("iAdID"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v4, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  contentiAdID = self->_contentiAdID;
  if (contentiAdID)
    objc_msgSend(v4, "setObject:forKey:", contentiAdID, CFSTR("contentiAdID"));
  dPID = self->_dPID;
  if (dPID)
    objc_msgSend(v4, "setObject:forKey:", dPID, CFSTR("DPID"));
  if (-[NSMutableArray count](self->_events, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_events, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_events;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("events"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ADLogAnalyticsRequestReadFrom((char *)self, (uint64_t)a3);
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
  if (self->_iAdID)
    PBDataWriterWriteDataField();
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  if (self->_contentiAdID)
    PBDataWriterWriteDataField();
  if (self->_dPID)
    PBDataWriterWriteDataField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_events;
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

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_iAdID)
    objc_msgSend(v8, "setIAdID:");
  if (self->_bundleID)
    objc_msgSend(v8, "setBundleID:");
  if (self->_contentiAdID)
    objc_msgSend(v8, "setContentiAdID:");
  if (self->_dPID)
    objc_msgSend(v8, "setDPID:");
  if (-[ADLogAnalyticsRequest eventsCount](self, "eventsCount"))
  {
    objc_msgSend(v8, "clearEvents");
    v4 = -[ADLogAnalyticsRequest eventsCount](self, "eventsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ADLogAnalyticsRequest eventsAtIndex:](self, "eventsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addEvents:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_iAdID, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  v8 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSData copyWithZone:](self->_contentiAdID, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSData copyWithZone:](self->_dPID, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_events;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend(v5, "addEvents:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *iAdID;
  NSString *bundleID;
  NSData *contentiAdID;
  NSData *dPID;
  NSMutableArray *events;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((iAdID = self->_iAdID, !((unint64_t)iAdID | v4[5])) || -[NSData isEqual:](iAdID, "isEqual:"))&& ((bundleID = self->_bundleID, !((unint64_t)bundleID | v4[1]))|| -[NSString isEqual:](bundleID, "isEqual:"))&& ((contentiAdID = self->_contentiAdID, !((unint64_t)contentiAdID | v4[2]))|| -[NSData isEqual:](contentiAdID, "isEqual:"))&& ((dPID = self->_dPID, !((unint64_t)dPID | v4[3])) || -[NSData isEqual:](dPID, "isEqual:")))
  {
    events = self->_events;
    if ((unint64_t)events | v4[4])
      v10 = -[NSMutableArray isEqual:](events, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSData hash](self->_iAdID, "hash");
  v4 = -[NSString hash](self->_bundleID, "hash") ^ v3;
  v5 = -[NSData hash](self->_contentiAdID, "hash");
  v6 = v4 ^ v5 ^ -[NSData hash](self->_dPID, "hash");
  return v6 ^ -[NSMutableArray hash](self->_events, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 5))
    -[ADLogAnalyticsRequest setIAdID:](self, "setIAdID:");
  if (*((_QWORD *)v4 + 1))
    -[ADLogAnalyticsRequest setBundleID:](self, "setBundleID:");
  if (*((_QWORD *)v4 + 2))
    -[ADLogAnalyticsRequest setContentiAdID:](self, "setContentiAdID:");
  if (*((_QWORD *)v4 + 3))
    -[ADLogAnalyticsRequest setDPID:](self, "setDPID:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[ADLogAnalyticsRequest addEvents:](self, "addEvents:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
  objc_storeStrong((id *)&self->_iAdID, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSData)contentiAdID
{
  return self->_contentiAdID;
}

- (void)setContentiAdID:(id)a3
{
  objc_storeStrong((id *)&self->_contentiAdID, a3);
}

- (NSData)dPID
{
  return self->_dPID;
}

- (void)setDPID:(id)a3
{
  objc_storeStrong((id *)&self->_dPID, a3);
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
  objc_storeStrong((id *)&self->_contentiAdID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
