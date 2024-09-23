@implementation CSChargingViewController

- (CSChargingViewController)init
{
  CSChargingViewController *v2;
  BCBatteryDeviceController *v3;
  BCBatteryDeviceController *batteryController;
  uint64_t v5;
  NSMutableSet *displayedBatteryDevices;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSChargingViewController;
  v2 = -[CSChargingViewController init](&v8, sel_init);
  if (v2)
  {
    v3 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x1E0D01B20]);
    batteryController = v2->_batteryController;
    v2->_batteryController = v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    displayedBatteryDevices = v2->_displayedBatteryDevices;
    v2->_displayedBatteryDevices = (NSMutableSet *)v5;

  }
  return v2;
}

- (CSChargingViewController)initWithChargingInfo:(id)a3
{
  id v5;
  CSChargingViewController *v6;
  CSChargingViewController *v7;

  v5 = a3;
  v6 = -[CSChargingViewController init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_chargingInfo, a3);

  return v7;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSChargingViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v3, sel_viewDidLoad);
  -[CSChargingViewController _updateChargingViewIfNecessary](self, "_updateChargingViewIfNecessary");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSChargingViewController;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CSChargingViewController _updateChargingViewLegibility](self, "_updateChargingViewLegibility");
  -[CSBatteryChargingView performAnimation:completionHandler:](self->_chargingView, "performAnimation:completionHandler:", 0, 0);
}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSMutableSet *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  objc_super v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CSComponent statusBar](CSComponent, "statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "priority:", 40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hidden:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v7);

  +[CSComponent dateView](CSComponent, "dateView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "priority:", 40);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hidden:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v10);

  +[CSComponent backgroundContent](CSComponent, "backgroundContent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "priority:", 40);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hidden:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v13);

  +[CSComponent pageContent](CSComponent, "pageContent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "priority:", 40);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hidden:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v16);

  +[CSComponent pageControl](CSComponent, "pageControl");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "priority:", 40);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hidden:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v19);

  +[CSComponent proudLock](CSComponent, "proudLock");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "priority:", 40);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hidden:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v22);

  +[CSComponent quickActions](CSComponent, "quickActions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "priority:", 40);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hidden:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v25);

  +[CSComponent controlCenterGrabber](CSComponent, "controlCenterGrabber");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "priority:", 40);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "hidden:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v28);

  +[CSComponent poseidon](CSComponent, "poseidon");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "priority:", 40);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "hidden:", 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v31);

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v32 = self->_displayedBatteryDevices;
  v33 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v42;
    v36 = *MEMORY[0x1E0D01B28];
    while (2)
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v42 != v35)
          objc_enumerationMutation(v32);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "productIdentifier") == v36)
        {

          +[CSComponent homeAffordance](CSComponent, "homeAffordance");
          v32 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet priority:](v32, "priority:", 40);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "hidden:", 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addComponent:", v39);

          goto LABEL_11;
        }
      }
      v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v34)
        continue;
      break;
    }
  }
LABEL_11:

  v40.receiver = self;
  v40.super_class = (Class)CSChargingViewController;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v40, sel_aggregateAppearance_, v4);

}

- (void)aggregateBehavior:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSChargingViewController;
  v3 = a3;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v4, sel_aggregateBehavior_, v3);
  objc_msgSend(v3, "setIdleTimerMode:", 3, v4.receiver, v4.super_class);
  objc_msgSend(v3, "setRestrictedCapabilities:", 0x4000000);

}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSChargingViewController;
  if (-[CSCoverSheetViewControllerBase handleEvent:](&v7, sel_handleEvent_, v4)
    && (objc_msgSend(v4, "isConsumable") & 1) != 0)
  {
    v5 = objc_msgSend(v4, "isConsumable");
  }
  else
  {
    if (objc_msgSend(v4, "type") == 1)
      -[CSChargingViewController _updateChargingViewLegibility](self, "_updateChargingViewLegibility");
    v5 = 0;
  }

  return v5;
}

- (void)_updateChargingViewLegibility
{
  CSBatteryChargingView *chargingView;
  void *v3;
  id v4;

  chargingView = self->_chargingView;
  -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legibilitySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSBatteryChargingView setLegibilitySettings:](chargingView, "setLegibilitySettings:", v3);

}

