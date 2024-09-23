@implementation _INPBCallGroupConversationFilter

- (void)setCallGroup:(id)a3
{
  objc_storeStrong((id *)&self->_callGroup, a3);
}

- (BOOL)hasCallGroup
{
  return self->_callGroup != 0;
}

- (void)setCaller:(id)a3
{
  objc_storeStrong((id *)&self->_caller, a3);
}

- (BOOL)hasCaller
{
  return self->_caller != 0;
}

- (void)setMatchCallerAndParticipantsExactly:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_matchCallerAndParticipantsExactly = a3;
}

- (BOOL)hasMatchCallerAndParticipantsExactly
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMatchCallerAndParticipantsExactly:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setParticipants:(id)a3
{
  NSArray *v4;
  NSArray *participants;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  participants = self->_participants;
  self->_participants = v4;

}

- (void)clearParticipants
{
  -[NSArray removeAllObjects](self->_participants, "removeAllObjects");
}

- (void)addParticipants:(id)a3
{
  id v4;
  NSArray *participants;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  participants = self->_participants;
  v8 = v4;
  if (!participants)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_participants;
    self->_participants = v6;

    v4 = v8;
    participants = self->_participants;
  }
  -[NSArray addObject:](participants, "addObject:", v4);

}

- (unint64_t)participantsCount
{
  return -[NSArray count](self->_participants, "count");
}

- (id)participantsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_participants, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCallGroupConversationFilterReadFrom(self, (uint64_t)a3);
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
  -[_INPBCallGroupConversationFilter callGroup](self, "callGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBCallGroupConversationFilter callGroup](self, "callGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBCallGroupConversationFilter caller](self, "caller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBCallGroupConversationFilter caller](self, "caller");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBCallGroupConversationFilter hasMatchCallerAndParticipantsExactly](self, "hasMatchCallerAndParticipantsExactly"))
  {
    PBDataWriterWriteBOOLField();
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_participants;
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

- (_INPBCallGroupConversationFilter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCallGroupConversationFilter *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCallGroupConversationFilter *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCallGroupConversationFilter *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCallGroupConversationFilter initWithData:](self, "initWithData:", v6);

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
  -[_INPBCallGroupConversationFilter data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCallGroupConversationFilter *v5;
  id v6;
  id v7;
  void *v8;

  v5 = -[_INPBCallGroupConversationFilter init](+[_INPBCallGroupConversationFilter allocWithZone:](_INPBCallGroupConversationFilter, "allocWithZone:"), "init");
  v6 = -[_INPBCallGroup copyWithZone:](self->_callGroup, "copyWithZone:", a3);
  -[_INPBCallGroupConversationFilter setCallGroup:](v5, "setCallGroup:", v6);

  v7 = -[_INPBContact copyWithZone:](self->_caller, "copyWithZone:", a3);
  -[_INPBCallGroupConversationFilter setCaller:](v5, "setCaller:", v7);

  if (-[_INPBCallGroupConversationFilter hasMatchCallerAndParticipantsExactly](self, "hasMatchCallerAndParticipantsExactly"))
  {
    -[_INPBCallGroupConversationFilter setMatchCallerAndParticipantsExactly:](v5, "setMatchCallerAndParticipantsExactly:", -[_INPBCallGroupConversationFilter matchCallerAndParticipantsExactly](self, "matchCallerAndParticipantsExactly"));
  }
  v8 = (void *)-[NSArray copyWithZone:](self->_participants, "copyWithZone:", a3);
  -[_INPBCallGroupConversationFilter setParticipants:](v5, "setParticipants:", v8);

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
  int matchCallerAndParticipantsExactly;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[_INPBCallGroupConversationFilter callGroup](self, "callGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_20;
  -[_INPBCallGroupConversationFilter callGroup](self, "callGroup");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBCallGroupConversationFilter callGroup](self, "callGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBCallGroupConversationFilter caller](self, "caller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "caller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_20;
  -[_INPBCallGroupConversationFilter caller](self, "caller");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBCallGroupConversationFilter caller](self, "caller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "caller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_21;
  }
  else
  {

  }
  v17 = -[_INPBCallGroupConversationFilter hasMatchCallerAndParticipantsExactly](self, "hasMatchCallerAndParticipantsExactly");
  if (v17 != objc_msgSend(v4, "hasMatchCallerAndParticipantsExactly"))
    goto LABEL_21;
  if (-[_INPBCallGroupConversationFilter hasMatchCallerAndParticipantsExactly](self, "hasMatchCallerAndParticipantsExactly"))
  {
    if (objc_msgSend(v4, "hasMatchCallerAndParticipantsExactly"))
    {
      matchCallerAndParticipantsExactly = self->_matchCallerAndParticipantsExactly;
      if (matchCallerAndParticipantsExactly != objc_msgSend(v4, "matchCallerAndParticipantsExactly"))
        goto LABEL_21;
    }
  }
  -[_INPBCallGroupConversationFilter participants](self, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBCallGroupConversationFilter participants](self, "participants");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {

LABEL_24:
      v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    -[_INPBCallGroupConversationFilter participants](self, "participants");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "participants");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if ((v23 & 1) != 0)
      goto LABEL_24;
  }
  else
  {
LABEL_20:

  }
LABEL_21:
  v24 = 0;
LABEL_22:

  return v24;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[_INPBCallGroup hash](self->_callGroup, "hash");
  v4 = -[_INPBContact hash](self->_caller, "hash");
  if (-[_INPBCallGroupConversationFilter hasMatchCallerAndParticipantsExactly](self, "hasMatchCallerAndParticipantsExactly"))
  {
    v5 = 2654435761 * self->_matchCallerAndParticipantsExactly;
  }
  else
  {
    v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ -[NSArray hash](self->_participants, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBCallGroupConversationFilter callGroup](self, "callGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("callGroup"));

  -[_INPBCallGroupConversationFilter caller](self, "caller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("caller"));

  if (-[_INPBCallGroupConversationFilter hasMatchCallerAndParticipantsExactly](self, "hasMatchCallerAndParticipantsExactly"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBCallGroupConversationFilter matchCallerAndParticipantsExactly](self, "matchCallerAndParticipantsExactly"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("matchCallerAndParticipantsExactly"));

  }
  if (-[NSArray count](self->_participants, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_participants;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "dictionaryRepresentation", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("participants"));
  }
  return v3;
}

- (_INPBCallGroup)callGroup
{
  return self->_callGroup;
}

- (_INPBContact)caller
{
  return self->_caller;
}

- (BOOL)matchCallerAndParticipantsExactly
{
  return self->_matchCallerAndParticipantsExactly;
}

- (NSArray)participants
{
  return self->_participants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_callGroup, 0);
}

+ (Class)participantsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
