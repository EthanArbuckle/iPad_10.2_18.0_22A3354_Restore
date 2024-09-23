@implementation INCallRecordFilter

- (INCallRecordFilter)initWithParticipants:(NSArray *)participants callTypes:(INCallRecordTypeOptions)callTypes callCapability:(INCallCapability)callCapability
{
  NSArray *v8;
  INCallRecordFilter *v9;
  uint64_t v10;
  NSArray *v11;
  objc_super v13;

  v8 = participants;
  v13.receiver = self;
  v13.super_class = (Class)INCallRecordFilter;
  v9 = -[INCallRecordFilter init](&v13, sel_init);
  if (v9)
  {
    v10 = -[NSArray copy](v8, "copy");
    v11 = v9->_participants;
    v9->_participants = (NSArray *)v10;

    v9->_callTypes = callTypes;
    v9->_callCapability = callCapability;
  }

  return v9;
}

- (INCallRecordFilter)initWithParticipants:(id)a3 callTypes:(unint64_t)a4 callCapability:(int64_t)a5 preferredCallProvider:(int64_t)a6
{
  id v10;
  INCallRecordFilter *v11;
  uint64_t v12;
  NSArray *participants;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INCallRecordFilter;
  v11 = -[INCallRecordFilter init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    participants = v11->_participants;
    v11->_participants = (NSArray *)v12;

    v11->_callTypes = a4;
    v11->_callCapability = a5;
    v11->_preferredCallProvider = a6;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[NSArray hash](self->_participants, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_callTypes);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_callCapability);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_preferredCallProvider);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  INCallRecordFilter *v4;
  INCallRecordFilter *v5;
  NSArray *participants;
  BOOL v7;

  v4 = (INCallRecordFilter *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      participants = self->_participants;
      v7 = (participants == v5->_participants || -[NSArray isEqual:](participants, "isEqual:"))
        && self->_callTypes == v5->_callTypes
        && self->_callCapability == v5->_callCapability
        && self->_preferredCallProvider == v5->_preferredCallProvider;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (INCallRecordFilter)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  INCallRecordFilter *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("participants"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("callTypes"));
  v10 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("callCapability"));
  v11 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("preferredCallProvider"));

  v12 = -[INCallRecordFilter initWithParticipants:callTypes:callCapability:preferredCallProvider:](self, "initWithParticipants:callTypes:callCapability:preferredCallProvider:", v8, v9, v10, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *participants;
  id v5;

  participants = self->_participants;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", participants, CFSTR("participants"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_callTypes, CFSTR("callTypes"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_callCapability, CFSTR("callCapability"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preferredCallProvider, CFSTR("preferredCallProvider"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t callCapability;
  const __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  unint64_t v14;
  __CFString *v15;
  __CFString *v16;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_participants);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("participants"));
  INCallRecordTypeOptionsGetNames(self->_callTypes);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("callTypes"));

  callCapability = self->_callCapability;
  v11 = CFSTR("unknown");
  if (callCapability == 2)
    v11 = CFSTR("videoCall");
  if (callCapability == 1)
    v12 = CFSTR("audioCall");
  else
    v12 = (__CFString *)v11;
  v13 = v12;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("callCapability"));

  v14 = self->_preferredCallProvider - 1;
  if (v14 > 2)
    v15 = CFSTR("unknown");
  else
    v15 = off_1E228E138[v14];
  v16 = v15;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, CFSTR("preferredCallProvider"));

  return v7;
}

- (NSString)description
{
  return (NSString *)-[INCallRecordFilter descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INCallRecordFilter;
  -[INCallRecordFilter description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCallRecordFilter _dictionaryRepresentation](self, "_dictionaryRepresentation");
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
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("participants");
  participants = self->_participants;
  v4 = participants;
  if (!participants)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = v4;
  v10[1] = CFSTR("callTypes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_callTypes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("callCapability");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_callCapability);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v10[3] = CFSTR("preferredCallProvider");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_preferredCallProvider);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!participants)
  return v8;
}

- (NSArray)participants
{
  return self->_participants;
}

- (INCallRecordTypeOptions)callTypes
{
  return self->_callTypes;
}

- (INCallCapability)callCapability
{
  return self->_callCapability;
}

- (int64_t)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (void).cxx_destruct
{
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
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

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

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("callTypes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v15 = v13;

    v16 = INCallRecordTypeOptionsWithNames(v15);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("callCapability"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = INCallCapabilityWithString(v17);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("preferredCallProvider"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = INPreferredCallProviderWithString(v19);

    v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithParticipants:callTypes:callCapability:preferredCallProvider:", v11, v16, v18, v20);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

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
  -[INCallRecordFilter participants](self, "participants", 0);
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
  -[INCallRecordFilter participants](self, "participants", 0);
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

@end
