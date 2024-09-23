@implementation AWDHomeKitAccessoryPairing

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setErrorCode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsAdd:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_isAdd = a3;
}

- (void)setHasIsAdd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasIsAdd
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsAddedViaWAC:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isAddedViaWAC = a3;
}

- (void)setHasIsAddedViaWAC:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsAddedViaWAC
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (int)transportType
{
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    return self->_transportType;
  else
    return 0;
}

- (void)setTransportType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTransportType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 < 8)
    return off_24E78C500[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransportType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTransportType_Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTransportType_IP")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTransportType_BTLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTransportType_Relay")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTransportType_TunnelBTLE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTransportType_IDS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTransportType_LoXY")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitTransportType_Rapport")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasVendorDetails
{
  return self->_vendorDetails != 0;
}

- (int)certified
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_certified;
  else
    return 0;
}

- (void)setCertified:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_certified = a3;
}

- (void)setHasCertified:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCertified
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)certifiedAsString:(int)a3
{
  if (a3 < 3)
    return off_24E78C540[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCertified:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitCertificationStatus_Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitCertificationStatus_NotCertified")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitCertificationStatus_Certified")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIsSecureWAC:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_isSecureWAC = a3;
}

- (void)setHasIsSecureWAC:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIsSecureWAC
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setRetryCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_retryCount = a3;
}

- (void)setHasRetryCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRetryCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (int)credentialType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_credentialType;
  else
    return 0;
}

- (void)setCredentialType:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_credentialType = a3;
}

- (void)setHasCredentialType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCredentialType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)credentialTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24E78C558[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCredentialType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitWiFiCredentialType_Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitWiFiCredentialType_DefaultPSK")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitWiFiCredentialType_PerClientPSK")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIsAddWithOwnershipProof:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isAddWithOwnershipProof = a3;
}

- (void)setHasIsAddWithOwnershipProof:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsAddWithOwnershipProof
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setIsNetworkRouterAdd:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isNetworkRouterAdd = a3;
}

- (void)setHasIsNetworkRouterAdd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsNetworkRouterAdd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIsNetworkRouterReplace:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isNetworkRouterReplace = a3;
}

- (void)setHasIsNetworkRouterReplace:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsNetworkRouterReplace
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (void)setIsFirstHAPAccessoryInAnyHome:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isFirstHAPAccessoryInAnyHome = a3;
}

- (void)setHasIsFirstHAPAccessoryInAnyHome:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsFirstHAPAccessoryInAnyHome
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setIsFirstHAPAccessoryInHome:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isFirstHAPAccessoryInHome = a3;
}

- (void)setHasIsFirstHAPAccessoryInHome:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsFirstHAPAccessoryInHome
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setIsNoeAccessory:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isNoeAccessory = a3;
}

- (void)setHasIsNoeAccessory:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsNoeAccessory
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setNoeCapabilities:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_noeCapabilities = a3;
}

- (void)setHasNoeCapabilities:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasNoeCapabilities
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNoeStatus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_noeStatus = a3;
}

- (void)setHasNoeStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNoeStatus
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setIsBTOnboard:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isBTOnboard = a3;
}

- (void)setHasIsBTOnboard:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsBTOnboard
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsNoeOnboard:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isNoeOnboard = a3;
}

- (void)setHasIsNoeOnboard:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsNoeOnboard
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setNoeOnboardDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_noeOnboardDuration = a3;
}

- (void)setHasNoeOnboardDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasNoeOnboardDuration
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setNoeOnboardErrorCode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_noeOnboardErrorCode = a3;
}

- (void)setHasNoeOnboardErrorCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($4482CCC1FD1C897B6C698B75BAAF9D78)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasNoeOnboardErrorCode
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasNoeOnboardErrorDomain
{
  return self->_noeOnboardErrorDomain != 0;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AWDHomeKitAccessoryPairing;
  -[AWDHomeKitAccessoryPairing description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitAccessoryPairing dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $4482CCC1FD1C897B6C698B75BAAF9D78 has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t transportType;
  __CFString *v11;
  AWDHomeKitVendorInformation *vendorDetails;
  void *v13;
  $4482CCC1FD1C897B6C698B75BAAF9D78 v14;
  void *v15;
  NSString *appIdentifier;
  $4482CCC1FD1C897B6C698B75BAAF9D78 v17;
  void *v18;
  NSString *noeOnboardErrorDomain;
  NSString *errorDomain;
  uint64_t certified;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t credentialType;
  __CFString *v35;
  void *v36;
  void *v37;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_duration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("duration"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_errorCode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("errorCode"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAdd);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("isAdd"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAddedViaWAC);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("isAddedViaWAC"));

  if ((*(_DWORD *)&self->_has & 0x400) == 0)
    goto LABEL_17;
LABEL_13:
  transportType = self->_transportType;
  if (transportType >= 8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transportType);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_24E78C500[transportType];
  }
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("transportType"));

LABEL_17:
  vendorDetails = self->_vendorDetails;
  if (vendorDetails)
  {
    -[AWDHomeKitVendorInformation dictionaryRepresentation](vendorDetails, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("vendorDetails"));

  }
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 2) != 0)
  {
    certified = self->_certified;
    if (certified >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_certified);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_24E78C540[certified];
    }
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("certified"));

    v14 = self->_has;
    if ((*(_DWORD *)&v14 & 0x200000) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v14 & 0x200) == 0)
        goto LABEL_22;
      goto LABEL_58;
    }
  }
  else if ((*(_DWORD *)&v14 & 0x200000) == 0)
  {
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSecureWAC);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("isSecureWAC"));

  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x200) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v14 & 4) == 0)
      goto LABEL_23;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_retryCount);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("retryCount"));

  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 4) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v14 & 0x1000) == 0)
      goto LABEL_24;
    goto LABEL_63;
  }
LABEL_59:
  credentialType = self->_credentialType;
  if (credentialType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_credentialType);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = off_24E78C558[credentialType];
  }
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("credentialType"));

  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x1000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v14 & 0x20000) == 0)
      goto LABEL_25;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAddWithOwnershipProof);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("isAddWithOwnershipProof"));

  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x20000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v14 & 0x40000) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNetworkRouterAdd);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("isNetworkRouterAdd"));

  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNetworkRouterReplace);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("isNetworkRouterReplace"));

  }
