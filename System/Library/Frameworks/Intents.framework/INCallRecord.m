@implementation INCallRecord

- (INCallRecord)initWithIdentifier:(id)a3 dateCreated:(id)a4 caller:(id)a5 callRecordType:(int64_t)a6 callCapability:(int64_t)a7 callDuration:(id)a8 unseen:(id)a9 preferredCallProvider:(int64_t)a10 numberOfCalls:(id)a11 providerId:(id)a12
{
  return -[INCallRecord initWithIdentifier:dateCreated:caller:callRecordType:callCapability:callDuration:unseen:preferredCallProvider:numberOfCalls:providerId:providerBundleId:isCallerIdBlocked:](self, "initWithIdentifier:dateCreated:caller:callRecordType:callCapability:callDuration:unseen:preferredCallProvider:numberOfCalls:providerId:providerBundleId:isCallerIdBlocked:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, 0);
}

- (INCallRecord)initWithIdentifier:(id)a3 dateCreated:(id)a4 caller:(id)a5 callRecordType:(int64_t)a6 callCapability:(int64_t)a7 callDuration:(id)a8 unseen:(id)a9 preferredCallProvider:(int64_t)a10 numberOfCalls:(id)a11 providerId:(id)a12 providerBundleId:(id)a13 isCallerIdBlocked:(id)a14
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  INCallRecord *v28;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a8;
  v20 = a9;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v24 = a14;
  if (a5)
  {
    v33[0] = a5;
    v25 = (void *)MEMORY[0x1E0C99D20];
    v26 = a5;
    objc_msgSend(v25, "arrayWithObjects:count:", v33, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }
  v28 = -[INCallRecord initWithIdentifier:dateCreated:callRecordType:callCapability:callDuration:unseen:preferredCallProvider:participants:numberOfCalls:providerId:providerBundleId:isCallerIdBlocked:](self, "initWithIdentifier:dateCreated:callRecordType:callCapability:callDuration:unseen:preferredCallProvider:participants:numberOfCalls:providerId:providerBundleId:isCallerIdBlocked:", v17, v18, a6, a7, v19, v20, a10, v27, v21, v22, v23, v24);

  return v28;
}

- (INCallRecord)initWithIdentifier:(id)a3 dateCreated:(id)a4 caller:(id)a5 callRecordType:(int64_t)a6 callCapability:(int64_t)a7 callDuration:(id)a8 unseen:(id)a9 numberOfCalls:(id)a10 isCallerIdBlocked:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  INCallRecord *v23;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  if (a5)
  {
    v27[0] = a5;
    v21 = (void *)MEMORY[0x1E0C99D20];
    v22 = a5;
    objc_msgSend(v21, "arrayWithObjects:count:", v27, 1);
    a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v23 = -[INCallRecord initWithIdentifier:dateCreated:callRecordType:callCapability:callDuration:unseen:participants:numberOfCalls:isCallerIdBlocked:](self, "initWithIdentifier:dateCreated:callRecordType:callCapability:callDuration:unseen:participants:numberOfCalls:isCallerIdBlocked:", v15, v16, a6, a7, v17, v18, a5, v19, v20);

  return v23;
}

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
  -[INCallRecord(Deprecated) caller](self, "caller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_intents_cacheableObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[INCallRecord participants](self, "participants", 0);
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
  -[INCallRecord(Deprecated) caller](self, "caller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[INCallRecord participants](self, "participants", 0);
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

- (INCallRecord)initWithIdentifier:(NSString *)identifier dateCreated:(NSDate *)dateCreated callRecordType:(INCallRecordType)callRecordType callCapability:(INCallCapability)callCapability callDuration:(NSNumber *)callDuration unseen:(NSNumber *)unseen participants:(NSArray *)participants numberOfCalls:(NSNumber *)numberOfCalls isCallerIdBlocked:(NSNumber *)isCallerIdBlocked
{
  NSString *v17;
  NSDate *v18;
  NSNumber *v19;
  NSNumber *v20;
  NSArray *v21;
  NSNumber *v22;
  NSNumber *v23;
  INCallRecord *v24;
  uint64_t v25;
  NSString *v26;
  uint64_t v27;
  NSDate *v28;
  uint64_t v29;
  NSNumber *v30;
  uint64_t v31;
  NSNumber *v32;
  uint64_t v33;
  NSNumber *v34;
  uint64_t v35;
  NSNumber *v36;
  uint64_t v37;
  NSArray *v38;
  objc_super v40;

  v17 = identifier;
  v18 = dateCreated;
  v19 = callDuration;
  v20 = unseen;
  v21 = participants;
  v22 = numberOfCalls;
  v23 = isCallerIdBlocked;
  v40.receiver = self;
  v40.super_class = (Class)INCallRecord;
  v24 = -[INCallRecord init](&v40, sel_init);
  if (v24)
  {
    v25 = -[NSString copy](v17, "copy");
    v26 = v24->_identifier;
    v24->_identifier = (NSString *)v25;

    v27 = -[NSDate copy](v18, "copy");
    v28 = v24->_dateCreated;
    v24->_dateCreated = (NSDate *)v27;

    v24->_callRecordType = callRecordType;
    v29 = -[NSNumber copy](v19, "copy");
    v30 = v24->_callDuration;
    v24->_callDuration = (NSNumber *)v29;

    v31 = -[NSNumber copy](v20, "copy");
    v32 = v24->_unseen;
    v24->_unseen = (NSNumber *)v31;

    v24->_callCapability = callCapability;
    v33 = -[NSNumber copy](v22, "copy");
    v34 = v24->_numberOfCalls;
    v24->_numberOfCalls = (NSNumber *)v33;

    v35 = -[NSNumber copy](v23, "copy");
    v36 = v24->_isCallerIdBlocked;
    v24->_isCallerIdBlocked = (NSNumber *)v35;

    v37 = -[NSArray copy](v21, "copy");
    v38 = v24->_participants;
    v24->_participants = (NSArray *)v37;

  }
  return v24;
}

- (INCallRecord)initWithIdentifier:(id)a3 dateCreated:(id)a4 callRecordType:(int64_t)a5 callCapability:(int64_t)a6 callDuration:(id)a7 unseen:(id)a8 preferredCallProvider:(int64_t)a9 participants:(id)a10 numberOfCalls:(id)a11 providerId:(id)a12 providerBundleId:(id)a13 isCallerIdBlocked:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  INCallRecord *v26;
  uint64_t v27;
  NSString *identifier;
  uint64_t v29;
  NSDate *dateCreated;
  uint64_t v31;
  NSNumber *callDuration;
  uint64_t v33;
  NSNumber *unseen;
  uint64_t v35;
  NSNumber *numberOfCalls;
  uint64_t v37;
  NSString *providerId;
  uint64_t v39;
  NSString *providerBundleId;
  uint64_t v41;
  NSNumber *isCallerIdBlocked;
  uint64_t v43;
  NSArray *participants;
  id v47;
  id v48;
  objc_super v49;

  v48 = a3;
  v47 = a4;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v25 = a14;
  v49.receiver = self;
  v49.super_class = (Class)INCallRecord;
  v26 = -[INCallRecord init](&v49, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v48, "copy");
    identifier = v26->_identifier;
    v26->_identifier = (NSString *)v27;

    v29 = objc_msgSend(v47, "copy");
    dateCreated = v26->_dateCreated;
    v26->_dateCreated = (NSDate *)v29;

    v26->_callRecordType = a5;
    v31 = objc_msgSend(v19, "copy");
    callDuration = v26->_callDuration;
    v26->_callDuration = (NSNumber *)v31;

    v33 = objc_msgSend(v20, "copy");
    unseen = v26->_unseen;
    v26->_unseen = (NSNumber *)v33;

    v26->_callCapability = a6;
    v35 = objc_msgSend(v22, "copy");
    numberOfCalls = v26->_numberOfCalls;
    v26->_numberOfCalls = (NSNumber *)v35;

    v26->_preferredCallProvider = a9;
    v37 = objc_msgSend(v23, "copy");
    providerId = v26->_providerId;
    v26->_providerId = (NSString *)v37;

    v39 = objc_msgSend(v24, "copy");
    providerBundleId = v26->_providerBundleId;
    v26->_providerBundleId = (NSString *)v39;

    v41 = objc_msgSend(v25, "copy");
    isCallerIdBlocked = v26->_isCallerIdBlocked;
    v26->_isCallerIdBlocked = (NSNumber *)v41;

    v43 = objc_msgSend(v21, "copy");
    participants = v26->_participants;
    v26->_participants = (NSArray *)v43;

  }
  return v26;
}

- (INCallRecord)initWithIdentifier:(NSString *)identifier dateCreated:(NSDate *)dateCreated callRecordType:(INCallRecordType)callRecordType callCapability:(INCallCapability)callCapability callDuration:(NSNumber *)callDuration unseen:(NSNumber *)unseen
{
  return -[INCallRecord initWithIdentifier:dateCreated:callRecordType:callCapability:callDuration:unseen:preferredCallProvider:participants:numberOfCalls:providerId:providerBundleId:isCallerIdBlocked:](self, "initWithIdentifier:dateCreated:callRecordType:callCapability:callDuration:unseen:preferredCallProvider:participants:numberOfCalls:providerId:providerBundleId:isCallerIdBlocked:", identifier, dateCreated, callRecordType, callCapability, callDuration, unseen, 0, 0, 0, 0, 0, 0);
}

- (INCallRecord)initWithIdentifier:(NSString *)identifier dateCreated:(NSDate *)dateCreated callRecordType:(INCallRecordType)callRecordType callCapability:(INCallCapability)callCapability callDuration:(NSNumber *)callDuration unseen:(NSNumber *)unseen numberOfCalls:(NSNumber *)numberOfCalls
{
  return -[INCallRecord initWithIdentifier:dateCreated:callRecordType:callCapability:callDuration:unseen:preferredCallProvider:participants:numberOfCalls:providerId:providerBundleId:isCallerIdBlocked:](self, "initWithIdentifier:dateCreated:callRecordType:callCapability:callDuration:unseen:preferredCallProvider:participants:numberOfCalls:providerId:providerBundleId:isCallerIdBlocked:", identifier, dateCreated, callRecordType, callCapability, callDuration, unseen, 0, 0, numberOfCalls, 0, 0, 0);
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  unint64_t v17;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSDate hash](self->_dateCreated, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_callRecordType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = v4 ^ -[NSNumber hash](self->_callDuration, "hash") ^ v6;
  v8 = -[NSNumber hash](self->_unseen, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_callCapability);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7 ^ v8 ^ objc_msgSend(v9, "hash");
  v11 = -[NSNumber hash](self->_numberOfCalls, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_preferredCallProvider);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  v14 = v10 ^ v13 ^ -[NSString hash](self->_providerId, "hash");
  v15 = -[NSString hash](self->_providerBundleId, "hash");
  v16 = v15 ^ -[NSNumber hash](self->_isCallerIdBlocked, "hash");
  v17 = v14 ^ v16 ^ -[NSArray hash](self->_participants, "hash");

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  INCallRecord *v4;
  INCallRecord *v5;
  NSString *identifier;
  NSDate *dateCreated;
  NSNumber *callDuration;
  NSNumber *unseen;
  NSNumber *numberOfCalls;
  NSString *providerId;
  NSString *providerBundleId;
  NSNumber *isCallerIdBlocked;
  NSArray *participants;
  BOOL v15;

  v4 = (INCallRecord *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      if (identifier != v5->_identifier && !-[NSString isEqual:](identifier, "isEqual:"))
        goto LABEL_27;
      dateCreated = self->_dateCreated;
      if (dateCreated != v5->_dateCreated && !-[NSDate isEqual:](dateCreated, "isEqual:"))
        goto LABEL_27;
      if (self->_callRecordType == v5->_callRecordType
        && ((callDuration = self->_callDuration, callDuration == v5->_callDuration)
         || -[NSNumber isEqual:](callDuration, "isEqual:"))
        && ((unseen = self->_unseen, unseen == v5->_unseen) || -[NSNumber isEqual:](unseen, "isEqual:"))
        && self->_callCapability == v5->_callCapability
        && ((numberOfCalls = self->_numberOfCalls, numberOfCalls == v5->_numberOfCalls)
         || -[NSNumber isEqual:](numberOfCalls, "isEqual:"))
        && self->_preferredCallProvider == v5->_preferredCallProvider
        && ((providerId = self->_providerId, providerId == v5->_providerId)
         || -[NSString isEqual:](providerId, "isEqual:"))
        && ((providerBundleId = self->_providerBundleId, providerBundleId == v5->_providerBundleId)
         || -[NSString isEqual:](providerBundleId, "isEqual:"))
        && ((isCallerIdBlocked = self->_isCallerIdBlocked, isCallerIdBlocked == v5->_isCallerIdBlocked)
         || -[NSNumber isEqual:](isCallerIdBlocked, "isEqual:"))
        && ((participants = self->_participants, participants == v5->_participants)
         || -[NSArray isEqual:](participants, "isEqual:")))
      {
        v15 = 1;
      }
      else
      {
LABEL_27:
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (INCallRecord)initWithCoder:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  INCallRecord *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifier"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateCreated"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("callRecordType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callDuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unseen"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("callCapability"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfCalls"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredCallProvider"));
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("providerId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("providerBundleId"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isCallerIdBlocked"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0C99E60];
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("participants"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[INCallRecord initWithIdentifier:dateCreated:callRecordType:callCapability:callDuration:unseen:preferredCallProvider:participants:numberOfCalls:providerId:providerBundleId:isCallerIdBlocked:](self, "initWithIdentifier:dateCreated:callRecordType:callCapability:callDuration:unseen:preferredCallProvider:participants:numberOfCalls:providerId:providerBundleId:isCallerIdBlocked:", v29, v28, v27, v26, v7, v8, v25, v22, v9, v13, v17, v18);
  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateCreated, CFSTR("dateCreated"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_callRecordType, CFSTR("callRecordType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callDuration, CFSTR("callDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unseen, CFSTR("unseen"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_callCapability, CFSTR("callCapability"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberOfCalls, CFSTR("numberOfCalls"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preferredCallProvider, CFSTR("preferredCallProvider"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerId, CFSTR("providerId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerBundleId, CFSTR("providerBundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isCallerIdBlocked, CFSTR("isCallerIdBlocked"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_participants, CFSTR("participants"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  int64_t callCapability;
  const __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  unint64_t v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_identifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("identifier"));

  objc_msgSend(v6, "encodeObject:", self->_dateCreated);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("dateCreated"));

  v10 = self->_callRecordType - 1;
  if (v10 > 7)
    v11 = CFSTR("unknown");
  else
    v11 = off_1E228C9E8[v10];
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("callRecordType"));

  objc_msgSend(v6, "encodeObject:", self->_callDuration);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("callDuration"));

  objc_msgSend(v6, "encodeObject:", self->_unseen);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("unseen"));

  callCapability = self->_callCapability;
  v16 = CFSTR("unknown");
  if (callCapability == 2)
    v16 = CFSTR("videoCall");
  if (callCapability == 1)
    v17 = CFSTR("audioCall");
  else
    v17 = (__CFString *)v16;
  v18 = v17;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v18, CFSTR("callCapability"));

  objc_msgSend(v6, "encodeObject:", self->_numberOfCalls);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, CFSTR("numberOfCalls"));

  v20 = self->_preferredCallProvider - 1;
  if (v20 > 2)
    v21 = CFSTR("unknown");
  else
    v21 = off_1E228E138[v20];
  v22 = v21;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v22, CFSTR("preferredCallProvider"));

  objc_msgSend(v6, "encodeObject:", self->_providerId);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v23, CFSTR("providerId"));

  objc_msgSend(v6, "encodeObject:", self->_providerBundleId);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v24, CFSTR("providerBundleId"));

  objc_msgSend(v6, "encodeObject:", self->_isCallerIdBlocked);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v25, CFSTR("isCallerIdBlocked"));

  objc_msgSend(v6, "encodeObject:", self->_participants);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v26, CFSTR("participants"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INCallRecord descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INCallRecord;
  -[INCallRecord description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCallRecord _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t identifier;
  uint64_t dateCreated;
  uint64_t callDuration;
  uint64_t unseen;
  NSNumber *numberOfCalls;
  uint64_t v8;
  void *v9;
  NSString *providerId;
  void *v11;
  NSString *providerBundleId;
  void *v13;
  NSNumber *isCallerIdBlocked;
  void *v15;
  NSArray *participants;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[12];
  _QWORD v32[14];

  v32[12] = *MEMORY[0x1E0C80C00];
  identifier = (uint64_t)self->_identifier;
  v30 = identifier;
  v31[0] = CFSTR("identifier");
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    identifier = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)identifier;
  v32[0] = identifier;
  v31[1] = CFSTR("dateCreated");
  dateCreated = (uint64_t)self->_dateCreated;
  v29 = dateCreated;
  if (!dateCreated)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    dateCreated = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)dateCreated;
  v32[1] = dateCreated;
  v31[2] = CFSTR("callRecordType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_callRecordType);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v28;
  v31[3] = CFSTR("callDuration");
  callDuration = (uint64_t)self->_callDuration;
  v27 = callDuration;
  if (!callDuration)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    callDuration = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)callDuration;
  v32[3] = callDuration;
  v31[4] = CFSTR("unseen");
  unseen = (uint64_t)self->_unseen;
  v26 = unseen;
  if (!unseen)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    unseen = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)unseen;
  v32[4] = unseen;
  v31[5] = CFSTR("callCapability");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_callCapability);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v25;
  v31[6] = CFSTR("numberOfCalls");
  numberOfCalls = self->_numberOfCalls;
  v8 = (uint64_t)numberOfCalls;
  if (!numberOfCalls)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v32[6] = v8;
  v31[7] = CFSTR("preferredCallProvider");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_preferredCallProvider, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v9;
  v31[8] = CFSTR("providerId");
  providerId = self->_providerId;
  v11 = providerId;
  if (!providerId)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[8] = v11;
  v31[9] = CFSTR("providerBundleId");
  providerBundleId = self->_providerBundleId;
  v13 = providerBundleId;
  if (!providerBundleId)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[9] = v13;
  v31[10] = CFSTR("isCallerIdBlocked");
  isCallerIdBlocked = self->_isCallerIdBlocked;
  v15 = isCallerIdBlocked;
  if (!isCallerIdBlocked)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[10] = v15;
  v31[11] = CFSTR("participants");
  participants = self->_participants;
  v17 = participants;
  if (!participants)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[11] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 12);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (participants)
  {
    if (isCallerIdBlocked)
      goto LABEL_21;
  }
  else
  {

    if (isCallerIdBlocked)
    {
LABEL_21:
      if (providerBundleId)
        goto LABEL_22;
LABEL_36:

      if (providerId)
        goto LABEL_23;
      goto LABEL_37;
    }
  }

  if (!providerBundleId)
    goto LABEL_36;
