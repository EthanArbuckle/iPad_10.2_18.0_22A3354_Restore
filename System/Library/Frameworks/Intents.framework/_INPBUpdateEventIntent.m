@implementation _INPBUpdateEventIntent

- (void)setAddParticipants:(id)a3
{
  NSArray *v4;
  NSArray *addParticipants;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  addParticipants = self->_addParticipants;
  self->_addParticipants = v4;

}

- (void)clearAddParticipants
{
  -[NSArray removeAllObjects](self->_addParticipants, "removeAllObjects");
}

- (void)addAddParticipants:(id)a3
{
  id v4;
  NSArray *addParticipants;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  addParticipants = self->_addParticipants;
  v8 = v4;
  if (!addParticipants)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_addParticipants;
    self->_addParticipants = v6;

    v4 = v8;
    addParticipants = self->_addParticipants;
  }
  -[NSArray addObject:](addParticipants, "addObject:", v4);

}

- (unint64_t)addParticipantsCount
{
  return -[NSArray count](self->_addParticipants, "count");
}

- (id)addParticipantsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_addParticipants, "objectAtIndexedSubscript:", a3);
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setRemoveLocation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_removeLocation = a3;
}

- (BOOL)hasRemoveLocation
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRemoveLocation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setRemoveParticipants:(id)a3
{
  NSArray *v4;
  NSArray *removeParticipants;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  removeParticipants = self->_removeParticipants;
  self->_removeParticipants = v4;

}

- (void)clearRemoveParticipants
{
  -[NSArray removeAllObjects](self->_removeParticipants, "removeAllObjects");
}

- (void)addRemoveParticipants:(id)a3
{
  id v4;
  NSArray *removeParticipants;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  removeParticipants = self->_removeParticipants;
  v8 = v4;
  if (!removeParticipants)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_removeParticipants;
    self->_removeParticipants = v6;

    v4 = v8;
    removeParticipants = self->_removeParticipants;
  }
  -[NSArray addObject:](removeParticipants, "addObject:", v4);

}

- (unint64_t)removeParticipantsCount
{
  return -[NSArray count](self->_removeParticipants, "count");
}

- (id)removeParticipantsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_removeParticipants, "objectAtIndexedSubscript:", a3);
}

- (void)setSetDateTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_setDateTimeRange, a3);
}

- (BOOL)hasSetDateTimeRange
{
  return self->_setDateTimeRange != 0;
}

- (void)setSetLocation:(id)a3
{
  objc_storeStrong((id *)&self->_setLocation, a3);
}

- (BOOL)hasSetLocation
{
  return self->_setLocation != 0;
}

- (void)setSetTitle:(id)a3
{
  NSString *v4;
  NSString *setTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  setTitle = self->_setTitle;
  self->_setTitle = v4;

}

- (BOOL)hasSetTitle
{
  return self->_setTitle != 0;
}

- (void)setTargetEventIdentifier:(id)a3
{
  NSString *v4;
  NSString *targetEventIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  targetEventIdentifier = self->_targetEventIdentifier;
  self->_targetEventIdentifier = v4;

}

- (BOOL)hasTargetEventIdentifier
{
  return self->_targetEventIdentifier != 0;
}

- (void)setUpdateAllOccurrences:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_updateAllOccurrences = a3;
}

