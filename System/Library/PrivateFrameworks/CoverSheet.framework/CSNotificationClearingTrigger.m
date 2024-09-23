@implementation CSNotificationClearingTrigger

- (CSNotificationClearingTrigger)initWithDelegate:(id)a3
{
  id v4;
  CSNotificationClearingTrigger *v5;
  CSNotificationClearingTrigger *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSNotificationClearingTrigger;
  v5 = -[CSNotificationClearingTrigger init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_authenticated = 0;
    v6->_uiLocked = 1;
  }

  return v6;
}

- (void)setAuthenticated:(BOOL)a3
{
  if (self->_authenticated != a3)
  {
    self->_authenticated = a3;
    -[CSNotificationClearingTrigger _updateTriggerAndClearIfNeeded](self, "_updateTriggerAndClearIfNeeded");
  }
}

- (void)setDidDisableCarDNDUntilEndOfDrive:(BOOL)a3
{
  if (self->_didDisableCarDNDUntilEndOfDrive != a3)
  {
    self->_didDisableCarDNDUntilEndOfDrive = a3;
    -[CSNotificationClearingTrigger _updateTriggerAndClearIfNeeded](self, "_updateTriggerAndClearIfNeeded");
  }
}

- (void)setHadNotificationContentAtDisappearance:(BOOL)a3
{
  if (self->_hadNotificationContentAtDisappearance != a3)
  {
    self->_hadNotificationContentAtDisappearance = a3;
    -[CSNotificationClearingTrigger _updateTriggerAndClearIfNeeded](self, "_updateTriggerAndClearIfNeeded");
  }
}

- (void)setUiLocked:(BOOL)a3
{
  if (self->_uiLocked != a3)
  {
    self->_uiLocked = a3;
    -[CSNotificationClearingTrigger _updateTriggerAndClearIfNeeded](self, "_updateTriggerAndClearIfNeeded");
  }
}

- (void)setScreenOff:(BOOL)a3
{
  if (self->_screenOff != a3)
  {
    self->_screenOff = a3;
    -[CSNotificationClearingTrigger _updateTriggerAndClearIfNeeded](self, "_updateTriggerAndClearIfNeeded");
  }
}

- (void)setScreenInactive:(BOOL)a3
{
  if (self->_screenInactive != a3)
  {
    self->_screenInactive = a3;
    -[CSNotificationClearingTrigger _updateTriggerAndClearIfNeeded](self, "_updateTriggerAndClearIfNeeded");
  }
}

- (void)_reset
{
  -[CSNotificationClearingTrigger setTriggerArmed:](self, "setTriggerArmed:", 0);
  self->_didDisableCarDNDUntilEndOfDrive = 0;
}

- (void)_updateTriggerAndClearIfNeeded
{
  if (-[CSNotificationClearingTrigger _shouldArm](self, "_shouldArm"))
  {
    -[CSNotificationClearingTrigger setTriggerArmed:](self, "setTriggerArmed:", 1);
  }
  else if (-[CSNotificationClearingTrigger _wouldArmIfNotForDND](self, "_wouldArmIfNotForDND")
         || -[CSNotificationClearingTrigger _wouldArmIfNotForDNDAndNotificationContent](self, "_wouldArmIfNotForDNDAndNotificationContent"))
  {
    self->_didDisableCarDNDUntilEndOfDrive = 0;
  }
  -[CSNotificationClearingTrigger _clearIfNeeded](self, "_clearIfNeeded");
}

- (BOOL)_shouldArm
{
  _BOOL4 v3;

  v3 = -[CSNotificationClearingTrigger _wouldArmForDiscreteParameters](self, "_wouldArmForDiscreteParameters");
  if (v3)
    LOBYTE(v3) = !-[CSNotificationClearingTrigger didDisableCarDNDUntilEndOfDrive](self, "didDisableCarDNDUntilEndOfDrive");
  return v3;
}

- (BOOL)_wouldArmIfNotForDND
{
  return -[CSNotificationClearingTrigger _wouldArmForDiscreteParameters](self, "_wouldArmForDiscreteParameters")
      && -[CSNotificationClearingTrigger hadNotificationContentAtDisappearance](self, "hadNotificationContentAtDisappearance")&& -[CSNotificationClearingTrigger didDisableCarDNDUntilEndOfDrive](self, "didDisableCarDNDUntilEndOfDrive");
}

- (BOOL)_wouldArmIfNotForDNDAndNotificationContent
{
  return -[CSNotificationClearingTrigger _wouldArmForDiscreteParameters](self, "_wouldArmForDiscreteParameters")
      && !-[CSNotificationClearingTrigger hadNotificationContentAtDisappearance](self, "hadNotificationContentAtDisappearance")&& -[CSNotificationClearingTrigger didDisableCarDNDUntilEndOfDrive](self, "didDisableCarDNDUntilEndOfDrive");
}

- (BOOL)_wouldArmForDiscreteParameters
{
  _BOOL4 v3;

  if (-[CSNotificationClearingTrigger screenOff](self, "screenOff"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[CSNotificationClearingTrigger authenticated](self, "authenticated");
    if (v3)
      LOBYTE(v3) = !-[CSNotificationClearingTrigger uiLocked](self, "uiLocked");
  }
  return v3;
}

- (BOOL)_shouldFire
{
  char v3;

  if (-[CSNotificationClearingTrigger uiLocked](self, "uiLocked"))
    v3 = 0;
  else
    v3 = !-[CSNotificationClearingTrigger screenInactive](self, "screenInactive");
  return -[CSNotificationClearingTrigger screenOff](self, "screenOff")
      && (v3 & 1) == 0
      && -[CSNotificationClearingTrigger triggerArmed](self, "triggerArmed");
}

- (void)_clearIfNeeded
{
  id v3;

  if (-[CSNotificationClearingTrigger _shouldFire](self, "_shouldFire"))
  {
    -[CSNotificationClearingTrigger delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "coverSheetNotificationClearingTriggerDidFire:", self);
    -[CSNotificationClearingTrigger _reset](self, "_reset");

  }
}

- (CSNotificationClearingTriggerDelegate)delegate
{
  return (CSNotificationClearingTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (BOOL)hadNotificationContentAtDisappearance
{
  return self->_hadNotificationContentAtDisappearance;
}

- (BOOL)didDisableCarDNDUntilEndOfDrive
{
  return self->_didDisableCarDNDUntilEndOfDrive;
}

- (BOOL)uiLocked
{
  return self->_uiLocked;
}

- (BOOL)screenOff
{
  return self->_screenOff;
}

- (BOOL)screenInactive
{
  return self->_screenInactive;
}

- (BOOL)triggerArmed
{
  return self->_triggerArmed;
}

- (void)setTriggerArmed:(BOOL)a3
{
  self->_triggerArmed = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