LABEL_27:
  appIdentifier = self->_appIdentifier;
  if (appIdentifier)
    objc_msgSend(v3, "setObject:forKey:", appIdentifier, CFSTR("appIdentifier"));
  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x8000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFirstHAPAccessoryInAnyHome);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("isFirstHAPAccessoryInAnyHome"));

    v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x10000) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v17 & 0x80000) == 0)
        goto LABEL_32;
      goto LABEL_48;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x10000) == 0)
  {
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFirstHAPAccessoryInHome);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("isFirstHAPAccessoryInHome"));

  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x80000) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&v17 & 0x20) == 0)
      goto LABEL_33;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNoeAccessory);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("isNoeAccessory"));

  v17 = self->_has;
  if ((*(_BYTE *)&v17 & 0x20) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v17 & 0x100) == 0)
      goto LABEL_34;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_noeCapabilities);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("noeCapabilities"));

  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x100) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v17 & 0x4000) == 0)
      goto LABEL_35;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_noeStatus);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("noeStatus"));

  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x4000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v17 & 0x100000) == 0)
      goto LABEL_36;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isBTOnboard);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("isBTOnboard"));

  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x100000) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&v17 & 0x40) == 0)
      goto LABEL_37;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNoeOnboard);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("isNoeOnboard"));

  v17 = self->_has;
  if ((*(_BYTE *)&v17 & 0x40) == 0)
  {
LABEL_37:
    if ((*(_BYTE *)&v17 & 0x80) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_noeOnboardDuration);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("noeOnboardDuration"));

  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_38:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_noeOnboardErrorCode);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("noeOnboardErrorCode"));

  }
