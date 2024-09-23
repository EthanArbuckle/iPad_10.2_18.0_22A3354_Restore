@implementation CellularLteOtaMsg

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPhyCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_phyCellId = a3;
}

- (void)setHasPhyCellId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPhyCellId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setFreq:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_freq = a3;
}

- (void)setHasFreq:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasFreq
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setRbId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_rbId = a3;
}

- (void)setHasRbId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRbId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (int)channelType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_channelType;
  else
    return 8;
}

- (void)setChannelType:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_channelType = a3;
}

- (void)setHasChannelType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasChannelType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)channelTypeAsString:(int)a3
{
  if ((a3 - 8) >= 8)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_100260040[a3 - 8];
}

- (int)StringAsChannelType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BCCH_BCH")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BCCH_DL_SCH")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MCCH")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PCCH")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DL_CCCH")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DL_DCCH")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UL_CCCH")) & 1) != 0)
  {
    v4 = 14;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UL_DCCH")))
  {
    v4 = 15;
  }
  else
  {
    v4 = 8;
  }

  return v4;
}

- (void)setMsgType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_msgType = a3;
}

- (void)setHasMsgType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMsgType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setLength:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_length = a3;
}

- (void)setHasLength:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasLength
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)setDlBw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_dlBw = a3;
}

- (void)setHasDlBw:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDlBw
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCellId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setFreqBandInd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_freqBandInd = a3;
}

- (void)setHasFreqBandInd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasFreqBandInd
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setTrackingAreaCode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_trackingAreaCode = a3;
}

- (void)setHasTrackingAreaCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTrackingAreaCode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSelPlmnMcc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_selPlmnMcc = a3;
}

- (void)setHasSelPlmnMcc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSelPlmnMcc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSelPlmnMnc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_selPlmnMnc = a3;
}

- (void)setHasSelPlmnMnc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSelPlmnMnc
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasNumMncDigits
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setUpperLayerIndication:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_upperLayerIndication = a3;
}

- (void)setHasUpperLayerIndication:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasUpperLayerIndication
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setScgEverConfigured:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_scgEverConfigured = a3;
}

- (void)setHasScgEverConfigured:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasScgEverConfigured
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (int)mcchMsg
{
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    return self->_mcchMsg;
  else
    return 0;
}

- (void)setMcchMsg:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_mcchMsg = a3;
}

- (void)setHasMcchMsg:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMcchMsg
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)mcchMsgAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("lte_rrc_MBSFNAreaConfiguration_r9");
  if (a3 == 1)
    v3 = CFSTR("lte_rrc_MBMSCountingRequest_r10");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsMcchMsg:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_MBSFNAreaConfiguration_r9")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_MBMSCountingRequest_r10"));

  return v4;
}

- (int)ulCcchMsg
{
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    return self->_ulCcchMsg;
  else
    return 0;
}

- (void)setUlCcchMsg:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_ulCcchMsg = a3;
}

- (void)setHasUlCcchMsg:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasUlCcchMsg
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)ulCcchMsgAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("lte_rrc_rrcConnectionReestablishmentRequest");
  if (a3 == 1)
    v3 = CFSTR("lte_rrc_rrcConnectionRequest");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsUlCcchMsg:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_rrcConnectionReestablishmentRequest")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_rrcConnectionRequest"));

  return v4;
}

- (int)ulDcchMsg
{
  if ((*((_BYTE *)&self->_has + 2) & 8) != 0)
    return self->_ulDcchMsg;
  else
    return 0;
}

- (void)setUlDcchMsg:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_ulDcchMsg = a3;
}

- (void)setHasUlDcchMsg:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasUlDcchMsg
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)ulDcchMsgAsString:(int)a3
{
  if (a3 >= 0x13)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_100260080[a3];
}