- (BOOL)hasUpdateAllOccurrences
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUpdateAllOccurrences:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBUpdateEventIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = self->_addParticipants;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  -[_INPBUpdateEventIntent intentMetadata](self, "intentMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBUpdateEventIntent intentMetadata](self, "intentMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBUpdateEventIntent hasRemoveLocation](self, "hasRemoveLocation"))
    PBDataWriterWriteBOOLField();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = self->_removeParticipants;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
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
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v14);
  }

  -[_INPBUpdateEventIntent setDateTimeRange](self, "setDateTimeRange", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[_INPBUpdateEventIntent setDateTimeRange](self, "setDateTimeRange");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBUpdateEventIntent setLocation](self, "setLocation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[_INPBUpdateEventIntent setLocation](self, "setLocation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBUpdateEventIntent setTitle](self, "setTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    PBDataWriterWriteStringField();
  -[_INPBUpdateEventIntent targetEventIdentifier](self, "targetEventIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    PBDataWriterWriteStringField();
  if (-[_INPBUpdateEventIntent hasUpdateAllOccurrences](self, "hasUpdateAllOccurrences"))
    PBDataWriterWriteBOOLField();

}

- (_INPBUpdateEventIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBUpdateEventIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBUpdateEventIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBUpdateEventIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBUpdateEventIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBUpdateEventIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBUpdateEventIntent *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v5 = -[_INPBUpdateEventIntent init](+[_INPBUpdateEventIntent allocWithZone:](_INPBUpdateEventIntent, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_addParticipants, "copyWithZone:", a3);
  -[_INPBUpdateEventIntent setAddParticipants:](v5, "setAddParticipants:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBUpdateEventIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  if (-[_INPBUpdateEventIntent hasRemoveLocation](self, "hasRemoveLocation"))
    -[_INPBUpdateEventIntent setRemoveLocation:](v5, "setRemoveLocation:", -[_INPBUpdateEventIntent removeLocation](self, "removeLocation"));
  v8 = (void *)-[NSArray copyWithZone:](self->_removeParticipants, "copyWithZone:", a3);
  -[_INPBUpdateEventIntent setRemoveParticipants:](v5, "setRemoveParticipants:", v8);

  v9 = -[_INPBDateTimeRangeValue copyWithZone:](self->_setDateTimeRange, "copyWithZone:", a3);
  -[_INPBUpdateEventIntent setSetDateTimeRange:](v5, "setSetDateTimeRange:", v9);

  v10 = -[_INPBLocation copyWithZone:](self->_setLocation, "copyWithZone:", a3);
  -[_INPBUpdateEventIntent setSetLocation:](v5, "setSetLocation:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_setTitle, "copyWithZone:", a3);
  -[_INPBUpdateEventIntent setSetTitle:](v5, "setSetTitle:", v11);

  v12 = (void *)-[NSString copyWithZone:](self->_targetEventIdentifier, "copyWithZone:", a3);
  -[_INPBUpdateEventIntent setTargetEventIdentifier:](v5, "setTargetEventIdentifier:", v12);

  if (-[_INPBUpdateEventIntent hasUpdateAllOccurrences](self, "hasUpdateAllOccurrences"))
    -[_INPBUpdateEventIntent setUpdateAllOccurrences:](v5, "setUpdateAllOccurrences:", -[_INPBUpdateEventIntent updateAllOccurrences](self, "updateAllOccurrences"));
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
  int v17;
  int removeLocation;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  BOOL v44;
  int v46;
  int updateAllOccurrences;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  -[_INPBUpdateEventIntent addParticipants](self, "addParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addParticipants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_INPBUpdateEventIntent addParticipants](self, "addParticipants");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBUpdateEventIntent addParticipants](self, "addParticipants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addParticipants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_41;
  }
  else
  {

  }
  -[_INPBUpdateEventIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_INPBUpdateEventIntent intentMetadata](self, "intentMetadata");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBUpdateEventIntent intentMetadata](self, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_41;
  }
  else
  {

  }
  v17 = -[_INPBUpdateEventIntent hasRemoveLocation](self, "hasRemoveLocation");
  if (v17 != objc_msgSend(v4, "hasRemoveLocation"))
    goto LABEL_41;
  if (-[_INPBUpdateEventIntent hasRemoveLocation](self, "hasRemoveLocation"))
  {
    if (objc_msgSend(v4, "hasRemoveLocation"))
    {
      removeLocation = self->_removeLocation;
      if (removeLocation != objc_msgSend(v4, "removeLocation"))
        goto LABEL_41;
    }
  }
  -[_INPBUpdateEventIntent removeParticipants](self, "removeParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeParticipants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_INPBUpdateEventIntent removeParticipants](self, "removeParticipants");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBUpdateEventIntent removeParticipants](self, "removeParticipants");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeParticipants");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_41;
  }
  else
  {

  }
  -[_INPBUpdateEventIntent setDateTimeRange](self, "setDateTimeRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDateTimeRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_INPBUpdateEventIntent setDateTimeRange](self, "setDateTimeRange");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_INPBUpdateEventIntent setDateTimeRange](self, "setDateTimeRange");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDateTimeRange");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_41;
  }
  else
  {

  }
  -[_INPBUpdateEventIntent setLocation](self, "setLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_INPBUpdateEventIntent setLocation](self, "setLocation");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[_INPBUpdateEventIntent setLocation](self, "setLocation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_41;
  }
  else
  {

  }
  -[_INPBUpdateEventIntent setTitle](self, "setTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_40;
  -[_INPBUpdateEventIntent setTitle](self, "setTitle");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[_INPBUpdateEventIntent setTitle](self, "setTitle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_41;
  }
  else
  {

  }
  -[_INPBUpdateEventIntent targetEventIdentifier](self, "targetEventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetEventIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_40:

    goto LABEL_41;
  }
  -[_INPBUpdateEventIntent targetEventIdentifier](self, "targetEventIdentifier");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    -[_INPBUpdateEventIntent targetEventIdentifier](self, "targetEventIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetEventIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqual:", v42);

    if (!v43)
      goto LABEL_41;
  }
  else
  {

  }
  v46 = -[_INPBUpdateEventIntent hasUpdateAllOccurrences](self, "hasUpdateAllOccurrences");
  if (v46 == objc_msgSend(v4, "hasUpdateAllOccurrences"))
  {
    if (!-[_INPBUpdateEventIntent hasUpdateAllOccurrences](self, "hasUpdateAllOccurrences")
      || !objc_msgSend(v4, "hasUpdateAllOccurrences")
      || (updateAllOccurrences = self->_updateAllOccurrences,
          updateAllOccurrences == objc_msgSend(v4, "updateAllOccurrences")))
    {
      v44 = 1;
      goto LABEL_42;
    }
  }
LABEL_41:
  v44 = 0;
LABEL_42:

  return v44;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;

  v3 = -[NSArray hash](self->_addParticipants, "hash");
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBUpdateEventIntent hasRemoveLocation](self, "hasRemoveLocation"))
    v5 = 2654435761 * self->_removeLocation;
  else
    v5 = 0;
  v6 = -[NSArray hash](self->_removeParticipants, "hash");
  v7 = -[_INPBDateTimeRangeValue hash](self->_setDateTimeRange, "hash");
  v8 = -[_INPBLocation hash](self->_setLocation, "hash");
  v9 = -[NSString hash](self->_setTitle, "hash");
  v10 = -[NSString hash](self->_targetEventIdentifier, "hash");
  if (-[_INPBUpdateEventIntent hasUpdateAllOccurrences](self, "hasUpdateAllOccurrences"))
    v11 = 2654435761 * self->_updateAllOccurrences;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_addParticipants, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v5 = self->_addParticipants;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v36;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v36 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("addParticipants"));
  }
  -[_INPBUpdateEventIntent intentMetadata](self, "intentMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("intentMetadata"));

  if (-[_INPBUpdateEventIntent hasRemoveLocation](self, "hasRemoveLocation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBUpdateEventIntent removeLocation](self, "removeLocation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("removeLocation"));

  }
  if (-[NSArray count](self->_removeParticipants, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = self->_removeParticipants;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v32;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v19), "dictionaryRepresentation", (_QWORD)v31);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("removeParticipants"));
  }
  -[_INPBUpdateEventIntent setDateTimeRange](self, "setDateTimeRange", (_QWORD)v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dictionaryRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("setDateTimeRange"));

  -[_INPBUpdateEventIntent setLocation](self, "setLocation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dictionaryRepresentation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("setLocation"));

  if (self->_setTitle)
  {
    -[_INPBUpdateEventIntent setTitle](self, "setTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("setTitle"));

  }
  if (self->_targetEventIdentifier)
  {
    -[_INPBUpdateEventIntent targetEventIdentifier](self, "targetEventIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("targetEventIdentifier"));

  }
  if (-[_INPBUpdateEventIntent hasUpdateAllOccurrences](self, "hasUpdateAllOccurrences"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBUpdateEventIntent updateAllOccurrences](self, "updateAllOccurrences"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("updateAllOccurrences"));

  }
  return v3;
}

- (NSArray)addParticipants
{
  return self->_addParticipants;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (BOOL)removeLocation
{
  return self->_removeLocation;
}

- (NSArray)removeParticipants
{
  return self->_removeParticipants;
}

- (_INPBDateTimeRangeValue)setDateTimeRange
{
  return self->_setDateTimeRange;
}

- (_INPBLocation)setLocation
{
  return self->_setLocation;
}

- (NSString)setTitle
{
  return self->_setTitle;
}

- (NSString)targetEventIdentifier
{
  return self->_targetEventIdentifier;
}

- (BOOL)updateAllOccurrences
{
  return self->_updateAllOccurrences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetEventIdentifier, 0);
  objc_storeStrong((id *)&self->_setTitle, 0);
  objc_storeStrong((id *)&self->_setLocation, 0);
  objc_storeStrong((id *)&self->_setDateTimeRange, 0);
  objc_storeStrong((id *)&self->_removeParticipants, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_addParticipants, 0);
}

+ (Class)addParticipantsType
{
  return (Class)objc_opt_class();
}

+ (Class)removeParticipantsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
