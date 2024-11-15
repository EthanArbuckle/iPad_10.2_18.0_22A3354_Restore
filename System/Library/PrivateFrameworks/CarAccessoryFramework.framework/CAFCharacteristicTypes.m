@implementation CAFCharacteristicTypes

+ (NSDictionary)characteristicTypeByName
{
  if (characteristicTypeByName_onceToken != -1)
    dispatch_once(&characteristicTypeByName_onceToken, &__block_literal_global_1);
  return (NSDictionary *)(id)characteristicTypeByName__characteristicTypeByName;
}

void __50__CAFCharacteristicTypes_characteristicTypeByName__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[199];
  _QWORD v3[200];

  v3[199] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("ACCompressorOn");
  v2[1] = CFSTR("AQI");
  v3[0] = CFSTR("0x0000000031000003");
  v3[1] = CFSTR("0x0000000031000010");
  v2[2] = CFSTR("Album");
  v2[3] = CFSTR("Artist");
  v3[2] = CFSTR("0x0000000032000005");
  v3[3] = CFSTR("0x0000000032000004");
  v2[4] = CFSTR("Artwork");
  v2[5] = CFSTR("AudioLogo");
  v3[4] = CFSTR("0x0000000032000020");
  v3[5] = CFSTR("0x0000000048000006");
  v2[6] = CFSTR("AutoMode");
  v2[7] = CFSTR("AutoModeIntensity");
  v3[6] = CFSTR("0x000000003000005F");
  v3[7] = CFSTR("0x0000000031000028");
  v2[8] = CFSTR("AutoModeLevel");
  v2[9] = CFSTR("AverageSpeed");
  v3[8] = CFSTR("0x0000000031000024");
  v3[9] = CFSTR("0x0000000030000045");
  v2[10] = CFSTR("Balance");
  v2[11] = CFSTR("BatteryLevel");
  v3[10] = CFSTR("0x0000000033000002");
  v3[11] = CFSTR("0x0000000030000031");
  v2[12] = CFSTR("BatteryLevelMarkerCriticalLow");
  v2[13] = CFSTR("BatteryLevelMarkerLow");
  v3[12] = CFSTR("0x000000003000004D");
  v3[13] = CFSTR("0x000000003000004C");
  v2[14] = CFSTR("BatteryLevelState");
  v2[15] = CFSTR("BatteryTargetChargeLevel");
  v3[14] = CFSTR("0x0000000030000035");
  v3[15] = CFSTR("0x0000000040000001");
  v2[16] = CFSTR("BuckleState");
  v2[17] = CFSTR("ButtonAction");
  v3[16] = CFSTR("0x0000000060000002");
  v3[17] = CFSTR("0x0000000036000010");
  v2[18] = CFSTR("CableState");
  v2[19] = CFSTR("ChargingSpeed");
  v3[18] = CFSTR("0x0000000040000007");
  v3[19] = CFSTR("0x000000004000000A");
  v2[20] = CFSTR("ChargingState");
  v2[21] = CFSTR("ChildrenIdentifiers");
  v3[20] = CFSTR("0x0000000040000005");
  v3[21] = CFSTR("0x0000000050000001");
  v2[22] = CFSTR("ChildrenSettingsIdentifiers");
  v2[23] = CFSTR("ContentURL");
  v3[22] = CFSTR("0x0000000036000012");
  v3[23] = CFSTR("0x0000000030000007");
  v2[24] = CFSTR("ContentURLAction");
  v2[25] = CFSTR("CurrentFrequency");
  v3[24] = CFSTR("0x0000000036000066");
  v3[25] = CFSTR("0x0000000032000007");
  v2[26] = CFSTR("CurrentIndex");
  v2[27] = CFSTR("CurrentMediaItemIdentifier");
  v3[26] = CFSTR("0x0000000030000038");
  v3[27] = CFSTR("0x0000000032000026");
  v2[28] = CFSTR("CurrentMediaSourceIdentifier");
  v2[29] = CFSTR("CurrentTemperature");
  v3[28] = CFSTR("0x0000000032000023");
  v3[29] = CFSTR("0x0000000031000019");
  v2[30] = CFSTR("CurrentUserVisibleValue");
  v2[31] = CFSTR("DefrostTypes");
  v3[30] = CFSTR("0x0000000036000008");
  v3[31] = CFSTR("0x0000000031000014");
  v2[32] = CFSTR("DeviceAction");
  v2[33] = CFSTR("Disabled");
  v3[32] = CFSTR("0x0000000036000018");
  v3[33] = CFSTR("0x0000000032000011");
  v2[34] = CFSTR("DisplayPanelIdentifier");
  v2[35] = CFSTR("DisplayZoneIdentifier");
  v3[34] = CFSTR("0x0000000037000007");
  v3[35] = CFSTR("0x000000003700000B");
  v2[36] = CFSTR("Distance");
  v2[37] = CFSTR("DistanceKM");
  v3[36] = CFSTR("0x0000000030000022");
  v3[37] = CFSTR("0x000000003000004A");
  v2[38] = CFSTR("DistanceMiles");
  v2[39] = CFSTR("DistanceUnit");
  v3[38] = CFSTR("0x000000003000004B");
  v3[39] = CFSTR("0x0000000046000004");
  v2[40] = CFSTR("Duration");
  v2[41] = CFSTR("Energy");
  v3[40] = CFSTR("0x0000000030000023");
  v3[41] = CFSTR("0x0000000030000025");
  v2[42] = CFSTR("EnergyEfficiency");
  v2[43] = CFSTR("EntryList");
  v3[42] = CFSTR("0x0000000035000012");
  v3[43] = CFSTR("0x000000003000005D");
  v2[44] = CFSTR("EqualizerType");
  v2[45] = CFSTR("EqualizerValue");
  v3[44] = CFSTR("0x0000000033000007");
  v3[45] = CFSTR("0x0000000033000008");
  v2[46] = CFSTR("ExteriorStyle");
  v2[47] = CFSTR("Fade");
  v3[46] = CFSTR("0x0000000048000003");
  v3[47] = CFSTR("0x0000000033000003");
  v2[48] = CFSTR("FanLevel");
  v2[49] = CFSTR("FillLevelLabel");
  v3[48] = CFSTR("0x0000000031000012");
  v3[49] = CFSTR("0x0000000046000007");
  v2[50] = CFSTR("FloatValue");
  v2[51] = CFSTR("FuelEfficiency");
  v3[50] = CFSTR("0x0000000030000006");
  v3[51] = CFSTR("0x0000000035000013");
  v2[52] = CFSTR("FuelLevel");
  v2[53] = CFSTR("FuelLevelMarkerLow");
  v3[52] = CFSTR("0x0000000041000002");
  v3[53] = CFSTR("0x000000004100001A");
  v2[54] = CFSTR("FuelLevelState");
  v2[55] = CFSTR("GearPosition");
  v3[54] = CFSTR("0x0000000041000017");
  v3[55] = CFSTR("0x0000000041000012");
  v2[56] = CFSTR("GearShiftRecommendation");
  v2[57] = CFSTR("HVACOn");
  v3[56] = CFSTR("0x0000000041000016");
  v3[57] = CFSTR("0x0000000031000002");
  v2[58] = CFSTR("HeatingCoolingLevel");
  v2[59] = CFSTR("Hidden");
  v3[58] = CFSTR("0x0000000031000021");
  v3[59] = CFSTR("0x0000000036000023");
  v2[60] = CFSTR("HistoricalNotificationUserActions");
  v2[61] = CFSTR("Identifier");
  v3[60] = CFSTR("0x0000000049000005");
  v3[61] = CFSTR("0x0000000030000019");
  v2[62] = CFSTR("Identifiers");
  v2[63] = CFSTR("ImageColor");
  v3[62] = CFSTR("0x0000000030000037");
  v3[63] = CFSTR("0x0000000037000009");
  v2[64] = CFSTR("ImageList");
  v3[64] = CFSTR("0x0000000030000018");
  v2[65] = CFSTR("IndicesUserVisibleValue");
  v3[65] = CFSTR("0x0000000036000009");
  v2[66] = CFSTR("InputStreamUID");
  v3[66] = CFSTR("0x0000000044000000");
  v2[67] = CFSTR("Int32Value");
  v3[67] = CFSTR("0x0000000030000010");
  v2[68] = CFSTR("InteriorStyle");
  v3[68] = CFSTR("0x0000000048000004");
  v2[69] = CFSTR("JumpBackwardInterval");
  v3[69] = CFSTR("0x0000000032000032");
  v2[70] = CFSTR("JumpForwardInterval");
  v3[70] = CFSTR("0x0000000032000033");
  v2[71] = CFSTR("LatchState");
  v3[71] = CFSTR("0x000000004200000B");
  v2[72] = CFSTR("Level");
  v3[72] = CFSTR("0x0000000030000004");
  v2[73] = CFSTR("LimitableUIElement");
  v3[73] = CFSTR("0x0000000036000021");
  v2[74] = CFSTR("ListUserVisibleValue");
  v3[74] = CFSTR("0x0000000036000007");
  v2[75] = CFSTR("LockState");
  v3[75] = CFSTR("0x0000000042000009");
  v2[76] = CFSTR("MaxACOn");
  v3[76] = CFSTR("0x0000000031000022");
  v2[77] = CFSTR("MaximumSymbolName");
  v3[77] = CFSTR("0x0000000036000026");
  v2[78] = CFSTR("MediaCategory");
  v3[78] = CFSTR("0x0000000032000030");
  v2[79] = CFSTR("MediaItemImages");
  v3[79] = CFSTR("0x0000000032000031");
  v2[80] = CFSTR("MediaItems");
  v3[80] = CFSTR("0x0000000032000012");
  v2[81] = CFSTR("MediaSourceSemanticType");
  v3[81] = CFSTR("0x0000000032000025");
  v2[82] = CFSTR("MinimumSymbolName");
  v3[82] = CFSTR("0x0000000036000025");
  v2[83] = CFSTR("NotificationSeverity");
  v3[83] = CFSTR("0x0000000049000002");
  v2[84] = CFSTR("NotificationUserActions");
  v3[84] = CFSTR("0x0000000037000002");
  v2[85] = CFSTR("On");
  v3[85] = CFSTR("0x0000000030000002");
  v2[86] = CFSTR("PairedDeviceActionRequest");
  v3[86] = CFSTR("0x0000000036000022");
  v2[87] = CFSTR("PairedDeviceList");
  v3[87] = CFSTR("0x0000000036000013");
  v2[88] = CFSTR("PairedDeviceState");
  v3[88] = CFSTR("0x0000000036000015");
  v2[89] = CFSTR("PlaybackState");
  v3[89] = CFSTR("0x0000000032000034");
  v2[90] = CFSTR("PortSideIndicator");
  v3[90] = CFSTR("0x0000000041000013");
  v2[91] = CFSTR("Power");
  v3[91] = CFSTR("0x0000000030000028");
  v2[92] = CFSTR("PowerMarkerAvailableMax");
  v3[92] = CFSTR("0x0000000030000053");
  v2[93] = CFSTR("PowerMarkerAvailableMin");
  v3[93] = CFSTR("0x0000000030000052");
  v2[94] = CFSTR("PowerMax");
  v3[94] = CFSTR("0x0000000030000051");
  v2[95] = CFSTR("PowerMin");
  v3[95] = CFSTR("0x0000000030000050");
  v2[96] = CFSTR("Pressure");
  v3[96] = CFSTR("0x000000003000001B");
  v2[97] = CFSTR("PressureState");
  v3[97] = CFSTR("0x000000003000001C");
  v2[98] = CFSTR("ProminenceInfo");
  v3[98] = CFSTR("0x0000000036000020");
  v2[99] = CFSTR("RemainingTime");
  v3[99] = CFSTR("0x0000000030000030");
  v2[100] = CFSTR("RotationalSpeed");
  v3[100] = CFSTR("0x0000000030000024");
  v2[101] = CFSTR("RotationalSpeedMarkerRedline");
  v3[101] = CFSTR("0x000000003000004F");
  v2[102] = CFSTR("RotationalSpeedMax");
  v3[102] = CFSTR("0x000000003000004E");
  v2[103] = CFSTR("RotationalSpeedState");
  v3[103] = CFSTR("0x0000000030000060");
  v2[104] = CFSTR("SeatBeltIndicator");
  v3[104] = CFSTR("0x0000000060000007");
  v2[105] = CFSTR("SeatOccupancy");
  v3[105] = CFSTR("0x0000000060000006");
  v2[106] = CFSTR("SectionIdentifier");
  v3[106] = CFSTR("0x0000000036000028");
  v2[107] = CFSTR("SelectSettingEntryList");
  v3[107] = CFSTR("0x0000000036000024");
  v2[108] = CFSTR("Selected");
  v3[108] = CFSTR("0x0000000036000064");
  v2[109] = CFSTR("SelectedEntryIndex");
  v3[109] = CFSTR("0x0000000030000061");
  v2[110] = CFSTR("SelectedEntryIndices");
  v3[110] = CFSTR("0x0000000036000062");
  v2[111] = CFSTR("SensorState");
  v3[111] = CFSTR("0x000000003000001A");
  v2[112] = CFSTR("SettingProminenceLevel");
  v3[112] = CFSTR("0x0000000036000019");
  v2[113] = CFSTR("SettingsCategory");
  v3[113] = CFSTR("0x0000000036000006");
  v2[114] = CFSTR("ShowAudioBrandLogo");
  v3[114] = CFSTR("0x0000000036000011");
  v2[115] = CFSTR("ShowOdometer");
  v3[115] = CFSTR("0x0000000035000016");
  v2[116] = CFSTR("ShowSecondarySpeed");
  v3[116] = CFSTR("0x0000000046000002");
  v2[117] = CFSTR("SortOrder");
  v3[117] = CFSTR("0x0000000030000003");
  v2[118] = CFSTR("Speed");
  v3[118] = CFSTR("0x0000000030000021");
  v2[119] = CFSTR("SpeedKMH");
  v3[119] = CFSTR("0x0000000030000046");
  v2[120] = CFSTR("SpeedLimited");
  v3[120] = CFSTR("0x000000004500001C");
  v2[121] = CFSTR("SpeedMPH");
  v3[121] = CFSTR("0x0000000030000047");
  v2[122] = CFSTR("SpeedMaxKMH");
  v3[122] = CFSTR("0x0000000030000048");
  v2[123] = CFSTR("SpeedMaxMPH");
  v3[123] = CFSTR("0x0000000030000049");
  v2[124] = CFSTR("SpeedUnit");
  v3[124] = CFSTR("0x0000000046000001");
  v2[125] = CFSTR("StepperBarHidden");
  v3[125] = CFSTR("0x0000000036000027");
  v2[126] = CFSTR("SymbolName");
  v3[126] = CFSTR("0x000000003000005E");
  v2[127] = CFSTR("SymbolNameAndColor");
  v3[127] = CFSTR("0x0000000037000008");
  v2[128] = CFSTR("TargetSpeedState");
  v3[128] = CFSTR("0x0000000045000005");
  v2[129] = CFSTR("TargetTemperature");
  v3[129] = CFSTR("0x0000000031000017");
  v2[130] = CFSTR("Temperature");
  v3[130] = CFSTR("0x000000003000001D");
  v2[131] = CFSTR("TemperatureMarkerCold");
  v3[131] = CFSTR("0x0000000030000056");
  v2[132] = CFSTR("TemperatureMarkerHot");
  v3[132] = CFSTR("0x0000000030000057");
  v2[133] = CFSTR("TemperatureMax");
  v3[133] = CFSTR("0x0000000030000055");
  v2[134] = CFSTR("TemperatureMin");
  v3[134] = CFSTR("0x0000000030000054");
  v2[135] = CFSTR("TemperatureState");
  v3[135] = CFSTR("0x000000003000001E");
  v2[136] = CFSTR("TemperatureUnit");
  v3[136] = CFSTR("0x0000000046000005");
  v2[137] = CFSTR("TestArrayBool");
  v3[137] = CFSTR("0x00000000FF000011");
  v2[138] = CFSTR("TestArrayData");
  v3[138] = CFSTR("0x00000000FF00001C");
  v2[139] = CFSTR("TestArrayFloat");
  v3[139] = CFSTR("0x00000000FF00001A");
  v2[140] = CFSTR("TestArrayInt16");
  v3[140] = CFSTR("0x00000000FF000017");
  v2[141] = CFSTR("TestArrayInt32");
  v3[141] = CFSTR("0x00000000FF000018");
  v2[142] = CFSTR("TestArrayInt64");
  v3[142] = CFSTR("0x00000000FF000019");
  v2[143] = CFSTR("TestArrayInt8");
  v3[143] = CFSTR("0x00000000FF000016");
  v2[144] = CFSTR("TestArrayRawData");
  v3[144] = CFSTR("0x00000000FF00001D");
  v2[145] = CFSTR("TestArrayString");
  v3[145] = CFSTR("0x00000000FF00001B");
  v2[146] = CFSTR("TestArrayUInt16");
  v3[146] = CFSTR("0x00000000FF000013");
  v2[147] = CFSTR("TestArrayUInt32");
  v3[147] = CFSTR("0x00000000FF000014");
  v2[148] = CFSTR("TestArrayUInt64");
  v3[148] = CFSTR("0x00000000FF000015");
  v2[149] = CFSTR("TestArrayUInt8");
  v3[149] = CFSTR("0x00000000FF000012");
  v2[150] = CFSTR("TestBool");
  v3[150] = CFSTR("0x00000000FF000001");
  v2[151] = CFSTR("TestComplexArrayItemValue");
  v3[151] = CFSTR("0x00000000FF000024");
  v2[152] = CFSTR("TestComplexItem");
  v3[152] = CFSTR("0x00000000FF000010");
  v2[153] = CFSTR("TestComplexItemList");
  v3[153] = CFSTR("0x00000000FF000022");
  v2[154] = CFSTR("TestComplexItemValue");
  v3[154] = CFSTR("0x00000000FF000021");
  v2[155] = CFSTR("TestComplexItems");
  v3[155] = CFSTR("0x00000000FF000020");
  v2[156] = CFSTR("TestComplexNestedItemList");
  v3[156] = CFSTR("0x00000000FF000026");
  v2[157] = CFSTR("TestComplexNestedItemValue");
  v3[157] = CFSTR("0x00000000FF000025");
  v2[158] = CFSTR("TestComplexNestedListItemValue");
  v3[158] = CFSTR("0x00000000FF000027");
  v2[159] = CFSTR("TestData");
  v3[159] = CFSTR("0x00000000FF00000C");
  v2[160] = CFSTR("TestDimensionUnit");
  v3[160] = CFSTR("0x00000000FF00000F");
  v2[161] = CFSTR("TestEnum");
  v3[161] = CFSTR("0x00000000FF00000E");
  v2[162] = CFSTR("TestFloat");
  v3[162] = CFSTR("0x00000000FF00000A");
  v2[163] = CFSTR("TestInt16");
  v3[163] = CFSTR("0x00000000FF000007");
  v2[164] = CFSTR("TestInt32");
  v3[164] = CFSTR("0x00000000FF000008");
  v2[165] = CFSTR("TestInt64");
  v3[165] = CFSTR("0x00000000FF000009");
  v2[166] = CFSTR("TestInt8");
  v3[166] = CFSTR("0x00000000FF000006");
  v2[167] = CFSTR("TestRawData");
  v3[167] = CFSTR("0x00000000FF00000D");
  v2[168] = CFSTR("TestString");
  v3[168] = CFSTR("0x00000000FF00000B");
  v2[169] = CFSTR("TestString2");
  v3[169] = CFSTR("0x00000000FF000023");
  v2[170] = CFSTR("TestUInt16");
  v3[170] = CFSTR("0x00000000FF000003");
  v2[171] = CFSTR("TestUInt32");
  v3[171] = CFSTR("0x00000000FF000004");
  v2[172] = CFSTR("TestUInt64");
  v3[172] = CFSTR("0x00000000FF000005");
  v2[173] = CFSTR("TestUInt8");
  v3[173] = CFSTR("0x00000000FF000002");
  v2[174] = CFSTR("Timestamp");
  v3[174] = CFSTR("0x0000000049000003");
  v2[175] = CFSTR("Title");
  v3[175] = CFSTR("0x0000000032000003");
  v2[176] = CFSTR("TransmissionMode");
  v3[176] = CFSTR("0x0000000041000011");
  v2[177] = CFSTR("TripReset");
  v3[177] = CFSTR("0x0000000035000015");
  v2[178] = CFSTR("UIInputDeviceButtonEvent");
  v3[178] = CFSTR("0x0000000047000003");
  v2[179] = CFSTR("UIInputDevicePurpose");
  v3[179] = CFSTR("0x0000000047000002");
  v2[180] = CFSTR("UISceneOptions");
  v3[180] = CFSTR("0x0000000047000004");
  v2[181] = CFSTR("UISceneState");
  v3[181] = CFSTR("0x0000000047000001");
  v2[182] = CFSTR("UserAction");
  v3[182] = CFSTR("0x0000000037000003");
  v2[183] = CFSTR("UserDismissible");
  v3[183] = CFSTR("0x0000000036000063");
  v2[184] = CFSTR("UserSelectionEnabled");
  v3[184] = CFSTR("0x000000003700000A");
  v2[185] = CFSTR("UserVisibleDescription");
  v3[185] = CFSTR("0x0000000030000005");
  v2[186] = CFSTR("UserVisibleFooter");
  v3[186] = CFSTR("0x0000000030000016");
  v2[187] = CFSTR("UserVisibleFullDescription");
  v3[187] = CFSTR("0x0000000049000004");
  v2[188] = CFSTR("UserVisibleLabel");
  v3[188] = CFSTR("0x0000000030000001");
  v2[189] = CFSTR("UserVisibleSectionName");
  v3[189] = CFSTR("0x0000000036000004");
  v2[190] = CFSTR("UserVisibleValue");
  v3[190] = CFSTR("0x0000000030000017");
  v2[191] = CFSTR("VehicleLayout");
  v3[191] = CFSTR("0x0000000048000005");
  v2[192] = CFSTR("VehicleLayoutKey");
  v3[192] = CFSTR("0x0000000036000065");
  v2[193] = CFSTR("VehicleLogo");
  v3[193] = CFSTR("0x0000000048000007");
  v2[194] = CFSTR("VehicleUserVisibleLabel");
  v3[194] = CFSTR("0x0000000041000020");
  v2[195] = CFSTR("VentCombinations");
  v3[195] = CFSTR("0x0000000031000025");
  v2[196] = CFSTR("VentTypes");
  v3[196] = CFSTR("0x0000000031000015");
  v2[197] = CFSTR("Volume");
  v3[197] = CFSTR("0x0000000033000006");
  v2[198] = CFSTR("VolumeType");
  v3[198] = CFSTR("0x0000000033000005");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 199);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)characteristicTypeByName__characteristicTypeByName;
  characteristicTypeByName__characteristicTypeByName = v0;

}