- (int)StringAsUlDcchMsg:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_csfbParametersRequestCDMA2000")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_measurementReport")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_rrcConnectionReconfigurationComplete")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_rrcConnectionReestablishmentComplete")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_rrcConnectionSetupComplete")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_securityModeComplete")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_securityModeFailure")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_ueCapabilityInformation")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_ulHandoverPreparationTransfer")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_ulInformationTransfer")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_counterCheckResponse")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_ueInformationResponse_r9")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_proximityIndication_r9")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_rnReconfigurationComplete_r10")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_mbmsCountingResponse_r10")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_interFreqRSTDMeasurementIndication_r10")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_ueAssistanceInformation_r11")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_inDeviceCoexIndication_r11")) & 1) != 0)
  {
    v4 = 17;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_mbmsInterestIndication_r11")))
  {
    v4 = 18;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)dlCcchMsg
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_dlCcchMsg;
  else
    return 0;
}

- (void)setDlCcchMsg:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_dlCcchMsg = a3;
}

- (void)setHasDlCcchMsg:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDlCcchMsg
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)dlCcchMsgAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_100260118[a3];
}

- (int)StringAsDlCcchMsg:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_rrcConnectionReestablishment")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_rrcConnectionReestablishmentReject")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_rrcConnectionReject")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_rrcConnectionSetup")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)dlDcchMsg
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_dlDcchMsg;
  else
    return 0;
}

- (void)setDlDcchMsg:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dlDcchMsg = a3;
}

- (void)setHasDlDcchMsg:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDlDcchMsg
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)dlDcchMsgAsString:(int)a3
{
  if (a3 >= 0xB)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_100260138[a3];
}

- (int)StringAsDlDcchMsg:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_csfbParametersResponseCDMA2000")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_dlInformationTransfer")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_handoverFromEUTRAPreparationRequest")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_mobilityFromEUTRACommand")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_rrcConnectionReconfiguration")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_rrcConnectionRelease")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_securityModeCommand")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_ueCapabilityEnquiry")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_counterCheck")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_ueInformationRequest_r9")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("lte_rrc_loggedMeasurementConfiguration_r10")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($433900B3FE0DA71A7B1B7EFAD0E6CB57)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSubsId
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularLteOtaMsg;
  v3 = -[CellularLteOtaMsg description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteOtaMsg dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has;
  void *v5;
  NSData *content;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int mcchMsg;
  __CFString *v27;
  void *v28;
  int ulCcchMsg;
  __CFString *v30;
  uint64_t ulDcchMsg;
  __CFString *v32;
  uint64_t dlCcchMsg;
  __CFString *v34;
  uint64_t dlDcchMsg;
  __CFString *v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_phyCellId));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("phy_cell_id"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_freq));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("freq"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rbId));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("rb_id"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_48;
  }
LABEL_32:
  v15 = self->_channelType - 8;
  if (v15 >= 8)
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_channelType));
  else
    v16 = off_100260040[v15];
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("channel_type"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_48:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_msgType));
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("msg_type"));

  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_length));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("length"));

  }
LABEL_9:
  content = self->_content;
  if (content)
    objc_msgSend(v3, "setObject:forKey:", content, CFSTR("content"));
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 8) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlBw));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("dl_bw"));

    v7 = self->_has;
    if ((*(_BYTE *)&v7 & 2) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&v7 & 0x80) == 0)
        goto LABEL_14;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&v7 & 2) == 0)
  {
    goto LABEL_13;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("cell_id"));

  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x80) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v7 & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_freqBandInd));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("freq_band_ind"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v7 & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_trackingAreaCode));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("tracking_area_code"));

  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v7 & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_selPlmnMcc));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("sel_plmn_mcc"));

  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v7 & 0x800) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_selPlmnMnc));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("sel_plmn_mnc"));

  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v7 & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numMncDigits));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("num_mnc_digits"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v7 & 0x100000) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_upperLayerIndication));
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("upper_layer_indication"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v7 & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_43;
  }
LABEL_42:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_scgEverConfigured));
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("scg_ever_configured"));

  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v7 & 0x40000) == 0)
      goto LABEL_22;
    goto LABEL_53;
  }
