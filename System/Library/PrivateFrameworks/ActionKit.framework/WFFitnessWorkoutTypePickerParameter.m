@implementation WFFitnessWorkoutTypePickerParameter

- (WFFitnessWorkoutTypePickerParameter)initWithDefinition:(id)a3
{
  WFFitnessWorkoutTypePickerParameter *v3;
  WFFitnessWorkoutTypePickerParameter *v4;
  WFFitnessWorkoutTypePickerParameter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFFitnessWorkoutTypePickerParameter;
  v3 = -[WFFitnessWorkoutTypePickerParameter initWithDefinition:](&v7, sel_initWithDefinition_, a3);
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

- (void)wasAddedToWorkflow
{
  const char *v3;
  _QWORD handler[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFFitnessWorkoutTypePickerParameter;
  -[WFFitnessWorkoutTypePickerParameter wasAddedToWorkflow](&v5, sel_wasAddedToWorkflow);
  -[WFFitnessWorkoutTypePickerParameter saveStateIfNeeded](self, "saveStateIfNeeded");
  v3 = (const char *)*MEMORY[0x24BDD46E8];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __57__WFFitnessWorkoutTypePickerParameter_wasAddedToWorkflow__block_invoke;
  handler[3] = &unk_24F8B47A0;
  handler[4] = self;
  notify_register_dispatch(v3, &self->_characteristicUpdateToken, MEMORY[0x24BDAC9B8], handler);
}

- (void)defaultSerializedRepresentationDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFFitnessWorkoutTypePickerParameter;
  -[WFDynamicEnumerationParameter defaultSerializedRepresentationDidChange](&v3, sel_defaultSerializedRepresentationDidChange);
  -[WFFitnessWorkoutTypePickerParameter saveStateIfNeeded](self, "saveStateIfNeeded");
}

- (void)saveStateIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[WFFitnessWorkoutTypePickerParameter action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFitnessWorkoutTypePickerParameter key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameterStateForKey:fallingBackToDefaultValue:", v4, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v11;
  if (!v11)
  {
    -[WFFitnessWorkoutTypePickerParameter action](self, "action");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFitnessWorkoutTypePickerParameter key](self, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parameterStateForKey:fallingBackToDefaultValue:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFFitnessWorkoutTypePickerParameter action](self, "action");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFitnessWorkoutTypePickerParameter key](self, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setParameterState:forKey:", v8, v10);

    v5 = 0;
  }

}

- (void)wasRemovedFromWorkflow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFFitnessWorkoutTypePickerParameter;
  -[WFFitnessWorkoutTypePickerParameter wasRemovedFromWorkflow](&v3, sel_wasRemovedFromWorkflow);
  if (notify_is_valid_token(self->_characteristicUpdateToken))
    notify_cancel(self->_characteristicUpdateToken);
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)localizedPlaceholder
{
  return WFLocalizedString(CFSTR("Workout Type"));
}

- (void)wf_reloadFromAttributesDidChangeWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WFDynamicEnumerationParameter possibleStates](self, "possibleStates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDD9ED0]);
    -[WFDynamicEnumerationParameter possibleStates](self, "possibleStates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithItems:", v6);
    (*((void (**)(id, void *, _QWORD, _QWORD))v8 + 2))(v8, v7, 0, 0);

  }
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "value", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id defaultSerializedWorkoutRepresentation;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  +[WFFitnessUIHelper allActivityTypes](WFFitnessUIHelper, "allActivityTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "if_map:", &__block_literal_global_21073);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!self->_defaultSerializedWorkoutRepresentation)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = -1;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __101__WFFitnessWorkoutTypePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2;
    v18[3] = &unk_24F8B4808;
    v18[4] = &v19;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v18);
    if (v20[3])
      objc_msgSend(v13, "objectAtIndex:");
    else
      objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serializedRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    defaultSerializedWorkoutRepresentation = self->_defaultSerializedWorkoutRepresentation;
    self->_defaultSerializedWorkoutRepresentation = v15;

    _Block_object_dispose(&v19, 8);
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9ED0]), "initWithItems:", v13);
  v10[2](v10, v17, 0);

}

- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  -[WFFitnessWorkoutTypePickerParameter defaultSerializedWorkoutRepresentation](self, "defaultSerializedWorkoutRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFFitnessWorkoutTypePickerParameter defaultSerializedWorkoutRepresentation](self, "defaultSerializedWorkoutRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9, 0);

  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __107__WFFitnessWorkoutTypePickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke;
    v10[3] = &unk_24F8B4830;
    v10[4] = self;
    v11 = v7;
    -[WFFitnessWorkoutTypePickerParameter loadPossibleStatesForEnumeration:searchTerm:completionHandler:](self, "loadPossibleStatesForEnumeration:searchTerm:completionHandler:", v6, 0, v10);

  }
}

- (WFAction)action
{
  return (WFAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (id)defaultSerializedWorkoutRepresentation
{
  return self->_defaultSerializedWorkoutRepresentation;
}

- (void)setDefaultSerializedWorkoutRepresentation:(id)a3
{
  objc_storeStrong(&self->_defaultSerializedWorkoutRepresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultSerializedWorkoutRepresentation, 0);
  objc_destroyWeak((id *)&self->_action);
}

void __107__WFFitnessWorkoutTypePickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = a3;
  objc_msgSend(v4, "defaultSerializedWorkoutRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

}

void __101__WFFitnessWorkoutTypePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  objc_msgSend(a2, "value");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "identifier") == 37 && (objc_msgSend(v7, "isIndoor") & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }

}

WFFIUIWorkoutActivityTypeSubstitutableState *__101__WFFitnessWorkoutTypePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFFIUIWorkoutActivityTypeSubstitutableState *v3;

  v2 = a2;
  v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFFIUIWorkoutActivityTypeSubstitutableState alloc], "initWithValue:", v2);

  return v3;
}

uint64_t __57__WFFitnessWorkoutTypePickerParameter_wasAddedToWorkflow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadPossibleStates");
}

@end
