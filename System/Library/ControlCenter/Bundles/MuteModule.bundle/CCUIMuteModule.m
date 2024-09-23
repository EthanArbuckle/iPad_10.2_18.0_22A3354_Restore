@implementation CCUIMuteModule

- (CCUIMuteModule)initWithSystemAgent:(id)a3
{
  id v5;
  CCUIMuteModule *v6;
  CCUIMuteModule *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCUIMuteModule;
  v6 = -[CCUIMuteModule init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_systemAgent, a3);
    -[CCUIMuteModule _observeSystemNotifications](v7, "_observeSystemNotifications");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CCUIMuteModule _unobserveSystemNotifications](self, "_unobserveSystemNotifications");
  v3.receiver = self;
  v3.super_class = (Class)CCUIMuteModule;
  -[CCUIMuteModule dealloc](&v3, sel_dealloc);
}

- (id)valueText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RING"), &stru_24FFE0488, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)selectedValueText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SILENT"), &stru_24FFE0488, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)glyphPackageDescription
{
  _BOOL4 v2;
  __CFString *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = CFSTR("Mute");
  if (v2)
    v3 = CFSTR("Mute_IC");
  v4 = (void *)MEMORY[0x24BE19B00];
  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = v3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptionForPackageNamed:inBundle:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)glyphState
{
  if (-[CCUIToggleModule appearsSelected](self, "appearsSelected"))
    return CFSTR("silent");
  else
    return CFSTR("ringer");
}

- (BOOL)isSelected
{
  return MEMORY[0x24BEDD108](self->_systemAgent, sel_isRingerMuted);
}

- (void)setSelected:(BOOL)a3
{
  if (-[CCUIMuteModule isSelected](self, "isSelected") != a3)
    MEMORY[0x24BEDD108](self->_systemAgent, sel_setRingerMuted_reason_);
}

- (void)_updateState
{
  _BOOL4 v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[5];

  v3 = -[CCUIMuteModule isSelected](self, "isSelected");
  if (v3)
    v4 = 1;
  else
    v4 = 2;
  if (v3)
    v5 = CFSTR("CONTROL_CENTER_STATUS_MUTE_ON");
  else
    v5 = CFSTR("CONTROL_CENTER_STATUS_MUTE_OFF");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_24FFE0488, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CCUIToggleModule contentModuleContext](self, "contentModuleContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19B78], "statusUpdateWithMessage:type:", v7, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enqueueStatusUpdate:", v9);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_231011030;
  block[3] = &unk_24FFE0420;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)_observeSystemNotifications
{
  void *v3;
  CCUIControlCenterSystemAgent *systemAgent;
  BSInvalidatable *v5;
  BSInvalidatable *observerToken;
  _QWORD v7[4];
  id v8;
  id location;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateForDarkerSystemColorsChange, *MEMORY[0x24BDF7230], 0);

  objc_initWeak(&location, self);
  systemAgent = self->_systemAgent;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_231011148;
  v7[3] = &unk_24FFE0448;
  objc_copyWeak(&v8, &location);
  -[CCUIControlCenterSystemAgent observeRingerMutedWithBlock:](systemAgent, "observeRingerMutedWithBlock:", v7);
  v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  observerToken = self->_observerToken;
  self->_observerToken = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_unobserveSystemNotifications
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7230], 0);

  MEMORY[0x24BEDD108](self->_observerToken, sel_invalidate);
}

- (void)_updateForDarkerSystemColorsChange
{
  MEMORY[0x24BEDD108](self, sel_reconfigureView);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_systemAgent, 0);
}

@end
