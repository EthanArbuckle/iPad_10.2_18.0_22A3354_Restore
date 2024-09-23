@implementation CCUIWalletModule

- (CCUIWalletModule)initWithSystemAgent:(id)a3
{
  id v5;
  CCUIWalletModule *v6;
  CCUIWalletModule *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCUIWalletModule;
  v6 = -[CCUIAppLauncherModule init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_systemAgent, a3);

  return v7;
}

- (void)handleTapWithTouchType:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  objc_super v8;

  v5 = -[CCUIControlCenterSystemAgent isUILocked](self->_systemAgent, "isUILocked");
  if (objc_msgSend(MEMORY[0x24BE6EC00], "contactlessInterfaceCanBePresentedFromSource:deviceUILocked:", 2, v5))
  {
    objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CCUIAppLauncherModule contentModuleContext](self, "contentModuleContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissControlCenter");
    objc_msgSend(v7, "presentContactlessInterfaceForDefaultPassFromSource:completion:", 2, 0);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CCUIWalletModule;
    -[CCUIAppLauncherModule handleTapWithTouchType:](&v8, sel_handleTapWithTouchType_, a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAgent, 0);
}

@end
