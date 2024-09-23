@implementation _CDInteractionAdvisorSimple

- (_CDInteractionAdvisorSimple)initWithCoreDuetDaemon
{
  void *v3;
  _CDInteractionAdvisorSimple *v4;

  +[_CDInteractionAdvisor sharedInteractionAdvisor](_CDInteractionAdvisor, "sharedInteractionAdvisor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_CDInteractionAdvisorSimple initWithInteractionAdvisor:](self, "initWithInteractionAdvisor:", v3);

  return v4;
}

- (_CDInteractionAdvisorSimple)initWithCoreDuetDatabase
{
  void *v3;
  void *v4;
  void *v5;
  _CDInteractionAdvisorSimple *v6;

  +[_CDInteractionStore defaultDatabaseDirectory](_CDInteractionStore, "defaultDatabaseDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDInteractionStore storeWithDirectory:readOnly:](_CDInteractionStore, "storeWithDirectory:readOnly:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "openAndCheckIfReadable"))
  {
    +[_CDInteractionAdviceEngine interactionAdviceEngineWithStore:](_CDInteractionAdviceEngine, "interactionAdviceEngineWithStore:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[_CDInteractionAdvisorSimple initWithInteractionAdvisor:](self, "initWithInteractionAdvisor:", v5);

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (_CDInteractionAdvisorSimple)initWithInteractionAdvisor:(id)a3
{
  id v4;
  _CDInteractionAdvisorSimple *v5;
  _CDInteractionAdvisorSimple *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_CDInteractionAdvisorSimple;
  v5 = -[_CDInteractionAdvisorSimple init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_CDInteractionAdvisorSimple setInteractionAdvisor:](v5, "setInteractionAdvisor:", v4);

  return v6;
}

- (id)bestInteractionMatchingHandles:(id)a3 mechanism:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a3;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionAdvisorSimple rankedInteractionsForHandles:mechanism:count:date:](self, "rankedInteractionsForHandles:mechanism:count:date:", v7, a4, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)bestInteractionMatchingContactID:(id)a3 mechanism:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a3;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionAdvisorSimple rankedInteractionsForPersonId:mechanism:count:date:](self, "rankedInteractionsForPersonId:mechanism:count:date:", v7, a4, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)bestInteractionMatchingDisplayName:(id)a3 mechanism:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a3;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionAdvisorSimple rankedInteractionsForDisplayName:mechanism:count:date:](self, "rankedInteractionsForDisplayName:mechanism:count:date:", v7, a4, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)rankedInteractionsForHandles:(id)a3 mechanism:(int64_t)a4 count:(int64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = a3;
  objc_msgSend(v8, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionAdvisorSimple rankedInteractionsForHandles:mechanism:count:date:](self, "rankedInteractionsForHandles:mechanism:count:date:", v9, a4, a5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)rankedInteractionsForHandles:(id)a3 mechanism:(int64_t)a4 count:(int64_t)a5 date:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = a6;
  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "advisorSettingsForMatchingHandles:mechanism:date:count:", v11, a4, v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDInteractionAdvisorSimple interactionAdvisor](self, "interactionAdvisor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "adviseInteractionsUsingSettings:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)rankedInteractionsForPersonId:(id)a3 mechanism:(int64_t)a4 count:(int64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = a3;
  objc_msgSend(v8, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionAdvisorSimple rankedInteractionsForPersonId:mechanism:count:date:](self, "rankedInteractionsForPersonId:mechanism:count:date:", v9, a4, a5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)rankedInteractionsForPersonId:(id)a3 mechanism:(int64_t)a4 count:(int64_t)a5 date:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = a6;
  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "advisorSettingsForMatchingPersonID:mechanism:date:count:", v11, a4, v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDInteractionAdvisorSimple interactionAdvisor](self, "interactionAdvisor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "adviseInteractionsUsingSettings:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)rankedInteractionsForDisplayName:(id)a3 mechanism:(int64_t)a4 count:(int64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = a3;
  objc_msgSend(v8, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionAdvisorSimple rankedInteractionsForDisplayName:mechanism:count:date:](self, "rankedInteractionsForDisplayName:mechanism:count:date:", v9, a4, a5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)rankedInteractionsForDisplayName:(id)a3 mechanism:(int64_t)a4 count:(int64_t)a5 date:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = a6;
  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "advisorSettingsForMatchingDisplayName:mechanism:date:count:", v11, a4, v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDInteractionAdvisorSimple interactionAdvisor](self, "interactionAdvisor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "adviseInteractionsUsingSettings:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)advisorSettingsForMatchingHandles:(id)a3 mechanism:(int64_t)a4 date:(id)a5 count:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a5;
  v10 = a3;
  +[_CDInteractionAdvisorSettings interactionAdvisorSettingsDefault](_CDInteractionAdvisorSettings, "interactionAdvisorSettingsDefault");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInteractionDate:", v9);

  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstrainMechanisms:", v14);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setConstrainIdentifiers:", v15);
  objc_msgSend(v11, "setConsumerIdentifier:", CFSTR("recency"));
  objc_msgSend(v11, "setResultLimit:", a6);
  return v11;
}

+ (id)advisorSettingsForMatchingPersonID:(id)a3 mechanism:(int64_t)a4 date:(id)a5 count:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a5;
  v10 = a3;
  +[_CDInteractionAdvisorSettings interactionAdvisorSettingsDefault](_CDInteractionAdvisorSettings, "interactionAdvisorSettingsDefault");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInteractionDate:", v9);

  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstrainMechanisms:", v14);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setConstrainPersonIds:", v15);
  objc_msgSend(v11, "setConsumerIdentifier:", CFSTR("recency"));
  objc_msgSend(v11, "setResultLimit:", a6);
  return v11;
}

+ (id)advisorSettingsForMatchingDisplayName:(id)a3 mechanism:(int64_t)a4 date:(id)a5 count:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = a5;
  v10 = a3;
  +[_CDInteractionAdvisorSettings interactionAdvisorSettingsDefault](_CDInteractionAdvisorSettings, "interactionAdvisorSettingsDefault");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInteractionDate:", v9);

  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstrainMechanisms:", v14);

  objc_msgSend(v11, "setContactPrefix:", v10);
  objc_msgSend(v11, "setConsumerIdentifier:", CFSTR("recency"));
  objc_msgSend(v11, "setResultLimit:", a6);
  return v11;
}

- (_CDInteractionAdvising)interactionAdvisor
{
  return (_CDInteractionAdvising *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInteractionAdvisor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionAdvisor, 0);
}

@end
