@implementation CellularVoiceCallEvent

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear(&self->_delayCnts, a2);
  v3.receiver = self;
  v3.super_class = (Class)CellularVoiceCallEvent;
  -[CellularVoiceCallEvent dealloc](&v3, "dealloc");
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_QWORD *)&self->_has >> 1) & 1;
}

- (int)callEvent
{
  if ((*(_QWORD *)&self->_has & 0x400) != 0)
    return self->_callEvent;
  else
    return 430;
}

- (void)setCallEvent:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_callEvent = a3;
}

- (void)setHasCallEvent:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasCallEvent
{
  return (*(_QWORD *)&self->_has >> 10) & 1;
}

- (id)callEventAsString:(int)a3
{
  if ((a3 - 430) >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025FA10 + a3 - 430);
}

- (int)StringAsCallEvent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICE_CALL_START")) & 1) != 0)
  {
    v4 = 430;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICE_CALL_RING")) & 1) != 0)
  {
    v4 = 431;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICE_CALL_CONNECT")) & 1) != 0)
  {
    v4 = 432;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICE_CALL_CANCEL")) & 1) != 0)
  {
    v4 = 433;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VOICE_CALL_END")))
  {
    v4 = 434;
  }
  else
  {
    v4 = 430;
  }

  return v4;
}

- (BOOL)hasCallId
{
  return self->_callId != 0;
}

- (int)direction
{
  if ((*(_QWORD *)&self->_has & 0x4000) != 0)
    return self->_direction;
  else
    return 0;
}

- (void)setDirection:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_direction = a3;
}

- (void)setHasDirection:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasDirection
{
  return (*(_QWORD *)&self->_has >> 14) & 1;
}

- (id)directionAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025FA80 + a3);
}

- (int)StringAsDirection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICE_CALL_DIRECTION_MT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICE_CALL_DIRECTION_MO")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VOICE_CALL_DIRECTION_UNKNOWN")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIsAltStart:(BOOL)a3
{
  *((_BYTE *)&self->_has + 8) |= 4u;
  self->_isAltStart = a3;
}

- (void)setHasIsAltStart:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)&self->_has + 8) = *((_BYTE *)&self->_has + 8) & 0xFB | v3;
}

- (BOOL)hasIsAltStart
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 2) & 1;
}

- (void)setHoAltSeqNum:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_hoAltSeqNum = a3;
}

- (void)setHasHoAltSeqNum:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasHoAltSeqNum
{
  return (*(_QWORD *)&self->_has >> 19) & 1;
}

- (void)setDrxOn:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_drxOn = a3;
}

- (void)setHasDrxOn:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasDrxOn
{
  return (*(_QWORD *)&self->_has >> 15) & 1;
}

- (int)endStatus
{
  if ((*(_QWORD *)&self->_has & 0x10000) != 0)
    return self->_endStatus;
  else
    return 0;
}

- (void)setEndStatus:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_endStatus = a3;
}

- (void)setHasEndStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasEndStatus
{
  return (*(_QWORD *)&self->_has >> 16) & 1;
}

- (id)endStatusAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025FA38 + a3);
}

- (int)StringAsEndStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICE_CALL_END_NORMAL")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICE_CALL_END_BY_CANCEL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICE_CALL_END_BY_TIMEOUT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICE_CALL_END_ABNORMAL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VOICE_CALL_END_TO_ALT")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setRrcRelCause:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_rrcRelCause = a3;
}

- (void)setHasRrcRelCause:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRrcRelCause
{
  return HIWORD(*(_QWORD *)&self->_has) & 1;
}

- (void)setCallDuration:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_callDuration = a3;
}

- (void)setHasCallDuration:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasCallDuration
{
  return (*(_QWORD *)&self->_has >> 9) & 1;
}

- (int)antenna
{
  if ((*(_QWORD *)&self->_has & 8) != 0)
    return self->_antenna;
  else
    return 0;
}

- (void)setAntenna:(int)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_antenna = a3;
}

- (void)setHasAntenna:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasAntenna
{
  return (*(_QWORD *)&self->_has >> 3) & 1;
}

- (id)antennaAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025FA60 + a3);
}

- (int)StringAsAntenna:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTD_ANT0")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTD_ANT1")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTD_ANT2")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ARTD_ANT3")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDueToHandover:(BOOL)a3
{
  *((_BYTE *)&self->_has + 8) |= 2u;
  self->_dueToHandover = a3;
}

- (void)setHasDueToHandover:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)&self->_has + 8) = *((_BYTE *)&self->_has + 8) & 0xFD | v3;
}

- (BOOL)hasDueToHandover
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 1) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasCellId
{
  return (*(_QWORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasNumMncDigits
{
  return (*(_QWORD *)&self->_has >> 37) & 1;
}

- (void)setMcc:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasMcc
{
  return (*(_QWORD *)&self->_has >> 26) & 1;
}

- (void)setMnc:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasMnc
{
  return (*(_QWORD *)&self->_has >> 27) & 1;
}

- (void)setLac:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasLac
{
  return (*(_QWORD *)&self->_has >> 21) & 1;
}

- (void)setBand:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasBand
{
  return (*(_QWORD *)&self->_has >> 7) & 1;
}

- (void)setRfChannel:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_rfChannel = a3;
}

- (void)setHasRfChannel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasRfChannel
{
  return (*(_QWORD *)&self->_has >> 47) & 1;
}

- (void)setTsAccuracyHour:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  self->_tsAccuracyHour = a3;
}

- (void)setHasTsAccuracyHour:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTsAccuracyHour
{
  return HIBYTE(*(_QWORD *)&self->_has) & 1;
}

- (void)setAccessoryAttached:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  self->_accessoryAttached = a3;
}

- (void)setHasAccessoryAttached:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAccessoryAttached
{
  return (*(_QWORD *)&self->_has >> 60) & 1;
}

- (void)setAccessoryAttachedBitmap:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_accessoryAttachedBitmap = a3;
}

- (void)setHasAccessoryAttachedBitmap:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasAccessoryAttachedBitmap
{
  return (*(_QWORD *)&self->_has >> 2) & 1;
}

- (int)setupSysMode
{
  if ((*(_QWORD *)&self->_has & 0x8000000000000) != 0)
    return self->_setupSysMode;
  else
    return 0;
}

- (void)setSetupSysMode:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_setupSysMode = a3;
}

- (void)setHasSetupSysMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSetupSysMode
{
  return (*(_QWORD *)&self->_has >> 51) & 1;
}

- (id)setupSysModeAsString:(int)a3
{
  void *v3;

  if (a3 < 0x10 && ((0x9FFFu >> a3) & 1) != 0)
    v3 = *(&off_10025FA98 + a3);
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsSetupSysMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_NO_SRV")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_LTE_V2")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_CDMA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GSM")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_HDR")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_WCDMA")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_EHRPD")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GW")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_WLAN")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_LTE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GWL")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_UMTS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_NR5G")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_CDMA_HDR")))
  {
    v4 = 15;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)setupDirection
{
  if ((*(_QWORD *)&self->_has & 0x4000000000000) != 0)
    return self->_setupDirection;
  else
    return 0;
}

- (void)setSetupDirection:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_setupDirection = a3;
}

- (void)setHasSetupDirection:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSetupDirection
{
  return (*(_QWORD *)&self->_has >> 50) & 1;
}

- (id)setupDirectionAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025FA80 + a3);
}

- (int)StringAsSetupDirection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICE_CALL_DIRECTION_MT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICE_CALL_DIRECTION_MO")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VOICE_CALL_DIRECTION_UNKNOWN")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCallSetupTimeMs:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_callSetupTimeMs = a3;
}

- (void)setHasCallSetupTimeMs:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasCallSetupTimeMs
{
  return (*(_QWORD *)&self->_has >> 11) & 1;
}

- (void)setMtplInPoint1Db:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_mtplInPoint1Db = a3;
}

- (void)setHasMtplInPoint1Db:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasMtplInPoint1Db
{
  return (*(_QWORD *)&self->_has >> 30) & 1;
}

- (void)clearCapEvents
{
  -[NSMutableArray removeAllObjects](self->_capEvents, "removeAllObjects");
}

- (void)addCapEvent:(id)a3
{
  id v4;
  NSMutableArray *capEvents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  capEvents = self->_capEvents;
  v8 = v4;
  if (!capEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_capEvents;
    self->_capEvents = v6;

    v4 = v8;
    capEvents = self->_capEvents;
  }
  -[NSMutableArray addObject:](capEvents, "addObject:", v4);

}

- (unint64_t)capEventsCount
{
  return (unint64_t)-[NSMutableArray count](self->_capEvents, "count");
}

- (id)capEventAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_capEvents, "objectAtIndex:", a3);
}

+ (Class)capEventType
{
  return (Class)objc_opt_class(CapEvent, a2);
}

- (void)setLastXSec:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_lastXSec = a3;
}

- (void)setHasLastXSec:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasLastXSec
{
  return (*(_QWORD *)&self->_has >> 25) & 1;
}

- (void)setLastXSecUlMrab:(BOOL)a3
{
  *((_BYTE *)&self->_has + 8) |= 0x10u;
  self->_lastXSecUlMrab = a3;
}

- (void)setHasLastXSecUlMrab:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)&self->_has + 8) = *((_BYTE *)&self->_has + 8) & 0xEF | v3;
}

- (BOOL)hasLastXSecUlMrab
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 4) & 1;
}

- (void)setLastXSecDlMrab:(BOOL)a3
{
  *((_BYTE *)&self->_has + 8) |= 8u;
  self->_lastXSecDlMrab = a3;
}

- (void)setHasLastXSecDlMrab:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)&self->_has + 8) = *((_BYTE *)&self->_has + 8) & 0xF7 | v3;
}

- (BOOL)hasLastXSecDlMrab
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 3) & 1;
}

- (void)clearRbDatas
{
  -[NSMutableArray removeAllObjects](self->_rbDatas, "removeAllObjects");
}

- (void)addRbData:(id)a3
{
  id v4;
  NSMutableArray *rbDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rbDatas = self->_rbDatas;
  v8 = v4;
  if (!rbDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_rbDatas;
    self->_rbDatas = v6;

    v4 = v8;
    rbDatas = self->_rbDatas;
  }
  -[NSMutableArray addObject:](rbDatas, "addObject:", v4);

}

- (unint64_t)rbDatasCount
{
  return (unint64_t)-[NSMutableArray count](self->_rbDatas, "count");
}

- (id)rbDataAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_rbDatas, "objectAtIndex:", a3);
}

+ (Class)rbDataType
{
  return (Class)objc_opt_class(RbData, a2);
}

- (void)setMsgId:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_msgId = a3;
}

- (void)setHasMsgId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasMsgId
{
  return (*(_QWORD *)&self->_has >> 29) & 1;
}

- (void)setEventId:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_eventId = a3;
}

- (void)setHasEventId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasEventId
{
  return (*(_QWORD *)&self->_has >> 17) & 1;
}

- (void)setResponseCode:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_responseCode = a3;
}

- (void)setHasResponseCode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasResponseCode
{
  return (*(_QWORD *)&self->_has >> 46) & 1;
}

- (void)setCallConnectDur:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_callConnectDur = a3;
}

- (void)setHasCallConnectDur:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasCallConnectDur
{
  return (*(_QWORD *)&self->_has >> 8) & 1;
}

- (void)setTbMs:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  self->_tbMs = a3;
}

- (void)setHasTbMs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTbMs
{
  return (*(_QWORD *)&self->_has >> 55) & 1;
}

- (void)clearHcStats
{
  -[NSMutableArray removeAllObjects](self->_hcStats, "removeAllObjects");
}

- (void)addHcStat:(id)a3
{
  id v4;
  NSMutableArray *hcStats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  hcStats = self->_hcStats;
  v8 = v4;
  if (!hcStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_hcStats;
    self->_hcStats = v6;

    v4 = v8;
    hcStats = self->_hcStats;
  }
  -[NSMutableArray addObject:](hcStats, "addObject:", v4);

}

- (unint64_t)hcStatsCount
{
  return (unint64_t)-[NSMutableArray count](self->_hcStats, "count");
}

- (id)hcStatAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_hcStats, "objectAtIndex:", a3);
}

+ (Class)hcStatType
{
  return (Class)objc_opt_class(HcStat, a2);
}

- (void)setNumRecvdSpeechPkt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_numRecvdSpeechPkt = a3;
}

- (void)setHasNumRecvdSpeechPkt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumRecvdSpeechPkt
{
  return (*(_QWORD *)&self->_has >> 40) & 1;
}

- (void)setNumRecvdSilencePkt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_numRecvdSilencePkt = a3;
}

- (void)setHasNumRecvdSilencePkt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasNumRecvdSilencePkt
{
  return (*(_QWORD *)&self->_has >> 39) & 1;
}

- (void)setNumLostPkt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_numLostPkt = a3;
}

- (void)setHasNumLostPkt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasNumLostPkt
{
  return (*(_QWORD *)&self->_has >> 35) & 1;
}

- (void)setNumUflwSpeechPkt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_numUflwSpeechPkt = a3;
}

- (void)setHasNumUflwSpeechPkt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumUflwSpeechPkt
{
  return (*(_QWORD *)&self->_has >> 44) & 1;
}

- (void)setNumUflwSilencePkt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_numUflwSilencePkt = a3;
}

- (void)setHasNumUflwSilencePkt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasNumUflwSilencePkt
{
  return (*(_QWORD *)&self->_has >> 43) & 1;
}

- (void)setNumEnqdSpeechPkt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_numEnqdSpeechPkt = a3;
}

- (void)setHasNumEnqdSpeechPkt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasNumEnqdSpeechPkt
{
  return (*(_QWORD *)&self->_has >> 34) & 1;
}

- (void)setNumEnqdSilencePkt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_numEnqdSilencePkt = a3;
}

- (void)setHasNumEnqdSilencePkt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasNumEnqdSilencePkt
{
  return (*(_QWORD *)&self->_has >> 33) & 1;
}

- (void)setNumPlayedSpeechPkt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_numPlayedSpeechPkt = a3;
}

- (void)setHasNumPlayedSpeechPkt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasNumPlayedSpeechPkt
{
  return (*(_QWORD *)&self->_has >> 38) & 1;
}

- (void)setNumMissedSpeechPkt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_numMissedSpeechPkt = a3;
}

- (void)setHasNumMissedSpeechPkt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasNumMissedSpeechPkt
{
  return (*(_QWORD *)&self->_has >> 36) & 1;
}

- (void)setNumSpeechQempty:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_numSpeechQempty = a3;
}

- (void)setHasNumSpeechQempty:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumSpeechQempty
{
  return (*(_QWORD *)&self->_has >> 41) & 1;
}

- (void)setAppCallId:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_appCallId = a3;
}

- (void)setHasAppCallId:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasAppCallId
{
  return (*(_QWORD *)&self->_has >> 4) & 1;
}

- (unint64_t)delayCntsCount
{
  return self->_delayCnts.count;
}

- (unsigned)delayCnts
{
  return self->_delayCnts.list;
}

- (void)clearDelayCnts
{
  PBRepeatedUInt32Clear(&self->_delayCnts, a2);
}

- (void)addDelayCnt:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_delayCnts, *(_QWORD *)&a3);
}

- (unsigned)delayCntAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_delayCnts;
  unint64_t count;
  void *v6;
  void *v7;

  p_delayCnts = &self->_delayCnts;
  count = self->_delayCnts.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_delayCnts->list[a3];
}

- (void)setDelayCnts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_delayCnts, a3, a4);
}

- (void)setDedicatedBrInactiveToEndMs:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_dedicatedBrInactiveToEndMs = a3;
}

- (void)setHasDedicatedBrInactiveToEndMs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasDedicatedBrInactiveToEndMs
{
  return (*(_QWORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasLastAudioQualityCnt
{
  return self->_lastAudioQualityCnt != 0;
}

- (void)setRtpPktLossPpt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_rtpPktLossPpt = a3;
}

- (void)setHasRtpPktLossPpt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRtpPktLossPpt
{
  return (*(_QWORD *)&self->_has >> 49) & 1;
}

- (void)setUflwPktPpt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  self->_uflwPktPpt = a3;
}

- (void)setHasUflwPktPpt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasUflwPktPpt
{
  return (*(_QWORD *)&self->_has >> 58) & 1;
}

- (void)setFrErasurePpt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_frErasurePpt = a3;
}

- (void)setHasFrErasurePpt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasFrErasurePpt
{
  return (*(_QWORD *)&self->_has >> 18) & 1;
}

- (void)setBadAudioQuality:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  self->_badAudioQuality = a3;
}

- (void)setHasBadAudioQuality:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasBadAudioQuality
{
  return (*(_QWORD *)&self->_has >> 61) & 1;
}

- (void)setAudioQualityThresholdPpt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_audioQualityThresholdPpt = a3;
}

- (void)setHasAudioQualityThresholdPpt:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasAudioQualityThresholdPpt
{
  return (*(_QWORD *)&self->_has >> 6) & 1;
}

- (void)setAudioQosDetectWinLenSec:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_audioQosDetectWinLenSec = a3;
}

- (void)setHasAudioQosDetectWinLenSec:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasAudioQosDetectWinLenSec
{
  return (*(_QWORD *)&self->_has >> 5) & 1;
}

- (void)clearRfMeasInfos
{
  -[NSMutableArray removeAllObjects](self->_rfMeasInfos, "removeAllObjects");
}

- (void)addRfMeasInfo:(id)a3
{
  id v4;
  NSMutableArray *rfMeasInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rfMeasInfos = self->_rfMeasInfos;
  v8 = v4;
  if (!rfMeasInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_rfMeasInfos;
    self->_rfMeasInfos = v6;

    v4 = v8;
    rfMeasInfos = self->_rfMeasInfos;
  }
  -[NSMutableArray addObject:](rfMeasInfos, "addObject:", v4);

}

- (unint64_t)rfMeasInfosCount
{
  return (unint64_t)-[NSMutableArray count](self->_rfMeasInfos, "count");
}

- (id)rfMeasInfoAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_rfMeasInfos, "objectAtIndex:", a3);
}

+ (Class)rfMeasInfoType
{
  return (Class)objc_opt_class(RfMeasInfo, a2);
}

- (void)setHstState:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_hstState = a3;
}

- (void)setHasHstState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasHstState
{
  return (*(_QWORD *)&self->_has >> 20) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPsPref
{
  return (*(_QWORD *)&self->_has >> 45) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_QWORD *)&self->_has >> 42) & 1;
}

- (void)setNumCps:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= (unint64_t)&_mh_execute_header;
  self->_numCps = a3;
}

- (void)setHasNumCps:(BOOL)a3
{
  const mach_header_64 *v3;

  v3 = &_mh_execute_header;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | (unint64_t)v3;
}

- (BOOL)hasNumCps
{
  return HIDWORD(*(_QWORD *)&self->_has) & 1;
}

- (int)sysModeO
{
  if ((*(_QWORD *)&self->_has & 0x40000000000000) != 0)
    return self->_sysModeO;
  else
    return 0;
}

- (void)setSysModeO:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  self->_sysModeO = a3;
}

- (void)setHasSysModeO:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSysModeO
{
  return (*(_QWORD *)&self->_has >> 54) & 1;
}

- (id)sysModeOAsString:(int)a3
{
  void *v3;

  if (a3 < 0x10 && ((0x9FFFu >> a3) & 1) != 0)
    v3 = *(&off_10025FA98 + a3);
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsSysModeO:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_NO_SRV")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_LTE_V2")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_CDMA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GSM")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_HDR")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_WCDMA")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_EHRPD")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GW")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_WLAN")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_LTE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GWL")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_UMTS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_NR5G")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_CDMA_HDR")))
  {
    v4 = 15;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSidO:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  self->_sidO = a3;
}

- (void)setHasSidO:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSidO
{
  return (*(_QWORD *)&self->_has >> 52) & 1;
}

- (void)setNidO:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_nidO = a3;
}

- (void)setHasNidO:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasNidO
{
  return (*(_QWORD *)&self->_has >> 31) & 1;
}

- (BOOL)hasPlmnO
{
  return self->_plmnO != 0;
}

- (void)setLastRssi:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_lastRssi = a3;
}

- (void)setHasLastRssi:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasLastRssi
{
  return (*(_QWORD *)&self->_has >> 24) & 1;
}

- (void)setLastRsrp:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_lastRsrp = a3;
}

- (void)setHasLastRsrp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasLastRsrp
{
  return (*(_QWORD *)&self->_has >> 23) & 1;
}

- (void)setBarredFromSib1:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  self->_barredFromSib1 = a3;
}

- (void)setHasBarredFromSib1:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasBarredFromSib1
{
  return (*(_QWORD *)&self->_has >> 62) & 1;
}

- (void)setBarredFromSib2:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  self->_barredFromSib2 = a3;
}

- (void)setHasBarredFromSib2:(BOOL)a3
{
  unint64_t v3;

  v3 = 0x8000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = v3 & 0x8000000000000000 | *(_QWORD *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasBarredFromSib2
{
  return *(_QWORD *)&self->_has >> 63;
}

- (void)setConnectionRejected:(BOOL)a3
{
  *((_BYTE *)&self->_has + 8) |= 1u;
  self->_connectionRejected = a3;
}

- (void)setHasConnectionRejected:(BOOL)a3
{
  *((_BYTE *)&self->_has + 8) = *((_BYTE *)&self->_has + 8) & 0xFE | a3;
}

- (BOOL)hasConnectionRejected
{
  return *((_BYTE *)&self->_has + 8) & 1;
}

- (void)setLastMotionState:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_lastMotionState = a3;
}

- (void)setHasLastMotionState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasLastMotionState
{
  return (*(_QWORD *)&self->_has >> 22) & 1;
}

- (void)setMsSinceLastMotionState:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_msSinceLastMotionState = a3;
}

- (void)setHasMsSinceLastMotionState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasMsSinceLastMotionState
{
  return (*(_QWORD *)&self->_has >> 28) & 1;
}

- (void)setVersion:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasVersion
{
  return (*(_QWORD *)&self->_has >> 59) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSubsId
{
  return (*(_QWORD *)&self->_has >> 53) & 1;
}

- (int)typeOfCall
{
  if ((*(_QWORD *)&self->_has & 0x200000000000000) != 0)
    return self->_typeOfCall;
  else
    return 0;
}

- (void)setTypeOfCall:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  self->_typeOfCall = a3;
}

- (void)setHasTypeOfCall:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTypeOfCall
{
  return (*(_QWORD *)&self->_has >> 57) & 1;
}

- (id)typeOfCallAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025FB18 + a3);
}

- (int)StringAsTypeOfCall:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoNR")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoLTE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EPSFB")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoNR_VoLTE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setNr5gCellId:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_nr5gCellId = a3;
}

