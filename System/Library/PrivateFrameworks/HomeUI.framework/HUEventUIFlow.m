@implementation HUEventUIFlow

- (HUEventUIFlow)initWithTriggerBuilder:(id)a3 eventBuilderItem:(id)a4
{
  id v7;
  id v8;
  HUEventUIFlow *v9;
  HUEventUIFlow *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUEventUIFlow;
  v9 = -[HUEventUIFlow init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_triggerBuilder, a3);
    objc_storeStrong((id *)&v10->_originalEventBuilderItem, a4);
    objc_storeStrong((id *)&v10->_eventBuilderItem, a4);
    v10->_eventType = 0;
    v10->_isPresentedModally = 0;
    -[HUEventUIFlow _updateEventTypeFromBuilder](v10, "_updateEventTypeFromBuilder");
  }

  return v10;
}

- (void)viewController:(id)a3 didCancelStepWithIdentifier:(id)a4
{
  id v5;

  -[HUEventUIFlow delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventFlowDidCancel:", self);

}

- (void)viewController:(id)a3 didFinishStepWithIdentifier:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HUEventUIFlow _stepFolowingStep:](self, "_stepFolowingStep:", a4);
  v5 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v5;
  if (v5)
  {
    -[HUEventUIFlow _presentViewControllerForStep:](self, "_presentViewControllerForStep:", v5);
  }
  else
  {
    -[HUEventUIFlow eventBuilderItem](self, "eventBuilderItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      NSLog(CFSTR("Event builder should not be nil"));
    -[HUEventUIFlow delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEventUIFlow eventBuilderItem](self, "eventBuilderItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventFlow:didFinishWithEventBuilderItem:", self, v8);

  }
}

- (BOOL)shouldShowDoneButtonForStep:(id)a3
{
  _BOOL4 v4;

  v4 = -[HUEventUIFlow isFlowCompleteAfterStep:](self, "isFlowCompleteAfterStep:", a3);
  if (v4)
    LOBYTE(v4) = -[HUEventUIFlow isPresentedModally](self, "isPresentedModally");
  return v4;
}

