@implementation CAFControlTypes

+ (NSDictionary)controlTypeByName
{
  if (controlTypeByName_onceToken != -1)
    dispatch_once(&controlTypeByName_onceToken, &__block_literal_global_5);
  return (NSDictionary *)(id)controlTypeByName__controlTypeByName;
}

void __36__CAFControlTypes_controlTypeByName__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[30];
  _QWORD v3[31];

  v3[30] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("BeginSeekBackward");
  v2[1] = CFSTR("BeginSeekForward");
  v3[0] = CFSTR("0x000000000F000038");
  v3[1] = CFSTR("0x000000000F000037");
  v2[2] = CFSTR("ChangeMediaSource");
  v2[3] = CFSTR("ConnectDevice");
  v3[2] = CFSTR("0x000000000F00004D");
  v3[3] = CFSTR("0x000000003600001A");
  v2[4] = CFSTR("DisconnectDevice");
  v2[5] = CFSTR("EndSeek");
  v3[4] = CFSTR("0x000000003600001B");
  v3[5] = CFSTR("0x000000000F000039");
  v2[6] = CFSTR("ForgetDevice");
  v2[7] = CFSTR("JumpBackward");
  v3[6] = CFSTR("0x000000003600001C");
  v3[7] = CFSTR("0x000000000F00004A");
  v2[8] = CFSTR("JumpForward");
  v2[9] = CFSTR("NextItem");
  v3[8] = CFSTR("0x000000000F000040");
  v3[9] = CFSTR("0x000000000F000035");
  v2[10] = CFSTR("Pause");
  v2[11] = CFSTR("Play");
  v3[10] = CFSTR("0x000000000F000033");
  v3[11] = CFSTR("0x000000000F000032");
  v2[12] = CFSTR("PreviousItem");
  v2[13] = CFSTR("Reset");
  v3[12] = CFSTR("0x000000000F000036");
  v3[13] = CFSTR("0x0000000030000062");
  v2[14] = CFSTR("SetArtistSongNotification");
  v2[15] = CFSTR("Stop");
  v3[14] = CFSTR("0x000000000F00004E");
  v3[15] = CFSTR("0x000000000F000034");
  v2[16] = CFSTR("TestAccEventNoParams");
  v2[17] = CFSTR("TestAccEventWithParams");
  v3[16] = CFSTR("0x00000000FF000032");
  v3[17] = CFSTR("0x00000000FF000033");
  v2[18] = CFSTR("TestAccRequestNoParams");
  v2[19] = CFSTR("TestAccRequestWithReqAndResParams");
  v3[18] = CFSTR("0x00000000FF00002E");
  v3[19] = CFSTR("0x00000000FF000031");
  v2[20] = CFSTR("TestAccRequestWithReqParams");
  v2[21] = CFSTR("TestAccRequestWithResParams");
  v3[20] = CFSTR("0x00000000FF00002F");
  v3[21] = CFSTR("0x00000000FF000030");
  v2[22] = CFSTR("TestDevEventNoParams");
  v2[23] = CFSTR("TestDevEventWithParams");
  v3[22] = CFSTR("0x00000000FF00002C");
  v3[23] = CFSTR("0x00000000FF00002D");
  v2[24] = CFSTR("TestDevRequestNoParams");
  v2[25] = CFSTR("TestDevRequestWithReqAndResParams");
  v3[24] = CFSTR("0x00000000FF000028");
  v3[25] = CFSTR("0x00000000FF00002B");
  v2[26] = CFSTR("TestDevRequestWithReqParams");
  v2[27] = CFSTR("TestDevRequestWithResParams");
  v3[26] = CFSTR("0x00000000FF000029");
  v3[27] = CFSTR("0x00000000FF00002A");
  v2[28] = CFSTR("TuneToFrequency");
  v2[29] = CFSTR("TuneToIdentifier");
  v3[28] = CFSTR("0x000000000F00004C");
  v3[29] = CFSTR("0x000000000F00004B");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 30);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)controlTypeByName__controlTypeByName;
  controlTypeByName__controlTypeByName = v0;

}