- (void)setHasNr5gCellId:(BOOL)a3
{
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasNr5gCellId
{
  return *(_DWORD *)&self->_has & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularVoiceCallEvent;
  v3 = -[CellularVoiceCallEvent description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularVoiceCallEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t has;
  void *v5;
  int v6;
  void *v7;
  NSString *callId;
  $346717B1E636FA12719EF20158CDC99B *p_has;
  uint64_t v10;
  uint64_t direction;
  void *v12;
  char v13;
  void *v14;
  NSData *simHplmn;
  $346717B1E636FA12719EF20158CDC99B *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  id v30;
  NSMutableArray *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *j;
  void *v36;
  $346717B1E636FA12719EF20158CDC99B *v37;
  uint64_t v38;
  void *v39;
  id v40;
  NSMutableArray *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *k;
  void *v46;
  $346717B1E636FA12719EF20158CDC99B *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  AudioQuality *lastAudioQualityCnt;
  void *v54;
  $346717B1E636FA12719EF20158CDC99B *v55;
  uint64_t v56;
  void *v57;
  id v58;
  NSMutableArray *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *m;
  void *v64;
  $346717B1E636FA12719EF20158CDC99B *v65;
  uint64_t v66;
  void *v67;
  NSData *plmnO;
  uint64_t v69;
  void *v70;
  char v71;
  void *v72;
  id v73;
  void *v75;
  void *v76;
  void *v77;
  uint64_t endStatus;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t setupSysMode;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t sysModeO;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t typeOfCall;
  void *v125;
  void *v126;
  void *v127;
  uint64_t antenna;
  void *v129;
  void *v130;
  uint64_t setupDirection;
  void *v132;
  void *v133;
  void *v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (uint64_t)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (uint64_t)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    v6 = self->_callEvent - 430;
    if (v6 >= 5)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_callEvent));
    else
      v7 = *(&off_10025FA10 + v6);
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("call_event"));

  }
  callId = self->_callId;
  if (callId)
    objc_msgSend(v3, "setObject:forKey:", callId, CFSTR("call_id"));
  p_has = &self->_has;
  v10 = (uint64_t)self->_has;
  if ((v10 & 0x4000) != 0)
  {
    direction = self->_direction;
    if (direction >= 3)
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_direction));
    else
      v12 = *(&off_10025FA80 + direction);
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("direction"));

    p_has = &self->_has;
    v10 = (uint64_t)self->_has;
  }
  v13 = *((_BYTE *)p_has + 8);
  if ((v13 & 4) != 0)
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isAltStart));
    objc_msgSend(v3, "setObject:forKey:", v75, CFSTR("is_alt_start"));

    v10 = (uint64_t)self->_has;
    v13 = *((_BYTE *)&self->_has + 8);
    if ((v10 & 0x80000) == 0)
    {
LABEL_17:
      if ((v10 & 0x8000) == 0)
        goto LABEL_18;
      goto LABEL_138;
    }
  }
  else if ((v10 & 0x80000) == 0)
  {
    goto LABEL_17;
  }
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hoAltSeqNum));
  objc_msgSend(v3, "setObject:forKey:", v76, CFSTR("ho_alt_seq_num"));

  v10 = (uint64_t)self->_has;
  v13 = *((_BYTE *)&self->_has + 8);
  if ((v10 & 0x8000) == 0)
  {
LABEL_18:
    if ((v10 & 0x10000) == 0)
      goto LABEL_19;
    goto LABEL_139;
  }
LABEL_138:
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_drxOn));
  objc_msgSend(v3, "setObject:forKey:", v77, CFSTR("drx_on"));

  v10 = (uint64_t)self->_has;
  v13 = *((_BYTE *)&self->_has + 8);
  if ((v10 & 0x10000) == 0)
  {
LABEL_19:
    if ((v10 & 0x1000000000000) == 0)
      goto LABEL_20;
    goto LABEL_194;
  }
LABEL_139:
  endStatus = self->_endStatus;
  if (endStatus >= 5)
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_endStatus));
  else
    v79 = *(&off_10025FA38 + endStatus);
  objc_msgSend(v3, "setObject:forKey:", v79, CFSTR("end_status"));

  v10 = (uint64_t)self->_has;
  v13 = *((_BYTE *)&self->_has + 8);
  if ((v10 & 0x1000000000000) == 0)
  {
LABEL_20:
    if ((v10 & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_195;
  }
LABEL_194:
  v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rrcRelCause));
  objc_msgSend(v3, "setObject:forKey:", v126, CFSTR("rrc_rel_cause"));

  v10 = (uint64_t)self->_has;
  v13 = *((_BYTE *)&self->_has + 8);
  if ((v10 & 0x200) == 0)
  {
LABEL_21:
    if ((v10 & 8) == 0)
      goto LABEL_22;
    goto LABEL_196;
  }
LABEL_195:
  v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_callDuration));
  objc_msgSend(v3, "setObject:forKey:", v127, CFSTR("call_duration"));

  v10 = (uint64_t)self->_has;
  v13 = *((_BYTE *)&self->_has + 8);
  if ((v10 & 8) == 0)
  {
LABEL_22:
    if ((v13 & 2) == 0)
      goto LABEL_23;
    goto LABEL_203;
  }
LABEL_196:
  antenna = self->_antenna;
  if (antenna >= 4)
    v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_antenna));
  else
    v129 = *(&off_10025FA60 + antenna);
  objc_msgSend(v3, "setObject:forKey:", v129, CFSTR("antenna"));

  v10 = (uint64_t)self->_has;
  if ((*((_BYTE *)&self->_has + 8) & 2) == 0)
  {
LABEL_23:
    if ((v10 & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_203:
  v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_dueToHandover));
  objc_msgSend(v3, "setObject:forKey:", v130, CFSTR("due_to_handover"));

  if ((*(_QWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_24:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("cell_id"));

  }
LABEL_25:
  simHplmn = self->_simHplmn;
  if (simHplmn)
    objc_msgSend(v3, "setObject:forKey:", simHplmn, CFSTR("sim_hplmn"));
  v16 = &self->_has;
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x2000000000) != 0)
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numMncDigits));
    objc_msgSend(v3, "setObject:forKey:", v80, CFSTR("num_mnc_digits"));

    v17 = *(_QWORD *)v16;
    if ((*(_QWORD *)v16 & 0x4000000) == 0)
    {
LABEL_29:
      if ((v17 & 0x8000000) == 0)
        goto LABEL_30;
      goto LABEL_143;
    }
  }
  else if ((v17 & 0x4000000) == 0)
  {
    goto LABEL_29;
  }
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mcc));
  objc_msgSend(v3, "setObject:forKey:", v81, CFSTR("mcc"));

  v17 = (uint64_t)self->_has;
  if ((v17 & 0x8000000) == 0)
  {
LABEL_30:
    if ((v17 & 0x200000) == 0)
      goto LABEL_31;
    goto LABEL_144;
  }
LABEL_143:
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mnc));
  objc_msgSend(v3, "setObject:forKey:", v82, CFSTR("mnc"));

  v17 = (uint64_t)self->_has;
  if ((v17 & 0x200000) == 0)
  {
LABEL_31:
    if ((v17 & 0x80) == 0)
      goto LABEL_32;
    goto LABEL_145;
  }
LABEL_144:
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lac));
  objc_msgSend(v3, "setObject:forKey:", v83, CFSTR("lac"));

  v17 = (uint64_t)self->_has;
  if ((v17 & 0x80) == 0)
  {
LABEL_32:
    if ((v17 & 0x800000000000) == 0)
      goto LABEL_33;
    goto LABEL_146;
  }
LABEL_145:
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_band));
  objc_msgSend(v3, "setObject:forKey:", v84, CFSTR("band"));

  v17 = (uint64_t)self->_has;
  if ((v17 & 0x800000000000) == 0)
  {
LABEL_33:
    if ((v17 & 0x100000000000000) == 0)
      goto LABEL_34;
    goto LABEL_147;
  }
LABEL_146:
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rfChannel));
  objc_msgSend(v3, "setObject:forKey:", v85, CFSTR("rf_channel"));

  v17 = (uint64_t)self->_has;
  if ((v17 & 0x100000000000000) == 0)
  {
LABEL_34:
    if ((v17 & 0x1000000000000000) == 0)
      goto LABEL_35;
    goto LABEL_148;
  }
LABEL_147:
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tsAccuracyHour));
  objc_msgSend(v3, "setObject:forKey:", v86, CFSTR("ts_accuracy_hour"));

  v17 = (uint64_t)self->_has;
  if ((v17 & 0x1000000000000000) == 0)
  {
LABEL_35:
    if ((v17 & 4) == 0)
      goto LABEL_36;
    goto LABEL_149;
  }
LABEL_148:
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_accessoryAttached));
  objc_msgSend(v3, "setObject:forKey:", v87, CFSTR("accessory_attached"));

  v17 = (uint64_t)self->_has;
  if ((v17 & 4) == 0)
  {
LABEL_36:
    if ((v17 & 0x8000000000000) == 0)
      goto LABEL_37;
    goto LABEL_150;
  }
LABEL_149:
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_accessoryAttachedBitmap));
  objc_msgSend(v3, "setObject:forKey:", v88, CFSTR("accessory_attached_bitmap"));

  v17 = (uint64_t)self->_has;
  if ((v17 & 0x8000000000000) == 0)
  {
LABEL_37:
    if ((v17 & 0x4000000000000) == 0)
      goto LABEL_38;
    goto LABEL_207;
  }
LABEL_150:
  setupSysMode = self->_setupSysMode;
  if (setupSysMode < 0x10 && ((0x9FFFu >> setupSysMode) & 1) != 0)
    v90 = *(&off_10025FA98 + setupSysMode);
  else
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_setupSysMode));
  objc_msgSend(v3, "setObject:forKey:", v90, CFSTR("setup_sys_mode"));

  v17 = (uint64_t)self->_has;
  if ((v17 & 0x4000000000000) == 0)
  {
LABEL_38:
    if ((v17 & 0x800) == 0)
      goto LABEL_39;
    goto LABEL_211;
  }
LABEL_207:
  setupDirection = self->_setupDirection;
  if (setupDirection >= 3)
    v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_setupDirection));
  else
    v132 = *(&off_10025FA80 + setupDirection);
  objc_msgSend(v3, "setObject:forKey:", v132, CFSTR("setup_direction"));

  v17 = (uint64_t)self->_has;
  if ((v17 & 0x800) == 0)
  {
LABEL_39:
    if ((v17 & 0x40000000) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_211:
  v133 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_callSetupTimeMs));
  objc_msgSend(v3, "setObject:forKey:", v133, CFSTR("call_setup_time_ms"));

  if ((*(_QWORD *)&self->_has & 0x40000000) != 0)
  {
LABEL_40:
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mtplInPoint1Db));
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("mtpl_in_point_1_db"));

  }
LABEL_41:
  if (-[NSMutableArray count](self->_capEvents, "count"))
  {
    v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_capEvents, "count"));
    v147 = 0u;
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v20 = self->_capEvents;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v147, v154, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v148;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v148 != v23)
            objc_enumerationMutation(v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v147 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v147, v154, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("cap_event"));
  }
  if ((*(_QWORD *)&self->_has & 0x2000000) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lastXSec));
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("last_x_sec"));

  }
  v27 = *((_BYTE *)&self->_has + 8);
  if ((v27 & 0x10) != 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_lastXSecUlMrab));
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("last_x_sec_ul_mrab"));

    v27 = *((_BYTE *)&self->_has + 8);
  }
  if ((v27 & 8) != 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_lastXSecDlMrab));
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("last_x_sec_dl_mrab"));

  }
  if (-[NSMutableArray count](self->_rbDatas, "count"))
  {
    v30 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_rbDatas, "count"));
    v143 = 0u;
    v144 = 0u;
    v145 = 0u;
    v146 = 0u;
    v31 = self->_rbDatas;
    v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v143, v153, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v144;
      do
      {
        for (j = 0; j != v33; j = (char *)j + 1)
        {
          if (*(_QWORD *)v144 != v34)
            objc_enumerationMutation(v31);
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v143 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
          objc_msgSend(v30, "addObject:", v36);

        }
        v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v143, v153, 16);
      }
      while (v33);
    }

    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("rb_data"));
  }
  v37 = &self->_has;
  v38 = (uint64_t)self->_has;
  if ((v38 & 0x20000000) != 0)
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_msgId));
    objc_msgSend(v3, "setObject:forKey:", v91, CFSTR("msg_id"));

    v38 = *(_QWORD *)v37;
    if ((*(_QWORD *)v37 & 0x20000) == 0)
    {
LABEL_67:
      if ((v38 & 0x400000000000) == 0)
        goto LABEL_68;
      goto LABEL_155;
    }
  }
  else if ((v38 & 0x20000) == 0)
  {
    goto LABEL_67;
  }
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_eventId));
  objc_msgSend(v3, "setObject:forKey:", v92, CFSTR("event_id"));

  v38 = (uint64_t)self->_has;
  if ((v38 & 0x400000000000) == 0)
  {
LABEL_68:
    if ((v38 & 0x100) == 0)
      goto LABEL_69;
    goto LABEL_156;
  }
LABEL_155:
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_responseCode));
  objc_msgSend(v3, "setObject:forKey:", v93, CFSTR("response_code"));

  v38 = (uint64_t)self->_has;
  if ((v38 & 0x100) == 0)
  {
LABEL_69:
    if ((v38 & 0x80000000000000) == 0)
      goto LABEL_71;
    goto LABEL_70;
  }
LABEL_156:
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_callConnectDur));
  objc_msgSend(v3, "setObject:forKey:", v94, CFSTR("call_connect_dur"));

  if ((*(_QWORD *)&self->_has & 0x80000000000000) != 0)
  {
LABEL_70:
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tbMs));
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("tb_ms"));

  }
LABEL_71:
  if (-[NSMutableArray count](self->_hcStats, "count"))
  {
    v40 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_hcStats, "count"));
    v139 = 0u;
    v140 = 0u;
    v141 = 0u;
    v142 = 0u;
    v41 = self->_hcStats;
    v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v139, v152, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v140;
      do
      {
        for (k = 0; k != v43; k = (char *)k + 1)
        {
          if (*(_QWORD *)v140 != v44)
            objc_enumerationMutation(v41);
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v139 + 1) + 8 * (_QWORD)k), "dictionaryRepresentation"));
          objc_msgSend(v40, "addObject:", v46);

        }
        v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v139, v152, 16);
      }
      while (v43);
    }

    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("hc_stat"));
  }
  v47 = &self->_has;
  v48 = (uint64_t)self->_has;
  if ((v48 & 0x10000000000) != 0)
  {
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numRecvdSpeechPkt));
    objc_msgSend(v3, "setObject:forKey:", v95, CFSTR("num_recvd_speech_pkt"));

    v48 = *(_QWORD *)v47;
    if ((*(_QWORD *)v47 & 0x8000000000) == 0)
    {
LABEL_82:
      if ((v48 & 0x800000000) == 0)
        goto LABEL_83;
      goto LABEL_160;
    }
  }
  else if ((v48 & 0x8000000000) == 0)
  {
    goto LABEL_82;
  }
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numRecvdSilencePkt));
  objc_msgSend(v3, "setObject:forKey:", v96, CFSTR("num_recvd_silence_pkt"));

  v48 = (uint64_t)self->_has;
  if ((v48 & 0x800000000) == 0)
  {
LABEL_83:
    if ((v48 & 0x100000000000) == 0)
      goto LABEL_84;
    goto LABEL_161;
  }
LABEL_160:
  v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numLostPkt));
  objc_msgSend(v3, "setObject:forKey:", v97, CFSTR("num_lost_pkt"));

  v48 = (uint64_t)self->_has;
  if ((v48 & 0x100000000000) == 0)
  {
LABEL_84:
    if ((v48 & 0x80000000000) == 0)
      goto LABEL_85;
    goto LABEL_162;
  }
LABEL_161:
  v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numUflwSpeechPkt));
  objc_msgSend(v3, "setObject:forKey:", v98, CFSTR("num_uflw_speech_pkt"));

  v48 = (uint64_t)self->_has;
  if ((v48 & 0x80000000000) == 0)
  {
LABEL_85:
    if ((v48 & 0x400000000) == 0)
      goto LABEL_86;
    goto LABEL_163;
  }
LABEL_162:
  v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numUflwSilencePkt));
  objc_msgSend(v3, "setObject:forKey:", v99, CFSTR("num_uflw_silence_pkt"));

  v48 = (uint64_t)self->_has;
  if ((v48 & 0x400000000) == 0)
  {
LABEL_86:
    if ((v48 & 0x200000000) == 0)
      goto LABEL_87;
    goto LABEL_164;
  }
LABEL_163:
  v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numEnqdSpeechPkt));
  objc_msgSend(v3, "setObject:forKey:", v100, CFSTR("num_enqd_speech_pkt"));

  v48 = (uint64_t)self->_has;
  if ((v48 & 0x200000000) == 0)
  {
LABEL_87:
    if ((v48 & 0x4000000000) == 0)
      goto LABEL_88;
    goto LABEL_165;
  }
LABEL_164:
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numEnqdSilencePkt));
  objc_msgSend(v3, "setObject:forKey:", v101, CFSTR("num_enqd_silence_pkt"));

  v48 = (uint64_t)self->_has;
  if ((v48 & 0x4000000000) == 0)
  {
LABEL_88:
    if ((v48 & 0x1000000000) == 0)
      goto LABEL_89;
    goto LABEL_166;
  }
LABEL_165:
  v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numPlayedSpeechPkt));
  objc_msgSend(v3, "setObject:forKey:", v102, CFSTR("num_played_speech_pkt"));

  v48 = (uint64_t)self->_has;
  if ((v48 & 0x1000000000) == 0)
  {
LABEL_89:
    if ((v48 & 0x20000000000) == 0)
      goto LABEL_90;
    goto LABEL_167;
  }
LABEL_166:
  v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numMissedSpeechPkt));
  objc_msgSend(v3, "setObject:forKey:", v103, CFSTR("num_missed_speech_pkt"));

  v48 = (uint64_t)self->_has;
  if ((v48 & 0x20000000000) == 0)
  {
LABEL_90:
    if ((v48 & 0x10) == 0)
      goto LABEL_92;
    goto LABEL_91;
  }
LABEL_167:
  v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSpeechQempty));
  objc_msgSend(v3, "setObject:forKey:", v104, CFSTR("num_speech_qempty"));

  if ((*(_QWORD *)&self->_has & 0x10) != 0)
  {
LABEL_91:
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_appCallId));
    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("app_call_id"));

  }
LABEL_92:
  v50 = PBRepeatedUInt32NSArray(&self->_delayCnts);
  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
  objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("delay_cnt"));

  if ((*(_QWORD *)&self->_has & 0x2000) != 0)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dedicatedBrInactiveToEndMs));
    objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("dedicated_br_inactive_to_end_ms"));

  }
  lastAudioQualityCnt = self->_lastAudioQualityCnt;
  if (lastAudioQualityCnt)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[AudioQuality dictionaryRepresentation](lastAudioQualityCnt, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("last_audio_quality_cnt"));

  }
  v55 = &self->_has;
  v56 = (uint64_t)self->_has;
  if ((v56 & 0x2000000000000) != 0)
  {
    v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rtpPktLossPpt));
    objc_msgSend(v3, "setObject:forKey:", v105, CFSTR("rtp_pkt_loss_ppt"));

    v56 = *(_QWORD *)v55;
    if ((*(_QWORD *)v55 & 0x400000000000000) == 0)
    {
LABEL_98:
      if ((v56 & 0x40000) == 0)
        goto LABEL_99;
      goto LABEL_171;
    }
  }
  else if ((v56 & 0x400000000000000) == 0)
  {
    goto LABEL_98;
  }
  v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_uflwPktPpt));
  objc_msgSend(v3, "setObject:forKey:", v106, CFSTR("uflw_pkt_ppt"));

  v56 = (uint64_t)self->_has;
  if ((v56 & 0x40000) == 0)
  {
LABEL_99:
    if ((v56 & 0x2000000000000000) == 0)
      goto LABEL_100;
    goto LABEL_172;
  }
LABEL_171:
  v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_frErasurePpt));
  objc_msgSend(v3, "setObject:forKey:", v107, CFSTR("fr_erasure_ppt"));

  v56 = (uint64_t)self->_has;
  if ((v56 & 0x2000000000000000) == 0)
  {
LABEL_100:
    if ((v56 & 0x40) == 0)
      goto LABEL_101;
    goto LABEL_173;
  }
LABEL_172:
  v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_badAudioQuality));
  objc_msgSend(v3, "setObject:forKey:", v108, CFSTR("bad_audio_quality"));

  v56 = (uint64_t)self->_has;
  if ((v56 & 0x40) == 0)
  {
LABEL_101:
    if ((v56 & 0x20) == 0)
      goto LABEL_103;
    goto LABEL_102;
  }
LABEL_173:
  v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_audioQualityThresholdPpt));
  objc_msgSend(v3, "setObject:forKey:", v109, CFSTR("audio_quality_threshold_ppt"));

  if ((*(_QWORD *)&self->_has & 0x20) != 0)
  {
LABEL_102:
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_audioQosDetectWinLenSec));
    objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("audio_qos_detect_win_len_sec"));

  }
LABEL_103:
  if (-[NSMutableArray count](self->_rfMeasInfos, "count"))
  {
    v58 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_rfMeasInfos, "count"));
    v135 = 0u;
    v136 = 0u;
    v137 = 0u;
    v138 = 0u;
    v59 = self->_rfMeasInfos;
    v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v135, v151, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v136;
      do
      {
        for (m = 0; m != v61; m = (char *)m + 1)
        {
          if (*(_QWORD *)v136 != v62)
            objc_enumerationMutation(v59);
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * (_QWORD)m), "dictionaryRepresentation"));
          objc_msgSend(v58, "addObject:", v64);

        }
        v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v135, v151, 16);
      }
      while (v61);
    }

    objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("rf_meas_info"));
  }
  v65 = &self->_has;
  v66 = (uint64_t)self->_has;
  if ((v66 & 0x100000) != 0)
  {
    v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hstState));
    objc_msgSend(v3, "setObject:forKey:", v110, CFSTR("hst_state"));

    v66 = *(_QWORD *)v65;
    if ((*(_QWORD *)v65 & 0x200000000000) == 0)
    {
LABEL_114:
      if ((v66 & 0x40000000000) == 0)
        goto LABEL_115;
      goto LABEL_177;
    }
  }
  else if ((v66 & 0x200000000000) == 0)
  {
    goto LABEL_114;
  }
  v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
  objc_msgSend(v3, "setObject:forKey:", v111, CFSTR("ps_pref"));

  v66 = (uint64_t)self->_has;
  if ((v66 & 0x40000000000) == 0)
  {
LABEL_115:
    if ((v66 & 0x100000000) == 0)
      goto LABEL_116;
    goto LABEL_178;
  }
LABEL_177:
  v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v112, CFSTR("num_subs"));

  v66 = (uint64_t)self->_has;
  if ((v66 & 0x100000000) == 0)
  {
LABEL_116:
    if ((v66 & 0x40000000000000) == 0)
      goto LABEL_117;
    goto LABEL_179;
  }
LABEL_178:
  v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numCps));
  objc_msgSend(v3, "setObject:forKey:", v113, CFSTR("num_cps"));

  v66 = (uint64_t)self->_has;
  if ((v66 & 0x40000000000000) == 0)
  {
LABEL_117:
    if ((v66 & 0x10000000000000) == 0)
      goto LABEL_118;
    goto LABEL_215;
  }
LABEL_179:
  sysModeO = self->_sysModeO;
  if (sysModeO < 0x10 && ((0x9FFFu >> sysModeO) & 1) != 0)
    v115 = *(&off_10025FA98 + sysModeO);
  else
    v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sysModeO));
  objc_msgSend(v3, "setObject:forKey:", v115, CFSTR("sys_mode_o"));

  v66 = (uint64_t)self->_has;
  if ((v66 & 0x10000000000000) == 0)
  {
LABEL_118:
    if ((v66 & 0x80000000) == 0)
      goto LABEL_120;
    goto LABEL_119;
  }
LABEL_215:
  v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sidO));
  objc_msgSend(v3, "setObject:forKey:", v134, CFSTR("sid_o"));

  if ((*(_QWORD *)&self->_has & 0x80000000) != 0)
  {
LABEL_119:
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nidO));
    objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("nid_o"));

  }
