@implementation _CDPeopleSuggesterSettings

+ (id)defaultSettings
{
  return objc_alloc_init(_CDPeopleSuggesterSettings);
}

- (_CDPeopleSuggesterSettings)init
{
  _CDPeopleSuggesterSettings *v2;
  void *v3;
  uint64_t v4;
  NSSet *constrainMechanisms;
  NSSet *constrainBundleIds;
  NSSet *constrainAccounts;
  NSSet *constrainDomainIdentifiers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_CDPeopleSuggesterSettings;
  v2 = -[_CDPeopleSuggesterSettings init](&v10, sel_init);
  if (v2)
  {
    +[_CDInteractionAdvisorSettings interactionAdvisorSettingsDefault](_CDInteractionAdvisorSettings, "interactionAdvisorSettingsDefault");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "resultLimit");
    constrainMechanisms = v2->_constrainMechanisms;
    v2->_maxNumberOfPeopleSuggested = v4;
    v2->_constrainMechanisms = 0;

    constrainBundleIds = v2->_constrainBundleIds;
    v2->_constrainBundleIds = 0;

    constrainAccounts = v2->_constrainAccounts;
    v2->_constrainAccounts = 0;

    constrainDomainIdentifiers = v2->_constrainDomainIdentifiers;
    v2->_constrainDomainIdentifiers = 0;

    *(_DWORD *)&v2->_useFuture = 65793;
    v2->_constrainMaxRecipientCount = objc_msgSend(v3, "constrainMaxRecipientCount");

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    objc_msgSend(v4, "setMaxNumberOfPeopleSuggested:", -[_CDPeopleSuggesterSettings maxNumberOfPeopleSuggested](self, "maxNumberOfPeopleSuggested"));
    -[_CDPeopleSuggesterSettings constrainMechanisms](self, "constrainMechanisms");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConstrainMechanisms:", v5);

    -[_CDPeopleSuggesterSettings constrainBundleIds](self, "constrainBundleIds");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConstrainBundleIds:", v6);

    -[_CDPeopleSuggesterSettings constrainAccounts](self, "constrainAccounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConstrainAccounts:", v7);

    -[_CDPeopleSuggesterSettings constrainDomainIdentifiers](self, "constrainDomainIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConstrainDomainIdentifiers:", v8);

    -[_CDPeopleSuggesterSettings constrainIdentifiers](self, "constrainIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConstrainIdentifiers:", v9);

    -[_CDPeopleSuggesterSettings constrainPersonIds](self, "constrainPersonIds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConstrainPersonIds:", v10);

    -[_CDPeopleSuggesterSettings constrainPersonIdType](self, "constrainPersonIdType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConstrainPersonIdType:", v11);

    objc_msgSend(v4, "setConstrainMaxRecipientCount:", -[_CDPeopleSuggesterSettings constrainMaxRecipientCount](self, "constrainMaxRecipientCount"));
    objc_msgSend(v4, "setUseFuture:", -[_CDPeopleSuggesterSettings useFuture](self, "useFuture"));
    objc_msgSend(v4, "setAggregateByIdentifier:", -[_CDPeopleSuggesterSettings aggregateByIdentifier](self, "aggregateByIdentifier"));
    objc_msgSend(v4, "setRequireOutgoingInteraction:", -[_CDPeopleSuggesterSettings requireOutgoingInteraction](self, "requireOutgoingInteraction"));
    objc_msgSend(v4, "setUseTitleToContrainKeywords:", -[_CDPeopleSuggesterSettings useTitleToContrainKeywords](self, "useTitleToContrainKeywords"));
    -[_CDPeopleSuggesterSettings ignoreContactIdentifiers](self, "ignoreContactIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIgnoreContactIdentifiers:", v12);

    objc_msgSend(v4, "setInferActiveInteractions:", -[_CDPeopleSuggesterSettings inferActiveInteractions](self, "inferActiveInteractions"));
  }
  return v4;
}

