@implementation ASCodableContact

- (BOOL)hasLinkedContactStoreIdentifier
{
  return self->_linkedContactStoreIdentifier != 0;
}

- (BOOL)hasFullName
{
  return self->_fullName != 0;
}

- (BOOL)hasShortName
{
  return self->_shortName != 0;
}

- (void)clearDestinations
{
  -[NSMutableArray removeAllObjects](self->_destinations, "removeAllObjects");
}

- (void)addDestinations:(id)a3
{
  id v4;
  NSMutableArray *destinations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  destinations = self->_destinations;
  v8 = v4;
  if (!destinations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_destinations;
    self->_destinations = v6;

    v4 = v8;
    destinations = self->_destinations;
  }
  -[NSMutableArray addObject:](destinations, "addObject:", v4);

}

- (unint64_t)destinationsCount
{
  return -[NSMutableArray count](self->_destinations, "count");
}

- (id)destinationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_destinations, "objectAtIndex:", a3);
}

+ (Class)destinationsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRelationshipContainer
{
  return self->_relationshipContainer != 0;
}

- (BOOL)hasRemoteRelationshipContainer
{
  return self->_remoteRelationshipContainer != 0;
}

- (BOOL)hasPendingRelationshipShareItem
{
  return self->_pendingRelationshipShareItem != 0;
}

- (BOOL)hasPendingLegacyShareLocations
{
  return self->_pendingLegacyShareLocations != 0;
}