LABEL_43:
  mcchMsg = self->_mcchMsg;
  if (mcchMsg)
  {
    if (mcchMsg == 1)
      v27 = CFSTR("lte_rrc_MBMSCountingRequest_r10");
    else
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mcchMsg));
  }
  else
  {
    v27 = CFSTR("lte_rrc_MBSFNAreaConfiguration_r9");
  }
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("mcch_msg"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v7 & 0x80000) == 0)
      goto LABEL_23;
    goto LABEL_59;
  }
LABEL_53:
  ulCcchMsg = self->_ulCcchMsg;
  if (ulCcchMsg)
  {
    if (ulCcchMsg == 1)
      v30 = CFSTR("lte_rrc_rrcConnectionRequest");
    else
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_ulCcchMsg));
  }
  else
  {
    v30 = CFSTR("lte_rrc_rrcConnectionReestablishmentRequest");
  }
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("ul_ccch_msg"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v7 & 0x10) == 0)
      goto LABEL_24;
    goto LABEL_63;
  }
LABEL_59:
  ulDcchMsg = self->_ulDcchMsg;
  if (ulDcchMsg >= 0x13)
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_ulDcchMsg));
  else
    v32 = off_100260080[ulDcchMsg];
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("ul_dcch_msg"));

  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x10) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v7 & 0x20) == 0)
      goto LABEL_25;
LABEL_67:
    dlDcchMsg = self->_dlDcchMsg;
    if (dlDcchMsg >= 0xB)
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dlDcchMsg));
    else
      v36 = off_100260138[dlDcchMsg];
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("dl_dcch_msg"));

    if ((*(_DWORD *)&self->_has & 0x10000) != 0)
      goto LABEL_26;
    goto LABEL_27;
  }
LABEL_63:
  dlCcchMsg = self->_dlCcchMsg;
  if (dlCcchMsg >= 4)
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dlCcchMsg));
  else
    v34 = off_100260118[dlCcchMsg];
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("dl_ccch_msg"));

  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x20) != 0)
    goto LABEL_67;
LABEL_25:
  if ((*(_DWORD *)&v7 & 0x10000) != 0)
  {
LABEL_26:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("subs_id"));

  }
LABEL_27:
  v9 = v3;

  return v9;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001426C4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has;
  NSData *content;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v6;
  id v7;

  v7 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v7, self->_timestamp, 1);
    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v7, self->_subsId, 2);
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field(v7, self->_phyCellId, 4);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field(v7, self->_freq, 5);
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field(v7, self->_rbId, 7);
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt32Field(v7, self->_channelType, 8);
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_34:
  PBDataWriterWriteUint32Field(v7, self->_msgType, 9);
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
LABEL_9:
    PBDataWriterWriteUint32Field(v7, self->_length, 14);
LABEL_10:
  content = self->_content;
  if (content)
    PBDataWriterWriteDataField(v7, content, 15);
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_dlBw, 16);
    v6 = self->_has;
    if ((*(_BYTE *)&v6 & 2) == 0)
    {
LABEL_14:
      if ((*(_BYTE *)&v6 & 0x80) == 0)
        goto LABEL_15;
      goto LABEL_38;
    }
  }
  else if ((*(_BYTE *)&v6 & 2) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field(v7, self->_cellId, 17);
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v6 & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field(v7, self->_freqBandInd, 18);
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field(v7, self->_trackingAreaCode, 19);
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field(v7, self->_selPlmnMcc, 20);
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field(v7, self->_selPlmnMnc, 21);
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field(v7, self->_numMncDigits, 22);
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v6 & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField(v7, self->_upperLayerIndication, 23);
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField(v7, self->_scgEverConfigured, 24);
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v6 & 0x40000) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteInt32Field(v7, self->_mcchMsg, 30);
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x80000) == 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt32Field(v7, self->_ulCcchMsg, 31);
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_25;
LABEL_48:
    PBDataWriterWriteInt32Field(v7, self->_dlCcchMsg, 33);
    if ((*(_DWORD *)&self->_has & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_47:
  PBDataWriterWriteInt32Field(v7, self->_ulDcchMsg, 32);
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x10) != 0)
    goto LABEL_48;
