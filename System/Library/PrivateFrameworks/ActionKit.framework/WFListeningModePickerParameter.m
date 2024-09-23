@implementation WFListeningModePickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFListeningModePickerParameter)initWithDefinition:(id)a3
{
  WFListeningModePickerParameter *v3;
  WFListeningModePickerParameter *v4;
  WFListeningModePickerParameter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFListeningModePickerParameter;
  v3 = -[WFListeningModePickerParameter initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
  {
    -[WFDynamicEnumerationParameter setDataSource:](v3, "setDataSource:", v3);
    v5 = v4;
  }

  return v4;
}

- (void)setAction:(id)a3
{
  WFAction **p_action;
  id WeakRetained;
  id v6;
  id obj;

  p_action = &self->_action;
  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_action);
  objc_msgSend(WeakRetained, "removeEventObserver:", self);

  v6 = objc_storeWeak((id *)p_action, obj);
  objc_msgSend(obj, "addEventObserver:", self);

}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  -[WFListeningModePickerParameter action](self, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parameterStateForKey:", CFSTR("WFRoute"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_opt_new();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __96__WFListeningModePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
    v16[3] = &unk_24F8B4228;
    v19 = v6;
    v17 = v9;
    v18 = v10;
    v11 = v10;
    objc_msgSend(v11, "findRouteMatchingDescriptor:timeout:completionHandler:", v17, v16, 15.0);

    v12 = v19;
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BEC4270];
    v20 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Please select a valid route first"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 5, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v15);

  }
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v4;
  void *v5;
  char v6;
  __CFString *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;

  v4 = a4;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Normal"));

  if ((v6 & 1) != 0)
  {
    v7 = CFSTR("Off");
  }
  else
  {
    objc_msgSend(v4, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("ActiveNoiseCancellation"));

    if ((v9 & 1) != 0)
    {
      v7 = CFSTR("Noise Cancellation");
    }
    else
    {
      objc_msgSend(v4, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Transparency"));

      if ((v11 & 1) != 0)
      {
        v7 = CFSTR("Transparency");
      }
      else
      {
        objc_msgSend(v4, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Adaptive"));

        if (!v13)
        {
          v14 = 0;
          goto LABEL_10;
        }
        v7 = CFSTR("Adaptive");
      }
    }
  }
  WFLocalizedString(v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v14;
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("WFRoute")))
    -[WFDynamicEnumerationParameter clearPossibleStates](self, "clearPossibleStates");
}

- (WFAction)action
{
  return (WFAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
}

void __96__WFListeningModePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v5)
    goto LABEL_7;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v7 = (void *)getMPAVOutputDeviceRouteClass_softClass_18970;
  v27 = getMPAVOutputDeviceRouteClass_softClass_18970;
  if (!getMPAVOutputDeviceRouteClass_softClass_18970)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __getMPAVOutputDeviceRouteClass_block_invoke_18971;
    v23[3] = &unk_24F8BB430;
    v23[4] = &v24;
    __getMPAVOutputDeviceRouteClass_block_invoke_18971((uint64_t)v23);
    v7 = (void *)v25[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v24, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v5;
    WFAvailableListeningModesForRoute(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "if_map:", &__block_literal_global_18978);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9ED0]), "initWithItems:", v11);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v17 = *(_QWORD *)(a1 + 48);
      v18 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BDD0FC8];
      v19 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("Noise Control mode is not supported on %@"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "routeName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithFormat:", v11, v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v22);

    }
  }
  else
  {
LABEL_7:
    v13 = *(_QWORD *)(a1 + 48);
    v14 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0FC8];
    v15 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedStringWithKey(CFSTR("Could Not Find “%@” (Listening Mode)"), CFSTR("Could Not Find “%@”"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "routeName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v16);

  }
}

id __96__WFListeningModePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:", v3);

  return v4;
}

@end