- (BOOL)hasRelationshipStorage
{
  return self->_relationshipStorage != 0;
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
  v8.super_class = (Class)ASCodableContact;
  -[ASCodableContact description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableContact dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *linkedContactStoreIdentifier;
  NSString *fullName;
  NSString *shortName;
  NSMutableArray *destinations;
  ASCodableRelationshipContainer *relationshipContainer;
  void *v10;
  ASCodableRelationshipContainer *remoteRelationshipContainer;
  void *v12;
  NSData *pendingRelationshipShareItem;
  NSData *pendingLegacyShareLocations;
  ASCodableRelationshipStorage *relationshipStorage;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  linkedContactStoreIdentifier = self->_linkedContactStoreIdentifier;
  if (linkedContactStoreIdentifier)
    objc_msgSend(v3, "setObject:forKey:", linkedContactStoreIdentifier, CFSTR("linkedContactStoreIdentifier"));
  fullName = self->_fullName;
  if (fullName)
    objc_msgSend(v4, "setObject:forKey:", fullName, CFSTR("fullName"));
  shortName = self->_shortName;
  if (shortName)
    objc_msgSend(v4, "setObject:forKey:", shortName, CFSTR("shortName"));
  destinations = self->_destinations;
  if (destinations)
    objc_msgSend(v4, "setObject:forKey:", destinations, CFSTR("destinations"));
  relationshipContainer = self->_relationshipContainer;
  if (relationshipContainer)
  {
    -[ASCodableRelationshipContainer dictionaryRepresentation](relationshipContainer, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("relationshipContainer"));

  }
  remoteRelationshipContainer = self->_remoteRelationshipContainer;
  if (remoteRelationshipContainer)
  {
    -[ASCodableRelationshipContainer dictionaryRepresentation](remoteRelationshipContainer, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("remoteRelationshipContainer"));

  }
  pendingRelationshipShareItem = self->_pendingRelationshipShareItem;
  if (pendingRelationshipShareItem)
    objc_msgSend(v4, "setObject:forKey:", pendingRelationshipShareItem, CFSTR("pendingRelationshipShareItem"));
  pendingLegacyShareLocations = self->_pendingLegacyShareLocations;
  if (pendingLegacyShareLocations)
    objc_msgSend(v4, "setObject:forKey:", pendingLegacyShareLocations, CFSTR("pendingLegacyShareLocations"));
  relationshipStorage = self->_relationshipStorage;
  if (relationshipStorage)
  {
    -[ASCodableRelationshipStorage dictionaryRepresentation](relationshipStorage, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("relationshipStorage"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableContactReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_linkedContactStoreIdentifier)
    PBDataWriterWriteStringField();
  if (self->_fullName)
    PBDataWriterWriteStringField();
  if (self->_shortName)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_destinations;
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

  if (self->_relationshipContainer)
    PBDataWriterWriteSubmessage();
  if (self->_remoteRelationshipContainer)
    PBDataWriterWriteSubmessage();
  if (self->_pendingRelationshipShareItem)
    PBDataWriterWriteDataField();
  if (self->_pendingLegacyShareLocations)
    PBDataWriterWriteDataField();
  if (self->_relationshipStorage)
    PBDataWriterWriteSubmessage();

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
  if (self->_linkedContactStoreIdentifier)
    objc_msgSend(v9, "setLinkedContactStoreIdentifier:");
  if (self->_fullName)
    objc_msgSend(v9, "setFullName:");
  if (self->_shortName)
    objc_msgSend(v9, "setShortName:");
  if (-[ASCodableContact destinationsCount](self, "destinationsCount"))
  {
    objc_msgSend(v9, "clearDestinations");
    v4 = -[ASCodableContact destinationsCount](self, "destinationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ASCodableContact destinationsAtIndex:](self, "destinationsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addDestinations:", v7);

      }
    }
  }
  if (self->_relationshipContainer)
    objc_msgSend(v9, "setRelationshipContainer:");
  v8 = v9;
  if (self->_remoteRelationshipContainer)
  {
    objc_msgSend(v9, "setRemoteRelationshipContainer:");
    v8 = v9;
  }
  if (self->_pendingRelationshipShareItem)
  {
    objc_msgSend(v9, "setPendingRelationshipShareItem:");
    v8 = v9;
  }
  if (self->_pendingLegacyShareLocations)
  {
    objc_msgSend(v9, "setPendingLegacyShareLocations:");
    v8 = v9;
  }
  if (self->_relationshipStorage)
  {
    objc_msgSend(v9, "setRelationshipStorage:");
    v8 = v9;
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
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_linkedContactStoreIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_fullName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_shortName, "copyWithZone:", a3);
  v11 = (void *)v5[9];
  v5[9] = v10;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = self->_destinations;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v29);
        objc_msgSend(v5, "addDestinations:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v14);
  }

  v18 = -[ASCodableRelationshipContainer copyWithZone:](self->_relationshipContainer, "copyWithZone:", a3);
  v19 = (void *)v5[6];
  v5[6] = v18;

  v20 = -[ASCodableRelationshipContainer copyWithZone:](self->_remoteRelationshipContainer, "copyWithZone:", a3);
  v21 = (void *)v5[8];
  v5[8] = v20;

  v22 = -[NSData copyWithZone:](self->_pendingRelationshipShareItem, "copyWithZone:", a3);
  v23 = (void *)v5[5];
  v5[5] = v22;

  v24 = -[NSData copyWithZone:](self->_pendingLegacyShareLocations, "copyWithZone:", a3);
  v25 = (void *)v5[4];
  v5[4] = v24;

  v26 = -[ASCodableRelationshipStorage copyWithZone:](self->_relationshipStorage, "copyWithZone:", a3);
  v27 = (void *)v5[7];
  v5[7] = v26;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *linkedContactStoreIdentifier;
  NSString *fullName;
  NSString *shortName;
  NSMutableArray *destinations;
  ASCodableRelationshipContainer *relationshipContainer;
  ASCodableRelationshipContainer *remoteRelationshipContainer;
  NSData *pendingRelationshipShareItem;
  NSData *pendingLegacyShareLocations;
  ASCodableRelationshipStorage *relationshipStorage;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  linkedContactStoreIdentifier = self->_linkedContactStoreIdentifier;
  if ((unint64_t)linkedContactStoreIdentifier | v4[3])
  {
    if (!-[NSString isEqual:](linkedContactStoreIdentifier, "isEqual:"))
      goto LABEL_20;
  }
  if (((fullName = self->_fullName, !((unint64_t)fullName | v4[2]))
     || -[NSString isEqual:](fullName, "isEqual:"))
    && ((shortName = self->_shortName, !((unint64_t)shortName | v4[9]))
     || -[NSString isEqual:](shortName, "isEqual:"))
    && ((destinations = self->_destinations, !((unint64_t)destinations | v4[1]))
     || -[NSMutableArray isEqual:](destinations, "isEqual:"))
    && ((relationshipContainer = self->_relationshipContainer, !((unint64_t)relationshipContainer | v4[6]))
     || -[ASCodableRelationshipContainer isEqual:](relationshipContainer, "isEqual:"))
    && ((remoteRelationshipContainer = self->_remoteRelationshipContainer,
         !((unint64_t)remoteRelationshipContainer | v4[8]))
     || -[ASCodableRelationshipContainer isEqual:](remoteRelationshipContainer, "isEqual:"))
    && ((pendingRelationshipShareItem = self->_pendingRelationshipShareItem,
         !((unint64_t)pendingRelationshipShareItem | v4[5]))
     || -[NSData isEqual:](pendingRelationshipShareItem, "isEqual:"))
    && ((pendingLegacyShareLocations = self->_pendingLegacyShareLocations,
         !((unint64_t)pendingLegacyShareLocations | v4[4]))
     || -[NSData isEqual:](pendingLegacyShareLocations, "isEqual:")))
  {
    relationshipStorage = self->_relationshipStorage;
    if ((unint64_t)relationshipStorage | v4[7])
      v14 = -[ASCodableRelationshipStorage isEqual:](relationshipStorage, "isEqual:");
    else
      v14 = 1;
  }
  else
  {
LABEL_20:
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_linkedContactStoreIdentifier, "hash");
  v4 = -[NSString hash](self->_fullName, "hash") ^ v3;
  v5 = -[NSString hash](self->_shortName, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_destinations, "hash");
  v7 = -[ASCodableRelationshipContainer hash](self->_relationshipContainer, "hash");
  v8 = v7 ^ -[ASCodableRelationshipContainer hash](self->_remoteRelationshipContainer, "hash");
  v9 = v6 ^ v8 ^ -[NSData hash](self->_pendingRelationshipShareItem, "hash");
  v10 = -[NSData hash](self->_pendingLegacyShareLocations, "hash");
  return v9 ^ v10 ^ -[ASCodableRelationshipStorage hash](self->_relationshipStorage, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  ASCodableRelationshipContainer *relationshipContainer;
  uint64_t v11;
  ASCodableRelationshipContainer *remoteRelationshipContainer;
  uint64_t v13;
  ASCodableRelationshipStorage *relationshipStorage;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 3))
    -[ASCodableContact setLinkedContactStoreIdentifier:](self, "setLinkedContactStoreIdentifier:");
  if (*((_QWORD *)v4 + 2))
    -[ASCodableContact setFullName:](self, "setFullName:");
  if (*((_QWORD *)v4 + 9))
    -[ASCodableContact setShortName:](self, "setShortName:");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        -[ASCodableContact addDestinations:](self, "addDestinations:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  relationshipContainer = self->_relationshipContainer;
  v11 = *((_QWORD *)v4 + 6);
  if (relationshipContainer)
  {
    if (v11)
      -[ASCodableRelationshipContainer mergeFrom:](relationshipContainer, "mergeFrom:");
  }
  else if (v11)
  {
    -[ASCodableContact setRelationshipContainer:](self, "setRelationshipContainer:");
  }
  remoteRelationshipContainer = self->_remoteRelationshipContainer;
  v13 = *((_QWORD *)v4 + 8);
  if (remoteRelationshipContainer)
  {
    if (v13)
      -[ASCodableRelationshipContainer mergeFrom:](remoteRelationshipContainer, "mergeFrom:");
  }
  else if (v13)
  {
    -[ASCodableContact setRemoteRelationshipContainer:](self, "setRemoteRelationshipContainer:");
  }
  if (*((_QWORD *)v4 + 5))
    -[ASCodableContact setPendingRelationshipShareItem:](self, "setPendingRelationshipShareItem:");
  if (*((_QWORD *)v4 + 4))
    -[ASCodableContact setPendingLegacyShareLocations:](self, "setPendingLegacyShareLocations:");
  relationshipStorage = self->_relationshipStorage;
  v15 = *((_QWORD *)v4 + 7);
  if (relationshipStorage)
  {
    if (v15)
      -[ASCodableRelationshipStorage mergeFrom:](relationshipStorage, "mergeFrom:");
  }
  else if (v15)
  {
    -[ASCodableContact setRelationshipStorage:](self, "setRelationshipStorage:");
  }

}

- (NSString)linkedContactStoreIdentifier
{
  return self->_linkedContactStoreIdentifier;
}

- (void)setLinkedContactStoreIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_linkedContactStoreIdentifier, a3);
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
  objc_storeStrong((id *)&self->_fullName, a3);
}

