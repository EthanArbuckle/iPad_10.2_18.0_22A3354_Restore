@implementation GEORoutingFeatures

- (NSMutableArray)routingFeaturesInfos
{
  return self->_routingFeaturesInfos;
}

- (void)setRoutingFeaturesInfos:(id)a3
{
  objc_storeStrong((id *)&self->_routingFeaturesInfos, a3);
}

- (void)clearRoutingFeaturesInfos
{
  -[NSMutableArray removeAllObjects](self->_routingFeaturesInfos, "removeAllObjects");
}

- (void)addRoutingFeaturesInfo:(id)a3
{
  id v4;
  NSMutableArray *routingFeaturesInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  routingFeaturesInfos = self->_routingFeaturesInfos;
  v8 = v4;
  if (!routingFeaturesInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_routingFeaturesInfos;
    self->_routingFeaturesInfos = v6;

    v4 = v8;
    routingFeaturesInfos = self->_routingFeaturesInfos;
  }
  -[NSMutableArray addObject:](routingFeaturesInfos, "addObject:", v4);

}

- (unint64_t)routingFeaturesInfosCount
{
  return -[NSMutableArray count](self->_routingFeaturesInfos, "count");
}

- (id)routingFeaturesInfoAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_routingFeaturesInfos, "objectAtIndex:", a3);
}

+ (Class)routingFeaturesInfoType
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
  v8.super_class = (Class)GEORoutingFeatures;
  -[GEORoutingFeatures description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORoutingFeatures dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORoutingFeatures _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[1], "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[1], "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = a1[1];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12, (_QWORD)v15);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("routingFeaturesInfo");
    else
      v13 = CFSTR("routing_features_info");
    objc_msgSend(v4, "setObject:forKey:", v5, v13, (_QWORD)v15);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORoutingFeatures _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEORoutingFeatures)initWithDictionary:(id)a3
{
  return (GEORoutingFeatures *)-[GEORoutingFeatures _initWithDictionary:isJSON:](self, a3, 0);
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
  GEORoutingFeaturesInfo *v14;
  uint64_t v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("routingFeaturesInfo");
      else
        v6 = CFSTR("routing_features_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v5;
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v20 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEORoutingFeaturesInfo alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEORoutingFeaturesInfo initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEORoutingFeaturesInfo initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addRoutingFeaturesInfo:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v10);
        }

        v5 = v18;
      }

    }
  }

  return a1;
}

- (GEORoutingFeatures)initWithJSON:(id)a3
{
  return (GEORoutingFeatures *)-[GEORoutingFeatures _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORoutingFeaturesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORoutingFeaturesReadAllFrom(self, a3, 0);
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_routingFeaturesInfos;
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
  -[GEORoutingFeatures readAll:](self, "readAll:", 0);
  if (-[GEORoutingFeatures routingFeaturesInfosCount](self, "routingFeaturesInfosCount"))
  {
    objc_msgSend(v8, "clearRoutingFeaturesInfos");
    v4 = -[GEORoutingFeatures routingFeaturesInfosCount](self, "routingFeaturesInfosCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORoutingFeatures routingFeaturesInfoAtIndex:](self, "routingFeaturesInfoAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addRoutingFeaturesInfo:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_routingFeaturesInfos;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v13);
        objc_msgSend(v5, "addRoutingFeaturesInfo:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  NSMutableArray *routingFeaturesInfos;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEORoutingFeatures readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    routingFeaturesInfos = self->_routingFeaturesInfos;
    if ((unint64_t)routingFeaturesInfos | v4[1])
      v5 = -[NSMutableArray isEqual:](routingFeaturesInfos, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEORoutingFeatures readAll:](self, "readAll:", 1);
  return -[NSMutableArray hash](self->_routingFeaturesInfos, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
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
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4[1];
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
        -[GEORoutingFeatures addRoutingFeaturesInfo:](self, "addRoutingFeaturesInfo:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingFeaturesInfos, 0);
}

@end