LABEL_22:
  if (providerId)
    goto LABEL_23;
LABEL_37:

LABEL_23:
  if (!numberOfCalls)

  if (!v26)
  if (!v27)

  if (!v29)
  if (!v30)

  return v24;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (INCallRecordType)callRecordType
{
  return self->_callRecordType;
}

- (NSNumber)callDuration
{
  return self->_callDuration;
}

- (NSNumber)unseen
{
  return self->_unseen;
}

- (INCallCapability)callCapability
{
  return self->_callCapability;
}

- (NSNumber)numberOfCalls
{
  return self->_numberOfCalls;
}

- (NSNumber)isCallerIdBlocked
{
  return self->_isCallerIdBlocked;
}

- (NSArray)participants
{
  return self->_participants;
}

- (INPerson)caller
{
  return self->_caller;
}

- (int64_t)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (NSString)providerId
{
  return self->_providerId;
}

- (NSString)providerBundleId
{
  return self->_providerBundleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerBundleId, 0);
  objc_storeStrong((id *)&self->_providerId, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_isCallerIdBlocked, 0);
  objc_storeStrong((id *)&self->_numberOfCalls, 0);
  objc_storeStrong((id *)&self->_unseen, 0);
  objc_storeStrong((id *)&self->_callDuration, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v34;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (objc_class *)a1;
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dateCreated"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("callRecordType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = INCallRecordTypeWithString(v11);

    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("callDuration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v12, v13);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("unseen"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("callCapability"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = INCallCapabilityWithString(v14);

    v15 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("numberOfCalls"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v15, v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("preferredCallProvider"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = INPreferredCallProviderWithString(v17);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("providerId"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("providerBundleId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isCallerIdBlocked"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("participants"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)objc_msgSend([v34 alloc], "initWithIdentifier:dateCreated:callRecordType:callCapability:callDuration:unseen:preferredCallProvider:participants:numberOfCalls:providerId:providerBundleId:isCallerIdBlocked:", v31, v33, v29, v30, v28, v32, v18, v23, v27, v26, v19, v20);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (INCallRecord)initWithIdentifier:(NSString *)identifier dateCreated:(NSDate *)dateCreated caller:(INPerson *)caller callRecordType:(INCallRecordType)callRecordType callCapability:(INCallCapability)callCapability callDuration:(NSNumber *)callDuration unseen:(NSNumber *)unseen
{
  return -[INCallRecord initWithIdentifier:dateCreated:caller:callRecordType:callCapability:callDuration:unseen:numberOfCalls:isCallerIdBlocked:](self, "initWithIdentifier:dateCreated:caller:callRecordType:callCapability:callDuration:unseen:numberOfCalls:isCallerIdBlocked:", identifier, dateCreated, caller, callRecordType, callCapability, callDuration, unseen, 0, 0);
}

- (INCallRecord)initWithIdentifier:(NSString *)identifier dateCreated:(NSDate *)dateCreated caller:(INPerson *)caller callRecordType:(INCallRecordType)callRecordType callCapability:(INCallCapability)callCapability callDuration:(NSNumber *)callDuration unseen:(NSNumber *)unseen numberOfCalls:(NSNumber *)numberOfCalls
{
  return -[INCallRecord initWithIdentifier:dateCreated:caller:callRecordType:callCapability:callDuration:unseen:numberOfCalls:isCallerIdBlocked:](self, "initWithIdentifier:dateCreated:caller:callRecordType:callCapability:callDuration:unseen:numberOfCalls:isCallerIdBlocked:", identifier, dateCreated, caller, callRecordType, callCapability, callDuration, unseen, numberOfCalls, 0);
}

@end
