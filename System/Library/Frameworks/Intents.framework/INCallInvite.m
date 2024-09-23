@implementation INCallInvite

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[INCallInvite participants](self, "participants", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "_intents_cacheableObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v10 = v3;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4;
  void *v5;
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[INCallInvite participants](self, "participants", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_intents_updateContainerWithCache:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (INCallInvite)initWithParticipants:(id)a3 inviteType:(int64_t)a4 callURL:(id)a5
{
  id v8;
  id v9;
  INCallInvite *v10;
  uint64_t v11;
  NSArray *participants;
  uint64_t v13;
  NSURL *callURL;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)INCallInvite;
  v10 = -[INCallInvite init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    participants = v10->_participants;
    v10->_participants = (NSArray *)v11;

    v10->_inviteType = a4;
    v13 = objc_msgSend(v9, "copy");
    callURL = v10->_callURL;
    v10->_callURL = (NSURL *)v13;

  }
  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[NSArray hash](self->_participants, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_inviteType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ v3 ^ -[NSURL hash](self->_callURL, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  INCallInvite *v4;
  INCallInvite *v5;
  NSArray *participants;
  NSURL *callURL;
  BOOL v8;

  v4 = (INCallInvite *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      participants = self->_participants;
      v8 = 0;
      if ((participants == v5->_participants || -[NSArray isEqual:](participants, "isEqual:"))
        && self->_inviteType == v5->_inviteType)
      {
        callURL = self->_callURL;
        if (callURL == v5->_callURL || -[NSURL isEqual:](callURL, "isEqual:"))
          v8 = 1;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (INCallInvite)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  INCallInvite *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("participants"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("inviteType"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[INCallInvite initWithParticipants:inviteType:callURL:](self, "initWithParticipants:inviteType:callURL:", v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *participants;
  id v5;

  participants = self->_participants;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", participants, CFSTR("participants"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_inviteType, CFSTR("inviteType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callURL, CFSTR("callURL"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_participants);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("participants"));

  v9 = self->_inviteType - 1;
  if (v9 > 2)
    v10 = CFSTR("unknown");
  else
    v10 = off_1E22954B0[v9];
  v11 = v10;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("inviteType"));

  objc_msgSend(v6, "encodeObject:", self->_callURL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("callURL"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INCallInvite descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INCallInvite;
  -[INCallInvite description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCallInvite _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSArray *participants;
  void *v4;
  void *v5;
  NSURL *callURL;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("participants");
  participants = self->_participants;
  v4 = participants;
  if (!participants)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = v4;
  v10[1] = CFSTR("inviteType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_inviteType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("callURL");
  callURL = self->_callURL;
  v7 = callURL;
  if (!callURL)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!callURL)

  if (!participants)
  return v8;
}

- (NSArray)participants
{
  return self->_participants;
}

- (int64_t)inviteType
{
  return self->_inviteType;
}

- (NSURL)callURL
{
  return self->_callURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callURL, 0);
  objc_storeStrong((id *)&self->_participants, 0);
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
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("participants"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inviteType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = INCallInviteTypeWithString(v12);

    v14 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("callURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithParticipants:inviteType:callURL:", v11, v13, v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
