@implementation _CDInteractionAdvisorSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callerBundleId, 0);
  objc_storeStrong((id *)&self->_consumerIdentifier, 0);
  objc_storeStrong((id *)&self->_ignoreInteractionUUIDs, 0);
  objc_storeStrong((id *)&self->_ignoreContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_constrainPersonIdType, 0);
  objc_storeStrong((id *)&self->_constrainPersonIds, 0);
  objc_storeStrong((id *)&self->_constrainIdentifiers, 0);
  objc_storeStrong((id *)&self->_constrainKeywords, 0);
  objc_storeStrong((id *)&self->_constrainRecipients, 0);
  objc_storeStrong((id *)&self->_constrainSenders, 0);
  objc_storeStrong((id *)&self->_constrainLocationUUIDs, 0);
  objc_storeStrong((id *)&self->_constrainDomainIdentifiers, 0);
  objc_storeStrong((id *)&self->_constrainAccounts, 0);
  objc_storeStrong((id *)&self->_constrainBundleIds, 0);
  objc_storeStrong((id *)&self->_constrainMechanisms, 0);
  objc_storeStrong((id *)&self->_constrainDirections, 0);
  objc_storeStrong((id *)&self->_contactPrefix, 0);
  objc_storeStrong((id *)&self->_interactionLocationUUID, 0);
  objc_storeStrong((id *)&self->_seedIdentifiers, 0);
  objc_storeStrong((id *)&self->_interactionTitle, 0);
  objc_storeStrong((id *)&self->_interactionDate, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *interactionDate;
  id v5;

  interactionDate = self->_interactionDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", interactionDate, CFSTR("interactionDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactionTitle, CFSTR("interactionTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactionLocationUUID, CFSTR("interactionLocationUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactPrefix, CFSTR("contactPrefix"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_seedIdentifiers, CFSTR("seedIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_constrainDirections, CFSTR("constrainDirections"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_constrainMechanisms, CFSTR("constrainMechanisms"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_constrainBundleIds, CFSTR("constrainBundleIds"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_constrainAccounts, CFSTR("constrainAccounts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_constrainDomainIdentifiers, CFSTR("constrainDomainIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_constrainSenders, CFSTR("constrainSenders"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_constrainRecipients, CFSTR("constrainRecipients"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_constrainKeywords, CFSTR("constrainKeywords"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_constrainLocationUUIDs, CFSTR("constrainLocationUUIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_constrainIdentifiers, CFSTR("constrainIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_constrainPersonIds, CFSTR("constrainPersonIds"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_constrainPersonIdType, CFSTR("constrainPersonIdType"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_resultLimit, CFSTR("resultLimit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ignoreContactIdentifiers, CFSTR("ignoreContactIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ignoreInteractionUUIDs, CFSTR("ignoreInteractionUUIDs"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_useFuture, CFSTR("useFutureInteractions"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_aggregateByIdentifier, CFSTR("aggregateByIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requireOutgoingInteraction, CFSTR("requireOutgoingInteraction"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_constrainMaxRecipientCount, CFSTR("constrainMaxRecipientCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_consumerIdentifier, CFSTR("consumerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callerBundleId, CFSTR("callerBundleId"));

}

- (void)setResultLimit:(unint64_t)a3
{
  self->_resultLimit = a3;
}

- (void)setInteractionDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setConstrainMechanisms:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setConstrainIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void)setConsumerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_consumerIdentifier, a3);
}

+ (id)interactionAdvisorSettingsDefault
{
  return objc_alloc_init(_CDInteractionAdvisorSettings);
}

- (_CDInteractionAdvisorSettings)init
{
  _CDInteractionAdvisorSettings *v2;
  _CDInteractionAdvisorSettings *v3;
  uint64_t v4;
  NSDate *interactionDate;
  void *v6;
  uint64_t v7;
  NSString *callerBundleId;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_CDInteractionAdvisorSettings;
  v2 = -[_CDInteractionAdvisorSettings init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_resultLimit = 30;
    v2->_useFuture = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = objc_claimAutoreleasedReturnValue();
    interactionDate = v3->_interactionDate;
    v3->_interactionDate = (NSDate *)v4;

    v3->_constrainMaxRecipientCount = -1;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    callerBundleId = v3->_callerBundleId;
    v3->_callerBundleId = (NSString *)v7;

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CDInteractionAdvisorSettings)initWithCoder:(id)a3
{
  id v4;
  _CDInteractionAdvisorSettings *v5;
  uint64_t v6;
  NSDate *interactionDate;
  uint64_t v8;
  NSString *interactionTitle;
  uint64_t v10;
  NSString *interactionLocationUUID;
  uint64_t v12;
  NSString *contactPrefix;
  uint64_t v14;
  NSString *consumerIdentifier;
  uint64_t v16;
  NSString *callerBundleId;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSSet *constrainDirections;
  uint64_t v23;
  NSSet *constrainMechanisms;
  uint64_t v25;
  NSSet *constrainPersonIdType;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSSet *constrainSenders;
  uint64_t v33;
  NSSet *constrainRecipients;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSSet *constrainPersonIds;
  uint64_t v40;
  NSSet *constrainKeywords;
  uint64_t v42;
  NSSet *seedIdentifiers;
  uint64_t v44;
  NSSet *constrainBundleIds;
  uint64_t v46;
  NSSet *constrainAccounts;
  uint64_t v48;
  NSSet *constrainLocationUUIDs;
  uint64_t v50;
  NSSet *constrainDomainIdentifiers;
  uint64_t v52;
  NSSet *ignoreInteractionUUIDs;
  uint64_t v54;
  NSSet *ignoreContactIdentifiers;
  uint64_t v56;
  NSSet *constrainIdentifiers;
  _CDInteractionAdvisorSettings *v58;
  objc_super v60;

  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)_CDInteractionAdvisorSettings;
  v5 = -[_CDInteractionAdvisorSettings init](&v60, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interactionDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    interactionDate = v5->_interactionDate;
    v5->_interactionDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interactionTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    interactionTitle = v5->_interactionTitle;
    v5->_interactionTitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interactionLocationUUID"));
    v10 = objc_claimAutoreleasedReturnValue();
    interactionLocationUUID = v5->_interactionLocationUUID;
    v5->_interactionLocationUUID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactPrefix"));
    v12 = objc_claimAutoreleasedReturnValue();
    contactPrefix = v5->_contactPrefix;
    v5->_contactPrefix = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("consumerIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    consumerIdentifier = v5->_consumerIdentifier;
    v5->_consumerIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callerBundleId"));
    v16 = objc_claimAutoreleasedReturnValue();
    callerBundleId = v5->_callerBundleId;
    v5->_callerBundleId = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("constrainDirections"));
    v21 = objc_claimAutoreleasedReturnValue();
    constrainDirections = v5->_constrainDirections;
    v5->_constrainDirections = (NSSet *)v21;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("constrainMechanisms"));
    v23 = objc_claimAutoreleasedReturnValue();
    constrainMechanisms = v5->_constrainMechanisms;
    v5->_constrainMechanisms = (NSSet *)v23;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("constrainPersonIdType"));
    v25 = objc_claimAutoreleasedReturnValue();
    constrainPersonIdType = v5->_constrainPersonIdType;
    v5->_constrainPersonIdType = (NSSet *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("constrainSenders"));
    v31 = objc_claimAutoreleasedReturnValue();
    constrainSenders = v5->_constrainSenders;
    v5->_constrainSenders = (NSSet *)v31;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("constrainRecipients"));
    v33 = objc_claimAutoreleasedReturnValue();
    constrainRecipients = v5->_constrainRecipients;
    v5->_constrainRecipients = (NSSet *)v33;

    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("constrainPersonIds"));
    v38 = objc_claimAutoreleasedReturnValue();
    constrainPersonIds = v5->_constrainPersonIds;
    v5->_constrainPersonIds = (NSSet *)v38;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("constrainKeywords"));
    v40 = objc_claimAutoreleasedReturnValue();
    constrainKeywords = v5->_constrainKeywords;
    v5->_constrainKeywords = (NSSet *)v40;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("seedIdentifiers"));
    v42 = objc_claimAutoreleasedReturnValue();
    seedIdentifiers = v5->_seedIdentifiers;
    v5->_seedIdentifiers = (NSSet *)v42;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("constrainBundleIds"));
    v44 = objc_claimAutoreleasedReturnValue();
    constrainBundleIds = v5->_constrainBundleIds;
    v5->_constrainBundleIds = (NSSet *)v44;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("constrainAccounts"));
    v46 = objc_claimAutoreleasedReturnValue();
    constrainAccounts = v5->_constrainAccounts;
    v5->_constrainAccounts = (NSSet *)v46;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("constrainLocationUUIDs"));
    v48 = objc_claimAutoreleasedReturnValue();
    constrainLocationUUIDs = v5->_constrainLocationUUIDs;
    v5->_constrainLocationUUIDs = (NSSet *)v48;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("constrainDomainIdentifiers"));
    v50 = objc_claimAutoreleasedReturnValue();
    constrainDomainIdentifiers = v5->_constrainDomainIdentifiers;
    v5->_constrainDomainIdentifiers = (NSSet *)v50;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("ignoreInteractionUUIDs"));
    v52 = objc_claimAutoreleasedReturnValue();
    ignoreInteractionUUIDs = v5->_ignoreInteractionUUIDs;
    v5->_ignoreInteractionUUIDs = (NSSet *)v52;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("ignoreContactIdentifiers"));
    v54 = objc_claimAutoreleasedReturnValue();
    ignoreContactIdentifiers = v5->_ignoreContactIdentifiers;
    v5->_ignoreContactIdentifiers = (NSSet *)v54;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("constrainIdentifiers"));
    v56 = objc_claimAutoreleasedReturnValue();
    constrainIdentifiers = v5->_constrainIdentifiers;
    v5->_constrainIdentifiers = (NSSet *)v56;

    v5->_resultLimit = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("resultLimit"));
    v5->_useFuture = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useFutureInteractions"));
    v5->_aggregateByIdentifier = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("aggregateByIdentifier"));
    v5->_requireOutgoingInteraction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requireOutgoingInteraction"));
    v5->_constrainMaxRecipientCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("constrainMaxRecipientCount"));
    v58 = v5;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  +[_CDInteractionAdvisorSettings interactionAdvisorSettingsDefault](_CDInteractionAdvisorSettings, "interactionAdvisorSettingsDefault", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionAdvisorSettings interactionDate](self, "interactionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteractionDate:", v5);

  -[_CDInteractionAdvisorSettings interactionTitle](self, "interactionTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteractionTitle:", v6);

  -[_CDInteractionAdvisorSettings interactionLocationUUID](self, "interactionLocationUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteractionLocationUUID:", v7);

  -[_CDInteractionAdvisorSettings contactPrefix](self, "contactPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContactPrefix:", v8);

  -[_CDInteractionAdvisorSettings seedIdentifiers](self, "seedIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSeedIdentifiers:", v9);

  -[_CDInteractionAdvisorSettings constrainDirections](self, "constrainDirections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstrainDirections:", v10);

  -[_CDInteractionAdvisorSettings constrainMechanisms](self, "constrainMechanisms");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstrainMechanisms:", v11);

  -[_CDInteractionAdvisorSettings constrainBundleIds](self, "constrainBundleIds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstrainBundleIds:", v12);

  -[_CDInteractionAdvisorSettings constrainAccounts](self, "constrainAccounts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstrainAccounts:", v13);

  -[_CDInteractionAdvisorSettings constrainDomainIdentifiers](self, "constrainDomainIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstrainDomainIdentifiers:", v14);

  -[_CDInteractionAdvisorSettings constrainSenders](self, "constrainSenders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstrainSenders:", v15);

  -[_CDInteractionAdvisorSettings constrainRecipients](self, "constrainRecipients");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstrainRecipients:", v16);

  -[_CDInteractionAdvisorSettings constrainKeywords](self, "constrainKeywords");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstrainKeywords:", v17);

  -[_CDInteractionAdvisorSettings constrainLocationUUIDs](self, "constrainLocationUUIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstrainLocationUUIDs:", v18);

  objc_msgSend(v4, "setResultLimit:", -[_CDInteractionAdvisorSettings resultLimit](self, "resultLimit"));
  -[_CDInteractionAdvisorSettings constrainIdentifiers](self, "constrainIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstrainIdentifiers:", v19);

  -[_CDInteractionAdvisorSettings constrainPersonIds](self, "constrainPersonIds");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstrainPersonIds:", v20);

  -[_CDInteractionAdvisorSettings constrainPersonIdType](self, "constrainPersonIdType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstrainPersonIdType:", v21);

  -[_CDInteractionAdvisorSettings ignoreContactIdentifiers](self, "ignoreContactIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIgnoreContactIdentifiers:", v22);

  -[_CDInteractionAdvisorSettings ignoreInteractionUUIDs](self, "ignoreInteractionUUIDs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIgnoreInteractionUUIDs:", v23);

  objc_msgSend(v4, "setUseFuture:", -[_CDInteractionAdvisorSettings useFuture](self, "useFuture"));
  objc_msgSend(v4, "setAggregateByIdentifier:", -[_CDInteractionAdvisorSettings aggregateByIdentifier](self, "aggregateByIdentifier"));
  objc_msgSend(v4, "setRequireOutgoingInteraction:", -[_CDInteractionAdvisorSettings requireOutgoingInteraction](self, "requireOutgoingInteraction"));
  objc_msgSend(v4, "setConstrainMaxRecipientCount:", -[_CDInteractionAdvisorSettings constrainMaxRecipientCount](self, "constrainMaxRecipientCount"));
  -[_CDInteractionAdvisorSettings consumerIdentifier](self, "consumerIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConsumerIdentifier:", v24);

  -[_CDInteractionAdvisorSettings callerBundleId](self, "callerBundleId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCallerBundleId:", v25);

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", CFSTR("Settings { \n"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDInteractionAdvisorSettings resultLimit](self, "resultLimit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("            resultLimit: %@\n"), v4);

  -[_CDInteractionAdvisorSettings interactionPredicate](self, "interactionPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("              predicate: %@\n"), v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useFuture);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("              useFuture: %@\n"), v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_aggregateByIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  aggregateByIdentifier: %@\n"), v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requireOutgoingInteraction);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  requireOutInteraction: %@\n"), v8);

  if (self->_interactionDate)
    objc_msgSend(v3, "appendFormat:", CFSTR("                   date: %@\n"), self->_interactionDate);
  if (self->_interactionTitle)
    objc_msgSend(v3, "appendFormat:", CFSTR("                  title: %@\n"), self->_interactionTitle);
  if (self->_seedIdentifiers)
    objc_msgSend(v3, "appendFormat:", CFSTR("        seedIdentifiers: %@\n"), self->_seedIdentifiers);
  if (self->_interactionLocationUUID)
    objc_msgSend(v3, "appendFormat:", CFSTR("           locationUUID: %@\n"), self->_interactionLocationUUID);
  if (self->_constrainBundleIds)
    objc_msgSend(v3, "appendFormat:", CFSTR("              bundleIds: %@\n"), self->_constrainBundleIds);
  if (self->_contactPrefix)
    objc_msgSend(v3, "appendFormat:", CFSTR("          contactPrefix: %@\n"), self->_contactPrefix);
  if (self->_constrainSenders)
    objc_msgSend(v3, "appendFormat:", CFSTR("       constrainSenders: %@\n"), self->_constrainSenders);
  if (self->_constrainRecipients)
    objc_msgSend(v3, "appendFormat:", CFSTR("    constrainRecipients: %@\n"), self->_constrainRecipients);
  if (self->_constrainIdentifiers)
    objc_msgSend(v3, "appendFormat:", CFSTR("   constrainIdentifiers: %@\n"), self->_constrainIdentifiers);
  if (self->_constrainPersonIds)
    objc_msgSend(v3, "appendFormat:", CFSTR("     constrainPersonIds: %@\n"), self->_constrainPersonIds);
  if (self->_constrainPersonIdType)
    objc_msgSend(v3, "appendFormat:", CFSTR("  constrainPersonIdType: %@\n"), self->_constrainPersonIdType);
  if (self->_ignoreContactIdentifiers)
    objc_msgSend(v3, "appendFormat:", CFSTR("     ignoreIdentifiers: %@\n"), self->_ignoreContactIdentifiers);
  if (self->_constrainMaxRecipientCount != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("     maxRecipientCount: %@\n"), v9);

  }
  if (self->_consumerIdentifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("    consumerIdentifier: %@\n"), self->_consumerIdentifier);
  if (self->_callerBundleId)
    objc_msgSend(v3, "appendFormat:", CFSTR("        callerBundleId: %@\n"), self->_callerBundleId);
  objc_msgSend(v3, "appendFormat:", CFSTR(" }\n"));
  return v3;
}

