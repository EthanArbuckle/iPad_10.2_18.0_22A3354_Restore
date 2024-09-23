@implementation _MRRemoveOutputDevicesMessageProtobuf

- (void)clearOutputDeviceUIDs
{
  -[NSMutableArray removeAllObjects](self->_outputDeviceUIDs, "removeAllObjects");
}

- (void)addOutputDeviceUIDs:(id)a3
{
  id v4;
  NSMutableArray *outputDeviceUIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  outputDeviceUIDs = self->_outputDeviceUIDs;
  v8 = v4;
  if (!outputDeviceUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_outputDeviceUIDs;
    self->_outputDeviceUIDs = v6;

    v4 = v8;
    outputDeviceUIDs = self->_outputDeviceUIDs;
  }
  -[NSMutableArray addObject:](outputDeviceUIDs, "addObject:", v4);

}

- (unint64_t)outputDeviceUIDsCount
{
  return -[NSMutableArray count](self->_outputDeviceUIDs, "count");
}

- (id)outputDeviceUIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_outputDeviceUIDs, "objectAtIndex:", a3);
}

+ (Class)outputDeviceUIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasEndpointUID
{
  return self->_endpointUID != 0;
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
  v8.super_class = (Class)_MRRemoveOutputDevicesMessageProtobuf;
  -[_MRRemoveOutputDevicesMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRRemoveOutputDevicesMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *outputDeviceUIDs;
  NSString *endpointUID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  outputDeviceUIDs = self->_outputDeviceUIDs;
  if (outputDeviceUIDs)
    objc_msgSend(v3, "setObject:forKey:", outputDeviceUIDs, CFSTR("outputDeviceUIDs"));
  endpointUID = self->_endpointUID;
  if (endpointUID)
    objc_msgSend(v4, "setObject:forKey:", endpointUID, CFSTR("endpointUID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRemoveOutputDevicesMessageProtobufReadFrom(self, (uint64_t)a3);
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
  v5 = self->_outputDeviceUIDs;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_endpointUID)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (-[_MRRemoveOutputDevicesMessageProtobuf outputDeviceUIDsCount](self, "outputDeviceUIDsCount"))
  {
    objc_msgSend(v8, "clearOutputDeviceUIDs");
    v4 = -[_MRRemoveOutputDevicesMessageProtobuf outputDeviceUIDsCount](self, "outputDeviceUIDsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[_MRRemoveOutputDevicesMessageProtobuf outputDeviceUIDsAtIndex:](self, "outputDeviceUIDsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addOutputDeviceUIDs:", v7);

      }
    }
  }
  if (self->_endpointUID)
    objc_msgSend(v8, "setEndpointUID:");

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
  v6 = self->_outputDeviceUIDs;
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
        objc_msgSend(v5, "addOutputDeviceUIDs:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v12 = -[NSString copyWithZone:](self->_endpointUID, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *outputDeviceUIDs;
  NSString *endpointUID;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((outputDeviceUIDs = self->_outputDeviceUIDs, !((unint64_t)outputDeviceUIDs | v4[2]))
     || -[NSMutableArray isEqual:](outputDeviceUIDs, "isEqual:")))
  {
    endpointUID = self->_endpointUID;
    if ((unint64_t)endpointUID | v4[1])
      v7 = -[NSString isEqual:](endpointUID, "isEqual:");
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

  v3 = -[NSMutableArray hash](self->_outputDeviceUIDs, "hash");
  return -[NSString hash](self->_endpointUID, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id *v4;
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
  v4 = (id *)a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4[2];
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
        -[_MRRemoveOutputDevicesMessageProtobuf addOutputDeviceUIDs:](self, "addOutputDeviceUIDs:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (v4[1])
    -[_MRRemoveOutputDevicesMessageProtobuf setEndpointUID:](self, "setEndpointUID:");

}

- (NSMutableArray)outputDeviceUIDs
{
  return self->_outputDeviceUIDs;
}

- (void)setOutputDeviceUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceUIDs, a3);
}

- (NSString)endpointUID
{
  return self->_endpointUID;
}

- (void)setEndpointUID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_endpointUID, 0);
}

@end