+ (NSDictionary)characteristicNameByType
{
  if (characteristicNameByType_onceToken != -1)
    dispatch_once(&characteristicNameByType_onceToken, &__block_literal_global_810);
  return (NSDictionary *)(id)characteristicNameByType__characteristicNameByType;
}

void __50__CAFCharacteristicTypes_characteristicNameByType__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[199];
  _QWORD v3[200];

  v3[199] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("0x0000000031000003");
  v2[1] = CFSTR("0x0000000031000010");
  v3[0] = CFSTR("ACCompressorOn");
  v3[1] = CFSTR("AQI");
  v2[2] = CFSTR("0x0000000032000005");
  v2[3] = CFSTR("0x0000000032000004");
  v3[2] = CFSTR("Album");
  v3[3] = CFSTR("Artist");
  v2[4] = CFSTR("0x0000000032000020");
  v2[5] = CFSTR("0x0000000048000006");
  v3[4] = CFSTR("Artwork");
  v3[5] = CFSTR("AudioLogo");
  v2[6] = CFSTR("0x000000003000005F");
  v2[7] = CFSTR("0x0000000031000028");
  v3[6] = CFSTR("AutoMode");
  v3[7] = CFSTR("AutoModeIntensity");
  v2[8] = CFSTR("0x0000000031000024");
  v2[9] = CFSTR("0x0000000030000045");
  v3[8] = CFSTR("AutoModeLevel");
  v3[9] = CFSTR("AverageSpeed");
  v2[10] = CFSTR("0x0000000033000002");
  v2[11] = CFSTR("0x0000000030000031");
  v3[10] = CFSTR("Balance");
  v3[11] = CFSTR("BatteryLevel");
  v2[12] = CFSTR("0x000000003000004D");
  v2[13] = CFSTR("0x000000003000004C");
  v3[12] = CFSTR("BatteryLevelMarkerCriticalLow");
  v3[13] = CFSTR("BatteryLevelMarkerLow");
  v2[14] = CFSTR("0x0000000030000035");
  v2[15] = CFSTR("0x0000000040000001");
  v3[14] = CFSTR("BatteryLevelState");
  v3[15] = CFSTR("BatteryTargetChargeLevel");
  v2[16] = CFSTR("0x0000000060000002");
  v2[17] = CFSTR("0x0000000036000010");
  v3[16] = CFSTR("BuckleState");
  v3[17] = CFSTR("ButtonAction");
  v2[18] = CFSTR("0x0000000040000007");
  v2[19] = CFSTR("0x000000004000000A");
  v3[18] = CFSTR("CableState");
  v3[19] = CFSTR("ChargingSpeed");
  v2[20] = CFSTR("0x0000000040000005");
  v2[21] = CFSTR("0x0000000050000001");
  v3[20] = CFSTR("ChargingState");
  v3[21] = CFSTR("ChildrenIdentifiers");
  v2[22] = CFSTR("0x0000000036000012");
  v2[23] = CFSTR("0x0000000030000007");
  v3[22] = CFSTR("ChildrenSettingsIdentifiers");
  v3[23] = CFSTR("ContentURL");
  v2[24] = CFSTR("0x0000000036000066");
  v2[25] = CFSTR("0x0000000032000007");
  v3[24] = CFSTR("ContentURLAction");
  v3[25] = CFSTR("CurrentFrequency");
  v2[26] = CFSTR("0x0000000030000038");
  v2[27] = CFSTR("0x0000000032000026");
  v3[26] = CFSTR("CurrentIndex");
  v3[27] = CFSTR("CurrentMediaItemIdentifier");
  v2[28] = CFSTR("0x0000000032000023");
  v2[29] = CFSTR("0x0000000031000019");
  v3[28] = CFSTR("CurrentMediaSourceIdentifier");
  v3[29] = CFSTR("CurrentTemperature");
  v2[30] = CFSTR("0x0000000036000008");
  v2[31] = CFSTR("0x0000000031000014");
  v3[30] = CFSTR("CurrentUserVisibleValue");
  v3[31] = CFSTR("DefrostTypes");
  v2[32] = CFSTR("0x0000000036000018");
  v2[33] = CFSTR("0x0000000032000011");
  v3[32] = CFSTR("DeviceAction");
  v3[33] = CFSTR("Disabled");
  v2[34] = CFSTR("0x0000000037000007");
  v2[35] = CFSTR("0x000000003700000B");
  v3[34] = CFSTR("DisplayPanelIdentifier");
  v3[35] = CFSTR("DisplayZoneIdentifier");
  v2[36] = CFSTR("0x0000000030000022");
  v2[37] = CFSTR("0x000000003000004A");
  v3[36] = CFSTR("Distance");
  v3[37] = CFSTR("DistanceKM");
  v2[38] = CFSTR("0x000000003000004B");
  v2[39] = CFSTR("0x0000000046000004");
  v3[38] = CFSTR("DistanceMiles");
  v3[39] = CFSTR("DistanceUnit");
  v2[40] = CFSTR("0x0000000030000023");
  v2[41] = CFSTR("0x0000000030000025");
  v3[40] = CFSTR("Duration");
  v3[41] = CFSTR("Energy");
  v2[42] = CFSTR("0x0000000035000012");
  v2[43] = CFSTR("0x000000003000005D");
  v3[42] = CFSTR("EnergyEfficiency");
  v3[43] = CFSTR("EntryList");
  v2[44] = CFSTR("0x0000000033000007");
  v2[45] = CFSTR("0x0000000033000008");
  v3[44] = CFSTR("EqualizerType");
  v3[45] = CFSTR("EqualizerValue");
  v2[46] = CFSTR("0x0000000048000003");
  v2[47] = CFSTR("0x0000000033000003");
  v3[46] = CFSTR("ExteriorStyle");
  v3[47] = CFSTR("Fade");
  v2[48] = CFSTR("0x0000000031000012");
  v2[49] = CFSTR("0x0000000046000007");
  v3[48] = CFSTR("FanLevel");
  v3[49] = CFSTR("FillLevelLabel");
  v2[50] = CFSTR("0x0000000030000006");
  v2[51] = CFSTR("0x0000000035000013");
  v3[50] = CFSTR("FloatValue");
  v3[51] = CFSTR("FuelEfficiency");
  v2[52] = CFSTR("0x0000000041000002");
  v2[53] = CFSTR("0x000000004100001A");
  v3[52] = CFSTR("FuelLevel");
  v3[53] = CFSTR("FuelLevelMarkerLow");
  v2[54] = CFSTR("0x0000000041000017");
  v2[55] = CFSTR("0x0000000041000012");
  v3[54] = CFSTR("FuelLevelState");
  v3[55] = CFSTR("GearPosition");
  v2[56] = CFSTR("0x0000000041000016");
  v2[57] = CFSTR("0x0000000031000002");
  v3[56] = CFSTR("GearShiftRecommendation");
  v3[57] = CFSTR("HVACOn");
  v2[58] = CFSTR("0x0000000031000021");
  v2[59] = CFSTR("0x0000000036000023");
  v3[58] = CFSTR("HeatingCoolingLevel");
  v3[59] = CFSTR("Hidden");
  v2[60] = CFSTR("0x0000000049000005");
  v2[61] = CFSTR("0x0000000030000019");
  v3[60] = CFSTR("HistoricalNotificationUserActions");
  v3[61] = CFSTR("Identifier");
  v2[62] = CFSTR("0x0000000030000037");
  v2[63] = CFSTR("0x0000000037000009");
  v3[62] = CFSTR("Identifiers");
  v3[63] = CFSTR("ImageColor");
  v2[64] = CFSTR("0x0000000030000018");
  v3[64] = CFSTR("ImageList");
  v2[65] = CFSTR("0x0000000036000009");
  v3[65] = CFSTR("IndicesUserVisibleValue");
  v2[66] = CFSTR("0x0000000044000000");
  v3[66] = CFSTR("InputStreamUID");
  v2[67] = CFSTR("0x0000000030000010");
  v3[67] = CFSTR("Int32Value");
  v2[68] = CFSTR("0x0000000048000004");
  v3[68] = CFSTR("InteriorStyle");
  v2[69] = CFSTR("0x0000000032000032");
  v3[69] = CFSTR("JumpBackwardInterval");
  v2[70] = CFSTR("0x0000000032000033");
  v3[70] = CFSTR("JumpForwardInterval");
  v2[71] = CFSTR("0x000000004200000B");
  v3[71] = CFSTR("LatchState");
  v2[72] = CFSTR("0x0000000030000004");
  v3[72] = CFSTR("Level");
  v2[73] = CFSTR("0x0000000036000021");
  v3[73] = CFSTR("LimitableUIElement");
  v2[74] = CFSTR("0x0000000036000007");
  v3[74] = CFSTR("ListUserVisibleValue");
  v2[75] = CFSTR("0x0000000042000009");
  v3[75] = CFSTR("LockState");
  v2[76] = CFSTR("0x0000000031000022");
  v3[76] = CFSTR("MaxACOn");
  v2[77] = CFSTR("0x0000000036000026");
  v3[77] = CFSTR("MaximumSymbolName");
  v2[78] = CFSTR("0x0000000032000030");
  v3[78] = CFSTR("MediaCategory");
  v2[79] = CFSTR("0x0000000032000031");
  v3[79] = CFSTR("MediaItemImages");
  v2[80] = CFSTR("0x0000000032000012");
  v3[80] = CFSTR("MediaItems");
  v2[81] = CFSTR("0x0000000032000025");
  v3[81] = CFSTR("MediaSourceSemanticType");
  v2[82] = CFSTR("0x0000000036000025");
  v3[82] = CFSTR("MinimumSymbolName");
  v2[83] = CFSTR("0x0000000049000002");
  v3[83] = CFSTR("NotificationSeverity");
  v2[84] = CFSTR("0x0000000037000002");
  v3[84] = CFSTR("NotificationUserActions");
  v2[85] = CFSTR("0x0000000030000002");
  v3[85] = CFSTR("On");
  v2[86] = CFSTR("0x0000000036000022");
  v3[86] = CFSTR("PairedDeviceActionRequest");
  v2[87] = CFSTR("0x0000000036000013");
  v3[87] = CFSTR("PairedDeviceList");
  v2[88] = CFSTR("0x0000000036000015");
  v3[88] = CFSTR("PairedDeviceState");
  v2[89] = CFSTR("0x0000000032000034");
  v3[89] = CFSTR("PlaybackState");
  v2[90] = CFSTR("0x0000000041000013");
  v3[90] = CFSTR("PortSideIndicator");
  v2[91] = CFSTR("0x0000000030000028");
  v3[91] = CFSTR("Power");
  v2[92] = CFSTR("0x0000000030000053");
  v3[92] = CFSTR("PowerMarkerAvailableMax");
  v2[93] = CFSTR("0x0000000030000052");
  v3[93] = CFSTR("PowerMarkerAvailableMin");
  v2[94] = CFSTR("0x0000000030000051");
  v3[94] = CFSTR("PowerMax");
  v2[95] = CFSTR("0x0000000030000050");
  v3[95] = CFSTR("PowerMin");
  v2[96] = CFSTR("0x000000003000001B");
  v3[96] = CFSTR("Pressure");
  v2[97] = CFSTR("0x000000003000001C");
  v3[97] = CFSTR("PressureState");
  v2[98] = CFSTR("0x0000000036000020");
  v3[98] = CFSTR("ProminenceInfo");
  v2[99] = CFSTR("0x0000000030000030");
  v3[99] = CFSTR("RemainingTime");
  v2[100] = CFSTR("0x0000000030000024");
  v3[100] = CFSTR("RotationalSpeed");
  v2[101] = CFSTR("0x000000003000004F");
  v3[101] = CFSTR("RotationalSpeedMarkerRedline");
  v2[102] = CFSTR("0x000000003000004E");
  v3[102] = CFSTR("RotationalSpeedMax");
  v2[103] = CFSTR("0x0000000030000060");
  v3[103] = CFSTR("RotationalSpeedState");
  v2[104] = CFSTR("0x0000000060000007");
  v3[104] = CFSTR("SeatBeltIndicator");
  v2[105] = CFSTR("0x0000000060000006");
  v3[105] = CFSTR("SeatOccupancy");
  v2[106] = CFSTR("0x0000000036000028");
  v3[106] = CFSTR("SectionIdentifier");
  v2[107] = CFSTR("0x0000000036000024");
  v3[107] = CFSTR("SelectSettingEntryList");
  v2[108] = CFSTR("0x0000000036000064");
  v3[108] = CFSTR("Selected");
  v2[109] = CFSTR("0x0000000030000061");
  v3[109] = CFSTR("SelectedEntryIndex");
  v2[110] = CFSTR("0x0000000036000062");
  v3[110] = CFSTR("SelectedEntryIndices");
  v2[111] = CFSTR("0x000000003000001A");
  v3[111] = CFSTR("SensorState");
  v2[112] = CFSTR("0x0000000036000019");
  v3[112] = CFSTR("SettingProminenceLevel");
  v2[113] = CFSTR("0x0000000036000006");
  v3[113] = CFSTR("SettingsCategory");
  v2[114] = CFSTR("0x0000000036000011");
  v3[114] = CFSTR("ShowAudioBrandLogo");
  v2[115] = CFSTR("0x0000000035000016");
  v3[115] = CFSTR("ShowOdometer");
  v2[116] = CFSTR("0x0000000046000002");
  v3[116] = CFSTR("ShowSecondarySpeed");
  v2[117] = CFSTR("0x0000000030000003");
  v3[117] = CFSTR("SortOrder");
  v2[118] = CFSTR("0x0000000030000021");
  v3[118] = CFSTR("Speed");
  v2[119] = CFSTR("0x0000000030000046");
  v3[119] = CFSTR("SpeedKMH");
  v2[120] = CFSTR("0x000000004500001C");
  v3[120] = CFSTR("SpeedLimited");
  v2[121] = CFSTR("0x0000000030000047");
  v3[121] = CFSTR("SpeedMPH");
  v2[122] = CFSTR("0x0000000030000048");
  v3[122] = CFSTR("SpeedMaxKMH");
  v2[123] = CFSTR("0x0000000030000049");
  v3[123] = CFSTR("SpeedMaxMPH");
  v2[124] = CFSTR("0x0000000046000001");
  v3[124] = CFSTR("SpeedUnit");
  v2[125] = CFSTR("0x0000000036000027");
  v3[125] = CFSTR("StepperBarHidden");
  v2[126] = CFSTR("0x000000003000005E");
  v3[126] = CFSTR("SymbolName");
  v2[127] = CFSTR("0x0000000037000008");
  v3[127] = CFSTR("SymbolNameAndColor");
  v2[128] = CFSTR("0x0000000045000005");
  v3[128] = CFSTR("TargetSpeedState");
  v2[129] = CFSTR("0x0000000031000017");
  v3[129] = CFSTR("TargetTemperature");
  v2[130] = CFSTR("0x000000003000001D");
  v3[130] = CFSTR("Temperature");
  v2[131] = CFSTR("0x0000000030000056");
  v3[131] = CFSTR("TemperatureMarkerCold");
  v2[132] = CFSTR("0x0000000030000057");
  v3[132] = CFSTR("TemperatureMarkerHot");
  v2[133] = CFSTR("0x0000000030000055");
  v3[133] = CFSTR("TemperatureMax");
  v2[134] = CFSTR("0x0000000030000054");
  v3[134] = CFSTR("TemperatureMin");
  v2[135] = CFSTR("0x000000003000001E");
  v3[135] = CFSTR("TemperatureState");
  v2[136] = CFSTR("0x0000000046000005");
  v3[136] = CFSTR("TemperatureUnit");
  v2[137] = CFSTR("0x00000000FF000011");
  v3[137] = CFSTR("TestArrayBool");
  v2[138] = CFSTR("0x00000000FF00001C");
  v3[138] = CFSTR("TestArrayData");
  v2[139] = CFSTR("0x00000000FF00001A");
  v3[139] = CFSTR("TestArrayFloat");
  v2[140] = CFSTR("0x00000000FF000017");
  v3[140] = CFSTR("TestArrayInt16");
  v2[141] = CFSTR("0x00000000FF000018");
  v3[141] = CFSTR("TestArrayInt32");
  v2[142] = CFSTR("0x00000000FF000019");
  v3[142] = CFSTR("TestArrayInt64");
  v2[143] = CFSTR("0x00000000FF000016");
  v3[143] = CFSTR("TestArrayInt8");
  v2[144] = CFSTR("0x00000000FF00001D");
  v3[144] = CFSTR("TestArrayRawData");
  v2[145] = CFSTR("0x00000000FF00001B");
  v3[145] = CFSTR("TestArrayString");
  v2[146] = CFSTR("0x00000000FF000013");
  v3[146] = CFSTR("TestArrayUInt16");
  v2[147] = CFSTR("0x00000000FF000014");
  v3[147] = CFSTR("TestArrayUInt32");
  v2[148] = CFSTR("0x00000000FF000015");
  v3[148] = CFSTR("TestArrayUInt64");
  v2[149] = CFSTR("0x00000000FF000012");
  v3[149] = CFSTR("TestArrayUInt8");
  v2[150] = CFSTR("0x00000000FF000001");
  v3[150] = CFSTR("TestBool");
  v2[151] = CFSTR("0x00000000FF000024");
  v3[151] = CFSTR("TestComplexArrayItemValue");
  v2[152] = CFSTR("0x00000000FF000010");
  v3[152] = CFSTR("TestComplexItem");
  v2[153] = CFSTR("0x00000000FF000022");
  v3[153] = CFSTR("TestComplexItemList");
  v2[154] = CFSTR("0x00000000FF000021");
  v3[154] = CFSTR("TestComplexItemValue");
  v2[155] = CFSTR("0x00000000FF000020");
  v3[155] = CFSTR("TestComplexItems");
  v2[156] = CFSTR("0x00000000FF000026");
  v3[156] = CFSTR("TestComplexNestedItemList");
  v2[157] = CFSTR("0x00000000FF000025");
  v3[157] = CFSTR("TestComplexNestedItemValue");
  v2[158] = CFSTR("0x00000000FF000027");
  v3[158] = CFSTR("TestComplexNestedListItemValue");
  v2[159] = CFSTR("0x00000000FF00000C");
  v3[159] = CFSTR("TestData");
  v2[160] = CFSTR("0x00000000FF00000F");
  v3[160] = CFSTR("TestDimensionUnit");
  v2[161] = CFSTR("0x00000000FF00000E");
  v3[161] = CFSTR("TestEnum");
  v2[162] = CFSTR("0x00000000FF00000A");
  v3[162] = CFSTR("TestFloat");
  v2[163] = CFSTR("0x00000000FF000007");
  v3[163] = CFSTR("TestInt16");
  v2[164] = CFSTR("0x00000000FF000008");
  v3[164] = CFSTR("TestInt32");
  v2[165] = CFSTR("0x00000000FF000009");
  v3[165] = CFSTR("TestInt64");
  v2[166] = CFSTR("0x00000000FF000006");
  v3[166] = CFSTR("TestInt8");
  v2[167] = CFSTR("0x00000000FF00000D");
  v3[167] = CFSTR("TestRawData");
  v2[168] = CFSTR("0x00000000FF00000B");
  v3[168] = CFSTR("TestString");
  v2[169] = CFSTR("0x00000000FF000023");
  v3[169] = CFSTR("TestString2");
  v2[170] = CFSTR("0x00000000FF000003");
  v3[170] = CFSTR("TestUInt16");
  v2[171] = CFSTR("0x00000000FF000004");
  v3[171] = CFSTR("TestUInt32");
  v2[172] = CFSTR("0x00000000FF000005");
  v3[172] = CFSTR("TestUInt64");
  v2[173] = CFSTR("0x00000000FF000002");
  v3[173] = CFSTR("TestUInt8");
  v2[174] = CFSTR("0x0000000049000003");
  v3[174] = CFSTR("Timestamp");
  v2[175] = CFSTR("0x0000000032000003");
  v3[175] = CFSTR("Title");
  v2[176] = CFSTR("0x0000000041000011");
  v3[176] = CFSTR("TransmissionMode");
  v2[177] = CFSTR("0x0000000035000015");
  v3[177] = CFSTR("TripReset");
  v2[178] = CFSTR("0x0000000047000003");
  v3[178] = CFSTR("UIInputDeviceButtonEvent");
  v2[179] = CFSTR("0x0000000047000002");
  v3[179] = CFSTR("UIInputDevicePurpose");
  v2[180] = CFSTR("0x0000000047000004");
  v3[180] = CFSTR("UISceneOptions");
  v2[181] = CFSTR("0x0000000047000001");
  v3[181] = CFSTR("UISceneState");
  v2[182] = CFSTR("0x0000000037000003");
  v3[182] = CFSTR("UserAction");
  v2[183] = CFSTR("0x0000000036000063");
  v3[183] = CFSTR("UserDismissible");
  v2[184] = CFSTR("0x000000003700000A");
  v3[184] = CFSTR("UserSelectionEnabled");
  v2[185] = CFSTR("0x0000000030000005");
  v3[185] = CFSTR("UserVisibleDescription");
  v2[186] = CFSTR("0x0000000030000016");
  v3[186] = CFSTR("UserVisibleFooter");
  v2[187] = CFSTR("0x0000000049000004");
  v3[187] = CFSTR("UserVisibleFullDescription");
  v2[188] = CFSTR("0x0000000030000001");
  v3[188] = CFSTR("UserVisibleLabel");
  v2[189] = CFSTR("0x0000000036000004");
  v3[189] = CFSTR("UserVisibleSectionName");
  v2[190] = CFSTR("0x0000000030000017");
  v3[190] = CFSTR("UserVisibleValue");
  v2[191] = CFSTR("0x0000000048000005");
  v3[191] = CFSTR("VehicleLayout");
  v2[192] = CFSTR("0x0000000036000065");
  v3[192] = CFSTR("VehicleLayoutKey");
  v2[193] = CFSTR("0x0000000048000007");
  v3[193] = CFSTR("VehicleLogo");
  v2[194] = CFSTR("0x0000000041000020");
  v3[194] = CFSTR("VehicleUserVisibleLabel");
  v2[195] = CFSTR("0x0000000031000025");
  v3[195] = CFSTR("VentCombinations");
  v2[196] = CFSTR("0x0000000031000015");
  v3[196] = CFSTR("VentTypes");
  v2[197] = CFSTR("0x0000000033000006");
  v3[197] = CFSTR("Volume");
  v2[198] = CFSTR("0x0000000033000005");
  v3[198] = CFSTR("VolumeType");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 199);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)characteristicNameByType__characteristicNameByType;
  characteristicNameByType__characteristicNameByType = v0;

}

