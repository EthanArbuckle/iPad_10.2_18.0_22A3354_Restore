@implementation HUEventCreationUIFlow

- (HUEventCreationUIFlow)initWithTriggerBuilder:(id)a3 eventBuilderItem:(id)a4
{
  HUEventCreationUIFlow *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUEventCreationUIFlow;
  result = -[HUEventUIFlow initWithTriggerBuilder:eventBuilderItem:](&v5, sel_initWithTriggerBuilder_eventBuilderItem_, a3, a4);
  if (result)
    result->_modalInPresentation = 0;
  return result;
}

- (void)setupNavigationController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[HUEventUIFlow _updateEventTypeFromBuilder](self, "_updateEventTypeFromBuilder");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__HUEventCreationUIFlow_setupNavigationController__block_invoke;
  v7[3] = &unk_1E6F504A0;
  v7[4] = self;
  __50__HUEventCreationUIFlow_setupNavigationController__block_invoke((uint64_t)v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEventCreationUIFlow _viewControllerForStep:](self, "_viewControllerForStep:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v4);
    -[HUEventCreationUIFlow setNavigationController:](self, "setNavigationController:", v5);

    -[HUEventCreationUIFlow navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setModalPresentationStyle:", 2);

  }
  else
  {
    NSLog(CFSTR("Tried to setup navigation controller but no initial view controller available for step: %@!"), v3);
  }

}

id __50__HUEventCreationUIFlow_setupNavigationController__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "eventBuilderItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v3, "eventType");
  if (v2)
  {
    objc_msgSend(v3, "_summaryStepForEventType:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    if (v4)
      objc_msgSend(v6, "_initialStepForEventType:", objc_msgSend(v6, "eventType", v4));
    else
      objc_msgSend(v6, "_emptyConfigurationInitialStep");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)characteristicServicePickerViewControllerAllowChangingCharacteristic:(id)a3
{
  return 0;
}

- (void)transitionToViewController:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[HUEventCreationUIFlow navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "hu_pushPreloadableViewController:animated:", v6, 1);

}

- (id)_viewControllerForStep:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUEventCreationUIFlow;
  v4 = a3;
  -[HUEventUIFlow _viewControllerForStep:](&v8, sel__viewControllerForStep_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("typePicker"), v8.receiver, v8.super_class);

  if ((v6 & 1) == 0)
    objc_msgSend(v5, "setModalInPresentation:", -[HUEventCreationUIFlow modalInPresentation](self, "modalInPresentation"));
  return v5;
}

- (id)_emptyConfigurationInitialStep
{
  return CFSTR("typePicker");
}

- (id)_summaryStepForEventType:(unint64_t)a3
{
  if (a3 <= 5)
    self = *off_1E6F55830[a3];
  return self;
}

- (id)_initialStepForEventType:(unint64_t)a3
{
  __CFString **v3;

  if (a3 == 5)
  {
    v3 = HUEventUIFlowStepAlarmPicker;
    return *v3;
  }
  if (a3 == 4)
  {
    v3 = HUEventUIFlowStepAccessoryPicker;
    return *v3;
  }
  -[HUEventCreationUIFlow _summaryStepForEventType:](self, "_summaryStepForEventType:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (BOOL)modalInPresentation
{
  return self->_modalInPresentation;
}

- (void)setModalInPresentation:(BOOL)a3
{
  self->_modalInPresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end
