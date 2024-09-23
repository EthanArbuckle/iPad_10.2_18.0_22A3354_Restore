@implementation AWDHomeKitAccessoryReadWrite

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
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
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
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
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsWrite:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isWrite = a3;
}

- (void)setHasIsWrite:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsWrite
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIsRemote:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_isRemote = a3;
}

- (void)setHasIsRemote:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasIsRemote
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)clearCharacteristics
{
  -[NSMutableArray removeAllObjects](self->_characteristics, "removeAllObjects");
}

- (void)addCharacteristics:(id)a3
{
  id v4;
  NSMutableArray *characteristics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  characteristics = self->_characteristics;
  v8 = v4;
  if (!characteristics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_characteristics;
    self->_characteristics = v6;

    v4 = v8;
    characteristics = self->_characteristics;
  }
  -[NSMutableArray addObject:](characteristics, "addObject:", v4);

}

- (unint64_t)characteristicsCount
{
  return -[NSMutableArray count](self->_characteristics, "count");
}

- (id)characteristicsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_characteristics, "objectAtIndex:", a3);
}

- (int)transportType
{
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    return self->_transportType;
  else
    return 0;
}

- (void)setTransportType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasTransportType
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 < 8)
    return off_1E89A6540[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
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

- (BOOL)hasTransaction
{
  return self->_transaction != 0;
}

- (void)setIsTimedWrite:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isTimedWrite = a3;
}

- (void)setHasIsTimedWrite:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsTimedWrite
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (BOOL)hasTransportProtocolVersion
{
  return self->_transportProtocolVersion != 0;
}

- (int)source
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_source;
  else
    return 0;
}

- (void)setSource:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)sourceAsString:(int)a3
{
  if (a3 < 9)
    return off_1E89A6580[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_Siri")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_User")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_EventTrigger")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_TimerTrigger")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_FirstParty")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_ThirdParty")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_InternalRequested")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_RemoteRequested")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCertified
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)certifiedAsString:(int)a3
{
  if (a3 < 3)
    return off_1E89A65C8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
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

- (void)setIsCached:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_isCached = a3;
}

- (void)setHasIsCached:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasIsCached
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasUnderlyingErrorDomain
{
  return self->_underlyingErrorDomain != 0;
}

- (void)setUnderlyingErrorCode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_underlyingErrorCode = a3;
}

- (void)setHasUnderlyingErrorCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasUnderlyingErrorCode
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (BOOL)hasPrimaryServiceType
{
  return self->_primaryServiceType != 0;
}

- (void)setIsResidentAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isResidentAvailable = a3;
}

- (void)setHasIsResidentAvailable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsResidentAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsRemoteAccessAllowed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isRemoteAccessAllowed = a3;
}

- (void)setHasIsRemoteAccessAllowed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsRemoteAccessAllowed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setIsRemotelyReachable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isRemotelyReachable = a3;
}

- (void)setHasIsRemotelyReachable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsRemotelyReachable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setConsecutiveFailureCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_consecutiveFailureCount = a3;
}

- (void)setHasConsecutiveFailureCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasConsecutiveFailureCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTimeElapsedSinceFirstFailure:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_timeElapsedSinceFirstFailure = a3;
}

- (void)setHasTimeElapsedSinceFirstFailure:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasTimeElapsedSinceFirstFailure
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setIsNoeAccessory:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_isNoeAccessory = a3;
}

- (void)setHasIsNoeAccessory:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasIsNoeAccessory
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setIsSentOverNoe:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isSentOverNoe = a3;
}

- (void)setHasIsSentOverNoe:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($6B446C4DFF92E413B016B4163C461F06)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsSentOverNoe
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (BOOL)hasClientMetricIdentifier
{
  return self->_clientMetricIdentifier != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AWDHomeKitAccessoryReadWrite;
  -[AWDHomeKitAccessoryReadWrite description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitAccessoryReadWrite dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $6B446C4DFF92E413B016B4163C461F06 has;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t transportType;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  AWDHomeKitVendorInformation *vendorDetails;
  void *v20;
  NSString *transaction;
  void *v22;
  NSString *transportProtocolVersion;
  $6B446C4DFF92E413B016B4163C461F06 v24;
  void *v25;
  NSString *underlyingErrorDomain;
  void *v27;
  NSString *primaryServiceType;
  $6B446C4DFF92E413B016B4163C461F06 v29;
  void *v30;
  NSString *appIdentifier;
  NSString *clientMetricIdentifier;
  id v33;
  uint64_t source;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t certified;
  __CFString *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_duration);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("duration"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_errorCode);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("errorCode"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isWrite);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("isWrite"));

  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRemote);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("isRemote"));

  }
LABEL_7:
  if (-[NSMutableArray count](self->_characteristics, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_characteristics, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v7 = self->_characteristics;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v46 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("characteristics"));
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    transportType = self->_transportType;
    if (transportType >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transportType);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E89A6540[transportType];
    }
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("transportType"));

  }
  vendorDetails = self->_vendorDetails;
  if (vendorDetails)
  {
    -[AWDHomeKitVendorInformation dictionaryRepresentation](vendorDetails, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("vendorDetails"));

  }
  transaction = self->_transaction;
  if (transaction)
    objc_msgSend(v3, "setObject:forKey:", transaction, CFSTR("transaction"));
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTimedWrite);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("isTimedWrite"));

  }
  transportProtocolVersion = self->_transportProtocolVersion;
  if (transportProtocolVersion)
    objc_msgSend(v3, "setObject:forKey:", transportProtocolVersion, CFSTR("transportProtocolVersion"));
  v24 = self->_has;
  if ((*(_BYTE *)&v24 & 0x20) != 0)
  {
    source = self->_source;
    if (source >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_source);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = off_1E89A6580[source];
    }
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("source"));

    v24 = self->_has;
    if ((*(_BYTE *)&v24 & 2) == 0)
    {
LABEL_36:
      if ((*(_WORD *)&v24 & 0x200) == 0)
        goto LABEL_38;
      goto LABEL_37;
    }
  }
  else if ((*(_BYTE *)&v24 & 2) == 0)
  {
    goto LABEL_36;
  }
  certified = self->_certified;
  if (certified >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_certified);
    v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = off_1E89A65C8[certified];
  }
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("certified"));

  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_37:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCached);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("isCached"));

  }
