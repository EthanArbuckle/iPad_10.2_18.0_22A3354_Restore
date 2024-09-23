@implementation CSFlashlightQuickAction

- (CSFlashlightQuickAction)init
{
  void *v3;
  CSFlashlightQuickAction *v4;

  objc_msgSend(MEMORY[0x1E0DAC290], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CSFlashlightQuickAction initWithFlashlightController:](self, "initWithFlashlightController:", v3);

  return v4;
}

- (CSFlashlightQuickAction)initWithFlashlightController:(id)a3
{
  id v5;
  CSFlashlightQuickAction *v6;
  CSFlashlightQuickAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSFlashlightQuickAction;
  v6 = -[CSFlashlightQuickAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_flashlightController, a3);
    -[SBUIFlashlightController addObserver:](v7->_flashlightController, "addObserver:", v7);
  }

  return v7;
}

- (id)actionIdentifier
{
  return CFSTR("CSFlashlightQuickAction");
}

- (id)accessibilityIdentifier
{
  return CFSTR("flashlight-orb-button");
}

- (id)statisticsIdentifier
{
  return CFSTR("flashlight");
}

- (id)accessoryTitleKey
{
  return CFSTR("FLASHLIGHT_HINT_TEXT");
}

- (id)symbolName
{
  return CFSTR("flashlight.off.fill");
}

- (id)symbolOnColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemIndigoColor");
}

- (BOOL)supportsSelection
{
  return 1;
}

- (id)selectedSymbolName
{
  return CFSTR("flashlight.on.fill");
}

- (BOOL)showsButton
{
  return objc_msgSend(MEMORY[0x1E0DAC290], "deviceSupportsFlashlight");
}

- (int64_t)appearance
{
  if (-[SBUIFlashlightController isOverheated](self->_flashlightController, "isOverheated"))
    return 2;
  else
    return 0;
}

- (BOOL)allowsInteraction
{
  return -[SBUIFlashlightController isAvailable](self->_flashlightController, "isAvailable");
}

- (id)unavailableSymbolName
{
  return CFSTR("flashlight.slash");
}

- (void)touchBegan
{
  -[SBUIFlashlightController warmUp](self->_flashlightController, "warmUp");
}

- (void)fireAction
{
  _BOOL4 v3;
  SBUIFlashlightController *flashlightController;

  v3 = -[CSFlashlightQuickAction _isFlashlightOn](self, "_isFlashlightOn");
  flashlightController = self->_flashlightController;
  if (v3)
    -[SBUIFlashlightController turnFlashlightOffForReason:](flashlightController, "turnFlashlightOffForReason:", CFSTR("Lock Screen Buttons"));
  else
    -[SBUIFlashlightController turnFlashlightOnForReason:](flashlightController, "turnFlashlightOnForReason:", CFSTR("Lock Screen Buttons"));
}

- (void)tearDown
{
  if (!-[CSFlashlightQuickAction _isFlashlightOn](self, "_isFlashlightOn"))
    -[SBUIFlashlightController coolDown](self->_flashlightController, "coolDown");
}

- (BOOL)_isFlashlightOn
{
  return -[SBUIFlashlightController level](self->_flashlightController, "level") != 0;
}

- (void)flashlightLevelDidChange:(unint64_t)a3
{
  id v4;

  -[CSQuickAction delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isSelectedDidChangeForAction:", self);

}

- (void)flashlightAvailabilityDidChange:(BOOL)a3
{
  id v4;

  -[CSQuickAction delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowsInteractionDidChangeForAction:", self);

}

- (SBUIFlashlightController)flashlightController
{
  return self->_flashlightController;
}

- (void)setFlashlightController:(id)a3
{
  objc_storeStrong((id *)&self->_flashlightController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flashlightController, 0);
}

@end
