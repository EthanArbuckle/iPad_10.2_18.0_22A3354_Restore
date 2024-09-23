@implementation CAFAccessoryTypes

+ (NSDictionary)accessoryTypeByName
{
  if (accessoryTypeByName_onceToken != -1)
    dispatch_once(&accessoryTypeByName_onceToken, &__block_literal_global_8);
  return (NSDictionary *)(id)accessoryTypeByName__accessoryTypeByName;
}

void __40__CAFAccessoryTypes_accessoryTypeByName__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[28];
  _QWORD v3[29];

  v3[28] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("AudioSettings");
  v2[1] = CFSTR("AutomakerExteriorCamera");
  v3[0] = CFSTR("0x0000000002000001");
  v3[1] = CFSTR("0x0000000001300001");
  v2[2] = CFSTR("AutomakerInputStreams");
  v2[3] = CFSTR("AutomakerNotificationHistory");
  v3[2] = CFSTR("0x000000000C000001");
  v3[3] = CFSTR("0x0000000001400001");
  v2[4] = CFSTR("AutomakerNotifications");
  v2[5] = CFSTR("AutomakerRequestContent");
  v3[4] = CFSTR("0x0000000006000001");
  v3[5] = CFSTR("0x0000000001200001");
  v2[6] = CFSTR("AutomakerSettings");
  v2[7] = CFSTR("Charging");
  v3[6] = CFSTR("0x0000000005000001");
  v3[7] = CFSTR("0x0000000009000008");
  v2[8] = CFSTR("Climate");
  v2[9] = CFSTR("Closure");
  v3[8] = CFSTR("0x0000000001000001");
  v3[9] = CFSTR("0x000000000D000001");
  v2[10] = CFSTR("DriveState");
  v2[11] = CFSTR("DriverAssistance");
  v3[10] = CFSTR("0x0000000009000003");
  v3[11] = CFSTR("0x000000000E000001");
  v2[12] = CFSTR("ElectricEngine");
  v2[13] = CFSTR("EnvironmentalConditions");
  v3[12] = CFSTR("0x0000000009000004");
  v3[13] = CFSTR("0x0000000001600001");
  v2[14] = CFSTR("Fuel");
  v2[15] = CFSTR("HighVoltageBattery");
  v3[14] = CFSTR("0x0000000009000006");
  v3[15] = CFSTR("0x0000000009000007");
  v2[16] = CFSTR("InternalCombustionEngine");
  v2[17] = CFSTR("Media");
  v3[16] = CFSTR("0x0000000009000005");
  v3[17] = CFSTR("0x0000000003000001");
  v2[18] = CFSTR("NowPlayingInformation");
  v2[19] = CFSTR("PairedDevices");
  v3[18] = CFSTR("0x000000000F000001");
  v3[19] = CFSTR("0x000000000B000001");
  v2[20] = CFSTR("Seat");
  v2[21] = CFSTR("TestingUseOnly");
  v3[20] = CFSTR("0x0000000001500001");
  v3[21] = CFSTR("0x00000000FD000001");
  v2[22] = CFSTR("Tire");
  v2[23] = CFSTR("TripComputer");
  v3[22] = CFSTR("0x000000000A000001");
  v3[23] = CFSTR("0x0000000004000001");
  v2[24] = CFSTR("UIControl");
  v2[25] = CFSTR("VehicleMotion");
  v3[24] = CFSTR("0x0000000001100001");
  v3[25] = CFSTR("0x0000000009000001");
  v2[26] = CFSTR("VehicleResources");
  v2[27] = CFSTR("VehicleUnits");
  v3[26] = CFSTR("0x0000000001200002");
  v3[27] = CFSTR("0x0000000001700001");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 28);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)accessoryTypeByName__accessoryTypeByName;
  accessoryTypeByName__accessoryTypeByName = v0;

}

+ (NSDictionary)accessoryNameByType
{
  if (accessoryNameByType_onceToken != -1)
    dispatch_once(&accessoryNameByType_onceToken, &__block_literal_global_126);
  return (NSDictionary *)(id)accessoryNameByType__accessoryNameByType;
}

