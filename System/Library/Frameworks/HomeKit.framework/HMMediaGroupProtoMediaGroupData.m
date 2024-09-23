@implementation HMMediaGroupProtoMediaGroupData

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasParentIdentifier
{
  return self->_parentIdentifier != 0;
}

- (void)clearDestinationIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_destinationIdentifiers, "removeAllObjects");
}

- (void)addDestinationIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *destinationIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  destinationIdentifiers = self->_destinationIdentifiers;
  v8 = v4;
  if (!destinationIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_destinationIdentifiers;
    self->_destinationIdentifiers = v6;

    v4 = v8;
    destinationIdentifiers = self->_destinationIdentifiers;
  }
  -[NSMutableArray addObject:](destinationIdentifiers, "addObject:", v4);

}

- (unint64_t)destinationIdentifiersCount
{
  return -[NSMutableArray count](self->_destinationIdentifiers, "count");
}

- (id)destinationIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_destinationIdentifiers, "objectAtIndex:", a3);
}

- (BOOL)hasAssociatedGroupIdentifier
{
  return self->_associatedGroupIdentifier != 0;
}

- (BOOL)hasGroupRole
{
  return self->_groupRole != 0;
}

- (void)setIsDefaultName:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isDefaultName = a3;
}

- (void)setHasIsDefaultName:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsDefaultName
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)HMMediaGroupProtoMediaGroupData;
  -[HMMediaGroupProtoMediaGroupData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroupProtoMediaGroupData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *name;
  NSString *parentIdentifier;
  NSMutableArray *destinationIdentifiers;
  NSString *associatedGroupIdentifier;
  HMMediaGroupProtoMediaGroupRole *groupRole;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  name = self->_name;
  if (name)
    objc_msgSend(v4, "setObject:forKey:", name, CFSTR("name"));
  parentIdentifier = self->_parentIdentifier;
  if (parentIdentifier)
    objc_msgSend(v4, "setObject:forKey:", parentIdentifier, CFSTR("parentIdentifier"));
  destinationIdentifiers = self->_destinationIdentifiers;
  if (destinationIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", destinationIdentifiers, CFSTR("destinationIdentifiers"));
  associatedGroupIdentifier = self->_associatedGroupIdentifier;
  if (associatedGroupIdentifier)
    objc_msgSend(v4, "setObject:forKey:", associatedGroupIdentifier, CFSTR("associatedGroupIdentifier"));
  groupRole = self->_groupRole;
  if (groupRole)
  {
    -[HMMediaGroupProtoMediaGroupRole dictionaryRepresentation](groupRole, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("groupRole"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDefaultName);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("isDefaultName"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMMediaGroupProtoMediaGroupDataReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_parentIdentifier)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_destinationIdentifiers;
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

  if (self->_associatedGroupIdentifier)
    PBDataWriterWriteStringField();
  if (self->_groupRole)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _BYTE *v8;
  id v9;

  v9 = a3;
  if (self->_identifier)
    objc_msgSend(v9, "setIdentifier:");
  if (self->_name)
    objc_msgSend(v9, "setName:");
  if (self->_parentIdentifier)
    objc_msgSend(v9, "setParentIdentifier:");
  if (-[HMMediaGroupProtoMediaGroupData destinationIdentifiersCount](self, "destinationIdentifiersCount"))
  {
    objc_msgSend(v9, "clearDestinationIdentifiers");
    v4 = -[HMMediaGroupProtoMediaGroupData destinationIdentifiersCount](self, "destinationIdentifiersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HMMediaGroupProtoMediaGroupData destinationIdentifiersAtIndex:](self, "destinationIdentifiersAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addDestinationIdentifiers:", v7);

      }
    }
  }
  if (self->_associatedGroupIdentifier)
    objc_msgSend(v9, "setAssociatedGroupIdentifier:");
  v8 = v9;
  if (self->_groupRole)
  {
    objc_msgSend(v9, "setGroupRole:");
    v8 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8[56] = self->_isDefaultName;
    v8[60] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
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
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_parentIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = self->_destinationIdentifiers;
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
        objc_msgSend((id)v5, "addDestinationIdentifiers:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  v18 = -[NSString copyWithZone:](self->_associatedGroupIdentifier, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v18;

  v20 = -[HMMediaGroupProtoMediaGroupRole copyWithZone:](self->_groupRole, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v20;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 56) = self->_isDefaultName;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *name;
  NSString *parentIdentifier;
  NSMutableArray *destinationIdentifiers;
  NSString *associatedGroupIdentifier;
  HMMediaGroupProtoMediaGroupRole *groupRole;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_16;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_16;
  }
  parentIdentifier = self->_parentIdentifier;
  if ((unint64_t)parentIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](parentIdentifier, "isEqual:"))
      goto LABEL_16;
  }
  destinationIdentifiers = self->_destinationIdentifiers;
  if ((unint64_t)destinationIdentifiers | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](destinationIdentifiers, "isEqual:"))
      goto LABEL_16;
  }
  associatedGroupIdentifier = self->_associatedGroupIdentifier;
  if ((unint64_t)associatedGroupIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](associatedGroupIdentifier, "isEqual:"))
      goto LABEL_16;
  }
  groupRole = self->_groupRole;
  if ((unint64_t)groupRole | *((_QWORD *)v4 + 3))
  {
    if (!-[HMMediaGroupProtoMediaGroupRole isEqual:](groupRole, "isEqual:"))
      goto LABEL_16;
  }
  v11 = (*((_BYTE *)v4 + 60) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0)
    {
LABEL_16:
      v11 = 0;
      goto LABEL_17;
    }
    if (self->_isDefaultName)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_16;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_16;
    }
    v11 = 1;
  }
