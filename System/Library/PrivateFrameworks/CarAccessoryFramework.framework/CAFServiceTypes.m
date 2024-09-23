@implementation CAFServiceTypes

+ (NSDictionary)serviceTypeByName
{
  if (serviceTypeByName_onceToken != -1)
    dispatch_once(&serviceTypeByName_onceToken, &__block_literal_global_15);
  return (NSDictionary *)(id)serviceTypeByName__serviceTypeByName;
}

void __36__CAFServiceTypes_serviceTypeByName__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[76];
  _QWORD v3[77];

  v3[76] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("AutoClimateControl");
  v2[1] = CFSTR("BatteryLevel");
  v3[0] = CFSTR("0x0000000011000008");
  v3[1] = CFSTR("0x000000001A000006");
  v2[2] = CFSTR("BatteryTemperature");
  v2[3] = CFSTR("BooleanSetting");
  v3[2] = CFSTR("0x000000001A000011");
  v3[3] = CFSTR("0x0000000016000001");
  v2[4] = CFSTR("ButtonSetting");
  v2[5] = CFSTR("Cabin");
  v3[4] = CFSTR("0x0000000016000002");
  v3[5] = CFSTR("0x0000000011000001");
  v2[6] = CFSTR("CameraButton");
  v2[7] = CFSTR("CameraGeneral");
  v3[6] = CFSTR("0x000000001F000002");
  v3[7] = CFSTR("0x000000001F000001");
  v2[8] = CFSTR("ChargingRate");
  v2[9] = CFSTR("ChargingStatus");
  v3[8] = CFSTR("0x0000000019000003");
  v3[9] = CFSTR("0x0000000019000002");
  v2[10] = CFSTR("ChargingTime");
  v2[11] = CFSTR("ClimateControlsLocked");
  v3[10] = CFSTR("0x0000000019000007");
  v3[11] = CFSTR("0x0000000011000010");
  v2[12] = CFSTR("ClosureState");
  v2[13] = CFSTR("CriticalInputStream");
  v3[12] = CFSTR("0x000000001D000001");
  v3[13] = CFSTR("0x000000001C000001");
  v2[14] = CFSTR("DeepLinkSetting");
  v2[15] = CFSTR("Defrost");
  v3[14] = CFSTR("0x0000000016000006");
  v3[15] = CFSTR("0x0000000011000005");
  v2[16] = CFSTR("DisplayUnits");
  v2[17] = CFSTR("DisplayedSpeed");
  v3[16] = CFSTR("0x000000001F000008");
  v3[17] = CFSTR("0x000000001A000009");
  v2[18] = CFSTR("DriveMode");
  v2[19] = CFSTR("EnginePower");
  v3[18] = CFSTR("0x000000001A000008");
  v3[19] = CFSTR("0x000000001A00000D");
  v2[20] = CFSTR("EngineRPM");
  v2[21] = CFSTR("EngineTemperature");
  v3[20] = CFSTR("0x000000001A00000F");
  v3[21] = CFSTR("0x000000001A000010");
  v2[22] = CFSTR("Equalizer");
  v2[23] = CFSTR("ExteriorConditions");
  v3[22] = CFSTR("0x0000000013000003");
  v3[23] = CFSTR("0x0000000011000009");
  v2[24] = CFSTR("Fan");
  v2[25] = CFSTR("FloatSetting");
  v3[24] = CFSTR("0x0000000011000007");
  v3[25] = CFSTR("0x0000000016000003");
  v2[26] = CFSTR("FuelConsumption");
  v2[27] = CFSTR("FuelLevel");
  v3[26] = CFSTR("0x000000001A000014");
  v3[27] = CFSTR("0x000000001A000005");
  v2[28] = CFSTR("GearRecommendation");
  v2[29] = CFSTR("HistoricalNotification");
  v3[28] = CFSTR("0x000000001A000007");
  v3[29] = CFSTR("0x0000000021000001");
  v2[30] = CFSTR("IntegerSetting");
  v2[31] = CFSTR("InteriorConditions");
  v3[30] = CFSTR("0x0000000016000007");
  v3[31] = CFSTR("0x0000000011000013");
  v2[32] = CFSTR("LocalNotification");
  v2[33] = CFSTR("MediaSource");
  v3[32] = CFSTR("0x0000000017000002");
  v3[33] = CFSTR("0x0000000014000006");
  v2[34] = CFSTR("MultipleSelectImageSetting");
  v2[35] = CFSTR("MultipleSelectSetting");
  v3[34] = CFSTR("0x0000000016000017");
  v3[35] = CFSTR("0x0000000016000005");
  v2[36] = CFSTR("NowPlaying");
  v2[37] = CFSTR("Odometer");
  v3[36] = CFSTR("0x0000000014000001");
  v3[37] = CFSTR("0x000000001A00000A");
  v2[38] = CFSTR("PairedDevicesAction");
  v2[39] = CFSTR("PairedDevicesInformation");
  v3[38] = CFSTR("0x0000000016000019");
  v3[39] = CFSTR("0x0000000016000018");
  v2[40] = CFSTR("Picker");
  v2[41] = CFSTR("ProtocolPerfTest");
  v3[40] = CFSTR("0x0000000017000003");
  v3[41] = CFSTR("0x00000000FE000006");
  v2[42] = CFSTR("Recirculation");
  v2[43] = CFSTR("RemainingRange");
  v3[42] = CFSTR("0x0000000011000011");
  v3[43] = CFSTR("0x000000001A00000B");
  v2[44] = CFSTR("RemoteNotification");
  v2[45] = CFSTR("RequestContent");
  v3[44] = CFSTR("0x0000000017000001");
  v3[45] = CFSTR("0x0000000017000004");
  v2[46] = CFSTR("SeatBelt");
  v2[47] = CFSTR("SeatFan");
  v3[46] = CFSTR("0x0000000022000004");
  v3[47] = CFSTR("0x0000000022000002");
  v2[48] = CFSTR("SeatHeatingCooling");
  v2[49] = CFSTR("SettingsSection");
  v3[48] = CFSTR("0x0000000022000001");
  v3[49] = CFSTR("0x0000000016000020");
  v2[50] = CFSTR("SingleSelectImageSetting");
  v2[51] = CFSTR("SingleSelectSetting");
  v3[50] = CFSTR("0x0000000016000016");
  v3[51] = CFSTR("0x0000000016000004");
  v2[52] = CFSTR("SoundDistribution");
  v2[53] = CFSTR("StaticSetting");
  v3[52] = CFSTR("0x0000000013000005");
  v3[53] = CFSTR("0x0000000016000015");
  v2[54] = CFSTR("SteeringWheelHeatingCooling");
  v2[55] = CFSTR("TargetSpeed");
  v3[54] = CFSTR("0x0000000011000003");
  v3[55] = CFSTR("0x000000001E000004");
  v2[56] = CFSTR("Temperature");
  v2[57] = CFSTR("TestControlAsync");
  v3[56] = CFSTR("0x0000000011000002");
  v3[57] = CFSTR("0x00000000FE000009");
  v2[58] = CFSTR("TestControlEvent");
  v2[59] = CFSTR("TestControlSync");
  v3[58] = CFSTR("0x00000000FE00000A");
  v3[59] = CFSTR("0x00000000FE000008");
  v2[60] = CFSTR("TirePressure");
  v2[61] = CFSTR("TirePressureMonitoringSystem");
  v3[60] = CFSTR("0x000000001B000001");
  v3[61] = CFSTR("0x000000001B000006");
  v2[62] = CFSTR("TransmissionStatus");
  v2[63] = CFSTR("Trip");
  v3[62] = CFSTR("0x000000001A000003");
  v3[63] = CFSTR("0x0000000015000002");
  v2[64] = CFSTR("TypeTest");
  v3[64] = CFSTR("0x00000000FE000001");
  v2[65] = CFSTR("TypeTestIndexByPosition");
  v3[65] = CFSTR("0x00000000FE000004");
  v2[66] = CFSTR("TypeTestIndexByUnit");
  v3[66] = CFSTR("0x00000000FE000005");
  v2[67] = CFSTR("TypeTestMulti");
  v3[67] = CFSTR("0x00000000FE000003");
  v2[68] = CFSTR("TypeTestWithStates");
  v3[68] = CFSTR("0x00000000FE000007");
  v2[69] = CFSTR("UIInputDeviceButton");
  v3[69] = CFSTR("0x0000000011100002");
  v2[70] = CFSTR("UIState");
  v3[70] = CFSTR("0x0000000011100001");
  v2[71] = CFSTR("VehicleInformation");
  v3[71] = CFSTR("0x000000001A000013");
  v2[72] = CFSTR("VehicleVariant");
  v3[72] = CFSTR("0x0000000020000001");
  v2[73] = CFSTR("Vent");
  v3[73] = CFSTR("0x0000000011000006");
  v2[74] = CFSTR("Volume");
  v3[74] = CFSTR("0x0000000013000002");
  v2[75] = CFSTR("ZonesSynced");
  v3[75] = CFSTR("0x0000000011000012");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 76);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serviceTypeByName__serviceTypeByName;
  serviceTypeByName__serviceTypeByName = v0;

}