LABEL_25:
  if ((*(_BYTE *)&v6 & 0x20) != 0)
LABEL_26:
    PBDataWriterWriteInt32Field(v7, self->_dlDcchMsg, 34);
LABEL_27:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v6;
  _QWORD *v7;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 26) |= 1u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 21) = self->_subsId;
  *((_DWORD *)v4 + 26) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 17) = self->_phyCellId;
  *((_DWORD *)v4 + 26) |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 11) = self->_freq;
  *((_DWORD *)v4 + 26) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 18) = self->_rbId;
  *((_DWORD *)v4 + 26) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 5) = self->_channelType;
  *((_DWORD *)v4 + 26) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_34:
  *((_DWORD *)v4 + 15) = self->_msgType;
  *((_DWORD *)v4 + 26) |= 0x400u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 13) = self->_length;
    *((_DWORD *)v4 + 26) |= 0x100u;
  }
LABEL_10:
  if (self->_content)
  {
    v7 = v4;
    objc_msgSend(v4, "setContent:");
    v4 = v7;
  }
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_dlBw;
    *((_DWORD *)v4 + 26) |= 8u;
    v6 = self->_has;
    if ((*(_BYTE *)&v6 & 2) == 0)
    {
LABEL_14:
      if ((*(_BYTE *)&v6 & 0x80) == 0)
        goto LABEL_15;
      goto LABEL_38;
    }
  }
  else if ((*(_BYTE *)&v6 & 2) == 0)
  {
    goto LABEL_14;
  }
  *((_DWORD *)v4 + 4) = self->_cellId;
  *((_DWORD *)v4 + 26) |= 2u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v6 & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 12) = self->_freqBandInd;
  *((_DWORD *)v4 + 26) |= 0x80u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 22) = self->_trackingAreaCode;
  *((_DWORD *)v4 + 26) |= 0x20000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 19) = self->_selPlmnMcc;
  *((_DWORD *)v4 + 26) |= 0x4000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 20) = self->_selPlmnMnc;
  *((_DWORD *)v4 + 26) |= 0x8000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 16) = self->_numMncDigits;
  *((_DWORD *)v4 + 26) |= 0x800u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v6 & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  *((_BYTE *)v4 + 101) = self->_upperLayerIndication;
  *((_DWORD *)v4 + 26) |= 0x200000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  *((_BYTE *)v4 + 100) = self->_scgEverConfigured;
  *((_DWORD *)v4 + 26) |= 0x100000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v6 & 0x40000) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 14) = self->_mcchMsg;
  *((_DWORD *)v4 + 26) |= 0x200u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x80000) == 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 23) = self->_ulCcchMsg;
  *((_DWORD *)v4 + 26) |= 0x40000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_25;
LABEL_48:
    *((_DWORD *)v4 + 9) = self->_dlCcchMsg;
    *((_DWORD *)v4 + 26) |= 0x10u;
    if ((*(_DWORD *)&self->_has & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_47:
  *((_DWORD *)v4 + 24) = self->_ulDcchMsg;
  *((_DWORD *)v4 + 26) |= 0x80000u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x10) != 0)
    goto LABEL_48;
LABEL_25:
  if ((*(_BYTE *)&v6 & 0x20) != 0)
  {
LABEL_26:
    *((_DWORD *)v4 + 10) = self->_dlDcchMsg;
    *((_DWORD *)v4 + 26) |= 0x20u;
  }
