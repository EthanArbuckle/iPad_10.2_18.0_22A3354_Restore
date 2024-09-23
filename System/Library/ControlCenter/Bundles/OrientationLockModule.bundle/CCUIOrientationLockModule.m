@implementation CCUIOrientationLockModule

- (BOOL)isSelected
{
  return MEMORY[0x24BEDD108](self->_systemAgent, sel_isOrientationLocked);
}

- (CCUIOrientationLockModule)initWithSystemAgent:(id)a3
{
  id v5;
  CCUIOrientationLockModule *v6;
  CCUIOrientationLockModule *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCUIOrientationLockModule;
  v6 = -[CCUIOrientationLockModule init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_systemAgent, a3);
    -[CCUIOrientationLockModule _observeSystemNotifications](v7, "_observeSystemNotifications");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CCUIOrientationLockModule _unobserveSystemNotifications](self, "_unobserveSystemNotifications");
  v3.receiver = self;
  v3.super_class = (Class)CCUIOrientationLockModule;
  -[CCUIOrientationLockModule dealloc](&v3, sel_dealloc);
}

- (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ORIENTATION_LOCK_ORIENTATION"), &stru_24FFE0DE0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)valueText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ORIENTATION_LOCK_UNLOCKED"), &stru_24FFE0DE0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)selectedValueText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ORIENTATION_LOCK_LOCKED"), &stru_24FFE0DE0, 0);
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
  v3 = CFSTR("OrientationLock");
  if (v2)
    v3 = CFSTR("OrientationLock_IC");
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
    return CFSTR("locked");
  else
    return CFSTR("unlocked");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  CCUIControlCenterSystemAgent *systemAgent;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a3;
  if (-[CCUIOrientationLockModule isSelected](self, "isSelected") != a3)
  {
    systemAgent = self->_systemAgent;
    if (v3)
    {
      -[CCUIControlCenterSystemAgent lockOrientation](systemAgent, "lockOrientation");
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "userInterfaceIdiom");

      if (v7 == 1)
        v8 = CFSTR("CONTROL_CENTER_STATUS_ORIENTATION_LOCK_ON");
      else
        v8 = CFSTR("CONTROL_CENTER_STATUS_PORTAIT_ORIENTATION_LOCK_ON");
      v9 = 1;
    }
    else
    {
      -[CCUIControlCenterSystemAgent unlockOrientation](systemAgent, "unlockOrientation");
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "userInterfaceIdiom");

      if (v11 == 1)
        v8 = CFSTR("CONTROL_CENTER_STATUS_ORIENTATION_LOCK_OFF");
      else
        v8 = CFSTR("CONTROL_CENTER_STATUS_PORTAIT_ORIENTATION_LOCK_OFF");
      v9 = 2;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", v8, &stru_24FFE0DE0, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[CCUIToggleModule contentModuleContext](self, "contentModuleContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE19B78], "statusUpdateWithMessage:type:", v15, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enqueueStatusUpdate:", v14);

  }
}

- (void)_observeSystemNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateState, *MEMORY[0x24BEB0F18], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__updateForDarkerSystemColorsChange, *MEMORY[0x24BDF7230], 0);

}

- (void)_unobserveSystemNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_updateForDarkerSystemColorsChange
{
  MEMORY[0x24BEDD108](self, sel_reconfigureView);
}

- (void)_updateState
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2310131BC;
  block[3] = &unk_24FFE0DA0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAgent, 0);
}

@end
