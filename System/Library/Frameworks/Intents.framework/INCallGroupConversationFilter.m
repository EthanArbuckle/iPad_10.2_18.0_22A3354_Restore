@implementation INCallGroupConversationFilter

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
  -[INCallGroupConversationFilter caller](self, "caller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_intents_cacheableObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[INCallGroupConversationFilter participants](self, "participants", 0);
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
  -[INCallGroupConversationFilter caller](self, "caller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[INCallGroupConversationFilter participants](self, "participants", 0);
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

- (INCallGroupConversationFilter)initWithCaller:(id)a3 participants:(id)a4 matchCallerAndParticipantsExactly:(id)a5 callGroup:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  INCallGroupConversationFilter *v14;
  uint64_t v15;
  INPerson *caller;
  uint64_t v17;
  NSArray *participants;
  uint64_t v19;
  NSNumber *matchCallerAndParticipantsExactly;
  uint64_t v21;
  INCallGroup *callGroup;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)INCallGroupConversationFilter;
  v14 = -[INCallGroupConversationFilter init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    caller = v14->_caller;
    v14->_caller = (INPerson *)v15;

    v17 = objc_msgSend(v11, "copy");
    participants = v14->_participants;
    v14->_participants = (NSArray *)v17;

    v19 = objc_msgSend(v12, "copy");
    matchCallerAndParticipantsExactly = v14->_matchCallerAndParticipantsExactly;
    v14->_matchCallerAndParticipantsExactly = (NSNumber *)v19;

    v21 = objc_msgSend(v13, "copy");
    callGroup = v14->_callGroup;
    v14->_callGroup = (INCallGroup *)v21;

  }
  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[INPerson hash](self->_caller, "hash");
  v4 = -[NSArray hash](self->_participants, "hash") ^ v3;
  v5 = -[NSNumber hash](self->_matchCallerAndParticipantsExactly, "hash");
  return v4 ^ v5 ^ -[INCallGroup hash](self->_callGroup, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INCallGroupConversationFilter *v4;
  INCallGroupConversationFilter *v5;
  INPerson *caller;
  NSArray *participants;
  NSNumber *matchCallerAndParticipantsExactly;
  INCallGroup *callGroup;
  BOOL v10;

  v4 = (INCallGroupConversationFilter *)a3;
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
      caller = self->_caller;
      v10 = 0;
      if (caller == v5->_caller || -[INPerson isEqual:](caller, "isEqual:"))
      {
        participants = self->_participants;
        if (participants == v5->_participants || -[NSArray isEqual:](participants, "isEqual:"))
        {
          matchCallerAndParticipantsExactly = self->_matchCallerAndParticipantsExactly;
          if (matchCallerAndParticipantsExactly == v5->_matchCallerAndParticipantsExactly
            || -[NSNumber isEqual:](matchCallerAndParticipantsExactly, "isEqual:"))
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

- (INCallGroupConversationFilter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  INCallGroupConversationFilter *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("caller"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("participants"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchCallerAndParticipantsExactly"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callGroup"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[INCallGroupConversationFilter initWithCaller:participants:matchCallerAndParticipantsExactly:callGroup:](self, "initWithCaller:participants:matchCallerAndParticipantsExactly:callGroup:", v5, v9, v10, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  INPerson *caller;
  id v5;

  caller = self->_caller;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", caller, CFSTR("caller"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_participants, CFSTR("participants"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchCallerAndParticipantsExactly, CFSTR("matchCallerAndParticipantsExactly"));
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
  objc_msgSend(v6, "encodeObject:", self->_caller);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("caller"));

  objc_msgSend(v6, "encodeObject:", self->_participants);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("participants"));

  objc_msgSend(v6, "encodeObject:", self->_matchCallerAndParticipantsExactly);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("matchCallerAndParticipantsExactly"));

  objc_msgSend(v6, "encodeObject:", self->_callGroup);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("callGroup"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INCallGroupConversationFilter descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INCallGroupConversationFilter;
  -[INCallGroupConversationFilter description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCallGroupConversationFilter _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INPerson *caller;
  void *v4;
  NSArray *participants;
  void *v6;
  NSNumber *matchCallerAndParticipantsExactly;
  void *v8;
  INCallGroup *callGroup;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("caller");
  caller = self->_caller;
  v4 = caller;
  if (!caller)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v4;
  v13[1] = CFSTR("participants");
  participants = self->_participants;
  v6 = participants;
  if (!participants)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v6;
  v13[2] = CFSTR("matchCallerAndParticipantsExactly");
  matchCallerAndParticipantsExactly = self->_matchCallerAndParticipantsExactly;
  v8 = matchCallerAndParticipantsExactly;
  if (!matchCallerAndParticipantsExactly)
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
    if (matchCallerAndParticipantsExactly)
      goto LABEL_11;
  }
  else
  {

    if (matchCallerAndParticipantsExactly)
    {
LABEL_11:
      if (participants)
        goto LABEL_12;
LABEL_16:

      if (caller)
        return v11;
LABEL_17:

      return v11;
    }
  }

  if (!participants)
    goto LABEL_16;
LABEL_12:
  if (!caller)
    goto LABEL_17;
  return v11;
}

- (INPerson)caller
{
  return self->_caller;
}

- (NSArray)participants
{
  return self->_participants;
}

- (NSNumber)matchCallerAndParticipantsExactly
{
  return self->_matchCallerAndParticipantsExactly;
}

- (INCallGroup)callGroup
{
  return self->_callGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callGroup, 0);
  objc_storeStrong((id *)&self->_matchCallerAndParticipantsExactly, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_caller, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
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
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("caller"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("participants"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("matchCallerAndParticipantsExactly"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("callGroup"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCaller:participants:matchCallerAndParticipantsExactly:callGroup:", v11, v14, v15, v18);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