LABEL_38:
  underlyingErrorDomain = self->_underlyingErrorDomain;
  if (underlyingErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", underlyingErrorDomain, CFSTR("underlyingErrorDomain"));
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_underlyingErrorCode);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("underlyingErrorCode"));

  }
  primaryServiceType = self->_primaryServiceType;
  if (primaryServiceType)
    objc_msgSend(v3, "setObject:forKey:", primaryServiceType, CFSTR("primaryServiceType"));
  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x4000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isResidentAvailable);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("isResidentAvailable"));

    v29 = self->_has;
    if ((*(_WORD *)&v29 & 0x1000) == 0)
    {
LABEL_46:
      if ((*(_WORD *)&v29 & 0x2000) == 0)
        goto LABEL_47;
      goto LABEL_61;
    }
  }
  else if ((*(_WORD *)&v29 & 0x1000) == 0)
  {
    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRemoteAccessAllowed);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("isRemoteAccessAllowed"));

  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x2000) == 0)
  {
LABEL_47:
    if ((*(_BYTE *)&v29 & 4) == 0)
      goto LABEL_48;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRemotelyReachable);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("isRemotelyReachable"));

  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 4) == 0)
  {
LABEL_48:
    if ((*(_BYTE *)&v29 & 0x40) == 0)
      goto LABEL_49;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_consecutiveFailureCount);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("consecutiveFailureCount"));

  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 0x40) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v29 & 0x400) == 0)
      goto LABEL_50;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_timeElapsedSinceFirstFailure);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("timeElapsedSinceFirstFailure"));

  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x400) == 0)
  {
LABEL_50:
    if ((*(_WORD *)&v29 & 0x8000) == 0)
      goto LABEL_52;
    goto LABEL_51;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isNoeAccessory);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("isNoeAccessory"));

  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_51:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSentOverNoe);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("isSentOverNoe"));

  }
