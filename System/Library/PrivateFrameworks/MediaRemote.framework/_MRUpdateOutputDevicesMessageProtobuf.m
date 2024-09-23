@implementation _MRUpdateOutputDevicesMessageProtobuf

- (void)clearOutputDevices
{
  -[NSMutableArray removeAllObjects](self->_outputDevices, "removeAllObjects");
}

- (void)addOutputDevices:(id)a3
{
  id v4;
  NSMutableArray *outputDevices;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  outputDevices = self->_outputDevices;
  v8 = v4;
  if (!outputDevices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_outputDevices;
    self->_outputDevices = v6;

    v4 = v8;
    outputDevices = self->_outputDevices;
  }
  -[NSMutableArray addObject:](outputDevices, "addObject:", v4);

}

- (unint64_t)outputDevicesCount
{
  return -[NSMutableArray count](self->_outputDevices, "count");
}

- (id)outputDevicesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_outputDevices, "objectAtIndex:", a3);
}

+ (Class)outputDevicesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasEndpointUID
{
  return self->_endpointUID != 0;
}

- (void)clearClusterAwareOutputDevices
{
  -[NSMutableArray removeAllObjects](self->_clusterAwareOutputDevices, "removeAllObjects");
}

- (void)addClusterAwareOutputDevices:(id)a3
{
  id v4;
  NSMutableArray *clusterAwareOutputDevices;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  clusterAwareOutputDevices = self->_clusterAwareOutputDevices;
  v8 = v4;
  if (!clusterAwareOutputDevices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_clusterAwareOutputDevices;
    self->_clusterAwareOutputDevices = v6;

    v4 = v8;
    clusterAwareOutputDevices = self->_clusterAwareOutputDevices;
  }
  -[NSMutableArray addObject:](clusterAwareOutputDevices, "addObject:", v4);

}

- (unint64_t)clusterAwareOutputDevicesCount
{
  return -[NSMutableArray count](self->_clusterAwareOutputDevices, "count");
}

- (id)clusterAwareOutputDevicesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_clusterAwareOutputDevices, "objectAtIndex:", a3);
}

+ (Class)clusterAwareOutputDevicesType
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
  v8.super_class = (Class)_MRUpdateOutputDevicesMessageProtobuf;
  -[_MRUpdateOutputDevicesMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRUpdateOutputDevicesMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *endpointUID;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_outputDevices, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_outputDevices, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v5 = self->_outputDevices;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("outputDevices"));
  }
  endpointUID = self->_endpointUID;
  if (endpointUID)
    objc_msgSend(v3, "setObject:forKey:", endpointUID, CFSTR("endpointUID"));
  if (-[NSMutableArray count](self->_clusterAwareOutputDevices, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_clusterAwareOutputDevices, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = self->_clusterAwareOutputDevices;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("clusterAwareOutputDevices"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRUpdateOutputDevicesMessageProtobufReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_outputDevices;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (self->_endpointUID)
    PBDataWriterWriteStringField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_clusterAwareOutputDevices;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id v12;

  v12 = a3;
  if (-[_MRUpdateOutputDevicesMessageProtobuf outputDevicesCount](self, "outputDevicesCount"))
  {
    objc_msgSend(v12, "clearOutputDevices");
    v4 = -[_MRUpdateOutputDevicesMessageProtobuf outputDevicesCount](self, "outputDevicesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[_MRUpdateOutputDevicesMessageProtobuf outputDevicesAtIndex:](self, "outputDevicesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addOutputDevices:", v7);

      }
    }
  }
  if (self->_endpointUID)
    objc_msgSend(v12, "setEndpointUID:");
  if (-[_MRUpdateOutputDevicesMessageProtobuf clusterAwareOutputDevicesCount](self, "clusterAwareOutputDevicesCount"))
  {
    objc_msgSend(v12, "clearClusterAwareOutputDevices");
    v8 = -[_MRUpdateOutputDevicesMessageProtobuf clusterAwareOutputDevicesCount](self, "clusterAwareOutputDevicesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[_MRUpdateOutputDevicesMessageProtobuf clusterAwareOutputDevicesAtIndex:](self, "clusterAwareOutputDevicesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addClusterAwareOutputDevices:", v11);

      }
    }
  }

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
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = self->_outputDevices;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addOutputDevices:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  v12 = -[NSString copyWithZone:](self->_endpointUID, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_clusterAwareOutputDevices;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
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
        objc_msgSend(v5, "addClusterAwareOutputDevices:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *outputDevices;
  NSString *endpointUID;
  NSMutableArray *clusterAwareOutputDevices;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((outputDevices = self->_outputDevices, !((unint64_t)outputDevices | v4[3]))
     || -[NSMutableArray isEqual:](outputDevices, "isEqual:"))
    && ((endpointUID = self->_endpointUID, !((unint64_t)endpointUID | v4[2]))
     || -[NSString isEqual:](endpointUID, "isEqual:")))
  {
    clusterAwareOutputDevices = self->_clusterAwareOutputDevices;
    if ((unint64_t)clusterAwareOutputDevices | v4[1])
      v8 = -[NSMutableArray isEqual:](clusterAwareOutputDevices, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[NSMutableArray hash](self->_outputDevices, "hash");
  v4 = -[NSString hash](self->_endpointUID, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_clusterAwareOutputDevices, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v4[3];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[_MRUpdateOutputDevicesMessageProtobuf addOutputDevices:](self, "addOutputDevices:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (v4[2])
    -[_MRUpdateOutputDevicesMessageProtobuf setEndpointUID:](self, "setEndpointUID:");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v4[1];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[_MRUpdateOutputDevicesMessageProtobuf addClusterAwareOutputDevices:](self, "addClusterAwareOutputDevices:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (NSMutableArray)outputDevices
{
  return self->_outputDevices;
}

- (void)setOutputDevices:(id)a3
{
  objc_storeStrong((id *)&self->_outputDevices, a3);
}

- (NSString)endpointUID
{
  return self->_endpointUID;
}

- (void)setEndpointUID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointUID, a3);
}

- (NSMutableArray)clusterAwareOutputDevices
{
  return self->_clusterAwareOutputDevices;
}

- (void)setClusterAwareOutputDevices:(id)a3
{
  objc_storeStrong((id *)&self->_clusterAwareOutputDevices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_endpointUID, 0);
  objc_storeStrong((id *)&self->_clusterAwareOutputDevices, 0);
}

@end