LABEL_27:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has;
  id v8;
  void *v9;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v10;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 26) |= 1u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 21) = self->_subsId;
  *((_DWORD *)v5 + 26) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v5 + 17) = self->_phyCellId;
  *((_DWORD *)v5 + 26) |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v5 + 11) = self->_freq;
  *((_DWORD *)v5 + 26) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v5 + 18) = self->_rbId;
  *((_DWORD *)v5 + 26) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v5 + 5) = self->_channelType;
  *((_DWORD *)v5 + 26) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_32:
  *((_DWORD *)v5 + 15) = self->_msgType;
  *((_DWORD *)v5 + 26) |= 0x400u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    *((_DWORD *)v5 + 13) = self->_length;
    *((_DWORD *)v5 + 26) |= 0x100u;
  }
LABEL_10:
  v8 = -[NSData copyWithZone:](self->_content, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 8) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_dlBw;
    *((_DWORD *)v6 + 26) |= 8u;
    v10 = self->_has;
    if ((*(_BYTE *)&v10 & 2) == 0)
    {
LABEL_12:
      if ((*(_BYTE *)&v10 & 0x80) == 0)
        goto LABEL_13;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&v10 & 2) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v6 + 4) = self->_cellId;
  *((_DWORD *)v6 + 26) |= 2u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v10 & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v6 + 12) = self->_freqBandInd;
  *((_DWORD *)v6 + 26) |= 0x80u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v10 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v6 + 22) = self->_trackingAreaCode;
  *((_DWORD *)v6 + 26) |= 0x20000u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v10 & 0x8000) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v6 + 19) = self->_selPlmnMcc;
  *((_DWORD *)v6 + 26) |= 0x4000u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x8000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v10 & 0x800) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v6 + 20) = self->_selPlmnMnc;
  *((_DWORD *)v6 + 26) |= 0x8000u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x800) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v10 & 0x200000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v6 + 16) = self->_numMncDigits;
  *((_DWORD *)v6 + 26) |= 0x800u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x200000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v10 & 0x100000) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  *((_BYTE *)v6 + 101) = self->_upperLayerIndication;
  *((_DWORD *)v6 + 26) |= 0x200000u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x100000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v10 & 0x200) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  *((_BYTE *)v6 + 100) = self->_scgEverConfigured;
  *((_DWORD *)v6 + 26) |= 0x100000u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x200) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v10 & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v6 + 14) = self->_mcchMsg;
  *((_DWORD *)v6 + 26) |= 0x200u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v10 & 0x80000) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v6 + 23) = self->_ulCcchMsg;
  *((_DWORD *)v6 + 26) |= 0x40000u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v10 & 0x10) == 0)
      goto LABEL_23;
LABEL_46:
    *((_DWORD *)v6 + 9) = self->_dlCcchMsg;
    *((_DWORD *)v6 + 26) |= 0x10u;
    if ((*(_DWORD *)&self->_has & 0x20) == 0)
      return v6;
    goto LABEL_24;
  }
LABEL_45:
  *((_DWORD *)v6 + 24) = self->_ulDcchMsg;
  *((_DWORD *)v6 + 26) |= 0x80000u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x10) != 0)
    goto LABEL_46;
