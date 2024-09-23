@implementation BMPBEntityRelationshipEvent

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

- (BOOL)hasRelationship
{
  return self->_relationship != 0;
}

- (BOOL)hasSourceId
{
  return self->_sourceId != 0;
}

- (BOOL)hasSourceEntity
{
  return self->_sourceEntity != 0;
}

- (BOOL)hasTargetEntity
{
  return self->_targetEntity != 0;
}

- (void)clearAttributes
{
  -[NSMutableArray removeAllObjects](self->_attributes, "removeAllObjects");
}

- (void)addAttributes:(id)a3
{
  id v4;
  NSMutableArray *attributes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  attributes = self->_attributes;
  v8 = v4;
  if (!attributes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_attributes;
    self->_attributes = v6;

    v4 = v8;
    attributes = self->_attributes;
  }
  -[NSMutableArray addObject:](attributes, "addObject:", v4);

}

- (unint64_t)attributesCount
{
  return -[NSMutableArray count](self->_attributes, "count");
}

- (id)attributesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_attributes, "objectAtIndex:", a3);
}

+ (Class)attributesType
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
  v8.super_class = (Class)BMPBEntityRelationshipEvent;
  -[BMPBEntityRelationshipEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBEntityRelationshipEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientId;
  NSString *relationship;
  NSString *sourceId;
  BMPBEntity *sourceEntity;
  void *v9;
  BMPBEntity *targetEntity;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientId = self->_clientId;
  if (clientId)
    objc_msgSend(v3, "setObject:forKey:", clientId, CFSTR("clientId"));
  relationship = self->_relationship;
  if (relationship)
    objc_msgSend(v4, "setObject:forKey:", relationship, CFSTR("relationship"));
  sourceId = self->_sourceId;
  if (sourceId)
    objc_msgSend(v4, "setObject:forKey:", sourceId, CFSTR("sourceId"));
  sourceEntity = self->_sourceEntity;
  if (sourceEntity)
  {
    -[BMPBEntity dictionaryRepresentation](sourceEntity, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("sourceEntity"));

  }
  targetEntity = self->_targetEntity;
  if (targetEntity)
  {
    -[BMPBEntity dictionaryRepresentation](targetEntity, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("targetEntity"));

  }
  if (-[NSMutableArray count](self->_attributes, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_attributes, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = self->_attributes;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v15);
    }

    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("attributes"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBEntityRelationshipEventReadFrom((char *)self, (uint64_t)a3);
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
  if (self->_clientId)
    PBDataWriterWriteStringField();
  if (self->_relationship)
    PBDataWriterWriteStringField();
  if (self->_sourceId)
    PBDataWriterWriteStringField();
  if (self->_sourceEntity)
    PBDataWriterWriteSubmessage();
  if (self->_targetEntity)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_attributes;
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
  if (self->_clientId)
    objc_msgSend(v8, "setClientId:");
  if (self->_relationship)
    objc_msgSend(v8, "setRelationship:");
  if (self->_sourceId)
    objc_msgSend(v8, "setSourceId:");
  if (self->_sourceEntity)
    objc_msgSend(v8, "setSourceEntity:");
  if (self->_targetEntity)
    objc_msgSend(v8, "setTargetEntity:");
  if (-[BMPBEntityRelationshipEvent attributesCount](self, "attributesCount"))
  {
    objc_msgSend(v8, "clearAttributes");
    v4 = -[BMPBEntityRelationshipEvent attributesCount](self, "attributesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[BMPBEntityRelationshipEvent attributesAtIndex:](self, "attributesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAttributes:", v7);

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
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_clientId, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_relationship, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_sourceId, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[BMPBEntity copyWithZone:](self->_sourceEntity, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[BMPBEntity copyWithZone:](self->_targetEntity, "copyWithZone:", a3);
  v15 = (void *)v5[6];
  v5[6] = v14;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_attributes;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend(v5, "addAttributes:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *clientId;
  NSString *relationship;
  NSString *sourceId;
  BMPBEntity *sourceEntity;
  BMPBEntity *targetEntity;
  NSMutableArray *attributes;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((clientId = self->_clientId, !((unint64_t)clientId | v4[2]))
     || -[NSString isEqual:](clientId, "isEqual:"))
    && ((relationship = self->_relationship, !((unint64_t)relationship | v4[3]))
     || -[NSString isEqual:](relationship, "isEqual:"))
    && ((sourceId = self->_sourceId, !((unint64_t)sourceId | v4[5]))
     || -[NSString isEqual:](sourceId, "isEqual:"))
    && ((sourceEntity = self->_sourceEntity, !((unint64_t)sourceEntity | v4[4]))
     || -[BMPBEntity isEqual:](sourceEntity, "isEqual:"))
    && ((targetEntity = self->_targetEntity, !((unint64_t)targetEntity | v4[6]))
     || -[BMPBEntity isEqual:](targetEntity, "isEqual:")))
  {
    attributes = self->_attributes;
    if ((unint64_t)attributes | v4[1])
      v11 = -[NSMutableArray isEqual:](attributes, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_clientId, "hash");
  v4 = -[NSString hash](self->_relationship, "hash") ^ v3;
  v5 = -[NSString hash](self->_sourceId, "hash");
  v6 = v4 ^ v5 ^ -[BMPBEntity hash](self->_sourceEntity, "hash");
  v7 = -[BMPBEntity hash](self->_targetEntity, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_attributes, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  BMPBEntity *sourceEntity;
  uint64_t v6;
  BMPBEntity *targetEntity;
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

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[BMPBEntityRelationshipEvent setClientId:](self, "setClientId:");
  if (*((_QWORD *)v4 + 3))
    -[BMPBEntityRelationshipEvent setRelationship:](self, "setRelationship:");
  if (*((_QWORD *)v4 + 5))
    -[BMPBEntityRelationshipEvent setSourceId:](self, "setSourceId:");
  sourceEntity = self->_sourceEntity;
  v6 = *((_QWORD *)v4 + 4);
  if (sourceEntity)
  {
    if (v6)
      -[BMPBEntity mergeFrom:](sourceEntity, "mergeFrom:");
  }
  else if (v6)
  {
    -[BMPBEntityRelationshipEvent setSourceEntity:](self, "setSourceEntity:");
  }
  targetEntity = self->_targetEntity;
  v8 = *((_QWORD *)v4 + 6);
  if (targetEntity)
  {
    if (v8)
      -[BMPBEntity mergeFrom:](targetEntity, "mergeFrom:");
  }
  else if (v8)
  {
    -[BMPBEntityRelationshipEvent setTargetEntity:](self, "setTargetEntity:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *((id *)v4 + 1);
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
        -[BMPBEntityRelationshipEvent addAttributes:](self, "addAttributes:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
  objc_storeStrong((id *)&self->_clientId, a3);
}

- (NSString)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(id)a3
{
  objc_storeStrong((id *)&self->_relationship, a3);
}

- (NSString)sourceId
{
  return self->_sourceId;
}

- (void)setSourceId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceId, a3);
}

- (BMPBEntity)sourceEntity
{
  return self->_sourceEntity;
}

- (void)setSourceEntity:(id)a3
{
  objc_storeStrong((id *)&self->_sourceEntity, a3);
}

- (BMPBEntity)targetEntity
{
  return self->_targetEntity;
}

- (void)setTargetEntity:(id)a3
{
  objc_storeStrong((id *)&self->_targetEntity, a3);
}

- (NSMutableArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetEntity, 0);
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_sourceEntity, 0);
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