LABEL_39:
  noeOnboardErrorDomain = self->_noeOnboardErrorDomain;
  if (noeOnboardErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", noeOnboardErrorDomain, CFSTR("noeOnboardErrorDomain"));
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v3, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  AWDHomeKitVendorInformation *v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  char v69;
  unsigned int v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  char v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  char v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  char v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  objc_class *v92;
  uint64_t v93;
  char v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char v99;
  char v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  char v105;
  int v106;
  char v107;
  unsigned int v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  char v112;
  char v113;
  unsigned int v114;
  uint64_t v115;
  unint64_t v116;
  char v117;
  char v118;
  unsigned int v119;
  uint64_t v120;
  unint64_t v121;
  char v122;
  char v123;
  unsigned int v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  char v128;
  char v129;
  unsigned int v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  char v134;
  char v135;
  unsigned int v136;
  uint64_t v137;
  unint64_t v138;
  char v139;
  char v140;
  unsigned int v141;
  uint64_t v142;
  unint64_t v143;
  char v144;
  void *v145;
  uint64_t v146;
  BOOL v147;
  uint64_t v148;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
  {
    v8 = (int *)MEMORY[0x24BE7AF30];
    while (!*((_BYTE *)a3 + *v6))
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        break;
      switch((v11 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_DWORD *)&self->_has |= 1u;
          while (1)
          {
            v21 = *v4;
            v22 = *(_QWORD *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v22);
            *(_QWORD *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_183;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_185;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_183:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_185:
          self->_timestamp = v20;
          goto LABEL_272;
        case 2u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_DWORD *)&self->_has |= 8u;
          while (2)
          {
            v27 = *v4;
            v28 = *(_QWORD *)((char *)a3 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v28);
              *(_QWORD *)((char *)a3 + v27) = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                v15 = v25++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_189;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v26) = 0;
LABEL_189:
          v146 = 32;
          goto LABEL_271;
        case 3u:
          v30 = 0;
          v31 = 0;
          v26 = 0;
          *(_DWORD *)&self->_has |= 0x10u;
          while (2)
          {
            v32 = *v4;
            v33 = *(_QWORD *)((char *)a3 + v32);
            if (v33 == -1 || v33 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v33);
              *(_QWORD *)((char *)a3 + v32) = v33 + 1;
              v26 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                v15 = v31++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_193;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v26) = 0;
LABEL_193:
          v146 = 36;
          goto LABEL_271;
        case 4u:
          v35 = 0;
          v36 = 0;
          v37 = 0;
          *(_DWORD *)&self->_has |= 0x800u;
          while (2)
          {
            v38 = *v4;
            v39 = *(_QWORD *)((char *)a3 + v38);
            if (v39 == -1 || v39 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v39);
              *(_QWORD *)((char *)a3 + v38) = v39 + 1;
              v37 |= (unint64_t)(v40 & 0x7F) << v35;
              if (v40 < 0)
              {
                v35 += 7;
                v15 = v36++ >= 9;
                if (v15)
                {
                  v37 = 0;
                  goto LABEL_197;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v37 = 0;
LABEL_197:
          v147 = v37 != 0;
          v148 = 96;
          goto LABEL_262;
        case 5u:
          v41 = 0;
          v42 = 0;
          v43 = 0;
          *(_DWORD *)&self->_has |= 0x2000u;
          while (2)
          {
            v44 = *v4;
            v45 = *(_QWORD *)((char *)a3 + v44);
            if (v45 == -1 || v45 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v46 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v45);
              *(_QWORD *)((char *)a3 + v44) = v45 + 1;
              v43 |= (unint64_t)(v46 & 0x7F) << v41;
              if (v46 < 0)
              {
                v41 += 7;
                v15 = v42++ >= 9;
                if (v15)
                {
                  v43 = 0;
                  goto LABEL_201;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v43 = 0;
LABEL_201:
          v147 = v43 != 0;
          v148 = 98;
          goto LABEL_262;
        case 6u:
          v47 = 0;
          v48 = 0;
          v26 = 0;
          *(_DWORD *)&self->_has |= 0x400u;
          while (2)
          {
            v49 = *v4;
            v50 = *(_QWORD *)((char *)a3 + v49);
            if (v50 == -1 || v50 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v51 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v50);
              *(_QWORD *)((char *)a3 + v49) = v50 + 1;
              v26 |= (unint64_t)(v51 & 0x7F) << v47;
              if (v51 < 0)
              {
                v47 += 7;
                v15 = v48++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_205;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v26) = 0;
LABEL_205:
          v146 = 80;
          goto LABEL_271;
        case 7u:
          v52 = objc_alloc_init(AWDHomeKitVendorInformation);
          objc_storeStrong((id *)&self->_vendorDetails, v52);
          if (!PBReaderPlaceMark() || !AWDHomeKitVendorInformationReadFrom((uint64_t)v52, (uint64_t)a3))
          {

            LOBYTE(v106) = 0;
            return v106;
          }
          PBReaderRecallMark();

LABEL_272:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_273;
          break;
        case 8u:
          v53 = 0;
          v54 = 0;
          v26 = 0;
          *(_DWORD *)&self->_has |= 2u;
          while (2)
          {
            v55 = *v4;
            v56 = *(_QWORD *)((char *)a3 + v55);
            if (v56 == -1 || v56 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v57 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v56);
              *(_QWORD *)((char *)a3 + v55) = v56 + 1;
              v26 |= (unint64_t)(v57 & 0x7F) << v53;
              if (v57 < 0)
              {
                v53 += 7;
                v15 = v54++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_209;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v26) = 0;
LABEL_209:
          v146 = 24;
          goto LABEL_271;
        case 9u:
          v58 = 0;
          v59 = 0;
          v60 = 0;
          *(_DWORD *)&self->_has |= 0x200000u;
          while (2)
          {
            v61 = *v4;
            v62 = *(_QWORD *)((char *)a3 + v61);
            if (v62 == -1 || v62 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v63 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v62);
              *(_QWORD *)((char *)a3 + v61) = v62 + 1;
              v60 |= (unint64_t)(v63 & 0x7F) << v58;
              if (v63 < 0)
              {
                v58 += 7;
                v15 = v59++ >= 9;
                if (v15)
                {
                  v60 = 0;
                  goto LABEL_213;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v60 = 0;
LABEL_213:
          v147 = v60 != 0;
          v148 = 106;
          goto LABEL_262;
        case 0xAu:
          v64 = 0;
          v65 = 0;
          v26 = 0;
          *(_DWORD *)&self->_has |= 0x200u;
          while (2)
          {
            v66 = *v4;
            v67 = *(_QWORD *)((char *)a3 + v66);
            if (v67 == -1 || v67 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v68 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v67);
              *(_QWORD *)((char *)a3 + v66) = v67 + 1;
              v26 |= (unint64_t)(v68 & 0x7F) << v64;
              if (v68 < 0)
              {
                v64 += 7;
                v15 = v65++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_217;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v26) = 0;
LABEL_217:
          v146 = 76;
          goto LABEL_271;
        case 0xBu:
          v69 = 0;
          v70 = 0;
          v26 = 0;
          *(_DWORD *)&self->_has |= 4u;
          while (2)
          {
            v71 = *v4;
            v72 = *(_QWORD *)((char *)a3 + v71);
            if (v72 == -1 || v72 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v73 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v72);
              *(_QWORD *)((char *)a3 + v71) = v72 + 1;
              v26 |= (unint64_t)(v73 & 0x7F) << v69;
              if (v73 < 0)
              {
                v69 += 7;
                v15 = v70++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_221;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v26) = 0;
LABEL_221:
          v146 = 28;
          goto LABEL_271;
        case 0xCu:
          v74 = 0;
          v75 = 0;
          v76 = 0;
          *(_DWORD *)&self->_has |= 0x1000u;
          while (2)
          {
            v77 = *v4;
            v78 = *(_QWORD *)((char *)a3 + v77);
            if (v78 == -1 || v78 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v79 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v78);
              *(_QWORD *)((char *)a3 + v77) = v78 + 1;
              v76 |= (unint64_t)(v79 & 0x7F) << v74;
              if (v79 < 0)
              {
                v74 += 7;
                v15 = v75++ >= 9;
                if (v15)
                {
                  v76 = 0;
                  goto LABEL_225;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v76 = 0;
LABEL_225:
          v147 = v76 != 0;
          v148 = 97;
          goto LABEL_262;
        case 0xDu:
          v80 = 0;
          v81 = 0;
          v82 = 0;
          *(_DWORD *)&self->_has |= 0x20000u;
          while (2)
          {
            v83 = *v4;
            v84 = *(_QWORD *)((char *)a3 + v83);
            if (v84 == -1 || v84 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v85 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v84);
              *(_QWORD *)((char *)a3 + v83) = v84 + 1;
              v82 |= (unint64_t)(v85 & 0x7F) << v80;
              if (v85 < 0)
              {
                v80 += 7;
                v15 = v81++ >= 9;
                if (v15)
                {
                  v82 = 0;
                  goto LABEL_229;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v82 = 0;
LABEL_229:
          v147 = v82 != 0;
          v148 = 102;
          goto LABEL_262;
        case 0xEu:
          v86 = 0;
          v87 = 0;
          v88 = 0;
          *(_DWORD *)&self->_has |= 0x40000u;
          while (2)
          {
            v89 = *v4;
            v90 = *(_QWORD *)((char *)a3 + v89);
            if (v90 == -1 || v90 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v91 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v90);
              *(_QWORD *)((char *)a3 + v89) = v90 + 1;
              v88 |= (unint64_t)(v91 & 0x7F) << v86;
              if (v91 < 0)
              {
                v86 += 7;
                v15 = v87++ >= 9;
                if (v15)
                {
                  v88 = 0;
                  goto LABEL_233;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v88 = 0;
LABEL_233:
          v147 = v88 != 0;
          v148 = 103;
          goto LABEL_262;
        case 0xFu:
          PBReaderReadString();
          v92 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v93 = 16;
          goto LABEL_181;
        case 0x10u:
          v94 = 0;
          v95 = 0;
          v96 = 0;
          *(_DWORD *)&self->_has |= 0x8000u;
          while (2)
          {
            v97 = *v4;
            v98 = *(_QWORD *)((char *)a3 + v97);
            if (v98 == -1 || v98 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v99 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v98);
              *(_QWORD *)((char *)a3 + v97) = v98 + 1;
              v96 |= (unint64_t)(v99 & 0x7F) << v94;
              if (v99 < 0)
              {
                v94 += 7;
                v15 = v95++ >= 9;
                if (v15)
                {
                  v96 = 0;
                  goto LABEL_237;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v96 = 0;
LABEL_237:
          v147 = v96 != 0;
          v148 = 100;
          goto LABEL_262;
        case 0x11u:
          v100 = 0;
          v101 = 0;
          v102 = 0;
          *(_DWORD *)&self->_has |= 0x10000u;
          while (2)
          {
            v103 = *v4;
            v104 = *(_QWORD *)((char *)a3 + v103);
            if (v104 == -1 || v104 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v105 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v104);
              *(_QWORD *)((char *)a3 + v103) = v104 + 1;
              v102 |= (unint64_t)(v105 & 0x7F) << v100;
              if (v105 < 0)
              {
                v100 += 7;
                v15 = v101++ >= 9;
                if (v15)
                {
                  v102 = 0;
                  goto LABEL_241;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v102 = 0;
LABEL_241:
          v147 = v102 != 0;
          v148 = 101;
          goto LABEL_262;
        case 0x15u:
          v107 = 0;
          v108 = 0;
          v109 = 0;
          *(_DWORD *)&self->_has |= 0x80000u;
          while (2)
          {
            v110 = *v4;
            v111 = *(_QWORD *)((char *)a3 + v110);
            if (v111 == -1 || v111 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v112 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v111);
              *(_QWORD *)((char *)a3 + v110) = v111 + 1;
              v109 |= (unint64_t)(v112 & 0x7F) << v107;
              if (v112 < 0)
              {
                v107 += 7;
                v15 = v108++ >= 9;
                if (v15)
                {
                  v109 = 0;
                  goto LABEL_245;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v109 = 0;
LABEL_245:
          v147 = v109 != 0;
          v148 = 104;
          goto LABEL_262;
        case 0x16u:
          v113 = 0;
          v114 = 0;
          v26 = 0;
          *(_DWORD *)&self->_has |= 0x20u;
          while (2)
          {
            v115 = *v4;
            v116 = *(_QWORD *)((char *)a3 + v115);
            if (v116 == -1 || v116 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v117 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v116);
              *(_QWORD *)((char *)a3 + v115) = v116 + 1;
              v26 |= (unint64_t)(v117 & 0x7F) << v113;
              if (v117 < 0)
              {
                v113 += 7;
                v15 = v114++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_249;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v26) = 0;
LABEL_249:
          v146 = 48;
          goto LABEL_271;
        case 0x17u:
          v118 = 0;
          v119 = 0;
          v26 = 0;
          *(_DWORD *)&self->_has |= 0x100u;
          while (2)
          {
            v120 = *v4;
            v121 = *(_QWORD *)((char *)a3 + v120);
            if (v121 == -1 || v121 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v122 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v121);
              *(_QWORD *)((char *)a3 + v120) = v121 + 1;
              v26 |= (unint64_t)(v122 & 0x7F) << v118;
              if (v122 < 0)
              {
                v118 += 7;
                v15 = v119++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_253;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v26) = 0;
LABEL_253:
          v146 = 72;
          goto LABEL_271;
        case 0x18u:
          v123 = 0;
          v124 = 0;
          v125 = 0;
          *(_DWORD *)&self->_has |= 0x4000u;
          while (2)
          {
            v126 = *v4;
            v127 = *(_QWORD *)((char *)a3 + v126);
            if (v127 == -1 || v127 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v128 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v127);
              *(_QWORD *)((char *)a3 + v126) = v127 + 1;
              v125 |= (unint64_t)(v128 & 0x7F) << v123;
              if (v128 < 0)
              {
                v123 += 7;
                v15 = v124++ >= 9;
                if (v15)
                {
                  v125 = 0;
                  goto LABEL_257;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v125 = 0;
LABEL_257:
          v147 = v125 != 0;
          v148 = 99;
          goto LABEL_262;
        case 0x19u:
          v129 = 0;
          v130 = 0;
          v131 = 0;
          *(_DWORD *)&self->_has |= 0x100000u;
          while (2)
          {
            v132 = *v4;
            v133 = *(_QWORD *)((char *)a3 + v132);
            if (v133 == -1 || v133 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v134 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v133);
              *(_QWORD *)((char *)a3 + v132) = v133 + 1;
              v131 |= (unint64_t)(v134 & 0x7F) << v129;
              if (v134 < 0)
              {
                v129 += 7;
                v15 = v130++ >= 9;
                if (v15)
                {
                  v131 = 0;
                  goto LABEL_261;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v131 = 0;
LABEL_261:
          v147 = v131 != 0;
          v148 = 105;
LABEL_262:
          *((_BYTE *)&self->super.super.isa + v148) = v147;
          goto LABEL_272;
        case 0x1Au:
          v135 = 0;
          v136 = 0;
          v26 = 0;
          *(_DWORD *)&self->_has |= 0x40u;
          while (2)
          {
            v137 = *v4;
            v138 = *(_QWORD *)((char *)a3 + v137);
            if (v138 == -1 || v138 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v139 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v138);
              *(_QWORD *)((char *)a3 + v137) = v138 + 1;
              v26 |= (unint64_t)(v139 & 0x7F) << v135;
              if (v139 < 0)
              {
                v135 += 7;
                v15 = v136++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_266;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v26) = 0;
LABEL_266:
          v146 = 52;
          goto LABEL_271;
        case 0x1Bu:
          v140 = 0;
          v141 = 0;
          v26 = 0;
          *(_DWORD *)&self->_has |= 0x80u;
          while (2)
          {
            v142 = *v4;
            v143 = *(_QWORD *)((char *)a3 + v142);
            if (v143 == -1 || v143 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v144 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v143);
              *(_QWORD *)((char *)a3 + v142) = v143 + 1;
              v26 |= (unint64_t)(v144 & 0x7F) << v140;
              if (v144 < 0)
              {
                v140 += 7;
                v15 = v141++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_270;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v26) = 0;
LABEL_270:
          v146 = 56;
LABEL_271:
          *(_DWORD *)((char *)&self->super.super.isa + v146) = v26;
          goto LABEL_272;
        case 0x1Cu:
          PBReaderReadString();
          v92 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v93 = 64;
          goto LABEL_181;
        case 0x1Du:
          PBReaderReadString();
          v92 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v93 = 40;
LABEL_181:
          v145 = *(Class *)((char *)&self->super.super.isa + v93);
          *(Class *)((char *)&self->super.super.isa + v93) = v92;

          goto LABEL_272;
        default:
          v106 = PBReaderSkipValueWithTag();
          if (!v106)
            return v106;
          goto LABEL_272;
      }
    }
  }
LABEL_273:
  LOBYTE(v106) = *((_BYTE *)a3 + *v6) == 0;
  return v106;
}

- (void)writeTo:(id)a3
{
  id v4;
  $4482CCC1FD1C897B6C698B75BAAF9D78 has;
  $4482CCC1FD1C897B6C698B75BAAF9D78 v6;
  $4482CCC1FD1C897B6C698B75BAAF9D78 v7;
  id v8;

  v4 = a3;
  has = self->_has;
  v8 = v4;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v8;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  v4 = v8;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  v4 = v8;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_39:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v8;
  }
LABEL_8:
  if (self->_vendorDetails)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v8;
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
    {
LABEL_12:
      if ((*(_WORD *)&v6 & 0x200) == 0)
        goto LABEL_13;
      goto LABEL_43;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  v4 = v8;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v6 & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v6 & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_46:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_17:
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
LABEL_18:
  if (self->_appIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
    v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x10000) == 0)
    {
LABEL_22:
      if ((*(_DWORD *)&v7 & 0x80000) == 0)
        goto LABEL_23;
      goto LABEL_50;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
    goto LABEL_22;
  }
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v7 & 0x20) == 0)
      goto LABEL_24;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v7 & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v7 & 0x4000) == 0)
      goto LABEL_26;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v7 & 0x100000) == 0)
      goto LABEL_27;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v7 & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v7 & 0x80) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_29:
    PBDataWriterWriteInt32Field();
    v4 = v8;
  }
LABEL_30:
  if (self->_noeOnboardErrorDomain)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $4482CCC1FD1C897B6C698B75BAAF9D78 has;
  $4482CCC1FD1C897B6C698B75BAAF9D78 v6;
  $4482CCC1FD1C897B6C698B75BAAF9D78 v7;
  _QWORD *v8;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 27) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 8) = self->_duration;
  *((_DWORD *)v4 + 27) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 9) = self->_errorCode;
  *((_DWORD *)v4 + 27) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_39;
  }
LABEL_38:
  *((_BYTE *)v4 + 96) = self->_isAdd;
  *((_DWORD *)v4 + 27) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_39:
  *((_BYTE *)v4 + 98) = self->_isAddedViaWAC;
  *((_DWORD *)v4 + 27) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 20) = self->_transportType;
    *((_DWORD *)v4 + 27) |= 0x400u;
  }
LABEL_8:
  v8 = v4;
  if (self->_vendorDetails)
  {
    objc_msgSend(v4, "setVendorDetails:");
    v4 = v8;
  }
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_certified;
    *((_DWORD *)v4 + 27) |= 2u;
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
    {
LABEL_12:
      if ((*(_WORD *)&v6 & 0x200) == 0)
        goto LABEL_13;
      goto LABEL_43;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
    goto LABEL_12;
  }
  *((_BYTE *)v4 + 106) = self->_isSecureWAC;
  *((_DWORD *)v4 + 27) |= 0x200000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 19) = self->_retryCount;
  *((_DWORD *)v4 + 27) |= 0x200u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 7) = self->_credentialType;
  *((_DWORD *)v4 + 27) |= 4u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v6 & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  *((_BYTE *)v4 + 97) = self->_isAddWithOwnershipProof;
  *((_DWORD *)v4 + 27) |= 0x1000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v6 & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_46:
  *((_BYTE *)v4 + 102) = self->_isNetworkRouterAdd;
  *((_DWORD *)v4 + 27) |= 0x20000u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_17:
    *((_BYTE *)v4 + 103) = self->_isNetworkRouterReplace;
    *((_DWORD *)v4 + 27) |= 0x40000u;
  }
LABEL_18:
  if (self->_appIdentifier)
  {
    objc_msgSend(v8, "setAppIdentifier:");
    v4 = v8;
  }
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) != 0)
  {
    *((_BYTE *)v4 + 100) = self->_isFirstHAPAccessoryInAnyHome;
    *((_DWORD *)v4 + 27) |= 0x8000u;
    v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x10000) == 0)
    {
LABEL_22:
      if ((*(_DWORD *)&v7 & 0x80000) == 0)
        goto LABEL_23;
      goto LABEL_50;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
    goto LABEL_22;
  }
  *((_BYTE *)v4 + 101) = self->_isFirstHAPAccessoryInHome;
  *((_DWORD *)v4 + 27) |= 0x10000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v7 & 0x20) == 0)
      goto LABEL_24;
    goto LABEL_51;
  }
LABEL_50:
  *((_BYTE *)v4 + 104) = self->_isNoeAccessory;
  *((_DWORD *)v4 + 27) |= 0x80000u;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v7 & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 12) = self->_noeCapabilities;
  *((_DWORD *)v4 + 27) |= 0x20u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v7 & 0x4000) == 0)
      goto LABEL_26;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 18) = self->_noeStatus;
  *((_DWORD *)v4 + 27) |= 0x100u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v7 & 0x100000) == 0)
      goto LABEL_27;
    goto LABEL_54;
  }
LABEL_53:
  *((_BYTE *)v4 + 99) = self->_isBTOnboard;
  *((_DWORD *)v4 + 27) |= 0x4000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v7 & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_54:
  *((_BYTE *)v4 + 105) = self->_isNoeOnboard;
  *((_DWORD *)v4 + 27) |= 0x100000u;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v7 & 0x80) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_55:
  *((_DWORD *)v4 + 13) = self->_noeOnboardDuration;
  *((_DWORD *)v4 + 27) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_29:
    *((_DWORD *)v4 + 14) = self->_noeOnboardErrorCode;
    *((_DWORD *)v4 + 27) |= 0x80u;
  }
LABEL_30:
  if (self->_noeOnboardErrorDomain)
  {
    objc_msgSend(v8, "setNoeOnboardErrorDomain:");
    v4 = v8;
  }
  if (self->_errorDomain)
  {
    objc_msgSend(v8, "setErrorDomain:");
    v4 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $4482CCC1FD1C897B6C698B75BAAF9D78 has;
  id v8;
  void *v9;
  $4482CCC1FD1C897B6C698B75BAAF9D78 v10;
  uint64_t v11;
  void *v12;
  $4482CCC1FD1C897B6C698B75BAAF9D78 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 108) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 32) = self->_duration;
  *(_DWORD *)(v5 + 108) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 36) = self->_errorCode;
  *(_DWORD *)(v5 + 108) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  *(_BYTE *)(v5 + 96) = self->_isAdd;
  *(_DWORD *)(v5 + 108) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_31:
  *(_BYTE *)(v5 + 98) = self->_isAddedViaWAC;
  *(_DWORD *)(v5 + 108) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    *(_DWORD *)(v5 + 80) = self->_transportType;
    *(_DWORD *)(v5 + 108) |= 0x400u;
  }
LABEL_8:
  v8 = -[AWDHomeKitVendorInformation copyWithZone:](self->_vendorDetails, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v8;

  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_certified;
    *(_DWORD *)(v6 + 108) |= 2u;
    v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x200000) == 0)
    {
LABEL_10:
      if ((*(_WORD *)&v10 & 0x200) == 0)
        goto LABEL_11;
      goto LABEL_35;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x200000) == 0)
  {
    goto LABEL_10;
  }
  *(_BYTE *)(v6 + 106) = self->_isSecureWAC;
  *(_DWORD *)(v6 + 108) |= 0x200000u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x200) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&v10 & 4) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v6 + 76) = self->_retryCount;
  *(_DWORD *)(v6 + 108) |= 0x200u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 4) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v10 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v6 + 28) = self->_credentialType;
  *(_DWORD *)(v6 + 108) |= 4u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v10 & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  *(_BYTE *)(v6 + 97) = self->_isAddWithOwnershipProof;
  *(_DWORD *)(v6 + 108) |= 0x1000u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v10 & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_38:
  *(_BYTE *)(v6 + 102) = self->_isNetworkRouterAdd;
  *(_DWORD *)(v6 + 108) |= 0x20000u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_15:
    *(_BYTE *)(v6 + 103) = self->_isNetworkRouterReplace;
    *(_DWORD *)(v6 + 108) |= 0x40000u;
  }