LABEL_120:
  plmnO = self->_plmnO;
  if (plmnO)
    objc_msgSend(v3, "setObject:forKey:", plmnO, CFSTR("plmn_o"));
  v69 = (uint64_t)self->_has;
  if ((v69 & 0x1000000) != 0)
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_lastRssi));
    objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("last_rssi"));

    v69 = (uint64_t)self->_has;
  }
  v71 = *((_BYTE *)&self->_has + 8);
  if ((v69 & 0x800000) != 0)
  {
    v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_lastRsrp));
    objc_msgSend(v3, "setObject:forKey:", v116, CFSTR("last_rsrp"));

    v69 = (uint64_t)self->_has;
    v71 = *((_BYTE *)&self->_has + 8);
    if ((v69 & 0x4000000000000000) == 0)
    {
LABEL_126:
      if ((v69 & 0x8000000000000000) == 0)
        goto LABEL_127;
      goto LABEL_184;
    }
  }
  else if ((v69 & 0x4000000000000000) == 0)
  {
    goto LABEL_126;
  }
  v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_barredFromSib1));
  objc_msgSend(v3, "setObject:forKey:", v117, CFSTR("barred_from_sib1"));

  v69 = (uint64_t)self->_has;
  v71 = *((_BYTE *)&self->_has + 8);
  if ((v69 & 0x8000000000000000) == 0)
  {
LABEL_127:
    if ((v71 & 1) == 0)
      goto LABEL_128;
    goto LABEL_185;
  }
LABEL_184:
  v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_barredFromSib2));
  objc_msgSend(v3, "setObject:forKey:", v118, CFSTR("barred_from_sib2"));

  v69 = (uint64_t)self->_has;
  if ((*((_BYTE *)&self->_has + 8) & 1) == 0)
  {
LABEL_128:
    if ((v69 & 0x400000) == 0)
      goto LABEL_129;
    goto LABEL_186;
  }
LABEL_185:
  v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_connectionRejected));
  objc_msgSend(v3, "setObject:forKey:", v119, CFSTR("connection_rejected"));

  v69 = (uint64_t)self->_has;
  if ((v69 & 0x400000) == 0)
  {
LABEL_129:
    if ((v69 & 0x10000000) == 0)
      goto LABEL_130;
    goto LABEL_187;
  }
LABEL_186:
  v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lastMotionState));
  objc_msgSend(v3, "setObject:forKey:", v120, CFSTR("last_motion_state"));

  v69 = (uint64_t)self->_has;
  if ((v69 & 0x10000000) == 0)
  {
LABEL_130:
    if ((v69 & 0x800000000000000) == 0)
      goto LABEL_131;
    goto LABEL_188;
  }
LABEL_187:
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_msSinceLastMotionState));
  objc_msgSend(v3, "setObject:forKey:", v121, CFSTR("ms_since_last_motion_state"));

  v69 = (uint64_t)self->_has;
  if ((v69 & 0x800000000000000) == 0)
  {
LABEL_131:
    if ((v69 & 0x20000000000000) == 0)
      goto LABEL_132;
    goto LABEL_189;
  }
LABEL_188:
  v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
  objc_msgSend(v3, "setObject:forKey:", v122, CFSTR("version"));

  v69 = (uint64_t)self->_has;
  if ((v69 & 0x20000000000000) == 0)
  {
LABEL_132:
    if ((v69 & 0x200000000000000) == 0)
      goto LABEL_133;
LABEL_190:
    typeOfCall = self->_typeOfCall;
    if (typeOfCall >= 5)
      v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_typeOfCall));
    else
      v125 = *(&off_10025FB18 + typeOfCall);
    objc_msgSend(v3, "setObject:forKey:", v125, CFSTR("type_of_call"));

    if ((*(_QWORD *)&self->_has & 1) != 0)
      goto LABEL_134;
    goto LABEL_135;
  }
LABEL_189:
  v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
  objc_msgSend(v3, "setObject:forKey:", v123, CFSTR("subs_id"));

  v69 = (uint64_t)self->_has;
  if ((v69 & 0x200000000000000) != 0)
    goto LABEL_190;
LABEL_133:
  if ((v69 & 1) != 0)
  {
LABEL_134:
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_nr5gCellId));
    objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("nr5g_cell_id"));

  }
LABEL_135:
  v73 = v3;

  return v73;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000F2FA0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t has;
  NSString *callId;
  uint64_t v8;
  char v9;
  NSData *simHplmn;
  $346717B1E636FA12719EF20158CDC99B *p_has;
  uint64_t v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  char v18;
  NSMutableArray *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  $346717B1E636FA12719EF20158CDC99B *v24;
  uint64_t v25;
  NSMutableArray *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *k;
  $346717B1E636FA12719EF20158CDC99B *v31;
  uint64_t v32;
  unint64_t v33;
  AudioQuality *lastAudioQualityCnt;
  $346717B1E636FA12719EF20158CDC99B *v35;
  uint64_t v36;
  NSMutableArray *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *m;
  $346717B1E636FA12719EF20158CDC99B *v42;
  uint64_t v43;
  NSData *plmnO;
  uint64_t v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];

  v4 = a3;
  v5 = v4;
  has = (uint64_t)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (uint64_t)self->_has;
  }
  if ((has & 0x400) != 0)
    PBDataWriterWriteInt32Field(v5, self->_callEvent, 2);
  callId = self->_callId;
  if (callId)
    PBDataWriterWriteStringField(v5, callId, 3);
  v8 = (uint64_t)self->_has;
  if ((v8 & 0x4000) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_direction, 4);
    v8 = (uint64_t)self->_has;
  }
  v9 = *((_BYTE *)&self->_has + 8);
  if ((v9 & 4) != 0)
  {
    PBDataWriterWriteBOOLField(v5, self->_isAltStart, 5);
    v8 = (uint64_t)self->_has;
    v9 = *((_BYTE *)&self->_has + 8);
    if ((v8 & 0x80000) == 0)
    {
LABEL_11:
      if ((v8 & 0x8000) == 0)
        goto LABEL_12;
      goto LABEL_127;
    }
  }
  else if ((v8 & 0x80000) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint32Field(v5, self->_hoAltSeqNum, 6);
  v8 = (uint64_t)self->_has;
  v9 = *((_BYTE *)&self->_has + 8);
  if ((v8 & 0x8000) == 0)
  {
LABEL_12:
    if ((v8 & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteUint32Field(v5, self->_drxOn, 7);
  v8 = (uint64_t)self->_has;
  v9 = *((_BYTE *)&self->_has + 8);
  if ((v8 & 0x10000) == 0)
  {
LABEL_13:
    if ((v8 & 0x1000000000000) == 0)
      goto LABEL_14;
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteInt32Field(v5, self->_endStatus, 8);
  v8 = (uint64_t)self->_has;
  v9 = *((_BYTE *)&self->_has + 8);
  if ((v8 & 0x1000000000000) == 0)
  {
LABEL_14:
    if ((v8 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteUint32Field(v5, self->_rrcRelCause, 9);
  v8 = (uint64_t)self->_has;
  v9 = *((_BYTE *)&self->_has + 8);
  if ((v8 & 0x200) == 0)
  {
LABEL_15:
    if ((v8 & 8) == 0)
      goto LABEL_16;
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteSint32Field(v5, self->_callDuration, 10);
  v8 = (uint64_t)self->_has;
  v9 = *((_BYTE *)&self->_has + 8);
  if ((v8 & 8) == 0)
  {
LABEL_16:
    if ((v9 & 2) == 0)
      goto LABEL_17;
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteInt32Field(v5, self->_antenna, 12);
  v8 = (uint64_t)self->_has;
  if ((*((_BYTE *)&self->_has + 8) & 2) == 0)
  {
LABEL_17:
    if ((v8 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_132:
  PBDataWriterWriteBOOLField(v5, self->_dueToHandover, 16);
  if ((*(_QWORD *)&self->_has & 0x1000) != 0)
LABEL_18:
    PBDataWriterWriteUint32Field(v5, self->_cellId, 17);
LABEL_19:
  simHplmn = self->_simHplmn;
  if (simHplmn)
    PBDataWriterWriteDataField(v5, simHplmn, 20);
  p_has = &self->_has;
  v12 = (uint64_t)self->_has;
  if ((v12 & 0x2000000000) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_numMncDigits, 21);
    v12 = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x4000000) == 0)
    {
LABEL_23:
      if ((v12 & 0x8000000) == 0)
        goto LABEL_24;
      goto LABEL_136;
    }
  }
  else if ((v12 & 0x4000000) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteUint32Field(v5, self->_mcc, 22);
  v12 = (uint64_t)self->_has;
  if ((v12 & 0x8000000) == 0)
  {
LABEL_24:
    if ((v12 & 0x200000) == 0)
      goto LABEL_25;
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteUint32Field(v5, self->_mnc, 23);
  v12 = (uint64_t)self->_has;
  if ((v12 & 0x200000) == 0)
  {
LABEL_25:
    if ((v12 & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteUint32Field(v5, self->_lac, 24);
  v12 = (uint64_t)self->_has;
  if ((v12 & 0x80) == 0)
  {
LABEL_26:
    if ((v12 & 0x800000000000) == 0)
      goto LABEL_27;
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteUint32Field(v5, self->_band, 28);
  v12 = (uint64_t)self->_has;
  if ((v12 & 0x800000000000) == 0)
  {
LABEL_27:
    if ((v12 & 0x100000000000000) == 0)
      goto LABEL_28;
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteUint32Field(v5, self->_rfChannel, 29);
  v12 = (uint64_t)self->_has;
  if ((v12 & 0x100000000000000) == 0)
  {
LABEL_28:
    if ((v12 & 0x1000000000000000) == 0)
      goto LABEL_29;
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteUint32Field(v5, self->_tsAccuracyHour, 32);
  v12 = (uint64_t)self->_has;
  if ((v12 & 0x1000000000000000) == 0)
  {
LABEL_29:
    if ((v12 & 4) == 0)
      goto LABEL_30;
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteBOOLField(v5, self->_accessoryAttached, 33);
  v12 = (uint64_t)self->_has;
  if ((v12 & 4) == 0)
  {
LABEL_30:
    if ((v12 & 0x8000000000000) == 0)
      goto LABEL_31;
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteUint32Field(v5, self->_accessoryAttachedBitmap, 34);
  v12 = (uint64_t)self->_has;
  if ((v12 & 0x8000000000000) == 0)
  {
LABEL_31:
    if ((v12 & 0x4000000000000) == 0)
      goto LABEL_32;
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteInt32Field(v5, self->_setupSysMode, 35);
  v12 = (uint64_t)self->_has;
  if ((v12 & 0x4000000000000) == 0)
  {
LABEL_32:
    if ((v12 & 0x800) == 0)
      goto LABEL_33;
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteInt32Field(v5, self->_setupDirection, 36);
  v12 = (uint64_t)self->_has;
  if ((v12 & 0x800) == 0)
  {
LABEL_33:
    if ((v12 & 0x40000000) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_145:
  PBDataWriterWriteUint32Field(v5, self->_callSetupTimeMs, 44);
  if ((*(_QWORD *)&self->_has & 0x40000000) != 0)
LABEL_34:
    PBDataWriterWriteInt32Field(v5, self->_mtplInPoint1Db, 54);
LABEL_35:
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v13 = self->_capEvents;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v60 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i), 55);
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    }
    while (v15);
  }

  if ((*(_QWORD *)&self->_has & 0x2000000) != 0)
    PBDataWriterWriteUint32Field(v5, self->_lastXSec, 56);
  v18 = *((_BYTE *)&self->_has + 8);
  if ((v18 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField(v5, self->_lastXSecUlMrab, 58);
    v18 = *((_BYTE *)&self->_has + 8);
  }
  if ((v18 & 8) != 0)
    PBDataWriterWriteBOOLField(v5, self->_lastXSecDlMrab, 59);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v19 = self->_rbDatas;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v56 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j), 60);
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    }
    while (v21);
  }

  v24 = &self->_has;
  v25 = (uint64_t)self->_has;
  if ((v25 & 0x20000000) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_msgId, 61);
    v25 = *(_QWORD *)v24;
    if ((*(_QWORD *)v24 & 0x20000) == 0)
    {
LABEL_57:
      if ((v25 & 0x400000000000) == 0)
        goto LABEL_58;
      goto LABEL_149;
    }
  }
  else if ((v25 & 0x20000) == 0)
  {
    goto LABEL_57;
  }
  PBDataWriterWriteUint32Field(v5, self->_eventId, 62);
  v25 = (uint64_t)self->_has;
  if ((v25 & 0x400000000000) == 0)
  {
LABEL_58:
    if ((v25 & 0x100) == 0)
      goto LABEL_59;
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteUint32Field(v5, self->_responseCode, 63);
  v25 = (uint64_t)self->_has;
  if ((v25 & 0x100) == 0)
  {
LABEL_59:
    if ((v25 & 0x80000000000000) == 0)
      goto LABEL_61;
    goto LABEL_60;
  }
LABEL_150:
  PBDataWriterWriteUint32Field(v5, self->_callConnectDur, 64);
  if ((*(_QWORD *)&self->_has & 0x80000000000000) != 0)
LABEL_60:
    PBDataWriterWriteUint32Field(v5, self->_tbMs, 65);
LABEL_61:
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v26 = self->_hcStats;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v28; k = (char *)k + 1)
      {
        if (*(_QWORD *)v52 != v29)
          objc_enumerationMutation(v26);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)k), 66);
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    }
    while (v28);
  }

  v31 = &self->_has;
  v32 = (uint64_t)self->_has;
  if ((v32 & 0x10000000000) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_numRecvdSpeechPkt, 68);
    v32 = *(_QWORD *)v31;
    if ((*(_QWORD *)v31 & 0x8000000000) == 0)
    {
LABEL_70:
      if ((v32 & 0x800000000) == 0)
        goto LABEL_71;
      goto LABEL_154;
    }
  }
  else if ((v32 & 0x8000000000) == 0)
  {
    goto LABEL_70;
  }
  PBDataWriterWriteUint32Field(v5, self->_numRecvdSilencePkt, 69);
  v32 = (uint64_t)self->_has;
  if ((v32 & 0x800000000) == 0)
  {
LABEL_71:
    if ((v32 & 0x100000000000) == 0)
      goto LABEL_72;
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteUint32Field(v5, self->_numLostPkt, 70);
  v32 = (uint64_t)self->_has;
  if ((v32 & 0x100000000000) == 0)
  {
LABEL_72:
    if ((v32 & 0x80000000000) == 0)
      goto LABEL_73;
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteUint32Field(v5, self->_numUflwSpeechPkt, 71);
  v32 = (uint64_t)self->_has;
  if ((v32 & 0x80000000000) == 0)
  {
LABEL_73:
    if ((v32 & 0x400000000) == 0)
      goto LABEL_74;
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteUint32Field(v5, self->_numUflwSilencePkt, 72);
  v32 = (uint64_t)self->_has;
  if ((v32 & 0x400000000) == 0)
  {
LABEL_74:
    if ((v32 & 0x200000000) == 0)
      goto LABEL_75;
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteUint32Field(v5, self->_numEnqdSpeechPkt, 73);
  v32 = (uint64_t)self->_has;
  if ((v32 & 0x200000000) == 0)
  {
LABEL_75:
    if ((v32 & 0x4000000000) == 0)
      goto LABEL_76;
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteUint32Field(v5, self->_numEnqdSilencePkt, 74);
  v32 = (uint64_t)self->_has;
  if ((v32 & 0x4000000000) == 0)
  {
LABEL_76:
    if ((v32 & 0x1000000000) == 0)
      goto LABEL_77;
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteUint32Field(v5, self->_numPlayedSpeechPkt, 75);
  v32 = (uint64_t)self->_has;
  if ((v32 & 0x1000000000) == 0)
  {
LABEL_77:
    if ((v32 & 0x20000000000) == 0)
      goto LABEL_78;
    goto LABEL_161;
  }
LABEL_160:
  PBDataWriterWriteUint32Field(v5, self->_numMissedSpeechPkt, 76);
  v32 = (uint64_t)self->_has;
  if ((v32 & 0x20000000000) == 0)
  {
LABEL_78:
    if ((v32 & 0x10) == 0)
      goto LABEL_80;
    goto LABEL_79;
  }
LABEL_161:
  PBDataWriterWriteUint32Field(v5, self->_numSpeechQempty, 77);
  if ((*(_QWORD *)&self->_has & 0x10) != 0)
LABEL_79:
    PBDataWriterWriteUint32Field(v5, self->_appCallId, 78);
LABEL_80:
  if (self->_delayCnts.count)
  {
    v33 = 0;
    do
      PBDataWriterWriteUint32Field(v5, self->_delayCnts.list[v33++], 80);
    while (v33 < self->_delayCnts.count);
  }
  if ((*(_QWORD *)&self->_has & 0x2000) != 0)
    PBDataWriterWriteUint32Field(v5, self->_dedicatedBrInactiveToEndMs, 82);
  lastAudioQualityCnt = self->_lastAudioQualityCnt;
  if (lastAudioQualityCnt)
    PBDataWriterWriteSubmessage(v5, lastAudioQualityCnt, 86);
  v35 = &self->_has;
  v36 = (uint64_t)self->_has;
  if ((v36 & 0x2000000000000) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_rtpPktLossPpt, 90);
    v36 = *(_QWORD *)v35;
    if ((*(_QWORD *)v35 & 0x400000000000000) == 0)
    {
LABEL_89:
      if ((v36 & 0x40000) == 0)
        goto LABEL_90;
      goto LABEL_165;
    }
  }
  else if ((v36 & 0x400000000000000) == 0)
  {
    goto LABEL_89;
  }
  PBDataWriterWriteUint32Field(v5, self->_uflwPktPpt, 91);
  v36 = (uint64_t)self->_has;
  if ((v36 & 0x40000) == 0)
  {
LABEL_90:
    if ((v36 & 0x2000000000000000) == 0)
      goto LABEL_91;
    goto LABEL_166;
  }
LABEL_165:
  PBDataWriterWriteUint32Field(v5, self->_frErasurePpt, 92);
  v36 = (uint64_t)self->_has;
  if ((v36 & 0x2000000000000000) == 0)
  {
LABEL_91:
    if ((v36 & 0x40) == 0)
      goto LABEL_92;
    goto LABEL_167;
  }
LABEL_166:
  PBDataWriterWriteBOOLField(v5, self->_badAudioQuality, 94);
  v36 = (uint64_t)self->_has;
  if ((v36 & 0x40) == 0)
  {
LABEL_92:
    if ((v36 & 0x20) == 0)
      goto LABEL_94;
    goto LABEL_93;
  }
LABEL_167:
  PBDataWriterWriteUint32Field(v5, self->_audioQualityThresholdPpt, 95);
  if ((*(_QWORD *)&self->_has & 0x20) != 0)
LABEL_93:
    PBDataWriterWriteUint32Field(v5, self->_audioQosDetectWinLenSec, 96);
LABEL_94:
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v37 = self->_rfMeasInfos;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v48;
    do
    {
      for (m = 0; m != v39; m = (char *)m + 1)
      {
        if (*(_QWORD *)v48 != v40)
          objc_enumerationMutation(v37);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)m), 98);
      }
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
    }
    while (v39);
  }

  v42 = &self->_has;
  v43 = (uint64_t)self->_has;
  if ((v43 & 0x100000) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_hstState, 99);
    v43 = *(_QWORD *)v42;
    if ((*(_QWORD *)v42 & 0x200000000000) == 0)
    {
LABEL_103:
      if ((v43 & 0x40000000000) == 0)
        goto LABEL_104;
      goto LABEL_171;
    }
  }
  else if ((v43 & 0x200000000000) == 0)
  {
    goto LABEL_103;
  }
  PBDataWriterWriteUint32Field(v5, self->_psPref, 100);
  v43 = (uint64_t)self->_has;
  if ((v43 & 0x40000000000) == 0)
  {
LABEL_104:
    if ((v43 & 0x100000000) == 0)
      goto LABEL_105;
    goto LABEL_172;
  }
LABEL_171:
  PBDataWriterWriteUint32Field(v5, self->_numSubs, 101);
  v43 = (uint64_t)self->_has;
  if ((v43 & 0x100000000) == 0)
  {
LABEL_105:
    if ((v43 & 0x40000000000000) == 0)
      goto LABEL_106;
    goto LABEL_173;
  }
LABEL_172:
  PBDataWriterWriteUint32Field(v5, self->_numCps, 102);
  v43 = (uint64_t)self->_has;
  if ((v43 & 0x40000000000000) == 0)
  {
LABEL_106:
    if ((v43 & 0x10000000000000) == 0)
      goto LABEL_107;
    goto LABEL_174;
  }
LABEL_173:
  PBDataWriterWriteInt32Field(v5, self->_sysModeO, 103);
  v43 = (uint64_t)self->_has;
  if ((v43 & 0x10000000000000) == 0)
  {
LABEL_107:
    if ((v43 & 0x80000000) == 0)
      goto LABEL_109;
    goto LABEL_108;
  }
LABEL_174:
  PBDataWriterWriteUint32Field(v5, self->_sidO, 104);
  if ((*(_QWORD *)&self->_has & 0x80000000) != 0)
LABEL_108:
    PBDataWriterWriteUint32Field(v5, self->_nidO, 105);
LABEL_109:
  plmnO = self->_plmnO;
  if (plmnO)
    PBDataWriterWriteDataField(v5, plmnO, 106);
  v45 = (uint64_t)self->_has;
  if ((v45 & 0x1000000) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_lastRssi, 110);
    v45 = (uint64_t)self->_has;
  }
  v46 = *((_BYTE *)&self->_has + 8);
  if ((v45 & 0x800000) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_lastRsrp, 111);
    v45 = (uint64_t)self->_has;
    v46 = *((_BYTE *)&self->_has + 8);
    if ((v45 & 0x4000000000000000) == 0)
    {
LABEL_115:
      if ((v45 & 0x8000000000000000) == 0)
        goto LABEL_116;
      goto LABEL_178;
    }
  }
  else if ((v45 & 0x4000000000000000) == 0)
  {
    goto LABEL_115;
  }
  PBDataWriterWriteBOOLField(v5, self->_barredFromSib1, 112);
  v45 = (uint64_t)self->_has;
  v46 = *((_BYTE *)&self->_has + 8);
  if ((v45 & 0x8000000000000000) == 0)
  {
LABEL_116:
    if ((v46 & 1) == 0)
      goto LABEL_117;
    goto LABEL_179;
  }
LABEL_178:
  PBDataWriterWriteBOOLField(v5, self->_barredFromSib2, 113);
  v45 = (uint64_t)self->_has;
  if ((*((_BYTE *)&self->_has + 8) & 1) == 0)
  {
LABEL_117:
    if ((v45 & 0x400000) == 0)
      goto LABEL_118;
    goto LABEL_180;
  }
LABEL_179:
  PBDataWriterWriteBOOLField(v5, self->_connectionRejected, 114);
  v45 = (uint64_t)self->_has;
  if ((v45 & 0x400000) == 0)
  {
LABEL_118:
    if ((v45 & 0x10000000) == 0)
      goto LABEL_119;
    goto LABEL_181;
  }
LABEL_180:
  PBDataWriterWriteUint32Field(v5, self->_lastMotionState, 120);
  v45 = (uint64_t)self->_has;
  if ((v45 & 0x10000000) == 0)
  {
LABEL_119:
    if ((v45 & 0x800000000000000) == 0)
      goto LABEL_120;
    goto LABEL_182;
  }
LABEL_181:
  PBDataWriterWriteUint32Field(v5, self->_msSinceLastMotionState, 121);
  v45 = (uint64_t)self->_has;
  if ((v45 & 0x800000000000000) == 0)
  {
LABEL_120:
    if ((v45 & 0x20000000000000) == 0)
      goto LABEL_121;
    goto LABEL_183;
  }
LABEL_182:
  PBDataWriterWriteUint32Field(v5, self->_version, 124);
  v45 = (uint64_t)self->_has;
  if ((v45 & 0x20000000000000) == 0)
  {
LABEL_121:
    if ((v45 & 0x200000000000000) == 0)
      goto LABEL_122;
LABEL_184:
    PBDataWriterWriteInt32Field(v5, self->_typeOfCall, 128);
    if ((*(_QWORD *)&self->_has & 1) == 0)
      goto LABEL_124;
    goto LABEL_123;
  }
LABEL_183:
  PBDataWriterWriteUint32Field(v5, self->_subsId, 127);
  v45 = (uint64_t)self->_has;
  if ((v45 & 0x200000000000000) != 0)
    goto LABEL_184;
LABEL_122:
  if ((v45 & 1) != 0)
LABEL_123:
    PBDataWriterWriteUint64Field(v5, self->_nr5gCellId, 129);
LABEL_124:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  uint64_t has;
  uint64_t v6;
  char v7;
  $346717B1E636FA12719EF20158CDC99B *p_has;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t j;
  void *v19;
  $346717B1E636FA12719EF20158CDC99B *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t k;
  void *v25;
  $346717B1E636FA12719EF20158CDC99B *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t m;
  _DWORD *v31;
  $346717B1E636FA12719EF20158CDC99B *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t n;
  void *v37;
  $346717B1E636FA12719EF20158CDC99B *v38;
  uint64_t v39;
  _DWORD *v40;
  uint64_t v41;
  char v42;
  _QWORD *v43;

  v4 = a3;
  has = (uint64_t)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_timestamp;
    v4[48] |= 2uLL;
    has = (uint64_t)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_callEvent;
    v4[48] |= 0x400uLL;
  }
  v43 = v4;
  if (self->_callId)
  {
    objc_msgSend(v4, "setCallId:");
    v4 = v43;
  }
  v6 = (uint64_t)self->_has;
  if ((v6 & 0x4000) != 0)
  {
    *((_DWORD *)v4 + 30) = self->_direction;
    v4[48] |= 0x4000uLL;
    v6 = (uint64_t)self->_has;
  }
  v7 = *((_BYTE *)&self->_has + 8);
  if ((v7 & 4) != 0)
  {
    *((_BYTE *)v4 + 378) = self->_isAltStart;
    *((_BYTE *)v4 + 392) |= 4u;
    v6 = (uint64_t)self->_has;
    v7 = *((_BYTE *)&self->_has + 8);
    if ((v6 & 0x80000) == 0)
    {
LABEL_11:
      if ((v6 & 0x8000) == 0)
        goto LABEL_12;
      goto LABEL_44;
    }
  }
  else if ((v6 & 0x80000) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v4 + 38) = self->_hoAltSeqNum;
  v4[48] |= 0x80000uLL;
  v6 = (uint64_t)self->_has;
  v7 = *((_BYTE *)&self->_has + 8);
  if ((v6 & 0x8000) == 0)
  {
LABEL_12:
    if ((v6 & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 31) = self->_drxOn;
  v4[48] |= 0x8000uLL;
  v6 = (uint64_t)self->_has;
  v7 = *((_BYTE *)&self->_has + 8);
  if ((v6 & 0x10000) == 0)
  {
LABEL_13:
    if ((v6 & 0x1000000000000) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 32) = self->_endStatus;
  v4[48] |= 0x10000uLL;
  v6 = (uint64_t)self->_has;
  v7 = *((_BYTE *)&self->_has + 8);
  if ((v6 & 0x1000000000000) == 0)
  {
LABEL_14:
    if ((v6 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 78) = self->_rrcRelCause;
  v4[48] |= 0x1000000000000uLL;
  v6 = (uint64_t)self->_has;
  v7 = *((_BYTE *)&self->_has + 8);
  if ((v6 & 0x200) == 0)
  {
LABEL_15:
    if ((v6 & 8) == 0)
      goto LABEL_16;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 19) = self->_callDuration;
  v4[48] |= 0x200uLL;
  v6 = (uint64_t)self->_has;
  v7 = *((_BYTE *)&self->_has + 8);
  if ((v6 & 8) == 0)
  {
LABEL_16:
    if ((v7 & 2) == 0)
      goto LABEL_17;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 13) = self->_antenna;
  v4[48] |= 8uLL;
  v6 = (uint64_t)self->_has;
  if ((*((_BYTE *)&self->_has + 8) & 2) == 0)
  {
LABEL_17:
    if ((v6 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_49:
  *((_BYTE *)v4 + 377) = self->_dueToHandover;
  *((_BYTE *)v4 + 392) |= 2u;
  if ((*(_QWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_18:
    *((_DWORD *)v4 + 28) = self->_cellId;
    v4[48] |= 0x1000uLL;
  }
LABEL_19:
  if (self->_simHplmn)
  {
    objc_msgSend(v43, "setSimHplmn:");
    v4 = v43;
  }
  p_has = &self->_has;
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x2000000000) != 0)
  {
    *((_DWORD *)v4 + 59) = self->_numMncDigits;
    v4[48] |= 0x2000000000uLL;
    v9 = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x4000000) == 0)
    {
LABEL_23:
      if ((v9 & 0x8000000) == 0)
        goto LABEL_24;
      goto LABEL_53;
    }
  }
  else if ((v9 & 0x4000000) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)v4 + 48) = self->_mcc;
  v4[48] |= 0x4000000uLL;
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x8000000) == 0)
  {
LABEL_24:
    if ((v9 & 0x200000) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 49) = self->_mnc;
  v4[48] |= 0x8000000uLL;
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x200000) == 0)
  {
LABEL_25:
    if ((v9 & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 40) = self->_lac;
  v4[48] |= 0x200000uLL;
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x80) == 0)
  {
LABEL_26:
    if ((v9 & 0x800000000000) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 17) = self->_band;
  v4[48] |= 0x80uLL;
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x800000000000) == 0)
  {
LABEL_27:
    if ((v9 & 0x100000000000000) == 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 75) = self->_rfChannel;
  v4[48] |= 0x800000000000uLL;
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x100000000000000) == 0)
  {
LABEL_28:
    if ((v9 & 0x1000000000000000) == 0)
      goto LABEL_29;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v4 + 89) = self->_tsAccuracyHour;
  v4[48] |= 0x100000000000000uLL;
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x1000000000000000) == 0)
  {
LABEL_29:
    if ((v9 & 4) == 0)
      goto LABEL_30;
    goto LABEL_59;
  }
LABEL_58:
  *((_BYTE *)v4 + 372) = self->_accessoryAttached;
  v4[48] |= 0x1000000000000000uLL;
  v9 = (uint64_t)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_30:
    if ((v9 & 0x8000000000000) == 0)
      goto LABEL_31;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v4 + 12) = self->_accessoryAttachedBitmap;
  v4[48] |= 4uLL;
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x8000000000000) == 0)
  {
LABEL_31:
    if ((v9 & 0x4000000000000) == 0)
      goto LABEL_32;
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v4 + 81) = self->_setupSysMode;
  v4[48] |= 0x8000000000000uLL;
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x4000000000000) == 0)
  {
LABEL_32:
    if ((v9 & 0x800) == 0)
      goto LABEL_33;
LABEL_62:
    *((_DWORD *)v4 + 24) = self->_callSetupTimeMs;
    v4[48] |= 0x800uLL;
    if ((*(_QWORD *)&self->_has & 0x40000000) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_61:
  *((_DWORD *)v4 + 80) = self->_setupDirection;
  v4[48] |= 0x4000000000000uLL;
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x800) != 0)
    goto LABEL_62;
LABEL_33:
  if ((v9 & 0x40000000) != 0)
  {
LABEL_34:
    *((_DWORD *)v4 + 52) = self->_mtplInPoint1Db;
    v4[48] |= 0x40000000uLL;
  }
LABEL_35:
  if (-[CellularVoiceCallEvent capEventsCount](self, "capEventsCount"))
  {
    objc_msgSend(v43, "clearCapEvents");
    v10 = -[CellularVoiceCallEvent capEventsCount](self, "capEventsCount");
    if (v10)
    {
      v11 = v10;
      for (i = 0; i != v11; ++i)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CellularVoiceCallEvent capEventAtIndex:](self, "capEventAtIndex:", i));
        objc_msgSend(v43, "addCapEvent:", v13);

      }
    }
  }
  if ((*(_QWORD *)&self->_has & 0x2000000) != 0)
  {
    v15 = v43;
    *((_DWORD *)v43 + 47) = self->_lastXSec;
    v43[48] |= 0x2000000uLL;
    v14 = *((_BYTE *)&self->_has + 8);
    if ((v14 & 0x10) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
  v14 = *((_BYTE *)&self->_has + 8);
  v15 = v43;
  if ((v14 & 0x10) != 0)
  {
LABEL_65:
    v15[380] = self->_lastXSecUlMrab;
    v15[392] |= 0x10u;
    v14 = *((_BYTE *)&self->_has + 8);
  }
LABEL_66:
  if ((v14 & 8) != 0)
  {
    v15[379] = self->_lastXSecDlMrab;
    v15[392] |= 8u;
  }
  if (-[CellularVoiceCallEvent rbDatasCount](self, "rbDatasCount"))
  {
    objc_msgSend(v43, "clearRbDatas");
    v16 = -[CellularVoiceCallEvent rbDatasCount](self, "rbDatasCount");
    if (v16)
    {
      v17 = v16;
      for (j = 0; j != v17; ++j)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CellularVoiceCallEvent rbDataAtIndex:](self, "rbDataAtIndex:", j));
        objc_msgSend(v43, "addRbData:", v19);

      }
    }
  }
  v20 = &self->_has;
  v21 = (uint64_t)self->_has;
  if ((v21 & 0x20000000) != 0)
  {
    *((_DWORD *)v43 + 51) = self->_msgId;
    v43[48] |= 0x20000000uLL;
    v21 = *(_QWORD *)v20;
    if ((*(_QWORD *)v20 & 0x20000) == 0)
    {
LABEL_74:
      if ((v21 & 0x400000000000) == 0)
        goto LABEL_75;
      goto LABEL_139;
    }
  }
  else if ((v21 & 0x20000) == 0)
  {
    goto LABEL_74;
  }
  *((_DWORD *)v43 + 33) = self->_eventId;
  v43[48] |= 0x20000uLL;
  v21 = (uint64_t)self->_has;
  if ((v21 & 0x400000000000) == 0)
  {
LABEL_75:
    if ((v21 & 0x100) == 0)
      goto LABEL_76;
LABEL_140:
    *((_DWORD *)v43 + 18) = self->_callConnectDur;
    v43[48] |= 0x100uLL;
    if ((*(_QWORD *)&self->_has & 0x80000000000000) == 0)
      goto LABEL_78;
    goto LABEL_77;
  }