LABEL_52:
  appIdentifier = self->_appIdentifier;
  if (appIdentifier)
    objc_msgSend(v3, "setObject:forKey:", appIdentifier, CFSTR("appIdentifier"));
  clientMetricIdentifier = self->_clientMetricIdentifier;
  if (clientMetricIdentifier)
    objc_msgSend(v3, "setObject:forKey:", clientMetricIdentifier, CFSTR("clientMetricIdentifier"));
  v33 = v3;

  return v33;
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
  int v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  AWDHomeKitCharacteristic *v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  objc_class *v54;
  uint64_t v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  char v78;
  unsigned int v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  char v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char v88;
  char v89;
  unsigned int v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char v94;
  char v95;
  unsigned int v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  char v100;
  char v101;
  unsigned int v102;
  uint64_t v103;
  unint64_t v104;
  char v105;
  char v106;
  unsigned int v107;
  uint64_t v108;
  unint64_t v109;
  char v110;
  char v111;
  unsigned int v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  char v116;
  char v117;
  unsigned int v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  char v122;
  void *v123;
  uint64_t v124;
  BOOL v125;
  uint64_t v126;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
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
              goto LABEL_161;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_163;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_161:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_163:
          self->_timestamp = v20;
          goto LABEL_234;
        case 2u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_DWORD *)&self->_has |= 8u;
          while (2)
          {
            v28 = *v4;
            v29 = *(_QWORD *)((char *)a3 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v29);
              *(_QWORD *)((char *)a3 + v28) = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v15 = v26++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_167;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_167:
          v124 = 52;
          goto LABEL_224;
        case 3u:
          v31 = 0;
          v32 = 0;
          v27 = 0;
          *(_DWORD *)&self->_has |= 0x10u;
          while (2)
          {
            v33 = *v4;
            v34 = *(_QWORD *)((char *)a3 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v34);
              *(_QWORD *)((char *)a3 + v33) = v34 + 1;
              v27 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v15 = v32++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_171;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_171:
          v124 = 56;
          goto LABEL_224;
        case 4u:
          v36 = 0;
          v37 = 0;
          v38 = 0;
          *(_DWORD *)&self->_has |= 0x20000u;
          while (2)
          {
            v39 = *v4;
            v40 = *(_QWORD *)((char *)a3 + v39);
            if (v40 == -1 || v40 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v40);
              *(_QWORD *)((char *)a3 + v39) = v40 + 1;
              v38 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                v15 = v37++ >= 9;
                if (v15)
                {
                  v38 = 0;
                  goto LABEL_175;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v38 = 0;
LABEL_175:
          v125 = v38 != 0;
          v126 = 128;
          goto LABEL_233;
        case 5u:
          v42 = 0;
          v43 = 0;
          v44 = 0;
          *(_DWORD *)&self->_has |= 0x800u;
          while (2)
          {
            v45 = *v4;
            v46 = *(_QWORD *)((char *)a3 + v45);
            if (v46 == -1 || v46 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v46);
              *(_QWORD *)((char *)a3 + v45) = v46 + 1;
              v44 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                v15 = v43++ >= 9;
                if (v15)
                {
                  v44 = 0;
                  goto LABEL_179;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v44 = 0;
LABEL_179:
          v125 = v44 != 0;
          v126 = 122;
          goto LABEL_233;
        case 6u:
          v48 = objc_alloc_init(AWDHomeKitCharacteristic);
          -[AWDHomeKitAccessoryReadWrite addCharacteristics:](self, "addCharacteristics:", v48);
          if (!PBReaderPlaceMark() || !AWDHomeKitCharacteristicReadFrom((uint64_t)v48, (uint64_t)a3))
            goto LABEL_236;
          goto LABEL_68;
        case 7u:
          v49 = 0;
          v50 = 0;
          v27 = 0;
          *(_DWORD *)&self->_has |= 0x80u;
          while (2)
          {
            v51 = *v4;
            v52 = *(_QWORD *)((char *)a3 + v51);
            if (v52 == -1 || v52 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v53 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v52);
              *(_QWORD *)((char *)a3 + v51) = v52 + 1;
              v27 |= (unint64_t)(v53 & 0x7F) << v49;
              if (v53 < 0)
              {
                v49 += 7;
                v15 = v50++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_183;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_183:
          v124 = 96;
          goto LABEL_224;
        case 8u:
          v48 = objc_alloc_init(AWDHomeKitVendorInformation);
          objc_storeStrong((id *)&self->_vendorDetails, v48);
          if (!PBReaderPlaceMark() || !AWDHomeKitVendorInformationReadFrom((uint64_t)v48, (uint64_t)a3))
          {
LABEL_236:

            LOBYTE(v24) = 0;
            return v24;
          }
LABEL_68:
          PBReaderRecallMark();

LABEL_234:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_235;
          break;
        case 9u:
          PBReaderReadString();
          v54 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v55 = 80;
          goto LABEL_159;
        case 0xAu:
          v56 = 0;
          v57 = 0;
          v58 = 0;
          *(_DWORD *)&self->_has |= 0x10000u;
          while (2)
          {
            v59 = *v4;
            v60 = *(_QWORD *)((char *)a3 + v59);
            if (v60 == -1 || v60 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v61 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v60);
              *(_QWORD *)((char *)a3 + v59) = v60 + 1;
              v58 |= (unint64_t)(v61 & 0x7F) << v56;
              if (v61 < 0)
              {
                v56 += 7;
                v15 = v57++ >= 9;
                if (v15)
                {
                  v58 = 0;
                  goto LABEL_187;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v58 = 0;
LABEL_187:
          v125 = v58 != 0;
          v126 = 127;
          goto LABEL_233;
        case 0xBu:
          PBReaderReadString();
          v54 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v55 = 88;
          goto LABEL_159;
        case 0xCu:
          v62 = 0;
          v63 = 0;
          v27 = 0;
          *(_DWORD *)&self->_has |= 0x20u;
          while (2)
          {
            v64 = *v4;
            v65 = *(_QWORD *)((char *)a3 + v64);
            if (v65 == -1 || v65 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v66 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v65);
              *(_QWORD *)((char *)a3 + v64) = v65 + 1;
              v27 |= (unint64_t)(v66 & 0x7F) << v62;
              if (v66 < 0)
              {
                v62 += 7;
                v15 = v63++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_191;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_191:
          v124 = 72;
          goto LABEL_224;
        case 0xDu:
          v67 = 0;
          v68 = 0;
          v27 = 0;
          *(_DWORD *)&self->_has |= 2u;
          while (2)
          {
            v69 = *v4;
            v70 = *(_QWORD *)((char *)a3 + v69);
            if (v70 == -1 || v70 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v71 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v70);
              *(_QWORD *)((char *)a3 + v69) = v70 + 1;
              v27 |= (unint64_t)(v71 & 0x7F) << v67;
              if (v71 < 0)
              {
                v67 += 7;
                v15 = v68++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_195;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_195:
          v124 = 24;
          goto LABEL_224;
        case 0xEu:
          v72 = 0;
          v73 = 0;
          v74 = 0;
          *(_DWORD *)&self->_has |= 0x200u;
          while (2)
          {
            v75 = *v4;
            v76 = *(_QWORD *)((char *)a3 + v75);
            if (v76 == -1 || v76 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v77 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v76);
              *(_QWORD *)((char *)a3 + v75) = v76 + 1;
              v74 |= (unint64_t)(v77 & 0x7F) << v72;
              if (v77 < 0)
              {
                v72 += 7;
                v15 = v73++ >= 9;
                if (v15)
                {
                  v74 = 0;
                  goto LABEL_199;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v74 = 0;
LABEL_199:
          v125 = v74 != 0;
          v126 = 120;
          goto LABEL_233;
        case 0xFu:
          PBReaderReadString();
          v54 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v55 = 104;
          goto LABEL_159;
        case 0x10u:
          v78 = 0;
          v79 = 0;
          v27 = 0;
          *(_DWORD *)&self->_has |= 0x100u;
          while (2)
          {
            v80 = *v4;
            v81 = *(_QWORD *)((char *)a3 + v80);
            if (v81 == -1 || v81 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v82 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v81);
              *(_QWORD *)((char *)a3 + v80) = v81 + 1;
              v27 |= (unint64_t)(v82 & 0x7F) << v78;
              if (v82 < 0)
              {
                v78 += 7;
                v15 = v79++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_203;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_203:
          v124 = 100;
          goto LABEL_224;
        case 0x11u:
          PBReaderReadString();
          v54 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v55 = 64;
          goto LABEL_159;
        case 0x12u:
          v83 = 0;
          v84 = 0;
          v85 = 0;
          *(_DWORD *)&self->_has |= 0x4000u;
          while (2)
          {
            v86 = *v4;
            v87 = *(_QWORD *)((char *)a3 + v86);
            if (v87 == -1 || v87 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v88 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v87);
              *(_QWORD *)((char *)a3 + v86) = v87 + 1;
              v85 |= (unint64_t)(v88 & 0x7F) << v83;
              if (v88 < 0)
              {
                v83 += 7;
                v15 = v84++ >= 9;
                if (v15)
                {
                  v85 = 0;
                  goto LABEL_207;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v85 = 0;
LABEL_207:
          v125 = v85 != 0;
          v126 = 125;
          goto LABEL_233;
        case 0x13u:
          v89 = 0;
          v90 = 0;
          v91 = 0;
          *(_DWORD *)&self->_has |= 0x1000u;
          while (2)
          {
            v92 = *v4;
            v93 = *(_QWORD *)((char *)a3 + v92);
            if (v93 == -1 || v93 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v94 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v93);
              *(_QWORD *)((char *)a3 + v92) = v93 + 1;
              v91 |= (unint64_t)(v94 & 0x7F) << v89;
              if (v94 < 0)
              {
                v89 += 7;
                v15 = v90++ >= 9;
                if (v15)
                {
                  v91 = 0;
                  goto LABEL_211;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v91 = 0;
LABEL_211:
          v125 = v91 != 0;
          v126 = 123;
          goto LABEL_233;
        case 0x14u:
          v95 = 0;
          v96 = 0;
          v97 = 0;
          *(_DWORD *)&self->_has |= 0x2000u;
          while (2)
          {
            v98 = *v4;
            v99 = *(_QWORD *)((char *)a3 + v98);
            if (v99 == -1 || v99 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v100 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v99);
              *(_QWORD *)((char *)a3 + v98) = v99 + 1;
              v97 |= (unint64_t)(v100 & 0x7F) << v95;
              if (v100 < 0)
              {
                v95 += 7;
                v15 = v96++ >= 9;
                if (v15)
                {
                  v97 = 0;
                  goto LABEL_215;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v97 = 0;
LABEL_215:
          v125 = v97 != 0;
          v126 = 124;
          goto LABEL_233;
        case 0x15u:
          v101 = 0;
          v102 = 0;
          v27 = 0;
          *(_DWORD *)&self->_has |= 4u;
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
              v27 |= (unint64_t)(v105 & 0x7F) << v101;
              if (v105 < 0)
              {
                v101 += 7;
                v15 = v102++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_219;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_219:
          v124 = 48;
          goto LABEL_224;
        case 0x16u:
          v106 = 0;
          v107 = 0;
          v27 = 0;
          *(_DWORD *)&self->_has |= 0x40u;
          while (2)
          {
            v108 = *v4;
            v109 = *(_QWORD *)((char *)a3 + v108);
            if (v109 == -1 || v109 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v110 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v109);
              *(_QWORD *)((char *)a3 + v108) = v109 + 1;
              v27 |= (unint64_t)(v110 & 0x7F) << v106;
              if (v110 < 0)
              {
                v106 += 7;
                v15 = v107++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_223;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_223:
          v124 = 76;
LABEL_224:
          *(_DWORD *)((char *)&self->super.super.isa + v124) = v27;
          goto LABEL_234;
        case 0x17u:
          v111 = 0;
          v112 = 0;
          v113 = 0;
          *(_DWORD *)&self->_has |= 0x400u;
          while (2)
          {
            v114 = *v4;
            v115 = *(_QWORD *)((char *)a3 + v114);
            if (v115 == -1 || v115 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v116 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v115);
              *(_QWORD *)((char *)a3 + v114) = v115 + 1;
              v113 |= (unint64_t)(v116 & 0x7F) << v111;
              if (v116 < 0)
              {
                v111 += 7;
                v15 = v112++ >= 9;
                if (v15)
                {
                  v113 = 0;
                  goto LABEL_228;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v113 = 0;
LABEL_228:
          v125 = v113 != 0;
          v126 = 121;
          goto LABEL_233;
        case 0x18u:
          v117 = 0;
          v118 = 0;
          v119 = 0;
          *(_DWORD *)&self->_has |= 0x8000u;
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
              v119 |= (unint64_t)(v122 & 0x7F) << v117;
              if (v122 < 0)
              {
                v117 += 7;
                v15 = v118++ >= 9;
                if (v15)
                {
                  v119 = 0;
                  goto LABEL_232;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v119 = 0;
LABEL_232:
          v125 = v119 != 0;
          v126 = 126;
LABEL_233:
          *((_BYTE *)&self->super.super.isa + v126) = v125;
          goto LABEL_234;
        case 0x19u:
          PBReaderReadString();
          v54 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v55 = 16;
          goto LABEL_159;
        case 0x1Au:
          PBReaderReadString();
          v54 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v55 = 40;
LABEL_159:
          v123 = *(Class *)((char *)&self->super.super.isa + v55);
          *(Class *)((char *)&self->super.super.isa + v55) = v54;

          goto LABEL_234;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          goto LABEL_234;
      }
    }
  }
LABEL_235:
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  id v4;
  $6B446C4DFF92E413B016B4163C461F06 has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  $6B446C4DFF92E413B016B4163C461F06 v11;
  $6B446C4DFF92E413B016B4163C461F06 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_49;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_50:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_characteristics;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_vendorDetails)
    PBDataWriterWriteSubmessage();
  if (self->_transaction)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_transportProtocolVersion)
    PBDataWriterWriteStringField();
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = self->_has;
    if ((*(_BYTE *)&v11 & 2) == 0)
    {
LABEL_26:
      if ((*(_WORD *)&v11 & 0x200) == 0)
        goto LABEL_28;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&v11 & 2) == 0)
  {
    goto LABEL_26;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
LABEL_27:
    PBDataWriterWriteBOOLField();
LABEL_28:
  if (self->_underlyingErrorDomain)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_primaryServiceType)
    PBDataWriterWriteStringField();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_has;
    if ((*(_WORD *)&v12 & 0x1000) == 0)
    {
LABEL_36:
      if ((*(_WORD *)&v12 & 0x2000) == 0)
        goto LABEL_37;
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&v12 & 0x1000) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteBOOLField();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x2000) == 0)
  {
LABEL_37:
    if ((*(_BYTE *)&v12 & 4) == 0)
      goto LABEL_38;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 4) == 0)
  {
LABEL_38:
    if ((*(_BYTE *)&v12 & 0x40) == 0)
      goto LABEL_39;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x40) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v12 & 0x400) == 0)
      goto LABEL_40;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x400) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v12 & 0x8000) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
LABEL_41:
    PBDataWriterWriteBOOLField();
LABEL_42:
  if (self->_appIdentifier)
    PBDataWriterWriteStringField();
  if (self->_clientMetricIdentifier)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $6B446C4DFF92E413B016B4163C461F06 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _DWORD *v10;
  $6B446C4DFF92E413B016B4163C461F06 v11;
  $6B446C4DFF92E413B016B4163C461F06 v12;
  _DWORD *v13;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 33) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_46;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 13) = self->_duration;
  *((_DWORD *)v4 + 33) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
LABEL_47:
    *((_BYTE *)v4 + 128) = self->_isWrite;
    *((_DWORD *)v4 + 33) |= 0x20000u;
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_46:
  *((_DWORD *)v4 + 14) = self->_errorCode;
  *((_DWORD *)v4 + 33) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
    goto LABEL_47;
LABEL_5:
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_6:
    *((_BYTE *)v4 + 122) = self->_isRemote;
    *((_DWORD *)v4 + 33) |= 0x800u;
  }
LABEL_7:
  v13 = v4;
  if (-[AWDHomeKitAccessoryReadWrite characteristicsCount](self, "characteristicsCount"))
  {
    objc_msgSend(v13, "clearCharacteristics");
    v6 = -[AWDHomeKitAccessoryReadWrite characteristicsCount](self, "characteristicsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[AWDHomeKitAccessoryReadWrite characteristicsAtIndex:](self, "characteristicsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addCharacteristics:", v9);

      }
    }
  }
  v10 = v13;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    v13[24] = self->_transportType;
    v13[33] |= 0x80u;
  }
  if (self->_vendorDetails)
  {
    objc_msgSend(v13, "setVendorDetails:");
    v10 = v13;
  }
  if (self->_transaction)
  {
    objc_msgSend(v13, "setTransaction:");
    v10 = v13;
  }
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    *((_BYTE *)v10 + 127) = self->_isTimedWrite;
    v10[33] |= 0x10000u;
  }
  if (self->_transportProtocolVersion)
  {
    objc_msgSend(v13, "setTransportProtocolVersion:");
    v10 = v13;
  }
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x20) != 0)
  {
    v10[18] = self->_source;
    v10[33] |= 0x20u;
    v11 = self->_has;
    if ((*(_BYTE *)&v11 & 2) == 0)
    {
LABEL_23:
      if ((*(_WORD *)&v11 & 0x200) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&v11 & 2) == 0)
  {
    goto LABEL_23;
  }
  v10[6] = self->_certified;
  v10[33] |= 2u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_24:
    *((_BYTE *)v10 + 120) = self->_isCached;
    v10[33] |= 0x200u;
  }
LABEL_25:
  if (self->_underlyingErrorDomain)
  {
    objc_msgSend(v13, "setUnderlyingErrorDomain:");
    v10 = v13;
  }
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    v10[25] = self->_underlyingErrorCode;
    v10[33] |= 0x100u;
  }
  if (self->_primaryServiceType)
  {
    objc_msgSend(v13, "setPrimaryServiceType:");
    v10 = v13;
  }
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
    *((_BYTE *)v10 + 125) = self->_isResidentAvailable;
    v10[33] |= 0x4000u;
    v12 = self->_has;
    if ((*(_WORD *)&v12 & 0x1000) == 0)
    {
LABEL_33:
      if ((*(_WORD *)&v12 & 0x2000) == 0)
        goto LABEL_34;
      goto LABEL_54;
    }
  }
  else if ((*(_WORD *)&v12 & 0x1000) == 0)
  {
    goto LABEL_33;
  }
  *((_BYTE *)v10 + 123) = self->_isRemoteAccessAllowed;
  v10[33] |= 0x1000u;
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x2000) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v12 & 4) == 0)
      goto LABEL_35;
    goto LABEL_55;
  }
LABEL_54:
  *((_BYTE *)v10 + 124) = self->_isRemotelyReachable;
  v10[33] |= 0x2000u;
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 4) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&v12 & 0x40) == 0)
      goto LABEL_36;
    goto LABEL_56;
  }
LABEL_55:
  v10[12] = self->_consecutiveFailureCount;
  v10[33] |= 4u;
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x40) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v12 & 0x400) == 0)
      goto LABEL_37;
    goto LABEL_57;
  }
LABEL_56:
  v10[19] = self->_timeElapsedSinceFirstFailure;
  v10[33] |= 0x40u;
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x400) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v12 & 0x8000) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_57:
  *((_BYTE *)v10 + 121) = self->_isNoeAccessory;
  v10[33] |= 0x400u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_38:
    *((_BYTE *)v10 + 126) = self->_isSentOverNoe;
    v10[33] |= 0x8000u;
  }
