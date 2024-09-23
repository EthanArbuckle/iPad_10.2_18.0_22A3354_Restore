@implementation INCallGroupConversation

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[INCallGroupConversation caller](self, "caller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_intents_cacheableObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[INCallGroupConversation otherParticipants](self, "otherParticipants", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "_intents_cacheableObjects");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v3, "count"))
    v12 = v3;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INCallGroupConversation caller](self, "caller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[INCallGroupConversation otherParticipants](self, "otherParticipants", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "_intents_updateContainerWithCache:", v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (INCallGroupConversation)initWithConversationId:(id)a3 caller:(id)a4 otherParticipants:(id)a5 callGroup:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  INCallGroupConversation *v14;
  uint64_t v15;
  NSString *conversationId;
  uint64_t v17;
  INPerson *caller;
  uint64_t v19;
  NSArray *otherParticipants;
  uint64_t v21;
  INCallGroup *callGroup;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)INCallGroupConversation;
  v14 = -[INCallGroupConversation init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    conversationId = v14->_conversationId;
    v14->_conversationId = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    caller = v14->_caller;
    v14->_caller = (INPerson *)v17;

    v19 = objc_msgSend(v12, "copy");
    otherParticipants = v14->_otherParticipants;
    v14->_otherParticipants = (NSArray *)v19;

    v21 = objc_msgSend(v13, "copy");
    callGroup = v14->_callGroup;
    v14->_callGroup = (INCallGroup *)v21;

  }
  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_conversationId, "hash");
  v4 = -[INPerson hash](self->_caller, "hash") ^ v3;
  v5 = -[NSArray hash](self->_otherParticipants, "hash");
  return v4 ^ v5 ^ -[INCallGroup hash](self->_callGroup, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INCallGroupConversation *v4;
  INCallGroupConversation *v5;
  NSString *conversationId;
  INPerson *caller;
  NSArray *otherParticipants;
  INCallGroup *callGroup;
  BOOL v10;

  v4 = (INCallGroupConversation *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      conversationId = self->_conversationId;
      v10 = 0;
      if (conversationId == v5->_conversationId || -[NSString isEqual:](conversationId, "isEqual:"))
      {
        caller = self->_caller;
        if (caller == v5->_caller || -[INPerson isEqual:](caller, "isEqual:"))
        {
          otherParticipants = self->_otherParticipants;
          if (otherParticipants == v5->_otherParticipants
            || -[NSArray isEqual:](otherParticipants, "isEqual:"))
          {
            callGroup = self->_callGroup;
            if (callGroup == v5->_callGroup || -[INCallGroup isEqual:](callGroup, "isEqual:"))
              v10 = 1;
          }
        }
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (INCallGroupConversation)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  INCallGroupConversation *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("conversationId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("caller"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v12, CFSTR("otherParticipants"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callGroup"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[INCallGroupConversation initWithConversationId:caller:otherParticipants:callGroup:](self, "initWithConversationId:caller:otherParticipants:callGroup:", v8, v9, v13, v14);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *conversationId;
  id v5;

  conversationId = self->_conversationId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", conversationId, CFSTR("conversationId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_caller, CFSTR("caller"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_otherParticipants, CFSTR("otherParticipants"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callGroup, CFSTR("callGroup"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_conversationId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("conversationId"));

  objc_msgSend(v6, "encodeObject:", self->_caller);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("caller"));

  objc_msgSend(v6, "encodeObject:", self->_otherParticipants);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("otherParticipants"));

  objc_msgSend(v6, "encodeObject:", self->_callGroup);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("callGroup"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INCallGroupConversation descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INCallGroupConversation;
  -[INCallGroupConversation description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCallGroupConversation _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *conversationId;
  void *v4;
  INPerson *caller;
  void *v6;
  NSArray *otherParticipants;
  void *v8;
  INCallGroup *callGroup;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("conversationId");
  conversationId = self->_conversationId;
  v4 = conversationId;
  if (!conversationId)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v4;
  v13[1] = CFSTR("caller");
  caller = self->_caller;
  v6 = caller;
  if (!caller)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v6;
  v13[2] = CFSTR("otherParticipants");
  otherParticipants = self->_otherParticipants;
  v8 = otherParticipants;
  if (!otherParticipants)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v8;
  v13[3] = CFSTR("callGroup");
  callGroup = self->_callGroup;
  v10 = callGroup;
  if (!callGroup)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (callGroup)
  {
    if (otherParticipants)
      goto LABEL_11;
  }
  else
  {

    if (otherParticipants)
    {
LABEL_11:
      if (caller)
        goto LABEL_12;
LABEL_16:

      if (conversationId)
        return v11;
LABEL_17:

      return v11;
    }
  }

  if (!caller)
    goto LABEL_16;
LABEL_12:
  if (!conversationId)
    goto LABEL_17;
  return v11;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (INPerson)caller
{
  return self->_caller;
}

- (NSArray)otherParticipants
{
  return self->_otherParticipants;
}

- (INCallGroup)callGroup
{
  return self->_callGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callGroup, 0);
  objc_storeStrong((id *)&self->_otherParticipants, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("conversationId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("caller"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("otherParticipants"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("callGroup"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConversationId:caller:otherParticipants:callGroup:", v9, v12, v15, v18);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