LABEL_139:
  *((_DWORD *)v43 + 74) = self->_responseCode;
  v43[48] |= 0x400000000000uLL;
  v21 = (uint64_t)self->_has;
  if ((v21 & 0x100) != 0)
    goto LABEL_140;
LABEL_76:
  if ((v21 & 0x80000000000000) != 0)
  {
LABEL_77:
    *((_DWORD *)v43 + 88) = self->_tbMs;
    v43[48] |= 0x80000000000000uLL;
  }
LABEL_78:
  if (-[CellularVoiceCallEvent hcStatsCount](self, "hcStatsCount"))
  {
    objc_msgSend(v43, "clearHcStats");
    v22 = -[CellularVoiceCallEvent hcStatsCount](self, "hcStatsCount");
    if (v22)
    {
      v23 = v22;
      for (k = 0; k != v23; ++k)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[CellularVoiceCallEvent hcStatAtIndex:](self, "hcStatAtIndex:", k));
        objc_msgSend(v43, "addHcStat:", v25);

      }
    }
  }
  v26 = &self->_has;
  v27 = (uint64_t)self->_has;
  if ((v27 & 0x10000000000) != 0)
  {
    *((_DWORD *)v43 + 62) = self->_numRecvdSpeechPkt;
    v43[48] |= 0x10000000000uLL;
    v27 = *(_QWORD *)v26;
    if ((*(_QWORD *)v26 & 0x8000000000) == 0)
    {
LABEL_84:
      if ((v27 & 0x800000000) == 0)
        goto LABEL_85;
      goto LABEL_144;
    }
  }
  else if ((v27 & 0x8000000000) == 0)
  {
    goto LABEL_84;
  }
  *((_DWORD *)v43 + 61) = self->_numRecvdSilencePkt;
  v43[48] |= 0x8000000000uLL;
  v27 = (uint64_t)self->_has;
  if ((v27 & 0x800000000) == 0)
  {
LABEL_85:
    if ((v27 & 0x100000000000) == 0)
      goto LABEL_86;
    goto LABEL_145;
  }
LABEL_144:
  *((_DWORD *)v43 + 57) = self->_numLostPkt;
  v43[48] |= 0x800000000uLL;
  v27 = (uint64_t)self->_has;
  if ((v27 & 0x100000000000) == 0)
  {
LABEL_86:
    if ((v27 & 0x80000000000) == 0)
      goto LABEL_87;
    goto LABEL_146;
  }
LABEL_145:
  *((_DWORD *)v43 + 66) = self->_numUflwSpeechPkt;
  v43[48] |= 0x100000000000uLL;
  v27 = (uint64_t)self->_has;
  if ((v27 & 0x80000000000) == 0)
  {
LABEL_87:
    if ((v27 & 0x400000000) == 0)
      goto LABEL_88;
    goto LABEL_147;
  }
LABEL_146:
  *((_DWORD *)v43 + 65) = self->_numUflwSilencePkt;
  v43[48] |= 0x80000000000uLL;
  v27 = (uint64_t)self->_has;
  if ((v27 & 0x400000000) == 0)
  {
LABEL_88:
    if ((v27 & 0x200000000) == 0)
      goto LABEL_89;
    goto LABEL_148;
  }
LABEL_147:
  *((_DWORD *)v43 + 56) = self->_numEnqdSpeechPkt;
  v43[48] |= 0x400000000uLL;
  v27 = (uint64_t)self->_has;
  if ((v27 & 0x200000000) == 0)
  {
LABEL_89:
    if ((v27 & 0x4000000000) == 0)
      goto LABEL_90;
    goto LABEL_149;
  }
LABEL_148:
  *((_DWORD *)v43 + 55) = self->_numEnqdSilencePkt;
  v43[48] |= 0x200000000uLL;
  v27 = (uint64_t)self->_has;
  if ((v27 & 0x4000000000) == 0)
  {
LABEL_90:
    if ((v27 & 0x1000000000) == 0)
      goto LABEL_91;
    goto LABEL_150;
  }
LABEL_149:
  *((_DWORD *)v43 + 60) = self->_numPlayedSpeechPkt;
  v43[48] |= 0x4000000000uLL;
  v27 = (uint64_t)self->_has;
  if ((v27 & 0x1000000000) == 0)
  {
LABEL_91:
    if ((v27 & 0x20000000000) == 0)
      goto LABEL_92;
LABEL_151:
    *((_DWORD *)v43 + 63) = self->_numSpeechQempty;
    v43[48] |= 0x20000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x10) == 0)
      goto LABEL_94;
    goto LABEL_93;
  }
LABEL_150:
  *((_DWORD *)v43 + 58) = self->_numMissedSpeechPkt;
  v43[48] |= 0x1000000000uLL;
  v27 = (uint64_t)self->_has;
  if ((v27 & 0x20000000000) != 0)
    goto LABEL_151;
LABEL_92:
  if ((v27 & 0x10) != 0)
  {
LABEL_93:
    *((_DWORD *)v43 + 14) = self->_appCallId;
    v43[48] |= 0x10uLL;
  }
LABEL_94:
  if (-[CellularVoiceCallEvent delayCntsCount](self, "delayCntsCount"))
  {
    objc_msgSend(v43, "clearDelayCnts");
    v28 = -[CellularVoiceCallEvent delayCntsCount](self, "delayCntsCount");
    if (v28)
    {
      v29 = v28;
      for (m = 0; m != v29; ++m)
        objc_msgSend(v43, "addDelayCnt:", -[CellularVoiceCallEvent delayCntAtIndex:](self, "delayCntAtIndex:", m));
    }
  }
  v31 = v43;
  if ((*(_QWORD *)&self->_has & 0x2000) != 0)
  {
    *((_DWORD *)v43 + 29) = self->_dedicatedBrInactiveToEndMs;
    v43[48] |= 0x2000uLL;
  }
  if (self->_lastAudioQualityCnt)
  {
    objc_msgSend(v43, "setLastAudioQualityCnt:");
    v31 = v43;
  }
  v32 = &self->_has;
  v33 = (uint64_t)self->_has;
  if ((v33 & 0x2000000000000) != 0)
  {
    v31[79] = self->_rtpPktLossPpt;
    *((_QWORD *)v31 + 48) |= 0x2000000000000uLL;
    v33 = *(_QWORD *)v32;
    if ((*(_QWORD *)v32 & 0x400000000000000) == 0)
    {
LABEL_104:
      if ((v33 & 0x40000) == 0)
        goto LABEL_105;
      goto LABEL_155;
    }
  }
  else if ((v33 & 0x400000000000000) == 0)
  {
    goto LABEL_104;
  }
  v31[91] = self->_uflwPktPpt;
  *((_QWORD *)v31 + 48) |= 0x400000000000000uLL;
  v33 = (uint64_t)self->_has;
  if ((v33 & 0x40000) == 0)
  {
LABEL_105:
    if ((v33 & 0x2000000000000000) == 0)
      goto LABEL_106;
    goto LABEL_156;
  }
LABEL_155:
  v31[34] = self->_frErasurePpt;
  *((_QWORD *)v31 + 48) |= 0x40000uLL;
  v33 = (uint64_t)self->_has;
  if ((v33 & 0x2000000000000000) == 0)
  {
LABEL_106:
    if ((v33 & 0x40) == 0)
      goto LABEL_107;
LABEL_157:
    v31[16] = self->_audioQualityThresholdPpt;
    *((_QWORD *)v31 + 48) |= 0x40uLL;
    if ((*(_QWORD *)&self->_has & 0x20) == 0)
      goto LABEL_109;
    goto LABEL_108;
  }
LABEL_156:
  *((_BYTE *)v31 + 373) = self->_badAudioQuality;
  *((_QWORD *)v31 + 48) |= 0x2000000000000000uLL;
  v33 = (uint64_t)self->_has;
  if ((v33 & 0x40) != 0)
    goto LABEL_157;
LABEL_107:
  if ((v33 & 0x20) != 0)
  {
LABEL_108:
    v31[15] = self->_audioQosDetectWinLenSec;
    *((_QWORD *)v31 + 48) |= 0x20uLL;
  }
LABEL_109:
  if (-[CellularVoiceCallEvent rfMeasInfosCount](self, "rfMeasInfosCount"))
  {
    objc_msgSend(v43, "clearRfMeasInfos");
    v34 = -[CellularVoiceCallEvent rfMeasInfosCount](self, "rfMeasInfosCount");
    if (v34)
    {
      v35 = v34;
      for (n = 0; n != v35; ++n)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[CellularVoiceCallEvent rfMeasInfoAtIndex:](self, "rfMeasInfoAtIndex:", n));
        objc_msgSend(v43, "addRfMeasInfo:", v37);

      }
    }
  }
  v38 = &self->_has;
  v39 = (uint64_t)self->_has;
  v40 = v43;
  if ((v39 & 0x100000) != 0)
  {
    *((_DWORD *)v43 + 39) = self->_hstState;
    v43[48] |= 0x100000uLL;
    v39 = *(_QWORD *)v38;
    if ((*(_QWORD *)v38 & 0x200000000000) == 0)
    {
LABEL_115:
      if ((v39 & 0x40000000000) == 0)
        goto LABEL_116;
      goto LABEL_161;
    }
  }
  else if ((v39 & 0x200000000000) == 0)
  {
    goto LABEL_115;
  }
  *((_DWORD *)v43 + 70) = self->_psPref;
  v43[48] |= 0x200000000000uLL;
  v39 = (uint64_t)self->_has;
  if ((v39 & 0x40000000000) == 0)
  {
LABEL_116:
    if ((v39 & 0x100000000) == 0)
      goto LABEL_117;
    goto LABEL_162;
  }
LABEL_161:
  *((_DWORD *)v43 + 64) = self->_numSubs;
  v43[48] |= 0x40000000000uLL;
  v39 = (uint64_t)self->_has;
  if ((v39 & 0x100000000) == 0)
  {
LABEL_117:
    if ((v39 & 0x40000000000000) == 0)
      goto LABEL_118;
    goto LABEL_163;
  }
LABEL_162:
  *((_DWORD *)v43 + 54) = self->_numCps;
  v43[48] |= (unint64_t)&_mh_execute_header;
  v39 = (uint64_t)self->_has;
  if ((v39 & 0x40000000000000) == 0)
  {
LABEL_118:
    if ((v39 & 0x10000000000000) == 0)
      goto LABEL_119;
    goto LABEL_164;
  }
LABEL_163:
  *((_DWORD *)v43 + 87) = self->_sysModeO;
  v43[48] |= 0x40000000000000uLL;
  v39 = (uint64_t)self->_has;
  if ((v39 & 0x10000000000000) == 0)
  {
LABEL_119:
    if ((v39 & 0x80000000) == 0)
      goto LABEL_121;
    goto LABEL_120;
  }
LABEL_164:
  *((_DWORD *)v43 + 82) = self->_sidO;
  v43[48] |= 0x10000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x80000000) != 0)
  {
LABEL_120:
    *((_DWORD *)v43 + 53) = self->_nidO;
    v43[48] |= 0x80000000uLL;
  }
LABEL_121:
  if (self->_plmnO)
  {
    objc_msgSend(v43, "setPlmnO:");
    v40 = v43;
  }
  v41 = (uint64_t)self->_has;
  if ((v41 & 0x1000000) != 0)
  {
    v40[46] = self->_lastRssi;
    *((_QWORD *)v40 + 48) |= 0x1000000uLL;
    v41 = (uint64_t)self->_has;
  }
  v42 = *((_BYTE *)&self->_has + 8);
  if ((v41 & 0x800000) != 0)
  {
    v40[45] = self->_lastRsrp;
    *((_QWORD *)v40 + 48) |= 0x800000uLL;
    v41 = (uint64_t)self->_has;
    v42 = *((_BYTE *)&self->_has + 8);
    if ((v41 & 0x4000000000000000) == 0)
    {
LABEL_127:
      if ((v41 & 0x8000000000000000) == 0)
        goto LABEL_128;
      goto LABEL_168;
    }
  }
  else if ((v41 & 0x4000000000000000) == 0)
  {
    goto LABEL_127;
  }
  *((_BYTE *)v40 + 374) = self->_barredFromSib1;
  *((_QWORD *)v40 + 48) |= 0x4000000000000000uLL;
  v41 = (uint64_t)self->_has;
  v42 = *((_BYTE *)&self->_has + 8);
  if ((v41 & 0x8000000000000000) == 0)
  {
LABEL_128:
    if ((v42 & 1) == 0)
      goto LABEL_129;
    goto LABEL_169;
  }
LABEL_168:
  *((_BYTE *)v40 + 375) = self->_barredFromSib2;
  *((_QWORD *)v40 + 48) |= 0x8000000000000000;
  v41 = (uint64_t)self->_has;
  if ((*((_BYTE *)&self->_has + 8) & 1) == 0)
  {
LABEL_129:
    if ((v41 & 0x400000) == 0)
      goto LABEL_130;
    goto LABEL_170;
  }
LABEL_169:
  *((_BYTE *)v40 + 376) = self->_connectionRejected;
  *((_BYTE *)v40 + 392) |= 1u;
  v41 = (uint64_t)self->_has;
  if ((v41 & 0x400000) == 0)
  {
LABEL_130:
    if ((v41 & 0x10000000) == 0)
      goto LABEL_131;
    goto LABEL_171;
  }
LABEL_170:
  v40[44] = self->_lastMotionState;
  *((_QWORD *)v40 + 48) |= 0x400000uLL;
  v41 = (uint64_t)self->_has;
  if ((v41 & 0x10000000) == 0)
  {
LABEL_131:
    if ((v41 & 0x800000000000000) == 0)
      goto LABEL_132;
    goto LABEL_172;
  }