LABEL_16:
  v11 = -[NSString copyWithZone:](self->_appIdentifier, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v11;

  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) != 0)
  {
    *(_BYTE *)(v6 + 100) = self->_isFirstHAPAccessoryInAnyHome;
    *(_DWORD *)(v6 + 108) |= 0x8000u;
    v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x10000) == 0)
    {
LABEL_18:
      if ((*(_DWORD *)&v13 & 0x80000) == 0)
        goto LABEL_19;
      goto LABEL_42;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x10000) == 0)
  {
    goto LABEL_18;
  }
  *(_BYTE *)(v6 + 101) = self->_isFirstHAPAccessoryInHome;
  *(_DWORD *)(v6 + 108) |= 0x10000u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v13 & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  *(_BYTE *)(v6 + 104) = self->_isNoeAccessory;
  *(_DWORD *)(v6 + 108) |= 0x80000u;
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x20) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v13 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v6 + 48) = self->_noeCapabilities;
  *(_DWORD *)(v6 + 108) |= 0x20u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v13 & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v6 + 72) = self->_noeStatus;
  *(_DWORD *)(v6 + 108) |= 0x100u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v13 & 0x100000) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  *(_BYTE *)(v6 + 99) = self->_isBTOnboard;
  *(_DWORD *)(v6 + 108) |= 0x4000u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x100000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v13 & 0x40) == 0)
      goto LABEL_24;
