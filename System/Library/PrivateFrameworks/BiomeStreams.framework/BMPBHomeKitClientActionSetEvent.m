@implementation BMPBHomeKitClientActionSetEvent

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasActionSetUniqueIdentifier
{
  return self->_actionSetUniqueIdentifier != 0;
}

- (BOOL)hasActionSetType
{
  return self->_actionSetType != 0;
}

- (void)clearAssociatedAccessoryUniqueIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_associatedAccessoryUniqueIdentifiers, "removeAllObjects");
}

- (void)addAssociatedAccessoryUniqueIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *associatedAccessoryUniqueIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  associatedAccessoryUniqueIdentifiers = self->_associatedAccessoryUniqueIdentifiers;
  v8 = v4;
  if (!associatedAccessoryUniqueIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_associatedAccessoryUniqueIdentifiers;
    self->_associatedAccessoryUniqueIdentifiers = v6;

    v4 = v8;
    associatedAccessoryUniqueIdentifiers = self->_associatedAccessoryUniqueIdentifiers;
  }
  -[NSMutableArray addObject:](associatedAccessoryUniqueIdentifiers, "addObject:", v4);

}

- (unint64_t)associatedAccessoryUniqueIdentifiersCount
{
  return -[NSMutableArray count](self->_associatedAccessoryUniqueIdentifiers, "count");
}

- (id)associatedAccessoryUniqueIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_associatedAccessoryUniqueIdentifiers, "objectAtIndex:", a3);
}

+ (Class)associatedAccessoryUniqueIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasActionSetName
{
  return self->_actionSetName != 0;
}