- (BOOL)isFlowCompleteAfterStep:(id)a3
{
  void *v3;
  BOOL v4;

  -[HUEventUIFlow _stepFolowingStep:](self, "_stepFolowingStep:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)shouldShowNextButtonForStep:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HUEventUIFlow isFlowCompleteAfterStep:](self, "isFlowCompleteAfterStep:", v4))
  {
    v5 = 0;
  }
  else
  {
    v9[0] = CFSTR("alarmPicker");
    v9[1] = CFSTR("accessoryPicker");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsObject:", v4))
    {
      -[HUEventUIFlow originalEventBuilderItem](self, "originalEventBuilderItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7 == 0;

    }
    else
    {
      v5 = 1;
    }

  }
  return v5;
}

- (BOOL)shouldSaveEventBuildersToTriggerBuilderForStep:(id)a3
{
  void *v3;
  BOOL v4;

  -[HUEventUIFlow originalEventBuilderItem](self, "originalEventBuilderItem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)buildInitialViewController
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[HUEventUIFlow _updateEventTypeFromBuilder](self, "_updateEventTypeFromBuilder");
  -[HUEventUIFlow eventBuilderItem](self, "eventBuilderItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[HUEventUIFlow eventType](self, "eventType");
  if (v3)
  {
    -[HUEventUIFlow _summaryStepForEventType:](self, "_summaryStepForEventType:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
      -[HUEventUIFlow _initialStepForEventType:](self, "_initialStepForEventType:", -[HUEventUIFlow eventType](self, "eventType"));
    else
      -[HUEventUIFlow _emptyConfigurationInitialStep](self, "_emptyConfigurationInitialStep");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  -[HUEventUIFlow _viewControllerForStep:](self, "_viewControllerForStep:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)viewController:(id)a3 didSelectEventType:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  -[HUEventUIFlow setEventType:](self, "setEventType:", a4);
  -[HUEventUIFlow _initialEventBuilderItemForType:](self, "_initialEventBuilderItemForType:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HUEventUIFlow eventBuilderItem](self, "eventBuilderItem");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        v8 = objc_opt_class(),
        -[HUEventUIFlow eventBuilderItem](self, "eventBuilderItem"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v8) = objc_msgSend((id)v8, "isEqual:", objc_opt_class()),
        v9,
        v7,
        (v8 & 1) == 0))
  {
    -[HUEventUIFlow setEventBuilderItem:](self, "setEventBuilderItem:", v11);
  }
  -[HUEventUIFlow _initialStepForEventType:](self, "_initialStepForEventType:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEventUIFlow _presentViewControllerForStep:](self, "_presentViewControllerForStep:", v10);

}

- (unint64_t)viewController:(id)a3 servicePickerSourceForStep:(id)a4
{
  return objc_msgSend(a4, "isEqualToString:", CFSTR("alarmPicker")) ^ 1;
}

- (BOOL)characteristicEditorAllowChangingCharacteristic:(id)a3
{
  void *v3;
  BOOL v4;

  -[HUEventUIFlow originalEventBuilderItem](self, "originalEventBuilderItem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)characteristicEditorDidSelectToChangeCharacteristic:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[HUEventUIFlow _updateEventTypeFromBuilder](self, "_updateEventTypeFromBuilder", a3);
  -[HUEventUIFlow _characteristicSelectionStepForEventType:](self, "_characteristicSelectionStepForEventType:", -[HUEventUIFlow eventType](self, "eventType"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUEventUIFlow _viewControllerForStep:](self, "_viewControllerForStep:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEventUIFlow presentationController](self, "presentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionToViewController:", v4);

}

- (id)_initialEventBuilderItemForType:(unint64_t)a3
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;

  switch(a3)
  {
    case 0uLL:
      v4 = (objc_class *)MEMORY[0x1E0D313B0];
      goto LABEL_6;
    case 1uLL:
    case 2uLL:
      v4 = (objc_class *)MEMORY[0x1E0D314D8];
      goto LABEL_6;
    case 3uLL:
      v4 = (objc_class *)MEMORY[0x1E0D31908];
      goto LABEL_6;
    case 4uLL:
    case 5uLL:
      v4 = (objc_class *)MEMORY[0x1E0D312B0];
LABEL_6:
      v5 = [v4 alloc];
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v5, "initWithEventBuilders:", v6);

      break;
    default:
      return v3;
  }
  return v3;
}

- (void)_updateEventTypeFromBuilder
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  HUEventUIFlow *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, void *);
  void *v31;
  id v32;

  -[HUEventUIFlow eventBuilderItem](self, "eventBuilderItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUEventUIFlow eventBuilderItem](self, "eventBuilderItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[HUEventUIFlow eventBuilderItem](self, "eventBuilderItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v6;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CBA458], "hf_sensingCharacteristicTypes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "characteristics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v30 = __44__HUEventUIFlow__updateEventTypeFromBuilder__block_invoke;
      v31 = &unk_1E6F4EE30;
      v32 = v7;
      v9 = v7;
      v10 = objc_msgSend(v8, "na_any:", &v28);

      if (v10)
        v11 = 5;
      else
        v11 = 4;
      -[HUEventUIFlow setEventType:](self, "setEventType:", v11, v25, v28, v29, v30, v31);

LABEL_15:
      return;
    }
    objc_msgSend(v6, "eventBuilders");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "conformsToProtocol:", &unk_1EF348150);

    if (v14)
    {
      v15 = self;
      v16 = 3;
    }
    else
    {
      -[HUEventUIFlow eventBuilderItem](self, "eventBuilderItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "eventBuilders");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "anyObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "conformsToProtocol:", &unk_1EF347FD0);

      if (v20)
      {
        -[HUEventUIFlow eventBuilderItem](self, "eventBuilderItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "eventBuilders");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "anyObject");
        v27 = (id)objc_claimAutoreleasedReturnValue();

        v23 = objc_msgSend(v27, "locationEventType");
        if (v23 == 1)
          v24 = 1;
        else
          v24 = 2 * (v23 == 2);
        -[HUEventUIFlow setEventType:](self, "setEventType:", v24, v27);
        goto LABEL_15;
      }
      v15 = self;
      v16 = 0;
    }
    -[HUEventUIFlow setEventType:](v15, "setEventType:", v16);
  }
}

uint64_t __44__HUEventUIFlow__updateEventTypeFromBuilder__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)_emptyConfigurationInitialStep
{
  return CFSTR("typePicker");
}

- (id)_summaryStepForEventType:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("characteristicEventEditor");
  else
    return off_1E6F561F8[a3];
}

- (id)_initialStepForEventType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;

  if (a3 == 4)
    return CFSTR("accessoryPicker");
  if (a3 == 5)
  {
    v5 = CFSTR("alarmPicker");
  }
  else
  {
    -[HUEventUIFlow _summaryStepForEventType:](self, "_summaryStepForEventType:", v3, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_characteristicSelectionStepForEventType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("alarmPicker");
  if (a3 != 5)
    v3 = 0;
  if (a3 == 4)
    return CFSTR("accessoryPicker");
  else
    return (id)v3;
}

- (id)_stepFolowingStep:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("typePicker")))
  {
    -[HUEventUIFlow _initialStepForEventType:](self, "_initialStepForEventType:", -[HUEventUIFlow eventType](self, "eventType"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10[0] = CFSTR("accessoryPicker");
    v10[1] = CFSTR("alarmPicker");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if (!v7)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[HUEventUIFlow _summaryStepForEventType:](self, "_summaryStepForEventType:", 4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v5;
LABEL_7:

  return v8;
}

- (void)_presentViewControllerForStep:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HUEventUIFlow _viewControllerForStep:](self, "_viewControllerForStep:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HUEventUIFlow presentationController](self, "presentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transitionToViewController:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:descriptionFormat:", 36, CFSTR("View controller not yet implemented for step with identifier: %@"), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleError:", v6);

  }
}

- (id)_viewControllerForStep:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HUEventUIFlow _createViewControllerWithClass:step:](self, "_createViewControllerWithClass:step:", -[HUEventUIFlow _viewControllerClassForStep:](self, "_viewControllerClassForStep:", v4), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (Class)_viewControllerClassForStep:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("typePicker")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("locationEventEditor")) & 1) != 0
    || (v8[0] = CFSTR("alarmPicker"),
        v8[1] = CFSTR("accessoryPicker"),
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "containsObject:", v3),
        v4,
        (v5 & 1) != 0)
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("characteristicEventEditor")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("timeEventEditor")))
  {
    objc_opt_class();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (Class)v6;
}

- (id)_createViewControllerWithClass:(Class)a3 step:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend([a3 alloc], "initWithFlow:stepIdentifier:", self, v6);

  return v7;
}

- (HFEventBuilderItem)eventBuilderItem
{
  return self->_eventBuilderItem;
}

- (void)setEventBuilderItem:(id)a3
{
  objc_storeStrong((id *)&self->_eventBuilderItem, a3);
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void)setTriggerBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_triggerBuilder, a3);
}

- (HFEventBuilderItem)originalEventBuilderItem
{
  return self->_originalEventBuilderItem;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (HUEventUIFlowDelegate)delegate
{
  return (HUEventUIFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUEventUIFlowPresentationController)presentationController
{
  return (HUEventUIFlowPresentationController *)objc_loadWeakRetained((id *)&self->_presentationController);
}

- (void)setPresentationController:(id)a3
{
  objc_storeWeak((id *)&self->_presentationController, a3);
}

- (BOOL)isPresentedModally
{
  return self->_isPresentedModally;
}

- (void)setIsPresentedModally:(BOOL)a3
{
  self->_isPresentedModally = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_originalEventBuilderItem, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
  objc_storeStrong((id *)&self->_eventBuilderItem, 0);
}

@end