void __40__CAFAccessoryTypes_accessoryNameByType__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[28];
  _QWORD v3[29];

  v3[28] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("0x0000000002000001");
  v2[1] = CFSTR("0x0000000001300001");
  v3[0] = CFSTR("AudioSettings");
  v3[1] = CFSTR("AutomakerExteriorCamera");
  v2[2] = CFSTR("0x000000000C000001");
  v2[3] = CFSTR("0x0000000001400001");
  v3[2] = CFSTR("AutomakerInputStreams");
  v3[3] = CFSTR("AutomakerNotificationHistory");
  v2[4] = CFSTR("0x0000000006000001");
  v2[5] = CFSTR("0x0000000001200001");
  v3[4] = CFSTR("AutomakerNotifications");
  v3[5] = CFSTR("AutomakerRequestContent");
  v2[6] = CFSTR("0x0000000005000001");
  v2[7] = CFSTR("0x0000000009000008");
  v3[6] = CFSTR("AutomakerSettings");
  v3[7] = CFSTR("Charging");
  v2[8] = CFSTR("0x0000000001000001");
  v2[9] = CFSTR("0x000000000D000001");
  v3[8] = CFSTR("Climate");
  v3[9] = CFSTR("Closure");
  v2[10] = CFSTR("0x0000000009000003");
  v2[11] = CFSTR("0x000000000E000001");
  v3[10] = CFSTR("DriveState");
  v3[11] = CFSTR("DriverAssistance");
  v2[12] = CFSTR("0x0000000009000004");
  v2[13] = CFSTR("0x0000000001600001");
  v3[12] = CFSTR("ElectricEngine");
  v3[13] = CFSTR("EnvironmentalConditions");
  v2[14] = CFSTR("0x0000000009000006");
  v2[15] = CFSTR("0x0000000009000007");
  v3[14] = CFSTR("Fuel");
  v3[15] = CFSTR("HighVoltageBattery");
  v2[16] = CFSTR("0x0000000009000005");
  v2[17] = CFSTR("0x0000000003000001");
  v3[16] = CFSTR("InternalCombustionEngine");
  v3[17] = CFSTR("Media");
  v2[18] = CFSTR("0x000000000F000001");
  v2[19] = CFSTR("0x000000000B000001");
  v3[18] = CFSTR("NowPlayingInformation");
  v3[19] = CFSTR("PairedDevices");
  v2[20] = CFSTR("0x0000000001500001");
  v2[21] = CFSTR("0x00000000FD000001");
  v3[20] = CFSTR("Seat");
  v3[21] = CFSTR("TestingUseOnly");
  v2[22] = CFSTR("0x000000000A000001");
  v2[23] = CFSTR("0x0000000004000001");
  v3[22] = CFSTR("Tire");
  v3[23] = CFSTR("TripComputer");
  v2[24] = CFSTR("0x0000000001100001");
  v2[25] = CFSTR("0x0000000009000001");
  v3[24] = CFSTR("UIControl");
  v3[25] = CFSTR("VehicleMotion");
  v2[26] = CFSTR("0x0000000001200002");
  v2[27] = CFSTR("0x0000000001700001");
  v3[26] = CFSTR("VehicleResources");
  v3[27] = CFSTR("VehicleUnits");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 28);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)accessoryNameByType__accessoryNameByType;
  accessoryNameByType__accessoryNameByType = v0;

}

+ (NSSet)stateCaptureValues
{
  if (stateCaptureValues_onceToken_0 != -1)
    dispatch_once(&stateCaptureValues_onceToken_0, &__block_literal_global_127);
  return (NSSet *)(id)stateCaptureValues__stateCaptureValues_0;
}

void __39__CAFAccessoryTypes_stateCaptureValues__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[24];

  v4[23] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = CFSTR("0x0000000002000001");
  v4[1] = CFSTR("0x0000000001300001");
  v4[2] = CFSTR("0x000000000C000001");
  v4[3] = CFSTR("0x0000000006000001");
  v4[4] = CFSTR("0x0000000001200001");
  v4[5] = CFSTR("0x0000000009000008");
  v4[6] = CFSTR("0x0000000001000001");
  v4[7] = CFSTR("0x000000000D000001");
  v4[8] = CFSTR("0x0000000009000003");
  v4[9] = CFSTR("0x000000000E000001");
  v4[10] = CFSTR("0x0000000009000004");
  v4[11] = CFSTR("0x0000000001600001");
  v4[12] = CFSTR("0x0000000009000006");
  v4[13] = CFSTR("0x0000000009000007");
  v4[14] = CFSTR("0x0000000009000005");
  v4[15] = CFSTR("0x0000000003000001");
  v4[16] = CFSTR("0x000000000F000001");
  v4[17] = CFSTR("0x0000000001500001");
  v4[18] = CFSTR("0x000000000A000001");
  v4[19] = CFSTR("0x0000000004000001");
  v4[20] = CFSTR("0x0000000001100001");
  v4[21] = CFSTR("0x0000000009000001");
  v4[22] = CFSTR("0x0000000001700001");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 23);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)stateCaptureValues__stateCaptureValues_0;
  stateCaptureValues__stateCaptureValues_0 = v2;

}

+ (id)accessoryNameForType:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "accessoryNameByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = v4;

  return v6;
}

+ (id)accessoryNameFor:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "accessoryTypeFor:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessoryNameForType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)accessoryTypeFor:(id)a3
{
  return (id)objc_msgSend(a3, "categoryType");
}

@end