- (BOOL)hasHomeName
{
  return self->_homeName != 0;
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
  v8.super_class = (Class)BMPBHomeKitClientActionSetEvent;
  -[BMPBHomeKitClientActionSetEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBHomeKitClientActionSetEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  BMPBHomeKitClientBase *base;
  void *v5;
  NSString *actionSetUniqueIdentifier;
  NSString *actionSetType;
  NSMutableArray *associatedAccessoryUniqueIdentifiers;
  NSString *actionSetName;
  NSString *homeName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  base = self->_base;
  if (base)
  {
    -[BMPBHomeKitClientBase dictionaryRepresentation](base, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("base"));

  }
  actionSetUniqueIdentifier = self->_actionSetUniqueIdentifier;
  if (actionSetUniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", actionSetUniqueIdentifier, CFSTR("actionSetUniqueIdentifier"));
  actionSetType = self->_actionSetType;
  if (actionSetType)
    objc_msgSend(v3, "setObject:forKey:", actionSetType, CFSTR("actionSetType"));
  associatedAccessoryUniqueIdentifiers = self->_associatedAccessoryUniqueIdentifiers;
  if (associatedAccessoryUniqueIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", associatedAccessoryUniqueIdentifiers, CFSTR("associatedAccessoryUniqueIdentifiers"));
  actionSetName = self->_actionSetName;
  if (actionSetName)
    objc_msgSend(v3, "setObject:forKey:", actionSetName, CFSTR("actionSetName"));
  homeName = self->_homeName;
  if (homeName)
    objc_msgSend(v3, "setObject:forKey:", homeName, CFSTR("homeName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBHomeKitClientActionSetEventReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_base)
    PBDataWriterWriteSubmessage();
  if (self->_actionSetUniqueIdentifier)
    PBDataWriterWriteStringField();
  if (self->_actionSetType)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_associatedAccessoryUniqueIdentifiers;
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

  if (self->_actionSetName)
    PBDataWriterWriteStringField();
  if (self->_homeName)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self->_base)
    objc_msgSend(v9, "setBase:");
  if (self->_actionSetUniqueIdentifier)
    objc_msgSend(v9, "setActionSetUniqueIdentifier:");
  if (self->_actionSetType)
    objc_msgSend(v9, "setActionSetType:");
  if (-[BMPBHomeKitClientActionSetEvent associatedAccessoryUniqueIdentifiersCount](self, "associatedAccessoryUniqueIdentifiersCount"))
  {
    objc_msgSend(v9, "clearAssociatedAccessoryUniqueIdentifiers");
    v4 = -[BMPBHomeKitClientActionSetEvent associatedAccessoryUniqueIdentifiersCount](self, "associatedAccessoryUniqueIdentifiersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[BMPBHomeKitClientActionSetEvent associatedAccessoryUniqueIdentifiersAtIndex:](self, "associatedAccessoryUniqueIdentifiersAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addAssociatedAccessoryUniqueIdentifiers:", v7);

      }
    }
  }
  if (self->_actionSetName)
    objc_msgSend(v9, "setActionSetName:");
  v8 = v9;
  if (self->_homeName)
  {
    objc_msgSend(v9, "setHomeName:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
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
  v6 = -[BMPBHomeKitClientBase copyWithZone:](self->_base, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  v8 = -[NSString copyWithZone:](self->_actionSetUniqueIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_actionSetType, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = self->_associatedAccessoryUniqueIdentifiers;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend(v5, "addAssociatedAccessoryUniqueIdentifiers:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  v18 = -[NSString copyWithZone:](self->_actionSetName, "copyWithZone:", a3);
  v19 = (void *)v5[1];
  v5[1] = v18;

  v20 = -[NSString copyWithZone:](self->_homeName, "copyWithZone:", a3);
  v21 = (void *)v5[6];
  v5[6] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BMPBHomeKitClientBase *base;
  NSString *actionSetUniqueIdentifier;
  NSString *actionSetType;
  NSMutableArray *associatedAccessoryUniqueIdentifiers;
  NSString *actionSetName;
  NSString *homeName;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((base = self->_base, !((unint64_t)base | v4[5])) || -[BMPBHomeKitClientBase isEqual:](base, "isEqual:"))
    && ((actionSetUniqueIdentifier = self->_actionSetUniqueIdentifier,
         !((unint64_t)actionSetUniqueIdentifier | v4[3]))
     || -[NSString isEqual:](actionSetUniqueIdentifier, "isEqual:"))
    && ((actionSetType = self->_actionSetType, !((unint64_t)actionSetType | v4[2]))
     || -[NSString isEqual:](actionSetType, "isEqual:"))
    && ((associatedAccessoryUniqueIdentifiers = self->_associatedAccessoryUniqueIdentifiers,
         !((unint64_t)associatedAccessoryUniqueIdentifiers | v4[4]))
     || -[NSMutableArray isEqual:](associatedAccessoryUniqueIdentifiers, "isEqual:"))
    && ((actionSetName = self->_actionSetName, !((unint64_t)actionSetName | v4[1]))
     || -[NSString isEqual:](actionSetName, "isEqual:")))
  {
    homeName = self->_homeName;
    if ((unint64_t)homeName | v4[6])
      v11 = -[NSString isEqual:](homeName, "isEqual:");
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
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;

  v3 = -[BMPBHomeKitClientBase hash](self->_base, "hash");
  v4 = -[NSString hash](self->_actionSetUniqueIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_actionSetType, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_associatedAccessoryUniqueIdentifiers, "hash");
  v7 = -[NSString hash](self->_actionSetName, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_homeName, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  BMPBHomeKitClientBase *base;
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
  base = self->_base;
  v6 = *((_QWORD *)v4 + 5);
  if (base)
  {
    if (v6)
      -[BMPBHomeKitClientBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[BMPBHomeKitClientActionSetEvent setBase:](self, "setBase:");
  }
  if (*((_QWORD *)v4 + 3))
    -[BMPBHomeKitClientActionSetEvent setActionSetUniqueIdentifier:](self, "setActionSetUniqueIdentifier:");
  if (*((_QWORD *)v4 + 2))
    -[BMPBHomeKitClientActionSetEvent setActionSetType:](self, "setActionSetType:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 4);
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
        -[BMPBHomeKitClientActionSetEvent addAssociatedAccessoryUniqueIdentifiers:](self, "addAssociatedAccessoryUniqueIdentifiers:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 1))
    -[BMPBHomeKitClientActionSetEvent setActionSetName:](self, "setActionSetName:");
  if (*((_QWORD *)v4 + 6))
    -[BMPBHomeKitClientActionSetEvent setHomeName:](self, "setHomeName:");

}

- (BMPBHomeKitClientBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
  objc_storeStrong((id *)&self->_base, a3);
}

- (NSString)actionSetUniqueIdentifier
{
  return self->_actionSetUniqueIdentifier;
}

- (void)setActionSetUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetUniqueIdentifier, a3);
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (void)setActionSetType:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetType, a3);
}

- (NSMutableArray)associatedAccessoryUniqueIdentifiers
{
  return self->_associatedAccessoryUniqueIdentifiers;
}

- (void)setAssociatedAccessoryUniqueIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_associatedAccessoryUniqueIdentifiers, a3);
}

- (NSString)actionSetName
{
  return self->_actionSetName;
}

- (void)setActionSetName:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetName, a3);
}

- (NSString)homeName
{
  return self->_homeName;
}

- (void)setHomeName:(id)a3
{
  objc_storeStrong((id *)&self->_homeName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_associatedAccessoryUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionSetUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_actionSetType, 0);
  objc_storeStrong((id *)&self->_actionSetName, 0);
}

@end