LABEL_39:
  if (self->_appIdentifier)
  {
    objc_msgSend(v13, "setAppIdentifier:");
    v10 = v13;
  }
  if (self->_clientMetricIdentifier)
  {
    objc_msgSend(v13, "setClientMetricIdentifier:");
    v10 = v13;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $6B446C4DFF92E413B016B4163C461F06 has;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  $6B446C4DFF92E413B016B4163C461F06 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  $6B446C4DFF92E413B016B4163C461F06 v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 132) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_35;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 52) = self->_duration;
  *(_DWORD *)(v5 + 132) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v5 + 56) = self->_errorCode;
  *(_DWORD *)(v5 + 132) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_36:
  *(_BYTE *)(v5 + 128) = self->_isWrite;
  *(_DWORD *)(v5 + 132) |= 0x20000u;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    *(_BYTE *)(v5 + 122) = self->_isRemote;
    *(_DWORD *)(v5 + 132) |= 0x800u;
  }
LABEL_7:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = self->_characteristics;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v31);
        objc_msgSend((id)v6, "addCharacteristics:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_transportType;
    *(_DWORD *)(v6 + 132) |= 0x80u;
  }
  v14 = -[AWDHomeKitVendorInformation copyWithZone:](self->_vendorDetails, "copyWithZone:", a3, (_QWORD)v31);
  v15 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v14;

  v16 = -[NSString copyWithZone:](self->_transaction, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v16;

  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    *(_BYTE *)(v6 + 127) = self->_isTimedWrite;
    *(_DWORD *)(v6 + 132) |= 0x10000u;
  }
  v18 = -[NSString copyWithZone:](self->_transportProtocolVersion, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v18;

  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_source;
    *(_DWORD *)(v6 + 132) |= 0x20u;
    v20 = self->_has;
    if ((*(_BYTE *)&v20 & 2) == 0)
    {
LABEL_20:
      if ((*(_WORD *)&v20 & 0x200) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&v20 & 2) == 0)
  {
    goto LABEL_20;
  }
  *(_DWORD *)(v6 + 24) = self->_certified;
  *(_DWORD *)(v6 + 132) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_21:
    *(_BYTE *)(v6 + 120) = self->_isCached;
    *(_DWORD *)(v6 + 132) |= 0x200u;
  }