LABEL_23:
  if ((*(_BYTE *)&v10 & 0x20) != 0)
  {
LABEL_24:
    *((_DWORD *)v6 + 10) = self->_dlDcchMsg;
    *((_DWORD *)v6 + 26) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has;
  int v7;
  NSData *content;
  int v9;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_121;
  has = self->_has;
  v7 = *((_DWORD *)v4 + 26);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_121;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_subsId != *((_DWORD *)v4 + 21))
      goto LABEL_121;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_phyCellId != *((_DWORD *)v4 + 17))
      goto LABEL_121;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_freq != *((_DWORD *)v4 + 11))
      goto LABEL_121;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_rbId != *((_DWORD *)v4 + 18))
      goto LABEL_121;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_channelType != *((_DWORD *)v4 + 5))
      goto LABEL_121;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_msgType != *((_DWORD *)v4 + 15))
      goto LABEL_121;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_length != *((_DWORD *)v4 + 13))
      goto LABEL_121;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_121;
  }
  content = self->_content;
  if ((unint64_t)content | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](content, "isEqual:"))
      goto LABEL_121;
    has = self->_has;
  }
  v9 = *((_DWORD *)v4 + 26);
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_dlBw != *((_DWORD *)v4 + 8))
      goto LABEL_121;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_cellId != *((_DWORD *)v4 + 4))
      goto LABEL_121;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_freqBandInd != *((_DWORD *)v4 + 12))
      goto LABEL_121;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v9 & 0x20000) == 0 || self->_trackingAreaCode != *((_DWORD *)v4 + 22))
      goto LABEL_121;
  }
  else if ((v9 & 0x20000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v9 & 0x4000) == 0 || self->_selPlmnMcc != *((_DWORD *)v4 + 19))
      goto LABEL_121;
  }
  else if ((v9 & 0x4000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v9 & 0x8000) == 0 || self->_selPlmnMnc != *((_DWORD *)v4 + 20))
      goto LABEL_121;
  }
  else if ((v9 & 0x8000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v9 & 0x800) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 16))
      goto LABEL_121;
  }
  else if ((v9 & 0x800) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v9 & 0x200000) == 0)
      goto LABEL_121;
    if (self->_upperLayerIndication)
    {
      if (!*((_BYTE *)v4 + 101))
        goto LABEL_121;
    }
    else if (*((_BYTE *)v4 + 101))
    {
      goto LABEL_121;
    }
  }
  else if ((v9 & 0x200000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v9 & 0x100000) != 0)
    {
      if (self->_scgEverConfigured)
      {
        if (!*((_BYTE *)v4 + 100))
          goto LABEL_121;
        goto LABEL_96;
      }
      if (!*((_BYTE *)v4 + 100))
        goto LABEL_96;
    }
LABEL_121:
    v10 = 0;
    goto LABEL_122;
  }
  if ((v9 & 0x100000) != 0)
    goto LABEL_121;
LABEL_96:
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v9 & 0x200) == 0 || self->_mcchMsg != *((_DWORD *)v4 + 14))
      goto LABEL_121;
  }
  else if ((v9 & 0x200) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v9 & 0x40000) == 0 || self->_ulCcchMsg != *((_DWORD *)v4 + 23))
      goto LABEL_121;
  }
  else if ((v9 & 0x40000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v9 & 0x80000) == 0 || self->_ulDcchMsg != *((_DWORD *)v4 + 24))
      goto LABEL_121;
  }
  else if ((v9 & 0x80000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_dlCcchMsg != *((_DWORD *)v4 + 9))
      goto LABEL_121;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_dlDcchMsg != *((_DWORD *)v4 + 10))
      goto LABEL_121;
    v10 = 1;
  }
  else
  {
    v10 = (*((_DWORD *)v4 + 26) & 0x20) == 0;
  }
LABEL_122:

  return v10;
}

- (unint64_t)hash
{
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  $433900B3FE0DA71A7B1B7EFAD0E6CB57 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v28;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v28 = 2654435761u * self->_timestamp;
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_subsId;
      if ((*(_WORD *)&has & 0x1000) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v28 = 0;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_phyCellId;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_freq;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v6 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_rbId;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v7 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_channelType;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_8;
LABEL_16:
    v9 = 0;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_15:
  v8 = 0;
  if ((*(_WORD *)&has & 0x400) == 0)
    goto LABEL_16;
LABEL_8:
  v9 = 2654435761 * self->_msgType;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_length;
    goto LABEL_18;
  }
LABEL_17:
  v10 = 0;
LABEL_18:
  v11 = (unint64_t)-[NSData hash](self->_content, "hash");
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 8) != 0)
  {
    v13 = 2654435761 * self->_dlBw;
    if ((*(_BYTE *)&v12 & 2) != 0)
    {
LABEL_20:
      v14 = 2654435761 * self->_cellId;
      if ((*(_BYTE *)&v12 & 0x80) != 0)
        goto LABEL_21;
      goto LABEL_35;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_BYTE *)&v12 & 2) != 0)
      goto LABEL_20;
  }
  v14 = 0;
  if ((*(_BYTE *)&v12 & 0x80) != 0)
  {
LABEL_21:
    v15 = 2654435761 * self->_freqBandInd;
    if ((*(_DWORD *)&v12 & 0x20000) != 0)
      goto LABEL_22;
    goto LABEL_36;
  }
