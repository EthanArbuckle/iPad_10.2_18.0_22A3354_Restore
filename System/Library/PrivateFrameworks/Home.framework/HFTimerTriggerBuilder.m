@implementation HFTimerTriggerBuilder

- (HFTimerTriggerBuilder)initWithExistingObject:(id)a3 inHome:(id)a4 context:(id)a5
{
  HFTimerTriggerBuilder *v5;
  HFTimerTriggerBuilder *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFTimerTriggerBuilder;
  v5 = -[HFTriggerBuilder initWithExistingObject:inHome:context:](&v8, sel_initWithExistingObject_inHome_context_, a3, a4, a5);
  v6 = v5;
  if (v5)
    -[HFTimerTriggerBuilder _createConcreteTriggerBuilder](v5, "_createConcreteTriggerBuilder");
  return v6;
}

- (id)validationError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  -[HFTimerTriggerBuilder concreteTriggerBuilder](self, "concreteTriggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggerActionSets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTriggerBuilder triggerActionSets](self, "triggerActionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateFromTriggerActionSetsBuilder:", v5);

  v13.receiver = self;
  v13.super_class = (Class)HFTimerTriggerBuilder;
  -[HFTriggerBuilder validationError](&v13, sel_validationError);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[HFItemBuilder verifyPropertiesAreSet:](self, "verifyPropertiesAreSet:", &unk_1EA7CDD80);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v8 = v9;
    }
    else
    {
      -[HFTimerTriggerBuilder concreteTriggerBuilder](self, "concreteTriggerBuilder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "validationError");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (void)_createConcreteTriggerBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __objc2_class *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[HFTriggerBuilder trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFTriggerBuilder trigger](self, "trigger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemBuilder home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTriggerBuilder context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFConcreteTimeTriggerBuilder builderForExistingTrigger:inHome:context:](HFConcreteTimeTriggerBuilder, "builderForExistingTrigger:inHome:context:", v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTimerTriggerBuilder setConcreteTriggerBuilder:](self, "setConcreteTriggerBuilder:", v7);

  }
  else
  {
    if (-[HFTimerTriggerBuilder _supportsEventBasedTimeTriggers](self, "_supportsEventBasedTimeTriggers"))
      v8 = HFEventTriggerBuilder;
    else
      v8 = HFTimerBasedTimeTriggerBuilder;
    v9 = [v8 alloc];
    -[HFItemBuilder home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTriggerBuilder context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v9, "initWithHome:context:", v4, v5);
    -[HFTimerTriggerBuilder setConcreteTriggerBuilder:](self, "setConcreteTriggerBuilder:", v6);
  }

  -[HFTimerTriggerBuilder timeInterface](self, "timeInterface");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[HFTimerTriggerBuilder concreteTriggerBuilder](self, "concreteTriggerBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1F041D080))
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (!v12)
  {
    objc_opt_class();
    -[HFTimerTriggerBuilder concreteTriggerBuilder](self, "concreteTriggerBuilder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    objc_msgSend(v14, "timeInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[HFTimerTriggerBuilder setTimeInterface:](self, "setTimeInterface:", v10);
  if (v16)
  {
    -[HFTimerTriggerBuilder timeInterface](self, "timeInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "copyCurrentStateFromTriggerBuilder:", v16);

  }
}

- (void)setPreferredHomeKitObjectType:(unint64_t)a3
{
  void *v4;

  if (self->_preferredHomeKitObjectType != a3)
  {
    self->_preferredHomeKitObjectType = a3;
    -[HFTriggerBuilder trigger](self, "trigger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      -[HFTimerTriggerBuilder _createConcreteTriggerBuilder](self, "_createConcreteTriggerBuilder");
  }
}

- (id)commitCreateTrigger
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HFTimerTriggerBuilder _lazy_performValidation](self, "_lazy_performValidation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__HFTimerTriggerBuilder_commitCreateTrigger__block_invoke;
  v6[3] = &unk_1EA726940;
  v6[4] = self;
  objc_msgSend(v3, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __44__HFTimerTriggerBuilder_commitCreateTrigger__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "concreteTriggerBuilder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "commitCreateTrigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)commitEditTrigger
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  if (-[HFTimerTriggerBuilder wantsConvertToEventTrigger](self, "wantsConvertToEventTrigger"))
  {
    -[HFTimerTriggerBuilder convertedEventTriggerBuilder](self, "convertedEventTriggerBuilder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "commitCreateTrigger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __42__HFTimerTriggerBuilder_commitEditTrigger__block_invoke;
      v9[3] = &unk_1EA734230;
      v9[4] = self;
      v10 = v4;
      objc_msgSend(v5, "flatMap:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 38);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "futureWithError:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[HFTimerTriggerBuilder concreteTriggerBuilder](self, "concreteTriggerBuilder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commitEditTrigger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

id __42__HFTimerTriggerBuilder_commitEditTrigger__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "setConcreteTriggerBuilder:", v3);
  objc_msgSend(*(id *)(a1 + 32), "replaceCurrentTriggerWithTrigger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)lazilyFinishCommitingTrigger
{
  void *v2;
  void *v3;

  -[HFTimerTriggerBuilder concreteTriggerBuilder](self, "concreteTriggerBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lazilyFinishCommitingTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)wantsConvertToEventTrigger
{
  void *v3;
  char v4;

  if (-[HFTimerTriggerBuilder _currentStateRequiresEventBasedTimeTriggers](self, "_currentStateRequiresEventBasedTimeTriggers"))
  {
    -[HFTimerTriggerBuilder concreteTriggerBuilder](self, "concreteTriggerBuilder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v4 = objc_opt_isKindOfClass() ^ 1;

  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (id)convertedEventTriggerBuilder
{
  HFEventTriggerBuilder *v3;
  void *v4;
  void *v5;
  HFEventTriggerBuilder *v6;
  void *v7;
  void *v8;
  void *v9;
  HFEventTriggerBuilder *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  HFEventTriggerBuilder *v19;
  uint8_t buf[4];
  HFTimerTriggerBuilder *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[HFTimerTriggerBuilder _supportsEventBasedTimeTriggers](self, "_supportsEventBasedTimeTriggers"))
  {
    v3 = [HFEventTriggerBuilder alloc];
    -[HFItemBuilder home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTriggerBuilder context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HFTriggerBuilder initWithHome:context:](v3, "initWithHome:context:", v4, v5);

    -[HFEventTriggerBuilder timeInterface](v6, "timeInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTimerTriggerBuilder timeInterface](self, "timeInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "copyCurrentStateFromTriggerBuilder:", v8);

    -[HFTriggerBuilder removeAllEndEventBuilders](v6, "removeAllEndEventBuilders");
    -[HFTriggerBuilder endEventBuilders](self, "endEventBuilders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __53__HFTimerTriggerBuilder_convertedEventTriggerBuilder__block_invoke;
    v18[3] = &unk_1EA729BE0;
    v10 = v6;
    v19 = v10;
    objc_msgSend(v9, "na_each:", v18);

    -[HFTriggerBuilder conditionCollection](self, "conditionCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTriggerBuilder replaceConditionsWithConditions:](v10, "replaceConditionsWithConditions:", v11);

    -[HFTriggerBuilder triggerActionSets](v10, "triggerActionSets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTriggerBuilder triggerActionSets](self, "triggerActionSets");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateFromTriggerActionSetsBuilder:", v13);

    -[HFTriggerBuilder name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTriggerBuilder setName:](v10, "setName:", v14);

    -[HFTriggerBuilder setNameIsConfigured:](v10, "setNameIsConfigured:", -[HFTriggerBuilder nameIsConfigured](self, "nameIsConfigured"));
    -[HFTriggerBuilder setEnabled:](v10, "setEnabled:", -[HFTriggerBuilder enabled](self, "enabled"));

    return v10;
  }
  else
  {
    HFLogForCategory(0x28uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[HFTriggerBuilder name](self, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "Attempting to use trigger features on timer trigger builder %@ (name:%@) that require supporting the new event-based time triggers when they are not currently supported in this home!", buf, 0x16u);

    }
    return 0;
  }
}

uint64_t __53__HFTimerTriggerBuilder_convertedEventTriggerBuilder__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEndEventBuilder:", a2);
}

- (id)naturalLanguageNameOfType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[HFItemBuilder home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFTriggerNaturalLanguageOptions optionsWithHome:nameType:](HFTriggerNaturalLanguageOptions, "optionsWithHome:nameType:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTimerTriggerBuilder naturalLanguageNameWithOptions:](self, "naturalLanguageNameWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HFTimerTriggerBuilder eventBuilder](self, "eventBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTimerTriggerBuilder recurrences](self, "recurrences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "naturalLanguageNameWithOptions:recurrences:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)naturalLanguageDetailsWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CBA910];
  v5 = a3;
  -[HFTimerTriggerBuilder recurrences](self, "recurrences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_naturalLanguageDetailsWithRecurrences:withOptions:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HFTimeEventBuilder)eventBuilder
{
  void *v2;
  void *v3;

  -[HFTimerTriggerBuilder timeInterface](self, "timeInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFTimeEventBuilder *)v3;
}

- (void)setEventBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFTimerTriggerBuilder timeInterface](self, "timeInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEventBuilder:", v4);

}

- (NSTimeZone)timeZone
{
  void *v2;
  void *v3;

  -[HFTimerTriggerBuilder timeInterface](self, "timeInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSTimeZone *)v3;
}

- (void)setTimeZone:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFTimerTriggerBuilder timeInterface](self, "timeInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v4);

}

- (NSArray)recurrences
{
  void *v2;
  void *v3;

  -[HFTimerTriggerBuilder timeInterface](self, "timeInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setRecurrences:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFTimerTriggerBuilder timeInterface](self, "timeInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecurrences:", v4);

}

- (void)setName:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFTimerTriggerBuilder;
  v4 = a3;
  -[HFTriggerBuilder setName:](&v6, sel_setName_, v4);
  -[HFTimerTriggerBuilder concreteTriggerBuilder](self, "concreteTriggerBuilder", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v4);

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = -[HFTriggerBuilder enabled](self, "enabled");
  v7.receiver = self;
  v7.super_class = (Class)HFTimerTriggerBuilder;
  -[HFTriggerBuilder setEnabled:](&v7, sel_setEnabled_, v3);
  if (v5 != v3)
  {
    -[HFTimerTriggerBuilder timeInterface](self, "timeInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "triggerEnabledStateDidChange:", v3);

  }
}

- (BOOL)_currentStateRequiresEventBasedTimeTriggers
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[HFTriggerBuilder endEventBuilders](self, "endEventBuilders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[HFTriggerBuilder conditionCollection](self, "conditionCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conditions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "count") != 0;

  }
  return v4;
}

- (BOOL)_supportsEventBasedTimeTriggers
{
  unint64_t v3;
  uint64_t v5;
  void *v6;
  char v7;

  v3 = -[HFTimerTriggerBuilder preferredHomeKitObjectType](self, "preferredHomeKitObjectType");
  if (v3 == 1)
    return 0;
  if (v3 == 2)
    return 1;
  v5 = HFPreferencesBooleanValueForKey(CFSTR("HFForcedEventBasedTimeTriggerAvailability"));
  if (v5)
    return v5 == 2;
  -[HFItemBuilder home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_supportsSharedEventAutomation");

  return v7;
}

- (id)_lazy_performValidation
{
  return -[HFItemBuilder lazy_verifyPropertiesAreSet:](self, "lazy_verifyPropertiesAreSet:", &unk_1EA7CDD98);
}

- (HFTriggerBuilder)concreteTriggerBuilder
{
  return self->_concreteTriggerBuilder;
}

- (void)setConcreteTriggerBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_concreteTriggerBuilder, a3);
}

- (unint64_t)preferredHomeKitObjectType
{
  return self->_preferredHomeKitObjectType;
}

- (HFConcreteTimeTriggerBuilderLikeObject)timeInterface
{
  return self->_timeInterface;
}

- (void)setTimeInterface:(id)a3
{
  objc_storeStrong((id *)&self->_timeInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeInterface, 0);
  objc_storeStrong((id *)&self->_concreteTriggerBuilder, 0);
}

- (id)getOrCreateTriggerBuilder
{
  void *v3;
  void *v4;
  void *v5;

  if (-[HFTimerTriggerBuilder wantsConvertToEventTrigger](self, "wantsConvertToEventTrigger"))
  {
    -[HFItemBuilder home](self, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "newEventTriggerBuilder");
    +[HFTriggerBuilderPair creatingTriggerWithBuilder:](HFTriggerBuilderPair, "creatingTriggerWithBuilder:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFTimerTriggerBuilder concreteTriggerBuilder](self, "concreteTriggerBuilder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getOrCreateTriggerBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)updateTriggerBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HFTimerTriggerBuilder wantsConvertToEventTrigger](self, "wantsConvertToEventTrigger")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[HFTimerTriggerBuilder convertedEventTriggerBuilder](self, "convertedEventTriggerBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateTriggerBuilder:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFTimerTriggerBuilder concreteTriggerBuilder](self, "concreteTriggerBuilder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[HFTimerTriggerBuilder concreteTriggerBuilder](self, "concreteTriggerBuilder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeAllEndEventBuilders");
      -[HFTriggerBuilder endEventBuilders](self, "endEventBuilders");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __66__HFTimerTriggerBuilder_AutomationBuilders__updateTriggerBuilder___block_invoke;
      v20[3] = &unk_1EA729BE0;
      v21 = v9;
      v11 = v9;
      objc_msgSend(v10, "na_each:", v20);

      -[HFTriggerBuilder conditionCollection](self, "conditionCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "replaceConditionsWithConditions:", v12);

      -[HFTimerTriggerBuilder recurrences](self, "recurrences");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setRecurrences:", v13);

    }
    v14 = (void *)MEMORY[0x1E0D519C0];
    -[HFTimerTriggerBuilder concreteTriggerBuilder](self, "concreteTriggerBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateTriggerBuilder:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v19.receiver = self;
    v19.super_class = (Class)HFTimerTriggerBuilder;
    -[HFTriggerBuilder updateTriggerBuilder:](&v19, sel_updateTriggerBuilder_, v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "combineAllFutures:", v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

uint64_t __66__HFTimerTriggerBuilder_AutomationBuilders__updateTriggerBuilder___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEndEventBuilder:", a2);
}

- (BOOL)supportsHomeKitAutomationBuilders
{
  void *v3;
  char v4;

  if (-[HFTimerTriggerBuilder wantsConvertToEventTrigger](self, "wantsConvertToEventTrigger"))
    -[HFTimerTriggerBuilder convertedEventTriggerBuilder](self, "convertedEventTriggerBuilder");
  else
    -[HFTimerTriggerBuilder concreteTriggerBuilder](self, "concreteTriggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsHomeKitAutomationBuilders");

  return v4;
}

- (id)_commitUsingBuilders
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  objc_super v14;

  if (-[HFTimerTriggerBuilder wantsConvertToEventTrigger](self, "wantsConvertToEventTrigger"))
  {
    -[HFTriggerBuilder trigger](self, "trigger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTriggerBuilder name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTriggerBuilder _uniquelyRenameTrigger:pendingReplaceByNewTriggerWithName:](self, "_uniquelyRenameTrigger:pendingReplaceByNewTriggerWithName:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__HFTimerTriggerBuilder_AutomationBuilders___commitUsingBuilders__block_invoke;
    v13[3] = &unk_1EA726940;
    v13[4] = self;
    objc_msgSend(v5, "flatMap:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __65__HFTimerTriggerBuilder_AutomationBuilders___commitUsingBuilders__block_invoke_2;
    v11[3] = &unk_1EA739BF0;
    v11[4] = self;
    v12 = v3;
    v8 = v3;
    objc_msgSend(v7, "flatMap:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HFTimerTriggerBuilder;
    -[HFTriggerBuilder _commitUsingBuilders](&v14, sel__commitUsingBuilders);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

id __65__HFTimerTriggerBuilder_AutomationBuilders___commitUsingBuilders__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)HFTimerTriggerBuilder;
  objc_msgSendSuper2(&v2, sel__commitUsingBuilders);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __65__HFTimerTriggerBuilder_AutomationBuilders___commitUsingBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "convertedEventTriggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setConcreteTriggerBuilder:", v4);

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_deleteTrigger:fromHome:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__HFTimerTriggerBuilder_AutomationBuilders___commitUsingBuilders__block_invoke_3;
  v12[3] = &unk_1EA732620;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v3;
  v9 = v3;
  objc_msgSend(v8, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __65__HFTimerTriggerBuilder_AutomationBuilders___commitUsingBuilders__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_didReplaceBackingTrigger");
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 40));
}

- (id)compareToObject:(id)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFTimerTriggerBuilder;
  -[HFTriggerBuilder compareToObject:](&v5, sel_compareToObject_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containsCriticalDifference");
  return v3;
}

@end
