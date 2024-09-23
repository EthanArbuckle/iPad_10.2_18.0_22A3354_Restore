@implementation ULEnvironment

+ (id)standardEnvironment
{
  return objc_alloc_init((Class)a1);
}

- (ULEnvironment)init
{
  ULEnvironment *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  id v5;
  ULDataProtectionMonitor *v6;
  void *v7;
  ULDataProtectionMonitor *v8;
  ULAirplaneModeMonitor *v9;
  ULBatteryModeMonitor *v10;
  void *v11;
  ULBatteryModeMonitor *v12;
  ULBluetoothMonitor *v13;
  ULRapportMonitor *v14;
  void *v15;
  ULRapportMonitor *v16;
  ULDisplayMonitor_OSX *v17;
  ULInternalNotifyMonitor *v18;
  void *v19;
  ULInternalNotifyMonitor *v20;
  ULBGSystemTaskManager *v21;
  ULDiagnostics *v22;
  ULPrivacyMonitor *v23;
  void *v24;
  ULPrivacyMonitor *v25;
  ULBuddyMonitor *v26;
  void *v27;
  ULBuddyMonitor *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)ULEnvironment;
  v2 = -[ULEnvironment init](&v30, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.milod.mainQueue", v3);
    -[ULEnvironment setQueue:](v2, "setQueue:", v4);

    v5 = objc_alloc_init(MEMORY[0x24BE669D8]);
    -[ULEnvironment setNotificationHelper:](v2, "setNotificationHelper:", v5);

    v6 = [ULDataProtectionMonitor alloc];
    -[ULEnvironment notificationHelper](v2, "notificationHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ULDataProtectionMonitor initWithNotificationHelper:](v6, "initWithNotificationHelper:", v7);
    -[ULEnvironment setDataProtectionMonitor:](v2, "setDataProtectionMonitor:", v8);

    v9 = objc_alloc_init(ULAirplaneModeMonitor);
    -[ULEnvironment setAirplaneModeMonitor:](v2, "setAirplaneModeMonitor:", v9);

    v10 = [ULBatteryModeMonitor alloc];
    -[ULEnvironment notificationHelper](v2, "notificationHelper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ULBatteryModeMonitor initWithNotificationHelper:](v10, "initWithNotificationHelper:", v11);
    -[ULEnvironment setBatteryModeMonitor:](v2, "setBatteryModeMonitor:", v12);

    v13 = objc_alloc_init(ULBluetoothMonitor);
    -[ULEnvironment setBluetoothMonitor:](v2, "setBluetoothMonitor:", v13);

    v14 = [ULRapportMonitor alloc];
    -[ULEnvironment notificationHelper](v2, "notificationHelper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[ULRapportMonitor initWithNotificationHelper:identityTypeFlags:controlFlags:](v14, "initWithNotificationHelper:identityTypeFlags:controlFlags:", v15, 10, 4);
    -[ULEnvironment setRapportMonitor:](v2, "setRapportMonitor:", v16);

    if (objc_msgSend(MEMORY[0x24BE669E0], "isMac"))
    {
      v17 = objc_alloc_init(ULDisplayMonitor_OSX);
      -[ULEnvironment setDisplayMonitor_OSX:](v2, "setDisplayMonitor_OSX:", v17);
    }
    else
    {
      v17 = objc_alloc_init(ULDisplayMonitor);
      -[ULEnvironment setDisplayMonitor:](v2, "setDisplayMonitor:", v17);
    }

    v18 = [ULInternalNotifyMonitor alloc];
    -[ULEnvironment notificationHelper](v2, "notificationHelper");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[ULInternalNotifyMonitor initWithNotificationHelper:](v18, "initWithNotificationHelper:", v19);
    -[ULEnvironment setInternalNotifyMonitor:](v2, "setInternalNotifyMonitor:", v20);

    v21 = objc_alloc_init(ULBGSystemTaskManager);
    -[ULEnvironment setBackgroundSystemTaskManager:](v2, "setBackgroundSystemTaskManager:", v21);

    v22 = -[ULDiagnostics initWithLabel:]([ULDiagnostics alloc], "initWithLabel:", CFSTR("milod"));
    -[ULEnvironment setDiagnostics:](v2, "setDiagnostics:", v22);

    v23 = [ULPrivacyMonitor alloc];
    -[ULEnvironment notificationHelper](v2, "notificationHelper");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[ULPrivacyMonitor initWithNotificationHelper:](v23, "initWithNotificationHelper:", v24);
    -[ULEnvironment setPrivacyMonitor:](v2, "setPrivacyMonitor:", v25);

    v26 = [ULBuddyMonitor alloc];
    -[ULEnvironment notificationHelper](v2, "notificationHelper");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[ULBuddyMonitor initWithNotificationHelper:](v26, "initWithNotificationHelper:", v27);
    -[ULEnvironment setBuddyMonitor:](v2, "setBuddyMonitor:", v28);

  }
  return v2;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (ULDataProtectionMonitor)dataProtectionMonitor
{
  return self->_dataProtectionMonitor;
}

- (void)setDataProtectionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_dataProtectionMonitor, a3);
}

- (ULAirplaneModeMonitor)airplaneModeMonitor
{
  return self->_airplaneModeMonitor;
}

- (void)setAirplaneModeMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_airplaneModeMonitor, a3);
}

- (ULBatteryModeMonitor)batteryModeMonitor
{
  return self->_batteryModeMonitor;
}

- (void)setBatteryModeMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_batteryModeMonitor, a3);
}

- (ULBluetoothMonitor)bluetoothMonitor
{
  return self->_bluetoothMonitor;
}

- (void)setBluetoothMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothMonitor, a3);
}

- (ULRapportMonitor)rapportMonitor
{
  return self->_rapportMonitor;
}

- (void)setRapportMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_rapportMonitor, a3);
}

- (ULDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayMonitor, a3);
}

- (ULDisplayMonitor_OSX)displayMonitor_OSX
{
  return self->_displayMonitor_OSX;
}

- (void)setDisplayMonitor_OSX:(id)a3
{
  objc_storeStrong((id *)&self->_displayMonitor_OSX, a3);
}

- (ULInternalNotifyMonitor)internalNotifyMonitor
{
  return self->_internalNotifyMonitor;
}

- (void)setInternalNotifyMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_internalNotifyMonitor, a3);
}

- (ULBGSystemTaskManager)backgroundSystemTaskManager
{
  return self->_backgroundSystemTaskManager;
}

- (void)setBackgroundSystemTaskManager:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundSystemTaskManager, a3);
}

- (ULDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
  objc_storeStrong((id *)&self->_diagnostics, a3);
}

- (ULPrivacyMonitor)privacyMonitor
{
  return self->_privacyMonitor;
}

- (void)setPrivacyMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_privacyMonitor, a3);
}

- (ULBuddyMonitor)buddyMonitor
{
  return self->_buddyMonitor;
}

- (void)setBuddyMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_buddyMonitor, a3);
}

- (ULDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_buddyMonitor, 0);
  objc_storeStrong((id *)&self->_privacyMonitor, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_backgroundSystemTaskManager, 0);
  objc_storeStrong((id *)&self->_internalNotifyMonitor, 0);
  objc_storeStrong((id *)&self->_displayMonitor_OSX, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_rapportMonitor, 0);
  objc_storeStrong((id *)&self->_bluetoothMonitor, 0);
  objc_storeStrong((id *)&self->_batteryModeMonitor, 0);
  objc_storeStrong((id *)&self->_airplaneModeMonitor, 0);
  objc_storeStrong((id *)&self->_dataProtectionMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
