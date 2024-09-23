@implementation TMCmdFromName

id __TMCmdFromName_block_invoke()
{
  id result;
  _QWORD v1[24];
  _QWORD v2[25];

  v2[24] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("TMSetSourceTime");
  v1[1] = CFSTR("TMSetSourceAvailable");
  v2[0] = &unk_1E6650CC0;
  v2[1] = &unk_1E6650CD8;
  v1[2] = CFSTR("TMSetSourceUnavailable");
  v1[3] = CFSTR("TMSetSourceTimeZone");
  v2[2] = &unk_1E6650CF0;
  v2[3] = &unk_1E6650D08;
  v1[4] = CFSTR("TMSetAutomaticTimeEnabled");
  v1[5] = CFSTR("TMIsAutomaticTimeEnabled");
  v2[4] = &unk_1E6650D20;
  v2[5] = &unk_1E6650D38;
  v1[6] = CFSTR("TMSetAutomaticTimeZoneEnabled");
  v1[7] = CFSTR("TMIsAutomaticTimeZoneEnabled");
  v2[6] = &unk_1E6650D50;
  v2[7] = &unk_1E6650D68;
  v1[8] = CFSTR("TMIsTimeZoneConfirmed");
  v1[9] = CFSTR("TMConfirmTimeZone");
  v2[8] = &unk_1E6650D80;
  v2[9] = &unk_1E6650D98;
  v1[10] = CFSTR("TMGetReferenceTime");
  v1[11] = CFSTR("TMSetReferenceUnreliable");
  v2[10] = &unk_1E6650DB0;
  v2[11] = &unk_1E6650DC8;
  v1[12] = CFSTR("TMIsLocationTimeZoneActive");
  v1[13] = CFSTR("TMIsBBTimeActive");
  v2[12] = &unk_1E6650DE0;
  v2[13] = &unk_1E6650DF8;
  v1[14] = CFSTR("TMProvideBBTime");
  v1[15] = CFSTR("TMReceiveNtpPacket");
  v2[14] = &unk_1E6650E10;
  v2[15] = &unk_1E6650E28;
  v1[16] = CFSTR("TMSetupTime");
  v1[17] = CFSTR("TMSetupTimeZone");
  v2[16] = &unk_1E6650E40;
  v2[17] = &unk_1E6650E58;
  v1[18] = CFSTR("TMProvideCellularTimeZone");
  v1[19] = CFSTR("TMResetTimeZone");
  v2[18] = &unk_1E6650E70;
  v2[19] = &unk_1E6650E88;
  v1[20] = CFSTR("TMSystemWillWake");
  v1[21] = CFSTR("TMFetchNTP");
  v2[20] = &unk_1E6650EA0;
  v2[21] = &unk_1E6650EB8;
  v1[22] = CFSTR("TMResetToFirstLaunch");
  v1[23] = CFSTR("TMUnknown");
  v2[22] = &unk_1E6650ED0;
  v2[23] = &unk_1E6650EE8;
  result = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 24);
  TMCmdFromName_sMap = (uint64_t)result;
  return result;
}

@end