- (double)durationBeforeDismissal
{
  _BOOL4 v3;
  void *v4;
  double result;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[CSBatteryChargingInfo isChargingWithInternalWirelessAccessory](self->_chargingInfo, "isChargingWithInternalWirelessAccessory");
  -[CSBatteryChargingInfo externalBatteryDevice](self->_chargingInfo, "externalBatteryDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    result = 3.65;
    if (v4)
      return 4.75;
  }
  else
  {
    if (!v4)
      return *MEMORY[0x1E0DAB5B0];
    -[CSBatteryChargingInfo externalBatteryDevice](self->_chargingInfo, "externalBatteryDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "accessoryCategory");

    -[CSBatteryChargingInfo externalBatteryDevice](self->_chargingInfo, "externalBatteryDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "productIdentifier");
    v10 = *MEMORY[0x1E0D01B28];

    result = 4.75;
    if (v7 != 4 || v9 != v10)
      return *MEMORY[0x1E0DAB5B0];
  }
  return result;
}

- (void)performDismissalAnimationWithCompletionHandler:(id)a3
{
  -[CSBatteryChargingView performAnimation:completionHandler:](self->_chargingView, "performAnimation:completionHandler:", 1, a3);
}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationPriority
{
  return 600;
}

- (int64_t)presentationStyle
{
  return 2;
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

  v14 = *MEMORY[0x1E0C80C00];
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

          -[CSChargingViewController _updateChargingViewIfNecessary](self, "_updateChargingViewIfNecessary");
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

- (void)_updateChargingViewIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  CSBatteryChargingView *chargingView;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  -[CSBatteryChargingInfo externalBatteryDevice](self->_chargingInfo, "externalBatteryDevice");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chargingSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldFakeA149Attach");

  if (v5
    && -[CSBatteryChargingInfo isChargingWithInternalWirelessAccessory](self->_chargingInfo, "isChargingWithInternalWirelessAccessory"))
  {
    v6 = 1;
    v7 = 1;
    v8 = v24;
  }
  else
  {
    v9 = objc_msgSend(v24, "productIdentifier");
    v8 = v24;
    v6 = 0;
    v7 = v9 == *MEMORY[0x1E0D01B28];
  }
  v10 = v8 != 0;
  v11 = -[CSBatteryChargingView batteryCount](self->_chargingView, "batteryCount") < 2;
  if ((!self->_chargingView || ((v10 ^ v11) & 1) == 0)
    && (-[NSMutableSet containsObject:](self->_displayedBatteryDevices, "containsObject:", v24) & 1) == 0)
  {
    if (v7)
    {
      kdebug_trace();
      kdebug_trace();
    }
    if (v24)
      -[NSMutableSet addObject:](self->_displayedBatteryDevices, "addObject:", v24);
    -[CSChargingViewController _createNewChargingViewForDoubleBattery:](self, "_createNewChargingViewForDoubleBattery:");
  }
  -[BCBatteryDeviceController sb_deviceInternalBattery](self->_batteryController, "sb_deviceInternalBattery");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  chargingView = self->_chargingView;
  CSChargePercentageLabelForBattery(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSBatteryChargingView setPrimaryBatteryText:forBattery:](chargingView, "setPrimaryBatteryText:forBattery:", v14, v12);

  if (v24)
    v15 = 1;
  else
    v15 = v6;
  if (v15 == 1)
  {
    if (v6)
      v16 = v12;
    else
      v16 = v24;
    if (v7)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = (void *)MEMORY[0x1E0CB34D0];
      v19 = v16;
      objc_msgSend(v18, "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("BATTERY_PACK_CHARGE"), &stru_1E8E30B28, CFSTR("CoverSheet"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      CSSimpleChargePercentageLabelForBattery(v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      CSChargePercentageLabelForBattery(v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CSBatteryChargingView setSecondaryBatteryText:forBattery:](self->_chargingView, "setSecondaryBatteryText:forBattery:", v23, v16);

  }
}

- (void)_createNewChargingViewForDoubleBattery:(id)a3
{
  CSBatteryChargingView *chargingView;
  id v5;
  CSBatteryChargingView *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  CSBatteryChargingView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CSBatteryChargingView *v19;
  CSBatteryChargingView *v20;

  chargingView = self->_chargingView;
  v5 = a3;
  -[CSBatteryChargingView removeFromSuperview](chargingView, "removeFromSuperview");
  -[CSCoverSheetViewControllerBase unregisterView:](self, "unregisterView:", self->_chargingView);
  v6 = self->_chargingView;
  self->_chargingView = 0;

  v7 = objc_msgSend(v5, "productIdentifier");
  v8 = *MEMORY[0x1E0D01B28];
  if (v5 && v7 != v8)
  {
    +[CSBatteryChargingView batteryChargingViewWithDoubleBattery](CSBatteryChargingView, "batteryChargingViewWithDoubleBattery");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v14 = (CSBatteryChargingView *)v9;
    goto LABEL_14;
  }
  if (!-[CSBatteryChargingInfo isChargingWithInternalWirelessAccessory](self->_chargingInfo, "isChargingWithInternalWirelessAccessory"))
  {
    if (v7 == v8)
    {
      +[CSMagSafeAccessoryConfiguration batteryCaseConfiguration](CSMagSafeAccessoryConfiguration, "batteryCaseConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSBatteryChargingView batteryChargingRingViewWithConfiguration:](CSBatteryChargingView, "batteryChargingRingViewWithConfiguration:", v16);
      v14 = (CSBatteryChargingView *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
    +[CSBatteryChargingView batteryChargingViewWithSingleBattery](CSBatteryChargingView, "batteryChargingViewWithSingleBattery");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  kdebug_trace();
  +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chargingSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldFakeA149Attach");

  if (v7 == v8 || v12)
  {
    +[CSMagSafeAccessoryConfiguration batteryCaseConfiguration](CSMagSafeAccessoryConfiguration, "batteryCaseConfiguration");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CSMagSafeAccessoryConfiguration defaultConfiguration](CSMagSafeAccessoryConfiguration, "defaultConfiguration");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v13;
  +[CSBatteryChargingView batteryChargingRingViewWithConfiguration:](CSBatteryChargingView, "batteryChargingRingViewWithConfiguration:", v13);
  v14 = (CSBatteryChargingView *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  -[CSBatteryChargingView setBatteryVisible:](v14, "setBatteryVisible:", 1);
  -[CSChargingViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  -[CSBatteryChargingView setFrame:](v14, "setFrame:");

  -[CSBatteryChargingView setAutoresizingMask:](v14, "setAutoresizingMask:", 18);
  -[CSChargingViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v14);

  v19 = self->_chargingView;
  self->_chargingView = v14;
  v20 = v14;

  -[CSChargingViewController _updateChargingViewLegibility](self, "_updateChargingViewLegibility");
  -[CSCoverSheetViewControllerBase registerView:forRole:](self, "registerView:forRole:", self->_chargingView, 2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedBatteryDevices, 0);
  objc_storeStrong((id *)&self->_chargingInfo, 0);
  objc_storeStrong((id *)&self->_chargingView, 0);
  objc_storeStrong((id *)&self->_batteryController, 0);
}

@end
