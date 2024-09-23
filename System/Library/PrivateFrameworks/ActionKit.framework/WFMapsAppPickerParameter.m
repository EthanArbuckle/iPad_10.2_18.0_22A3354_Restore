@implementation WFMapsAppPickerParameter

- (WFMapsAppPickerParameter)initWithDefinition:(id)a3
{
  id v4;
  WFMapsAppPickerParameter *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSOrderedSet *supportedAppIdentifiers;
  WFMapsAppPickerParameter *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFMapsAppPickerParameter;
  v5 = -[WFMapsAppPickerParameter initWithDefinition:](&v19, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("SupportedApps"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = (void *)objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v21 = "WFEnforceClass";
        v22 = 2114;
        v23 = v8;
        v24 = 2114;
        v25 = v11;
        v26 = 2114;
        v27 = v7;
        v12 = v11;
        _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

      }
      v9 = 0;
    }
    else
    {
      v9 = v8;
    }

    v13 = (void *)MEMORY[0x24BDBCF00];
    objc_msgSend(v9, "if_compactMap:", &__block_literal_global_3963);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "orderedSetWithArray:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    supportedAppIdentifiers = v5->_supportedAppIdentifiers;
    v5->_supportedAppIdentifiers = (NSOrderedSet *)v15;

    v17 = v5;
  }

  return v5;
}

- (void)wasAddedToWorkflow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFMapsAppPickerParameter;
  -[WFMapsAppPickerParameter wasAddedToWorkflow](&v3, sel_wasAddedToWorkflow);
  -[WFMapsAppPickerParameter refreshInstalledApps](self, "refreshInstalledApps");
  -[WFMapsAppPickerParameter addObservers](self, "addObservers");
}

- (void)wasRemovedFromWorkflow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFMapsAppPickerParameter;
  -[WFMapsAppPickerParameter wasRemovedFromWorkflow](&v3, sel_wasRemovedFromWorkflow);
  -[WFMapsAppPickerParameter removeObservers](self, "removeObservers");
}

- (void)dealloc
{
  objc_super v3;

  -[WFMapsAppPickerParameter removeObservers](self, "removeObservers");
  v3.receiver = self;
  v3.super_class = (Class)WFMapsAppPickerParameter;
  -[WFMapsAppPickerParameter dealloc](&v3, sel_dealloc);
}

- (id)possibleStatesForLocalization
{
  void *v2;
  void *v3;
  void *v4;

  WFMapsAppNamesByIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_compactMap:", &__block_literal_global_159);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedMapsAppNameForAppName(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)refreshInstalledApps
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *possibleStates;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BEC39F0], "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMapsAppPickerParameter supportedAppIdentifiers](self, "supportedAppIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appsWithIdentifiers:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "if_compactMap:", &__block_literal_global_163);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  possibleStates = self->_possibleStates;
  self->_possibleStates = v6;

  -[WFMapsAppPickerParameter possibleStatesDidChange](self, "possibleStatesDidChange");
  -[WFMapsAppPickerParameter possibleStates](self, "possibleStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMapsAppPickerParameter setHidden:](self, "setHidden:", (unint64_t)objc_msgSend(v8, "count") < 2);

}

- (void)addObservers
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEC39F0], "sharedRegistry");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFMapsAppPickerParameter supportedAppIdentifiers](self, "supportedAppIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addInstallStatusObserver:forAppIdentifiers:", self, v4);

}

- (void)removeObservers
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEC39F0], "sharedRegistry");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFMapsAppPickerParameter supportedAppIdentifiers](self, "supportedAppIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeInstallStatusObserver:forAppIdentifiers:", self, v4);

}

- (id)possibleStates
{
  return self->_possibleStates;
}

- (NSOrderedSet)supportedAppIdentifiers
{
  return self->_supportedAppIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedAppIdentifiers, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

id __48__WFMapsAppPickerParameter_refreshInstalledApps__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  if (objc_msgSend(v2, "isInstalled"))
  {
    v3 = objc_alloc(MEMORY[0x24BEC40C8]);
    WFMapsAppNamesByIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithValue:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __57__WFMapsAppPickerParameter_possibleStatesForLocalization__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:", v3);

  return v4;
}

id __47__WFMapsAppPickerParameter_initWithDefinition___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  WFMapsAppNamesByIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeysForObject:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