LABEL_171:
  v40[50] = self->_msSinceLastMotionState;
  *((_QWORD *)v40 + 48) |= 0x10000000uLL;
  v41 = (uint64_t)self->_has;
  if ((v41 & 0x800000000000000) == 0)
  {
LABEL_132:
    if ((v41 & 0x20000000000000) == 0)
      goto LABEL_133;
    goto LABEL_173;
  }
LABEL_172:
  v40[92] = self->_version;
  *((_QWORD *)v40 + 48) |= 0x800000000000000uLL;
  v41 = (uint64_t)self->_has;
  if ((v41 & 0x20000000000000) == 0)
  {
LABEL_133:
    if ((v41 & 0x200000000000000) == 0)
      goto LABEL_134;
LABEL_174:
    v40[90] = self->_typeOfCall;
    *((_QWORD *)v40 + 48) |= 0x200000000000000uLL;
    if ((*(_QWORD *)&self->_has & 1) == 0)
      goto LABEL_136;
    goto LABEL_135;
  }
LABEL_173:
  v40[86] = self->_subsId;
  *((_QWORD *)v40 + 48) |= 0x20000000000000uLL;
  v41 = (uint64_t)self->_has;
  if ((v41 & 0x200000000000000) != 0)
    goto LABEL_174;
LABEL_134:
  if ((v41 & 1) != 0)
  {
LABEL_135:
    *((_QWORD *)v40 + 4) = self->_nr5gCellId;
    *((_QWORD *)v40 + 48) |= 1uLL;
  }
LABEL_136:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t has;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  $346717B1E636FA12719EF20158CDC99B *p_has;
  uint64_t v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  id v21;
  char v22;
  NSMutableArray *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  id v28;
  $346717B1E636FA12719EF20158CDC99B *v29;
  uint64_t v30;
  NSMutableArray *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *k;
  id v36;
  $346717B1E636FA12719EF20158CDC99B *v37;
  uint64_t v38;
  id v39;
  void *v40;
  $346717B1E636FA12719EF20158CDC99B *v41;
  uint64_t v42;
  NSMutableArray *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *m;
  id v48;
  $346717B1E636FA12719EF20158CDC99B *v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  char v54;
  _QWORD *v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (uint64_t)self->_has;
  if ((has & 2) != 0)
  {
    v5[5] = self->_timestamp;
    v5[48] |= 2uLL;
    has = (uint64_t)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    *((_DWORD *)v5 + 20) = self->_callEvent;
    v5[48] |= 0x400uLL;
  }
  v8 = -[NSString copyWithZone:](self->_callId, "copyWithZone:", a3);
  v9 = (void *)v6[11];
  v6[11] = v8;

  v10 = (uint64_t)self->_has;
  if ((v10 & 0x4000) != 0)
  {
    *((_DWORD *)v6 + 30) = self->_direction;
    v6[48] |= 0x4000uLL;
    v10 = (uint64_t)self->_has;
  }
  v11 = *((_BYTE *)&self->_has + 8);
  if ((v11 & 4) != 0)
  {
    *((_BYTE *)v6 + 378) = self->_isAltStart;
    *((_BYTE *)v6 + 392) |= 4u;
    v10 = (uint64_t)self->_has;
    v11 = *((_BYTE *)&self->_has + 8);
    if ((v10 & 0x80000) == 0)
    {
LABEL_9:
      if ((v10 & 0x8000) == 0)
        goto LABEL_10;
      goto LABEL_116;
    }
  }
  else if ((v10 & 0x80000) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v6 + 38) = self->_hoAltSeqNum;
  v6[48] |= 0x80000uLL;
  v10 = (uint64_t)self->_has;
  v11 = *((_BYTE *)&self->_has + 8);
  if ((v10 & 0x8000) == 0)
  {
LABEL_10:
    if ((v10 & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_117;
  }
LABEL_116:
  *((_DWORD *)v6 + 31) = self->_drxOn;
  v6[48] |= 0x8000uLL;
  v10 = (uint64_t)self->_has;
  v11 = *((_BYTE *)&self->_has + 8);
  if ((v10 & 0x10000) == 0)
  {
LABEL_11:
    if ((v10 & 0x1000000000000) == 0)
      goto LABEL_12;
    goto LABEL_118;
  }
LABEL_117:
  *((_DWORD *)v6 + 32) = self->_endStatus;
  v6[48] |= 0x10000uLL;
  v10 = (uint64_t)self->_has;
  v11 = *((_BYTE *)&self->_has + 8);
  if ((v10 & 0x1000000000000) == 0)
  {
LABEL_12:
    if ((v10 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_119;
  }
LABEL_118:
  *((_DWORD *)v6 + 78) = self->_rrcRelCause;
  v6[48] |= 0x1000000000000uLL;
  v10 = (uint64_t)self->_has;
  v11 = *((_BYTE *)&self->_has + 8);
  if ((v10 & 0x200) == 0)
  {
LABEL_13:
    if ((v10 & 8) == 0)
      goto LABEL_14;
    goto LABEL_120;
  }
LABEL_119:
  *((_DWORD *)v6 + 19) = self->_callDuration;
  v6[48] |= 0x200uLL;
  v10 = (uint64_t)self->_has;
  v11 = *((_BYTE *)&self->_has + 8);
  if ((v10 & 8) == 0)
  {
LABEL_14:
    if ((v11 & 2) == 0)
      goto LABEL_15;
    goto LABEL_121;
  }
LABEL_120:
  *((_DWORD *)v6 + 13) = self->_antenna;
  v6[48] |= 8uLL;
  v10 = (uint64_t)self->_has;
  if ((*((_BYTE *)&self->_has + 8) & 2) == 0)
  {
LABEL_15:
    if ((v10 & 0x1000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_121:
  *((_BYTE *)v6 + 377) = self->_dueToHandover;
  *((_BYTE *)v6 + 392) |= 2u;
  if ((*(_QWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_16:
    *((_DWORD *)v6 + 28) = self->_cellId;
    v6[48] |= 0x1000uLL;
  }
LABEL_17:
  v12 = -[NSData copyWithZone:](self->_simHplmn, "copyWithZone:", a3);
  v13 = (void *)v6[42];
  v6[42] = v12;

  p_has = &self->_has;
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x2000000000) != 0)
  {
    *((_DWORD *)v6 + 59) = self->_numMncDigits;
    v6[48] |= 0x2000000000uLL;
    v15 = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x4000000) == 0)
    {
LABEL_19:
      if ((v15 & 0x8000000) == 0)
        goto LABEL_20;
      goto LABEL_125;
    }
  }
  else if ((v15 & 0x4000000) == 0)
  {
    goto LABEL_19;
  }
  *((_DWORD *)v6 + 48) = self->_mcc;
  v6[48] |= 0x4000000uLL;
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x8000000) == 0)
  {
LABEL_20:
    if ((v15 & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_126;
  }
LABEL_125:
  *((_DWORD *)v6 + 49) = self->_mnc;
  v6[48] |= 0x8000000uLL;
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x200000) == 0)
  {
LABEL_21:
    if ((v15 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_127;
  }
LABEL_126:
  *((_DWORD *)v6 + 40) = self->_lac;
  v6[48] |= 0x200000uLL;
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x80) == 0)
  {
LABEL_22:
    if ((v15 & 0x800000000000) == 0)
      goto LABEL_23;
    goto LABEL_128;
  }
LABEL_127:
  *((_DWORD *)v6 + 17) = self->_band;
  v6[48] |= 0x80uLL;
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x800000000000) == 0)
  {
LABEL_23:
    if ((v15 & 0x100000000000000) == 0)
      goto LABEL_24;
    goto LABEL_129;
  }
LABEL_128:
  *((_DWORD *)v6 + 75) = self->_rfChannel;
  v6[48] |= 0x800000000000uLL;
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x100000000000000) == 0)
  {
LABEL_24:
    if ((v15 & 0x1000000000000000) == 0)
      goto LABEL_25;
    goto LABEL_130;
  }
LABEL_129:
  *((_DWORD *)v6 + 89) = self->_tsAccuracyHour;
  v6[48] |= 0x100000000000000uLL;
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x1000000000000000) == 0)
  {
LABEL_25:
    if ((v15 & 4) == 0)
      goto LABEL_26;
    goto LABEL_131;
  }
LABEL_130:
  *((_BYTE *)v6 + 372) = self->_accessoryAttached;
  v6[48] |= 0x1000000000000000uLL;
  v15 = (uint64_t)self->_has;
  if ((v15 & 4) == 0)
  {
LABEL_26:
    if ((v15 & 0x8000000000000) == 0)
      goto LABEL_27;
    goto LABEL_132;
  }
LABEL_131:
  *((_DWORD *)v6 + 12) = self->_accessoryAttachedBitmap;
  v6[48] |= 4uLL;
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x8000000000000) == 0)
  {
LABEL_27:
    if ((v15 & 0x4000000000000) == 0)
      goto LABEL_28;
    goto LABEL_133;
  }
LABEL_132:
  *((_DWORD *)v6 + 81) = self->_setupSysMode;
  v6[48] |= 0x8000000000000uLL;
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x4000000000000) == 0)
  {
LABEL_28:
    if ((v15 & 0x800) == 0)
      goto LABEL_29;
    goto LABEL_134;
  }
LABEL_133:
  *((_DWORD *)v6 + 80) = self->_setupDirection;
  v6[48] |= 0x4000000000000uLL;
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x800) == 0)
  {
LABEL_29:
    if ((v15 & 0x40000000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_134:
  *((_DWORD *)v6 + 24) = self->_callSetupTimeMs;
  v6[48] |= 0x800uLL;
  if ((*(_QWORD *)&self->_has & 0x40000000) != 0)
  {
LABEL_30:
    *((_DWORD *)v6 + 52) = self->_mtplInPoint1Db;
    v6[48] |= 0x40000000uLL;
  }
LABEL_31:
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v16 = self->_capEvents;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v70 != v19)
          objc_enumerationMutation(v16);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v6, "addCapEvent:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    }
    while (v18);
  }

  if ((*(_QWORD *)&self->_has & 0x2000000) != 0)
  {
    *((_DWORD *)v6 + 47) = self->_lastXSec;
    v6[48] |= 0x2000000uLL;
  }
  v22 = *((_BYTE *)&self->_has + 8);
  if ((v22 & 0x10) != 0)
  {
    *((_BYTE *)v6 + 380) = self->_lastXSecUlMrab;
    *((_BYTE *)v6 + 392) |= 0x10u;
    v22 = *((_BYTE *)&self->_has + 8);
  }
  if ((v22 & 8) != 0)
  {
    *((_BYTE *)v6 + 379) = self->_lastXSecDlMrab;
    *((_BYTE *)v6 + 392) |= 8u;
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v23 = self->_rbDatas;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(_QWORD *)v66 != v26)
          objc_enumerationMutation(v23);
        v28 = objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3);
        objc_msgSend(v6, "addRbData:", v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    }
    while (v25);
  }

  v29 = &self->_has;
  v30 = (uint64_t)self->_has;
  if ((v30 & 0x20000000) != 0)
  {
    *((_DWORD *)v6 + 51) = self->_msgId;
    v6[48] |= 0x20000000uLL;
    v30 = *(_QWORD *)v29;
    if ((*(_QWORD *)v29 & 0x20000) == 0)
    {
LABEL_53:
      if ((v30 & 0x400000000000) == 0)
        goto LABEL_54;
      goto LABEL_138;
    }
  }
  else if ((v30 & 0x20000) == 0)
  {
    goto LABEL_53;
  }
  *((_DWORD *)v6 + 33) = self->_eventId;
  v6[48] |= 0x20000uLL;
  v30 = (uint64_t)self->_has;
  if ((v30 & 0x400000000000) == 0)
  {
LABEL_54:
    if ((v30 & 0x100) == 0)
      goto LABEL_55;
    goto LABEL_139;
  }
LABEL_138:
  *((_DWORD *)v6 + 74) = self->_responseCode;
  v6[48] |= 0x400000000000uLL;
  v30 = (uint64_t)self->_has;
  if ((v30 & 0x100) == 0)
  {
LABEL_55:
    if ((v30 & 0x80000000000000) == 0)
      goto LABEL_57;
    goto LABEL_56;
  }
LABEL_139:
  *((_DWORD *)v6 + 18) = self->_callConnectDur;
  v6[48] |= 0x100uLL;
  if ((*(_QWORD *)&self->_has & 0x80000000000000) != 0)
  {
LABEL_56:
    *((_DWORD *)v6 + 88) = self->_tbMs;
    v6[48] |= 0x80000000000000uLL;
  }
LABEL_57:
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v31 = self->_hcStats;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v33; k = (char *)k + 1)
      {
        if (*(_QWORD *)v62 != v34)
          objc_enumerationMutation(v31);
        v36 = objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)k), "copyWithZone:", a3);
        objc_msgSend(v6, "addHcStat:", v36);

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
    }
    while (v33);
  }

  v37 = &self->_has;
  v38 = (uint64_t)self->_has;
  if ((v38 & 0x10000000000) != 0)
  {
    *((_DWORD *)v6 + 62) = self->_numRecvdSpeechPkt;
    v6[48] |= 0x10000000000uLL;
    v38 = *(_QWORD *)v37;
    if ((*(_QWORD *)v37 & 0x8000000000) == 0)
    {
LABEL_66:
      if ((v38 & 0x800000000) == 0)
        goto LABEL_67;
      goto LABEL_143;
    }
  }
  else if ((v38 & 0x8000000000) == 0)
  {
    goto LABEL_66;
  }
  *((_DWORD *)v6 + 61) = self->_numRecvdSilencePkt;
  v6[48] |= 0x8000000000uLL;
  v38 = (uint64_t)self->_has;
  if ((v38 & 0x800000000) == 0)
  {
LABEL_67:
    if ((v38 & 0x100000000000) == 0)
      goto LABEL_68;
    goto LABEL_144;
  }
LABEL_143:
  *((_DWORD *)v6 + 57) = self->_numLostPkt;
  v6[48] |= 0x800000000uLL;
  v38 = (uint64_t)self->_has;
  if ((v38 & 0x100000000000) == 0)
  {
LABEL_68:
    if ((v38 & 0x80000000000) == 0)
      goto LABEL_69;
    goto LABEL_145;
  }
LABEL_144:
  *((_DWORD *)v6 + 66) = self->_numUflwSpeechPkt;
  v6[48] |= 0x100000000000uLL;
  v38 = (uint64_t)self->_has;
  if ((v38 & 0x80000000000) == 0)
  {
LABEL_69:
    if ((v38 & 0x400000000) == 0)
      goto LABEL_70;
    goto LABEL_146;
  }
LABEL_145:
  *((_DWORD *)v6 + 65) = self->_numUflwSilencePkt;
  v6[48] |= 0x80000000000uLL;
  v38 = (uint64_t)self->_has;
  if ((v38 & 0x400000000) == 0)
  {
LABEL_70:
    if ((v38 & 0x200000000) == 0)
      goto LABEL_71;
    goto LABEL_147;
  }
LABEL_146:
  *((_DWORD *)v6 + 56) = self->_numEnqdSpeechPkt;
  v6[48] |= 0x400000000uLL;
  v38 = (uint64_t)self->_has;
  if ((v38 & 0x200000000) == 0)
  {
LABEL_71:
    if ((v38 & 0x4000000000) == 0)
      goto LABEL_72;
    goto LABEL_148;
  }
LABEL_147:
  *((_DWORD *)v6 + 55) = self->_numEnqdSilencePkt;
  v6[48] |= 0x200000000uLL;
  v38 = (uint64_t)self->_has;
  if ((v38 & 0x4000000000) == 0)
  {
LABEL_72:
    if ((v38 & 0x1000000000) == 0)
      goto LABEL_73;
    goto LABEL_149;
  }
LABEL_148:
  *((_DWORD *)v6 + 60) = self->_numPlayedSpeechPkt;
  v6[48] |= 0x4000000000uLL;
  v38 = (uint64_t)self->_has;
  if ((v38 & 0x1000000000) == 0)
  {
LABEL_73:
    if ((v38 & 0x20000000000) == 0)
      goto LABEL_74;
    goto LABEL_150;
  }
LABEL_149:
  *((_DWORD *)v6 + 58) = self->_numMissedSpeechPkt;
  v6[48] |= 0x1000000000uLL;
  v38 = (uint64_t)self->_has;
  if ((v38 & 0x20000000000) == 0)
  {
LABEL_74:
    if ((v38 & 0x10) == 0)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_150:
  *((_DWORD *)v6 + 63) = self->_numSpeechQempty;
  v6[48] |= 0x20000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x10) != 0)
  {
LABEL_75:
    *((_DWORD *)v6 + 14) = self->_appCallId;
    v6[48] |= 0x10uLL;
  }
LABEL_76:
  PBRepeatedUInt32Copy(v6 + 1, &self->_delayCnts);
  if ((*(_QWORD *)&self->_has & 0x2000) != 0)
  {
    *((_DWORD *)v6 + 29) = self->_dedicatedBrInactiveToEndMs;
    v6[48] |= 0x2000uLL;
  }
  v39 = -[AudioQuality copyWithZone:](self->_lastAudioQualityCnt, "copyWithZone:", a3);
  v40 = (void *)v6[21];
  v6[21] = v39;

  v41 = &self->_has;
  v42 = (uint64_t)self->_has;
  if ((v42 & 0x2000000000000) != 0)
  {
    *((_DWORD *)v6 + 79) = self->_rtpPktLossPpt;
    v6[48] |= 0x2000000000000uLL;
    v42 = *(_QWORD *)v41;
    if ((*(_QWORD *)v41 & 0x400000000000000) == 0)
    {
LABEL_80:
      if ((v42 & 0x40000) == 0)
        goto LABEL_81;
      goto LABEL_154;
    }
  }
  else if ((v42 & 0x400000000000000) == 0)
  {
    goto LABEL_80;
  }
  *((_DWORD *)v6 + 91) = self->_uflwPktPpt;
  v6[48] |= 0x400000000000000uLL;
  v42 = (uint64_t)self->_has;
  if ((v42 & 0x40000) == 0)
  {
LABEL_81:
    if ((v42 & 0x2000000000000000) == 0)
      goto LABEL_82;
    goto LABEL_155;
  }
LABEL_154:
  *((_DWORD *)v6 + 34) = self->_frErasurePpt;
  v6[48] |= 0x40000uLL;
  v42 = (uint64_t)self->_has;
  if ((v42 & 0x2000000000000000) == 0)
  {
LABEL_82:
    if ((v42 & 0x40) == 0)
      goto LABEL_83;
    goto LABEL_156;
  }
LABEL_155:
  *((_BYTE *)v6 + 373) = self->_badAudioQuality;
  v6[48] |= 0x2000000000000000uLL;
  v42 = (uint64_t)self->_has;
  if ((v42 & 0x40) == 0)
  {
LABEL_83:
    if ((v42 & 0x20) == 0)
      goto LABEL_85;
    goto LABEL_84;
  }
LABEL_156:
  *((_DWORD *)v6 + 16) = self->_audioQualityThresholdPpt;
  v6[48] |= 0x40uLL;
  if ((*(_QWORD *)&self->_has & 0x20) != 0)
  {
LABEL_84:
    *((_DWORD *)v6 + 15) = self->_audioQosDetectWinLenSec;
    v6[48] |= 0x20uLL;
  }
LABEL_85:
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v43 = self->_rfMeasInfos;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v58;
    do
    {
      for (m = 0; m != v45; m = (char *)m + 1)
      {
        if (*(_QWORD *)v58 != v46)
          objc_enumerationMutation(v43);
        v48 = objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)m), "copyWithZone:", a3, (_QWORD)v57);
        objc_msgSend(v6, "addRfMeasInfo:", v48);

      }
      v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
    }
    while (v45);
  }

  v49 = &self->_has;
  v50 = (uint64_t)self->_has;
  if ((v50 & 0x100000) != 0)
  {
    *((_DWORD *)v6 + 39) = self->_hstState;
    v6[48] |= 0x100000uLL;
    v50 = *(_QWORD *)v49;
    if ((*(_QWORD *)v49 & 0x200000000000) == 0)
    {
LABEL_94:
      if ((v50 & 0x40000000000) == 0)
        goto LABEL_95;
      goto LABEL_160;
    }
  }
  else if ((v50 & 0x200000000000) == 0)
  {
    goto LABEL_94;
  }
  *((_DWORD *)v6 + 70) = self->_psPref;
  v6[48] |= 0x200000000000uLL;
  v50 = (uint64_t)self->_has;
  if ((v50 & 0x40000000000) == 0)
  {
LABEL_95:
    if ((v50 & 0x100000000) == 0)
      goto LABEL_96;
    goto LABEL_161;
  }
LABEL_160:
  *((_DWORD *)v6 + 64) = self->_numSubs;
  v6[48] |= 0x40000000000uLL;
  v50 = (uint64_t)self->_has;
  if ((v50 & 0x100000000) == 0)
  {
LABEL_96:
    if ((v50 & 0x40000000000000) == 0)
      goto LABEL_97;
    goto LABEL_162;
  }
LABEL_161:
  *((_DWORD *)v6 + 54) = self->_numCps;
  v6[48] |= (unint64_t)&_mh_execute_header;
  v50 = (uint64_t)self->_has;
  if ((v50 & 0x40000000000000) == 0)
  {
LABEL_97:
    if ((v50 & 0x10000000000000) == 0)
      goto LABEL_98;
    goto LABEL_163;
  }
LABEL_162:
  *((_DWORD *)v6 + 87) = self->_sysModeO;
  v6[48] |= 0x40000000000000uLL;
  v50 = (uint64_t)self->_has;
  if ((v50 & 0x10000000000000) == 0)
  {
LABEL_98:
    if ((v50 & 0x80000000) == 0)
      goto LABEL_100;
    goto LABEL_99;
  }
LABEL_163:
  *((_DWORD *)v6 + 82) = self->_sidO;
  v6[48] |= 0x10000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x80000000) != 0)
  {
LABEL_99:
    *((_DWORD *)v6 + 53) = self->_nidO;
    v6[48] |= 0x80000000uLL;
  }
LABEL_100:
  v51 = -[NSData copyWithZone:](self->_plmnO, "copyWithZone:", a3, (_QWORD)v57);
  v52 = (void *)v6[34];
  v6[34] = v51;

  v53 = (uint64_t)self->_has;
  if ((v53 & 0x1000000) != 0)
  {
    *((_DWORD *)v6 + 46) = self->_lastRssi;
    v6[48] |= 0x1000000uLL;
    v53 = (uint64_t)self->_has;
  }
  v54 = *((_BYTE *)&self->_has + 8);
  if ((v53 & 0x800000) != 0)
  {
    *((_DWORD *)v6 + 45) = self->_lastRsrp;
    v6[48] |= 0x800000uLL;
    v53 = (uint64_t)self->_has;
    v54 = *((_BYTE *)&self->_has + 8);
    if ((v53 & 0x4000000000000000) == 0)
    {
LABEL_104:
      if ((v53 & 0x8000000000000000) == 0)
        goto LABEL_105;
      goto LABEL_167;
    }
  }
  else if ((v53 & 0x4000000000000000) == 0)
  {
    goto LABEL_104;
  }
  *((_BYTE *)v6 + 374) = self->_barredFromSib1;
  v6[48] |= 0x4000000000000000uLL;
  v53 = (uint64_t)self->_has;
  v54 = *((_BYTE *)&self->_has + 8);
  if ((v53 & 0x8000000000000000) == 0)
  {
LABEL_105:
    if ((v54 & 1) == 0)
      goto LABEL_106;
    goto LABEL_168;
  }
LABEL_167:
  *((_BYTE *)v6 + 375) = self->_barredFromSib2;
  v6[48] |= 0x8000000000000000;
  v53 = (uint64_t)self->_has;
  if ((*((_BYTE *)&self->_has + 8) & 1) == 0)
  {
LABEL_106:
    if ((v53 & 0x400000) == 0)
      goto LABEL_107;
    goto LABEL_169;
  }
