@implementation _MRDiscoveryUpdateEndpointsProtobufMessage

- (void)clearEndpoints
{
  -[NSMutableArray removeAllObjects](self->_endpoints, "removeAllObjects");
}

- (void)addEndpoints:(id)a3
{
  id v4;
  NSMutableArray *endpoints;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  endpoints = self->_endpoints;
  v8 = v4;
  if (!endpoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_endpoints;
    self->_endpoints = v6;

    v4 = v8;
    endpoints = self->_endpoints;
  }
  -[NSMutableArray addObject:](endpoints, "addObject:", v4);

}

- (unint64_t)endpointsCount
{
  return -[NSMutableArray count](self->_endpoints, "count");
}

- (id)endpointsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_endpoints, "objectAtIndex:", a3);
}

+ (Class)endpointsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasConfiguration
{
  return self->_configuration != 0;
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
  v8.super_class = (Class)_MRDiscoveryUpdateEndpointsProtobufMessage;
  -[_MRDiscoveryUpdateEndpointsProtobufMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRDiscoveryUpdateEndpointsProtobufMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _MRDiscoverySessionConfigurationProtobuf *configuration;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_endpoints, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_endpoints, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_endpoints;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("endpoints"));
  }
  configuration = self->_configuration;
  if (configuration)
  {
    -[_MRDiscoverySessionConfigurationProtobuf dictionaryRepresentation](configuration, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("configuration"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRDiscoveryUpdateEndpointsProtobufMessageReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  v5 = self->_endpoints;
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

  if (self->_configuration)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (-[_MRDiscoveryUpdateEndpointsProtobufMessage endpointsCount](self, "endpointsCount"))
  {
    objc_msgSend(v8, "clearEndpoints");
    v4 = -[_MRDiscoveryUpdateEndpointsProtobufMessage endpointsCount](self, "endpointsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[_MRDiscoveryUpdateEndpointsProtobufMessage endpointsAtIndex:](self, "endpointsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addEndpoints:", v7);

      }
    }
  }
  if (self->_configuration)
    objc_msgSend(v8, "setConfiguration:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_endpoints;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v5, "addEndpoints:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v12 = -[_MRDiscoverySessionConfigurationProtobuf copyWithZone:](self->_configuration, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *endpoints;
  _MRDiscoverySessionConfigurationProtobuf *configuration;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((endpoints = self->_endpoints, !((unint64_t)endpoints | v4[2]))
     || -[NSMutableArray isEqual:](endpoints, "isEqual:")))
  {
    configuration = self->_configuration;
    if ((unint64_t)configuration | v4[1])
      v7 = -[_MRDiscoverySessionConfigurationProtobuf isEqual:](configuration, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSMutableArray hash](self->_endpoints, "hash");
  return -[_MRDiscoverySessionConfigurationProtobuf hash](self->_configuration, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _MRDiscoverySessionConfigurationProtobuf *configuration;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4[2];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[_MRDiscoveryUpdateEndpointsProtobufMessage addEndpoints:](self, "addEndpoints:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  configuration = self->_configuration;
  v11 = v4[1];
  if (configuration)
  {
    if (v11)
      -[_MRDiscoverySessionConfigurationProtobuf mergeFrom:](configuration, "mergeFrom:");
  }
  else if (v11)
  {
    -[_MRDiscoveryUpdateEndpointsProtobufMessage setConfiguration:](self, "setConfiguration:");
  }

}

- (NSMutableArray)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(id)a3
{
  objc_storeStrong((id *)&self->_endpoints, a3);
}

- (_MRDiscoverySessionConfigurationProtobuf)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