LABEL_22:
  v21 = -[NSString copyWithZone:](self->_underlyingErrorDomain, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v21;

  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *(_DWORD *)(v6 + 100) = self->_underlyingErrorCode;
    *(_DWORD *)(v6 + 132) |= 0x100u;
  }
  v23 = -[NSString copyWithZone:](self->_primaryServiceType, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v23;

  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x4000) != 0)
  {
    *(_BYTE *)(v6 + 125) = self->_isResidentAvailable;
    *(_DWORD *)(v6 + 132) |= 0x4000u;
    v25 = self->_has;
    if ((*(_WORD *)&v25 & 0x1000) == 0)
    {
LABEL_26:
      if ((*(_WORD *)&v25 & 0x2000) == 0)
        goto LABEL_27;
      goto LABEL_43;
    }
  }
  else if ((*(_WORD *)&v25 & 0x1000) == 0)
  {
    goto LABEL_26;
  }
  *(_BYTE *)(v6 + 123) = self->_isRemoteAccessAllowed;
  *(_DWORD *)(v6 + 132) |= 0x1000u;
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v25 & 4) == 0)
      goto LABEL_28;
    goto LABEL_44;
  }
LABEL_43:
  *(_BYTE *)(v6 + 124) = self->_isRemotelyReachable;
  *(_DWORD *)(v6 + 132) |= 0x2000u;
  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 4) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v25 & 0x40) == 0)
      goto LABEL_29;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v6 + 48) = self->_consecutiveFailureCount;
  *(_DWORD *)(v6 + 132) |= 4u;
  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 0x40) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v25 & 0x400) == 0)
      goto LABEL_30;
LABEL_46:
    *(_BYTE *)(v6 + 121) = self->_isNoeAccessory;
    *(_DWORD *)(v6 + 132) |= 0x400u;
    if ((*(_DWORD *)&self->_has & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_45:
  *(_DWORD *)(v6 + 76) = self->_timeElapsedSinceFirstFailure;
  *(_DWORD *)(v6 + 132) |= 0x40u;
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x400) != 0)
    goto LABEL_46;
LABEL_30:
  if ((*(_WORD *)&v25 & 0x8000) != 0)
  {
LABEL_31:
    *(_BYTE *)(v6 + 126) = self->_isSentOverNoe;
    *(_DWORD *)(v6 + 132) |= 0x8000u;
  }