- (NSString)shortName
{
  return self->_shortName;
}

- (void)setShortName:(id)a3
{
  objc_storeStrong((id *)&self->_shortName, a3);
}

- (NSMutableArray)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_destinations, a3);
}

- (ASCodableRelationshipContainer)relationshipContainer
{
  return self->_relationshipContainer;
}

- (void)setRelationshipContainer:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipContainer, a3);
}

- (ASCodableRelationshipContainer)remoteRelationshipContainer
{
  return self->_remoteRelationshipContainer;
}

- (void)setRemoteRelationshipContainer:(id)a3
{
  objc_storeStrong((id *)&self->_remoteRelationshipContainer, a3);
}

- (NSData)pendingRelationshipShareItem
{
  return self->_pendingRelationshipShareItem;
}

- (void)setPendingRelationshipShareItem:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRelationshipShareItem, a3);
}

- (NSData)pendingLegacyShareLocations
{
  return self->_pendingLegacyShareLocations;
}

- (void)setPendingLegacyShareLocations:(id)a3
{
  objc_storeStrong((id *)&self->_pendingLegacyShareLocations, a3);
}

- (ASCodableRelationshipStorage)relationshipStorage
{
  return self->_relationshipStorage;
}

- (void)setRelationshipStorage:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_remoteRelationshipContainer, 0);
  objc_storeStrong((id *)&self->_relationshipStorage, 0);
  objc_storeStrong((id *)&self->_relationshipContainer, 0);
  objc_storeStrong((id *)&self->_pendingRelationshipShareItem, 0);
  objc_storeStrong((id *)&self->_pendingLegacyShareLocations, 0);
  objc_storeStrong((id *)&self->_linkedContactStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
}

@end