+ (NSDictionary)serviceNameByType
{
  if (serviceNameByType_onceToken != -1)
    dispatch_once(&serviceNameByType_onceToken, &__block_literal_global_318);
  return (NSDictionary *)(id)serviceNameByType__serviceNameByType;
}

void __36__CAFServiceTypes_serviceNameByType__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[76];
  _QWORD v3[77];

  v3[76] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("0x0000000011000008");
  v2[1] = CFSTR("0x000000001A000006");
  v3[0] = CFSTR("AutoClimateControl");
  v3[1] = CFSTR("BatteryLevel");
  v2[2] = CFSTR("0x000000001A000011");
  v2[3] = CFSTR("0x0000000016000001");
  v3[2] = CFSTR("BatteryTemperature");
  v3[3] = CFSTR("BooleanSetting");
  v2[4] = CFSTR("0x0000000016000002");
  v2[5] = CFSTR("0x0000000011000001");
  v3[4] = CFSTR("ButtonSetting");
  v3[5] = CFSTR("Cabin");
  v2[6] = CFSTR("0x000000001F000002");
  v2[7] = CFSTR("0x000000001F000001");
  v3[6] = CFSTR("CameraButton");
  v3[7] = CFSTR("CameraGeneral");
  v2[8] = CFSTR("0x0000000019000003");
  v2[9] = CFSTR("0x0000000019000002");
  v3[8] = CFSTR("ChargingRate");
  v3[9] = CFSTR("ChargingStatus");
  v2[10] = CFSTR("0x0000000019000007");
  v2[11] = CFSTR("0x0000000011000010");
  v3[10] = CFSTR("ChargingTime");
  v3[11] = CFSTR("ClimateControlsLocked");
  v2[12] = CFSTR("0x000000001D000001");
  v2[13] = CFSTR("0x000000001C000001");
  v3[12] = CFSTR("ClosureState");
  v3[13] = CFSTR("CriticalInputStream");
  v2[14] = CFSTR("0x0000000016000006");
  v2[15] = CFSTR("0x0000000011000005");
  v3[14] = CFSTR("DeepLinkSetting");
  v3[15] = CFSTR("Defrost");
  v2[16] = CFSTR("0x000000001F000008");
  v2[17] = CFSTR("0x000000001A000009");
  v3[16] = CFSTR("DisplayUnits");
  v3[17] = CFSTR("DisplayedSpeed");
  v2[18] = CFSTR("0x000000001A000008");
  v2[19] = CFSTR("0x000000001A00000D");
  v3[18] = CFSTR("DriveMode");
  v3[19] = CFSTR("EnginePower");
  v2[20] = CFSTR("0x000000001A00000F");
  v2[21] = CFSTR("0x000000001A000010");
  v3[20] = CFSTR("EngineRPM");
  v3[21] = CFSTR("EngineTemperature");
  v2[22] = CFSTR("0x0000000013000003");
  v2[23] = CFSTR("0x0000000011000009");
  v3[22] = CFSTR("Equalizer");
  v3[23] = CFSTR("ExteriorConditions");
  v2[24] = CFSTR("0x0000000011000007");
  v2[25] = CFSTR("0x0000000016000003");
  v3[24] = CFSTR("Fan");
  v3[25] = CFSTR("FloatSetting");
  v2[26] = CFSTR("0x000000001A000014");
  v2[27] = CFSTR("0x000000001A000005");
  v3[26] = CFSTR("FuelConsumption");
  v3[27] = CFSTR("FuelLevel");
  v2[28] = CFSTR("0x000000001A000007");
  v2[29] = CFSTR("0x0000000021000001");
  v3[28] = CFSTR("GearRecommendation");
  v3[29] = CFSTR("HistoricalNotification");
  v2[30] = CFSTR("0x0000000016000007");
  v2[31] = CFSTR("0x0000000011000013");
  v3[30] = CFSTR("IntegerSetting");
  v3[31] = CFSTR("InteriorConditions");
  v2[32] = CFSTR("0x0000000017000002");
  v2[33] = CFSTR("0x0000000014000006");
  v3[32] = CFSTR("LocalNotification");
  v3[33] = CFSTR("MediaSource");
  v2[34] = CFSTR("0x0000000016000017");
  v2[35] = CFSTR("0x0000000016000005");
  v3[34] = CFSTR("MultipleSelectImageSetting");
  v3[35] = CFSTR("MultipleSelectSetting");
  v2[36] = CFSTR("0x0000000014000001");
  v2[37] = CFSTR("0x000000001A00000A");
  v3[36] = CFSTR("NowPlaying");
  v3[37] = CFSTR("Odometer");
  v2[38] = CFSTR("0x0000000016000019");
  v2[39] = CFSTR("0x0000000016000018");
  v3[38] = CFSTR("PairedDevicesAction");
  v3[39] = CFSTR("PairedDevicesInformation");
  v2[40] = CFSTR("0x0000000017000003");
  v2[41] = CFSTR("0x00000000FE000006");
  v3[40] = CFSTR("Picker");
  v3[41] = CFSTR("ProtocolPerfTest");
  v2[42] = CFSTR("0x0000000011000011");
  v2[43] = CFSTR("0x000000001A00000B");
  v3[42] = CFSTR("Recirculation");
  v3[43] = CFSTR("RemainingRange");
  v2[44] = CFSTR("0x0000000017000001");
  v2[45] = CFSTR("0x0000000017000004");
  v3[44] = CFSTR("RemoteNotification");
  v3[45] = CFSTR("RequestContent");
  v2[46] = CFSTR("0x0000000022000004");
  v2[47] = CFSTR("0x0000000022000002");
  v3[46] = CFSTR("SeatBelt");
  v3[47] = CFSTR("SeatFan");
  v2[48] = CFSTR("0x0000000022000001");
  v2[49] = CFSTR("0x0000000016000020");
  v3[48] = CFSTR("SeatHeatingCooling");
  v3[49] = CFSTR("SettingsSection");
  v2[50] = CFSTR("0x0000000016000016");
  v2[51] = CFSTR("0x0000000016000004");
  v3[50] = CFSTR("SingleSelectImageSetting");
  v3[51] = CFSTR("SingleSelectSetting");
  v2[52] = CFSTR("0x0000000013000005");
  v2[53] = CFSTR("0x0000000016000015");
  v3[52] = CFSTR("SoundDistribution");
  v3[53] = CFSTR("StaticSetting");
  v2[54] = CFSTR("0x0000000011000003");
  v2[55] = CFSTR("0x000000001E000004");
  v3[54] = CFSTR("SteeringWheelHeatingCooling");
  v3[55] = CFSTR("TargetSpeed");
  v2[56] = CFSTR("0x0000000011000002");
  v2[57] = CFSTR("0x00000000FE000009");
  v3[56] = CFSTR("Temperature");
  v3[57] = CFSTR("TestControlAsync");
  v2[58] = CFSTR("0x00000000FE00000A");
  v2[59] = CFSTR("0x00000000FE000008");
  v3[58] = CFSTR("TestControlEvent");
  v3[59] = CFSTR("TestControlSync");
  v2[60] = CFSTR("0x000000001B000001");
  v2[61] = CFSTR("0x000000001B000006");
  v3[60] = CFSTR("TirePressure");
  v3[61] = CFSTR("TirePressureMonitoringSystem");
  v2[62] = CFSTR("0x000000001A000003");
  v2[63] = CFSTR("0x0000000015000002");
  v3[62] = CFSTR("TransmissionStatus");
  v3[63] = CFSTR("Trip");
  v2[64] = CFSTR("0x00000000FE000001");
  v3[64] = CFSTR("TypeTest");
  v2[65] = CFSTR("0x00000000FE000004");
  v3[65] = CFSTR("TypeTestIndexByPosition");
  v2[66] = CFSTR("0x00000000FE000005");
  v3[66] = CFSTR("TypeTestIndexByUnit");
  v2[67] = CFSTR("0x00000000FE000003");
  v3[67] = CFSTR("TypeTestMulti");
  v2[68] = CFSTR("0x00000000FE000007");
  v3[68] = CFSTR("TypeTestWithStates");
  v2[69] = CFSTR("0x0000000011100002");
  v3[69] = CFSTR("UIInputDeviceButton");
  v2[70] = CFSTR("0x0000000011100001");
  v3[70] = CFSTR("UIState");
  v2[71] = CFSTR("0x000000001A000013");
  v3[71] = CFSTR("VehicleInformation");
  v2[72] = CFSTR("0x0000000020000001");
  v3[72] = CFSTR("VehicleVariant");
  v2[73] = CFSTR("0x0000000011000006");
  v3[73] = CFSTR("Vent");
  v2[74] = CFSTR("0x0000000013000002");
  v3[74] = CFSTR("Volume");
  v2[75] = CFSTR("0x0000000011000012");
  v3[75] = CFSTR("ZonesSynced");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 76);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serviceNameByType__serviceNameByType;
  serviceNameByType__serviceNameByType = v0;

}