LABEL_35:
  v15 = 0;
  if ((*(_DWORD *)&v12 & 0x20000) != 0)
  {
LABEL_22:
    v16 = 2654435761 * self->_trackingAreaCode;
    if ((*(_WORD *)&v12 & 0x4000) != 0)
      goto LABEL_23;
    goto LABEL_37;
  }
LABEL_36:
  v16 = 0;
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
LABEL_23:
    v17 = 2654435761 * self->_selPlmnMcc;
    if ((*(_WORD *)&v12 & 0x8000) != 0)
      goto LABEL_24;
    goto LABEL_38;
  }
LABEL_37:
  v17 = 0;
  if ((*(_WORD *)&v12 & 0x8000) != 0)
  {
LABEL_24:
    v18 = 2654435761 * self->_selPlmnMnc;
    if ((*(_WORD *)&v12 & 0x800) != 0)
      goto LABEL_25;
    goto LABEL_39;
  }
LABEL_38:
  v18 = 0;
  if ((*(_WORD *)&v12 & 0x800) != 0)
  {
LABEL_25:
    v19 = 2654435761 * self->_numMncDigits;
    if ((*(_DWORD *)&v12 & 0x200000) != 0)
      goto LABEL_26;
    goto LABEL_40;
  }
LABEL_39:
  v19 = 0;
  if ((*(_DWORD *)&v12 & 0x200000) != 0)
  {
LABEL_26:
    v20 = 2654435761 * self->_upperLayerIndication;
    if ((*(_DWORD *)&v12 & 0x100000) != 0)
      goto LABEL_27;
    goto LABEL_41;
  }
LABEL_40:
  v20 = 0;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
LABEL_27:
    v21 = 2654435761 * self->_scgEverConfigured;
    if ((*(_WORD *)&v12 & 0x200) != 0)
      goto LABEL_28;
    goto LABEL_42;
  }
LABEL_41:
  v21 = 0;
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
LABEL_28:
    v22 = 2654435761 * self->_mcchMsg;
    if ((*(_DWORD *)&v12 & 0x40000) != 0)
      goto LABEL_29;
    goto LABEL_43;
  }
LABEL_42:
  v22 = 0;
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
LABEL_29:
    v23 = 2654435761 * self->_ulCcchMsg;
    if ((*(_DWORD *)&v12 & 0x80000) != 0)
      goto LABEL_30;
    goto LABEL_44;
  }
LABEL_43:
  v23 = 0;
  if ((*(_DWORD *)&v12 & 0x80000) != 0)
  {
LABEL_30:
    v24 = 2654435761 * self->_ulDcchMsg;
    if ((*(_BYTE *)&v12 & 0x10) != 0)
      goto LABEL_31;
LABEL_45:
    v25 = 0;
    if ((*(_BYTE *)&v12 & 0x20) != 0)
      goto LABEL_32;
LABEL_46:
    v26 = 0;
    return v4 ^ v28 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v11 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
  }
LABEL_44:
  v24 = 0;
  if ((*(_BYTE *)&v12 & 0x10) == 0)
    goto LABEL_45;
LABEL_31:
  v25 = 2654435761 * self->_dlCcchMsg;
  if ((*(_BYTE *)&v12 & 0x20) == 0)
    goto LABEL_46;
