@implementation WFAccountPickerParameter

- (WFAccountPickerParameter)initWithDefinition:(id)a3
{
  id v4;
  WFAccountPickerParameter *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSString *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  Class accountClass;
  Class v15;
  uint64_t v16;
  id observer;
  WFAccountPickerParameter *v18;
  _QWORD v20[4];
  id v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WFAccountPickerParameter;
  v5 = -[WFAccountPickerParameter initWithDefinition:](&v22, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AccountClass"));
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
        v24 = "WFEnforceClass";
        v25 = 2114;
        v26 = v8;
        v27 = 2114;
        v28 = v11;
        v29 = 2114;
        v30 = v7;
        v12 = v11;
        _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

      }
      v9 = 0;
    }
    else
    {
      v9 = (NSString *)v8;
    }

    NSClassFromString(v9);
    v13 = objc_claimAutoreleasedReturnValue();
    accountClass = v5->_accountClass;
    v5->_accountClass = (Class)v13;

    objc_initWeak((id *)buf, v5);
    v15 = v5->_accountClass;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __47__WFAccountPickerParameter_initWithDefinition___block_invoke;
    v20[3] = &unk_24F8B76C8;
    objc_copyWeak(&v21, (id *)buf);
    -[objc_class addAccountObserver:](v15, "addAccountObserver:", v20);
    v16 = objc_claimAutoreleasedReturnValue();
    observer = v5->_observer;
    v5->_observer = (id)v16;

    v18 = v5;
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

  return v5;
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  objc_super v5;

  v3 = -[WFAccountPickerParameter accountClass](self, "accountClass");
  -[WFAccountPickerParameter observer](self, "observer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class removeAccountObserver:](v3, "removeAccountObserver:", v4);

  v5.receiver = self;
  v5.super_class = (Class)WFAccountPickerParameter;
  -[WFAccountPickerParameter dealloc](&v5, sel_dealloc);
}

- (void)wasAddedToWorkflow
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)WFAccountPickerParameter;
  -[WFAccountPickerParameter wasAddedToWorkflow](&v12, sel_wasAddedToWorkflow);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[objc_class accounts](-[WFAccountPickerParameter accountClass](self, "accountClass", 0), "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "refreshWithCompletionHandler:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void)possibleStatesDidChange
{
  NSArray *possibleStates;
  objc_super v4;

  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  -[WFAccountPickerParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
  v4.receiver = self;
  v4.super_class = (Class)WFAccountPickerParameter;
  -[WFAccountPickerParameter possibleStatesDidChange](&v4, sel_possibleStatesDidChange);
}

- (BOOL)isHidden
{
  return (unint64_t)-[objc_class numberOfAccounts](-[WFAccountPickerParameter accountClass](self, "accountClass"), "numberOfAccounts") < 2;
}

- (id)defaultSerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[objc_class accounts](-[WFAccountPickerParameter accountClass](self, "accountClass"), "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEC40C8], "serializedRepresentationFromValue:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    -[objc_class accounts](-[WFAccountPickerParameter accountClass](self, "accountClass"), "accounts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "if_compactMap:", &__block_literal_global_6957);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_possibleStates;
    self->_possibleStates = v5;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  return (id)objc_msgSend(a3, "value");
}

- (id)accountWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[objc_class accounts](-[WFAccountPickerParameter accountClass](self, "accountClass"), "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectMatchingKey:value:", CFSTR("localizedName"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (Class)accountClass
{
  return self->_accountClass;
}

- (id)observer
{
  return self->_observer;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
  objc_storeStrong((id *)&self->_accountClass, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

id __42__WFAccountPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEC40C8]);
    objc_msgSend(v2, "localizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithValue:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __47__WFAccountPickerParameter_initWithDefinition___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "possibleStatesDidChange");

}

@end