+ (NSSet)stateCaptureValues
{
  if (stateCaptureValues_onceToken_1 != -1)
    dispatch_once(&stateCaptureValues_onceToken_1, &__block_literal_global_319);
  return (NSSet *)(id)stateCaptureValues__stateCaptureValues_1;
}

void __37__CAFServiceTypes_stateCaptureValues__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[68];

  v4[67] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = CFSTR("0x0000000011000008");
  v4[1] = CFSTR("0x000000001A000006");
  v4[2] = CFSTR("0x000000001A000011");
  v4[3] = CFSTR("0x0000000016000001");
  v4[4] = CFSTR("0x0000000016000002");
  v4[5] = CFSTR("0x0000000011000001");
  v4[6] = CFSTR("0x000000001F000002");
  v4[7] = CFSTR("0x000000001F000001");
  v4[8] = CFSTR("0x0000000019000003");
  v4[9] = CFSTR("0x0000000019000002");
  v4[10] = CFSTR("0x0000000019000007");
  v4[11] = CFSTR("0x0000000011000010");
  v4[12] = CFSTR("0x000000001D000001");
  v4[13] = CFSTR("0x000000001C000001");
  v4[14] = CFSTR("0x0000000016000006");
  v4[15] = CFSTR("0x0000000011000005");
  v4[16] = CFSTR("0x000000001F000008");
  v4[17] = CFSTR("0x000000001A000009");
  v4[18] = CFSTR("0x000000001A000008");
  v4[19] = CFSTR("0x000000001A00000D");
  v4[20] = CFSTR("0x000000001A00000F");
  v4[21] = CFSTR("0x000000001A000010");
  v4[22] = CFSTR("0x0000000013000003");
  v4[23] = CFSTR("0x0000000011000009");
  v4[24] = CFSTR("0x0000000011000007");
  v4[25] = CFSTR("0x0000000016000003");
  v4[26] = CFSTR("0x000000001A000014");
  v4[27] = CFSTR("0x000000001A000005");
  v4[28] = CFSTR("0x000000001A000007");
  v4[29] = CFSTR("0x0000000021000001");
  v4[30] = CFSTR("0x0000000016000007");
  v4[31] = CFSTR("0x0000000011000013");
  v4[32] = CFSTR("0x0000000017000002");
  v4[33] = CFSTR("0x0000000014000006");
  v4[34] = CFSTR("0x0000000016000017");
  v4[35] = CFSTR("0x0000000016000005");
  v4[36] = CFSTR("0x0000000014000001");
  v4[37] = CFSTR("0x000000001A00000A");
  v4[38] = CFSTR("0x0000000016000019");
  v4[39] = CFSTR("0x0000000016000018");
  v4[40] = CFSTR("0x0000000017000003");
  v4[41] = CFSTR("0x0000000011000011");
  v4[42] = CFSTR("0x000000001A00000B");
  v4[43] = CFSTR("0x0000000017000001");
  v4[44] = CFSTR("0x0000000017000004");
  v4[45] = CFSTR("0x0000000022000004");
  v4[46] = CFSTR("0x0000000022000002");
  v4[47] = CFSTR("0x0000000022000001");
  v4[48] = CFSTR("0x0000000016000020");
  v4[49] = CFSTR("0x0000000016000016");
  v4[50] = CFSTR("0x0000000016000004");
  v4[51] = CFSTR("0x0000000013000005");
  v4[52] = CFSTR("0x0000000016000015");
  v4[53] = CFSTR("0x0000000011000003");
  v4[54] = CFSTR("0x000000001E000004");
  v4[55] = CFSTR("0x0000000011000002");
  v4[56] = CFSTR("0x000000001B000001");
  v4[57] = CFSTR("0x000000001B000006");
  v4[58] = CFSTR("0x000000001A000003");
  v4[59] = CFSTR("0x0000000015000002");
  v4[60] = CFSTR("0x0000000011100002");
  v4[61] = CFSTR("0x0000000011100001");
  v4[62] = CFSTR("0x000000001A000013");
  v4[63] = CFSTR("0x0000000020000001");
  v4[64] = CFSTR("0x0000000011000006");
  v4[65] = CFSTR("0x0000000013000002");
  v4[66] = CFSTR("0x0000000011000012");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 67);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)stateCaptureValues__stateCaptureValues_1;
  stateCaptureValues__stateCaptureValues_1 = v2;

}

+ (id)serviceNameForType:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "serviceNameByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = v4;

  return v6;
}

+ (id)serviceNameFor:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "serviceTypeFor:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serviceNameForType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)serviceTypeFor:(id)a3
{
  return (id)objc_msgSend(a3, "serviceType");
}

@end
