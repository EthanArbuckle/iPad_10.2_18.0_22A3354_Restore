@implementation AMUIBatteryChargingViewController

- (AMUIBatteryChargingViewController)init
{
  AMUIBatteryChargingViewController *v2;
  BCBatteryDeviceController *v3;
  BCBatteryDeviceController *batteryController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMUIBatteryChargingViewController;
  v2 = -[AMUIBatteryChargingViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x24BE0BF88]);
    batteryController = v2->_batteryController;
    v2->_batteryController = v3;

    -[BCBatteryDeviceController addBatteryDeviceObserver:queue:](v2->_batteryController, "addBatteryDeviceObserver:queue:", v2, MEMORY[0x24BDAC9B8]);
  }
  return v2;
}

- (void)dealloc
{
  BSAbsoluteMachTimer *chargingAnimationDismissalTimer;
  objc_super v4;

  -[BSAbsoluteMachTimer invalidate](self->_chargingAnimationDismissalTimer, "invalidate");
  chargingAnimationDismissalTimer = self->_chargingAnimationDismissalTimer;
  self->_chargingAnimationDismissalTimer = 0;

  -[BCBatteryDeviceController removeBatteryDeviceObserver:](self->_batteryController, "removeBatteryDeviceObserver:", self);
  v4.receiver = self;
  v4.super_class = (Class)AMUIBatteryChargingViewController;
  -[AMUIBatteryChargingViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMUIBatteryChargingViewController;
  -[AMUIBatteryChargingViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[AMUIBatteryChargingViewController _createNewChargingViewIfNecessary](self, "_createNewChargingViewIfNecessary");
  -[AMUIBatteryChargingViewController _updateChargingViewIfNecessary](self, "_updateChargingViewIfNecessary");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)performChargingAnimation:(id)a3
{
  id v4;

  v4 = a3;
  -[AMUIBatteryChargingViewController _updateChargingViewLegibility](self, "_updateChargingViewLegibility");
  -[AMUIBatteryChargingView presentChargingViewWithCompletionHandler:](self->_chargingView, "presentChargingViewWithCompletionHandler:", v4);

}

- (void)_updateChargingViewIfNecessary
{
  id v3;

  -[AMUIBatteryChargingViewController _internalBattery](self, "_internalBattery");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AMUIBatteryChargingView updateWithBattery:](self->_chargingView, "updateWithBattery:", v3);

}

- (void)_createNewChargingViewIfNecessary
{
  AMUIBatteryChargingView *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  AMUIBatteryChargingView *chargingView;
  id v14;

  if (!self->_chargingView)
  {
    +[AMUIBatteryChargingUIConfiguration defaultConfiguration](AMUIBatteryChargingUIConfiguration, "defaultConfiguration");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    +[AMUIBatteryChargingView batteryChargingRingViewWithConfiguration:](AMUIBatteryChargingView, "batteryChargingRingViewWithConfiguration:", v14);
    v3 = (AMUIBatteryChargingView *)objc_claimAutoreleasedReturnValue();
    -[AMUIBatteryChargingViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[AMUIBatteryChargingView setFrame:](v3, "setFrame:", v6, v8, v10, v12);
    -[AMUIBatteryChargingView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    -[AMUIBatteryChargingViewController setView:](self, "setView:", v3);
    chargingView = self->_chargingView;
    self->_chargingView = v3;

    -[AMUIBatteryChargingViewController _updateChargingViewLegibility](self, "_updateChargingViewLegibility");
  }
}

- (void)_updateChargingViewLegibility
{
  AMUIBatteryChargingView *chargingView;
  id v3;

  chargingView = self->_chargingView;
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF70F0]), "initWithStyle:", 1);
  -[AMUIBatteryChargingView setLegibilitySettings:](chargingView, "setLegibilitySettings:", v3);

}

- (id)_internalBattery
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[BCBatteryDeviceController connectedDevices](self->_batteryController, "connectedDevices");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isInternal", (_QWORD)v8) & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)connectedDevicesDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "isPowerSource", (_QWORD)v9) & 1) != 0)
        {

          -[AMUIBatteryChargingViewController _updateChargingViewIfNecessary](self, "_updateChargingViewIfNecessary");
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v6)
        continue;
      break;
    }
  }

LABEL_11:
}

- (BCBatteryDeviceController)batteryController
{
  return self->_batteryController;
}

- (void)setBatteryController:(id)a3
{
  objc_storeStrong((id *)&self->_batteryController, a3);
}

- (AMUIBatteryChargingView)chargingView
{
  return self->_chargingView;
}

- (void)setChargingView:(id)a3
{
  objc_storeStrong((id *)&self->_chargingView, a3);
}

- (BSAbsoluteMachTimer)chargingAnimationDismissalTimer
{
  return self->_chargingAnimationDismissalTimer;
}

- (void)setChargingAnimationDismissalTimer:(id)a3
{
  objc_storeStrong((id *)&self->_chargingAnimationDismissalTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargingAnimationDismissalTimer, 0);
  objc_storeStrong((id *)&self->_chargingView, 0);
  objc_storeStrong((id *)&self->_batteryController, 0);
}

@end