+ (NSDictionary)controlNameByType
{
  if (controlNameByType_onceToken != -1)
    dispatch_once(&controlNameByType_onceToken, &__block_literal_global_134);
  return (NSDictionary *)(id)controlNameByType__controlNameByType;
}

void __36__CAFControlTypes_controlNameByType__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[30];
  _QWORD v3[31];

  v3[30] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("0x000000000F000038");
  v2[1] = CFSTR("0x000000000F000037");
  v3[0] = CFSTR("BeginSeekBackward");
  v3[1] = CFSTR("BeginSeekForward");
  v2[2] = CFSTR("0x000000000F00004D");
  v2[3] = CFSTR("0x000000003600001A");
  v3[2] = CFSTR("ChangeMediaSource");
  v3[3] = CFSTR("ConnectDevice");
  v2[4] = CFSTR("0x000000003600001B");
  v2[5] = CFSTR("0x000000000F000039");
  v3[4] = CFSTR("DisconnectDevice");
  v3[5] = CFSTR("EndSeek");
  v2[6] = CFSTR("0x000000003600001C");
  v2[7] = CFSTR("0x000000000F00004A");
  v3[6] = CFSTR("ForgetDevice");
  v3[7] = CFSTR("JumpBackward");
  v2[8] = CFSTR("0x000000000F000040");
  v2[9] = CFSTR("0x000000000F000035");
  v3[8] = CFSTR("JumpForward");
  v3[9] = CFSTR("NextItem");
  v2[10] = CFSTR("0x000000000F000033");
  v2[11] = CFSTR("0x000000000F000032");
  v3[10] = CFSTR("Pause");
  v3[11] = CFSTR("Play");
  v2[12] = CFSTR("0x000000000F000036");
  v2[13] = CFSTR("0x0000000030000062");
  v3[12] = CFSTR("PreviousItem");
  v3[13] = CFSTR("Reset");
  v2[14] = CFSTR("0x000000000F00004E");
  v2[15] = CFSTR("0x000000000F000034");
  v3[14] = CFSTR("SetArtistSongNotification");
  v3[15] = CFSTR("Stop");
  v2[16] = CFSTR("0x00000000FF000032");
  v2[17] = CFSTR("0x00000000FF000033");
  v3[16] = CFSTR("TestAccEventNoParams");
  v3[17] = CFSTR("TestAccEventWithParams");
  v2[18] = CFSTR("0x00000000FF00002E");
  v2[19] = CFSTR("0x00000000FF000031");
  v3[18] = CFSTR("TestAccRequestNoParams");
  v3[19] = CFSTR("TestAccRequestWithReqAndResParams");
  v2[20] = CFSTR("0x00000000FF00002F");
  v2[21] = CFSTR("0x00000000FF000030");
  v3[20] = CFSTR("TestAccRequestWithReqParams");
  v3[21] = CFSTR("TestAccRequestWithResParams");
  v2[22] = CFSTR("0x00000000FF00002C");
  v2[23] = CFSTR("0x00000000FF00002D");
  v3[22] = CFSTR("TestDevEventNoParams");
  v3[23] = CFSTR("TestDevEventWithParams");
  v2[24] = CFSTR("0x00000000FF000028");
  v2[25] = CFSTR("0x00000000FF00002B");
  v3[24] = CFSTR("TestDevRequestNoParams");
  v3[25] = CFSTR("TestDevRequestWithReqAndResParams");
  v2[26] = CFSTR("0x00000000FF000029");
  v2[27] = CFSTR("0x00000000FF00002A");
  v3[26] = CFSTR("TestDevRequestWithReqParams");
  v3[27] = CFSTR("TestDevRequestWithResParams");
  v2[28] = CFSTR("0x000000000F00004C");
  v2[29] = CFSTR("0x000000000F00004B");
  v3[28] = CFSTR("TuneToFrequency");
  v3[29] = CFSTR("TuneToIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 30);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)controlNameByType__controlNameByType;
  controlNameByType__controlNameByType = v0;

}

+ (id)controlNameForType:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "controlNameByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = v4;

  return v6;
}

+ (id)controlNameFor:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "controlTypeFor:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "controlNameForType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)controlTypeFor:(id)a3
{
  return (id)objc_msgSend(a3, "controlType");
}

@end
