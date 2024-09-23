@implementation SFSettingsAlertStepper

_SFSettingsAlertButton *__66___SFSettingsAlertStepper_initUsingResetButton_usingTopSeparator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _SFSettingsAlertButton *v6;
  void *v7;

  v6 = objc_alloc_init(_SFSettingsAlertButton);
  -[_SFSettingsAlertButton textLabel](v6, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 1);

  -[_SFSettingsAlertControl setDefaultBackgroundMode:](v6, "setDefaultBackgroundMode:", a3);
  -[_SFSettingsAlertButton setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_SFSettingsAlertButton addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), a2, 0x2000);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v6);
  return v6;
}

@end