LABEL_32:
  v26 = 2654435761 * self->_dlDcchMsg;
  return v4 ^ v28 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v11 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  id v7;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)v4 + 26);
    if ((v5 & 0x10000) == 0)
    {
LABEL_3:
      if ((v5 & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((v5 & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  self->_subsId = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x1000) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  self->_phyCellId = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  self->_freq = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x2000) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  self->_rbId = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  self->_channelType = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_34:
  self->_msgType = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x400u;
  if ((*((_DWORD *)v4 + 26) & 0x100) != 0)
  {
LABEL_9:
    self->_length = *((_DWORD *)v4 + 13);
    *(_DWORD *)&self->_has |= 0x100u;
  }
LABEL_10:
  if (*((_QWORD *)v4 + 3))
  {
    v7 = v4;
    -[CellularLteOtaMsg setContent:](self, "setContent:");
    v4 = v7;
  }
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 8) != 0)
  {
    self->_dlBw = *((_DWORD *)v4 + 8);
    *(_DWORD *)&self->_has |= 8u;
    v6 = *((_DWORD *)v4 + 26);
    if ((v6 & 2) == 0)
    {
LABEL_14:
      if ((v6 & 0x80) == 0)
        goto LABEL_15;
      goto LABEL_38;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_14;
  }
  self->_cellId = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x80) == 0)
  {
LABEL_15:
    if ((v6 & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  self->_freqBandInd = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x80u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x20000) == 0)
  {
LABEL_16:
    if ((v6 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  self->_trackingAreaCode = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x20000u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  self->_selPlmnMcc = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x4000u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x8000) == 0)
  {
LABEL_18:
    if ((v6 & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  self->_selPlmnMnc = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x8000u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x800) == 0)
  {
LABEL_19:
    if ((v6 & 0x200000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  self->_numMncDigits = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x800u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x200000) == 0)
  {
LABEL_20:
    if ((v6 & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  self->_upperLayerIndication = *((_BYTE *)v4 + 101);
  *(_DWORD *)&self->_has |= 0x200000u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x100000) == 0)
  {
LABEL_21:
    if ((v6 & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  self->_scgEverConfigured = *((_BYTE *)v4 + 100);
  *(_DWORD *)&self->_has |= 0x100000u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x200) == 0)
  {
LABEL_22:
    if ((v6 & 0x40000) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  self->_mcchMsg = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x200u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x40000) == 0)
  {
LABEL_23:
    if ((v6 & 0x80000) == 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_46:
  self->_ulCcchMsg = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x40000u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x80000) == 0)
  {
LABEL_24:
    if ((v6 & 0x10) == 0)
      goto LABEL_25;
LABEL_48:
    self->_dlCcchMsg = *((_DWORD *)v4 + 9);
    *(_DWORD *)&self->_has |= 0x10u;
    if ((*((_DWORD *)v4 + 26) & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_47:
  self->_ulDcchMsg = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x80000u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x10) != 0)
    goto LABEL_48;
LABEL_25:
  if ((v6 & 0x20) != 0)
  {
LABEL_26:
    self->_dlDcchMsg = *((_DWORD *)v4 + 10);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_27:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)phyCellId
{
  return self->_phyCellId;
}

- (unsigned)freq
{
  return self->_freq;
}

- (unsigned)rbId
{
  return self->_rbId;
}

- (unsigned)msgType
{
  return self->_msgType;
}

- (unsigned)length
{
  return self->_length;
}

- (NSData)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (unsigned)dlBw
{
  return self->_dlBw;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)freqBandInd
{
  return self->_freqBandInd;
}

- (unsigned)trackingAreaCode
{
  return self->_trackingAreaCode;
}

- (unsigned)selPlmnMcc
{
  return self->_selPlmnMcc;
}

- (unsigned)selPlmnMnc
{
  return self->_selPlmnMnc;
}

- (unsigned)numMncDigits
{
  return self->_numMncDigits;
}

- (BOOL)upperLayerIndication
{
  return self->_upperLayerIndication;
}

- (BOOL)scgEverConfigured
{
  return self->_scgEverConfigured;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