LABEL_168:
  *((_BYTE *)v6 + 376) = self->_connectionRejected;
  *((_BYTE *)v6 + 392) |= 1u;
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x400000) == 0)
  {
LABEL_107:
    if ((v53 & 0x10000000) == 0)
      goto LABEL_108;
    goto LABEL_170;
  }
LABEL_169:
  *((_DWORD *)v6 + 44) = self->_lastMotionState;
  v6[48] |= 0x400000uLL;
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x10000000) == 0)
  {
LABEL_108:
    if ((v53 & 0x800000000000000) == 0)
      goto LABEL_109;
    goto LABEL_171;
  }
LABEL_170:
  *((_DWORD *)v6 + 50) = self->_msSinceLastMotionState;
  v6[48] |= 0x10000000uLL;
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x800000000000000) == 0)
  {
LABEL_109:
    if ((v53 & 0x20000000000000) == 0)
      goto LABEL_110;
    goto LABEL_172;
  }
LABEL_171:
  *((_DWORD *)v6 + 92) = self->_version;
  v6[48] |= 0x800000000000000uLL;
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x20000000000000) == 0)
  {
LABEL_110:
    if ((v53 & 0x200000000000000) == 0)
      goto LABEL_111;
LABEL_173:
    *((_DWORD *)v6 + 90) = self->_typeOfCall;
    v6[48] |= 0x200000000000000uLL;
    if ((*(_QWORD *)&self->_has & 1) == 0)
      goto LABEL_113;
    goto LABEL_112;
  }
LABEL_172:
  *((_DWORD *)v6 + 86) = self->_subsId;
  v6[48] |= 0x20000000000000uLL;
  v53 = (uint64_t)self->_has;
  if ((v53 & 0x200000000000000) != 0)
    goto LABEL_173;
LABEL_111:
  if ((v53 & 1) != 0)
  {
LABEL_112:
    v6[4] = self->_nr5gCellId;
    v6[48] |= 1uLL;
  }
LABEL_113:
  v55 = v6;

  return v55;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  char v6;
  uint64_t has;
  uint64_t v8;
  NSString *callId;
  uint64_t v10;
  NSData *simHplmn;
  uint64_t v12;
  NSMutableArray *capEvents;
  uint64_t v14;
  NSMutableArray *rbDatas;
  uint64_t v16;
  NSMutableArray *hcStats;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  AudioQuality *lastAudioQualityCnt;
  uint64_t v23;
  NSMutableArray *rfMeasInfos;
  uint64_t v25;
  NSData *plmnO;
  uint64_t v27;
  BOOL v28;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_399;
  v6 = *((_BYTE *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)v4 + 48);
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_timestamp != *((_QWORD *)v4 + 5))
      goto LABEL_399;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_callEvent != *((_DWORD *)v4 + 20))
      goto LABEL_399;
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_399;
  }
  callId = self->_callId;
  if ((unint64_t)callId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](callId, "isEqual:"))
      goto LABEL_399;
    has = (uint64_t)self->_has;
    v6 = *((_BYTE *)&self->_has + 8);
  }
  v10 = *((_QWORD *)v4 + 48);
  if ((has & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0 || self->_direction != *((_DWORD *)v4 + 30))
      goto LABEL_399;
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_399;
  }
  if ((v6 & 4) != 0)
  {
    if ((v4[392] & 4) == 0)
      goto LABEL_399;
    if (self->_isAltStart)
    {
      if (!v4[378])
        goto LABEL_399;
    }
    else if (v4[378])
    {
      goto LABEL_399;
    }
  }
  else if ((v4[392] & 4) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x80000) != 0)
  {
    if ((v10 & 0x80000) == 0 || self->_hoAltSeqNum != *((_DWORD *)v4 + 38))
      goto LABEL_399;
  }
  else if ((v10 & 0x80000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x8000) != 0)
  {
    if ((v10 & 0x8000) == 0 || self->_drxOn != *((_DWORD *)v4 + 31))
      goto LABEL_399;
  }
  else if ((v10 & 0x8000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0 || self->_endStatus != *((_DWORD *)v4 + 32))
      goto LABEL_399;
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x1000000000000) != 0)
  {
    if ((v10 & 0x1000000000000) == 0 || self->_rrcRelCause != *((_DWORD *)v4 + 78))
      goto LABEL_399;
  }
  else if ((v10 & 0x1000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0 || self->_callDuration != *((_DWORD *)v4 + 19))
      goto LABEL_399;
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_antenna != *((_DWORD *)v4 + 13))
      goto LABEL_399;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_399;
  }
  if ((v6 & 2) != 0)
  {
    if ((v4[392] & 2) == 0)
      goto LABEL_399;
    if (self->_dueToHandover)
    {
      if (!v4[377])
        goto LABEL_399;
    }
    else if (v4[377])
    {
      goto LABEL_399;
    }
  }
  else if ((v4[392] & 2) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_cellId != *((_DWORD *)v4 + 28))
      goto LABEL_399;
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_399;
  }
  simHplmn = self->_simHplmn;
  if ((unint64_t)simHplmn | *((_QWORD *)v4 + 42))
  {
    if (!-[NSData isEqual:](simHplmn, "isEqual:"))
      goto LABEL_399;
    has = (uint64_t)self->_has;
    v6 = *((_BYTE *)&self->_has + 8);
  }
  v12 = *((_QWORD *)v4 + 48);
  if ((has & 0x2000000000) != 0)
  {
    if ((v12 & 0x2000000000) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 59))
      goto LABEL_399;
  }
  else if ((v12 & 0x2000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x4000000) != 0)
  {
    if ((v12 & 0x4000000) == 0 || self->_mcc != *((_DWORD *)v4 + 48))
      goto LABEL_399;
  }
  else if ((v12 & 0x4000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x8000000) != 0)
  {
    if ((v12 & 0x8000000) == 0 || self->_mnc != *((_DWORD *)v4 + 49))
      goto LABEL_399;
  }
  else if ((v12 & 0x8000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x200000) != 0)
  {
    if ((v12 & 0x200000) == 0 || self->_lac != *((_DWORD *)v4 + 40))
      goto LABEL_399;
  }
  else if ((v12 & 0x200000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_band != *((_DWORD *)v4 + 17))
      goto LABEL_399;
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x800000000000) != 0)
  {
    if ((v12 & 0x800000000000) == 0 || self->_rfChannel != *((_DWORD *)v4 + 75))
      goto LABEL_399;
  }
  else if ((v12 & 0x800000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x100000000000000) != 0)
  {
    if ((v12 & 0x100000000000000) == 0 || self->_tsAccuracyHour != *((_DWORD *)v4 + 89))
      goto LABEL_399;
  }
  else if ((v12 & 0x100000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x1000000000000000) != 0)
  {
    if ((v12 & 0x1000000000000000) == 0)
      goto LABEL_399;
    if (self->_accessoryAttached)
    {
      if (!v4[372])
        goto LABEL_399;
    }
    else if (v4[372])
    {
      goto LABEL_399;
    }
  }
  else if ((v12 & 0x1000000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_accessoryAttachedBitmap != *((_DWORD *)v4 + 12))
      goto LABEL_399;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x8000000000000) != 0)
  {
    if ((v12 & 0x8000000000000) == 0 || self->_setupSysMode != *((_DWORD *)v4 + 81))
      goto LABEL_399;
  }
  else if ((v12 & 0x8000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x4000000000000) != 0)
  {
    if ((v12 & 0x4000000000000) == 0 || self->_setupDirection != *((_DWORD *)v4 + 80))
      goto LABEL_399;
  }
  else if ((v12 & 0x4000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0 || self->_callSetupTimeMs != *((_DWORD *)v4 + 24))
      goto LABEL_399;
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x40000000) != 0)
  {
    if ((v12 & 0x40000000) == 0 || self->_mtplInPoint1Db != *((_DWORD *)v4 + 52))
      goto LABEL_399;
  }
  else if ((v12 & 0x40000000) != 0)
  {
    goto LABEL_399;
  }
  capEvents = self->_capEvents;
  if ((unint64_t)capEvents | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](capEvents, "isEqual:"))
      goto LABEL_399;
    has = (uint64_t)self->_has;
    v6 = *((_BYTE *)&self->_has + 8);
  }
  v14 = *((_QWORD *)v4 + 48);
  if ((has & 0x2000000) != 0)
  {
    if ((v14 & 0x2000000) == 0 || self->_lastXSec != *((_DWORD *)v4 + 47))
      goto LABEL_399;
  }
  else if ((v14 & 0x2000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v6 & 0x10) != 0)
  {
    if ((v4[392] & 0x10) == 0)
      goto LABEL_399;
    if (self->_lastXSecUlMrab)
    {
      if (!v4[380])
        goto LABEL_399;
    }
    else if (v4[380])
    {
      goto LABEL_399;
    }
  }
  else if ((v4[392] & 0x10) != 0)
  {
    goto LABEL_399;
  }
  if ((v6 & 8) != 0)
  {
    if ((v4[392] & 8) == 0)
      goto LABEL_399;
    if (self->_lastXSecDlMrab)
    {
      if (!v4[379])
        goto LABEL_399;
    }
    else if (v4[379])
    {
      goto LABEL_399;
    }
  }
  else if ((v4[392] & 8) != 0)
  {
    goto LABEL_399;
  }
  rbDatas = self->_rbDatas;
  if ((unint64_t)rbDatas | *((_QWORD *)v4 + 36))
  {
    if (!-[NSMutableArray isEqual:](rbDatas, "isEqual:"))
      goto LABEL_399;
    has = (uint64_t)self->_has;
  }
  v16 = *((_QWORD *)v4 + 48);
  if ((has & 0x20000000) != 0)
  {
    if ((v16 & 0x20000000) == 0 || self->_msgId != *((_DWORD *)v4 + 51))
      goto LABEL_399;
  }
  else if ((v16 & 0x20000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x20000) != 0)
  {
    if ((v16 & 0x20000) == 0 || self->_eventId != *((_DWORD *)v4 + 33))
      goto LABEL_399;
  }
  else if ((v16 & 0x20000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x400000000000) != 0)
  {
    if ((v16 & 0x400000000000) == 0 || self->_responseCode != *((_DWORD *)v4 + 74))
      goto LABEL_399;
  }
  else if ((v16 & 0x400000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x100) != 0)
  {
    if ((v16 & 0x100) == 0 || self->_callConnectDur != *((_DWORD *)v4 + 18))
      goto LABEL_399;
  }
  else if ((v16 & 0x100) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x80000000000000) != 0)
  {
    if ((v16 & 0x80000000000000) == 0 || self->_tbMs != *((_DWORD *)v4 + 88))
      goto LABEL_399;
  }
  else if ((v16 & 0x80000000000000) != 0)
  {
    goto LABEL_399;
  }
  hcStats = self->_hcStats;
  if ((unint64_t)hcStats | *((_QWORD *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](hcStats, "isEqual:"))
      goto LABEL_399;
    has = (uint64_t)self->_has;
  }
  v18 = *((_QWORD *)v4 + 48);
  if ((has & 0x10000000000) != 0)
  {
    if ((v18 & 0x10000000000) == 0 || self->_numRecvdSpeechPkt != *((_DWORD *)v4 + 62))
      goto LABEL_399;
  }
  else if ((v18 & 0x10000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x8000000000) != 0)
  {
    if ((v18 & 0x8000000000) == 0 || self->_numRecvdSilencePkt != *((_DWORD *)v4 + 61))
      goto LABEL_399;
  }
  else if ((v18 & 0x8000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x800000000) != 0)
  {
    if ((v18 & 0x800000000) == 0 || self->_numLostPkt != *((_DWORD *)v4 + 57))
      goto LABEL_399;
  }
  else if ((v18 & 0x800000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x100000000000) != 0)
  {
    if ((v18 & 0x100000000000) == 0 || self->_numUflwSpeechPkt != *((_DWORD *)v4 + 66))
      goto LABEL_399;
  }
  else if ((v18 & 0x100000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x80000000000) != 0)
  {
    if ((v18 & 0x80000000000) == 0 || self->_numUflwSilencePkt != *((_DWORD *)v4 + 65))
      goto LABEL_399;
  }
  else if ((v18 & 0x80000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x400000000) != 0)
  {
    if ((v18 & 0x400000000) == 0 || self->_numEnqdSpeechPkt != *((_DWORD *)v4 + 56))
      goto LABEL_399;
  }
  else if ((v18 & 0x400000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x200000000) != 0)
  {
    if ((v18 & 0x200000000) == 0 || self->_numEnqdSilencePkt != *((_DWORD *)v4 + 55))
      goto LABEL_399;
  }
  else if ((v18 & 0x200000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x4000000000) != 0)
  {
    if ((v18 & 0x4000000000) == 0 || self->_numPlayedSpeechPkt != *((_DWORD *)v4 + 60))
      goto LABEL_399;
  }
  else if ((v18 & 0x4000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x1000000000) != 0)
  {
    if ((v18 & 0x1000000000) == 0 || self->_numMissedSpeechPkt != *((_DWORD *)v4 + 58))
      goto LABEL_399;
  }
  else if ((v18 & 0x1000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x20000000000) != 0)
  {
    if ((v18 & 0x20000000000) == 0 || self->_numSpeechQempty != *((_DWORD *)v4 + 63))
      goto LABEL_399;
  }
  else if ((v18 & 0x20000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x10) != 0)
  {
    if ((v18 & 0x10) == 0 || self->_appCallId != *((_DWORD *)v4 + 14))
      goto LABEL_399;
  }
  else if ((v18 & 0x10) != 0)
  {
    goto LABEL_399;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_delayCnts, v4 + 8))
  {
LABEL_399:
    v28 = 0;
    goto LABEL_400;
  }
  v19 = *((_BYTE *)&self->_has + 8);
  v20 = (uint64_t)self->_has;
  v21 = *((_QWORD *)v4 + 48);
  if ((v20 & 0x2000) != 0)
  {
    if ((v21 & 0x2000) == 0 || self->_dedicatedBrInactiveToEndMs != *((_DWORD *)v4 + 29))
      goto LABEL_399;
  }
  else if ((v21 & 0x2000) != 0)
  {
    goto LABEL_399;
  }
  lastAudioQualityCnt = self->_lastAudioQualityCnt;
  if ((unint64_t)lastAudioQualityCnt | *((_QWORD *)v4 + 21))
  {
    if (!-[AudioQuality isEqual:](lastAudioQualityCnt, "isEqual:"))
      goto LABEL_399;
    v20 = (uint64_t)self->_has;
    v19 = *((_BYTE *)&self->_has + 8);
  }
  v23 = *((_QWORD *)v4 + 48);
  if ((v20 & 0x2000000000000) != 0)
  {
    if ((v23 & 0x2000000000000) == 0 || self->_rtpPktLossPpt != *((_DWORD *)v4 + 79))
      goto LABEL_399;
  }
  else if ((v23 & 0x2000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x400000000000000) != 0)
  {
    if ((v23 & 0x400000000000000) == 0 || self->_uflwPktPpt != *((_DWORD *)v4 + 91))
      goto LABEL_399;
  }
  else if ((v23 & 0x400000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x40000) != 0)
  {
    if ((v23 & 0x40000) == 0 || self->_frErasurePpt != *((_DWORD *)v4 + 34))
      goto LABEL_399;
  }
  else if ((v23 & 0x40000) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x2000000000000000) != 0)
  {
    if ((v23 & 0x2000000000000000) == 0)
      goto LABEL_399;
    if (self->_badAudioQuality)
    {
      if (!v4[373])
        goto LABEL_399;
    }
    else if (v4[373])
    {
      goto LABEL_399;
    }
  }
  else if ((v23 & 0x2000000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x40) != 0)
  {
    if ((v23 & 0x40) == 0 || self->_audioQualityThresholdPpt != *((_DWORD *)v4 + 16))
      goto LABEL_399;
  }
  else if ((v23 & 0x40) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x20) != 0)
  {
    if ((v23 & 0x20) == 0 || self->_audioQosDetectWinLenSec != *((_DWORD *)v4 + 15))
      goto LABEL_399;
  }
  else if ((v23 & 0x20) != 0)
  {
    goto LABEL_399;
  }
  rfMeasInfos = self->_rfMeasInfos;
  if ((unint64_t)rfMeasInfos | *((_QWORD *)v4 + 38))
  {
    if (!-[NSMutableArray isEqual:](rfMeasInfos, "isEqual:"))
      goto LABEL_399;
    v20 = (uint64_t)self->_has;
    v19 = *((_BYTE *)&self->_has + 8);
  }
  v25 = *((_QWORD *)v4 + 48);
  if ((v20 & 0x100000) != 0)
  {
    if ((v25 & 0x100000) == 0 || self->_hstState != *((_DWORD *)v4 + 39))
      goto LABEL_399;
  }
  else if ((v25 & 0x100000) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x200000000000) != 0)
  {
    if ((v25 & 0x200000000000) == 0 || self->_psPref != *((_DWORD *)v4 + 70))
      goto LABEL_399;
  }
  else if ((v25 & 0x200000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x40000000000) != 0)
  {
    if ((v25 & 0x40000000000) == 0 || self->_numSubs != *((_DWORD *)v4 + 64))
      goto LABEL_399;
  }
  else if ((v25 & 0x40000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x100000000) != 0)
  {
    if ((v25 & 0x100000000) == 0 || self->_numCps != *((_DWORD *)v4 + 54))
      goto LABEL_399;
  }
  else if ((v25 & 0x100000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x40000000000000) != 0)
  {
    if ((v25 & 0x40000000000000) == 0 || self->_sysModeO != *((_DWORD *)v4 + 87))
      goto LABEL_399;
  }
  else if ((v25 & 0x40000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x10000000000000) != 0)
  {
    if ((v25 & 0x10000000000000) == 0 || self->_sidO != *((_DWORD *)v4 + 82))
      goto LABEL_399;
  }
  else if ((v25 & 0x10000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x80000000) != 0)
  {
    if ((v25 & 0x80000000) == 0 || self->_nidO != *((_DWORD *)v4 + 53))
      goto LABEL_399;
  }
  else if ((v25 & 0x80000000) != 0)
  {
    goto LABEL_399;
  }
  plmnO = self->_plmnO;
  if ((unint64_t)plmnO | *((_QWORD *)v4 + 34))
  {
    if (!-[NSData isEqual:](plmnO, "isEqual:"))
      goto LABEL_399;
    v20 = (uint64_t)self->_has;
    v19 = *((_BYTE *)&self->_has + 8);
  }
  v27 = *((_QWORD *)v4 + 48);
  if ((v20 & 0x1000000) != 0)
  {
    if ((v27 & 0x1000000) == 0 || self->_lastRssi != *((_DWORD *)v4 + 46))
      goto LABEL_399;
  }
  else if ((v27 & 0x1000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x800000) != 0)
  {
    if ((v27 & 0x800000) == 0 || self->_lastRsrp != *((_DWORD *)v4 + 45))
      goto LABEL_399;
  }
  else if ((v27 & 0x800000) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x4000000000000000) != 0)
  {
    if ((v27 & 0x4000000000000000) == 0)
      goto LABEL_399;
    if (self->_barredFromSib1)
    {
      if (!v4[374])
        goto LABEL_399;
    }
    else if (v4[374])
    {
      goto LABEL_399;
    }
  }
  else if ((v27 & 0x4000000000000000) != 0)
  {
    goto LABEL_399;
  }
  if (v20 < 0)
  {
    if ((v27 & 0x8000000000000000) == 0)
      goto LABEL_399;
    if (self->_barredFromSib2)
    {
      if (!v4[375])
        goto LABEL_399;
    }
    else if (v4[375])
    {
      goto LABEL_399;
    }
  }
  else if (v27 < 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 1) != 0)
  {
    if ((v4[392] & 1) == 0)
      goto LABEL_399;
    if (self->_connectionRejected)
    {
      if (!v4[376])
        goto LABEL_399;
    }
    else if (v4[376])
    {
      goto LABEL_399;
    }
  }
  else if ((v4[392] & 1) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x400000) != 0)
  {
    if ((v27 & 0x400000) == 0 || self->_lastMotionState != *((_DWORD *)v4 + 44))
      goto LABEL_399;
  }
  else if ((v27 & 0x400000) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x10000000) != 0)
  {
    if ((v27 & 0x10000000) == 0 || self->_msSinceLastMotionState != *((_DWORD *)v4 + 50))
      goto LABEL_399;
  }
  else if ((v27 & 0x10000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x800000000000000) != 0)
  {
    if ((v27 & 0x800000000000000) == 0 || self->_version != *((_DWORD *)v4 + 92))
      goto LABEL_399;
  }
  else if ((v27 & 0x800000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x20000000000000) != 0)
  {
    if ((v27 & 0x20000000000000) == 0 || self->_subsId != *((_DWORD *)v4 + 86))
      goto LABEL_399;
  }
  else if ((v27 & 0x20000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v20 & 0x200000000000000) == 0)
  {
    if ((v27 & 0x200000000000000) == 0)
      goto LABEL_394;
    goto LABEL_399;
  }
  if ((v27 & 0x200000000000000) == 0 || self->_typeOfCall != *((_DWORD *)v4 + 90))
    goto LABEL_399;
LABEL_394:
  if ((v20 & 1) != 0)
  {
    if ((v27 & 1) == 0 || self->_nr5gCellId != *((_QWORD *)v4 + 4))
      goto LABEL_399;
    v28 = 1;
  }
  else
  {
    v28 = (*((_QWORD *)v4 + 48) & 1) == 0;
  }
LABEL_400:

  return v28;
}