LABEL_32:
  v26 = -[NSString copyWithZone:](self->_appIdentifier, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v26;

  v28 = -[NSString copyWithZone:](self->_clientMetricIdentifier, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v28;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $6B446C4DFF92E413B016B4163C461F06 has;
  int v6;
  NSMutableArray *characteristics;
  AWDHomeKitVendorInformation *vendorDetails;
  NSString *transaction;
  $6B446C4DFF92E413B016B4163C461F06 v10;
  int v11;
  NSString *transportProtocolVersion;
  NSString *underlyingErrorDomain;
  NSString *primaryServiceType;
  NSString *appIdentifier;
  NSString *clientMetricIdentifier;
  char v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_139;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 33);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_139;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_139;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_duration != *((_DWORD *)v4 + 13))
      goto LABEL_139;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_139;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_errorCode != *((_DWORD *)v4 + 14))
      goto LABEL_139;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_139;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0)
      goto LABEL_139;
    if (self->_isWrite)
    {
      if (!*((_BYTE *)v4 + 128))
        goto LABEL_139;
    }
    else if (*((_BYTE *)v4 + 128))
    {
      goto LABEL_139;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_139;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0)
      goto LABEL_139;
    if (self->_isRemote)
    {
      if (!*((_BYTE *)v4 + 122))
        goto LABEL_139;
    }
    else if (*((_BYTE *)v4 + 122))
    {
      goto LABEL_139;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_139;
  }
  characteristics = self->_characteristics;
  if ((unint64_t)characteristics | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](characteristics, "isEqual:"))
      goto LABEL_139;
    has = self->_has;
    v6 = *((_DWORD *)v4 + 33);
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_transportType != *((_DWORD *)v4 + 24))
      goto LABEL_139;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_139;
  }
  vendorDetails = self->_vendorDetails;
  if ((unint64_t)vendorDetails | *((_QWORD *)v4 + 14)
    && !-[AWDHomeKitVendorInformation isEqual:](vendorDetails, "isEqual:"))
  {
    goto LABEL_139;
  }
  transaction = self->_transaction;
  if ((unint64_t)transaction | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](transaction, "isEqual:"))
      goto LABEL_139;
  }
  v10 = self->_has;
  v11 = *((_DWORD *)v4 + 33);
  if ((*(_DWORD *)&v10 & 0x10000) != 0)
  {
    if ((v11 & 0x10000) == 0)
      goto LABEL_139;
    if (self->_isTimedWrite)
    {
      if (!*((_BYTE *)v4 + 127))
        goto LABEL_139;
    }
    else if (*((_BYTE *)v4 + 127))
    {
      goto LABEL_139;
    }
  }
  else if ((v11 & 0x10000) != 0)
  {
    goto LABEL_139;
  }
  transportProtocolVersion = self->_transportProtocolVersion;
  if ((unint64_t)transportProtocolVersion | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](transportProtocolVersion, "isEqual:"))
      goto LABEL_139;
    v10 = self->_has;
    v11 = *((_DWORD *)v4 + 33);
  }
  if ((*(_BYTE *)&v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_source != *((_DWORD *)v4 + 18))
      goto LABEL_139;
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_139;
  }
  if ((*(_BYTE *)&v10 & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_certified != *((_DWORD *)v4 + 6))
      goto LABEL_139;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_139;
  }
  if ((*(_WORD *)&v10 & 0x200) != 0)
  {
    if ((v11 & 0x200) == 0)
      goto LABEL_139;
    if (self->_isCached)
    {
      if (!*((_BYTE *)v4 + 120))
        goto LABEL_139;
    }
    else if (*((_BYTE *)v4 + 120))
    {
      goto LABEL_139;
    }
  }
  else if ((v11 & 0x200) != 0)
  {
    goto LABEL_139;
  }
  underlyingErrorDomain = self->_underlyingErrorDomain;
  if ((unint64_t)underlyingErrorDomain | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](underlyingErrorDomain, "isEqual:"))
      goto LABEL_139;
    v10 = self->_has;
    v11 = *((_DWORD *)v4 + 33);
  }
  if ((*(_WORD *)&v10 & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0 || self->_underlyingErrorCode != *((_DWORD *)v4 + 25))
      goto LABEL_139;
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_139;
  }
  primaryServiceType = self->_primaryServiceType;
  if ((unint64_t)primaryServiceType | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](primaryServiceType, "isEqual:"))
      goto LABEL_139;
    v10 = self->_has;
    v11 = *((_DWORD *)v4 + 33);
  }
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0)
      goto LABEL_139;
    if (self->_isResidentAvailable)
    {
      if (!*((_BYTE *)v4 + 125))
        goto LABEL_139;
    }
    else if (*((_BYTE *)v4 + 125))
    {
      goto LABEL_139;
    }
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_139;
  }
  if ((*(_WORD *)&v10 & 0x1000) != 0)
  {
    if ((v11 & 0x1000) == 0)
      goto LABEL_139;
    if (self->_isRemoteAccessAllowed)
    {
      if (!*((_BYTE *)v4 + 123))
        goto LABEL_139;
    }
    else if (*((_BYTE *)v4 + 123))
    {
      goto LABEL_139;
    }
  }
  else if ((v11 & 0x1000) != 0)
  {
    goto LABEL_139;
  }
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    if ((v11 & 0x2000) == 0)
      goto LABEL_139;
    if (self->_isRemotelyReachable)
    {
      if (!*((_BYTE *)v4 + 124))
        goto LABEL_139;
    }
    else if (*((_BYTE *)v4 + 124))
    {
      goto LABEL_139;
    }
  }
  else if ((v11 & 0x2000) != 0)
  {
    goto LABEL_139;
  }
  if ((*(_BYTE *)&v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_consecutiveFailureCount != *((_DWORD *)v4 + 12))
      goto LABEL_139;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_139;
  }
  if ((*(_BYTE *)&v10 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_timeElapsedSinceFirstFailure != *((_DWORD *)v4 + 19))
      goto LABEL_139;
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_139;
  }
  if ((*(_WORD *)&v10 & 0x400) != 0)
  {
    if ((v11 & 0x400) == 0)
      goto LABEL_139;
    if (self->_isNoeAccessory)
    {
      if (!*((_BYTE *)v4 + 121))
        goto LABEL_139;
    }
    else if (*((_BYTE *)v4 + 121))
    {
      goto LABEL_139;
    }
  }
  else if ((v11 & 0x400) != 0)
  {
    goto LABEL_139;
  }
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    if ((v11 & 0x8000) != 0)
    {
      if (self->_isSentOverNoe)
      {
        if (!*((_BYTE *)v4 + 126))
          goto LABEL_139;
        goto LABEL_135;
      }
      if (!*((_BYTE *)v4 + 126))
        goto LABEL_135;
    }
LABEL_139:
    v17 = 0;
    goto LABEL_140;
  }
  if ((v11 & 0x8000) != 0)
    goto LABEL_139;