LABEL_47:
    *(_DWORD *)(v6 + 52) = self->_noeOnboardDuration;
    *(_DWORD *)(v6 + 108) |= 0x40u;
    if ((*(_DWORD *)&self->_has & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_46:
  *(_BYTE *)(v6 + 105) = self->_isNoeOnboard;
  *(_DWORD *)(v6 + 108) |= 0x100000u;
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x40) != 0)
    goto LABEL_47;
LABEL_24:
  if ((*(_BYTE *)&v13 & 0x80) != 0)
  {
LABEL_25:
    *(_DWORD *)(v6 + 56) = self->_noeOnboardErrorCode;
    *(_DWORD *)(v6 + 108) |= 0x80u;
  }
LABEL_26:
  v14 = -[NSString copyWithZone:](self->_noeOnboardErrorDomain, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v14;

  v16 = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v16;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $4482CCC1FD1C897B6C698B75BAAF9D78 has;
  int v6;
  AWDHomeKitVendorInformation *vendorDetails;
  NSString *appIdentifier;
  NSString *noeOnboardErrorDomain;
  NSString *errorDomain;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_155;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 27);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_155;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_duration != *((_DWORD *)v4 + 8))
      goto LABEL_155;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_errorCode != *((_DWORD *)v4 + 9))
      goto LABEL_155;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0)
      goto LABEL_155;
    if (self->_isAdd)
    {
      if (!*((_BYTE *)v4 + 96))
        goto LABEL_155;
    }
    else if (*((_BYTE *)v4 + 96))
    {
      goto LABEL_155;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0)
      goto LABEL_155;
    if (self->_isAddedViaWAC)
    {
      if (!*((_BYTE *)v4 + 98))
        goto LABEL_155;
    }
    else if (*((_BYTE *)v4 + 98))
    {
      goto LABEL_155;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_transportType != *((_DWORD *)v4 + 20))
      goto LABEL_155;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_155;
  }
  vendorDetails = self->_vendorDetails;
  if ((unint64_t)vendorDetails | *((_QWORD *)v4 + 11))
  {
    if (!-[AWDHomeKitVendorInformation isEqual:](vendorDetails, "isEqual:"))
      goto LABEL_155;
    has = self->_has;
    v6 = *((_DWORD *)v4 + 27);
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_certified != *((_DWORD *)v4 + 6))
      goto LABEL_155;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0)
      goto LABEL_155;
    if (self->_isSecureWAC)
    {
      if (!*((_BYTE *)v4 + 106))
        goto LABEL_155;
    }
    else if (*((_BYTE *)v4 + 106))
    {
      goto LABEL_155;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_retryCount != *((_DWORD *)v4 + 19))
      goto LABEL_155;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_credentialType != *((_DWORD *)v4 + 7))
      goto LABEL_155;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0)
      goto LABEL_155;
    if (self->_isAddWithOwnershipProof)
    {
      if (!*((_BYTE *)v4 + 97))
        goto LABEL_155;
    }
    else if (*((_BYTE *)v4 + 97))
    {
      goto LABEL_155;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0)
      goto LABEL_155;
    if (self->_isNetworkRouterAdd)
    {
      if (!*((_BYTE *)v4 + 102))
        goto LABEL_155;
    }
    else if (*((_BYTE *)v4 + 102))
    {
      goto LABEL_155;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0)
      goto LABEL_155;
    if (self->_isNetworkRouterReplace)
    {
      if (!*((_BYTE *)v4 + 103))
        goto LABEL_155;
    }
    else if (*((_BYTE *)v4 + 103))
    {
      goto LABEL_155;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_155;
  }
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](appIdentifier, "isEqual:"))
      goto LABEL_155;
    has = self->_has;
    v6 = *((_DWORD *)v4 + 27);
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0)
      goto LABEL_155;
    if (self->_isFirstHAPAccessoryInAnyHome)
    {
      if (!*((_BYTE *)v4 + 100))
        goto LABEL_155;
    }
    else if (*((_BYTE *)v4 + 100))
    {
      goto LABEL_155;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0)
      goto LABEL_155;
    if (self->_isFirstHAPAccessoryInHome)
    {
      if (!*((_BYTE *)v4 + 101))
        goto LABEL_155;
    }
    else if (*((_BYTE *)v4 + 101))
    {
      goto LABEL_155;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0)
      goto LABEL_155;
    if (self->_isNoeAccessory)
    {
      if (!*((_BYTE *)v4 + 104))
        goto LABEL_155;
    }
    else if (*((_BYTE *)v4 + 104))
    {
      goto LABEL_155;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_noeCapabilities != *((_DWORD *)v4 + 12))
      goto LABEL_155;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_noeStatus != *((_DWORD *)v4 + 18))
      goto LABEL_155;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0)
      goto LABEL_155;
    if (self->_isBTOnboard)
    {
      if (!*((_BYTE *)v4 + 99))
        goto LABEL_155;
    }
    else if (*((_BYTE *)v4 + 99))
    {
      goto LABEL_155;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) != 0)
    {
      if (self->_isNoeOnboard)
      {
        if (!*((_BYTE *)v4 + 105))
          goto LABEL_155;
        goto LABEL_141;
      }
      if (!*((_BYTE *)v4 + 105))
        goto LABEL_141;
    }