LABEL_17:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_name, "hash");
  v5 = -[NSString hash](self->_parentIdentifier, "hash");
  v6 = -[NSMutableArray hash](self->_destinationIdentifiers, "hash");
  v7 = -[NSString hash](self->_associatedGroupIdentifier, "hash");
  v8 = -[HMMediaGroupProtoMediaGroupRole hash](self->_groupRole, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761 * self->_isDefaultName;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  HMMediaGroupProtoMediaGroupRole *groupRole;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[HMMediaGroupProtoMediaGroupData setIdentifier:](self, "setIdentifier:");
  if (*((_QWORD *)v4 + 5))
    -[HMMediaGroupProtoMediaGroupData setName:](self, "setName:");
  if (*((_QWORD *)v4 + 6))
    -[HMMediaGroupProtoMediaGroupData setParentIdentifier:](self, "setParentIdentifier:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 2);
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
        -[HMMediaGroupProtoMediaGroupData addDestinationIdentifiers:](self, "addDestinationIdentifiers:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 1))
    -[HMMediaGroupProtoMediaGroupData setAssociatedGroupIdentifier:](self, "setAssociatedGroupIdentifier:");
  groupRole = self->_groupRole;
  v11 = *((_QWORD *)v4 + 3);
  if (groupRole)
  {
    if (v11)
      -[HMMediaGroupProtoMediaGroupRole mergeFrom:](groupRole, "mergeFrom:");
  }
  else if (v11)
  {
    -[HMMediaGroupProtoMediaGroupData setGroupRole:](self, "setGroupRole:");
  }
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    self->_isDefaultName = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (void)setParentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentIdentifier, a3);
}

- (NSMutableArray)destinationIdentifiers
{
  return self->_destinationIdentifiers;
}

- (void)setDestinationIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_destinationIdentifiers, a3);
}

- (NSString)associatedGroupIdentifier
{
  return self->_associatedGroupIdentifier;
}

- (void)setAssociatedGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_associatedGroupIdentifier, a3);
}

- (HMMediaGroupProtoMediaGroupRole)groupRole
{
  return self->_groupRole;
}

- (void)setGroupRole:(id)a3
{
  objc_storeStrong((id *)&self->_groupRole, a3);
}

- (BOOL)isDefaultName
{
  return self->_isDefaultName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_groupRole, 0);
  objc_storeStrong((id *)&self->_destinationIdentifiers, 0);
  objc_storeStrong((id *)&self->_associatedGroupIdentifier, 0);
}

+ (Class)destinationIdentifiersType
{
  return (Class)objc_opt_class();
}

@end
