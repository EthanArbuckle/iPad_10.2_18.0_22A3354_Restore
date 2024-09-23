@implementation HUCharacteristicEventServicePickerViewController

+ (BOOL)canPickServicesFromSource:(unint64_t)a3 home:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  if (a3 == 1)
  {
    v9 = +[HUCharacteristicEventOptionProvider hasOptionsForAnyServiceInHome:](HUCharacteristicEventOptionProvider, "hasOptionsForAnyServiceInHome:", v5);
  }
  else if (a3)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CBA458], "hf_sensingCharacteristicTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83__HUCharacteristicEventServicePickerViewController_canPickServicesFromSource_home___block_invoke;
    v11[3] = &unk_1E6F4E5D8;
    v12 = v6;
    v8 = v6;
    v9 = objc_msgSend(v7, "na_any:", v11);

  }
  return v9;
}

uint64_t __83__HUCharacteristicEventServicePickerViewController_canPickServicesFromSource_home___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__HUCharacteristicEventServicePickerViewController_canPickServicesFromSource_home___block_invoke_2;
  v6[3] = &unk_1E6F4EE58;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __83__HUCharacteristicEventServicePickerViewController_canPickServicesFromSource_home___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__HUCharacteristicEventServicePickerViewController_canPickServicesFromSource_home___block_invoke_3;
  v6[3] = &unk_1E6F4EE30;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __83__HUCharacteristicEventServicePickerViewController_canPickServicesFromSource_home___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {
    objc_msgSend(v3, "properties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0CB8780]);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (unint64_t)sourceForTriggerBuilder:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0CBA458];
  v4 = a3;
  objc_msgSend(v3, "hf_sensingCharacteristicTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__HUCharacteristicEventServicePickerViewController_sourceForTriggerBuilder___block_invoke;
  v9[3] = &unk_1E6F4EE30;
  v10 = v5;
  v7 = v5;
  LODWORD(v4) = objc_msgSend(v6, "na_any:", v9);

  return v4 ^ 1;
}

uint64_t __76__HUCharacteristicEventServicePickerViewController_sourceForTriggerBuilder___block_invoke(uint64_t a1, void *a2)
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

- (HUCharacteristicEventServicePickerViewController)initWithInstructionsItem:(id)a3 contentViewController:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithEventBuilderItem_triggerBuilder_source_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCharacteristicEventServicePickerViewController.m"), 74, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCharacteristicEventServicePickerViewController initWithInstructionsItem:contentViewController:]",
    v7);

  return 0;
}

- (HUCharacteristicEventServicePickerViewController)initWithEventBuilderItem:(id)a3 triggerBuilder:(id)a4 source:(unint64_t)a5
{
  return -[HUCharacteristicEventServicePickerViewController initWithEventBuilderItem:triggerBuilder:source:flow:stepIdentifier:](self, "initWithEventBuilderItem:triggerBuilder:source:flow:stepIdentifier:", a3, a4, a5, 0, 0);
}

- (HUCharacteristicEventServicePickerViewController)initWithEventBuilderItem:(id)a3 triggerBuilder:(id)a4 source:(unint64_t)a5 flow:(id)a6 stepIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  HUCharacteristicEventServicePickerViewController *v19;
  HUCharacteristicEventServicePickerViewController *v20;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc((Class)objc_opt_class());
  if (v14 && v15)
    v17 = (void *)objc_msgSend(v16, "initWithFlow:stepIdentifier:", v14, v15);
  else
    v17 = (void *)objc_msgSend(v16, "initWithTriggerBuilder:eventBuilderItem:source:", v13, v12, a5);
  v18 = v17;
  objc_msgSend(v17, "setContentMargins:", 1);
  objc_msgSend(v18, "setServicePickerDelegate:", self);
  v22.receiver = self;
  v22.super_class = (Class)HUCharacteristicEventServicePickerViewController;
  v19 = -[HUInstructionsTableViewController initWithInstructionsItem:contentViewController:](&v22, sel_initWithInstructionsItem_contentViewController_, 0, v18);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_triggerBuilder, a4);
    -[HUCharacteristicEventServicePickerViewController setFlow:](v20, "setFlow:", v14);
    -[HUCharacteristicEventServicePickerViewController setStepIdentifier:](v20, "setStepIdentifier:", v15);
  }

  return v20;
}

- (HUCharacteristicEventServicePickerViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  HUCharacteristicEventServicePickerViewController *v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "viewController:servicePickerSourceForStep:", self, v6);
  objc_msgSend(v7, "eventBuilderItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "triggerBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUCharacteristicEventServicePickerViewController initWithEventBuilderItem:triggerBuilder:source:flow:stepIdentifier:](self, "initWithEventBuilderItem:triggerBuilder:source:flow:stepIdentifier:", v9, v10, v8, v7, v6);

  return v11;
}

- (void)viewDidLoad
{
  unint64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HUCharacteristicEventServicePickerViewController;
  -[HUInstructionsTableViewController viewDidLoad](&v17, sel_viewDidLoad);
  v3 = -[HUCharacteristicEventServicePickerViewController source](self, "source");
  if (v3 == 1)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUCharacteristicTriggerServicePickerTitleAccessory"), CFSTR("HUCharacteristicTriggerServicePickerTitleAccessory"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("HUCharacteristicTriggerServicePickerInstructionsDescriptionAccessory");
    goto LABEL_5;
  }
  if (!v3)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUCharacteristicTriggerServicePickerTitleAlarm"), CFSTR("HUCharacteristicTriggerServicePickerTitleAlarm"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("HUCharacteristicTriggerServicePickerInstructionsDescriptionAlarm");
LABEL_5:
    _HULocalizedStringWithDefaultValue(v5, v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v4 = 0;
  v6 = 0;
LABEL_7:
  -[HUCharacteristicEventServicePickerViewController setTitle:](self, "setTitle:", v4);
  -[HUCharacteristicEventServicePickerViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrompt:", v6);

  _HULocalizedStringWithDefaultValue(CFSTR("HUBackButtonTitle"), CFSTR("HUBackButtonTitle"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventServicePickerViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackButtonTitle:", v8);

  -[HUCharacteristicEventServicePickerViewController flow](self, "flow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventServicePickerViewController stepIdentifier](self, "stepIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "shouldShowNextButtonForStep:", v11);

  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0CEA380]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUCharacteristicTriggerServicePickerNextButton"), CFSTR("HUCharacteristicTriggerServicePickerNextButton"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithTitle:style:target:action:", v14, 2, self, sel__next_);
    -[HUCharacteristicEventServicePickerViewController navigationItem](self, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRightBarButtonItem:", v15);

  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  objc_super v14;

  v6 = a6;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUCharacteristicEventServicePickerViewController;
  -[HUInstructionsTableViewController updateCell:forItem:indexPath:animated:](&v14, sel_updateCell_forItem_indexPath_animated_, v10, a4, a5, v6);
  objc_opt_class();
  v11 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
    objc_msgSend(v13, "removeMargins");

}

- (void)_next:(id)a3
{
  void *v4;
  id v5;

  -[HUCharacteristicEventServicePickerViewController flow](self, "flow", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventServicePickerViewController stepIdentifier](self, "stepIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController:didFinishStepWithIdentifier:", self, v4);

}

+ (BOOL)adoptsDefaultGridLayoutMargins
{
  return 1;
}

- (void)characteristicEventServicePickerContentViewController:(id)a3 didChangeNumberOfSelectedItems:(unint64_t)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = a4 != 0;
  -[HUCharacteristicEventServicePickerViewController navigationItem](self, "navigationItem", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (HUCharacteristicEventServicePickerContentViewController)servicePickerContentViewController
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[HUInstructionsTableViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (HUCharacteristicEventServicePickerContentViewController *)v5;
}

- (id)characteristicTriggerBuilder
{
  void *v2;
  void *v3;

  -[HUCharacteristicEventServicePickerViewController servicePickerContentViewController](self, "servicePickerContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)source
{
  void *v2;
  unint64_t v3;

  -[HUCharacteristicEventServicePickerViewController servicePickerContentViewController](self, "servicePickerContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "source");

  return v3;
}

- (id)filter
{
  void *v2;
  void *v3;

  -[HUCharacteristicEventServicePickerViewController servicePickerContentViewController](self, "servicePickerContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setFilter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUCharacteristicEventServicePickerViewController servicePickerContentViewController](self, "servicePickerContentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilter:", v4);

}

- (HFCharacteristicEventBuilderItem)eventBuilder
{
  return self->_eventBuilder;
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (HUEventUIFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
  objc_storeStrong((id *)&self->_flow, a3);
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_stepIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
  objc_storeStrong((id *)&self->_eventBuilder, 0);
}

@end
