@implementation ACProtobufAccountCredential

- (void)setCredentialItemsDictionary:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[ACProtobufAccountCredential clearCredentialItems](self, "clearCredentialItems");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__ACProtobufAccountCredential_Helpers__setCredentialItemsDictionary___block_invoke;
  v5[3] = &unk_1E4893CD8;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __69__ACProtobufAccountCredential_Helpers__setCredentialItemsDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ACProtobufKeyValuePair *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[ACProtobufKeyValuePair initWithValue:forKey:]([ACProtobufKeyValuePair alloc], "initWithValue:forKey:", v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "addCredentialItems:", v7);
}

- (NSDictionary)credentialItemsDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[ACProtobufAccountCredential credentialItemsCount](self, "credentialItemsCount"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ACProtobufAccountCredential credentialItems](self, "credentialItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "key");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (void)clearCredentialItems
{
  -[NSMutableArray removeAllObjects](self->_credentialItems, "removeAllObjects");
}

- (void)addCredentialItems:(id)a3
{
  id v4;
  NSMutableArray *credentialItems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  credentialItems = self->_credentialItems;
  v8 = v4;
  if (!credentialItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_credentialItems;
    self->_credentialItems = v6;

    v4 = v8;
    credentialItems = self->_credentialItems;
  }
  -[NSMutableArray addObject:](credentialItems, "addObject:", v4);

}

- (unint64_t)credentialItemsCount
{
  return -[NSMutableArray count](self->_credentialItems, "count");
}

- (id)credentialItemsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_credentialItems, "objectAtIndex:", a3);
}

+ (Class)credentialItemsType
{
  return (Class)objc_opt_class();
}

- (void)clearDirtyProperties
{
  -[NSMutableArray removeAllObjects](self->_dirtyProperties, "removeAllObjects");
}

- (void)addDirtyProperties:(id)a3
{
  id v4;
  NSMutableArray *dirtyProperties;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dirtyProperties = self->_dirtyProperties;
  v8 = v4;
  if (!dirtyProperties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dirtyProperties;
    self->_dirtyProperties = v6;

    v4 = v8;
    dirtyProperties = self->_dirtyProperties;
  }
  -[NSMutableArray addObject:](dirtyProperties, "addObject:", v4);

}

- (unint64_t)dirtyPropertiesCount
{
  return -[NSMutableArray count](self->_dirtyProperties, "count");
}

- (id)dirtyPropertiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dirtyProperties, "objectAtIndex:", a3);
}

+ (Class)dirtyPropertiesType
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
  v8.super_class = (Class)ACProtobufAccountCredential;
  -[ACProtobufAccountCredential description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACProtobufAccountCredential dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *credentialType;
  NSMutableArray *dirtyProperties;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_credentialItems, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_credentialItems, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = self->_credentialItems;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("credentialItems"));
  }
  credentialType = self->_credentialType;
  if (credentialType)
    objc_msgSend(v3, "setObject:forKey:", credentialType, CFSTR("credentialType"));
  dirtyProperties = self->_dirtyProperties;
  if (dirtyProperties)
    objc_msgSend(v3, "setObject:forKey:", dirtyProperties, CFSTR("dirtyProperties"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresTouchID, (_QWORD)v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("requiresTouchID"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ACProtobufAccountCredentialReadFrom((uint64_t)self, (uint64_t)a3);
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
  v5 = self->_credentialItems;
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

  PBDataWriterWriteStringField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_dirtyProperties;
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
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  PBDataWriterWriteBOOLField();
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
  _BYTE *v12;

  v12 = a3;
  if (-[ACProtobufAccountCredential credentialItemsCount](self, "credentialItemsCount"))
  {
    objc_msgSend(v12, "clearCredentialItems");
    v4 = -[ACProtobufAccountCredential credentialItemsCount](self, "credentialItemsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ACProtobufAccountCredential credentialItemsAtIndex:](self, "credentialItemsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addCredentialItems:", v7);

      }
    }
  }
  objc_msgSend(v12, "setCredentialType:", self->_credentialType);
  if (-[ACProtobufAccountCredential dirtyPropertiesCount](self, "dirtyPropertiesCount"))
  {
    objc_msgSend(v12, "clearDirtyProperties");
    v8 = -[ACProtobufAccountCredential dirtyPropertiesCount](self, "dirtyPropertiesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[ACProtobufAccountCredential dirtyPropertiesAtIndex:](self, "dirtyPropertiesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addDirtyProperties:", v11);

      }
    }
  }
  v12[32] = self->_requiresTouchID;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
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
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = self->_credentialItems;
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
        objc_msgSend((id)v5, "addCredentialItems:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  v12 = -[NSString copyWithZone:](self->_credentialType, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_dirtyProperties;
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
        objc_msgSend((id)v5, "addDirtyProperties:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  *(_BYTE *)(v5 + 32) = self->_requiresTouchID;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  NSMutableArray *credentialItems;
  NSString *credentialType;
  NSMutableArray *dirtyProperties;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((credentialItems = self->_credentialItems, !((unint64_t)credentialItems | *((_QWORD *)v4 + 1)))
     || -[NSMutableArray isEqual:](credentialItems, "isEqual:"))
    && ((credentialType = self->_credentialType, !((unint64_t)credentialType | *((_QWORD *)v4 + 2)))
     || -[NSString isEqual:](credentialType, "isEqual:"))
    && ((dirtyProperties = self->_dirtyProperties, !((unint64_t)dirtyProperties | *((_QWORD *)v4 + 3)))
     || -[NSMutableArray isEqual:](dirtyProperties, "isEqual:")))
  {
    if (self->_requiresTouchID)
      v8 = v4[32] != 0;
    else
      v8 = v4[32] == 0;
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

  v3 = -[NSMutableArray hash](self->_credentialItems, "hash");
  v4 = -[NSString hash](self->_credentialType, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_dirtyProperties, "hash") ^ (2654435761 * self->_requiresTouchID);
}

- (void)mergeFrom:(id)a3
{
  id v4;
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
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = *((id *)v4 + 1);
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
        -[ACProtobufAccountCredential addCredentialItems:](self, "addCredentialItems:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 2))
    -[ACProtobufAccountCredential setCredentialType:](self, "setCredentialType:");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 3);
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
        -[ACProtobufAccountCredential addDirtyProperties:](self, "addDirtyProperties:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  self->_requiresTouchID = *((_BYTE *)v4 + 32);
}

- (NSMutableArray)credentialItems
{
  return self->_credentialItems;
}

- (void)setCredentialItems:(id)a3
{
  objc_storeStrong((id *)&self->_credentialItems, a3);
}

- (NSString)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(id)a3
{
  objc_storeStrong((id *)&self->_credentialType, a3);
}

- (NSMutableArray)dirtyProperties
{
  return self->_dirtyProperties;
}

- (void)setDirtyProperties:(id)a3
{
  objc_storeStrong((id *)&self->_dirtyProperties, a3);
}

- (BOOL)requiresTouchID
{
  return self->_requiresTouchID;
}

- (void)setRequiresTouchID:(BOOL)a3
{
  self->_requiresTouchID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyProperties, 0);
  objc_storeStrong((id *)&self->_credentialType, 0);
  objc_storeStrong((id *)&self->_credentialItems, 0);
}

@end