- (unint64_t)hash
{
  uint64_t has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSUInteger v88;
  uint64_t v89;
  unint64_t v90;

  has = (uint64_t)self->_has;
  if ((has & 2) != 0)
  {
    v90 = 2654435761u * self->_timestamp;
    if ((has & 0x400) != 0)
      goto LABEL_3;
  }
  else
  {
    v90 = 0;
    if ((has & 0x400) != 0)
    {
LABEL_3:
      v89 = 2654435761 * self->_callEvent;
      goto LABEL_6;
    }
  }
  v89 = 0;
LABEL_6:
  v88 = -[NSString hash](self->_callId, "hash");
  v4 = (uint64_t)self->_has;
  if ((v4 & 0x4000) != 0)
  {
    v87 = 2654435761 * self->_direction;
    if ((*((_BYTE *)&self->_has + 8) & 4) != 0)
    {
LABEL_8:
      v86 = 2654435761 * self->_isAltStart;
      if ((v4 & 0x80000) != 0)
        goto LABEL_9;
      goto LABEL_19;
    }
  }
  else
  {
    v87 = 0;
    if ((*((_BYTE *)&self->_has + 8) & 4) != 0)
      goto LABEL_8;
  }
  v86 = 0;
  if ((v4 & 0x80000) != 0)
  {
LABEL_9:
    v85 = 2654435761 * self->_hoAltSeqNum;
    if ((v4 & 0x8000) != 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  v85 = 0;
  if ((v4 & 0x8000) != 0)
  {
LABEL_10:
    v84 = 2654435761 * self->_drxOn;
    if ((v4 & 0x10000) != 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_20:
  v84 = 0;
  if ((v4 & 0x10000) != 0)
  {
LABEL_11:
    v83 = 2654435761 * self->_endStatus;
    if ((v4 & 0x1000000000000) != 0)
      goto LABEL_12;
    goto LABEL_22;
  }
LABEL_21:
  v83 = 0;
  if ((v4 & 0x1000000000000) != 0)
  {
LABEL_12:
    v82 = 2654435761 * self->_rrcRelCause;
    if ((v4 & 0x200) != 0)
      goto LABEL_13;
    goto LABEL_23;
  }
LABEL_22:
  v82 = 0;
  if ((v4 & 0x200) != 0)
  {
LABEL_13:
    v81 = 2654435761 * self->_callDuration;
    if ((v4 & 8) != 0)
      goto LABEL_14;
    goto LABEL_24;
  }
LABEL_23:
  v81 = 0;
  if ((v4 & 8) != 0)
  {
LABEL_14:
    v80 = 2654435761 * self->_antenna;
    if ((*((_BYTE *)&self->_has + 8) & 2) != 0)
      goto LABEL_15;
LABEL_25:
    v79 = 0;
    if ((v4 & 0x1000) != 0)
      goto LABEL_16;
    goto LABEL_26;
  }
LABEL_24:
  v80 = 0;
  if ((*((_BYTE *)&self->_has + 8) & 2) == 0)
    goto LABEL_25;
LABEL_15:
  v79 = 2654435761 * self->_dueToHandover;
  if ((v4 & 0x1000) != 0)
  {
LABEL_16:
    v78 = 2654435761 * self->_cellId;
    goto LABEL_27;
  }
LABEL_26:
  v78 = 0;
LABEL_27:
  v77 = (unint64_t)-[NSData hash](self->_simHplmn, "hash");
  v5 = (uint64_t)self->_has;
  if ((v5 & 0x2000000000) != 0)
  {
    v76 = 2654435761 * self->_numMncDigits;
    if ((v5 & 0x4000000) != 0)
    {
LABEL_29:
      v75 = 2654435761 * self->_mcc;
      if ((v5 & 0x8000000) != 0)
        goto LABEL_30;
      goto LABEL_43;
    }
  }
  else
  {
    v76 = 0;
    if ((v5 & 0x4000000) != 0)
      goto LABEL_29;
  }
  v75 = 0;
  if ((v5 & 0x8000000) != 0)
  {
LABEL_30:
    v74 = 2654435761 * self->_mnc;
    if ((v5 & 0x200000) != 0)
      goto LABEL_31;
    goto LABEL_44;
  }
LABEL_43:
  v74 = 0;
  if ((v5 & 0x200000) != 0)
  {
LABEL_31:
    v73 = 2654435761 * self->_lac;
    if ((v5 & 0x80) != 0)
      goto LABEL_32;
    goto LABEL_45;
  }
LABEL_44:
  v73 = 0;
  if ((v5 & 0x80) != 0)
  {
LABEL_32:
    v72 = 2654435761 * self->_band;
    if ((v5 & 0x800000000000) != 0)
      goto LABEL_33;
    goto LABEL_46;
  }
LABEL_45:
  v72 = 0;
  if ((v5 & 0x800000000000) != 0)
  {
LABEL_33:
    v71 = 2654435761 * self->_rfChannel;
    if ((v5 & 0x100000000000000) != 0)
      goto LABEL_34;
    goto LABEL_47;
  }
LABEL_46:
  v71 = 0;
  if ((v5 & 0x100000000000000) != 0)
  {
LABEL_34:
    v70 = 2654435761 * self->_tsAccuracyHour;
    if ((v5 & 0x1000000000000000) != 0)
      goto LABEL_35;
    goto LABEL_48;
  }
LABEL_47:
  v70 = 0;
  if ((v5 & 0x1000000000000000) != 0)
  {
LABEL_35:
    v69 = 2654435761 * self->_accessoryAttached;
    if ((v5 & 4) != 0)
      goto LABEL_36;
    goto LABEL_49;
  }
LABEL_48:
  v69 = 0;
  if ((v5 & 4) != 0)
  {
LABEL_36:
    v68 = 2654435761 * self->_accessoryAttachedBitmap;
    if ((v5 & 0x8000000000000) != 0)
      goto LABEL_37;
    goto LABEL_50;
  }
LABEL_49:
  v68 = 0;
  if ((v5 & 0x8000000000000) != 0)
  {
LABEL_37:
    v67 = 2654435761 * self->_setupSysMode;
    if ((v5 & 0x4000000000000) != 0)
      goto LABEL_38;
    goto LABEL_51;
  }
LABEL_50:
  v67 = 0;
  if ((v5 & 0x4000000000000) != 0)
  {
LABEL_38:
    v66 = 2654435761 * self->_setupDirection;
    if ((v5 & 0x800) != 0)
      goto LABEL_39;
LABEL_52:
    v65 = 0;
    if ((v5 & 0x40000000) != 0)
      goto LABEL_40;
    goto LABEL_53;
  }
LABEL_51:
  v66 = 0;
  if ((v5 & 0x800) == 0)
    goto LABEL_52;
LABEL_39:
  v65 = 2654435761 * self->_callSetupTimeMs;
  if ((v5 & 0x40000000) != 0)
  {
LABEL_40:
    v64 = 2654435761 * self->_mtplInPoint1Db;
    goto LABEL_54;
  }
LABEL_53:
  v64 = 0;
LABEL_54:
  v63 = (unint64_t)-[NSMutableArray hash](self->_capEvents, "hash");
  if ((*(_QWORD *)&self->_has & 0x2000000) == 0)
  {
    v62 = 0;
    if ((*((_BYTE *)&self->_has + 8) & 0x10) != 0)
      goto LABEL_56;
LABEL_59:
    v61 = 0;
    if ((*((_BYTE *)&self->_has + 8) & 8) != 0)
      goto LABEL_57;
    goto LABEL_60;
  }
  v62 = 2654435761 * self->_lastXSec;
  if ((*((_BYTE *)&self->_has + 8) & 0x10) == 0)
    goto LABEL_59;
LABEL_56:
  v61 = 2654435761 * self->_lastXSecUlMrab;
  if ((*((_BYTE *)&self->_has + 8) & 8) != 0)
  {
LABEL_57:
    v60 = 2654435761 * self->_lastXSecDlMrab;
    goto LABEL_61;
  }
LABEL_60:
  v60 = 0;
LABEL_61:
  v59 = (unint64_t)-[NSMutableArray hash](self->_rbDatas, "hash");
  v6 = (uint64_t)self->_has;
  if ((v6 & 0x20000000) != 0)
  {
    v58 = 2654435761 * self->_msgId;
    if ((v6 & 0x20000) != 0)
    {
LABEL_63:
      v57 = 2654435761 * self->_eventId;
      if ((v6 & 0x400000000000) != 0)
        goto LABEL_64;
      goto LABEL_69;
    }
  }
  else
  {
    v58 = 0;
    if ((v6 & 0x20000) != 0)
      goto LABEL_63;
  }
  v57 = 0;
  if ((v6 & 0x400000000000) != 0)
  {
LABEL_64:
    v56 = 2654435761 * self->_responseCode;
    if ((v6 & 0x100) != 0)
      goto LABEL_65;
LABEL_70:
    v55 = 0;
    if ((v6 & 0x80000000000000) != 0)
      goto LABEL_66;
    goto LABEL_71;
  }
LABEL_69:
  v56 = 0;
  if ((v6 & 0x100) == 0)
    goto LABEL_70;
LABEL_65:
  v55 = 2654435761 * self->_callConnectDur;
  if ((v6 & 0x80000000000000) != 0)
  {
LABEL_66:
    v54 = 2654435761 * self->_tbMs;
    goto LABEL_72;
  }
LABEL_71:
  v54 = 0;
LABEL_72:
  v53 = (unint64_t)-[NSMutableArray hash](self->_hcStats, "hash");
  v7 = (uint64_t)self->_has;
  if ((v7 & 0x10000000000) != 0)
  {
    v52 = 2654435761 * self->_numRecvdSpeechPkt;
    if ((v7 & 0x8000000000) != 0)
    {
LABEL_74:
      v51 = 2654435761 * self->_numRecvdSilencePkt;
      if ((v7 & 0x800000000) != 0)
        goto LABEL_75;
      goto LABEL_86;
    }
  }
  else
  {
    v52 = 0;
    if ((v7 & 0x8000000000) != 0)
      goto LABEL_74;
  }
  v51 = 0;
  if ((v7 & 0x800000000) != 0)
  {
LABEL_75:
    v50 = 2654435761 * self->_numLostPkt;
    if ((v7 & 0x100000000000) != 0)
      goto LABEL_76;
    goto LABEL_87;
  }
LABEL_86:
  v50 = 0;
  if ((v7 & 0x100000000000) != 0)
  {
LABEL_76:
    v49 = 2654435761 * self->_numUflwSpeechPkt;
    if ((v7 & 0x80000000000) != 0)
      goto LABEL_77;
    goto LABEL_88;
  }
LABEL_87:
  v49 = 0;
  if ((v7 & 0x80000000000) != 0)
  {
LABEL_77:
    v48 = 2654435761 * self->_numUflwSilencePkt;
    if ((v7 & 0x400000000) != 0)
      goto LABEL_78;
    goto LABEL_89;
  }
LABEL_88:
  v48 = 0;
  if ((v7 & 0x400000000) != 0)
  {
LABEL_78:
    v47 = 2654435761 * self->_numEnqdSpeechPkt;
    if ((v7 & 0x200000000) != 0)
      goto LABEL_79;
    goto LABEL_90;
  }
LABEL_89:
  v47 = 0;
  if ((v7 & 0x200000000) != 0)
  {
LABEL_79:
    v46 = 2654435761 * self->_numEnqdSilencePkt;
    if ((v7 & 0x4000000000) != 0)
      goto LABEL_80;
    goto LABEL_91;
  }
LABEL_90:
  v46 = 0;
  if ((v7 & 0x4000000000) != 0)
  {
LABEL_80:
    v45 = 2654435761 * self->_numPlayedSpeechPkt;
    if ((v7 & 0x1000000000) != 0)
      goto LABEL_81;
    goto LABEL_92;
  }
LABEL_91:
  v45 = 0;
  if ((v7 & 0x1000000000) != 0)
  {
LABEL_81:
    v44 = 2654435761 * self->_numMissedSpeechPkt;
    if ((v7 & 0x20000000000) != 0)
      goto LABEL_82;
LABEL_93:
    v43 = 0;
    if ((v7 & 0x10) != 0)
      goto LABEL_83;
    goto LABEL_94;
  }
LABEL_92:
  v44 = 0;
  if ((v7 & 0x20000000000) == 0)
    goto LABEL_93;
LABEL_82:
  v43 = 2654435761 * self->_numSpeechQempty;
  if ((v7 & 0x10) != 0)
  {
LABEL_83:
    v42 = 2654435761 * self->_appCallId;
    goto LABEL_95;
  }
LABEL_94:
  v42 = 0;
LABEL_95:
  v41 = PBRepeatedUInt32Hash(&self->_delayCnts);
  if ((*(_QWORD *)&self->_has & 0x2000) != 0)
    v40 = 2654435761 * self->_dedicatedBrInactiveToEndMs;
  else
    v40 = 0;
  v39 = -[AudioQuality hash](self->_lastAudioQualityCnt, "hash");
  v8 = (uint64_t)self->_has;
  if ((v8 & 0x2000000000000) != 0)
  {
    v38 = 2654435761 * self->_rtpPktLossPpt;
    if ((v8 & 0x400000000000000) != 0)
    {
LABEL_100:
      v37 = 2654435761 * self->_uflwPktPpt;
      if ((v8 & 0x40000) != 0)
        goto LABEL_101;
      goto LABEL_107;
    }
  }
  else
  {
    v38 = 0;
    if ((v8 & 0x400000000000000) != 0)
      goto LABEL_100;
  }
  v37 = 0;
  if ((v8 & 0x40000) != 0)
  {
LABEL_101:
    v36 = 2654435761 * self->_frErasurePpt;
    if ((v8 & 0x2000000000000000) != 0)
      goto LABEL_102;
    goto LABEL_108;
  }
LABEL_107:
  v36 = 0;
  if ((v8 & 0x2000000000000000) != 0)
  {
LABEL_102:
    v35 = 2654435761 * self->_badAudioQuality;
    if ((v8 & 0x40) != 0)
      goto LABEL_103;
LABEL_109:
    v34 = 0;
    if ((v8 & 0x20) != 0)
      goto LABEL_104;
    goto LABEL_110;
  }
LABEL_108:
  v35 = 0;
  if ((v8 & 0x40) == 0)
    goto LABEL_109;
LABEL_103:
  v34 = 2654435761 * self->_audioQualityThresholdPpt;
  if ((v8 & 0x20) != 0)
  {
LABEL_104:
    v33 = 2654435761 * self->_audioQosDetectWinLenSec;
    goto LABEL_111;
  }
LABEL_110:
  v33 = 0;
LABEL_111:
  v31 = -[NSMutableArray hash](self->_rfMeasInfos, "hash");
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x100000) != 0)
  {
    v10 = 2654435761 * self->_hstState;
    if ((v9 & 0x200000000000) != 0)
    {
LABEL_113:
      v11 = 2654435761 * self->_psPref;
      if ((v9 & 0x40000000000) != 0)
        goto LABEL_114;
      goto LABEL_121;
    }
  }
  else
  {
    v10 = 0;
    if ((v9 & 0x200000000000) != 0)
      goto LABEL_113;
  }
  v11 = 0;
  if ((v9 & 0x40000000000) != 0)
  {
LABEL_114:
    v12 = 2654435761 * self->_numSubs;
    if ((v9 & 0x100000000) != 0)
      goto LABEL_115;
    goto LABEL_122;
  }
LABEL_121:
  v12 = 0;
  if ((v9 & 0x100000000) != 0)
  {
LABEL_115:
    v13 = 2654435761 * self->_numCps;
    if ((v9 & 0x40000000000000) != 0)
      goto LABEL_116;
    goto LABEL_123;
  }
LABEL_122:
  v13 = 0;
  if ((v9 & 0x40000000000000) != 0)
  {
LABEL_116:
    v14 = 2654435761 * self->_sysModeO;
    if ((v9 & 0x10000000000000) != 0)
      goto LABEL_117;
LABEL_124:
    v15 = 0;
    if ((v9 & 0x80000000) != 0)
      goto LABEL_118;
    goto LABEL_125;
  }
LABEL_123:
  v14 = 0;
  if ((v9 & 0x10000000000000) == 0)
    goto LABEL_124;
LABEL_117:
  v15 = 2654435761 * self->_sidO;
  if ((v9 & 0x80000000) != 0)
  {
LABEL_118:
    v16 = 2654435761 * self->_nidO;
    goto LABEL_126;
  }
LABEL_125:
  v16 = 0;
LABEL_126:
  v17 = (unint64_t)-[NSData hash](self->_plmnO, "hash", v31);
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x1000000) != 0)
  {
    v19 = 2654435761 * self->_lastRssi;
    if ((v18 & 0x800000) != 0)
      goto LABEL_128;
  }
  else
  {
    v19 = 0;
    if ((v18 & 0x800000) != 0)
    {
LABEL_128:
      v20 = 2654435761 * self->_lastRsrp;
      goto LABEL_131;
    }
  }
  v20 = 0;
LABEL_131:
  if ((v18 & 0x4000000000000000) != 0)
  {
    v21 = 2654435761 * self->_barredFromSib1;
    if (v18 < 0)
    {
LABEL_133:
      v22 = 2654435761 * self->_barredFromSib2;
      if ((*((_BYTE *)&self->_has + 8) & 1) != 0)
        goto LABEL_134;
      goto LABEL_143;
    }
  }
  else
  {
    v21 = 0;
    if (v18 < 0)
      goto LABEL_133;
  }
  v22 = 0;
  if ((*((_BYTE *)&self->_has + 8) & 1) != 0)
  {
LABEL_134:
    v23 = 2654435761 * self->_connectionRejected;
    if ((v18 & 0x400000) != 0)
      goto LABEL_135;
    goto LABEL_144;
  }
LABEL_143:
  v23 = 0;
  if ((v18 & 0x400000) != 0)
  {
LABEL_135:
    v24 = 2654435761 * self->_lastMotionState;
    if ((v18 & 0x10000000) != 0)
      goto LABEL_136;
    goto LABEL_145;
  }
LABEL_144:
  v24 = 0;
  if ((v18 & 0x10000000) != 0)
  {
LABEL_136:
    v25 = 2654435761 * self->_msSinceLastMotionState;
    if ((v18 & 0x800000000000000) != 0)
      goto LABEL_137;
    goto LABEL_146;
  }
LABEL_145:
  v25 = 0;
  if ((v18 & 0x800000000000000) != 0)
  {
LABEL_137:
    v26 = 2654435761 * self->_version;
    if ((v18 & 0x20000000000000) != 0)
      goto LABEL_138;
    goto LABEL_147;
  }
LABEL_146:
  v26 = 0;
  if ((v18 & 0x20000000000000) != 0)
  {
LABEL_138:
    v27 = 2654435761 * self->_subsId;
    if ((v18 & 0x200000000000000) != 0)
      goto LABEL_139;
LABEL_148:
    v28 = 0;
    if ((v18 & 1) != 0)
      goto LABEL_140;
LABEL_149:
    v29 = 0;
    return v89 ^ v90 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v88 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_147:
  v27 = 0;
  if ((v18 & 0x200000000000000) == 0)
    goto LABEL_148;
LABEL_139:
  v28 = 2654435761 * self->_typeOfCall;
  if ((v18 & 1) == 0)
    goto LABEL_149;
LABEL_140:
  v29 = 2654435761u * self->_nr5gCellId;
  return v89 ^ v90 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v88 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  char v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  uint64_t *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *k;
  uint64_t *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char *m;
  AudioQuality *lastAudioQualityCnt;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *n;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];

  v4 = (char *)a3;
  v5 = v4;
  v6 = *((_QWORD *)v4 + 48);
  if ((v6 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 5);
    *(_QWORD *)&self->_has |= 2uLL;
    v6 = *((_QWORD *)v4 + 48);
  }
  if ((v6 & 0x400) != 0)
  {
    self->_callEvent = *((_DWORD *)v4 + 20);
    *(_QWORD *)&self->_has |= 0x400uLL;
  }
  if (*((_QWORD *)v4 + 11))
    -[CellularVoiceCallEvent setCallId:](self, "setCallId:");
  v7 = *((_QWORD *)v5 + 48);
  if ((v7 & 0x4000) != 0)
  {
    self->_direction = *((_DWORD *)v5 + 30);
    *(_QWORD *)&self->_has |= 0x4000uLL;
    v7 = *((_QWORD *)v5 + 48);
  }
  v8 = v5[392];
  if ((v8 & 4) != 0)
  {
    self->_isAltStart = v5[378];
    *((_BYTE *)&self->_has + 8) |= 4u;
    v7 = *((_QWORD *)v5 + 48);
    v8 = v5[392];
    if ((v7 & 0x80000) == 0)
    {
LABEL_11:
      if ((v7 & 0x8000) == 0)
        goto LABEL_12;
      goto LABEL_90;
    }
  }
  else if ((v7 & 0x80000) == 0)
  {
    goto LABEL_11;
  }
  self->_hoAltSeqNum = *((_DWORD *)v5 + 38);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v7 = *((_QWORD *)v5 + 48);
  v8 = v5[392];
  if ((v7 & 0x8000) == 0)
  {
LABEL_12:
    if ((v7 & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_91;
  }
LABEL_90:
  self->_drxOn = *((_DWORD *)v5 + 31);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v7 = *((_QWORD *)v5 + 48);
  v8 = v5[392];
  if ((v7 & 0x10000) == 0)
  {
LABEL_13:
    if ((v7 & 0x1000000000000) == 0)
      goto LABEL_14;
    goto LABEL_92;
  }
LABEL_91:
  self->_endStatus = *((_DWORD *)v5 + 32);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v7 = *((_QWORD *)v5 + 48);
  v8 = v5[392];
  if ((v7 & 0x1000000000000) == 0)
  {
LABEL_14:
    if ((v7 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_93;
  }
LABEL_92:
  self->_rrcRelCause = *((_DWORD *)v5 + 78);
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  v7 = *((_QWORD *)v5 + 48);
  v8 = v5[392];
  if ((v7 & 0x200) == 0)
  {
LABEL_15:
    if ((v7 & 8) == 0)
      goto LABEL_16;
    goto LABEL_94;
  }
LABEL_93:
  self->_callDuration = *((_DWORD *)v5 + 19);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v7 = *((_QWORD *)v5 + 48);
  v8 = v5[392];
  if ((v7 & 8) == 0)
  {
LABEL_16:
    if ((v8 & 2) == 0)
      goto LABEL_17;
    goto LABEL_95;
  }
LABEL_94:
  self->_antenna = *((_DWORD *)v5 + 13);
  *(_QWORD *)&self->_has |= 8uLL;
  v7 = *((_QWORD *)v5 + 48);
  if ((v5[392] & 2) == 0)
  {
LABEL_17:
    if ((v7 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_95:
  self->_dueToHandover = v5[377];
  *((_BYTE *)&self->_has + 8) |= 2u;
  if ((*((_QWORD *)v5 + 48) & 0x1000) != 0)
  {
LABEL_18:
    self->_cellId = *((_DWORD *)v5 + 28);
    *(_QWORD *)&self->_has |= 0x1000uLL;
  }
LABEL_19:
  if (*((_QWORD *)v5 + 42))
    -[CellularVoiceCallEvent setSimHplmn:](self, "setSimHplmn:");
  v9 = (uint64_t *)(v5 + 384);
  v10 = *((_QWORD *)v5 + 48);
  if ((v10 & 0x2000000000) != 0)
  {
    self->_numMncDigits = *((_DWORD *)v5 + 59);
    *(_QWORD *)&self->_has |= 0x2000000000uLL;
    v10 = *v9;
    if ((*v9 & 0x4000000) == 0)
    {
LABEL_23:
      if ((v10 & 0x8000000) == 0)
        goto LABEL_24;
      goto LABEL_99;
    }
  }
  else if ((v10 & 0x4000000) == 0)
  {
    goto LABEL_23;
  }
  self->_mcc = *((_DWORD *)v5 + 48);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v10 = *((_QWORD *)v5 + 48);
  if ((v10 & 0x8000000) == 0)
  {
LABEL_24:
    if ((v10 & 0x200000) == 0)
      goto LABEL_25;
    goto LABEL_100;
  }
LABEL_99:
  self->_mnc = *((_DWORD *)v5 + 49);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v10 = *((_QWORD *)v5 + 48);
  if ((v10 & 0x200000) == 0)
  {
LABEL_25:
    if ((v10 & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_101;
  }
LABEL_100:
  self->_lac = *((_DWORD *)v5 + 40);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v10 = *((_QWORD *)v5 + 48);
  if ((v10 & 0x80) == 0)
  {
LABEL_26:
    if ((v10 & 0x800000000000) == 0)
      goto LABEL_27;
    goto LABEL_102;
  }
LABEL_101:
  self->_band = *((_DWORD *)v5 + 17);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v10 = *((_QWORD *)v5 + 48);
  if ((v10 & 0x800000000000) == 0)
  {
LABEL_27:
    if ((v10 & 0x100000000000000) == 0)
      goto LABEL_28;
    goto LABEL_103;
  }
LABEL_102:
  self->_rfChannel = *((_DWORD *)v5 + 75);
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  v10 = *((_QWORD *)v5 + 48);
  if ((v10 & 0x100000000000000) == 0)
  {
LABEL_28:
    if ((v10 & 0x1000000000000000) == 0)
      goto LABEL_29;
    goto LABEL_104;
  }
LABEL_103:
  self->_tsAccuracyHour = *((_DWORD *)v5 + 89);
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  v10 = *((_QWORD *)v5 + 48);
  if ((v10 & 0x1000000000000000) == 0)
  {
LABEL_29:
    if ((v10 & 4) == 0)
      goto LABEL_30;
    goto LABEL_105;
  }
LABEL_104:
  self->_accessoryAttached = v5[372];
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  v10 = *((_QWORD *)v5 + 48);
  if ((v10 & 4) == 0)
  {
LABEL_30:
    if ((v10 & 0x8000000000000) == 0)
      goto LABEL_31;
    goto LABEL_106;
  }
LABEL_105:
  self->_accessoryAttachedBitmap = *((_DWORD *)v5 + 12);
  *(_QWORD *)&self->_has |= 4uLL;
  v10 = *((_QWORD *)v5 + 48);
  if ((v10 & 0x8000000000000) == 0)
  {
LABEL_31:
    if ((v10 & 0x4000000000000) == 0)
      goto LABEL_32;
    goto LABEL_107;
  }
LABEL_106:
  self->_setupSysMode = *((_DWORD *)v5 + 81);
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  v10 = *((_QWORD *)v5 + 48);
  if ((v10 & 0x4000000000000) == 0)
  {
LABEL_32:
    if ((v10 & 0x800) == 0)
      goto LABEL_33;
    goto LABEL_108;
  }
LABEL_107:
  self->_setupDirection = *((_DWORD *)v5 + 80);
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  v10 = *((_QWORD *)v5 + 48);
  if ((v10 & 0x800) == 0)
  {
LABEL_33:
    if ((v10 & 0x40000000) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_108:
  self->_callSetupTimeMs = *((_DWORD *)v5 + 24);
  *(_QWORD *)&self->_has |= 0x800uLL;
  if ((*((_QWORD *)v5 + 48) & 0x40000000) != 0)
  {
LABEL_34:
    self->_mtplInPoint1Db = *((_DWORD *)v5 + 52);
    *(_QWORD *)&self->_has |= 0x40000000uLL;
  }
LABEL_35:
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v11 = *((id *)v5 + 13);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v60 != v14)
          objc_enumerationMutation(v11);
        -[CellularVoiceCallEvent addCapEvent:](self, "addCapEvent:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    }
    while (v13);
  }

  if ((*((_QWORD *)v5 + 48) & 0x2000000) != 0)
  {
    self->_lastXSec = *((_DWORD *)v5 + 47);
    *(_QWORD *)&self->_has |= 0x2000000uLL;
  }
  v16 = v5[392];
  if ((v16 & 0x10) != 0)
  {
    self->_lastXSecUlMrab = v5[380];
    *((_BYTE *)&self->_has + 8) |= 0x10u;
    v16 = v5[392];
  }
  if ((v16 & 8) != 0)
  {
    self->_lastXSecDlMrab = v5[379];
    *((_BYTE *)&self->_has + 8) |= 8u;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v17 = *((id *)v5 + 36);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(_QWORD *)v56 != v20)
          objc_enumerationMutation(v17);
        -[CellularVoiceCallEvent addRbData:](self, "addRbData:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    }
    while (v19);
  }

  v22 = (uint64_t *)(v5 + 384);
  v23 = *((_QWORD *)v5 + 48);
  if ((v23 & 0x20000000) != 0)
  {
    self->_msgId = *((_DWORD *)v5 + 51);
    *(_QWORD *)&self->_has |= 0x20000000uLL;
    v23 = *v22;
    if ((*v22 & 0x20000) == 0)
    {
LABEL_57:
      if ((v23 & 0x400000000000) == 0)
        goto LABEL_58;
      goto LABEL_112;
    }
  }
  else if ((v23 & 0x20000) == 0)
  {
    goto LABEL_57;
  }
  self->_eventId = *((_DWORD *)v5 + 33);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v23 = *((_QWORD *)v5 + 48);
  if ((v23 & 0x400000000000) == 0)
  {
LABEL_58:
    if ((v23 & 0x100) == 0)
      goto LABEL_59;
    goto LABEL_113;
  }
LABEL_112:
  self->_responseCode = *((_DWORD *)v5 + 74);
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  v23 = *((_QWORD *)v5 + 48);
  if ((v23 & 0x100) == 0)
  {
LABEL_59:
    if ((v23 & 0x80000000000000) == 0)
      goto LABEL_61;
    goto LABEL_60;
  }
LABEL_113:
  self->_callConnectDur = *((_DWORD *)v5 + 18);
  *(_QWORD *)&self->_has |= 0x100uLL;
  if ((*((_QWORD *)v5 + 48) & 0x80000000000000) != 0)
  {
LABEL_60:
    self->_tbMs = *((_DWORD *)v5 + 88);
    *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  }
LABEL_61:
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v24 = *((id *)v5 + 18);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v26; k = (char *)k + 1)
      {
        if (*(_QWORD *)v52 != v27)
          objc_enumerationMutation(v24);
        -[CellularVoiceCallEvent addHcStat:](self, "addHcStat:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)k));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    }
    while (v26);
  }

  v29 = (uint64_t *)(v5 + 384);
  v30 = *((_QWORD *)v5 + 48);
  if ((v30 & 0x10000000000) != 0)
  {
    self->_numRecvdSpeechPkt = *((_DWORD *)v5 + 62);
    *(_QWORD *)&self->_has |= 0x10000000000uLL;
    v30 = *v29;
    if ((*v29 & 0x8000000000) == 0)
    {
LABEL_70:
      if ((v30 & 0x800000000) == 0)
        goto LABEL_71;
      goto LABEL_117;
    }
  }
  else if ((v30 & 0x8000000000) == 0)
  {
    goto LABEL_70;
  }
  self->_numRecvdSilencePkt = *((_DWORD *)v5 + 61);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v30 = *((_QWORD *)v5 + 48);
  if ((v30 & 0x800000000) == 0)
  {
LABEL_71:
    if ((v30 & 0x100000000000) == 0)
      goto LABEL_72;
    goto LABEL_118;
  }
LABEL_117:
  self->_numLostPkt = *((_DWORD *)v5 + 57);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v30 = *((_QWORD *)v5 + 48);
  if ((v30 & 0x100000000000) == 0)
  {
LABEL_72:
    if ((v30 & 0x80000000000) == 0)
      goto LABEL_73;
    goto LABEL_119;
  }
LABEL_118:
  self->_numUflwSpeechPkt = *((_DWORD *)v5 + 66);
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  v30 = *((_QWORD *)v5 + 48);
  if ((v30 & 0x80000000000) == 0)
  {
LABEL_73:
    if ((v30 & 0x400000000) == 0)
      goto LABEL_74;
    goto LABEL_120;
  }
LABEL_119:
  self->_numUflwSilencePkt = *((_DWORD *)v5 + 65);
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  v30 = *((_QWORD *)v5 + 48);
  if ((v30 & 0x400000000) == 0)
  {
LABEL_74:
    if ((v30 & 0x200000000) == 0)
      goto LABEL_75;
    goto LABEL_121;
  }
LABEL_120:
  self->_numEnqdSpeechPkt = *((_DWORD *)v5 + 56);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v30 = *((_QWORD *)v5 + 48);
  if ((v30 & 0x200000000) == 0)
  {
LABEL_75:
    if ((v30 & 0x4000000000) == 0)
      goto LABEL_76;
    goto LABEL_122;
  }
LABEL_121:
  self->_numEnqdSilencePkt = *((_DWORD *)v5 + 55);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v30 = *((_QWORD *)v5 + 48);
  if ((v30 & 0x4000000000) == 0)
  {
LABEL_76:
    if ((v30 & 0x1000000000) == 0)
      goto LABEL_77;
    goto LABEL_123;
  }
LABEL_122:
  self->_numPlayedSpeechPkt = *((_DWORD *)v5 + 60);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v30 = *((_QWORD *)v5 + 48);
  if ((v30 & 0x1000000000) == 0)
  {
LABEL_77:
    if ((v30 & 0x20000000000) == 0)
      goto LABEL_78;
    goto LABEL_124;
  }
LABEL_123:
  self->_numMissedSpeechPkt = *((_DWORD *)v5 + 58);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v30 = *((_QWORD *)v5 + 48);
  if ((v30 & 0x20000000000) == 0)
  {
LABEL_78:
    if ((v30 & 0x10) == 0)
      goto LABEL_80;
    goto LABEL_79;
  }
LABEL_124:
  self->_numSpeechQempty = *((_DWORD *)v5 + 63);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  if ((*((_QWORD *)v5 + 48) & 0x10) != 0)
  {
LABEL_79:
    self->_appCallId = *((_DWORD *)v5 + 14);
    *(_QWORD *)&self->_has |= 0x10uLL;
  }
LABEL_80:
  v31 = (char *)objc_msgSend(v5, "delayCntsCount");
  if (v31)
  {
    v32 = v31;
    for (m = 0; m != v32; ++m)
      -[CellularVoiceCallEvent addDelayCnt:](self, "addDelayCnt:", objc_msgSend(v5, "delayCntAtIndex:", m));
  }
  if ((*((_QWORD *)v5 + 48) & 0x2000) != 0)
  {
    self->_dedicatedBrInactiveToEndMs = *((_DWORD *)v5 + 29);
    *(_QWORD *)&self->_has |= 0x2000uLL;
  }
  lastAudioQualityCnt = self->_lastAudioQualityCnt;
  v35 = *((_QWORD *)v5 + 21);
  if (lastAudioQualityCnt)
  {
    if (v35)
      -[AudioQuality mergeFrom:](lastAudioQualityCnt, "mergeFrom:");
  }
  else if (v35)
  {
    -[CellularVoiceCallEvent setLastAudioQualityCnt:](self, "setLastAudioQualityCnt:");
  }
  v36 = (uint64_t *)(v5 + 384);
  v37 = *((_QWORD *)v5 + 48);
  if ((v37 & 0x2000000000000) != 0)
  {
    self->_rtpPktLossPpt = *((_DWORD *)v5 + 79);
    *(_QWORD *)&self->_has |= 0x2000000000000uLL;
    v37 = *v36;
    if ((*v36 & 0x400000000000000) == 0)
    {
LABEL_130:
      if ((v37 & 0x40000) == 0)
        goto LABEL_131;
      goto LABEL_168;
    }
  }
  else if ((v37 & 0x400000000000000) == 0)
  {
    goto LABEL_130;
  }
  self->_uflwPktPpt = *((_DWORD *)v5 + 91);
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  v37 = *((_QWORD *)v5 + 48);
  if ((v37 & 0x40000) == 0)
  {
LABEL_131:
    if ((v37 & 0x2000000000000000) == 0)
      goto LABEL_132;
    goto LABEL_169;
  }
LABEL_168:
  self->_frErasurePpt = *((_DWORD *)v5 + 34);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v37 = *((_QWORD *)v5 + 48);
  if ((v37 & 0x2000000000000000) == 0)
  {
LABEL_132:
    if ((v37 & 0x40) == 0)
      goto LABEL_133;
    goto LABEL_170;
  }
LABEL_169:
  self->_badAudioQuality = v5[373];
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  v37 = *((_QWORD *)v5 + 48);
  if ((v37 & 0x40) == 0)
  {
LABEL_133:
    if ((v37 & 0x20) == 0)
      goto LABEL_135;
    goto LABEL_134;
  }
LABEL_170:
  self->_audioQualityThresholdPpt = *((_DWORD *)v5 + 16);
  *(_QWORD *)&self->_has |= 0x40uLL;
  if ((*((_QWORD *)v5 + 48) & 0x20) != 0)
  {
LABEL_134:
    self->_audioQosDetectWinLenSec = *((_DWORD *)v5 + 15);
    *(_QWORD *)&self->_has |= 0x20uLL;
  }
LABEL_135:
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v38 = *((id *)v5 + 38);
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v48;
    do
    {
      for (n = 0; n != v40; n = (char *)n + 1)
      {
        if (*(_QWORD *)v48 != v41)
          objc_enumerationMutation(v38);
        -[CellularVoiceCallEvent addRfMeasInfo:](self, "addRfMeasInfo:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)n), (_QWORD)v47);
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
    }
    while (v40);
  }

  v43 = (uint64_t *)(v5 + 384);
  v44 = *((_QWORD *)v5 + 48);
  if ((v44 & 0x100000) != 0)
  {
    self->_hstState = *((_DWORD *)v5 + 39);
    *(_QWORD *)&self->_has |= 0x100000uLL;
    v44 = *v43;
    if ((*v43 & 0x200000000000) == 0)
    {
LABEL_144:
      if ((v44 & 0x40000000000) == 0)
        goto LABEL_145;
      goto LABEL_174;
    }
  }
  else if ((v44 & 0x200000000000) == 0)
  {
    goto LABEL_144;
  }
  self->_psPref = *((_DWORD *)v5 + 70);
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v44 = *((_QWORD *)v5 + 48);
  if ((v44 & 0x40000000000) == 0)
  {
LABEL_145:
    if ((v44 & 0x100000000) == 0)
      goto LABEL_146;
    goto LABEL_175;
  }
LABEL_174:
  self->_numSubs = *((_DWORD *)v5 + 64);
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v44 = *((_QWORD *)v5 + 48);
  if ((v44 & 0x100000000) == 0)
  {
LABEL_146:
    if ((v44 & 0x40000000000000) == 0)
      goto LABEL_147;
    goto LABEL_176;
  }
LABEL_175:
  self->_numCps = *((_DWORD *)v5 + 54);
  *(_QWORD *)&self->_has |= (unint64_t)&_mh_execute_header;
  v44 = *((_QWORD *)v5 + 48);
  if ((v44 & 0x40000000000000) == 0)
  {
LABEL_147:
    if ((v44 & 0x10000000000000) == 0)
      goto LABEL_148;
    goto LABEL_177;
  }
LABEL_176:
  self->_sysModeO = *((_DWORD *)v5 + 87);
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  v44 = *((_QWORD *)v5 + 48);
  if ((v44 & 0x10000000000000) == 0)
  {
LABEL_148:
    if ((v44 & 0x80000000) == 0)
      goto LABEL_150;
    goto LABEL_149;
  }
LABEL_177:
  self->_sidO = *((_DWORD *)v5 + 82);
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  if ((*((_QWORD *)v5 + 48) & 0x80000000) != 0)
  {
LABEL_149:
    self->_nidO = *((_DWORD *)v5 + 53);
    *(_QWORD *)&self->_has |= 0x80000000uLL;
  }
LABEL_150:
  if (*((_QWORD *)v5 + 34))
    -[CellularVoiceCallEvent setPlmnO:](self, "setPlmnO:");
  v45 = *((_QWORD *)v5 + 48);
  if ((v45 & 0x1000000) != 0)
  {
    self->_lastRssi = *((_DWORD *)v5 + 46);
    *(_QWORD *)&self->_has |= 0x1000000uLL;
    v45 = *((_QWORD *)v5 + 48);
  }
  v46 = v5[392];
  if ((v45 & 0x800000) != 0)
  {
    self->_lastRsrp = *((_DWORD *)v5 + 45);
    *(_QWORD *)&self->_has |= 0x800000uLL;
    v45 = *((_QWORD *)v5 + 48);
    v46 = v5[392];
    if ((v45 & 0x4000000000000000) == 0)
    {
LABEL_156:
      if ((v45 & 0x8000000000000000) == 0)
        goto LABEL_157;
      goto LABEL_181;
    }
  }
  else if ((v45 & 0x4000000000000000) == 0)
  {
    goto LABEL_156;
  }
  self->_barredFromSib1 = v5[374];
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  v45 = *((_QWORD *)v5 + 48);
  v46 = v5[392];
  if ((v45 & 0x8000000000000000) == 0)
  {
LABEL_157:
    if ((v46 & 1) == 0)
      goto LABEL_158;
    goto LABEL_182;
  }
LABEL_181:
  self->_barredFromSib2 = v5[375];
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  v45 = *((_QWORD *)v5 + 48);
  if ((v5[392] & 1) == 0)
  {
LABEL_158:
    if ((v45 & 0x400000) == 0)
      goto LABEL_159;
    goto LABEL_183;
  }
LABEL_182:
  self->_connectionRejected = v5[376];
  *((_BYTE *)&self->_has + 8) |= 1u;
  v45 = *((_QWORD *)v5 + 48);
  if ((v45 & 0x400000) == 0)
  {
LABEL_159:
    if ((v45 & 0x10000000) == 0)
      goto LABEL_160;
    goto LABEL_184;
  }
LABEL_183:
  self->_lastMotionState = *((_DWORD *)v5 + 44);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v45 = *((_QWORD *)v5 + 48);
  if ((v45 & 0x10000000) == 0)
  {
LABEL_160:
    if ((v45 & 0x800000000000000) == 0)
      goto LABEL_161;
    goto LABEL_185;
  }
LABEL_184:
  self->_msSinceLastMotionState = *((_DWORD *)v5 + 50);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v45 = *((_QWORD *)v5 + 48);
  if ((v45 & 0x800000000000000) == 0)
  {
LABEL_161:
    if ((v45 & 0x20000000000000) == 0)
      goto LABEL_162;
    goto LABEL_186;
  }
LABEL_185:
  self->_version = *((_DWORD *)v5 + 92);
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  v45 = *((_QWORD *)v5 + 48);
  if ((v45 & 0x20000000000000) == 0)
  {
LABEL_162:
    if ((v45 & 0x200000000000000) == 0)
      goto LABEL_163;
LABEL_187:
    self->_typeOfCall = *((_DWORD *)v5 + 90);
    *(_QWORD *)&self->_has |= 0x200000000000000uLL;
    if ((*((_QWORD *)v5 + 48) & 1) == 0)
      goto LABEL_165;
    goto LABEL_164;
  }
LABEL_186:
  self->_subsId = *((_DWORD *)v5 + 86);
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  v45 = *((_QWORD *)v5 + 48);
  if ((v45 & 0x200000000000000) != 0)
    goto LABEL_187;
LABEL_163:
  if ((v45 & 1) != 0)
  {
LABEL_164:
    self->_nr5gCellId = *((_QWORD *)v5 + 4);
    *(_QWORD *)&self->_has |= 1uLL;
  }
LABEL_165:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)callId
{
  return self->_callId;
}

- (void)setCallId:(id)a3
{
  objc_storeStrong((id *)&self->_callId, a3);
}

- (BOOL)isAltStart
{
  return self->_isAltStart;
}

- (unsigned)hoAltSeqNum
{
  return self->_hoAltSeqNum;
}

- (unsigned)drxOn
{
  return self->_drxOn;
}

- (unsigned)rrcRelCause
{
  return self->_rrcRelCause;
}

- (int)callDuration
{
  return self->_callDuration;
}

- (BOOL)dueToHandover
{
  return self->_dueToHandover;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (NSData)simHplmn
{
  return self->_simHplmn;
}

- (void)setSimHplmn:(id)a3
{
  objc_storeStrong((id *)&self->_simHplmn, a3);
}

- (unsigned)numMncDigits
{
  return self->_numMncDigits;
}

- (unsigned)mcc
{
  return self->_mcc;
}

- (unsigned)mnc
{
  return self->_mnc;
}

- (unsigned)lac
{
  return self->_lac;
}

- (unsigned)band
{
  return self->_band;
}

- (unsigned)rfChannel
{
  return self->_rfChannel;
}

- (unsigned)tsAccuracyHour
{
  return self->_tsAccuracyHour;
}

- (BOOL)accessoryAttached
{
  return self->_accessoryAttached;
}

- (unsigned)accessoryAttachedBitmap
{
  return self->_accessoryAttachedBitmap;
}

- (unsigned)callSetupTimeMs
{
  return self->_callSetupTimeMs;
}

- (int)mtplInPoint1Db
{
  return self->_mtplInPoint1Db;
}

- (NSMutableArray)capEvents
{
  return self->_capEvents;
}

- (void)setCapEvents:(id)a3
{
  objc_storeStrong((id *)&self->_capEvents, a3);
}

- (unsigned)lastXSec
{
  return self->_lastXSec;
}

- (BOOL)lastXSecUlMrab
{
  return self->_lastXSecUlMrab;
}

- (BOOL)lastXSecDlMrab
{
  return self->_lastXSecDlMrab;
}

- (NSMutableArray)rbDatas
{
  return self->_rbDatas;
}

- (void)setRbDatas:(id)a3
{
  objc_storeStrong((id *)&self->_rbDatas, a3);
}

- (unsigned)msgId
{
  return self->_msgId;
}

- (unsigned)eventId
{
  return self->_eventId;
}

- (unsigned)responseCode
{
  return self->_responseCode;
}

- (unsigned)callConnectDur
{
  return self->_callConnectDur;
}

- (unsigned)tbMs
{
  return self->_tbMs;
}

- (NSMutableArray)hcStats
{
  return self->_hcStats;
}

- (void)setHcStats:(id)a3
{
  objc_storeStrong((id *)&self->_hcStats, a3);
}

- (unsigned)numRecvdSpeechPkt
{
  return self->_numRecvdSpeechPkt;
}

- (unsigned)numRecvdSilencePkt
{
  return self->_numRecvdSilencePkt;
}

- (unsigned)numLostPkt
{
  return self->_numLostPkt;
}

- (unsigned)numUflwSpeechPkt
{
  return self->_numUflwSpeechPkt;
}

- (unsigned)numUflwSilencePkt
{
  return self->_numUflwSilencePkt;
}

- (unsigned)numEnqdSpeechPkt
{
  return self->_numEnqdSpeechPkt;
}

- (unsigned)numEnqdSilencePkt
{
  return self->_numEnqdSilencePkt;
}

- (unsigned)numPlayedSpeechPkt
{
  return self->_numPlayedSpeechPkt;
}

- (unsigned)numMissedSpeechPkt
{
  return self->_numMissedSpeechPkt;
}

- (unsigned)numSpeechQempty
{
  return self->_numSpeechQempty;
}

- (unsigned)appCallId
{
  return self->_appCallId;
}

- (unsigned)dedicatedBrInactiveToEndMs
{
  return self->_dedicatedBrInactiveToEndMs;
}

- (AudioQuality)lastAudioQualityCnt
{
  return self->_lastAudioQualityCnt;
}

- (void)setLastAudioQualityCnt:(id)a3
{
  objc_storeStrong((id *)&self->_lastAudioQualityCnt, a3);
}

- (unsigned)rtpPktLossPpt
{
  return self->_rtpPktLossPpt;
}

- (unsigned)uflwPktPpt
{
  return self->_uflwPktPpt;
}

- (unsigned)frErasurePpt
{
  return self->_frErasurePpt;
}

- (BOOL)badAudioQuality
{
  return self->_badAudioQuality;
}

- (unsigned)audioQualityThresholdPpt
{
  return self->_audioQualityThresholdPpt;
}

- (unsigned)audioQosDetectWinLenSec
{
  return self->_audioQosDetectWinLenSec;
}

- (NSMutableArray)rfMeasInfos
{
  return self->_rfMeasInfos;
}

- (void)setRfMeasInfos:(id)a3
{
  objc_storeStrong((id *)&self->_rfMeasInfos, a3);
}

- (unsigned)hstState
{
  return self->_hstState;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)numCps
{
  return self->_numCps;
}

- (unsigned)sidO
{
  return self->_sidO;
}

- (unsigned)nidO
{
  return self->_nidO;
}

- (NSData)plmnO
{
  return self->_plmnO;
}

- (void)setPlmnO:(id)a3
{
  objc_storeStrong((id *)&self->_plmnO, a3);
}

- (int)lastRssi
{
  return self->_lastRssi;
}

- (int)lastRsrp
{
  return self->_lastRsrp;
}

- (BOOL)barredFromSib1
{
  return self->_barredFromSib1;
}

- (BOOL)barredFromSib2
{
  return self->_barredFromSib2;
}

- (BOOL)connectionRejected
{
  return self->_connectionRejected;
}

- (unsigned)lastMotionState
{
  return self->_lastMotionState;
}

- (unsigned)msSinceLastMotionState
{
  return self->_msSinceLastMotionState;
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unint64_t)nr5gCellId
{
  return self->_nr5gCellId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simHplmn, 0);
  objc_storeStrong((id *)&self->_rfMeasInfos, 0);
  objc_storeStrong((id *)&self->_rbDatas, 0);
  objc_storeStrong((id *)&self->_plmnO, 0);
  objc_storeStrong((id *)&self->_lastAudioQualityCnt, 0);
  objc_storeStrong((id *)&self->_hcStats, 0);
  objc_storeStrong((id *)&self->_capEvents, 0);
  objc_storeStrong((id *)&self->_callId, 0);
}

@end