LABEL_135:
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](appIdentifier, "isEqual:"))
  {
    goto LABEL_139;
  }
  clientMetricIdentifier = self->_clientMetricIdentifier;
  if ((unint64_t)clientMetricIdentifier | *((_QWORD *)v4 + 5))
    v17 = -[NSString isEqual:](clientMetricIdentifier, "isEqual:");
  else
    v17 = 1;
LABEL_140:

  return v17;
}

- (unint64_t)hash
{
  $6B446C4DFF92E413B016B4163C461F06 has;
  uint64_t v4;
  NSUInteger v5;
  $6B446C4DFF92E413B016B4163C461F06 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  $6B446C4DFF92E413B016B4163C461F06 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  NSUInteger v22;
  NSUInteger v24;
  unint64_t v25;
  uint64_t v26;
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
      goto LABEL_9;
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
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_5;
LABEL_10:
    v29 = 0;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v30 = 0;
  if ((*(_DWORD *)&has & 0x20000) == 0)
    goto LABEL_10;
LABEL_5:
  v29 = 2654435761 * self->_isWrite;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_6:
    v28 = 2654435761 * self->_isRemote;
    goto LABEL_12;
  }
LABEL_11:
  v28 = 0;
LABEL_12:
  v27 = -[NSMutableArray hash](self->_characteristics, "hash");
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    v26 = 2654435761 * self->_transportType;
  else
    v26 = 0;
  v25 = -[AWDHomeKitVendorInformation hash](self->_vendorDetails, "hash");
  v24 = -[NSString hash](self->_transaction, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    v4 = 2654435761 * self->_isTimedWrite;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_transportProtocolVersion, "hash");
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
    v7 = 0;
    if ((*(_BYTE *)&v6 & 2) != 0)
      goto LABEL_20;
LABEL_23:
    v8 = 0;
    if ((*(_WORD *)&v6 & 0x200) != 0)
      goto LABEL_21;
    goto LABEL_24;
  }
  v7 = 2654435761 * self->_source;
  if ((*(_BYTE *)&v6 & 2) == 0)
    goto LABEL_23;
LABEL_20:
  v8 = 2654435761 * self->_certified;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
LABEL_21:
    v9 = 2654435761 * self->_isCached;
    goto LABEL_25;
  }
LABEL_24:
  v9 = 0;
LABEL_25:
  v10 = -[NSString hash](self->_underlyingErrorDomain, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    v11 = 2654435761 * self->_underlyingErrorCode;
  else
    v11 = 0;
  v12 = -[NSString hash](self->_primaryServiceType, "hash");
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) != 0)
  {
    v14 = 2654435761 * self->_isResidentAvailable;
    if ((*(_WORD *)&v13 & 0x1000) != 0)
    {
LABEL_30:
      v15 = 2654435761 * self->_isRemoteAccessAllowed;
      if ((*(_WORD *)&v13 & 0x2000) != 0)
        goto LABEL_31;
      goto LABEL_38;
    }
  }
  else
  {
    v14 = 0;
    if ((*(_WORD *)&v13 & 0x1000) != 0)
      goto LABEL_30;
  }
  v15 = 0;
  if ((*(_WORD *)&v13 & 0x2000) != 0)
  {
LABEL_31:
    v16 = 2654435761 * self->_isRemotelyReachable;
    if ((*(_BYTE *)&v13 & 4) != 0)
      goto LABEL_32;
    goto LABEL_39;
  }
LABEL_38:
  v16 = 0;
  if ((*(_BYTE *)&v13 & 4) != 0)
  {
LABEL_32:
    v17 = 2654435761 * self->_consecutiveFailureCount;
    if ((*(_BYTE *)&v13 & 0x40) != 0)
      goto LABEL_33;
    goto LABEL_40;
  }
LABEL_39:
  v17 = 0;
  if ((*(_BYTE *)&v13 & 0x40) != 0)
  {
LABEL_33:
    v18 = 2654435761 * self->_timeElapsedSinceFirstFailure;
    if ((*(_WORD *)&v13 & 0x400) != 0)
      goto LABEL_34;
LABEL_41:
    v19 = 0;
    if ((*(_WORD *)&v13 & 0x8000) != 0)
      goto LABEL_35;
LABEL_42:
    v20 = 0;
    goto LABEL_43;
  }
LABEL_40:
  v18 = 0;
  if ((*(_WORD *)&v13 & 0x400) == 0)
    goto LABEL_41;
LABEL_34:
  v19 = 2654435761 * self->_isNoeAccessory;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
    goto LABEL_42;
LABEL_35:
  v20 = 2654435761 * self->_isSentOverNoe;
