@implementation TMSrcFromName

id __TMSrcFromName_block_invoke()
{
  id result;
  _QWORD v1[28];
  _QWORD v2[29];

  v2[28] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("NITZ");
  v1[1] = CFSTR("CDMA");
  v2[0] = &unk_1E6650A20;
  v2[1] = &unk_1E6650A38;
  v1[2] = CFSTR("GPS");
  v1[3] = CFSTR("LocationServer");
  v2[2] = &unk_1E6650A50;
  v2[3] = &unk_1E6650A68;
  v1[4] = CFSTR("HarvestServer");
  v1[5] = CFSTR("NTP");
  v2[4] = &unk_1E6650A80;
  v2[5] = &unk_1E6650A98;
  v1[6] = CFSTR("NTPLowConfidence");
  v1[7] = CFSTR("NTPPacket");
  v2[6] = &unk_1E6650AB0;
  v2[7] = &unk_1E6650AC8;
  v1[8] = CFSTR("MobileLockdown");
  v1[9] = CFSTR("iTunesStoreServer");
  v2[8] = &unk_1E6650AE0;
  v2[9] = &unk_1E6650AF8;
  v1[10] = CFSTR("Location");
  v1[11] = CFSTR("Computed");
  v2[10] = &unk_1E6650B10;
  v2[11] = &unk_1E6650B28;
  v1[12] = CFSTR("LocationAndNetwork");
  v1[13] = CFSTR("TimeSourceGnssValidPos");
  v2[12] = &unk_1E6650B40;
  v2[13] = &unk_1E6650B58;
  v1[14] = CFSTR("TimeSourceGnss");
  v1[15] = CFSTR("TimeSourceBBTimeTransfer");
  v2[14] = &unk_1E6650B70;
  v2[15] = &unk_1E6650B88;
  v1[16] = CFSTR("TimeSourceBBTimeTagging");
  v1[17] = CFSTR("TimeSourceUnknown");
  v2[16] = &unk_1E6650BA0;
  v2[17] = &unk_1E6650BB8;
  v1[18] = CFSTR("TMLSSourceComputed");
  v1[19] = CFSTR("TMLSSourceComputedReliable");
  v2[18] = &unk_1E6650BD0;
  v2[19] = &unk_1E6650BE8;
  v1[20] = CFSTR("TMLSSourceUser");
  v1[21] = CFSTR("TMLSSourceDevice");
  v2[20] = &unk_1E6650C00;
  v2[21] = &unk_1E6650C18;
  v1[22] = CFSTR("FilesystemTimestamp");
  v1[23] = CFSTR("AirPlaySendingDeviceTime");
  v2[22] = &unk_1E6650C30;
  v2[23] = &unk_1E6650C48;
  v1[24] = CFSTR("ProxBuddy");
  v1[25] = CFSTR("APNS");
  v2[24] = &unk_1E6650C60;
  v2[25] = &unk_1E6650C78;
  v1[26] = CFSTR("Accessory");
  v1[27] = CFSTR("Unknown");
  v2[26] = &unk_1E6650C90;
  v2[27] = &unk_1E6650CA8;
  result = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 28);
  TMSrcFromName_sMap = (uint64_t)result;
  return result;
}

@end
