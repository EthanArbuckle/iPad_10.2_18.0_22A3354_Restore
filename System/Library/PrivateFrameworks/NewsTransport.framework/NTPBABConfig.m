@implementation NTPBABConfig

- (void)setPopulationFloor:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_populationFloor = a3;
}

- (void)setHasPopulationFloor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPopulationFloor
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPopulationCeiling:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_populationCeiling = a3;
}

- (void)setHasPopulationCeiling:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPopulationCeiling
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasConfigControl
{
  return self->_configControl != 0;
}

- (void)clearConfigBuckets
{
  -[NSMutableArray removeAllObjects](self->_configBuckets, "removeAllObjects");
}

- (void)addConfigBuckets:(id)a3
{
  id v4;
  NSMutableArray *configBuckets;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  configBuckets = self->_configBuckets;
  v8 = v4;
  if (!configBuckets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_configBuckets;
    self->_configBuckets = v6;

    v4 = v8;
    configBuckets = self->_configBuckets;
  }
  -[NSMutableArray addObject:](configBuckets, "addObject:", v4);

}

- (unint64_t)configBucketsCount
{
  return -[NSMutableArray count](self->_configBuckets, "count");
}

- (id)configBucketsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_configBuckets, "objectAtIndex:", a3);
}

+ (Class)configBucketsType
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBABConfig;
  -[NTPBABConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBABConfig dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NTPBConfig *configControl;
  void *v8;
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

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_populationFloor);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("population_floor"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_populationCeiling);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("population_ceiling"));

  }
  configControl = self->_configControl;
  if (configControl)
  {
    -[NTPBConfig dictionaryRepresentation](configControl, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("config_control"));

  }
  if (-[NSMutableArray count](self->_configBuckets, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_configBuckets, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_configBuckets;
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

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("config_buckets"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBABConfigReadFrom((uint64_t)self, (uint64_t)a3);
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

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_configControl)
    PBDataWriterWriteSubmessage();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_configBuckets;
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
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

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_populationFloor;
    *(_BYTE *)(v5 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_populationCeiling;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v8 = -[NTPBConfig copyWithZone:](self->_configControl, "copyWithZone:", a3);
  v9 = (void *)v6[4];
  v6[4] = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_configBuckets;
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
        objc_msgSend(v6, "addConfigBuckets:", v15);

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
  NTPBConfig *configControl;
  NSMutableArray *configBuckets;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_populationFloor != *((_QWORD *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_populationCeiling != *((_QWORD *)v4 + 1))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_16;
  }
  configControl = self->_configControl;
  if ((unint64_t)configControl | *((_QWORD *)v4 + 4) && !-[NTPBConfig isEqual:](configControl, "isEqual:"))
    goto LABEL_16;
  configBuckets = self->_configBuckets;
  if ((unint64_t)configBuckets | *((_QWORD *)v4 + 3))
    v7 = -[NSMutableArray isEqual:](configBuckets, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_populationFloor;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_populationCeiling;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NTPBConfig hash](self->_configControl, "hash");
  return v5 ^ -[NSMutableArray hash](self->_configBuckets, "hash");
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;
  int64_t *v5;
  char v6;
  NTPBConfig *configControl;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (int64_t *)a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 40);
  if ((v6 & 2) != 0)
  {
    self->_populationFloor = v4[2];
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 40);
  }
  if ((v6 & 1) != 0)
  {
    self->_populationCeiling = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  configControl = self->_configControl;
  v8 = v5[4];
  if (configControl)
  {
    if (v8)
      -[NTPBConfig mergeFrom:](configControl, "mergeFrom:");
  }
  else if (v8)
  {
    -[NTPBABConfig setConfigControl:](self, "setConfigControl:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = (id)v5[3];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[NTPBABConfig addConfigBuckets:](self, "addConfigBuckets:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (int64_t)populationFloor
{
  return self->_populationFloor;
}

- (int64_t)populationCeiling
{
  return self->_populationCeiling;
}

- (NTPBConfig)configControl
{
  return self->_configControl;
}

- (void)setConfigControl:(id)a3
{
  objc_storeStrong((id *)&self->_configControl, a3);
}

- (NSMutableArray)configBuckets
{
  return self->_configBuckets;
}

- (void)setConfigBuckets:(id)a3
{
  objc_storeStrong((id *)&self->_configBuckets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configControl, 0);
  objc_storeStrong((id *)&self->_configBuckets, 0);
}

@end
