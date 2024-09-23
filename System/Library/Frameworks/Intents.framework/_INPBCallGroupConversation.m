@implementation _INPBCallGroupConversation

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

- (void)setConversationId:(id)a3
{
  NSString *v4;
  NSString *conversationId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  conversationId = self->_conversationId;
  self->_conversationId = v4;

}

- (BOOL)hasConversationId
{
  return self->_conversationId != 0;
}

- (void)setOtherParticipants:(id)a3
{
  NSArray *v4;
  NSArray *otherParticipants;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  otherParticipants = self->_otherParticipants;
  self->_otherParticipants = v4;

}

- (void)clearOtherParticipants
{
  -[NSArray removeAllObjects](self->_otherParticipants, "removeAllObjects");
}

- (void)addOtherParticipants:(id)a3
{
  id v4;
  NSArray *otherParticipants;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  otherParticipants = self->_otherParticipants;
  v8 = v4;
  if (!otherParticipants)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_otherParticipants;
    self->_otherParticipants = v6;

    v4 = v8;
    otherParticipants = self->_otherParticipants;
  }
  -[NSArray addObject:](otherParticipants, "addObject:", v4);

}

- (unint64_t)otherParticipantsCount
{
  return -[NSArray count](self->_otherParticipants, "count");
}

- (id)otherParticipantsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_otherParticipants, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCallGroupConversationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBCallGroupConversation callGroup](self, "callGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBCallGroupConversation callGroup](self, "callGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBCallGroupConversation caller](self, "caller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBCallGroupConversation caller](self, "caller");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBCallGroupConversation conversationId](self, "conversationId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_otherParticipants;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (_INPBCallGroupConversation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCallGroupConversation *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCallGroupConversation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCallGroupConversation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCallGroupConversation initWithData:](self, "initWithData:", v6);

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
  -[_INPBCallGroupConversation data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCallGroupConversation *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = -[_INPBCallGroupConversation init](+[_INPBCallGroupConversation allocWithZone:](_INPBCallGroupConversation, "allocWithZone:"), "init");
  v6 = -[_INPBCallGroup copyWithZone:](self->_callGroup, "copyWithZone:", a3);
  -[_INPBCallGroupConversation setCallGroup:](v5, "setCallGroup:", v6);

  v7 = -[_INPBContactValue copyWithZone:](self->_caller, "copyWithZone:", a3);
  -[_INPBCallGroupConversation setCaller:](v5, "setCaller:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_conversationId, "copyWithZone:", a3);
  -[_INPBCallGroupConversation setConversationId:](v5, "setConversationId:", v8);

  v9 = (void *)-[NSArray copyWithZone:](self->_otherParticipants, "copyWithZone:", a3);
  -[_INPBCallGroupConversation setOtherParticipants:](v5, "setOtherParticipants:", v9);

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
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_INPBCallGroupConversation callGroup](self, "callGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBCallGroupConversation callGroup](self, "callGroup");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBCallGroupConversation callGroup](self, "callGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBCallGroupConversation caller](self, "caller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "caller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBCallGroupConversation caller](self, "caller");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBCallGroupConversation caller](self, "caller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "caller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBCallGroupConversation conversationId](self, "conversationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBCallGroupConversation conversationId](self, "conversationId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBCallGroupConversation conversationId](self, "conversationId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBCallGroupConversation otherParticipants](self, "otherParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "otherParticipants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBCallGroupConversation otherParticipants](self, "otherParticipants");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_INPBCallGroupConversation otherParticipants](self, "otherParticipants");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "otherParticipants");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;

  v3 = -[_INPBCallGroup hash](self->_callGroup, "hash");
  v4 = -[_INPBContactValue hash](self->_caller, "hash") ^ v3;
  v5 = -[NSString hash](self->_conversationId, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_otherParticipants, "hash");
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
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBCallGroupConversation callGroup](self, "callGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("callGroup"));

  -[_INPBCallGroupConversation caller](self, "caller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("caller"));

  if (self->_conversationId)
  {
    -[_INPBCallGroupConversation conversationId](self, "conversationId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("conversationId"));

  }
  if (-[NSArray count](self->_otherParticipants, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = self->_otherParticipants;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "dictionaryRepresentation", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("otherParticipants"));
  }
  return v3;
}

- (_INPBCallGroup)callGroup
{
  return self->_callGroup;
}

- (_INPBContactValue)caller
{
  return self->_caller;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (NSArray)otherParticipants
{
  return self->_otherParticipants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherParticipants, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_callGroup, 0);
}

+ (Class)otherParticipantsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
