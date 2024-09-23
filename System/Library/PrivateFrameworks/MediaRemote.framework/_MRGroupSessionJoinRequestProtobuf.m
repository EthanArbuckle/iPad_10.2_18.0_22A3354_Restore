@implementation _MRGroupSessionJoinRequestProtobuf

- (BOOL)hasIdentity
{
  return self->_identity != 0;
}

- (void)clearOobKeys
{
  -[NSMutableArray removeAllObjects](self->_oobKeys, "removeAllObjects");
}

- (void)addOobKeys:(id)a3
{
  id v4;
  NSMutableArray *oobKeys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  oobKeys = self->_oobKeys;
  v8 = v4;
  if (!oobKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_oobKeys;
    self->_oobKeys = v6;

    v4 = v8;
    oobKeys = self->_oobKeys;
  }
  -[NSMutableArray addObject:](oobKeys, "addObject:", v4);

}

- (unint64_t)oobKeysCount
{
  return -[NSMutableArray count](self->_oobKeys, "count");
}

- (id)oobKeysAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_oobKeys, "objectAtIndex:", a3);
}

+ (Class)oobKeysType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
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
  v8.super_class = (Class)_MRGroupSessionJoinRequestProtobuf;
  -[_MRGroupSessionJoinRequestProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionJoinRequestProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRUserIdentityProtobuf *identity;
  void *v5;
  NSMutableArray *oobKeys;
  NSString *identifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  identity = self->_identity;
  if (identity)
  {
    -[_MRUserIdentityProtobuf dictionaryRepresentation](identity, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("identity"));

  }
  oobKeys = self->_oobKeys;
  if (oobKeys)
    objc_msgSend(v3, "setObject:forKey:", oobKeys, CFSTR("oobKeys"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionJoinRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_identity)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_oobKeys;
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

  if (self->_identifier)
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
  if (self->_identity)
    objc_msgSend(v8, "setIdentity:");
  if (-[_MRGroupSessionJoinRequestProtobuf oobKeysCount](self, "oobKeysCount"))
  {
    objc_msgSend(v8, "clearOobKeys");
    v4 = -[_MRGroupSessionJoinRequestProtobuf oobKeysCount](self, "oobKeysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[_MRGroupSessionJoinRequestProtobuf oobKeysAtIndex:](self, "oobKeysAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addOobKeys:", v7);

      }
    }
  }
  if (self->_identifier)
    objc_msgSend(v8, "setIdentifier:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRUserIdentityProtobuf copyWithZone:](self->_identity, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_oobKeys;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addOobKeys:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRUserIdentityProtobuf *identity;
  NSMutableArray *oobKeys;
  NSString *identifier;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((identity = self->_identity, !((unint64_t)identity | v4[2]))
     || -[_MRUserIdentityProtobuf isEqual:](identity, "isEqual:"))
    && ((oobKeys = self->_oobKeys, !((unint64_t)oobKeys | v4[3]))
     || -[NSMutableArray isEqual:](oobKeys, "isEqual:")))
  {
    identifier = self->_identifier;
    if ((unint64_t)identifier | v4[1])
      v8 = -[NSString isEqual:](identifier, "isEqual:");
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
  unint64_t v3;
  uint64_t v4;

  v3 = -[_MRUserIdentityProtobuf hash](self->_identity, "hash");
  v4 = -[NSMutableArray hash](self->_oobKeys, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_identifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _MRUserIdentityProtobuf *identity;
  uint64_t v6;
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
  identity = self->_identity;
  v6 = *((_QWORD *)v4 + 2);
  if (identity)
  {
    if (v6)
      -[_MRUserIdentityProtobuf mergeFrom:](identity, "mergeFrom:");
  }
  else if (v6)
  {
    -[_MRGroupSessionJoinRequestProtobuf setIdentity:](self, "setIdentity:");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 3);
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
        -[_MRGroupSessionJoinRequestProtobuf addOobKeys:](self, "addOobKeys:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 1))
    -[_MRGroupSessionJoinRequestProtobuf setIdentifier:](self, "setIdentifier:");

}

- (_MRUserIdentityProtobuf)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (NSMutableArray)oobKeys
{
  return self->_oobKeys;
}

- (void)setOobKeys:(id)a3
{
  objc_storeStrong((id *)&self->_oobKeys, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oobKeys, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