- (id)description
{
  void *v3;
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Settings {\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDPeopleSuggesterSettings maxNumberOfPeopleSuggested](self, "maxNumberOfPeopleSuggested"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    maxNumberOfPeopleSuggested: %@\n"), v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_CDPeopleSuggesterSettings useFuture](self, "useFuture"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                     useFuture: %@\n"), v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_CDPeopleSuggesterSettings aggregateByIdentifier](self, "aggregateByIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("         aggregateByIdentifier: %@\n"), v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_CDPeopleSuggesterSettings requireOutgoingInteraction](self, "requireOutgoingInteraction"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    requireOutgoingInteraction: %@\n"), v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_CDPeopleSuggesterSettings useTitleToContrainKeywords](self, "useTitleToContrainKeywords"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    useTitleToContrainKeywords: %@\n"), v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_CDPeopleSuggesterSettings inferActiveInteractions](self, "inferActiveInteractions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("       inferActiveInteractions: %@\n"), v9);

  -[_CDPeopleSuggesterSettings constrainMechanisms](self, "constrainMechanisms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("           constrainMechanisms: %@\n"), v10);

  -[_CDPeopleSuggesterSettings constrainBundleIds](self, "constrainBundleIds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("            constrainBundleIds: %@\n"), v11);

  -[_CDPeopleSuggesterSettings constrainAccounts](self, "constrainAccounts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("             constrainAccounts: %@\n"), v12);

  -[_CDPeopleSuggesterSettings constrainDomainIdentifiers](self, "constrainDomainIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    constrainDomainIdentifiers: %@\n"), v13);

  -[_CDPeopleSuggesterSettings constrainIdentifiers](self, "constrainIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("          constrainIdentifiers: %@\n"), v14);

  -[_CDPeopleSuggesterSettings constrainPersonIds](self, "constrainPersonIds");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("            constrainPersonIds: %@\n"), v15);

  -[_CDPeopleSuggesterSettings constrainPersonIdType](self, "constrainPersonIdType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("         constrainPersonIdType: %@\n"), v16);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_CDPeopleSuggesterSettings constrainMaxRecipientCount](self, "constrainMaxRecipientCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    constrainMaxRecipientCount: %@\n"), v17);

  -[_CDPeopleSuggesterSettings ignoreContactIdentifiers](self, "ignoreContactIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("      ignoreContactIdentifiers: %@\n"), v18);

  objc_msgSend(v3, "appendFormat:", CFSTR("}\n"));
  return v3;
}

- (unint64_t)maxNumberOfPeopleSuggested
{
  return self->_maxNumberOfPeopleSuggested;
}

- (void)setMaxNumberOfPeopleSuggested:(unint64_t)a3
{
  self->_maxNumberOfPeopleSuggested = a3;
}

- (NSSet)constrainMechanisms
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConstrainMechanisms:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSSet)constrainBundleIds
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConstrainBundleIds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSSet)constrainAccounts
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConstrainAccounts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSSet)constrainDomainIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConstrainDomainIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSSet)constrainIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConstrainIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSSet)constrainPersonIds
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConstrainPersonIds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSSet)constrainPersonIdType
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConstrainPersonIdType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unint64_t)constrainMaxRecipientCount
{
  return self->_constrainMaxRecipientCount;
}

- (void)setConstrainMaxRecipientCount:(unint64_t)a3
{
  self->_constrainMaxRecipientCount = a3;
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

- (BOOL)useTitleToContrainKeywords
{
  return self->_useTitleToContrainKeywords;
}

- (void)setUseTitleToContrainKeywords:(BOOL)a3
{
  self->_useTitleToContrainKeywords = a3;
}

- (BOOL)inferActiveInteractions
{
  return self->_inferActiveInteractions;
}

- (void)setInferActiveInteractions:(BOOL)a3
{
  self->_inferActiveInteractions = a3;
}

- (NSSet)ignoreContactIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setIgnoreContactIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_constrainPersonIdType, 0);
  objc_storeStrong((id *)&self->_constrainPersonIds, 0);
  objc_storeStrong((id *)&self->_constrainIdentifiers, 0);
  objc_storeStrong((id *)&self->_constrainDomainIdentifiers, 0);
  objc_storeStrong((id *)&self->_constrainAccounts, 0);
  objc_storeStrong((id *)&self->_constrainBundleIds, 0);
  objc_storeStrong((id *)&self->_constrainMechanisms, 0);
}

@end