LABEL_155:
    v11 = 0;
    goto LABEL_156;
  }
  if ((v6 & 0x100000) != 0)
    goto LABEL_155;
LABEL_141:
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_noeOnboardDuration != *((_DWORD *)v4 + 13))
      goto LABEL_155;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_155;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_noeOnboardErrorCode != *((_DWORD *)v4 + 14))
      goto LABEL_155;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_155;
  }
  noeOnboardErrorDomain = self->_noeOnboardErrorDomain;
  if ((unint64_t)noeOnboardErrorDomain | *((_QWORD *)v4 + 8)
    && !-[NSString isEqual:](noeOnboardErrorDomain, "isEqual:"))
  {
    goto LABEL_155;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((_QWORD *)v4 + 5))
    v11 = -[NSString isEqual:](errorDomain, "isEqual:");
  else
    v11 = 1;
LABEL_156:

  return v11;
}

- (unint64_t)hash
{
  $4482CCC1FD1C897B6C698B75BAAF9D78 has;
  $4482CCC1FD1C897B6C698B75BAAF9D78 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  $4482CCC1FD1C897B6C698B75BAAF9D78 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  NSUInteger v24;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v32 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&has & 8) != 0)
    {
LABEL_3:
      v31 = 2654435761 * self->_duration;
      if ((*(_BYTE *)&has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_3;
  }
  v31 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_4:
    v30 = 2654435761 * self->_errorCode;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v30 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_5:
    v29 = 2654435761 * self->_isAdd;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_6;
LABEL_12:
    v28 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v29 = 0;
  if ((*(_WORD *)&has & 0x2000) == 0)
    goto LABEL_12;
LABEL_6:
  v28 = 2654435761 * self->_isAddedViaWAC;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_7:
    v27 = 2654435761 * self->_transportType;
    goto LABEL_14;
  }
LABEL_13:
  v27 = 0;
LABEL_14:
  v26 = -[AWDHomeKitVendorInformation hash](self->_vendorDetails, "hash");
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 2) != 0)
  {
    v5 = 2654435761 * self->_certified;
    if ((*(_DWORD *)&v4 & 0x200000) != 0)
    {
LABEL_16:
      v6 = 2654435761 * self->_isSecureWAC;
      if ((*(_WORD *)&v4 & 0x200) != 0)
        goto LABEL_17;
      goto LABEL_24;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_DWORD *)&v4 & 0x200000) != 0)
      goto LABEL_16;
  }
  v6 = 0;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_17:
    v7 = 2654435761 * self->_retryCount;
    if ((*(_BYTE *)&v4 & 4) != 0)
      goto LABEL_18;
    goto LABEL_25;
  }
