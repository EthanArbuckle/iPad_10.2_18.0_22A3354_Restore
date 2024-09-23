@implementation LogCategory

void __LogCategory_Unspecified_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "_");
  v1 = (void *)LogCategory_Unspecified_log;
  LogCategory_Unspecified_log = (uint64_t)v0;

}

void __LogCategory_Locations_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "locations");
  v1 = (void *)LogCategory_Locations_log;
  LogCategory_Locations_log = (uint64_t)v0;

}

void __LogCategory_Accessory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "accessory");
  v1 = (void *)LogCategory_Accessory_log;
  LogCategory_Accessory_log = (uint64_t)v0;

}

void __LogCategory_Traffic_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "traffic");
  v1 = (void *)LogCategory_Traffic_log;
  LogCategory_Traffic_log = (uint64_t)v0;

}

void __LogCategory_Encoder_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "encoder");
  v1 = (void *)LogCategory_Encoder_log;
  LogCategory_Encoder_log = (uint64_t)v0;

}

void __LogCategory_Bluetooth_Session_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "bluetoothsession");
  v1 = (void *)LogCategory_Bluetooth_Session_log;
  LogCategory_Bluetooth_Session_log = (uint64_t)v0;

}

void __LogCategory_Extensions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "extensions");
  v1 = (void *)LogCategory_Extensions_log;
  LogCategory_Extensions_log = (uint64_t)v0;

}

void __LogCategory_Extensions_PlaySound_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "extensions_playSound");
  v1 = (void *)LogCategory_Extensions_PlaySound_log;
  LogCategory_Extensions_PlaySound_log = (uint64_t)v0;

}

void __LogCategory_SecureLocations_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "secureLocations");
  v1 = (void *)LogCategory_SecureLocations_log;
  LogCategory_SecureLocations_log = (uint64_t)v0;

}

void __LogCategory_RepairDevice_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "repairDevice");
  v1 = (void *)LogCategory_RepairDevice_log;
  LogCategory_RepairDevice_log = (uint64_t)v0;

}

void __LogCategory_ALFailureAnalytics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "ALFailureAnalytics");
  v1 = (void *)LogCategory_ALFailureAnalytics_log;
  LogCategory_ALFailureAnalytics_log = (uint64_t)v0;

}

void __LogCategory_DisableLocationDisplay_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "disableLocationDisplay");
  v1 = (void *)LogCategory_DisableLocationDisplay_log;
  LogCategory_DisableLocationDisplay_log = (uint64_t)v0;

}

void __LogCategory_AccountRatchet_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "accountRatchet");
  v1 = (void *)LogCategory_AccountRatchet_log;
  LogCategory_AccountRatchet_log = (uint64_t)v0;

}

void __LogCategory_OwnerAuthentication_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "ownerAuthentication");
  v1 = (void *)LogCategory_OwnerAuthentication_log;
  LogCategory_OwnerAuthentication_log = (uint64_t)v0;

}

void __LogCategory_Automation_block_invoke()
{
  os_log_t v0;
  void *v1;

  if (objc_msgSend(MEMORY[0x1E0D20200], "BOOLForKey:inDomain:", CFSTR("ShowAutomationLogs"), CFSTR("com.apple.icloud.findmydeviced.notbackedup")))
  {
    v0 = os_log_create("com.apple.icloud.findmydeviced", "automation");
    v1 = (void *)LogCategory_Automation_log;
    LogCategory_Automation_log = (uint64_t)v0;

  }
}

@end
