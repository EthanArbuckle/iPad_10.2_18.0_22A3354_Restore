@implementation ACCPlatformPluginIOKit

- (NSString)pluginName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)initPlugin
{
  init_logging();
  -[ACCPlatformPluginIOKit setIsRunning:](self, "setIsRunning:", 0);
}

- (void)startPlugin
{
  -[ACCPlatformPluginIOKit setIsRunning:](self, "setIsRunning:", 1);
}

- (void)stopPlugin
{
  -[ACCPlatformPluginIOKit setIsRunning:](self, "setIsRunning:", 0);
}

- (void)usbFaultMonitor:(BOOL)a3 forUUID:(id)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = a4;
  +[USBFaultMonitor sharedMonitor](USBFaultMonitor, "sharedMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "startFaultMonitoringForUUID:", v5);
  else
    objc_msgSend(v6, "stopFaultMonitoringForUUID:", v5);

}

- (void)usbCableTypeMonitor:(BOOL)a3 forUUID:(id)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = a4;
  +[USBCableTypeMonitor sharedMonitor](USBCableTypeMonitor, "sharedMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "startCableTypeMonitoringForUUID:", v5);
  else
    objc_msgSend(v6, "stopCableTypeMonitoringForUUID:", v5);

}

- (BOOL)getUSBFaultStateforType:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  +[USBFaultMonitor sharedMonitor](USBFaultMonitor, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "getFaultState:", v3);

  return v3;
}

- (BOOL)isExternalChargerConnected
{
  void *v2;
  char v3;

  +[PowerMonitor sharedMonitor](PowerMonitor, "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExternalChargerConnected");

  return v3;
}

- (int)getBatteryChargingState
{
  void *v2;
  int v3;

  +[PowerMonitor sharedMonitor](PowerMonitor, "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getBatteryChargingState");

  return v3;
}

- (unsigned)getBatteryChargeLevel
{
  void *v2;
  unsigned __int8 v3;

  +[PowerMonitor sharedMonitor](PowerMonitor, "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getBatteryChargeLevel");

  return v3;
}

- (id)createBatteryNotificationClient
{
  void *v2;
  void *v3;

  +[PowerMonitor sharedMonitor](PowerMonitor, "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createBatteryNotificationClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)destroyBatteryNotificationsForClient:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[PowerMonitor sharedMonitor](PowerMonitor, "sharedMonitor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destroyBatteryNotificationsForClient:", v3);

}

- (id)createSleepNotificationClient
{
  void *v2;
  void *v3;

  +[PowerMonitor sharedMonitor](PowerMonitor, "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createSleepNotificationClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)destroySleepNotificationsForClient:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[PowerMonitor sharedMonitor](PowerMonitor, "sharedMonitor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destroySleepNotificationsForClient:", v3);

}

- (void)clientHandledSleepNotification:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[PowerMonitor sharedMonitor](PowerMonitor, "sharedMonitor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientHandledSleepNotification:", v3);

}

- (int)getBatteryChargingType
{
  void *v2;
  int v3;

  +[PowerMonitor sharedMonitor](PowerMonitor, "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getBatteryChargingType");

  return v3;
}

- (int)getExternalBatteryChargingType
{
  void *v2;
  int v3;

  +[PowerMonitor sharedMonitor](PowerMonitor, "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getExternalBatteryChargingType");

  return v3;
}

- (BOOL)getBatteryChargingTypeIsInductive
{
  void *v2;
  char v3;

  +[PowerMonitor sharedMonitor](PowerMonitor, "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getBatteryChargingTypeIsInductive");

  return v3;
}

- (BOOL)getExternalBatteryChargingTypeIsInductive
{
  void *v2;
  char v3;

  +[PowerMonitor sharedMonitor](PowerMonitor, "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getExternalBatteryChargingTypeIsInductive");

  return v3;
}

- (void)initUSBCameraKitHubNotifications:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initUSBCameraKitHubNotifications:", v3);

}

- (unsigned)getUSBHubUnitLoadInmA:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;

  v3 = a3;
  +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getUSBHubUnitLoadInmA:", v3);

  return v5;
}

- (unsigned)getUSBHubSiphoningCurrentRequirementInmA:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;

  v3 = a3;
  +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getUSBHubSiphoningCurrentRequirementInmA:", v3);

  return v5;
}

- (unsigned)getUSBHubSiphoningCurrentActualRequirementInmA:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;

  v3 = a3;
  +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getUSBHubSiphoningCurrentActualRequirementInmA:", v3);

  return v5;
}

- (BOOL)getUSBHubOverCurrentState:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "overcurrentState:", v3);

  return v5;
}

- (void)resetUSBHubOverCurrentSiphoning:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetOvercurrentSiphoning:", v3);

}

- (void)setUSBHubOverCurrentSiphoning:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[USBCameraKitHubMonitor sharedMonitor](USBCameraKitHubMonitor, "sharedMonitor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOvercurrentSiphoning:", v3);

}

- (void)createSleepAssertionForUUID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SleepAssertionManager sharedManager](SleepAssertionManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createSleepAssertionForUUID:", v3);

}

- (void)destroySleepAssertionForUUID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SleepAssertionManager sharedManager](SleepAssertionManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destroySleepAssertionForUUID:", v3);

}

- (void)createEASleepAssertion
{
  id v2;

  +[SleepAssertionManager sharedManager](SleepAssertionManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createEASleepAssertion");

}

- (void)removeEASleepAssertion
{
  id v2;

  +[SleepAssertionManager sharedManager](SleepAssertionManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeEASleepAssertion");

}

- (void)createApplePencilSleepAssertion
{
  id v2;

  +[SleepAssertionManager sharedManager](SleepAssertionManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createApplePencilSleepAssertion");

}

- (void)removeApplePencilSleepAssertion
{
  id v2;

  +[SleepAssertionManager sharedManager](SleepAssertionManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeApplePencilSleepAssertion");

}

- (void)createMFi4SleepAssertion
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2171EA000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

- (void)removeMFi4SleepAssertion
{
  BOOL v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginIOKit createMFi4SleepAssertion].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2171EA000, v4, OS_LOG_TYPE_DEFAULT, "ACCPlatformPluginIOKit: removeMFi4SleepAssertion: MFi4 sleep assertion removed", v6, 2u);
  }

  +[SleepAssertionManager sharedManager](SleepAssertionManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeMFi4SleepAssertion");

}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (USBFaultMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_monitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
