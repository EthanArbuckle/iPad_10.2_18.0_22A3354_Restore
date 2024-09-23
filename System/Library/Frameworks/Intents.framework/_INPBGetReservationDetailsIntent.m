@implementation _INPBGetReservationDetailsIntent

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setReservationContainerReference:(id)a3
{
  objc_storeStrong((id *)&self->_reservationContainerReference, a3);
}

- (BOOL)hasReservationContainerReference
{
  return self->_reservationContainerReference != 0;
}

- (void)setReservationItemReferences:(id)a3
{
  NSArray *v4;
  NSArray *reservationItemReferences;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  reservationItemReferences = self->_reservationItemReferences;
  self->_reservationItemReferences = v4;

}

- (void)clearReservationItemReferences
{
  -[NSArray removeAllObjects](self->_reservationItemReferences, "removeAllObjects");
}

- (void)addReservationItemReferences:(id)a3
{
  id v4;
  NSArray *reservationItemReferences;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  reservationItemReferences = self->_reservationItemReferences;
  v8 = v4;
  if (!reservationItemReferences)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_reservationItemReferences;
    self->_reservationItemReferences = v6;

    v4 = v8;
    reservationItemReferences = self->_reservationItemReferences;
  }
  -[NSArray addObject:](reservationItemReferences, "addObject:", v4);

}

- (unint64_t)reservationItemReferencesCount
{
  return -[NSArray count](self->_reservationItemReferences, "count");
}

- (id)reservationItemReferencesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_reservationItemReferences, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetReservationDetailsIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBGetReservationDetailsIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBGetReservationDetailsIntent intentMetadata](self, "intentMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBGetReservationDetailsIntent reservationContainerReference](self, "reservationContainerReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBGetReservationDetailsIntent reservationContainerReference](self, "reservationContainerReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_reservationItemReferences;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (_INPBGetReservationDetailsIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBGetReservationDetailsIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBGetReservationDetailsIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBGetReservationDetailsIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBGetReservationDetailsIntent initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBGetReservationDetailsIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBGetReservationDetailsIntent *v5;
  id v6;
  id v7;
  void *v8;

  v5 = -[_INPBGetReservationDetailsIntent init](+[_INPBGetReservationDetailsIntent allocWithZone:](_INPBGetReservationDetailsIntent, "allocWithZone:"), "init");
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBGetReservationDetailsIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  v7 = -[_INPBDataString copyWithZone:](self->_reservationContainerReference, "copyWithZone:", a3);
  -[_INPBGetReservationDetailsIntent setReservationContainerReference:](v5, "setReservationContainerReference:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_reservationItemReferences, "copyWithZone:", a3);
  -[_INPBGetReservationDetailsIntent setReservationItemReferences:](v5, "setReservationItemReferences:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBGetReservationDetailsIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBGetReservationDetailsIntent intentMetadata](self, "intentMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBGetReservationDetailsIntent intentMetadata](self, "intentMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBGetReservationDetailsIntent reservationContainerReference](self, "reservationContainerReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reservationContainerReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBGetReservationDetailsIntent reservationContainerReference](self, "reservationContainerReference");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBGetReservationDetailsIntent reservationContainerReference](self, "reservationContainerReference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reservationContainerReference");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBGetReservationDetailsIntent reservationItemReferences](self, "reservationItemReferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reservationItemReferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBGetReservationDetailsIntent reservationItemReferences](self, "reservationItemReferences");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBGetReservationDetailsIntent reservationItemReferences](self, "reservationItemReferences");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reservationItemReferences");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v4 = -[_INPBDataString hash](self->_reservationContainerReference, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_reservationItemReferences, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBGetReservationDetailsIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("intentMetadata"));

  -[_INPBGetReservationDetailsIntent reservationContainerReference](self, "reservationContainerReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("reservationContainerReference"));

  if (-[NSArray count](self->_reservationItemReferences, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = self->_reservationItemReferences;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "dictionaryRepresentation", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("reservationItemReferences"));
  }
  return v3;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDataString)reservationContainerReference
{
  return self->_reservationContainerReference;
}

- (NSArray)reservationItemReferences
{
  return self->_reservationItemReferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservationItemReferences, 0);
  objc_storeStrong((id *)&self->_reservationContainerReference, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (Class)reservationItemReferencesType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