LABEL_43:
  v21 = v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v26 ^ v27 ^ v25 ^ v24 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  v22 = v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ -[NSString hash](self->_appIdentifier, "hash");
  return v21 ^ v22 ^ -[NSString hash](self->_clientMetricIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  AWDHomeKitVendorInformation *vendorDetails;
  uint64_t v13;
  int v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *((_DWORD *)v4 + 33);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v6 = *((_DWORD *)v4 + 33);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 8u;
  v6 = *((_DWORD *)v4 + 33);
  if ((v6 & 0x10) == 0)
  {
LABEL_4:
    if ((v6 & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  self->_errorCode = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x10u;
  v6 = *((_DWORD *)v4 + 33);
  if ((v6 & 0x20000) == 0)
  {
LABEL_5:
    if ((v6 & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_22:
  self->_isWrite = *((_BYTE *)v4 + 128);
  *(_DWORD *)&self->_has |= 0x20000u;
  if ((*((_DWORD *)v4 + 33) & 0x800) != 0)
  {
LABEL_6:
    self->_isRemote = *((_BYTE *)v4 + 122);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_7:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = *((id *)v4 + 4);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        -[AWDHomeKitAccessoryReadWrite addCharacteristics:](self, "addCharacteristics:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  if ((*((_BYTE *)v5 + 132) & 0x80) != 0)
  {
    self->_transportType = *((_DWORD *)v5 + 24);
    *(_DWORD *)&self->_has |= 0x80u;
  }
  vendorDetails = self->_vendorDetails;
  v13 = *((_QWORD *)v5 + 14);
  if (vendorDetails)
  {
    if (v13)
      -[AWDHomeKitVendorInformation mergeFrom:](vendorDetails, "mergeFrom:");
  }
  else if (v13)
  {
    -[AWDHomeKitAccessoryReadWrite setVendorDetails:](self, "setVendorDetails:");
  }
  if (*((_QWORD *)v5 + 10))
    -[AWDHomeKitAccessoryReadWrite setTransaction:](self, "setTransaction:");
  if ((*((_BYTE *)v5 + 134) & 1) != 0)
  {
    self->_isTimedWrite = *((_BYTE *)v5 + 127);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
  if (*((_QWORD *)v5 + 11))
    -[AWDHomeKitAccessoryReadWrite setTransportProtocolVersion:](self, "setTransportProtocolVersion:");
  v14 = *((_DWORD *)v5 + 33);
  if ((v14 & 0x20) != 0)
  {
    self->_source = *((_DWORD *)v5 + 18);
    *(_DWORD *)&self->_has |= 0x20u;
    v14 = *((_DWORD *)v5 + 33);
    if ((v14 & 2) == 0)
    {
LABEL_34:
      if ((v14 & 0x200) == 0)
        goto LABEL_36;
      goto LABEL_35;
    }
  }
  else if ((v14 & 2) == 0)
  {
    goto LABEL_34;
  }
  self->_certified = *((_DWORD *)v5 + 6);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)v5 + 33) & 0x200) != 0)
  {
LABEL_35:
    self->_isCached = *((_BYTE *)v5 + 120);
    *(_DWORD *)&self->_has |= 0x200u;
  }
LABEL_36:
  if (*((_QWORD *)v5 + 13))
    -[AWDHomeKitAccessoryReadWrite setUnderlyingErrorDomain:](self, "setUnderlyingErrorDomain:");
  if ((*((_BYTE *)v5 + 133) & 1) != 0)
  {
    self->_underlyingErrorCode = *((_DWORD *)v5 + 25);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v5 + 8))
    -[AWDHomeKitAccessoryReadWrite setPrimaryServiceType:](self, "setPrimaryServiceType:");
  v15 = *((_DWORD *)v5 + 33);
  if ((v15 & 0x4000) != 0)
  {
    self->_isResidentAvailable = *((_BYTE *)v5 + 125);
    *(_DWORD *)&self->_has |= 0x4000u;
    v15 = *((_DWORD *)v5 + 33);
    if ((v15 & 0x1000) == 0)
    {
LABEL_44:
      if ((v15 & 0x2000) == 0)
        goto LABEL_45;
      goto LABEL_60;
    }
  }
  else if ((v15 & 0x1000) == 0)
  {
    goto LABEL_44;
  }
  self->_isRemoteAccessAllowed = *((_BYTE *)v5 + 123);
  *(_DWORD *)&self->_has |= 0x1000u;
  v15 = *((_DWORD *)v5 + 33);
  if ((v15 & 0x2000) == 0)
  {
LABEL_45:
    if ((v15 & 4) == 0)
      goto LABEL_46;
    goto LABEL_61;
  }
LABEL_60:
  self->_isRemotelyReachable = *((_BYTE *)v5 + 124);
  *(_DWORD *)&self->_has |= 0x2000u;
  v15 = *((_DWORD *)v5 + 33);
  if ((v15 & 4) == 0)
  {
LABEL_46:
    if ((v15 & 0x40) == 0)
      goto LABEL_47;
    goto LABEL_62;
  }
LABEL_61:
  self->_consecutiveFailureCount = *((_DWORD *)v5 + 12);
  *(_DWORD *)&self->_has |= 4u;
  v15 = *((_DWORD *)v5 + 33);
  if ((v15 & 0x40) == 0)
  {
LABEL_47:
    if ((v15 & 0x400) == 0)
      goto LABEL_48;
    goto LABEL_63;
  }
LABEL_62:
  self->_timeElapsedSinceFirstFailure = *((_DWORD *)v5 + 19);
  *(_DWORD *)&self->_has |= 0x40u;
  v15 = *((_DWORD *)v5 + 33);
  if ((v15 & 0x400) == 0)
  {
LABEL_48:
    if ((v15 & 0x8000) == 0)
      goto LABEL_50;
    goto LABEL_49;
  }
LABEL_63:
  self->_isNoeAccessory = *((_BYTE *)v5 + 121);
  *(_DWORD *)&self->_has |= 0x400u;
  if ((*((_DWORD *)v5 + 33) & 0x8000) != 0)
  {
LABEL_49:
    self->_isSentOverNoe = *((_BYTE *)v5 + 126);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_50:
  if (*((_QWORD *)v5 + 2))
    -[AWDHomeKitAccessoryReadWrite setAppIdentifier:](self, "setAppIdentifier:");
  if (*((_QWORD *)v5 + 5))
    -[AWDHomeKitAccessoryReadWrite setClientMetricIdentifier:](self, "setClientMetricIdentifier:");

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

- (BOOL)isWrite
{
  return self->_isWrite;
}

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (NSMutableArray)characteristics
{
  return self->_characteristics;
}

- (void)setCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_characteristics, a3);
}

- (AWDHomeKitVendorInformation)vendorDetails
{
  return self->_vendorDetails;
}

- (void)setVendorDetails:(id)a3
{
  objc_storeStrong((id *)&self->_vendorDetails, a3);
}

- (NSString)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (BOOL)isTimedWrite
{
  return self->_isTimedWrite;
}

- (NSString)transportProtocolVersion
{
  return self->_transportProtocolVersion;
}

- (void)setTransportProtocolVersion:(id)a3
{
  objc_storeStrong((id *)&self->_transportProtocolVersion, a3);
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (NSString)underlyingErrorDomain
{
  return self->_underlyingErrorDomain;
}

- (void)setUnderlyingErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingErrorDomain, a3);
}

- (unsigned)underlyingErrorCode
{
  return self->_underlyingErrorCode;
}

- (NSString)primaryServiceType
{
  return self->_primaryServiceType;
}

- (void)setPrimaryServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_primaryServiceType, a3);
}

- (BOOL)isResidentAvailable
{
  return self->_isResidentAvailable;
}

- (BOOL)isRemoteAccessAllowed
{
  return self->_isRemoteAccessAllowed;
}

- (BOOL)isRemotelyReachable
{
  return self->_isRemotelyReachable;
}

- (unsigned)consecutiveFailureCount
{
  return self->_consecutiveFailureCount;
}

- (unsigned)timeElapsedSinceFirstFailure
{
  return self->_timeElapsedSinceFirstFailure;
}

- (BOOL)isNoeAccessory
{
  return self->_isNoeAccessory;
}

- (BOOL)isSentOverNoe
{
  return self->_isSentOverNoe;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (NSString)clientMetricIdentifier
{
  return self->_clientMetricIdentifier;
}

- (void)setClientMetricIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientMetricIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorDetails, 0);
  objc_storeStrong((id *)&self->_underlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_transportProtocolVersion, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_primaryServiceType, 0);
  objc_storeStrong((id *)&self->_clientMetricIdentifier, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

+ (Class)characteristicsType
{
  return (Class)objc_opt_class();
}

@end