LABEL_24:
  v7 = 0;
  if ((*(_BYTE *)&v4 & 4) != 0)
  {
LABEL_18:
    v8 = 2654435761 * self->_credentialType;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
      goto LABEL_19;
    goto LABEL_26;
  }
LABEL_25:
  v8 = 0;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_19:
    v9 = 2654435761 * self->_isAddWithOwnershipProof;
    if ((*(_DWORD *)&v4 & 0x20000) != 0)
      goto LABEL_20;
LABEL_27:
    v10 = 0;
    if ((*(_DWORD *)&v4 & 0x40000) != 0)
      goto LABEL_21;
    goto LABEL_28;
  }
LABEL_26:
  v9 = 0;
  if ((*(_DWORD *)&v4 & 0x20000) == 0)
    goto LABEL_27;
LABEL_20:
  v10 = 2654435761 * self->_isNetworkRouterAdd;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_21:
    v11 = 2654435761 * self->_isNetworkRouterReplace;
    goto LABEL_29;
  }
LABEL_28:
  v11 = 0;
LABEL_29:
  v12 = -[NSString hash](self->_appIdentifier, "hash");
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) != 0)
  {
    v14 = 2654435761 * self->_isFirstHAPAccessoryInAnyHome;
    if ((*(_DWORD *)&v13 & 0x10000) != 0)
    {
LABEL_31:
      v15 = 2654435761 * self->_isFirstHAPAccessoryInHome;
      if ((*(_DWORD *)&v13 & 0x80000) != 0)
        goto LABEL_32;
      goto LABEL_41;
    }
  }
  else
  {
    v14 = 0;
    if ((*(_DWORD *)&v13 & 0x10000) != 0)
      goto LABEL_31;
  }
  v15 = 0;
  if ((*(_DWORD *)&v13 & 0x80000) != 0)
  {
LABEL_32:
    v16 = 2654435761 * self->_isNoeAccessory;
    if ((*(_BYTE *)&v13 & 0x20) != 0)
      goto LABEL_33;
    goto LABEL_42;
  }
LABEL_41:
  v16 = 0;
  if ((*(_BYTE *)&v13 & 0x20) != 0)
  {
LABEL_33:
    v17 = 2654435761 * self->_noeCapabilities;
    if ((*(_WORD *)&v13 & 0x100) != 0)
      goto LABEL_34;
    goto LABEL_43;
  }
LABEL_42:
  v17 = 0;
  if ((*(_WORD *)&v13 & 0x100) != 0)
  {
LABEL_34:
    v18 = 2654435761 * self->_noeStatus;
    if ((*(_WORD *)&v13 & 0x4000) != 0)
      goto LABEL_35;
    goto LABEL_44;
  }
LABEL_43:
  v18 = 0;
  if ((*(_WORD *)&v13 & 0x4000) != 0)
  {
LABEL_35:
    v19 = 2654435761 * self->_isBTOnboard;
    if ((*(_DWORD *)&v13 & 0x100000) != 0)
      goto LABEL_36;
    goto LABEL_45;
  }
LABEL_44:
  v19 = 0;
  if ((*(_DWORD *)&v13 & 0x100000) != 0)
  {
LABEL_36:
    v20 = 2654435761 * self->_isNoeOnboard;
    if ((*(_BYTE *)&v13 & 0x40) != 0)
      goto LABEL_37;
LABEL_46:
    v21 = 0;
    if ((*(_BYTE *)&v13 & 0x80) != 0)
      goto LABEL_38;
LABEL_47:
    v22 = 0;
    goto LABEL_48;
  }
LABEL_45:
  v20 = 0;
  if ((*(_BYTE *)&v13 & 0x40) == 0)
    goto LABEL_46;
LABEL_37:
  v21 = 2654435761 * self->_noeOnboardDuration;
  if ((*(_BYTE *)&v13 & 0x80) == 0)
    goto LABEL_47;
LABEL_38:
  v22 = 2654435761 * self->_noeOnboardErrorCode;
