@implementation HUCharacteristicTriggerServicePickerViewController

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
    v9 = +[HUCharacteristicEventOptionProvider hasOptionsForAnyServiceInHome:allowingSensors:](HUCharacteristicEventOptionProvider, "hasOptionsForAnyServiceInHome:allowingSensors:", v5, 0);
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
    v11[2] = __85__HUCharacteristicTriggerServicePickerViewController_canPickServicesFromSource_home___block_invoke;
    v11[3] = &unk_1E6F4E5D8;
    v12 = v6;
    v8 = v6;
    v9 = objc_msgSend(v7, "na_any:", v11);

  }
  return v9;
}

uint64_t __85__HUCharacteristicTriggerServicePickerViewController_canPickServicesFromSource_home___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__HUCharacteristicTriggerServicePickerViewController_canPickServicesFromSource_home___block_invoke_2;
  v6[3] = &unk_1E6F4EE58;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __85__HUCharacteristicTriggerServicePickerViewController_canPickServicesFromSource_home___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__HUCharacteristicTriggerServicePickerViewController_canPickServicesFromSource_home___block_invoke_3;
  v6[3] = &unk_1E6F4EE30;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __85__HUCharacteristicTriggerServicePickerViewController_canPickServicesFromSource_home___block_invoke_3(uint64_t a1, void *a2)
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
  v9[2] = __78__HUCharacteristicTriggerServicePickerViewController_sourceForTriggerBuilder___block_invoke;
  v9[3] = &unk_1E6F4EE30;
  v10 = v5;
  v7 = v5;
  LODWORD(v4) = objc_msgSend(v6, "na_any:", v9);

  return v4 ^ 1;
}

uint64_t __78__HUCharacteristicTriggerServicePickerViewController_sourceForTriggerBuilder___block_invoke(uint64_t a1, void *a2)
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

- (HUCharacteristicTriggerServicePickerViewController)initWithInstructionsItem:(id)a3 contentViewController:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithEventBuilderItem_triggerBuilder_mode_source_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCharacteristicTriggerServicePickerViewController.m"), 70, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCharacteristicTriggerServicePickerViewController initWithInstructionsItem:contentViewController:]",
    v7);

  return 0;
}

- (HUCharacteristicTriggerServicePickerViewController)initWithEventBuilderItem:(id)a3 triggerBuilder:(id)a4 mode:(unint64_t)a5 source:(unint64_t)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  HUCharacteristicTriggerServicePickerContentViewController *v16;
  void *v17;
  HUCharacteristicTriggerServicePickerContentViewController *v18;
  HUCharacteristicTriggerServicePickerViewController *v19;
  HUCharacteristicTriggerServicePickerViewController *v20;
  objc_super v22;

  v13 = a4;
  v14 = a7;
  v15 = a3;
  v16 = [HUCharacteristicTriggerServicePickerContentViewController alloc];
  -[HUCharacteristicTriggerServicePickerViewController navigationItem](self, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HUCharacteristicTriggerServicePickerContentViewController initWithTriggerBuilder:eventBuilderItem:mode:source:effectiveNavigationItem:delegate:](v16, "initWithTriggerBuilder:eventBuilderItem:mode:source:effectiveNavigationItem:delegate:", v13, v15, a5, a6, v17, v14);

  -[HUServiceGridViewController setContentMargins:](v18, "setContentMargins:", 1);
  v22.receiver = self;
  v22.super_class = (Class)HUCharacteristicTriggerServicePickerViewController;
  v19 = -[HUInstructionsTableViewController initWithInstructionsItem:contentViewController:](&v22, sel_initWithInstructionsItem_contentViewController_, 0, v18);
  v20 = v19;
  if (v19)
    objc_storeStrong((id *)&v19->_triggerBuilder, a4);

  return v20;
}

- (void)viewDidLoad
{
  unint64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUCharacteristicTriggerServicePickerViewController;
  -[HUInstructionsTableViewController viewDidLoad](&v8, sel_viewDidLoad);
  v3 = -[HUCharacteristicTriggerServicePickerViewController source](self, "source");
  if (v3 == 1)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUCharacteristicTriggerServicePickerTitleAccessory"), CFSTR("HUCharacteristicTriggerServicePickerTitleAccessory"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("HUCharacteristicTriggerServicePickerInstructionsDescriptionAccessory");
  }
  else
  {
    if (v3)
    {
      v4 = 0;
      v6 = 0;
      goto LABEL_7;
    }
    _HULocalizedStringWithDefaultValue(CFSTR("HUCharacteristicTriggerServicePickerTitleAlarm"), CFSTR("HUCharacteristicTriggerServicePickerTitleAlarm"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("HUCharacteristicTriggerServicePickerInstructionsDescriptionAlarm");
  }
  _HULocalizedStringWithDefaultValue(v5, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  -[HUCharacteristicTriggerServicePickerViewController setTitle:](self, "setTitle:", v4);
  -[HUCharacteristicTriggerServicePickerViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrompt:", v6);

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
  v14.super_class = (Class)HUCharacteristicTriggerServicePickerViewController;
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

+ (BOOL)adoptsDefaultGridLayoutMargins
{
  return 1;
}

- (HUCharacteristicTriggerServicePickerContentViewController)servicePickerContentViewController
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

  return (HUCharacteristicTriggerServicePickerContentViewController *)v5;
}

- (id)characteristicTriggerBuilder
{
  void *v2;
  void *v3;

  -[HUCharacteristicTriggerServicePickerViewController servicePickerContentViewController](self, "servicePickerContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)mode
{
  void *v2;
  unint64_t v3;

  -[HUCharacteristicTriggerServicePickerViewController servicePickerContentViewController](self, "servicePickerContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mode");

  return v3;
}

- (unint64_t)source
{
  void *v2;
  unint64_t v3;

  -[HUCharacteristicTriggerServicePickerViewController servicePickerContentViewController](self, "servicePickerContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "source");

  return v3;
}

- (HUTriggerEditorDelegate)delegate
{
  void *v2;
  void *v3;

  -[HUCharacteristicTriggerServicePickerViewController servicePickerContentViewController](self, "servicePickerContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HUTriggerEditorDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUCharacteristicTriggerServicePickerViewController servicePickerContentViewController](self, "servicePickerContentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (id)filter
{
  void *v2;
  void *v3;

  -[HUCharacteristicTriggerServicePickerViewController servicePickerContentViewController](self, "servicePickerContentViewController");
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
  -[HUCharacteristicTriggerServicePickerViewController servicePickerContentViewController](self, "servicePickerContentViewController");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
  objc_storeStrong((id *)&self->_eventBuilder, 0);
}

@end
