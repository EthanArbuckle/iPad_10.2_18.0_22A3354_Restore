@implementation NTPBURLMappingDomain

- (NSString)domain
{
  return self->_domain;
}

- (NSMutableArray)paths
{
  return self->_paths;
}

- (double)averageSafariVisitsPerDay
{
  return self->_averageSafariVisitsPerDay;
}

- (void)addPaths:(id)a3
{
  id v4;
  NSMutableArray *paths;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  paths = self->_paths;
  v8 = v4;
  if (!paths)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_paths;
    self->_paths = v6;

    v4 = v8;
    paths = self->_paths;
  }
  -[NSMutableArray addObject:](paths, "addObject:", v4);

}

- (void)clearPaths
{
  -[NSMutableArray removeAllObjects](self->_paths, "removeAllObjects");
}

- (unint64_t)pathsCount
{
  return -[NSMutableArray count](self->_paths, "count");
}

- (id)pathsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_paths, "objectAtIndex:", a3);
}

+ (Class)pathsType
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
  v8.super_class = (Class)NTPBURLMappingDomain;
  -[NTPBURLMappingDomain description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBURLMappingDomain dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *domain;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  domain = self->_domain;
  if (domain)
    objc_msgSend(v3, "setObject:forKey:", domain, CFSTR("domain"));
  if (-[NSMutableArray count](self->_paths, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_paths, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_paths;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("paths"));
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_averageSafariVisitsPerDay, (_QWORD)v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("average_safari_visits_per_day"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBURLMappingDomainReadFrom(self, (uint64_t)a3);
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_paths;
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

  PBDataWriterWriteDoubleField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_paths;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v5, "addPaths:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  *(double *)(v5 + 8) = self->_averageSafariVisitsPerDay;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *domain;
  NSMutableArray *paths;
  BOOL v7;

  v4 = a3;
  v7 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((domain = self->_domain, !((unint64_t)domain | *((_QWORD *)v4 + 2)))
     || -[NSString isEqual:](domain, "isEqual:"))
    && ((paths = self->_paths, !((unint64_t)paths | *((_QWORD *)v4 + 3)))
     || -[NSMutableArray isEqual:](paths, "isEqual:"))
    && self->_averageSafariVisitsPerDay == *((double *)v4 + 1);

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  double averageSafariVisitsPerDay;
  double v6;
  long double v7;
  double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v3 = -[NSString hash](self->_domain, "hash");
  v4 = -[NSMutableArray hash](self->_paths, "hash");
  averageSafariVisitsPerDay = self->_averageSafariVisitsPerDay;
  v6 = -averageSafariVisitsPerDay;
  if (averageSafariVisitsPerDay >= 0.0)
    v6 = self->_averageSafariVisitsPerDay;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = fmod(v7, 1.84467441e19);
  v10 = 2654435761u * (unint64_t)v9;
  v11 = v10 + (unint64_t)v8;
  if (v8 <= 0.0)
    v11 = 2654435761u * (unint64_t)v9;
  v12 = v10 - (unint64_t)fabs(v8);
  if (v8 >= 0.0)
    v12 = v11;
  return v4 ^ v3 ^ v12;
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[NTPBURLMappingDomain setDomain:](self, "setDomain:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 3);
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
        -[NTPBURLMappingDomain addPaths:](self, "addPaths:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  self->_averageSafariVisitsPerDay = *((double *)v4 + 1);
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (void)setPaths:(id)a3
{
  objc_storeStrong((id *)&self->_paths, a3);
}

- (void)setAverageSafariVisitsPerDay:(double)a3
{
  self->_averageSafariVisitsPerDay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