+ (id)extractContactIdentifiers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v4, "addObject:", v10, (_QWORD)v13);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)interactionPredicate
{
  void *v3;
  NSSet *constrainMechanisms;
  void *v5;
  NSSet *constrainDirections;
  void *v7;
  NSSet *constrainBundleIds;
  void *v9;
  NSSet *constrainAccounts;
  void *v11;
  NSSet *constrainDomainIdentifiers;
  unint64_t v13;
  void *v14;
  NSSet *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSSet *constrainLocationUUIDs;
  void *v23;
  NSSet *constrainSenders;
  void *v25;
  void *v26;
  void *v27;
  NSSet *constrainRecipients;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSSet *constrainKeywords;
  void *v43;
  void *v44;
  void *v45;
  NSSet *ignoreInteractionUUIDs;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  constrainMechanisms = self->_constrainMechanisms;
  if (constrainMechanisms && -[NSSet count](constrainMechanisms, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism IN %@)"), self->_constrainMechanisms);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  constrainDirections = self->_constrainDirections;
  if (constrainDirections && -[NSSet count](constrainDirections, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction IN %@)"), self->_constrainDirections);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  constrainBundleIds = self->_constrainBundleIds;
  if (constrainBundleIds && -[NSSet count](constrainBundleIds, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(bundleId IN %@)"), self->_constrainBundleIds);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  constrainAccounts = self->_constrainAccounts;
  if (constrainAccounts && -[NSSet count](constrainAccounts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(account IN %@)"), self->_constrainAccounts);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  constrainDomainIdentifiers = self->_constrainDomainIdentifiers;
  v13 = 0x1E0CB3000;
  if (constrainDomainIdentifiers && -[NSSet count](constrainDomainIdentifiers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSSet count](self->_constrainDomainIdentifiers, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v15 = self->_constrainDomainIdentifiers;
    v16 = -[NSSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v62;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v62 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(domainIdentifier BEGINSWITH %@)"), *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v19));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = -[NSSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      }
      while (v17);
    }

    v13 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

  }
  constrainLocationUUIDs = self->_constrainLocationUUIDs;
  if (constrainLocationUUIDs && -[NSSet count](constrainLocationUUIDs, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(locationUUID IN %@)"), self->_constrainLocationUUIDs);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);

  }
  constrainSenders = self->_constrainSenders;
  if (constrainSenders && -[NSSet count](constrainSenders, "count"))
  {
    v25 = (void *)MEMORY[0x1E0CB3880];
    +[_CDInteractionAdvisorSettings extractContactIdentifiers:](_CDInteractionAdvisorSettings, "extractContactIdentifiers:", self->_constrainSenders);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "predicateWithFormat:", CFSTR("(sender.identifier IN %@)"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v27);

  }
  constrainRecipients = self->_constrainRecipients;
  if (constrainRecipients && -[NSSet count](constrainRecipients, "count"))
  {
    v29 = (void *)MEMORY[0x1E0CB3880];
    +[_CDInteractionAdvisorSettings extractContactIdentifiers:](_CDInteractionAdvisorSettings, "extractContactIdentifiers:", self->_constrainRecipients);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "predicateWithFormat:", CFSTR("(ANY recipients.identifier IN %@)"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v31);

  }
  if (-[NSSet count](self->_constrainPersonIds, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(sender.personId IN %@)"), self->_constrainPersonIds);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(ANY recipients.personId IN %@)"), self->_constrainPersonIds);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *(void **)(v13 + 1320);
    v67[0] = v32;
    v67[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "orPredicateWithSubpredicates:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v36);

  }
  if (-[NSSet count](self->_constrainPersonIdType, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(sender.personIdType IN %@)"), self->_constrainPersonIdType);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(ANY recipients.personIdType IN %@)"), self->_constrainPersonIdType);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *(void **)(v13 + 1320);
    v66[0] = v37;
    v66[1] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "orPredicateWithSubpredicates:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v41);

  }
  constrainKeywords = self->_constrainKeywords;
  if (constrainKeywords && -[NSSet count](constrainKeywords, "count"))
  {
    v43 = (void *)MEMORY[0x1E0CB3880];
    -[NSSet allObjects](self->_constrainKeywords, "allObjects");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "predicateWithFormat:", CFSTR("(ANY keywords.keyword IN %@)"), v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v45);

  }
  ignoreInteractionUUIDs = self->_ignoreInteractionUUIDs;
  if (ignoreInteractionUUIDs && -[NSSet count](ignoreInteractionUUIDs, "count"))
  {
    v47 = (void *)MEMORY[0x1E0CB3880];
    -[NSSet allObjects](self->_ignoreInteractionUUIDs, "allObjects");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "predicateWithFormat:", CFSTR("(NOT (uuid IN %@))"), v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v49);

  }
  if (self->_constrainMaxRecipientCount >= 1)
  {
    v50 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "predicateWithFormat:", CFSTR("(recipientCount != nil AND recipientCount <= %@)"), v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_constrainMaxRecipientCount);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "predicateWithFormat:", CFSTR("(recipientCount == nil AND recipients.@count <= %@)"), v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = *(void **)(v13 + 1320);
    v65[0] = v52;
    v65[1] = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "orPredicateWithSubpredicates:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v58);

  }
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(v13 + 1320), "andPredicateWithSubpredicates:", v3);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  return v59;
}

- (id)contactPredicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if (!-[NSString length](self->_contactPrefix, "length"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), self->_contactPrefix);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(identifier BEGINSWITH[cd] %@)"), self->_contactPrefix);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(displayName BEGINSWITH[cd] %@)"), self->_contactPrefix);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(displayName CONTAINS[cd] %@)"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v11[0] = v4;
  v11[1] = v5;
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDate)interactionDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)interactionTitle
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInteractionTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSSet)seedIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSeedIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)interactionLocationUUID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInteractionLocationUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)contactPrefix
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContactPrefix:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSSet)constrainDirections
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConstrainDirections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSSet)constrainMechanisms
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (NSSet)constrainBundleIds
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConstrainBundleIds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSSet)constrainAccounts
{
  return (NSSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setConstrainAccounts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSSet)constrainDomainIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConstrainDomainIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSSet)constrainLocationUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConstrainLocationUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSSet)constrainSenders
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setConstrainSenders:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSSet)constrainRecipients
{
  return (NSSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setConstrainRecipients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSSet)constrainKeywords
{
  return (NSSet *)objc_getProperty(self, a2, 120, 1);
}

- (void)setConstrainKeywords:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSSet)constrainIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 128, 1);
}

