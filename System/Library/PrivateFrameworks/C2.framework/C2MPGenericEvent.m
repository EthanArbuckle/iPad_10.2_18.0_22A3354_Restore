@implementation C2MPGenericEvent

- (void)addMetric:(id)a3
{
  id v4;
  NSMutableArray *metrics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  metrics = self->_metrics;
  v8 = v4;
  if (!metrics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_metrics;
    self->_metrics = v6;

    v4 = v8;
    metrics = self->_metrics;
  }
  -[NSMutableArray addObject:](metrics, "addObject:", v4);

}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setTimestampStart:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestampStart = a3;
}

- (void)setTimestampEnd:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestampEnd = a3;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (a3 > 200)
  {
    if (a3 == 201)
      return CFSTR("cloudkit_client");
    if (a3 == 301)
      return CFSTR("server");
    goto LABEL_10;
  }
  if (!a3)
    return CFSTR("none");
  if (a3 != 101)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("cloudkit");
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("none")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cloudkit")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cloudkit_client")) & 1) != 0)
  {
    v4 = 201;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("server")))
  {
    v4 = 301;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setHasTimestampStart:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestampStart
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTimestampEnd:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampEnd
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearMetrics
{
  -[NSMutableArray removeAllObjects](self->_metrics, "removeAllObjects");
}

- (unint64_t)metricsCount
{
  return -[NSMutableArray count](self->_metrics, "count");
}

- (id)metricAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_metrics, "objectAtIndex:", a3);
}

+ (Class)metricType
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
  v8.super_class = (Class)C2MPGenericEvent;
  -[C2MPGenericEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPGenericEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int type;
  __CFString *v5;
  NSString *name;
  char has;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    type = self->_type;
    if (type > 200)
    {
      if (type == 201)
      {
        v5 = CFSTR("cloudkit_client");
        goto LABEL_12;
      }
      if (type == 301)
      {
        v5 = CFSTR("server");
        goto LABEL_12;
      }
    }
    else
    {
      if (!type)
      {
        v5 = CFSTR("none");
        goto LABEL_12;
      }
      if (type == 101)
      {
        v5 = CFSTR("cloudkit");
LABEL_12:
        objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

        goto LABEL_13;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_13:
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestampStart);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("timestamp_start"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestampEnd);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timestamp_end"));

  }
  if (-[NSMutableArray count](self->_metrics, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_metrics, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = self->_metrics;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("metric"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return C2MPGenericEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_name)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_metrics;
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
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _DWORD *v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[10] = self->_type;
    *((_BYTE *)v4 + 44) |= 4u;
  }
  v10 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_timestampStart;
    *((_BYTE *)v4 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_timestampEnd;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  if (-[C2MPGenericEvent metricsCount](self, "metricsCount"))
  {
    objc_msgSend(v10, "clearMetrics");
    v6 = -[C2MPGenericEvent metricsCount](self, "metricsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[C2MPGenericEvent metricAtIndex:](self, "metricAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addMetric:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
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
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_type;
    *(_BYTE *)(v5 + 44) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_timestampStart;
    *(_BYTE *)(v6 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_timestampEnd;
    *(_BYTE *)(v6 + 44) |= 1u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_metrics;
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
        objc_msgSend((id)v6, "addMetric:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *name;
  NSMutableArray *metrics;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_type != *((_DWORD *)v4 + 10))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_22;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
    {
LABEL_22:
      v8 = 0;
      goto LABEL_23;
    }
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_timestampStart != *((_QWORD *)v4 + 2))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_22;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_timestampEnd != *((_QWORD *)v4 + 1))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_22;
  }
  metrics = self->_metrics;
  if ((unint64_t)metrics | *((_QWORD *)v4 + 3))
    v8 = -[NSMutableArray isEqual:](metrics, "isEqual:");
  else
    v8 = 1;
LABEL_23:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761u * self->_timestampStart;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[NSMutableArray hash](self->_metrics, "hash");
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761u * self->_timestampEnd;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSMutableArray hash](self->_metrics, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  char v6;
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
  v4 = a3;
  v5 = v4;
  if ((v4[11] & 4) != 0)
  {
    self->_type = v4[10];
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 4))
    -[C2MPGenericEvent setName:](self, "setName:");
  v6 = *((_BYTE *)v5 + 44);
  if ((v6 & 2) != 0)
  {
    self->_timestampStart = *((_QWORD *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v5 + 44);
  }
  if ((v6 & 1) != 0)
  {
    self->_timestampEnd = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v5 + 3);
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
        -[C2MPGenericEvent addMetric:](self, "addMetric:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)timestampStart
{
  return self->_timestampStart;
}

- (unint64_t)timestampEnd
{
  return self->_timestampEnd;
}

- (NSMutableArray)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

@end
