@implementation HUShortcutsTriggerViewUtilities

+ (id)accessoryPickerViewControllerInHome:(id)a3 withConfiguration:(id)a4
{
  id v5;
  id v6;
  HUShortcutsAccessoryPickerViewController *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HUShortcutsAccessoryPickerViewController initWithHome:configuration:]([HUShortcutsAccessoryPickerViewController alloc], "initWithHome:configuration:", v6, v5);

  -[HUShortcutsAccessoryPickerViewController configureWithDefaultSelectionController](v7, "configureWithDefaultSelectionController");
  return v7;
}

+ (id)getServicesOnAccessoryPicker:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "getServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

+ (void)setServices:(id)a3 onAccessoryPicker:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  v9 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "setServices:", v6);
}

+ (id)triggerActionPickerViewControllerWithTriggerBuilder:(id)a3 flow:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  HUTriggerActionPickerViewController *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HUTriggerActionPickerViewController initWithTriggerBuilder:flow:delegate:]([HUTriggerActionPickerViewController alloc], "initWithTriggerBuilder:flow:delegate:", v9, v8, v7);

  return v10;
}

@end