- (NSSet)constrainPersonIds
{
  return (NSSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)setConstrainPersonIds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSSet)constrainPersonIdType
{
  return (NSSet *)objc_getProperty(self, a2, 144, 1);
}

- (void)setConstrainPersonIdType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (int64_t)constrainMaxRecipientCount
{
  return self->_constrainMaxRecipientCount;
}

- (void)setConstrainMaxRecipientCount:(int64_t)a3
{
  self->_constrainMaxRecipientCount = a3;
}

- (unint64_t)resultLimit
{
  return self->_resultLimit;
}

- (BOOL)useFuture
{
  return self->_useFuture;
}

- (void)setUseFuture:(BOOL)a3
{
  self->_useFuture = a3;
}

- (BOOL)aggregateByIdentifier
{
  return self->_aggregateByIdentifier;
}

- (void)setAggregateByIdentifier:(BOOL)a3
{
  self->_aggregateByIdentifier = a3;
}

- (BOOL)requireOutgoingInteraction
{
  return self->_requireOutgoingInteraction;
}

- (void)setRequireOutgoingInteraction:(BOOL)a3
{
  self->_requireOutgoingInteraction = a3;
}

- (NSSet)ignoreContactIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 168, 1);
}

- (void)setIgnoreContactIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSSet)ignoreInteractionUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 176, 1);
}

- (void)setIgnoreInteractionUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSString)consumerIdentifier
{
  return self->_consumerIdentifier;
}

- (NSString)callerBundleId
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCallerBundleId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

@end