+ (NSSet)stateCaptureValues
{
  if (stateCaptureValues_onceToken != -1)
    dispatch_once(&stateCaptureValues_onceToken, &__block_literal_global_811);
  return (NSSet *)(id)stateCaptureValues__stateCaptureValues;
}

void __44__CAFCharacteristicTypes_stateCaptureValues__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[158];

  v4[157] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = CFSTR("0x0000000031000003");
  v4[1] = CFSTR("0x0000000031000010");
  v4[2] = CFSTR("0x0000000032000005");
  v4[3] = CFSTR("0x0000000032000004");
  v4[4] = CFSTR("0x0000000048000006");
  v4[5] = CFSTR("0x000000003000005F");
  v4[6] = CFSTR("0x0000000031000028");
  v4[7] = CFSTR("0x0000000031000024");
  v4[8] = CFSTR("0x0000000030000045");
  v4[9] = CFSTR("0x0000000033000002");
  v4[10] = CFSTR("0x0000000030000031");
  v4[11] = CFSTR("0x000000003000004D");
  v4[12] = CFSTR("0x000000003000004C");
  v4[13] = CFSTR("0x0000000030000035");
  v4[14] = CFSTR("0x0000000040000001");
  v4[15] = CFSTR("0x0000000060000002");
  v4[16] = CFSTR("0x0000000036000010");
  v4[17] = CFSTR("0x0000000040000007");
  v4[18] = CFSTR("0x000000004000000A");
  v4[19] = CFSTR("0x0000000040000005");
  v4[20] = CFSTR("0x0000000050000001");
  v4[21] = CFSTR("0x0000000036000012");
  v4[22] = CFSTR("0x0000000030000007");
  v4[23] = CFSTR("0x0000000036000066");
  v4[24] = CFSTR("0x0000000032000007");
  v4[25] = CFSTR("0x0000000030000038");
  v4[26] = CFSTR("0x0000000032000026");
  v4[27] = CFSTR("0x0000000032000023");
  v4[28] = CFSTR("0x0000000031000019");
  v4[29] = CFSTR("0x0000000036000008");
  v4[30] = CFSTR("0x0000000031000014");
  v4[31] = CFSTR("0x0000000036000018");
  v4[32] = CFSTR("0x0000000032000011");
  v4[33] = CFSTR("0x0000000037000007");
  v4[34] = CFSTR("0x000000003700000B");
  v4[35] = CFSTR("0x0000000030000022");
  v4[36] = CFSTR("0x000000003000004A");
  v4[37] = CFSTR("0x000000003000004B");
  v4[38] = CFSTR("0x0000000046000004");
  v4[39] = CFSTR("0x0000000030000023");
  v4[40] = CFSTR("0x0000000030000025");
  v4[41] = CFSTR("0x0000000035000012");
  v4[42] = CFSTR("0x000000003000005D");
  v4[43] = CFSTR("0x0000000033000007");
  v4[44] = CFSTR("0x0000000033000008");
  v4[45] = CFSTR("0x0000000048000003");
  v4[46] = CFSTR("0x0000000033000003");
  v4[47] = CFSTR("0x0000000031000012");
  v4[48] = CFSTR("0x0000000046000007");
  v4[49] = CFSTR("0x0000000030000006");
  v4[50] = CFSTR("0x0000000035000013");
  v4[51] = CFSTR("0x0000000041000002");
  v4[52] = CFSTR("0x000000004100001A");
  v4[53] = CFSTR("0x0000000041000017");
  v4[54] = CFSTR("0x0000000041000012");
  v4[55] = CFSTR("0x0000000041000016");
  v4[56] = CFSTR("0x0000000031000002");
  v4[57] = CFSTR("0x0000000031000021");
  v4[58] = CFSTR("0x0000000036000023");
  v4[59] = CFSTR("0x0000000030000019");
  v4[60] = CFSTR("0x0000000030000037");
  v4[61] = CFSTR("0x0000000037000009");
  v4[62] = CFSTR("0x0000000036000009");
  v4[63] = CFSTR("0x0000000044000000");
  v4[64] = CFSTR("0x0000000030000010");
  v4[65] = CFSTR("0x0000000048000004");
  v4[66] = CFSTR("0x0000000032000032");
  v4[67] = CFSTR("0x0000000032000033");
  v4[68] = CFSTR("0x000000004200000B");
  v4[69] = CFSTR("0x0000000030000004");
  v4[70] = CFSTR("0x0000000036000021");
  v4[71] = CFSTR("0x0000000036000007");
  v4[72] = CFSTR("0x0000000042000009");
  v4[73] = CFSTR("0x0000000031000022");
  v4[74] = CFSTR("0x0000000036000026");
  v4[75] = CFSTR("0x0000000032000030");
  v4[76] = CFSTR("0x0000000032000012");
  v4[77] = CFSTR("0x0000000032000025");
  v4[78] = CFSTR("0x0000000036000025");
  v4[79] = CFSTR("0x0000000049000002");
  v4[80] = CFSTR("0x0000000037000002");
  v4[81] = CFSTR("0x0000000030000002");
  v4[82] = CFSTR("0x0000000036000022");
  v4[83] = CFSTR("0x0000000036000015");
  v4[84] = CFSTR("0x0000000032000034");
  v4[85] = CFSTR("0x0000000041000013");
  v4[86] = CFSTR("0x0000000030000028");
  v4[87] = CFSTR("0x0000000030000053");
  v4[88] = CFSTR("0x0000000030000052");
  v4[89] = CFSTR("0x0000000030000051");
  v4[90] = CFSTR("0x0000000030000050");
  v4[91] = CFSTR("0x000000003000001B");
  v4[92] = CFSTR("0x000000003000001C");
  v4[93] = CFSTR("0x0000000036000020");
  v4[94] = CFSTR("0x0000000030000030");
  v4[95] = CFSTR("0x0000000030000024");
  v4[96] = CFSTR("0x000000003000004F");
  v4[97] = CFSTR("0x000000003000004E");
  v4[98] = CFSTR("0x0000000030000060");
  v4[99] = CFSTR("0x0000000060000007");
  v4[100] = CFSTR("0x0000000060000006");
  v4[101] = CFSTR("0x0000000036000028");
  v4[102] = CFSTR("0x0000000036000024");
  v4[103] = CFSTR("0x0000000036000064");
  v4[104] = CFSTR("0x0000000030000061");
  v4[105] = CFSTR("0x0000000036000062");
  v4[106] = CFSTR("0x000000003000001A");
  v4[107] = CFSTR("0x0000000036000019");
  v4[108] = CFSTR("0x0000000036000006");
  v4[109] = CFSTR("0x0000000036000011");
  v4[110] = CFSTR("0x0000000035000016");
  v4[111] = CFSTR("0x0000000046000002");
  v4[112] = CFSTR("0x0000000030000003");
  v4[113] = CFSTR("0x0000000030000021");
  v4[114] = CFSTR("0x0000000030000046");
  v4[115] = CFSTR("0x000000004500001C");
  v4[116] = CFSTR("0x0000000030000047");
  v4[117] = CFSTR("0x0000000030000048");
  v4[118] = CFSTR("0x0000000030000049");
  v4[119] = CFSTR("0x0000000046000001");
  v4[120] = CFSTR("0x0000000036000027");
  v4[121] = CFSTR("0x000000003000005E");
  v4[122] = CFSTR("0x0000000037000008");
  v4[123] = CFSTR("0x0000000045000005");
  v4[124] = CFSTR("0x0000000031000017");
  v4[125] = CFSTR("0x000000003000001D");
  v4[126] = CFSTR("0x0000000030000056");
  v4[127] = CFSTR("0x0000000030000057");
  v4[128] = CFSTR("0x0000000030000055");
  v4[129] = CFSTR("0x0000000030000054");
  v4[130] = CFSTR("0x000000003000001E");
  v4[131] = CFSTR("0x0000000046000005");
  v4[132] = CFSTR("0x0000000049000003");
  v4[133] = CFSTR("0x0000000032000003");
  v4[134] = CFSTR("0x0000000041000011");
  v4[135] = CFSTR("0x0000000035000015");
  v4[136] = CFSTR("0x0000000047000003");
  v4[137] = CFSTR("0x0000000047000002");
  v4[138] = CFSTR("0x0000000047000004");
  v4[139] = CFSTR("0x0000000047000001");
  v4[140] = CFSTR("0x0000000037000003");
  v4[141] = CFSTR("0x0000000036000063");
  v4[142] = CFSTR("0x000000003700000A");
  v4[143] = CFSTR("0x0000000030000005");
  v4[144] = CFSTR("0x0000000030000016");
  v4[145] = CFSTR("0x0000000049000004");
  v4[146] = CFSTR("0x0000000030000001");
  v4[147] = CFSTR("0x0000000036000004");
  v4[148] = CFSTR("0x0000000030000017");
  v4[149] = CFSTR("0x0000000048000005");
  v4[150] = CFSTR("0x0000000036000065");
  v4[151] = CFSTR("0x0000000048000007");
  v4[152] = CFSTR("0x0000000041000020");
  v4[153] = CFSTR("0x0000000031000025");
  v4[154] = CFSTR("0x0000000031000015");
  v4[155] = CFSTR("0x0000000033000006");
  v4[156] = CFSTR("0x0000000033000005");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 157);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)stateCaptureValues__stateCaptureValues;
  stateCaptureValues__stateCaptureValues = v2;

}

+ (id)characteristicNameForType:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "characteristicNameByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = v4;

  return v6;
}

+ (id)characteristicNameFor:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "characteristicTypeFor:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "characteristicNameForType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)characteristicTypeFor:(id)a3
{
  return (id)objc_msgSend(a3, "characteristicType");
}

@end
