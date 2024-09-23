@implementation HMMediaGroupProtoMediaDestinationControllerData

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasParentIdentifier
{
  return self->_parentIdentifier != 0;
}

- (BOOL)hasDestinationIdentifier
{
  return self->_destinationIdentifier != 0;
}

- (void)clearAvailableDestinations
{
  -[NSMutableArray removeAllObjects](self->_availableDestinations, "removeAllObjects");
}

- (void)addAvailableDestinations:(id)a3
{
  id v4;
  NSMutableArray *availableDestinations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  availableDestinations = self->_availableDestinations;
  v8 = v4;
  if (!availableDestinations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_availableDestinations;
    self->_availableDestinations = v6;

    v4 = v8;
    availableDestinations = self->_availableDestinations;
  }
  -[NSMutableArray addObject:](availableDestinations, "addObject:", v4);

}

- (unint64_t)availableDestinationsCount
{
  return -[NSMutableArray count](self->_availableDestinations, "count");
}

- (id)availableDestinationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_availableDestinations, "objectAtIndex:", a3);
}

- (void)setSupportedOptions:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_supportedOptions = a3;
}

- (void)setHasSupportedOptions:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupportedOptions
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
  v8.super_class = (Class)HMMediaGroupProtoMediaDestinationControllerData;
  -[HMMediaGroupProtoMediaDestinationControllerData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroupProtoMediaDestinationControllerData dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *parentIdentifier;
  NSString *destinationIdentifier;
  NSMutableArray *availableDestinations;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  parentIdentifier = self->_parentIdentifier;
  if (parentIdentifier)
    objc_msgSend(v4, "setObject:forKey:", parentIdentifier, CFSTR("parentIdentifier"));
  destinationIdentifier = self->_destinationIdentifier;
  if (destinationIdentifier)
    objc_msgSend(v4, "setObject:forKey:", destinationIdentifier, CFSTR("destinationIdentifier"));
  availableDestinations = self->_availableDestinations;
  if (availableDestinations)
    objc_msgSend(v4, "setObject:forKey:", availableDestinations, CFSTR("availableDestinations"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_supportedOptions);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("supportedOptions"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMMediaGroupProtoMediaDestinationControllerDataReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_parentIdentifier)
    PBDataWriterWriteStringField();
  if (self->_destinationIdentifier)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_availableDestinations;
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_identifier)
    objc_msgSend(v8, "setIdentifier:");
  if (self->_parentIdentifier)
    objc_msgSend(v8, "setParentIdentifier:");
  if (self->_destinationIdentifier)
    objc_msgSend(v8, "setDestinationIdentifier:");
  if (-[HMMediaGroupProtoMediaDestinationControllerData availableDestinationsCount](self, "availableDestinationsCount"))
  {
    objc_msgSend(v8, "clearAvailableDestinations");
    v4 = -[HMMediaGroupProtoMediaDestinationControllerData availableDestinationsCount](self, "availableDestinationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HMMediaGroupProtoMediaDestinationControllerData availableDestinationsAtIndex:](self, "availableDestinationsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAvailableDestinations:", v7);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v8 + 1) = self->_supportedOptions;
    *((_BYTE *)v8 + 48) |= 1u;
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
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_parentIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_destinationIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_availableDestinations;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend((id)v5, "addAvailableDestinations:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_supportedOptions;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *parentIdentifier;
  NSString *destinationIdentifier;
  NSMutableArray *availableDestinations;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_14;
  }
  parentIdentifier = self->_parentIdentifier;
  if ((unint64_t)parentIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](parentIdentifier, "isEqual:"))
      goto LABEL_14;
  }
  destinationIdentifier = self->_destinationIdentifier;
  if ((unint64_t)destinationIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](destinationIdentifier, "isEqual:"))
      goto LABEL_14;
  }
  availableDestinations = self->_availableDestinations;
  if ((unint64_t)availableDestinations | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](availableDestinations, "isEqual:"))
      goto LABEL_14;
  }
  v9 = (*((_BYTE *)v4 + 48) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) != 0 && self->_supportedOptions == *((_QWORD *)v4 + 1))
    {
      v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_parentIdentifier, "hash");
  v5 = -[NSString hash](self->_destinationIdentifier, "hash");
  v6 = -[NSMutableArray hash](self->_availableDestinations, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761u * self->_supportedOptions;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
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
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[HMMediaGroupProtoMediaDestinationControllerData setIdentifier:](self, "setIdentifier:");
  if (*((_QWORD *)v4 + 5))
    -[HMMediaGroupProtoMediaDestinationControllerData setParentIdentifier:](self, "setParentIdentifier:");
  if (*((_QWORD *)v4 + 3))
    -[HMMediaGroupProtoMediaDestinationControllerData setDestinationIdentifier:](self, "setDestinationIdentifier:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 2);
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
        -[HMMediaGroupProtoMediaDestinationControllerData addAvailableDestinations:](self, "addAvailableDestinations:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_supportedOptions = *((_QWORD *)v4 + 1);
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

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (void)setParentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentIdentifier, a3);
}

- (NSString)destinationIdentifier
{
  return self->_destinationIdentifier;
}

- (void)setDestinationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_destinationIdentifier, a3);
}

- (NSMutableArray)availableDestinations
{
  return self->_availableDestinations;
}

- (void)setAvailableDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_availableDestinations, a3);
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_destinationIdentifier, 0);
  objc_storeStrong((id *)&self->_availableDestinations, 0);
}

+ (Class)availableDestinationsType
{
  return (Class)objc_opt_class();
}

@end
