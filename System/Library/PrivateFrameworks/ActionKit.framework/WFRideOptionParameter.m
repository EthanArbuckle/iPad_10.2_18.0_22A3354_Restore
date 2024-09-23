@implementation WFRideOptionParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (BOOL)parameterStateIsValid:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;

  v5 = a3;
  -[WFDynamicEnumerationParameter possibleStates](self, "possibleStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[WFDynamicEnumerationParameter possibleStatesLoadingError](self, "possibleStatesLoadingError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_9;
  }
  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {

    if (v7)
      goto LABEL_5;
LABEL_9:
    v24 = 1;
    goto LABEL_14;
  }

  if (!v7)
    goto LABEL_9;
LABEL_5:
  v8 = (void *)MEMORY[0x24BDBCF20];
  -[WFDynamicEnumerationParameter possibleStates](self, "possibleStates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKeyPath:", CFSTR("value.name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "containsObject:", v13);

  if (v14)
  {
    -[WFRideOptionParameter action](self, "action");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRideOptionParameter definition](self, "definition");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("PartySizeKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "parameterStateForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v18, "value");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "number");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "unsignedIntegerValue");

      objc_msgSend(v5, "value");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "wf_isAvailableForPartySize:", v22);

    }
    else
    {
      v24 = 1;
    }

  }
  else
  {
    v24 = 0;
  }

LABEL_14:
  return v24;
}

- (void)setAction:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_action);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_action);
    objc_msgSend(v5, "removeEventObserver:", self);

    v6 = objc_storeWeak((id *)&self->_action, obj);
    objc_msgSend(obj, "addEventObserver:", self);

  }
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;

  v5 = a4;
  -[WFRideOptionParameter definition](self, "definition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("PartySizeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
    -[WFRideOptionParameter stateValidityCriteriaDidChange](self, "stateValidityCriteriaDidChange");
}

- (WFAction)action
{
  return (WFAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
}

@end