LABEL_48:
  v23 = v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v26 ^ v12 ^ v14;
  v24 = v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ -[NSString hash](self->_noeOnboardErrorDomain, "hash");
  return v23 ^ v24 ^ -[NSString hash](self->_errorDomain, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  int v6;
  AWDHomeKitVendorInformation *vendorDetails;
  uint64_t v8;
  int v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = v4;
  v6 = *((_DWORD *)v4 + 27);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v6 = *((_DWORD *)v4 + 27);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 8u;
  v6 = *((_DWORD *)v4 + 27);
  if ((v6 & 0x10) == 0)
  {
LABEL_4:
    if ((v6 & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_errorCode = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x10u;
  v6 = *((_DWORD *)v4 + 27);
  if ((v6 & 0x800) == 0)
  {
LABEL_5:
    if ((v6 & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  self->_isAdd = *((_BYTE *)v4 + 96);
  *(_DWORD *)&self->_has |= 0x800u;
  v6 = *((_DWORD *)v4 + 27);
  if ((v6 & 0x2000) == 0)
  {
LABEL_6:
    if ((v6 & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  self->_isAddedViaWAC = *((_BYTE *)v4 + 98);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v4 + 27) & 0x400) != 0)
  {
LABEL_7:
    self->_transportType = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_8:
  vendorDetails = self->_vendorDetails;
  v8 = *((_QWORD *)v5 + 11);
  v11 = v5;
  if (vendorDetails)
  {
    if (!v8)
      goto LABEL_20;
    -[AWDHomeKitVendorInformation mergeFrom:](vendorDetails, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_20;
    -[AWDHomeKitAccessoryPairing setVendorDetails:](self, "setVendorDetails:");
  }
  v5 = v11;
LABEL_20:
  v9 = *((_DWORD *)v5 + 27);
  if ((v9 & 2) != 0)
  {
    self->_certified = *((_DWORD *)v5 + 6);
    *(_DWORD *)&self->_has |= 2u;
    v9 = *((_DWORD *)v5 + 27);
    if ((v9 & 0x200000) == 0)
    {
LABEL_22:
      if ((v9 & 0x200) == 0)
        goto LABEL_23;
      goto LABEL_47;
    }
  }
  else if ((v9 & 0x200000) == 0)
  {
    goto LABEL_22;
  }
  self->_isSecureWAC = *((_BYTE *)v5 + 106);
  *(_DWORD *)&self->_has |= 0x200000u;
  v9 = *((_DWORD *)v5 + 27);
  if ((v9 & 0x200) == 0)
  {
LABEL_23:
    if ((v9 & 4) == 0)
      goto LABEL_24;
    goto LABEL_48;
  }
LABEL_47:
  self->_retryCount = *((_DWORD *)v5 + 19);
  *(_DWORD *)&self->_has |= 0x200u;
  v9 = *((_DWORD *)v5 + 27);
  if ((v9 & 4) == 0)
  {
LABEL_24:
    if ((v9 & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_49;
  }
LABEL_48:
  self->_credentialType = *((_DWORD *)v5 + 7);
  *(_DWORD *)&self->_has |= 4u;
  v9 = *((_DWORD *)v5 + 27);
  if ((v9 & 0x1000) == 0)
  {
LABEL_25:
    if ((v9 & 0x20000) == 0)
      goto LABEL_26;
    goto LABEL_50;
  }
LABEL_49:
  self->_isAddWithOwnershipProof = *((_BYTE *)v5 + 97);
  *(_DWORD *)&self->_has |= 0x1000u;
  v9 = *((_DWORD *)v5 + 27);
  if ((v9 & 0x20000) == 0)
  {
LABEL_26:
    if ((v9 & 0x40000) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_50:
  self->_isNetworkRouterAdd = *((_BYTE *)v5 + 102);
  *(_DWORD *)&self->_has |= 0x20000u;
  if ((*((_DWORD *)v5 + 27) & 0x40000) != 0)
  {
LABEL_27:
    self->_isNetworkRouterReplace = *((_BYTE *)v5 + 103);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
LABEL_28:
  if (*((_QWORD *)v5 + 2))
  {
    -[AWDHomeKitAccessoryPairing setAppIdentifier:](self, "setAppIdentifier:");
    v5 = v11;
  }
  v10 = *((_DWORD *)v5 + 27);
  if ((v10 & 0x8000) != 0)
  {
    self->_isFirstHAPAccessoryInAnyHome = *((_BYTE *)v5 + 100);
    *(_DWORD *)&self->_has |= 0x8000u;
    v10 = *((_DWORD *)v5 + 27);
    if ((v10 & 0x10000) == 0)
    {
LABEL_32:
      if ((v10 & 0x80000) == 0)
        goto LABEL_33;
      goto LABEL_54;
    }
  }
  else if ((v10 & 0x10000) == 0)
  {
    goto LABEL_32;
  }
  self->_isFirstHAPAccessoryInHome = *((_BYTE *)v5 + 101);
  *(_DWORD *)&self->_has |= 0x10000u;
  v10 = *((_DWORD *)v5 + 27);
  if ((v10 & 0x80000) == 0)
  {
LABEL_33:
    if ((v10 & 0x20) == 0)
      goto LABEL_34;
    goto LABEL_55;
  }
LABEL_54:
  self->_isNoeAccessory = *((_BYTE *)v5 + 104);
  *(_DWORD *)&self->_has |= 0x80000u;
  v10 = *((_DWORD *)v5 + 27);
  if ((v10 & 0x20) == 0)
  {
LABEL_34:
    if ((v10 & 0x100) == 0)
      goto LABEL_35;
    goto LABEL_56;
  }
LABEL_55:
  self->_noeCapabilities = *((_DWORD *)v5 + 12);
  *(_DWORD *)&self->_has |= 0x20u;
  v10 = *((_DWORD *)v5 + 27);
  if ((v10 & 0x100) == 0)
  {
LABEL_35:
    if ((v10 & 0x4000) == 0)
      goto LABEL_36;
    goto LABEL_57;
  }
LABEL_56:
  self->_noeStatus = *((_DWORD *)v5 + 18);
  *(_DWORD *)&self->_has |= 0x100u;
  v10 = *((_DWORD *)v5 + 27);
  if ((v10 & 0x4000) == 0)
  {
LABEL_36:
    if ((v10 & 0x100000) == 0)
      goto LABEL_37;
    goto LABEL_58;
  }
LABEL_57:
  self->_isBTOnboard = *((_BYTE *)v5 + 99);
  *(_DWORD *)&self->_has |= 0x4000u;
  v10 = *((_DWORD *)v5 + 27);
  if ((v10 & 0x100000) == 0)
  {
LABEL_37:
    if ((v10 & 0x40) == 0)
      goto LABEL_38;
    goto LABEL_59;
  }
LABEL_58:
  self->_isNoeOnboard = *((_BYTE *)v5 + 105);
  *(_DWORD *)&self->_has |= 0x100000u;
  v10 = *((_DWORD *)v5 + 27);
  if ((v10 & 0x40) == 0)
  {
LABEL_38:
    if ((v10 & 0x80) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_59:
  self->_noeOnboardDuration = *((_DWORD *)v5 + 13);
  *(_DWORD *)&self->_has |= 0x40u;
  if ((*((_DWORD *)v5 + 27) & 0x80) != 0)
  {
LABEL_39:
    self->_noeOnboardErrorCode = *((_DWORD *)v5 + 14);
    *(_DWORD *)&self->_has |= 0x80u;
  }
LABEL_40:
  if (*((_QWORD *)v5 + 8))
  {
    -[AWDHomeKitAccessoryPairing setNoeOnboardErrorDomain:](self, "setNoeOnboardErrorDomain:");
    v5 = v11;
  }
  if (*((_QWORD *)v5 + 5))
  {
    -[AWDHomeKitAccessoryPairing setErrorDomain:](self, "setErrorDomain:");
    v5 = v11;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (BOOL)isAdd
{
  return self->_isAdd;
}

- (BOOL)isAddedViaWAC
{
  return self->_isAddedViaWAC;
}

- (AWDHomeKitVendorInformation)vendorDetails
{
  return self->_vendorDetails;
}

- (void)setVendorDetails:(id)a3
{
  objc_storeStrong((id *)&self->_vendorDetails, a3);
}

- (BOOL)isSecureWAC
{
  return self->_isSecureWAC;
}

- (unsigned)retryCount
{
  return self->_retryCount;
}

- (BOOL)isAddWithOwnershipProof
{
  return self->_isAddWithOwnershipProof;
}

- (BOOL)isNetworkRouterAdd
{
  return self->_isNetworkRouterAdd;
}

- (BOOL)isNetworkRouterReplace
{
  return self->_isNetworkRouterReplace;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (BOOL)isFirstHAPAccessoryInAnyHome
{
  return self->_isFirstHAPAccessoryInAnyHome;
}

- (BOOL)isFirstHAPAccessoryInHome
{
  return self->_isFirstHAPAccessoryInHome;
}

- (BOOL)isNoeAccessory
{
  return self->_isNoeAccessory;
}

- (unsigned)noeCapabilities
{
  return self->_noeCapabilities;
}

- (unsigned)noeStatus
{
  return self->_noeStatus;
}

- (BOOL)isBTOnboard
{
  return self->_isBTOnboard;
}

- (BOOL)isNoeOnboard
{
  return self->_isNoeOnboard;
}

- (unsigned)noeOnboardDuration
{
  return self->_noeOnboardDuration;
}

- (int)noeOnboardErrorCode
{
  return self->_noeOnboardErrorCode;
}

- (NSString)noeOnboardErrorDomain
{
  return self->_noeOnboardErrorDomain;
}

- (void)setNoeOnboardErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_noeOnboardErrorDomain, a3);
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorDetails, 0);
  objc_storeStrong((id *)&self->_noeOnboardErrorDomain, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

@end
