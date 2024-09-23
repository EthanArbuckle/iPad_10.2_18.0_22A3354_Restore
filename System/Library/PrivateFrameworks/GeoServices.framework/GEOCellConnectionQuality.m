@implementation GEOCellConnectionQuality

- (GEOCellConnectionQuality)init
{
  GEOCellConnectionQuality *v2;
  GEOCellConnectionQuality *v3;
  GEOCellConnectionQuality *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOCellConnectionQuality;
  v2 = -[GEOCellConnectionQuality init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCellConnectionQuality)initWithData:(id)a3
{
  GEOCellConnectionQuality *v3;
  GEOCellConnectionQuality *v4;
  GEOCellConnectionQuality *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOCellConnectionQuality;
  v3 = -[GEOCellConnectionQuality initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)motionState
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x4000000000) != 0)
    return self->_motionState;
  else
    return 0;
}

- (void)setMotionState:(int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_motionState = a3;
}

- (void)setHasMotionState:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x4000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFBFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasMotionState
{
  return (*(_QWORD *)&self->_flags >> 38) & 1;
}

- (id)motionStateAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C063D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMotionState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_MOTION_STATE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATIONARY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RUNNING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VEHICULAR")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)messageType
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x2000000000) != 0)
    return self->_messageType;
  else
    return 0;
}

- (void)setMessageType:(int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_messageType = a3;
}

- (void)setHasMessageType:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x2000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFDFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasMessageType
{
  return (*(_QWORD *)&self->_flags >> 37) & 1;
}

- (id)messageTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C063F8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMessageType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_MESSAGE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FT_AUDIO")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FT_VIDEO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOLTE_CALL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_CALL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RRC_CONN")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)connectionType
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x8000000) != 0)
    return self->_connectionType;
  else
    return 0;
}

- (void)setConnectionType:(int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x8000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasConnectionType
{
  return (*(_QWORD *)&self->_flags >> 27) & 1;
}

- (id)connectionTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C06428[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsConnectionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CONNECTION_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_AND_CELL")) & 1) != 0)
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

- (int)messageTrigger
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x1000000000) != 0)
    return self->_messageTrigger;
  else
    return 0;
}

- (void)setMessageTrigger:(int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_messageTrigger = a3;
}

- (void)setHasMessageTrigger:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x1000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasMessageTrigger
{
  return (*(_QWORD *)&self->_flags >> 36) & 1;
}

- (id)messageTriggerAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C06450[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMessageTrigger:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_MESSAGE_TRIGGER")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FT_CALL_END")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FT_HO_CELL2WIFI")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FT_HO_WIFI2CELL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOLTE_CALL_END")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_CALL_END")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RRC_CONN_END")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)environment
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40000000) != 0)
    return self->_environment;
  else
    return 0;
}

- (void)setEnvironment:(int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_environment = a3;
}

- (void)setHasEnvironment:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x40000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFBFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasEnvironment
{
  return (*(_QWORD *)&self->_flags >> 30) & 1;
}

- (id)environmentAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C06488[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEnvironment:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ENVIRONMENT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RURAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUBURBAN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("URBAN")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("URBAN_CANYON")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)timeOfDay
{
  return self->_timeOfDay;
}

- (void)setTimeOfDay:(unint64_t)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 4uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_timeOfDay = a3;
}

- (void)setHasTimeOfDay:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 4;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasTimeOfDay
{
  return (*(_QWORD *)&self->_flags >> 2) & 1;
}

- (unsigned)connectionDuration
{
  return self->_connectionDuration;
}

- (void)setConnectionDuration:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_connectionDuration = a3;
}

- (void)setHasConnectionDuration:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x4000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasConnectionDuration
{
  return (*(_QWORD *)&self->_flags >> 26) & 1;
}

- (BOOL)isEmergency
{
  return self->_isEmergency;
}

- (void)setIsEmergency:(BOOL)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x1000000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_isEmergency = a3;
}

- (void)setHasIsEmergency:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x1000000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xEFFFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasIsEmergency
{
  return (*(_QWORD *)&self->_flags >> 60) & 1;
}

- (unint64_t)bytesDlTotal
{
  return self->_bytesDlTotal;
}

- (void)setBytesDlTotal:(unint64_t)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 1uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_bytesDlTotal = a3;
}

- (void)setHasBytesDlTotal:(BOOL)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
  *((_WORD *)&self->_flags + 4) = v3;
}

- (BOOL)hasBytesDlTotal
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unint64_t)bytesUlTotal
{
  return self->_bytesUlTotal;
}

- (void)setBytesUlTotal:(unint64_t)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 2uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_bytesUlTotal = a3;
}

- (void)setHasBytesUlTotal:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 2;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasBytesUlTotal
{
  return (*(_QWORD *)&self->_flags >> 1) & 1;
}

- (void)_readCallID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCallID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCallID
{
  -[GEOCellConnectionQuality _readCallID]((uint64_t)self);
  return self->_callID != 0;
}

- (NSString)callID
{
  -[GEOCellConnectionQuality _readCallID]((uint64_t)self);
  return self->_callID;
}

- (void)setCallID:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2008u;
  objc_storeStrong((id *)&self->_callID, a3);
}

- (BOOL)isCallFailed
{
  return self->_isCallFailed;
}

- (void)setIsCallFailed:(BOOL)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_isCallFailed = a3;
}

- (void)setHasIsCallFailed:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x800000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xF7FFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasIsCallFailed
{
  return (*(_QWORD *)&self->_flags >> 59) & 1;
}

- (float)dlPeakThroughput
{
  return self->_dlPeakThroughput;
}

- (void)setDlPeakThroughput:(float)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_dlPeakThroughput = a3;
}

- (void)setHasDlPeakThroughput:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x20000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasDlPeakThroughput
{
  return (*(_QWORD *)&self->_flags >> 29) & 1;
}

- (float)ulPeakThroughput
{
  return self->_ulPeakThroughput;
}

- (void)setUlPeakThroughput:(float)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_ulPeakThroughput = a3;
}

- (void)setHasUlPeakThroughput:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x10000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFEFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasUlPeakThroughput
{
  return (*(_QWORD *)&self->_flags >> 40) & 1;
}

- (float)dlMedThroughput
{
  return self->_dlMedThroughput;
}

- (void)setDlMedThroughput:(float)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_dlMedThroughput = a3;
}

- (void)setHasDlMedThroughput:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x10000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasDlMedThroughput
{
  return (*(_QWORD *)&self->_flags >> 28) & 1;
}

- (float)ulMedThroughput
{
  return self->_ulMedThroughput;
}

- (void)setUlMedThroughput:(float)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_ulMedThroughput = a3;
}

- (void)setHasUlMedThroughput:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x8000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFF7FFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasUlMedThroughput
{
  return (*(_QWORD *)&self->_flags >> 39) & 1;
}

- (BOOL)lowInternetUL
{
  return self->_lowInternetUL;
}

- (void)setLowInternetUL:(BOOL)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x4000000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_lowInternetUL = a3;
}

- (void)setHasLowInternetUL:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x4000000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xBFFFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasLowInternetUL
{
  return (*(_QWORD *)&self->_flags >> 62) & 1;
}

- (BOOL)lowInternetDL
{
  return self->_lowInternetDL;
}

- (void)setLowInternetDL:(BOOL)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x2000000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_lowInternetDL = a3;
}

- (void)setHasLowInternetDL:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x2000000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xDFFFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasLowInternetDL
{
  return (*(_QWORD *)&self->_flags >> 61) & 1;
}

- (unsigned)latency
{
  return self->_latency;
}

- (void)setLatency:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_latency = a3;
}

- (void)setHasLatency:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x800000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFF7FFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasLatency
{
  return (*(_QWORD *)&self->_flags >> 35) & 1;
}

- (int64_t)wifiRssi
{
  return self->_wifiRssi;
}

- (void)setWifiRssi:(int64_t)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 8uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiRssi = a3;
}

- (void)setHasWifiRssi:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 8;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiRssi
{
  return (*(_QWORD *)&self->_flags >> 3) & 1;
}

- (unsigned)wifiTxPER
{
  return self->_wifiTxPER;
}

- (void)setWifiTxPER:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiTxPER = a3;
}

- (void)setHasWifiTxPER:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x8000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFF7FFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiTxPER
{
  return (*(_QWORD *)&self->_flags >> 51) & 1;
}

- (int64_t)wifiSNR
{
  return self->_wifiSNR;
}

- (void)setWifiSNR:(int64_t)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x10uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiSNR = a3;
}

- (void)setHasWifiSNR:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 16;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiSNR
{
  return (*(_QWORD *)&self->_flags >> 4) & 1;
}

- (BOOL)wifiCaptiveNetworks
{
  return self->_wifiCaptiveNetworks;
}

- (void)setWifiCaptiveNetworks:(BOOL)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x8000000000000000;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiCaptiveNetworks = a3;
}

- (void)setHasWifiCaptiveNetworks:(BOOL)a3
{
  __int16 v3;
  unint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x8000000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = v4 & 0x8000000000000000 | *(_QWORD *)&self->_flags & 0x7FFFFFFFFFFFFFFFLL;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiCaptiveNetworks
{
  return *(_QWORD *)&self->_flags >> 63;
}

- (unsigned)wifiRxRetry
{
  return self->_wifiRxRetry;
}

- (void)setWifiRxRetry:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiRxRetry = a3;
}

- (void)setHasWifiRxRetry:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x2000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFDFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiRxRetry
{
  return (*(_QWORD *)&self->_flags >> 49) & 1;
}

- (unsigned)wifiEstimatedBW
{
  return self->_wifiEstimatedBW;
}

- (void)setWifiEstimatedBW:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiEstimatedBW = a3;
}

- (void)setHasWifiEstimatedBW:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x200000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFDFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiEstimatedBW
{
  return (*(_QWORD *)&self->_flags >> 45) & 1;
}

- (unsigned)wifiTxPhyRate
{
  return self->_wifiTxPhyRate;
}

- (void)setWifiTxPhyRate:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiTxPhyRate = a3;
}

- (void)setHasWifiTxPhyRate:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x10000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFEFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiTxPhyRate
{
  return (*(_QWORD *)&self->_flags >> 52) & 1;
}

- (unsigned)wifiRxPhyRate
{
  return self->_wifiRxPhyRate;
}

- (void)setWifiRxPhyRate:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiRxPhyRate = a3;
}

- (void)setHasWifiRxPhyRate:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x1000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFEFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiRxPhyRate
{
  return HIWORD(*(_QWORD *)&self->_flags) & 1;
}

- (unsigned)wifiQbssLoad
{
  return self->_wifiQbssLoad;
}

- (void)setWifiQbssLoad:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x800000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiQbssLoad = a3;
}

- (void)setHasWifiQbssLoad:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x800000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFF7FFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiQbssLoad
{
  return (*(_QWORD *)&self->_flags >> 47) & 1;
}

- (unsigned)wifiCca
{
  return self->_wifiCca;
}

- (void)setWifiCca:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiCca = a3;
}

- (void)setHasWifiCca:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x40000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFBFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiCca
{
  return (*(_QWORD *)&self->_flags >> 42) & 1;
}

- (unsigned)wifiStationCount
{
  return self->_wifiStationCount;
}

- (void)setWifiStationCount:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x4000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiStationCount = a3;
}

- (void)setHasWifiStationCount:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x4000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFBFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiStationCount
{
  return (*(_QWORD *)&self->_flags >> 50) & 1;
}

- (unsigned)wifiBand
{
  return self->_wifiBand;
}

- (void)setWifiBand:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiBand = a3;
}

- (void)setHasWifiBand:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x20000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFDFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiBand
{
  return (*(_QWORD *)&self->_flags >> 41) & 1;
}

- (unsigned)wifiChannel
{
  return self->_wifiChannel;
}

- (void)setWifiChannel:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiChannel = a3;
}

- (void)setHasWifiChannel:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x100000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFEFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiChannel
{
  return (*(_QWORD *)&self->_flags >> 44) & 1;
}

- (unsigned)wifiChannelWidth
{
  return self->_wifiChannelWidth;
}

- (void)setWifiChannelWidth:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiChannelWidth = a3;
}

- (void)setHasWifiChannelWidth:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x80000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFF7FFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiChannelWidth
{
  return (*(_QWORD *)&self->_flags >> 43) & 1;
}

- (unsigned)wifiPhyMode
{
  return self->_wifiPhyMode;
}

- (void)setWifiPhyMode:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x400000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiPhyMode = a3;
}

- (void)setHasWifiPhyMode:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x400000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFBFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiPhyMode
{
  return (*(_QWORD *)&self->_flags >> 46) & 1;
}

- (void)_readCellGCI
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCellGCI_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCellGCI
{
  -[GEOCellConnectionQuality _readCellGCI]((uint64_t)self);
  return self->_cellGCI != 0;
}

- (NSString)cellGCI
{
  -[GEOCellConnectionQuality _readCellGCI]((uint64_t)self);
  return self->_cellGCI;
}

- (void)setCellGCI:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2010u;
  objc_storeStrong((id *)&self->_cellGCI, a3);
}

- (void)_readCellHomePLMN
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCellHomePLMN_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCellHomePLMN
{
  -[GEOCellConnectionQuality _readCellHomePLMN]((uint64_t)self);
  return self->_cellHomePLMN != 0;
}

- (NSString)cellHomePLMN
{
  -[GEOCellConnectionQuality _readCellHomePLMN]((uint64_t)self);
  return self->_cellHomePLMN;
}

- (void)setCellHomePLMN:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2040u;
  objc_storeStrong((id *)&self->_cellHomePLMN, a3);
}

- (void)_readCellHomePLMN2
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCellHomePLMN2_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCellHomePLMN2
{
  -[GEOCellConnectionQuality _readCellHomePLMN2]((uint64_t)self);
  return self->_cellHomePLMN2 != 0;
}

- (NSString)cellHomePLMN2
{
  -[GEOCellConnectionQuality _readCellHomePLMN2]((uint64_t)self);
  return self->_cellHomePLMN2;
}

- (void)setCellHomePLMN2:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2020u;
  objc_storeStrong((id *)&self->_cellHomePLMN2, a3);
}

- (void)_readCellServiceProvider
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCellServiceProvider_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCellServiceProvider
{
  -[GEOCellConnectionQuality _readCellServiceProvider]((uint64_t)self);
  return self->_cellServiceProvider != 0;
}

- (NSString)cellServiceProvider
{
  -[GEOCellConnectionQuality _readCellServiceProvider]((uint64_t)self);
  return self->_cellServiceProvider;
}

- (void)setCellServiceProvider:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2200u;
  objc_storeStrong((id *)&self->_cellServiceProvider, a3);
}

- (void)_readCellServiceProvider2
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCellServiceProvider2_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCellServiceProvider2
{
  -[GEOCellConnectionQuality _readCellServiceProvider2]((uint64_t)self);
  return self->_cellServiceProvider2 != 0;
}

- (NSString)cellServiceProvider2
{
  -[GEOCellConnectionQuality _readCellServiceProvider2]((uint64_t)self);
  return self->_cellServiceProvider2;
}

- (void)setCellServiceProvider2:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2100u;
  objc_storeStrong((id *)&self->_cellServiceProvider2, a3);
}

- (unsigned)cellVoiceLQM
{
  return self->_cellVoiceLQM;
}

- (void)setCellVoiceLQM:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellVoiceLQM = a3;
}

- (void)setHasCellVoiceLQM:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x2000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellVoiceLQM
{
  return (*(_QWORD *)&self->_flags >> 25) & 1;
}

- (BOOL)cellNpnStatus
{
  return self->_cellNpnStatus;
}

- (void)setCellNpnStatus:(BOOL)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellNpnStatus = a3;
}

- (void)setHasCellNpnStatus:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x400000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFBFFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellNpnStatus
{
  return (*(_QWORD *)&self->_flags >> 58) & 1;
}

- (unsigned)cellNpn
{
  return self->_cellNpn;
}

- (void)setCellNpn:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x8000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellNpn = a3;
}

- (void)setHasCellNpn:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x8000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellNpn
{
  return (*(_QWORD *)&self->_flags >> 15) & 1;
}

- (unsigned)cellArfcn
{
  return self->_cellArfcn;
}

- (void)setCellArfcn:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x20uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellArfcn = a3;
}

- (void)setHasCellArfcn:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 32;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellArfcn
{
  return (*(_QWORD *)&self->_flags >> 5) & 1;
}

- (unsigned)cellBand
{
  return self->_cellBand;
}

- (void)setCellBand:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x40uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellBand = a3;
}

- (void)setHasCellBand:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 64;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellBand
{
  return (*(_QWORD *)&self->_flags >> 6) & 1;
}

- (void)_readCellRatType
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCellRatType_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCellRatType
{
  -[GEOCellConnectionQuality _readCellRatType]((uint64_t)self);
  return self->_cellRatType != 0;
}

- (NSString)cellRatType
{
  -[GEOCellConnectionQuality _readCellRatType]((uint64_t)self);
  return self->_cellRatType;
}

- (void)setCellRatType:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2080u;
  objc_storeStrong((id *)&self->_cellRatType, a3);
}

- (int)cellLteRSRP
{
  return self->_cellLteRSRP;
}

- (void)setCellLteRSRP:(int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x400uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellLteRSRP = a3;
}

- (void)setHasCellLteRSRP:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 1024;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellLteRSRP
{
  return (*(_QWORD *)&self->_flags >> 10) & 1;
}

- (int)cellLteSNR
{
  return self->_cellLteSNR;
}

- (void)setCellLteSNR:(int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellLteSNR = a3;
}

- (void)setHasCellLteSNR:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 4096;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellLteSNR
{
  return (*(_QWORD *)&self->_flags >> 12) & 1;
}

- (int)cellLteRSRQ
{
  return self->_cellLteRSRQ;
}

- (void)setCellLteRSRQ:(int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x800uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellLteRSRQ = a3;
}

- (void)setHasCellLteRSRQ:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 2048;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellLteRSRQ
{
  return (*(_QWORD *)&self->_flags >> 11) & 1;
}

- (int)cellNrRSRP
{
  return self->_cellNrRSRP;
}

- (void)setCellNrRSRP:(int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellNrRSRP = a3;
}

- (void)setHasCellNrRSRP:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x10000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellNrRSRP
{
  return (*(_QWORD *)&self->_flags >> 16) & 1;
}

- (int)cellNrRSRQ
{
  return self->_cellNrRSRQ;
}

- (void)setCellNrRSRQ:(int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellNrRSRQ = a3;
}

- (void)setHasCellNrRSRQ:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x20000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellNrRSRQ
{
  return (*(_QWORD *)&self->_flags >> 17) & 1;
}

- (int)cellNrSNR
{
  return self->_cellNrSNR;
}

- (void)setCellNrSNR:(int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellNrSNR = a3;
}

- (void)setHasCellNrSNR:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x40000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellNrSNR
{
  return (*(_QWORD *)&self->_flags >> 18) & 1;
}

- (unsigned)cellDataLQM
{
  return self->_cellDataLQM;
}

- (void)setCellDataLQM:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x100uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellDataLQM = a3;
}

- (void)setHasCellDataLQM:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 256;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellDataLQM
{
  return (*(_QWORD *)&self->_flags >> 8) & 1;
}

- (unsigned)cellRrcState
{
  return self->_cellRrcState;
}

- (void)setCellRrcState:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellRrcState = a3;
}

- (void)setHasCellRrcState:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x400000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellRrcState
{
  return (*(_QWORD *)&self->_flags >> 22) & 1;
}

- (unsigned)cellNsaFR1
{
  return self->_cellNsaFR1;
}

- (void)setCellNsaFR1:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellNsaFR1 = a3;
}

- (void)setHasCellNsaFR1:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x80000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellNsaFR1
{
  return (*(_QWORD *)&self->_flags >> 19) & 1;
}

- (unsigned)cellNsaFR2
{
  return self->_cellNsaFR2;
}

- (void)setCellNsaFR2:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellNsaFR2 = a3;
}

- (void)setHasCellNsaFR2:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x100000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellNsaFR2
{
  return (*(_QWORD *)&self->_flags >> 20) & 1;
}

- (unsigned)cellTotalDlBW
{
  return self->_cellTotalDlBW;
}

- (void)setCellTotalDlBW:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellTotalDlBW = a3;
}

- (void)setHasCellTotalDlBW:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x800000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellTotalDlBW
{
  return (*(_QWORD *)&self->_flags >> 23) & 1;
}

- (unsigned)cellTotalUlBW
{
  return self->_cellTotalUlBW;
}

- (void)setCellTotalUlBW:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellTotalUlBW = a3;
}

- (void)setHasCellTotalUlBW:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x1000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellTotalUlBW
{
  return (*(_QWORD *)&self->_flags >> 24) & 1;
}

- (unsigned)cellBssLoad
{
  return self->_cellBssLoad;
}

- (void)setCellBssLoad:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x80uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellBssLoad = a3;
}

- (void)setHasCellBssLoad:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 128;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellBssLoad
{
  return (*(_QWORD *)&self->_flags >> 7) & 1;
}

- (unsigned)cellMaxDlCaNumConf
{
  return self->_cellMaxDlCaNumConf;
}

- (void)setCellMaxDlCaNumConf:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellMaxDlCaNumConf = a3;
}

- (void)setHasCellMaxDlCaNumConf:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x2000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellMaxDlCaNumConf
{
  return (*(_QWORD *)&self->_flags >> 13) & 1;
}

- (unsigned)cellMaxUlCaNumConf
{
  return self->_cellMaxUlCaNumConf;
}

- (void)setCellMaxUlCaNumConf:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellMaxUlCaNumConf = a3;
}

- (void)setHasCellMaxUlCaNumConf:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x4000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellMaxUlCaNumConf
{
  return (*(_QWORD *)&self->_flags >> 14) & 1;
}

- (unsigned)cellEstimatedBW
{
  return self->_cellEstimatedBW;
}

- (void)setCellEstimatedBW:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x200uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellEstimatedBW = a3;
}

- (void)setHasCellEstimatedBW:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 512;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellEstimatedBW
{
  return (*(_QWORD *)&self->_flags >> 9) & 1;
}

- (unsigned)cellPMax
{
  return self->_cellPMax;
}

- (void)setCellPMax:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellPMax = a3;
}

- (void)setHasCellPMax:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x200000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellPMax
{
  return (*(_QWORD *)&self->_flags >> 21) & 1;
}

- (BOOL)cellIsRoaming
{
  return self->_cellIsRoaming;
}

- (void)setCellIsRoaming:(BOOL)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x200000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellIsRoaming = a3;
}

- (void)setHasCellIsRoaming:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x200000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFDFFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellIsRoaming
{
  return (*(_QWORD *)&self->_flags >> 57) & 1;
}

- (BOOL)cellIsNoService
{
  return self->_cellIsNoService;
}

- (void)setCellIsNoService:(BOOL)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x100000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellIsNoService = a3;
}

- (void)setHasCellIsNoService:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x100000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFEFFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellIsNoService
{
  return HIBYTE(*(_QWORD *)&self->_flags) & 1;
}

- (BOOL)cellIsLimitedService
{
  return self->_cellIsLimitedService;
}

- (void)setCellIsLimitedService:(BOOL)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x80000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellIsLimitedService = a3;
}

- (void)setHasCellIsLimitedService:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x80000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFF7FFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellIsLimitedService
{
  return (*(_QWORD *)&self->_flags >> 55) & 1;
}

- (void)_readFtIRATRecommendation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFtIRATRecommendation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasFtIRATRecommendation
{
  -[GEOCellConnectionQuality _readFtIRATRecommendation]((uint64_t)self);
  return self->_ftIRATRecommendation != 0;
}

- (NSString)ftIRATRecommendation
{
  -[GEOCellConnectionQuality _readFtIRATRecommendation]((uint64_t)self);
  return self->_ftIRATRecommendation;
}

- (void)setFtIRATRecommendation:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2800u;
  objc_storeStrong((id *)&self->_ftIRATRecommendation, a3);
}

- (void)_readFtIRATRecommendationReason
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFtIRATRecommendationReason_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasFtIRATRecommendationReason
{
  -[GEOCellConnectionQuality _readFtIRATRecommendationReason]((uint64_t)self);
  return self->_ftIRATRecommendationReason != 0;
}

- (NSString)ftIRATRecommendationReason
{
  -[GEOCellConnectionQuality _readFtIRATRecommendationReason]((uint64_t)self);
  return self->_ftIRATRecommendationReason;
}

- (void)setFtIRATRecommendationReason:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2400u;
  objc_storeStrong((id *)&self->_ftIRATRecommendationReason, a3);
}

- (unsigned)ftFacetimePacketLoss
{
  return self->_ftFacetimePacketLoss;
}

- (void)setFtFacetimePacketLoss:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_ftFacetimePacketLoss = a3;
}

- (void)setHasFtFacetimePacketLoss:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x200000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasFtFacetimePacketLoss
{
  return (*(_QWORD *)&self->_flags >> 33) & 1;
}

- (unsigned)ftFacetimeAction
{
  return self->_ftFacetimeAction;
}

- (void)setFtFacetimeAction:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_ftFacetimeAction = a3;
}

- (void)setHasFtFacetimeAction:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x100000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasFtFacetimeAction
{
  return HIDWORD(*(_QWORD *)&self->_flags) & 1;
}

- (unsigned)ftFacetimeTimeDelay
{
  return self->_ftFacetimeTimeDelay;
}

- (void)setFtFacetimeTimeDelay:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_ftFacetimeTimeDelay = a3;
}

- (void)setHasFtFacetimeTimeDelay:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x400000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFBFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasFtFacetimeTimeDelay
{
  return (*(_QWORD *)&self->_flags >> 34) & 1;
}

- (unsigned)ftCounter
{
  return self->_ftCounter;
}

- (void)setFtCounter:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_ftCounter = a3;
}

- (void)setHasFtCounter:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x80000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasFtCounter
{
  return (*(_QWORD *)&self->_flags >> 31) & 1;
}

- (BOOL)wrmAlertedMode
{
  return self->_wrmAlertedMode;
}

- (void)setWrmAlertedMode:(BOOL)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2001u;
  self->_wrmAlertedMode = a3;
}

- (void)setHasWrmAlertedMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8193;
  else
    v3 = 0x2000;
  *((_WORD *)&self->_flags + 4) = *((_WORD *)&self->_flags + 4) & 0xDFFE | v3;
}

- (BOOL)hasWrmAlertedMode
{
  return *((_WORD *)&self->_flags + 4) & 1;
}

- (BOOL)wrmIsStallDetected
{
  return self->_wrmIsStallDetected;
}

- (void)setWrmIsStallDetected:(BOOL)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2004u;
  self->_wrmIsStallDetected = a3;
}

- (void)setHasWrmIsStallDetected:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8196;
  else
    v3 = 0x2000;
  *((_WORD *)&self->_flags + 4) = *((_WORD *)&self->_flags + 4) & 0xFFFB | v3;
}

- (BOOL)hasWrmIsStallDetected
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 4) >> 2) & 1;
}

- (BOOL)wrmIsPCDetected
{
  return self->_wrmIsPCDetected;
}

- (void)setWrmIsPCDetected:(BOOL)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2002u;
  self->_wrmIsPCDetected = a3;
}

- (void)setHasWrmIsPCDetected:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8194;
  else
    v3 = 0x2000;
  *((_WORD *)&self->_flags + 4) = *((_WORD *)&self->_flags + 4) & 0xFFFD | v3;
}

- (BOOL)hasWrmIsPCDetected
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 4) >> 1) & 1;
}

- (unsigned)wrmVideoErasure
{
  return self->_wrmVideoErasure;
}

- (void)setWrmVideoErasure:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x40000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wrmVideoErasure = a3;
}

- (void)setHasWrmVideoErasure:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x40000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFBFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWrmVideoErasure
{
  return (*(_QWORD *)&self->_flags >> 54) & 1;
}

- (unsigned)wrmAudioErasure
{
  return self->_wrmAudioErasure;
}

- (void)setWrmAudioErasure:(unsigned int)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(_QWORD *)&self->_flags |= 0x20000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wrmAudioErasure = a3;
}

- (void)setHasWrmAudioErasure:(BOOL)a3
{
  __int16 v3;
  uint64_t v4;

  v3 = *((_WORD *)&self->_flags + 4);
  v4 = 0x20000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFDFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWrmAudioErasure
{
  return (*(_QWORD *)&self->_flags >> 53) & 1;
}

- (void)_readLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocation_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasLocation
{
  -[GEOCellConnectionQuality _readLocation]((uint64_t)self);
  return self->_location != 0;
}

- (GEOLocation)location
{
  -[GEOCellConnectionQuality _readLocation]((uint64_t)self);
  return self->_location;
}

- (void)setLocation:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x3000u;
  objc_storeStrong((id *)&self->_location, a3);
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
  v8.super_class = (Class)GEOCellConnectionQuality;
  -[GEOCellConnectionQuality description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCellConnectionQuality dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCellConnectionQuality _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __int16 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
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
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;

  if (!a1)
  {
    v97 = 0;
    return v97;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 360);
  if ((v5 & 0x4000000000) != 0)
  {
    v6 = *(int *)(a1 + 280);
    if (v6 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 280));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C063D0[v6];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("motionState"));

    v5 = *(_QWORD *)(a1 + 360);
    if ((v5 & 0x2000000000) == 0)
    {
LABEL_4:
      if ((v5 & 0x8000000) == 0)
        goto LABEL_5;
      goto LABEL_16;
    }
  }
  else if ((v5 & 0x2000000000) == 0)
  {
    goto LABEL_4;
  }
  v8 = *(int *)(a1 + 276);
  if (v8 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 276));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E1C063F8[v8];
  }
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("messageType"));

  v5 = *(_QWORD *)(a1 + 360);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_5:
    if ((v5 & 0x1000000000) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_16:
  v10 = *(int *)(a1 + 236);
  if (v10 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 236));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E1C06428[v10];
  }
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("connectionType"));

  v5 = *(_QWORD *)(a1 + 360);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_28;
    goto LABEL_24;
  }
LABEL_20:
  v12 = *(int *)(a1 + 272);
  if (v12 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 272));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E1C06450[v12];
  }
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("messageTrigger"));

  v5 = *(_QWORD *)(a1 + 360);
  if ((v5 & 0x40000000) != 0)
  {
LABEL_24:
    v14 = *(int *)(a1 + 248);
    if (v14 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 248));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E1C06488[v14];
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("environment"));

    v5 = *(_QWORD *)(a1 + 360);
  }
LABEL_28:
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 112));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("timeOfDay"));

    v5 = *(_QWORD *)(a1 + 360);
    if ((v5 & 0x4000000) == 0)
    {
LABEL_30:
      if ((v5 & 0x1000000000000000) == 0)
        goto LABEL_31;
      goto LABEL_119;
    }
  }
  else if ((v5 & 0x4000000) == 0)
  {
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 232));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("connectionDuration"));

  v5 = *(_QWORD *)(a1 + 360);
  if ((v5 & 0x1000000000000000) == 0)
  {
LABEL_31:
    if ((v5 & 1) == 0)
      goto LABEL_32;
    goto LABEL_120;
  }
LABEL_119:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 353));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("isEmergency"));

  v5 = *(_QWORD *)(a1 + 360);
  if ((v5 & 1) == 0)
  {
LABEL_32:
    if ((v5 & 2) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_120:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("bytesDlTotal"));

  if ((*(_QWORD *)(a1 + 360) & 2) != 0)
  {
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("bytesUlTotal"));

  }
LABEL_34:
  objc_msgSend((id)a1, "callID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("callID"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x800000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 352));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("isCallFailed"));

    v19 = *(_QWORD *)(a1 + 360);
    if ((v19 & 0x20000000) == 0)
    {
LABEL_38:
      if ((v19 & 0x10000000000) == 0)
        goto LABEL_39;
      goto LABEL_124;
    }
  }
  else if ((v19 & 0x20000000) == 0)
  {
    goto LABEL_38;
  }
  LODWORD(v18) = *(_DWORD *)(a1 + 244);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("dlPeakThroughput"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x10000000000) == 0)
  {
LABEL_39:
    if ((v19 & 0x10000000) == 0)
      goto LABEL_40;
    goto LABEL_125;
  }
LABEL_124:
  LODWORD(v18) = *(_DWORD *)(a1 + 288);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("ulPeakThroughput"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x10000000) == 0)
  {
LABEL_40:
    if ((v19 & 0x8000000000) == 0)
      goto LABEL_41;
    goto LABEL_126;
  }
LABEL_125:
  LODWORD(v18) = *(_DWORD *)(a1 + 240);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("dlMedThroughput"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x8000000000) == 0)
  {
LABEL_41:
    if ((v19 & 0x4000000000000000) == 0)
      goto LABEL_42;
    goto LABEL_127;
  }
LABEL_126:
  LODWORD(v18) = *(_DWORD *)(a1 + 284);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("ulMedThroughput"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x4000000000000000) == 0)
  {
LABEL_42:
    if ((v19 & 0x2000000000000000) == 0)
      goto LABEL_43;
    goto LABEL_128;
  }
LABEL_127:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 355));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("lowInternetUL"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x2000000000000000) == 0)
  {
LABEL_43:
    if ((v19 & 0x800000000) == 0)
      goto LABEL_44;
    goto LABEL_129;
  }
LABEL_128:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 354));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("lowInternetDL"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x800000000) == 0)
  {
LABEL_44:
    if ((v19 & 8) == 0)
      goto LABEL_45;
    goto LABEL_130;
  }
LABEL_129:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 268));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("latency"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 8) == 0)
  {
LABEL_45:
    if ((v19 & 0x8000000000000) == 0)
      goto LABEL_46;
    goto LABEL_131;
  }
LABEL_130:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 120));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("wifiRssi"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x8000000000000) == 0)
  {
LABEL_46:
    if ((v19 & 0x10) == 0)
      goto LABEL_47;
    goto LABEL_132;
  }
LABEL_131:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 332));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("wifiTxPER"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x10) == 0)
  {
LABEL_47:
    if ((v19 & 0x8000000000000000) == 0)
      goto LABEL_48;
    goto LABEL_133;
  }
LABEL_132:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 128));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("wifiSNR"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x8000000000000000) == 0)
  {
LABEL_48:
    if ((v19 & 0x2000000000000) == 0)
      goto LABEL_49;
    goto LABEL_134;
  }
LABEL_133:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 356));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v55, CFSTR("wifiCaptiveNetworks"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x2000000000000) == 0)
  {
LABEL_49:
    if ((v19 & 0x200000000000) == 0)
      goto LABEL_50;
    goto LABEL_135;
  }
LABEL_134:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 324));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("wifiRxRetry"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x200000000000) == 0)
  {
LABEL_50:
    if ((v19 & 0x10000000000000) == 0)
      goto LABEL_51;
    goto LABEL_136;
  }
LABEL_135:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 308));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("wifiEstimatedBW"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x10000000000000) == 0)
  {
LABEL_51:
    if ((v19 & 0x1000000000000) == 0)
      goto LABEL_52;
    goto LABEL_137;
  }
LABEL_136:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 336));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("wifiTxPhyRate"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x1000000000000) == 0)
  {
LABEL_52:
    if ((v19 & 0x800000000000) == 0)
      goto LABEL_53;
    goto LABEL_138;
  }
LABEL_137:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 320));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v59, CFSTR("wifiRxPhyRate"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x800000000000) == 0)
  {
LABEL_53:
    if ((v19 & 0x40000000000) == 0)
      goto LABEL_54;
    goto LABEL_139;
  }
LABEL_138:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 316));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("wifiQbssLoad"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x40000000000) == 0)
  {
LABEL_54:
    if ((v19 & 0x4000000000000) == 0)
      goto LABEL_55;
    goto LABEL_140;
  }
LABEL_139:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 296));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v61, CFSTR("wifiCca"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x4000000000000) == 0)
  {
LABEL_55:
    if ((v19 & 0x20000000000) == 0)
      goto LABEL_56;
    goto LABEL_141;
  }
LABEL_140:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 328));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v62, CFSTR("wifiStationCount"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x20000000000) == 0)
  {
LABEL_56:
    if ((v19 & 0x100000000000) == 0)
      goto LABEL_57;
    goto LABEL_142;
  }
LABEL_141:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 292));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v63, CFSTR("wifiBand"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x100000000000) == 0)
  {
LABEL_57:
    if ((v19 & 0x80000000000) == 0)
      goto LABEL_58;
    goto LABEL_143;
  }
LABEL_142:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 304));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("wifiChannel"));

  v19 = *(_QWORD *)(a1 + 360);
  if ((v19 & 0x80000000000) == 0)
  {
LABEL_58:
    if ((v19 & 0x400000000000) == 0)
      goto LABEL_60;
    goto LABEL_59;
  }
LABEL_143:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 300));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v65, CFSTR("wifiChannelWidth"));

  if ((*(_QWORD *)(a1 + 360) & 0x400000000000) != 0)
  {
LABEL_59:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 312));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("wifiPhyMode"));

  }
LABEL_60:
  objc_msgSend((id)a1, "cellGCI");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("cellGCI"));

  objc_msgSend((id)a1, "cellHomePLMN");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("cellHomePLMN"));

  objc_msgSend((id)a1, "cellHomePLMN2");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("cellHomePLMN2"));

  objc_msgSend((id)a1, "cellServiceProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("cellServiceProvider"));

  objc_msgSend((id)a1, "cellServiceProvider2");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("cellServiceProvider2"));

  v26 = *(_QWORD *)(a1 + 360);
  if ((v26 & 0x2000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 228));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v66, CFSTR("cellVoiceLQM"));

    v26 = *(_QWORD *)(a1 + 360);
    if ((v26 & 0x400000000000000) == 0)
    {
LABEL_72:
      if ((v26 & 0x8000) == 0)
        goto LABEL_73;
      goto LABEL_147;
    }
  }
  else if ((v26 & 0x400000000000000) == 0)
  {
    goto LABEL_72;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 351));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v67, CFSTR("cellNpnStatus"));

  v26 = *(_QWORD *)(a1 + 360);
  if ((v26 & 0x8000) == 0)
  {
LABEL_73:
    if ((v26 & 0x20) == 0)
      goto LABEL_74;
    goto LABEL_148;
  }
LABEL_147:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 188));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v68, CFSTR("cellNpn"));

  v26 = *(_QWORD *)(a1 + 360);
  if ((v26 & 0x20) == 0)
  {
LABEL_74:
    if ((v26 & 0x40) == 0)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_148:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 148));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v69, CFSTR("cellArfcn"));

  if ((*(_QWORD *)(a1 + 360) & 0x40) != 0)
  {
LABEL_75:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 152));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("cellBand"));

  }
LABEL_76:
  objc_msgSend((id)a1, "cellRatType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("cellRatType"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 168));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v70, CFSTR("cellLteRSRP"));

    v29 = *(_QWORD *)(a1 + 360);
    if ((v29 & 0x1000) == 0)
    {
LABEL_80:
      if ((v29 & 0x800) == 0)
        goto LABEL_81;
      goto LABEL_152;
    }
  }
  else if ((v29 & 0x1000) == 0)
  {
    goto LABEL_80;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 176));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v71, CFSTR("cellLteSNR"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x800) == 0)
  {
LABEL_81:
    if ((v29 & 0x10000) == 0)
      goto LABEL_82;
    goto LABEL_153;
  }
LABEL_152:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 172));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v72, CFSTR("cellLteRSRQ"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x10000) == 0)
  {
LABEL_82:
    if ((v29 & 0x20000) == 0)
      goto LABEL_83;
    goto LABEL_154;
  }
LABEL_153:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 192));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v73, CFSTR("cellNrRSRP"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x20000) == 0)
  {
LABEL_83:
    if ((v29 & 0x40000) == 0)
      goto LABEL_84;
    goto LABEL_155;
  }
LABEL_154:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 196));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v74, CFSTR("cellNrRSRQ"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x40000) == 0)
  {
LABEL_84:
    if ((v29 & 0x100) == 0)
      goto LABEL_85;
    goto LABEL_156;
  }
LABEL_155:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 200));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v75, CFSTR("cellNrSNR"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x100) == 0)
  {
LABEL_85:
    if ((v29 & 0x400000) == 0)
      goto LABEL_86;
    goto LABEL_157;
  }
LABEL_156:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 160));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v76, CFSTR("cellDataLQM"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x400000) == 0)
  {
LABEL_86:
    if ((v29 & 0x80000) == 0)
      goto LABEL_87;
    goto LABEL_158;
  }
LABEL_157:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 216));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v77, CFSTR("cellRrcState"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x80000) == 0)
  {
LABEL_87:
    if ((v29 & 0x100000) == 0)
      goto LABEL_88;
    goto LABEL_159;
  }
LABEL_158:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 204));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v78, CFSTR("cellNsaFR1"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x100000) == 0)
  {
LABEL_88:
    if ((v29 & 0x800000) == 0)
      goto LABEL_89;
    goto LABEL_160;
  }
LABEL_159:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 208));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v79, CFSTR("cellNsaFR2"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x800000) == 0)
  {
LABEL_89:
    if ((v29 & 0x1000000) == 0)
      goto LABEL_90;
    goto LABEL_161;
  }
LABEL_160:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 220));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v80, CFSTR("cellTotalDlBW"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x1000000) == 0)
  {
LABEL_90:
    if ((v29 & 0x80) == 0)
      goto LABEL_91;
    goto LABEL_162;
  }
LABEL_161:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 224));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v81, CFSTR("cellTotalUlBW"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x80) == 0)
  {
LABEL_91:
    if ((v29 & 0x2000) == 0)
      goto LABEL_92;
    goto LABEL_163;
  }
LABEL_162:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 156));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v82, CFSTR("cellBssLoad"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x2000) == 0)
  {
LABEL_92:
    if ((v29 & 0x4000) == 0)
      goto LABEL_93;
    goto LABEL_164;
  }
LABEL_163:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 180));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v83, CFSTR("cellMaxDlCaNumConf"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x4000) == 0)
  {
LABEL_93:
    if ((v29 & 0x200) == 0)
      goto LABEL_94;
    goto LABEL_165;
  }
LABEL_164:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 184));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v84, CFSTR("cellMaxUlCaNumConf"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x200) == 0)
  {
LABEL_94:
    if ((v29 & 0x200000) == 0)
      goto LABEL_95;
    goto LABEL_166;
  }
LABEL_165:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 164));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v85, CFSTR("cellEstimatedBW"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x200000) == 0)
  {
LABEL_95:
    if ((v29 & 0x200000000000000) == 0)
      goto LABEL_96;
    goto LABEL_167;
  }
LABEL_166:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 212));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v86, CFSTR("cellPMax"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x200000000000000) == 0)
  {
LABEL_96:
    if ((v29 & 0x100000000000000) == 0)
      goto LABEL_97;
    goto LABEL_168;
  }
LABEL_167:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 350));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v87, CFSTR("cellIsRoaming"));

  v29 = *(_QWORD *)(a1 + 360);
  if ((v29 & 0x100000000000000) == 0)
  {
LABEL_97:
    if ((v29 & 0x80000000000000) == 0)
      goto LABEL_99;
    goto LABEL_98;
  }
LABEL_168:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 349));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v88, CFSTR("cellIsNoService"));

  if ((*(_QWORD *)(a1 + 360) & 0x80000000000000) != 0)
  {
LABEL_98:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 348));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("cellIsLimitedService"));

  }
LABEL_99:
  objc_msgSend((id)a1, "ftIRATRecommendation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("ftIRATRecommendation"));

  objc_msgSend((id)a1, "ftIRATRecommendationReason");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("ftIRATRecommendationReason"));

  v33 = a1 + 360;
  v34 = *(_QWORD *)(a1 + 360);
  if ((v34 & 0x200000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 260));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("ftFacetimePacketLoss"));

    v33 = a1 + 360;
    v34 = *(_QWORD *)(a1 + 360);
  }
  v36 = *(_WORD *)(v33 + 8);
  if ((v34 & 0x100000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 256));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v89, CFSTR("ftFacetimeAction"));

    v34 = *(_QWORD *)(a1 + 360);
    v36 = *(_WORD *)(a1 + 368);
    if ((v34 & 0x400000000) == 0)
    {
LABEL_107:
      if ((v34 & 0x80000000) == 0)
        goto LABEL_108;
      goto LABEL_172;
    }
  }
  else if ((v34 & 0x400000000) == 0)
  {
    goto LABEL_107;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 264));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v90, CFSTR("ftFacetimeTimeDelay"));

  v34 = *(_QWORD *)(a1 + 360);
  v36 = *(_WORD *)(a1 + 368);
  if ((v34 & 0x80000000) == 0)
  {
LABEL_108:
    if ((v36 & 1) == 0)
      goto LABEL_109;
    goto LABEL_173;
  }
LABEL_172:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 252));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v91, CFSTR("ftCounter"));

  v34 = *(_QWORD *)(a1 + 360);
  v36 = *(_WORD *)(a1 + 368);
  if ((v36 & 1) == 0)
  {
LABEL_109:
    if ((v36 & 4) == 0)
      goto LABEL_110;
    goto LABEL_174;
  }
LABEL_173:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 357));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v92, CFSTR("wrmAlertedMode"));

  v34 = *(_QWORD *)(a1 + 360);
  v36 = *(_WORD *)(a1 + 368);
  if ((v36 & 4) == 0)
  {
LABEL_110:
    if ((v36 & 2) == 0)
      goto LABEL_111;
    goto LABEL_175;
  }
LABEL_174:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 359));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v93, CFSTR("wrmIsStallDetected"));

  v34 = *(_QWORD *)(a1 + 360);
  if ((*(_WORD *)(a1 + 368) & 2) == 0)
  {
LABEL_111:
    if ((v34 & 0x40000000000000) == 0)
      goto LABEL_112;
LABEL_176:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 344));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v95, CFSTR("wrmVideoErasure"));

    if ((*(_QWORD *)(a1 + 360) & 0x20000000000000) == 0)
      goto LABEL_114;
    goto LABEL_113;
  }
LABEL_175:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 358));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v94, CFSTR("wrmIsPCDetected"));

  v34 = *(_QWORD *)(a1 + 360);
  if ((v34 & 0x40000000000000) != 0)
    goto LABEL_176;
LABEL_112:
  if ((v34 & 0x20000000000000) != 0)
  {
LABEL_113:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 340));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("wrmAudioErasure"));

  }
LABEL_114:
  objc_msgSend((id)a1, "location");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v38, "jsonRepresentation");
    else
      objc_msgSend(v38, "dictionaryRepresentation");
    v96 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v96, CFSTR("location"));
  }

  v97 = v4;
  return v97;
}

- (id)jsonRepresentation
{
  return -[GEOCellConnectionQuality _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCellConnectionQuality)initWithDictionary:(id)a3
{
  return (GEOCellConnectionQuality *)-[GEOCellConnectionQuality _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
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
  void *v89;
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
  GEOLocation *v102;
  uint64_t v103;
  void *v104;

  v5 = a2;
  if (!a1)
    goto LABEL_237;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_237;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("motionState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNKNOWN_MOTION_STATE")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATIONARY")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RUNNING")) & 1) != 0)
    {
      v8 = 3;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("VEHICULAR")))
    {
      v8 = 4;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_19;
    v8 = objc_msgSend(v6, "intValue");
  }
  objc_msgSend(a1, "setMotionState:", v8);
LABEL_19:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("messageType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UNKNOWN_MESSAGE_TYPE")) & 1) != 0)
    {
      v11 = 0;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FT_AUDIO")) & 1) != 0)
    {
      v11 = 1;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FT_VIDEO")) & 1) != 0)
    {
      v11 = 2;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("VOLTE_CALL")) & 1) != 0)
    {
      v11 = 3;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WIFI_CALL")) & 1) != 0)
    {
      v11 = 4;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("RRC_CONN")))
    {
      v11 = 5;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_37;
    v11 = objc_msgSend(v9, "intValue");
  }
  objc_msgSend(a1, "setMessageType:", v11);
LABEL_37:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("connectionType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("UNKNOWN_CONNECTION_TYPE")) & 1) != 0)
    {
      v14 = 0;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("WIFI")) & 1) != 0)
    {
      v14 = 1;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CELL")) & 1) != 0)
    {
      v14 = 2;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("WIFI_AND_CELL")) & 1) != 0)
    {
      v14 = 3;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("OTHER")))
    {
      v14 = 4;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_53;
    v14 = objc_msgSend(v12, "intValue");
  }
  objc_msgSend(a1, "setConnectionType:", v14);
LABEL_53:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("messageTrigger"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v15;
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("UNKNOWN_MESSAGE_TRIGGER")) & 1) != 0)
    {
      v17 = 0;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("FT_CALL_END")) & 1) != 0)
    {
      v17 = 1;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("FT_HO_CELL2WIFI")) & 1) != 0)
    {
      v17 = 2;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("FT_HO_WIFI2CELL")) & 1) != 0)
    {
      v17 = 3;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("VOLTE_CALL_END")) & 1) != 0)
    {
      v17 = 4;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("WIFI_CALL_END")) & 1) != 0)
    {
      v17 = 5;
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("RRC_CONN_END")))
    {
      v17 = 6;
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_73;
    v17 = objc_msgSend(v15, "intValue");
  }
  objc_msgSend(a1, "setMessageTrigger:", v17);
LABEL_73:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("environment"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v18;
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("UNKNOWN_ENVIRONMENT")) & 1) != 0)
    {
      v20 = 0;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("RURAL")) & 1) != 0)
    {
      v20 = 1;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("SUBURBAN")) & 1) != 0)
    {
      v20 = 2;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("URBAN")) & 1) != 0)
    {
      v20 = 3;
    }
    else if (objc_msgSend(v19, "isEqualToString:", CFSTR("URBAN_CANYON")))
    {
      v20 = 4;
    }
    else
    {
      v20 = 0;
    }

    goto LABEL_88;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_msgSend(v18, "intValue");
LABEL_88:
    objc_msgSend(a1, "setEnvironment:", v20);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeOfDay"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTimeOfDay:", objc_msgSend(v21, "unsignedLongLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("connectionDuration"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setConnectionDuration:", objc_msgSend(v22, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isEmergency"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsEmergency:", objc_msgSend(v23, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bytesDlTotal"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBytesDlTotal:", objc_msgSend(v24, "unsignedLongLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bytesUlTotal"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBytesUlTotal:", objc_msgSend(v25, "unsignedLongLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("callID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(a1, "setCallID:", v27);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isCallFailed"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsCallFailed:", objc_msgSend(v28, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dlPeakThroughput"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v29, "floatValue");
    objc_msgSend(a1, "setDlPeakThroughput:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ulPeakThroughput"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v30, "floatValue");
    objc_msgSend(a1, "setUlPeakThroughput:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dlMedThroughput"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v31, "floatValue");
    objc_msgSend(a1, "setDlMedThroughput:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ulMedThroughput"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v32, "floatValue");
    objc_msgSend(a1, "setUlMedThroughput:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lowInternetUL"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLowInternetUL:", objc_msgSend(v33, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lowInternetDL"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLowInternetDL:", objc_msgSend(v34, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("latency"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLatency:", objc_msgSend(v35, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiRssi"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWifiRssi:", objc_msgSend(v36, "longLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiTxPER"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWifiTxPER:", objc_msgSend(v37, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiSNR"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWifiSNR:", objc_msgSend(v38, "longLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiCaptiveNetworks"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWifiCaptiveNetworks:", objc_msgSend(v39, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiRxRetry"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWifiRxRetry:", objc_msgSend(v40, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiEstimatedBW"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWifiEstimatedBW:", objc_msgSend(v41, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiTxPhyRate"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWifiTxPhyRate:", objc_msgSend(v42, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiRxPhyRate"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWifiRxPhyRate:", objc_msgSend(v43, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiQbssLoad"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWifiQbssLoad:", objc_msgSend(v44, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiCca"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWifiCca:", objc_msgSend(v45, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiStationCount"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWifiStationCount:", objc_msgSend(v46, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiBand"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWifiBand:", objc_msgSend(v47, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiChannel"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWifiChannel:", objc_msgSend(v48, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiChannelWidth"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWifiChannelWidth:", objc_msgSend(v49, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiPhyMode"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWifiPhyMode:", objc_msgSend(v50, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellGCI"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = (void *)objc_msgSend(v51, "copy");
    objc_msgSend(a1, "setCellGCI:", v52);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellHomePLMN"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = (void *)objc_msgSend(v53, "copy");
    objc_msgSend(a1, "setCellHomePLMN:", v54);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellHomePLMN2"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = (void *)objc_msgSend(v55, "copy");
    objc_msgSend(a1, "setCellHomePLMN2:", v56);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellServiceProvider"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v58 = (void *)objc_msgSend(v57, "copy");
    objc_msgSend(a1, "setCellServiceProvider:", v58);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellServiceProvider2"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v60 = (void *)objc_msgSend(v59, "copy");
    objc_msgSend(a1, "setCellServiceProvider2:", v60);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellVoiceLQM"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellVoiceLQM:", objc_msgSend(v61, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellNpnStatus"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellNpnStatus:", objc_msgSend(v62, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellNpn"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellNpn:", objc_msgSend(v63, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellArfcn"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellArfcn:", objc_msgSend(v64, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellBand"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellBand:", objc_msgSend(v65, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellRatType"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v67 = (void *)objc_msgSend(v66, "copy");
    objc_msgSend(a1, "setCellRatType:", v67);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellLteRSRP"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellLteRSRP:", objc_msgSend(v68, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellLteSNR"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellLteSNR:", objc_msgSend(v69, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellLteRSRQ"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellLteRSRQ:", objc_msgSend(v70, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellNrRSRP"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellNrRSRP:", objc_msgSend(v71, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellNrRSRQ"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellNrRSRQ:", objc_msgSend(v72, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellNrSNR"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellNrSNR:", objc_msgSend(v73, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellDataLQM"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellDataLQM:", objc_msgSend(v74, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellRrcState"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellRrcState:", objc_msgSend(v75, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellNsaFR1"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellNsaFR1:", objc_msgSend(v76, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellNsaFR2"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellNsaFR2:", objc_msgSend(v77, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellTotalDlBW"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellTotalDlBW:", objc_msgSend(v78, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellTotalUlBW"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellTotalUlBW:", objc_msgSend(v79, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellBssLoad"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellBssLoad:", objc_msgSend(v80, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellMaxDlCaNumConf"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellMaxDlCaNumConf:", objc_msgSend(v81, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellMaxUlCaNumConf"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellMaxUlCaNumConf:", objc_msgSend(v82, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellEstimatedBW"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellEstimatedBW:", objc_msgSend(v83, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellPMax"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellPMax:", objc_msgSend(v84, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellIsRoaming"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellIsRoaming:", objc_msgSend(v85, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellIsNoService"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellIsNoService:", objc_msgSend(v86, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cellIsLimitedService"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCellIsLimitedService:", objc_msgSend(v87, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ftIRATRecommendation"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v89 = (void *)objc_msgSend(v88, "copy");
    objc_msgSend(a1, "setFtIRATRecommendation:", v89);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ftIRATRecommendationReason"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = (void *)objc_msgSend(v90, "copy");
    objc_msgSend(a1, "setFtIRATRecommendationReason:", v91);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ftFacetimePacketLoss"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setFtFacetimePacketLoss:", objc_msgSend(v92, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ftFacetimeAction"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setFtFacetimeAction:", objc_msgSend(v93, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ftFacetimeTimeDelay"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setFtFacetimeTimeDelay:", objc_msgSend(v94, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ftCounter"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setFtCounter:", objc_msgSend(v95, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wrmAlertedMode"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWrmAlertedMode:", objc_msgSend(v96, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wrmIsStallDetected"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWrmIsStallDetected:", objc_msgSend(v97, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wrmIsPCDetected"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWrmIsPCDetected:", objc_msgSend(v98, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wrmVideoErasure"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWrmVideoErasure:", objc_msgSend(v99, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wrmAudioErasure"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWrmAudioErasure:", objc_msgSend(v100, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v102 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v103 = -[GEOLocation initWithJSON:](v102, "initWithJSON:", v101);
    else
      v103 = -[GEOLocation initWithDictionary:](v102, "initWithDictionary:", v101);
    v104 = (void *)v103;
    objc_msgSend(a1, "setLocation:", v103);

  }
  a1 = a1;

LABEL_237:
  return a1;
}

- (GEOCellConnectionQuality)initWithJSON:(id)a3
{
  return (GEOCellConnectionQuality *)-[GEOCellConnectionQuality _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_17;
    else
      v8 = (int *)&readAll__nonRecursiveTag_17;
    GEOCellConnectionQualityReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOLocation readAll:](self->_location, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCellConnectionQualityIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCellConnectionQualityReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  $E3FA1B1F2865026426AE4E71E2722ABB *p_flags;
  uint64_t flags;
  $E3FA1B1F2865026426AE4E71E2722ABB *v7;
  uint64_t v8;
  $E3FA1B1F2865026426AE4E71E2722ABB *v9;
  uint64_t v10;
  $E3FA1B1F2865026426AE4E71E2722ABB *v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;
  PBDataReader *v15;
  void *v16;
  id v17;

  v17 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOCellConnectionQualityIsDirty((uint64_t)self))
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "writeData:", v16);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
    goto LABEL_163;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCellConnectionQuality readAll:](self, "readAll:", 0);
  p_flags = &self->_flags;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = *(_QWORD *)p_flags;
    if ((*(_QWORD *)p_flags & 0x2000000000) == 0)
    {
LABEL_5:
      if ((flags & 0x8000000) == 0)
        goto LABEL_6;
      goto LABEL_98;
    }
  }
  else if ((flags & 0x2000000000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x8000000) == 0)
  {
LABEL_6:
    if ((flags & 0x1000000000) == 0)
      goto LABEL_7;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteInt32Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000000) == 0)
  {
LABEL_7:
    if ((flags & 0x40000000) == 0)
      goto LABEL_8;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt32Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x40000000) == 0)
  {
LABEL_8:
    if ((flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteInt32Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_9:
    if ((flags & 0x4000000) == 0)
      goto LABEL_10;
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint64Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000) == 0)
  {
LABEL_10:
    if ((flags & 0x1000000000000000) == 0)
      goto LABEL_11;
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000000000000) == 0)
  {
LABEL_11:
    if ((flags & 1) == 0)
      goto LABEL_12;
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteBOOLField();
  flags = (uint64_t)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_12:
    if ((flags & 2) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_104:
  PBDataWriterWriteUint64Field();
  if ((*(_QWORD *)&self->_flags & 2) != 0)
LABEL_13:
    PBDataWriterWriteUint64Field();
LABEL_14:
  if (self->_callID)
    PBDataWriterWriteStringField();
  v7 = &self->_flags;
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x800000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v8 = *(_QWORD *)v7;
    if ((*(_QWORD *)v7 & 0x20000000) == 0)
    {
LABEL_18:
      if ((v8 & 0x10000000000) == 0)
        goto LABEL_19;
      goto LABEL_108;
    }
  }
  else if ((v8 & 0x20000000) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteFloatField();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x10000000000) == 0)
  {
LABEL_19:
    if ((v8 & 0x10000000) == 0)
      goto LABEL_20;
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteFloatField();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x10000000) == 0)
  {
LABEL_20:
    if ((v8 & 0x8000000000) == 0)
      goto LABEL_21;
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteFloatField();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x8000000000) == 0)
  {
LABEL_21:
    if ((v8 & 0x4000000000000000) == 0)
      goto LABEL_22;
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteFloatField();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x4000000000000000) == 0)
  {
LABEL_22:
    if ((v8 & 0x2000000000000000) == 0)
      goto LABEL_23;
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteBOOLField();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x2000000000000000) == 0)
  {
LABEL_23:
    if ((v8 & 0x800000000) == 0)
      goto LABEL_24;
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteBOOLField();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x800000000) == 0)
  {
LABEL_24:
    if ((v8 & 8) == 0)
      goto LABEL_25;
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteUint32Field();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 8) == 0)
  {
LABEL_25:
    if ((v8 & 0x8000000000000) == 0)
      goto LABEL_26;
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteSint64Field();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x8000000000000) == 0)
  {
LABEL_26:
    if ((v8 & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteUint32Field();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x10) == 0)
  {
LABEL_27:
    if ((v8 & 0x8000000000000000) == 0)
      goto LABEL_28;
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteSint64Field();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x8000000000000000) == 0)
  {
LABEL_28:
    if ((v8 & 0x2000000000000) == 0)
      goto LABEL_29;
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteBOOLField();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x2000000000000) == 0)
  {
LABEL_29:
    if ((v8 & 0x200000000000) == 0)
      goto LABEL_30;
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteUint32Field();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x200000000000) == 0)
  {
LABEL_30:
    if ((v8 & 0x10000000000000) == 0)
      goto LABEL_31;
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteUint32Field();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x10000000000000) == 0)
  {
LABEL_31:
    if ((v8 & 0x1000000000000) == 0)
      goto LABEL_32;
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteUint32Field();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x1000000000000) == 0)
  {
LABEL_32:
    if ((v8 & 0x800000000000) == 0)
      goto LABEL_33;
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteUint32Field();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x800000000000) == 0)
  {
LABEL_33:
    if ((v8 & 0x40000000000) == 0)
      goto LABEL_34;
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteUint32Field();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x40000000000) == 0)
  {
LABEL_34:
    if ((v8 & 0x4000000000000) == 0)
      goto LABEL_35;
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteUint32Field();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x4000000000000) == 0)
  {
LABEL_35:
    if ((v8 & 0x20000000000) == 0)
      goto LABEL_36;
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteUint32Field();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x20000000000) == 0)
  {
LABEL_36:
    if ((v8 & 0x100000000000) == 0)
      goto LABEL_37;
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteUint32Field();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x100000000000) == 0)
  {
LABEL_37:
    if ((v8 & 0x80000000000) == 0)
      goto LABEL_38;
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteUint32Field();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x80000000000) == 0)
  {
LABEL_38:
    if ((v8 & 0x400000000000) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_127:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_flags & 0x400000000000) != 0)
LABEL_39:
    PBDataWriterWriteUint32Field();
LABEL_40:
  if (self->_cellGCI)
    PBDataWriterWriteStringField();
  if (self->_cellHomePLMN)
    PBDataWriterWriteStringField();
  if (self->_cellHomePLMN2)
    PBDataWriterWriteStringField();
  if (self->_cellServiceProvider)
    PBDataWriterWriteStringField();
  if (self->_cellServiceProvider2)
    PBDataWriterWriteStringField();
  v9 = &self->_flags;
  v10 = (uint64_t)self->_flags;
  if ((v10 & 0x2000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v10 = *(_QWORD *)v9;
    if ((*(_QWORD *)v9 & 0x400000000000000) == 0)
    {
LABEL_52:
      if ((v10 & 0x8000) == 0)
        goto LABEL_53;
      goto LABEL_131;
    }
  }
  else if ((v10 & 0x400000000000000) == 0)
  {
    goto LABEL_52;
  }
  PBDataWriterWriteBOOLField();
  v10 = (uint64_t)self->_flags;
  if ((v10 & 0x8000) == 0)
  {
LABEL_53:
    if ((v10 & 0x20) == 0)
      goto LABEL_54;
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteUint32Field();
  v10 = (uint64_t)self->_flags;
  if ((v10 & 0x20) == 0)
  {
LABEL_54:
    if ((v10 & 0x40) == 0)
      goto LABEL_56;
    goto LABEL_55;
  }
LABEL_132:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_flags & 0x40) != 0)
LABEL_55:
    PBDataWriterWriteUint32Field();
LABEL_56:
  if (self->_cellRatType)
    PBDataWriterWriteStringField();
  v11 = &self->_flags;
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x400) != 0)
  {
    PBDataWriterWriteSint32Field();
    v12 = *(_QWORD *)v11;
    if ((*(_QWORD *)v11 & 0x1000) == 0)
    {
LABEL_60:
      if ((v12 & 0x800) == 0)
        goto LABEL_61;
      goto LABEL_136;
    }
  }
  else if ((v12 & 0x1000) == 0)
  {
    goto LABEL_60;
  }
  PBDataWriterWriteSint32Field();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x800) == 0)
  {
LABEL_61:
    if ((v12 & 0x10000) == 0)
      goto LABEL_62;
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteSint32Field();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x10000) == 0)
  {
LABEL_62:
    if ((v12 & 0x20000) == 0)
      goto LABEL_63;
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteSint32Field();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x20000) == 0)
  {
LABEL_63:
    if ((v12 & 0x40000) == 0)
      goto LABEL_64;
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteSint32Field();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x40000) == 0)
  {
LABEL_64:
    if ((v12 & 0x100) == 0)
      goto LABEL_65;
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteSint32Field();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x100) == 0)
  {
LABEL_65:
    if ((v12 & 0x400000) == 0)
      goto LABEL_66;
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteUint32Field();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x400000) == 0)
  {
LABEL_66:
    if ((v12 & 0x80000) == 0)
      goto LABEL_67;
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteUint32Field();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x80000) == 0)
  {
LABEL_67:
    if ((v12 & 0x100000) == 0)
      goto LABEL_68;
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteUint32Field();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x100000) == 0)
  {
LABEL_68:
    if ((v12 & 0x800000) == 0)
      goto LABEL_69;
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteUint32Field();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x800000) == 0)
  {
LABEL_69:
    if ((v12 & 0x1000000) == 0)
      goto LABEL_70;
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteUint32Field();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x1000000) == 0)
  {
LABEL_70:
    if ((v12 & 0x80) == 0)
      goto LABEL_71;
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteUint32Field();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x80) == 0)
  {
LABEL_71:
    if ((v12 & 0x2000) == 0)
      goto LABEL_72;
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteUint32Field();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x2000) == 0)
  {
LABEL_72:
    if ((v12 & 0x4000) == 0)
      goto LABEL_73;
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteUint32Field();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x4000) == 0)
  {
LABEL_73:
    if ((v12 & 0x200) == 0)
      goto LABEL_74;
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteUint32Field();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x200) == 0)
  {
LABEL_74:
    if ((v12 & 0x200000) == 0)
      goto LABEL_75;
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteUint32Field();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x200000) == 0)
  {
LABEL_75:
    if ((v12 & 0x200000000000000) == 0)
      goto LABEL_76;
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteUint32Field();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x200000000000000) == 0)
  {
LABEL_76:
    if ((v12 & 0x100000000000000) == 0)
      goto LABEL_77;
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteBOOLField();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x100000000000000) == 0)
  {
LABEL_77:
    if ((v12 & 0x80000000000000) == 0)
      goto LABEL_79;
    goto LABEL_78;
  }
LABEL_152:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_flags & 0x80000000000000) != 0)
LABEL_78:
    PBDataWriterWriteBOOLField();
LABEL_79:
  if (self->_ftIRATRecommendation)
    PBDataWriterWriteStringField();
  if (self->_ftIRATRecommendationReason)
    PBDataWriterWriteStringField();
  v13 = (uint64_t)self->_flags;
  if ((v13 & 0x200000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v13 = (uint64_t)self->_flags;
  }
  v14 = *((_WORD *)&self->_flags + 4);
  if ((v13 & 0x100000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v13 = (uint64_t)self->_flags;
    v14 = *((_WORD *)&self->_flags + 4);
    if ((v13 & 0x400000000) == 0)
    {
LABEL_87:
      if ((v13 & 0x80000000) == 0)
        goto LABEL_88;
      goto LABEL_156;
    }
  }
  else if ((v13 & 0x400000000) == 0)
  {
    goto LABEL_87;
  }
  PBDataWriterWriteUint32Field();
  v13 = (uint64_t)self->_flags;
  v14 = *((_WORD *)&self->_flags + 4);
  if ((v13 & 0x80000000) == 0)
  {
LABEL_88:
    if ((v14 & 1) == 0)
      goto LABEL_89;
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteUint32Field();
  v13 = (uint64_t)self->_flags;
  v14 = *((_WORD *)&self->_flags + 4);
  if ((v14 & 1) == 0)
  {
LABEL_89:
    if ((v14 & 4) == 0)
      goto LABEL_90;
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteBOOLField();
  v13 = (uint64_t)self->_flags;
  v14 = *((_WORD *)&self->_flags + 4);
  if ((v14 & 4) == 0)
  {
LABEL_90:
    if ((v14 & 2) == 0)
      goto LABEL_91;
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteBOOLField();
  v13 = (uint64_t)self->_flags;
  if ((*((_WORD *)&self->_flags + 4) & 2) == 0)
  {
LABEL_91:
    if ((v13 & 0x40000000000000) == 0)
      goto LABEL_92;
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteBOOLField();
  v13 = (uint64_t)self->_flags;
  if ((v13 & 0x40000000000000) == 0)
  {
LABEL_92:
    if ((v13 & 0x20000000000000) == 0)
      goto LABEL_94;
    goto LABEL_93;
  }
LABEL_160:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_flags & 0x20000000000000) != 0)
LABEL_93:
    PBDataWriterWriteUint32Field();
LABEL_94:
  if (self->_location)
    PBDataWriterWriteSubmessage();
LABEL_163:

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOCellConnectionQualityClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOCellConnectionQuality _readLocation]((uint64_t)self);
  return -[GEOLocation hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  $E3FA1B1F2865026426AE4E71E2722ABB *p_flags;
  uint64_t flags;
  $E3FA1B1F2865026426AE4E71E2722ABB *v7;
  uint64_t v8;
  $E3FA1B1F2865026426AE4E71E2722ABB *v9;
  uint64_t v10;
  $E3FA1B1F2865026426AE4E71E2722ABB *v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;
  id *v15;

  v15 = (id *)a3;
  -[GEOCellConnectionQuality readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 34) = self->_readerMarkPos;
  *((_DWORD *)v15 + 35) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v15;
  p_flags = &self->_flags;
  flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000000) != 0)
  {
    *((_DWORD *)v15 + 70) = self->_motionState;
    v15[45] = (id)((unint64_t)v15[45] | 0x4000000000);
    flags = *(_QWORD *)p_flags;
    if ((*(_QWORD *)p_flags & 0x2000000000) == 0)
    {
LABEL_3:
      if ((flags & 0x8000000) == 0)
        goto LABEL_4;
      goto LABEL_97;
    }
  }
  else if ((flags & 0x2000000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v15 + 69) = self->_messageType;
  v15[45] = (id)((unint64_t)v15[45] | 0x2000000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x8000000) == 0)
  {
LABEL_4:
    if ((flags & 0x1000000000) == 0)
      goto LABEL_5;
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)v15 + 59) = self->_connectionType;
  v15[45] = (id)((unint64_t)v15[45] | 0x8000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000000) == 0)
  {
LABEL_5:
    if ((flags & 0x40000000) == 0)
      goto LABEL_6;
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)v15 + 68) = self->_messageTrigger;
  v15[45] = (id)((unint64_t)v15[45] | 0x1000000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x40000000) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)v15 + 62) = self->_environment;
  v15[45] = (id)((unint64_t)v15[45] | 0x40000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_7:
    if ((flags & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_101;
  }
LABEL_100:
  v15[14] = (id)self->_timeOfDay;
  v15[45] = (id)((unint64_t)v15[45] | 4);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000) == 0)
  {
LABEL_8:
    if ((flags & 0x1000000000000000) == 0)
      goto LABEL_9;
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)v15 + 58) = self->_connectionDuration;
  v15[45] = (id)((unint64_t)v15[45] | 0x4000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000000000000) == 0)
  {
LABEL_9:
    if ((flags & 1) == 0)
      goto LABEL_10;
    goto LABEL_103;
  }
LABEL_102:
  *((_BYTE *)v15 + 353) = self->_isEmergency;
  v15[45] = (id)((unint64_t)v15[45] | 0x1000000000000000);
  flags = (uint64_t)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_10:
    if ((flags & 2) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_103:
  v15[2] = (id)self->_bytesDlTotal;
  v15[45] = (id)((unint64_t)v15[45] | 1);
  if ((*(_QWORD *)&self->_flags & 2) != 0)
  {
LABEL_11:
    v15[3] = (id)self->_bytesUlTotal;
    v15[45] = (id)((unint64_t)v15[45] | 2);
  }
LABEL_12:
  if (self->_callID)
  {
    objc_msgSend(v15, "setCallID:");
    v4 = v15;
  }
  v7 = &self->_flags;
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x800000000000000) != 0)
  {
    *((_BYTE *)v4 + 352) = self->_isCallFailed;
    v4[45] = (id)((unint64_t)v4[45] | 0x800000000000000);
    v8 = *(_QWORD *)v7;
    if ((*(_QWORD *)v7 & 0x20000000) == 0)
    {
LABEL_16:
      if ((v8 & 0x10000000000) == 0)
        goto LABEL_17;
      goto LABEL_107;
    }
  }
  else if ((v8 & 0x20000000) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v4 + 61) = LODWORD(self->_dlPeakThroughput);
  v4[45] = (id)((unint64_t)v4[45] | 0x20000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x10000000000) == 0)
  {
LABEL_17:
    if ((v8 & 0x10000000) == 0)
      goto LABEL_18;
    goto LABEL_108;
  }
LABEL_107:
  *((_DWORD *)v4 + 72) = LODWORD(self->_ulPeakThroughput);
  v4[45] = (id)((unint64_t)v4[45] | 0x10000000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x10000000) == 0)
  {
LABEL_18:
    if ((v8 & 0x8000000000) == 0)
      goto LABEL_19;
    goto LABEL_109;
  }
LABEL_108:
  *((_DWORD *)v4 + 60) = LODWORD(self->_dlMedThroughput);
  v4[45] = (id)((unint64_t)v4[45] | 0x10000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x8000000000) == 0)
  {
LABEL_19:
    if ((v8 & 0x4000000000000000) == 0)
      goto LABEL_20;
    goto LABEL_110;
  }
LABEL_109:
  *((_DWORD *)v4 + 71) = LODWORD(self->_ulMedThroughput);
  v4[45] = (id)((unint64_t)v4[45] | 0x8000000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x4000000000000000) == 0)
  {
LABEL_20:
    if ((v8 & 0x2000000000000000) == 0)
      goto LABEL_21;
    goto LABEL_111;
  }
LABEL_110:
  *((_BYTE *)v4 + 355) = self->_lowInternetUL;
  v4[45] = (id)((unint64_t)v4[45] | 0x4000000000000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x2000000000000000) == 0)
  {
LABEL_21:
    if ((v8 & 0x800000000) == 0)
      goto LABEL_22;
    goto LABEL_112;
  }
LABEL_111:
  *((_BYTE *)v4 + 354) = self->_lowInternetDL;
  v4[45] = (id)((unint64_t)v4[45] | 0x2000000000000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x800000000) == 0)
  {
LABEL_22:
    if ((v8 & 8) == 0)
      goto LABEL_23;
    goto LABEL_113;
  }
LABEL_112:
  *((_DWORD *)v4 + 67) = self->_latency;
  v4[45] = (id)((unint64_t)v4[45] | 0x800000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 8) == 0)
  {
LABEL_23:
    if ((v8 & 0x8000000000000) == 0)
      goto LABEL_24;
    goto LABEL_114;
  }
LABEL_113:
  v4[15] = (id)self->_wifiRssi;
  v4[45] = (id)((unint64_t)v4[45] | 8);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x8000000000000) == 0)
  {
LABEL_24:
    if ((v8 & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_115;
  }
LABEL_114:
  *((_DWORD *)v4 + 83) = self->_wifiTxPER;
  v4[45] = (id)((unint64_t)v4[45] | 0x8000000000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x10) == 0)
  {
LABEL_25:
    if ((v8 & 0x8000000000000000) == 0)
      goto LABEL_26;
    goto LABEL_116;
  }
LABEL_115:
  v4[16] = (id)self->_wifiSNR;
  v4[45] = (id)((unint64_t)v4[45] | 0x10);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x8000000000000000) == 0)
  {
LABEL_26:
    if ((v8 & 0x2000000000000) == 0)
      goto LABEL_27;
    goto LABEL_117;
  }
LABEL_116:
  *((_BYTE *)v4 + 356) = self->_wifiCaptiveNetworks;
  v4[45] = (id)((unint64_t)v4[45] | 0x8000000000000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x2000000000000) == 0)
  {
LABEL_27:
    if ((v8 & 0x200000000000) == 0)
      goto LABEL_28;
    goto LABEL_118;
  }
LABEL_117:
  *((_DWORD *)v4 + 81) = self->_wifiRxRetry;
  v4[45] = (id)((unint64_t)v4[45] | 0x2000000000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x200000000000) == 0)
  {
LABEL_28:
    if ((v8 & 0x10000000000000) == 0)
      goto LABEL_29;
    goto LABEL_119;
  }
LABEL_118:
  *((_DWORD *)v4 + 77) = self->_wifiEstimatedBW;
  v4[45] = (id)((unint64_t)v4[45] | 0x200000000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x10000000000000) == 0)
  {
LABEL_29:
    if ((v8 & 0x1000000000000) == 0)
      goto LABEL_30;
    goto LABEL_120;
  }
LABEL_119:
  *((_DWORD *)v4 + 84) = self->_wifiTxPhyRate;
  v4[45] = (id)((unint64_t)v4[45] | 0x10000000000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x1000000000000) == 0)
  {
LABEL_30:
    if ((v8 & 0x800000000000) == 0)
      goto LABEL_31;
    goto LABEL_121;
  }
LABEL_120:
  *((_DWORD *)v4 + 80) = self->_wifiRxPhyRate;
  v4[45] = (id)((unint64_t)v4[45] | 0x1000000000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x800000000000) == 0)
  {
LABEL_31:
    if ((v8 & 0x40000000000) == 0)
      goto LABEL_32;
    goto LABEL_122;
  }
LABEL_121:
  *((_DWORD *)v4 + 79) = self->_wifiQbssLoad;
  v4[45] = (id)((unint64_t)v4[45] | 0x800000000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x40000000000) == 0)
  {
LABEL_32:
    if ((v8 & 0x4000000000000) == 0)
      goto LABEL_33;
    goto LABEL_123;
  }
LABEL_122:
  *((_DWORD *)v4 + 74) = self->_wifiCca;
  v4[45] = (id)((unint64_t)v4[45] | 0x40000000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x4000000000000) == 0)
  {
LABEL_33:
    if ((v8 & 0x20000000000) == 0)
      goto LABEL_34;
    goto LABEL_124;
  }
LABEL_123:
  *((_DWORD *)v4 + 82) = self->_wifiStationCount;
  v4[45] = (id)((unint64_t)v4[45] | 0x4000000000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x20000000000) == 0)
  {
LABEL_34:
    if ((v8 & 0x100000000000) == 0)
      goto LABEL_35;
    goto LABEL_125;
  }
LABEL_124:
  *((_DWORD *)v4 + 73) = self->_wifiBand;
  v4[45] = (id)((unint64_t)v4[45] | 0x20000000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x100000000000) == 0)
  {
LABEL_35:
    if ((v8 & 0x80000000000) == 0)
      goto LABEL_36;
    goto LABEL_126;
  }
LABEL_125:
  *((_DWORD *)v4 + 76) = self->_wifiChannel;
  v4[45] = (id)((unint64_t)v4[45] | 0x100000000000);
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x80000000000) == 0)
  {
LABEL_36:
    if ((v8 & 0x400000000000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_126:
  *((_DWORD *)v4 + 75) = self->_wifiChannelWidth;
  v4[45] = (id)((unint64_t)v4[45] | 0x80000000000);
  if ((*(_QWORD *)&self->_flags & 0x400000000000) != 0)
  {
LABEL_37:
    *((_DWORD *)v4 + 78) = self->_wifiPhyMode;
    v4[45] = (id)((unint64_t)v4[45] | 0x400000000000);
  }
LABEL_38:
  if (self->_cellGCI)
  {
    objc_msgSend(v15, "setCellGCI:");
    v4 = v15;
  }
  if (self->_cellHomePLMN)
  {
    objc_msgSend(v15, "setCellHomePLMN:");
    v4 = v15;
  }
  if (self->_cellHomePLMN2)
  {
    objc_msgSend(v15, "setCellHomePLMN2:");
    v4 = v15;
  }
  if (self->_cellServiceProvider)
  {
    objc_msgSend(v15, "setCellServiceProvider:");
    v4 = v15;
  }
  if (self->_cellServiceProvider2)
  {
    objc_msgSend(v15, "setCellServiceProvider2:");
    v4 = v15;
  }
  v9 = &self->_flags;
  v10 = (uint64_t)self->_flags;
  if ((v10 & 0x2000000) != 0)
  {
    *((_DWORD *)v4 + 57) = self->_cellVoiceLQM;
    v4[45] = (id)((unint64_t)v4[45] | 0x2000000);
    v10 = *(_QWORD *)v9;
    if ((*(_QWORD *)v9 & 0x400000000000000) == 0)
    {
LABEL_50:
      if ((v10 & 0x8000) == 0)
        goto LABEL_51;
      goto LABEL_130;
    }
  }
  else if ((v10 & 0x400000000000000) == 0)
  {
    goto LABEL_50;
  }
  *((_BYTE *)v4 + 351) = self->_cellNpnStatus;
  v4[45] = (id)((unint64_t)v4[45] | 0x400000000000000);
  v10 = (uint64_t)self->_flags;
  if ((v10 & 0x8000) == 0)
  {
LABEL_51:
    if ((v10 & 0x20) == 0)
      goto LABEL_52;
    goto LABEL_131;
  }
LABEL_130:
  *((_DWORD *)v4 + 47) = self->_cellNpn;
  v4[45] = (id)((unint64_t)v4[45] | 0x8000);
  v10 = (uint64_t)self->_flags;
  if ((v10 & 0x20) == 0)
  {
LABEL_52:
    if ((v10 & 0x40) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
LABEL_131:
  *((_DWORD *)v4 + 37) = self->_cellArfcn;
  v4[45] = (id)((unint64_t)v4[45] | 0x20);
  if ((*(_QWORD *)&self->_flags & 0x40) != 0)
  {
LABEL_53:
    *((_DWORD *)v4 + 38) = self->_cellBand;
    v4[45] = (id)((unint64_t)v4[45] | 0x40);
  }
LABEL_54:
  if (self->_cellRatType)
  {
    objc_msgSend(v15, "setCellRatType:");
    v4 = v15;
  }
  v11 = &self->_flags;
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x400) != 0)
  {
    *((_DWORD *)v4 + 42) = self->_cellLteRSRP;
    v4[45] = (id)((unint64_t)v4[45] | 0x400);
    v12 = *(_QWORD *)v11;
    if ((*(_QWORD *)v11 & 0x1000) == 0)
    {
LABEL_58:
      if ((v12 & 0x800) == 0)
        goto LABEL_59;
      goto LABEL_135;
    }
  }
  else if ((v12 & 0x1000) == 0)
  {
    goto LABEL_58;
  }
  *((_DWORD *)v4 + 44) = self->_cellLteSNR;
  v4[45] = (id)((unint64_t)v4[45] | 0x1000);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x800) == 0)
  {
LABEL_59:
    if ((v12 & 0x10000) == 0)
      goto LABEL_60;
    goto LABEL_136;
  }
LABEL_135:
  *((_DWORD *)v4 + 43) = self->_cellLteRSRQ;
  v4[45] = (id)((unint64_t)v4[45] | 0x800);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x10000) == 0)
  {
LABEL_60:
    if ((v12 & 0x20000) == 0)
      goto LABEL_61;
    goto LABEL_137;
  }
LABEL_136:
  *((_DWORD *)v4 + 48) = self->_cellNrRSRP;
  v4[45] = (id)((unint64_t)v4[45] | 0x10000);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x20000) == 0)
  {
LABEL_61:
    if ((v12 & 0x40000) == 0)
      goto LABEL_62;
    goto LABEL_138;
  }
LABEL_137:
  *((_DWORD *)v4 + 49) = self->_cellNrRSRQ;
  v4[45] = (id)((unint64_t)v4[45] | 0x20000);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x40000) == 0)
  {
LABEL_62:
    if ((v12 & 0x100) == 0)
      goto LABEL_63;
    goto LABEL_139;
  }
LABEL_138:
  *((_DWORD *)v4 + 50) = self->_cellNrSNR;
  v4[45] = (id)((unint64_t)v4[45] | 0x40000);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x100) == 0)
  {
LABEL_63:
    if ((v12 & 0x400000) == 0)
      goto LABEL_64;
    goto LABEL_140;
  }
LABEL_139:
  *((_DWORD *)v4 + 40) = self->_cellDataLQM;
  v4[45] = (id)((unint64_t)v4[45] | 0x100);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x400000) == 0)
  {
LABEL_64:
    if ((v12 & 0x80000) == 0)
      goto LABEL_65;
    goto LABEL_141;
  }
LABEL_140:
  *((_DWORD *)v4 + 54) = self->_cellRrcState;
  v4[45] = (id)((unint64_t)v4[45] | 0x400000);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x80000) == 0)
  {
LABEL_65:
    if ((v12 & 0x100000) == 0)
      goto LABEL_66;
    goto LABEL_142;
  }
LABEL_141:
  *((_DWORD *)v4 + 51) = self->_cellNsaFR1;
  v4[45] = (id)((unint64_t)v4[45] | 0x80000);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x100000) == 0)
  {
LABEL_66:
    if ((v12 & 0x800000) == 0)
      goto LABEL_67;
    goto LABEL_143;
  }
LABEL_142:
  *((_DWORD *)v4 + 52) = self->_cellNsaFR2;
  v4[45] = (id)((unint64_t)v4[45] | 0x100000);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x800000) == 0)
  {
LABEL_67:
    if ((v12 & 0x1000000) == 0)
      goto LABEL_68;
    goto LABEL_144;
  }
LABEL_143:
  *((_DWORD *)v4 + 55) = self->_cellTotalDlBW;
  v4[45] = (id)((unint64_t)v4[45] | 0x800000);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x1000000) == 0)
  {
LABEL_68:
    if ((v12 & 0x80) == 0)
      goto LABEL_69;
    goto LABEL_145;
  }
LABEL_144:
  *((_DWORD *)v4 + 56) = self->_cellTotalUlBW;
  v4[45] = (id)((unint64_t)v4[45] | 0x1000000);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x80) == 0)
  {
LABEL_69:
    if ((v12 & 0x2000) == 0)
      goto LABEL_70;
    goto LABEL_146;
  }
LABEL_145:
  *((_DWORD *)v4 + 39) = self->_cellBssLoad;
  v4[45] = (id)((unint64_t)v4[45] | 0x80);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x2000) == 0)
  {
LABEL_70:
    if ((v12 & 0x4000) == 0)
      goto LABEL_71;
    goto LABEL_147;
  }
LABEL_146:
  *((_DWORD *)v4 + 45) = self->_cellMaxDlCaNumConf;
  v4[45] = (id)((unint64_t)v4[45] | 0x2000);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x4000) == 0)
  {
LABEL_71:
    if ((v12 & 0x200) == 0)
      goto LABEL_72;
    goto LABEL_148;
  }
LABEL_147:
  *((_DWORD *)v4 + 46) = self->_cellMaxUlCaNumConf;
  v4[45] = (id)((unint64_t)v4[45] | 0x4000);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x200) == 0)
  {
LABEL_72:
    if ((v12 & 0x200000) == 0)
      goto LABEL_73;
    goto LABEL_149;
  }
LABEL_148:
  *((_DWORD *)v4 + 41) = self->_cellEstimatedBW;
  v4[45] = (id)((unint64_t)v4[45] | 0x200);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x200000) == 0)
  {
LABEL_73:
    if ((v12 & 0x200000000000000) == 0)
      goto LABEL_74;
    goto LABEL_150;
  }
LABEL_149:
  *((_DWORD *)v4 + 53) = self->_cellPMax;
  v4[45] = (id)((unint64_t)v4[45] | 0x200000);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x200000000000000) == 0)
  {
LABEL_74:
    if ((v12 & 0x100000000000000) == 0)
      goto LABEL_75;
    goto LABEL_151;
  }
LABEL_150:
  *((_BYTE *)v4 + 350) = self->_cellIsRoaming;
  v4[45] = (id)((unint64_t)v4[45] | 0x200000000000000);
  v12 = (uint64_t)self->_flags;
  if ((v12 & 0x100000000000000) == 0)
  {
LABEL_75:
    if ((v12 & 0x80000000000000) == 0)
      goto LABEL_77;
    goto LABEL_76;
  }
LABEL_151:
  *((_BYTE *)v4 + 349) = self->_cellIsNoService;
  v4[45] = (id)((unint64_t)v4[45] | 0x100000000000000);
  if ((*(_QWORD *)&self->_flags & 0x80000000000000) != 0)
  {
LABEL_76:
    *((_BYTE *)v4 + 348) = self->_cellIsLimitedService;
    v4[45] = (id)((unint64_t)v4[45] | 0x80000000000000);
  }
LABEL_77:
  if (self->_ftIRATRecommendation)
  {
    objc_msgSend(v15, "setFtIRATRecommendation:");
    v4 = v15;
  }
  if (self->_ftIRATRecommendationReason)
  {
    objc_msgSend(v15, "setFtIRATRecommendationReason:");
    v4 = v15;
  }
  v13 = (uint64_t)self->_flags;
  if ((v13 & 0x200000000) != 0)
  {
    *((_DWORD *)v4 + 65) = self->_ftFacetimePacketLoss;
    v4[45] = (id)((unint64_t)v4[45] | 0x200000000);
    v13 = (uint64_t)self->_flags;
  }
  v14 = *((_WORD *)&self->_flags + 4);
  if ((v13 & 0x100000000) != 0)
  {
    *((_DWORD *)v4 + 64) = self->_ftFacetimeAction;
    v4[45] = (id)((unint64_t)v4[45] | 0x100000000);
    v13 = (uint64_t)self->_flags;
    v14 = *((_WORD *)&self->_flags + 4);
    if ((v13 & 0x400000000) == 0)
    {
LABEL_85:
      if ((v13 & 0x80000000) == 0)
        goto LABEL_86;
      goto LABEL_155;
    }
  }
  else if ((v13 & 0x400000000) == 0)
  {
    goto LABEL_85;
  }
  *((_DWORD *)v4 + 66) = self->_ftFacetimeTimeDelay;
  v4[45] = (id)((unint64_t)v4[45] | 0x400000000);
  v13 = (uint64_t)self->_flags;
  v14 = *((_WORD *)&self->_flags + 4);
  if ((v13 & 0x80000000) == 0)
  {
LABEL_86:
    if ((v14 & 1) == 0)
      goto LABEL_87;
    goto LABEL_156;
  }
LABEL_155:
  *((_DWORD *)v4 + 63) = self->_ftCounter;
  v4[45] = (id)((unint64_t)v4[45] | 0x80000000);
  v13 = (uint64_t)self->_flags;
  v14 = *((_WORD *)&self->_flags + 4);
  if ((v14 & 1) == 0)
  {
LABEL_87:
    if ((v14 & 4) == 0)
      goto LABEL_88;
    goto LABEL_157;
  }
LABEL_156:
  *((_BYTE *)v4 + 357) = self->_wrmAlertedMode;
  *((_WORD *)v4 + 184) |= 1u;
  v13 = (uint64_t)self->_flags;
  v14 = *((_WORD *)&self->_flags + 4);
  if ((v14 & 4) == 0)
  {
LABEL_88:
    if ((v14 & 2) == 0)
      goto LABEL_89;
    goto LABEL_158;
  }
LABEL_157:
  *((_BYTE *)v4 + 359) = self->_wrmIsStallDetected;
  *((_WORD *)v4 + 184) |= 4u;
  v13 = (uint64_t)self->_flags;
  if ((*((_WORD *)&self->_flags + 4) & 2) == 0)
  {
LABEL_89:
    if ((v13 & 0x40000000000000) == 0)
      goto LABEL_90;
    goto LABEL_159;
  }
LABEL_158:
  *((_BYTE *)v4 + 358) = self->_wrmIsPCDetected;
  *((_WORD *)v4 + 184) |= 2u;
  v13 = (uint64_t)self->_flags;
  if ((v13 & 0x40000000000000) == 0)
  {
LABEL_90:
    if ((v13 & 0x20000000000000) == 0)
      goto LABEL_92;
    goto LABEL_91;
  }
LABEL_159:
  *((_DWORD *)v4 + 86) = self->_wrmVideoErasure;
  v4[45] = (id)((unint64_t)v4[45] | 0x40000000000000);
  if ((*(_QWORD *)&self->_flags & 0x20000000000000) != 0)
  {
LABEL_91:
    *((_DWORD *)v4 + 85) = self->_wrmAudioErasure;
    v4[45] = (id)((unint64_t)v4[45] | 0x20000000000000);
  }
LABEL_92:
  if (self->_location)
  {
    objc_msgSend(v15, "setLocation:");
    v4 = v15;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $E3FA1B1F2865026426AE4E71E2722ABB *p_flags;
  uint64_t flags;
  uint64_t v11;
  void *v12;
  $E3FA1B1F2865026426AE4E71E2722ABB *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  $E3FA1B1F2865026426AE4E71E2722ABB *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  $E3FA1B1F2865026426AE4E71E2722ABB *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  void *v38;
  id v39;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOCellConnectionQuality readAll:](self, "readAll:", 0);
    p_flags = &self->_flags;
    flags = (uint64_t)self->_flags;
    if ((flags & 0x4000000000) != 0)
    {
      *(_DWORD *)(v5 + 280) = self->_motionState;
      *(_QWORD *)(v5 + 360) |= 0x4000000000uLL;
      flags = *(_QWORD *)p_flags;
      if ((*(_QWORD *)p_flags & 0x2000000000) == 0)
      {
LABEL_7:
        if ((flags & 0x8000000) == 0)
          goto LABEL_8;
        goto LABEL_82;
      }
    }
    else if ((flags & 0x2000000000) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 276) = self->_messageType;
    *(_QWORD *)(v5 + 360) |= 0x2000000000uLL;
    flags = (uint64_t)self->_flags;
    if ((flags & 0x8000000) == 0)
    {
LABEL_8:
      if ((flags & 0x1000000000) == 0)
        goto LABEL_9;
      goto LABEL_83;
    }
LABEL_82:
    *(_DWORD *)(v5 + 236) = self->_connectionType;
    *(_QWORD *)(v5 + 360) |= 0x8000000uLL;
    flags = (uint64_t)self->_flags;
    if ((flags & 0x1000000000) == 0)
    {
LABEL_9:
      if ((flags & 0x40000000) == 0)
        goto LABEL_10;
      goto LABEL_84;
    }
LABEL_83:
    *(_DWORD *)(v5 + 272) = self->_messageTrigger;
    *(_QWORD *)(v5 + 360) |= 0x1000000000uLL;
    flags = (uint64_t)self->_flags;
    if ((flags & 0x40000000) == 0)
    {
LABEL_10:
      if ((flags & 4) == 0)
        goto LABEL_11;
      goto LABEL_85;
    }
LABEL_84:
    *(_DWORD *)(v5 + 248) = self->_environment;
    *(_QWORD *)(v5 + 360) |= 0x40000000uLL;
    flags = (uint64_t)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_11:
      if ((flags & 0x4000000) == 0)
        goto LABEL_12;
      goto LABEL_86;
    }
LABEL_85:
    *(_QWORD *)(v5 + 112) = self->_timeOfDay;
    *(_QWORD *)(v5 + 360) |= 4uLL;
    flags = (uint64_t)self->_flags;
    if ((flags & 0x4000000) == 0)
    {
LABEL_12:
      if ((flags & 0x1000000000000000) == 0)
        goto LABEL_13;
      goto LABEL_87;
    }
LABEL_86:
    *(_DWORD *)(v5 + 232) = self->_connectionDuration;
    *(_QWORD *)(v5 + 360) |= 0x4000000uLL;
    flags = (uint64_t)self->_flags;
    if ((flags & 0x1000000000000000) == 0)
    {
LABEL_13:
      if ((flags & 1) == 0)
        goto LABEL_14;
      goto LABEL_88;
    }
LABEL_87:
    *(_BYTE *)(v5 + 353) = self->_isEmergency;
    *(_QWORD *)(v5 + 360) |= 0x1000000000000000uLL;
    flags = (uint64_t)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_14:
      if ((flags & 2) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
LABEL_88:
    *(_QWORD *)(v5 + 16) = self->_bytesDlTotal;
    *(_QWORD *)(v5 + 360) |= 1uLL;
    if ((*(_QWORD *)&self->_flags & 2) == 0)
    {
LABEL_16:
      v11 = -[NSString copyWithZone:](self->_callID, "copyWithZone:", a3);
      v12 = *(void **)(v5 + 32);
      *(_QWORD *)(v5 + 32) = v11;

      v13 = &self->_flags;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x800000000000000) != 0)
      {
        *(_BYTE *)(v5 + 352) = self->_isCallFailed;
        *(_QWORD *)(v5 + 360) |= 0x800000000000000uLL;
        v14 = *(_QWORD *)v13;
        if ((*(_QWORD *)v13 & 0x20000000) == 0)
        {
LABEL_18:
          if ((v14 & 0x10000000000) == 0)
            goto LABEL_19;
          goto LABEL_92;
        }
      }
      else if ((v14 & 0x20000000) == 0)
      {
        goto LABEL_18;
      }
      *(float *)(v5 + 244) = self->_dlPeakThroughput;
      *(_QWORD *)(v5 + 360) |= 0x20000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x10000000000) == 0)
      {
LABEL_19:
        if ((v14 & 0x10000000) == 0)
          goto LABEL_20;
        goto LABEL_93;
      }
LABEL_92:
      *(float *)(v5 + 288) = self->_ulPeakThroughput;
      *(_QWORD *)(v5 + 360) |= 0x10000000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x10000000) == 0)
      {
LABEL_20:
        if ((v14 & 0x8000000000) == 0)
          goto LABEL_21;
        goto LABEL_94;
      }
LABEL_93:
      *(float *)(v5 + 240) = self->_dlMedThroughput;
      *(_QWORD *)(v5 + 360) |= 0x10000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x8000000000) == 0)
      {
LABEL_21:
        if ((v14 & 0x4000000000000000) == 0)
          goto LABEL_22;
        goto LABEL_95;
      }
LABEL_94:
      *(float *)(v5 + 284) = self->_ulMedThroughput;
      *(_QWORD *)(v5 + 360) |= 0x8000000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x4000000000000000) == 0)
      {
LABEL_22:
        if ((v14 & 0x2000000000000000) == 0)
          goto LABEL_23;
        goto LABEL_96;
      }
LABEL_95:
      *(_BYTE *)(v5 + 355) = self->_lowInternetUL;
      *(_QWORD *)(v5 + 360) |= 0x4000000000000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x2000000000000000) == 0)
      {
LABEL_23:
        if ((v14 & 0x800000000) == 0)
          goto LABEL_24;
        goto LABEL_97;
      }
LABEL_96:
      *(_BYTE *)(v5 + 354) = self->_lowInternetDL;
      *(_QWORD *)(v5 + 360) |= 0x2000000000000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x800000000) == 0)
      {
LABEL_24:
        if ((v14 & 8) == 0)
          goto LABEL_25;
        goto LABEL_98;
      }
LABEL_97:
      *(_DWORD *)(v5 + 268) = self->_latency;
      *(_QWORD *)(v5 + 360) |= 0x800000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 8) == 0)
      {
LABEL_25:
        if ((v14 & 0x8000000000000) == 0)
          goto LABEL_26;
        goto LABEL_99;
      }
LABEL_98:
      *(_QWORD *)(v5 + 120) = self->_wifiRssi;
      *(_QWORD *)(v5 + 360) |= 8uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x8000000000000) == 0)
      {
LABEL_26:
        if ((v14 & 0x10) == 0)
          goto LABEL_27;
        goto LABEL_100;
      }
LABEL_99:
      *(_DWORD *)(v5 + 332) = self->_wifiTxPER;
      *(_QWORD *)(v5 + 360) |= 0x8000000000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x10) == 0)
      {
LABEL_27:
        if ((v14 & 0x8000000000000000) == 0)
          goto LABEL_28;
        goto LABEL_101;
      }
LABEL_100:
      *(_QWORD *)(v5 + 128) = self->_wifiSNR;
      *(_QWORD *)(v5 + 360) |= 0x10uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x8000000000000000) == 0)
      {
LABEL_28:
        if ((v14 & 0x2000000000000) == 0)
          goto LABEL_29;
        goto LABEL_102;
      }
LABEL_101:
      *(_BYTE *)(v5 + 356) = self->_wifiCaptiveNetworks;
      *(_QWORD *)(v5 + 360) |= 0x8000000000000000;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x2000000000000) == 0)
      {
LABEL_29:
        if ((v14 & 0x200000000000) == 0)
          goto LABEL_30;
        goto LABEL_103;
      }
LABEL_102:
      *(_DWORD *)(v5 + 324) = self->_wifiRxRetry;
      *(_QWORD *)(v5 + 360) |= 0x2000000000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x200000000000) == 0)
      {
LABEL_30:
        if ((v14 & 0x10000000000000) == 0)
          goto LABEL_31;
        goto LABEL_104;
      }
LABEL_103:
      *(_DWORD *)(v5 + 308) = self->_wifiEstimatedBW;
      *(_QWORD *)(v5 + 360) |= 0x200000000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x10000000000000) == 0)
      {
LABEL_31:
        if ((v14 & 0x1000000000000) == 0)
          goto LABEL_32;
        goto LABEL_105;
      }
LABEL_104:
      *(_DWORD *)(v5 + 336) = self->_wifiTxPhyRate;
      *(_QWORD *)(v5 + 360) |= 0x10000000000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x1000000000000) == 0)
      {
LABEL_32:
        if ((v14 & 0x800000000000) == 0)
          goto LABEL_33;
        goto LABEL_106;
      }
LABEL_105:
      *(_DWORD *)(v5 + 320) = self->_wifiRxPhyRate;
      *(_QWORD *)(v5 + 360) |= 0x1000000000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x800000000000) == 0)
      {
LABEL_33:
        if ((v14 & 0x40000000000) == 0)
          goto LABEL_34;
        goto LABEL_107;
      }
LABEL_106:
      *(_DWORD *)(v5 + 316) = self->_wifiQbssLoad;
      *(_QWORD *)(v5 + 360) |= 0x800000000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x40000000000) == 0)
      {
LABEL_34:
        if ((v14 & 0x4000000000000) == 0)
          goto LABEL_35;
        goto LABEL_108;
      }
LABEL_107:
      *(_DWORD *)(v5 + 296) = self->_wifiCca;
      *(_QWORD *)(v5 + 360) |= 0x40000000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x4000000000000) == 0)
      {
LABEL_35:
        if ((v14 & 0x20000000000) == 0)
          goto LABEL_36;
        goto LABEL_109;
      }
LABEL_108:
      *(_DWORD *)(v5 + 328) = self->_wifiStationCount;
      *(_QWORD *)(v5 + 360) |= 0x4000000000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x20000000000) == 0)
      {
LABEL_36:
        if ((v14 & 0x100000000000) == 0)
          goto LABEL_37;
        goto LABEL_110;
      }
LABEL_109:
      *(_DWORD *)(v5 + 292) = self->_wifiBand;
      *(_QWORD *)(v5 + 360) |= 0x20000000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x100000000000) == 0)
      {
LABEL_37:
        if ((v14 & 0x80000000000) == 0)
          goto LABEL_38;
        goto LABEL_111;
      }
LABEL_110:
      *(_DWORD *)(v5 + 304) = self->_wifiChannel;
      *(_QWORD *)(v5 + 360) |= 0x100000000000uLL;
      v14 = (uint64_t)self->_flags;
      if ((v14 & 0x80000000000) == 0)
      {
LABEL_38:
        if ((v14 & 0x400000000000) == 0)
          goto LABEL_40;
        goto LABEL_39;
      }
LABEL_111:
      *(_DWORD *)(v5 + 300) = self->_wifiChannelWidth;
      *(_QWORD *)(v5 + 360) |= 0x80000000000uLL;
      if ((*(_QWORD *)&self->_flags & 0x400000000000) == 0)
      {
LABEL_40:
        v15 = -[NSString copyWithZone:](self->_cellGCI, "copyWithZone:", a3);
        v16 = *(void **)(v5 + 40);
        *(_QWORD *)(v5 + 40) = v15;

        v17 = -[NSString copyWithZone:](self->_cellHomePLMN, "copyWithZone:", a3);
        v18 = *(void **)(v5 + 56);
        *(_QWORD *)(v5 + 56) = v17;

        v19 = -[NSString copyWithZone:](self->_cellHomePLMN2, "copyWithZone:", a3);
        v20 = *(void **)(v5 + 48);
        *(_QWORD *)(v5 + 48) = v19;

        v21 = -[NSString copyWithZone:](self->_cellServiceProvider, "copyWithZone:", a3);
        v22 = *(void **)(v5 + 80);
        *(_QWORD *)(v5 + 80) = v21;

        v23 = -[NSString copyWithZone:](self->_cellServiceProvider2, "copyWithZone:", a3);
        v24 = *(void **)(v5 + 72);
        *(_QWORD *)(v5 + 72) = v23;

        v25 = &self->_flags;
        v26 = (uint64_t)self->_flags;
        if ((v26 & 0x2000000) != 0)
        {
          *(_DWORD *)(v5 + 228) = self->_cellVoiceLQM;
          *(_QWORD *)(v5 + 360) |= 0x2000000uLL;
          v26 = *(_QWORD *)v25;
          if ((*(_QWORD *)v25 & 0x400000000000000) == 0)
          {
LABEL_42:
            if ((v26 & 0x8000) == 0)
              goto LABEL_43;
            goto LABEL_115;
          }
        }
        else if ((v26 & 0x400000000000000) == 0)
        {
          goto LABEL_42;
        }
        *(_BYTE *)(v5 + 351) = self->_cellNpnStatus;
        *(_QWORD *)(v5 + 360) |= 0x400000000000000uLL;
        v26 = (uint64_t)self->_flags;
        if ((v26 & 0x8000) == 0)
        {
LABEL_43:
          if ((v26 & 0x20) == 0)
            goto LABEL_44;
          goto LABEL_116;
        }
LABEL_115:
        *(_DWORD *)(v5 + 188) = self->_cellNpn;
        *(_QWORD *)(v5 + 360) |= 0x8000uLL;
        v26 = (uint64_t)self->_flags;
        if ((v26 & 0x20) == 0)
        {
LABEL_44:
          if ((v26 & 0x40) == 0)
            goto LABEL_46;
          goto LABEL_45;
        }
LABEL_116:
        *(_DWORD *)(v5 + 148) = self->_cellArfcn;
        *(_QWORD *)(v5 + 360) |= 0x20uLL;
        if ((*(_QWORD *)&self->_flags & 0x40) == 0)
        {
LABEL_46:
          v27 = -[NSString copyWithZone:](self->_cellRatType, "copyWithZone:", a3);
          v28 = *(void **)(v5 + 64);
          *(_QWORD *)(v5 + 64) = v27;

          v29 = &self->_flags;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x400) != 0)
          {
            *(_DWORD *)(v5 + 168) = self->_cellLteRSRP;
            *(_QWORD *)(v5 + 360) |= 0x400uLL;
            v30 = *(_QWORD *)v29;
            if ((*(_QWORD *)v29 & 0x1000) == 0)
            {
LABEL_48:
              if ((v30 & 0x800) == 0)
                goto LABEL_49;
              goto LABEL_120;
            }
          }
          else if ((v30 & 0x1000) == 0)
          {
            goto LABEL_48;
          }
          *(_DWORD *)(v5 + 176) = self->_cellLteSNR;
          *(_QWORD *)(v5 + 360) |= 0x1000uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x800) == 0)
          {
LABEL_49:
            if ((v30 & 0x10000) == 0)
              goto LABEL_50;
            goto LABEL_121;
          }
LABEL_120:
          *(_DWORD *)(v5 + 172) = self->_cellLteRSRQ;
          *(_QWORD *)(v5 + 360) |= 0x800uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x10000) == 0)
          {
LABEL_50:
            if ((v30 & 0x20000) == 0)
              goto LABEL_51;
            goto LABEL_122;
          }
LABEL_121:
          *(_DWORD *)(v5 + 192) = self->_cellNrRSRP;
          *(_QWORD *)(v5 + 360) |= 0x10000uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x20000) == 0)
          {
LABEL_51:
            if ((v30 & 0x40000) == 0)
              goto LABEL_52;
            goto LABEL_123;
          }
LABEL_122:
          *(_DWORD *)(v5 + 196) = self->_cellNrRSRQ;
          *(_QWORD *)(v5 + 360) |= 0x20000uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x40000) == 0)
          {
LABEL_52:
            if ((v30 & 0x100) == 0)
              goto LABEL_53;
            goto LABEL_124;
          }
LABEL_123:
          *(_DWORD *)(v5 + 200) = self->_cellNrSNR;
          *(_QWORD *)(v5 + 360) |= 0x40000uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x100) == 0)
          {
LABEL_53:
            if ((v30 & 0x400000) == 0)
              goto LABEL_54;
            goto LABEL_125;
          }
LABEL_124:
          *(_DWORD *)(v5 + 160) = self->_cellDataLQM;
          *(_QWORD *)(v5 + 360) |= 0x100uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x400000) == 0)
          {
LABEL_54:
            if ((v30 & 0x80000) == 0)
              goto LABEL_55;
            goto LABEL_126;
          }
LABEL_125:
          *(_DWORD *)(v5 + 216) = self->_cellRrcState;
          *(_QWORD *)(v5 + 360) |= 0x400000uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x80000) == 0)
          {
LABEL_55:
            if ((v30 & 0x100000) == 0)
              goto LABEL_56;
            goto LABEL_127;
          }
LABEL_126:
          *(_DWORD *)(v5 + 204) = self->_cellNsaFR1;
          *(_QWORD *)(v5 + 360) |= 0x80000uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x100000) == 0)
          {
LABEL_56:
            if ((v30 & 0x800000) == 0)
              goto LABEL_57;
            goto LABEL_128;
          }
LABEL_127:
          *(_DWORD *)(v5 + 208) = self->_cellNsaFR2;
          *(_QWORD *)(v5 + 360) |= 0x100000uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x800000) == 0)
          {
LABEL_57:
            if ((v30 & 0x1000000) == 0)
              goto LABEL_58;
            goto LABEL_129;
          }
LABEL_128:
          *(_DWORD *)(v5 + 220) = self->_cellTotalDlBW;
          *(_QWORD *)(v5 + 360) |= 0x800000uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x1000000) == 0)
          {
LABEL_58:
            if ((v30 & 0x80) == 0)
              goto LABEL_59;
            goto LABEL_130;
          }
LABEL_129:
          *(_DWORD *)(v5 + 224) = self->_cellTotalUlBW;
          *(_QWORD *)(v5 + 360) |= 0x1000000uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x80) == 0)
          {
LABEL_59:
            if ((v30 & 0x2000) == 0)
              goto LABEL_60;
            goto LABEL_131;
          }
LABEL_130:
          *(_DWORD *)(v5 + 156) = self->_cellBssLoad;
          *(_QWORD *)(v5 + 360) |= 0x80uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x2000) == 0)
          {
LABEL_60:
            if ((v30 & 0x4000) == 0)
              goto LABEL_61;
            goto LABEL_132;
          }
LABEL_131:
          *(_DWORD *)(v5 + 180) = self->_cellMaxDlCaNumConf;
          *(_QWORD *)(v5 + 360) |= 0x2000uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x4000) == 0)
          {
LABEL_61:
            if ((v30 & 0x200) == 0)
              goto LABEL_62;
            goto LABEL_133;
          }
LABEL_132:
          *(_DWORD *)(v5 + 184) = self->_cellMaxUlCaNumConf;
          *(_QWORD *)(v5 + 360) |= 0x4000uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x200) == 0)
          {
LABEL_62:
            if ((v30 & 0x200000) == 0)
              goto LABEL_63;
            goto LABEL_134;
          }
LABEL_133:
          *(_DWORD *)(v5 + 164) = self->_cellEstimatedBW;
          *(_QWORD *)(v5 + 360) |= 0x200uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x200000) == 0)
          {
LABEL_63:
            if ((v30 & 0x200000000000000) == 0)
              goto LABEL_64;
            goto LABEL_135;
          }
LABEL_134:
          *(_DWORD *)(v5 + 212) = self->_cellPMax;
          *(_QWORD *)(v5 + 360) |= 0x200000uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x200000000000000) == 0)
          {
LABEL_64:
            if ((v30 & 0x100000000000000) == 0)
              goto LABEL_65;
            goto LABEL_136;
          }
LABEL_135:
          *(_BYTE *)(v5 + 350) = self->_cellIsRoaming;
          *(_QWORD *)(v5 + 360) |= 0x200000000000000uLL;
          v30 = (uint64_t)self->_flags;
          if ((v30 & 0x100000000000000) == 0)
          {
LABEL_65:
            if ((v30 & 0x80000000000000) == 0)
              goto LABEL_67;
            goto LABEL_66;
          }
LABEL_136:
          *(_BYTE *)(v5 + 349) = self->_cellIsNoService;
          *(_QWORD *)(v5 + 360) |= 0x100000000000000uLL;
          if ((*(_QWORD *)&self->_flags & 0x80000000000000) == 0)
          {
LABEL_67:
            v31 = -[NSString copyWithZone:](self->_ftIRATRecommendation, "copyWithZone:", a3);
            v32 = *(void **)(v5 + 96);
            *(_QWORD *)(v5 + 96) = v31;

            v33 = -[NSString copyWithZone:](self->_ftIRATRecommendationReason, "copyWithZone:", a3);
            v34 = *(void **)(v5 + 88);
            *(_QWORD *)(v5 + 88) = v33;

            v35 = (uint64_t)self->_flags;
            if ((v35 & 0x200000000) != 0)
            {
              *(_DWORD *)(v5 + 260) = self->_ftFacetimePacketLoss;
              *(_QWORD *)(v5 + 360) |= 0x200000000uLL;
              v35 = (uint64_t)self->_flags;
            }
            v36 = *((_WORD *)&self->_flags + 4);
            if ((v35 & 0x100000000) != 0)
            {
              *(_DWORD *)(v5 + 256) = self->_ftFacetimeAction;
              *(_QWORD *)(v5 + 360) |= 0x100000000uLL;
              v35 = (uint64_t)self->_flags;
              v36 = *((_WORD *)&self->_flags + 4);
              if ((v35 & 0x400000000) == 0)
              {
LABEL_71:
                if ((v35 & 0x80000000) == 0)
                  goto LABEL_72;
                goto LABEL_140;
              }
            }
            else if ((v35 & 0x400000000) == 0)
            {
              goto LABEL_71;
            }
            *(_DWORD *)(v5 + 264) = self->_ftFacetimeTimeDelay;
            *(_QWORD *)(v5 + 360) |= 0x400000000uLL;
            v35 = (uint64_t)self->_flags;
            v36 = *((_WORD *)&self->_flags + 4);
            if ((v35 & 0x80000000) == 0)
            {
LABEL_72:
              if ((v36 & 1) == 0)
                goto LABEL_73;
              goto LABEL_141;
            }
LABEL_140:
            *(_DWORD *)(v5 + 252) = self->_ftCounter;
            *(_QWORD *)(v5 + 360) |= 0x80000000uLL;
            v35 = (uint64_t)self->_flags;
            v36 = *((_WORD *)&self->_flags + 4);
            if ((v36 & 1) == 0)
            {
LABEL_73:
              if ((v36 & 4) == 0)
                goto LABEL_74;
              goto LABEL_142;
            }
LABEL_141:
            *(_BYTE *)(v5 + 357) = self->_wrmAlertedMode;
            *(_WORD *)(v5 + 368) |= 1u;
            v35 = (uint64_t)self->_flags;
            v36 = *((_WORD *)&self->_flags + 4);
            if ((v36 & 4) == 0)
            {
LABEL_74:
              if ((v36 & 2) == 0)
                goto LABEL_75;
              goto LABEL_143;
            }
LABEL_142:
            *(_BYTE *)(v5 + 359) = self->_wrmIsStallDetected;
            *(_WORD *)(v5 + 368) |= 4u;
            v35 = (uint64_t)self->_flags;
            if ((*((_WORD *)&self->_flags + 4) & 2) == 0)
            {
LABEL_75:
              if ((v35 & 0x40000000000000) == 0)
                goto LABEL_76;
              goto LABEL_144;
            }
LABEL_143:
            *(_BYTE *)(v5 + 358) = self->_wrmIsPCDetected;
            *(_WORD *)(v5 + 368) |= 2u;
            v35 = (uint64_t)self->_flags;
            if ((v35 & 0x40000000000000) == 0)
            {
LABEL_76:
              if ((v35 & 0x20000000000000) == 0)
              {
LABEL_78:
                v37 = -[GEOLocation copyWithZone:](self->_location, "copyWithZone:", a3);
                v38 = *(void **)(v5 + 104);
                *(_QWORD *)(v5 + 104) = v37;

                v39 = (id)v5;
                goto LABEL_79;
              }
LABEL_77:
              *(_DWORD *)(v5 + 340) = self->_wrmAudioErasure;
              *(_QWORD *)(v5 + 360) |= 0x20000000000000uLL;
              goto LABEL_78;
            }
LABEL_144:
            *(_DWORD *)(v5 + 344) = self->_wrmVideoErasure;
            *(_QWORD *)(v5 + 360) |= 0x40000000000000uLL;
            if ((*(_QWORD *)&self->_flags & 0x20000000000000) == 0)
              goto LABEL_78;
            goto LABEL_77;
          }
LABEL_66:
          *(_BYTE *)(v5 + 348) = self->_cellIsLimitedService;
          *(_QWORD *)(v5 + 360) |= 0x80000000000000uLL;
          goto LABEL_67;
        }
LABEL_45:
        *(_DWORD *)(v5 + 152) = self->_cellBand;
        *(_QWORD *)(v5 + 360) |= 0x40uLL;
        goto LABEL_46;
      }
LABEL_39:
      *(_DWORD *)(v5 + 312) = self->_wifiPhyMode;
      *(_QWORD *)(v5 + 360) |= 0x400000000000uLL;
      goto LABEL_40;
    }
LABEL_15:
    *(_QWORD *)(v5 + 24) = self->_bytesUlTotal;
    *(_QWORD *)(v5 + 360) |= 2uLL;
    goto LABEL_16;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*((_WORD *)&self->_flags + 4) & 0x2000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOCellConnectionQualityReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_79:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t flags;
  uint64_t v6;
  NSString *callID;
  NSString *cellGCI;
  NSString *cellHomePLMN;
  NSString *cellHomePLMN2;
  NSString *cellServiceProvider;
  NSString *cellServiceProvider2;
  uint64_t v13;
  uint64_t v14;
  NSString *cellRatType;
  NSString *ftIRATRecommendation;
  NSString *ftIRATRecommendationReason;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  GEOLocation *location;
  char v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_395;
  -[GEOCellConnectionQuality readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (uint64_t)self->_flags;
  v6 = *((_QWORD *)v4 + 45);
  if ((flags & 0x4000000000) != 0)
  {
    if ((v6 & 0x4000000000) == 0 || self->_motionState != *((_DWORD *)v4 + 70))
      goto LABEL_395;
  }
  else if ((v6 & 0x4000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x2000000000) != 0)
  {
    if ((v6 & 0x2000000000) == 0 || self->_messageType != *((_DWORD *)v4 + 69))
      goto LABEL_395;
  }
  else if ((v6 & 0x2000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_connectionType != *((_DWORD *)v4 + 59))
      goto LABEL_395;
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x1000000000) != 0)
  {
    if ((v6 & 0x1000000000) == 0 || self->_messageTrigger != *((_DWORD *)v4 + 68))
      goto LABEL_395;
  }
  else if ((v6 & 0x1000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0 || self->_environment != *((_DWORD *)v4 + 62))
      goto LABEL_395;
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_timeOfDay != *((_QWORD *)v4 + 14))
      goto LABEL_395;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_connectionDuration != *((_DWORD *)v4 + 58))
      goto LABEL_395;
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x1000000000000000) != 0)
  {
    if ((v6 & 0x1000000000000000) == 0)
      goto LABEL_395;
    if (self->_isEmergency)
    {
      if (!*((_BYTE *)v4 + 353))
        goto LABEL_395;
    }
    else if (*((_BYTE *)v4 + 353))
    {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x1000000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_bytesDlTotal != *((_QWORD *)v4 + 2))
      goto LABEL_395;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_bytesUlTotal != *((_QWORD *)v4 + 3))
      goto LABEL_395;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_395;
  }
  callID = self->_callID;
  if ((unint64_t)callID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](callID, "isEqual:"))
      goto LABEL_395;
    flags = (uint64_t)self->_flags;
    v6 = *((_QWORD *)v4 + 45);
  }
  if ((flags & 0x800000000000000) != 0)
  {
    if ((v6 & 0x800000000000000) == 0)
      goto LABEL_395;
    if (self->_isCallFailed)
    {
      if (!*((_BYTE *)v4 + 352))
        goto LABEL_395;
    }
    else if (*((_BYTE *)v4 + 352))
    {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x800000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0 || self->_dlPeakThroughput != *((float *)v4 + 61))
      goto LABEL_395;
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x10000000000) != 0)
  {
    if ((v6 & 0x10000000000) == 0 || self->_ulPeakThroughput != *((float *)v4 + 72))
      goto LABEL_395;
  }
  else if ((v6 & 0x10000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_dlMedThroughput != *((float *)v4 + 60))
      goto LABEL_395;
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x8000000000) != 0)
  {
    if ((v6 & 0x8000000000) == 0 || self->_ulMedThroughput != *((float *)v4 + 71))
      goto LABEL_395;
  }
  else if ((v6 & 0x8000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x4000000000000000) != 0)
  {
    if ((v6 & 0x4000000000000000) == 0)
      goto LABEL_395;
    if (self->_lowInternetUL)
    {
      if (!*((_BYTE *)v4 + 355))
        goto LABEL_395;
    }
    else if (*((_BYTE *)v4 + 355))
    {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x4000000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x2000000000000000) != 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_395;
    if (self->_lowInternetDL)
    {
      if (!*((_BYTE *)v4 + 354))
        goto LABEL_395;
    }
    else if (*((_BYTE *)v4 + 354))
    {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x2000000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x800000000) != 0)
  {
    if ((v6 & 0x800000000) == 0 || self->_latency != *((_DWORD *)v4 + 67))
      goto LABEL_395;
  }
  else if ((v6 & 0x800000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_wifiRssi != *((_QWORD *)v4 + 15))
      goto LABEL_395;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x8000000000000) != 0)
  {
    if ((v6 & 0x8000000000000) == 0 || self->_wifiTxPER != *((_DWORD *)v4 + 83))
      goto LABEL_395;
  }
  else if ((v6 & 0x8000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_wifiSNR != *((_QWORD *)v4 + 16))
      goto LABEL_395;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_395;
  }
  if (flags < 0)
  {
    if ((v6 & 0x8000000000000000) == 0)
      goto LABEL_395;
    if (self->_wifiCaptiveNetworks)
    {
      if (!*((_BYTE *)v4 + 356))
        goto LABEL_395;
    }
    else if (*((_BYTE *)v4 + 356))
    {
      goto LABEL_395;
    }
  }
  else if (v6 < 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x2000000000000) != 0)
  {
    if ((v6 & 0x2000000000000) == 0 || self->_wifiRxRetry != *((_DWORD *)v4 + 81))
      goto LABEL_395;
  }
  else if ((v6 & 0x2000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x200000000000) != 0)
  {
    if ((v6 & 0x200000000000) == 0 || self->_wifiEstimatedBW != *((_DWORD *)v4 + 77))
      goto LABEL_395;
  }
  else if ((v6 & 0x200000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x10000000000000) != 0)
  {
    if ((v6 & 0x10000000000000) == 0 || self->_wifiTxPhyRate != *((_DWORD *)v4 + 84))
      goto LABEL_395;
  }
  else if ((v6 & 0x10000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x1000000000000) != 0)
  {
    if ((v6 & 0x1000000000000) == 0 || self->_wifiRxPhyRate != *((_DWORD *)v4 + 80))
      goto LABEL_395;
  }
  else if ((v6 & 0x1000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x800000000000) != 0)
  {
    if ((v6 & 0x800000000000) == 0 || self->_wifiQbssLoad != *((_DWORD *)v4 + 79))
      goto LABEL_395;
  }
  else if ((v6 & 0x800000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x40000000000) != 0)
  {
    if ((v6 & 0x40000000000) == 0 || self->_wifiCca != *((_DWORD *)v4 + 74))
      goto LABEL_395;
  }
  else if ((v6 & 0x40000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x4000000000000) != 0)
  {
    if ((v6 & 0x4000000000000) == 0 || self->_wifiStationCount != *((_DWORD *)v4 + 82))
      goto LABEL_395;
  }
  else if ((v6 & 0x4000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x20000000000) != 0)
  {
    if ((v6 & 0x20000000000) == 0 || self->_wifiBand != *((_DWORD *)v4 + 73))
      goto LABEL_395;
  }
  else if ((v6 & 0x20000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x100000000000) != 0)
  {
    if ((v6 & 0x100000000000) == 0 || self->_wifiChannel != *((_DWORD *)v4 + 76))
      goto LABEL_395;
  }
  else if ((v6 & 0x100000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x80000000000) != 0)
  {
    if ((v6 & 0x80000000000) == 0 || self->_wifiChannelWidth != *((_DWORD *)v4 + 75))
      goto LABEL_395;
  }
  else if ((v6 & 0x80000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x400000000000) != 0)
  {
    if ((v6 & 0x400000000000) == 0 || self->_wifiPhyMode != *((_DWORD *)v4 + 78))
      goto LABEL_395;
  }
  else if ((v6 & 0x400000000000) != 0)
  {
    goto LABEL_395;
  }
  cellGCI = self->_cellGCI;
  if ((unint64_t)cellGCI | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](cellGCI, "isEqual:"))
    goto LABEL_395;
  cellHomePLMN = self->_cellHomePLMN;
  if ((unint64_t)cellHomePLMN | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](cellHomePLMN, "isEqual:"))
      goto LABEL_395;
  }
  cellHomePLMN2 = self->_cellHomePLMN2;
  if ((unint64_t)cellHomePLMN2 | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](cellHomePLMN2, "isEqual:"))
      goto LABEL_395;
  }
  cellServiceProvider = self->_cellServiceProvider;
  if ((unint64_t)cellServiceProvider | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](cellServiceProvider, "isEqual:"))
      goto LABEL_395;
  }
  cellServiceProvider2 = self->_cellServiceProvider2;
  if ((unint64_t)cellServiceProvider2 | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](cellServiceProvider2, "isEqual:"))
      goto LABEL_395;
  }
  v13 = (uint64_t)self->_flags;
  v14 = *((_QWORD *)v4 + 45);
  if ((v13 & 0x2000000) != 0)
  {
    if ((v14 & 0x2000000) == 0 || self->_cellVoiceLQM != *((_DWORD *)v4 + 57))
      goto LABEL_395;
  }
  else if ((v14 & 0x2000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x400000000000000) != 0)
  {
    if ((v14 & 0x400000000000000) == 0)
      goto LABEL_395;
    if (self->_cellNpnStatus)
    {
      if (!*((_BYTE *)v4 + 351))
        goto LABEL_395;
    }
    else if (*((_BYTE *)v4 + 351))
    {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x400000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x8000) != 0)
  {
    if ((v14 & 0x8000) == 0 || self->_cellNpn != *((_DWORD *)v4 + 47))
      goto LABEL_395;
  }
  else if ((v14 & 0x8000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x20) != 0)
  {
    if ((v14 & 0x20) == 0 || self->_cellArfcn != *((_DWORD *)v4 + 37))
      goto LABEL_395;
  }
  else if ((v14 & 0x20) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0 || self->_cellBand != *((_DWORD *)v4 + 38))
      goto LABEL_395;
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_395;
  }
  cellRatType = self->_cellRatType;
  if ((unint64_t)cellRatType | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](cellRatType, "isEqual:"))
      goto LABEL_395;
    v13 = (uint64_t)self->_flags;
    v14 = *((_QWORD *)v4 + 45);
  }
  if ((v13 & 0x400) != 0)
  {
    if ((v14 & 0x400) == 0 || self->_cellLteRSRP != *((_DWORD *)v4 + 42))
      goto LABEL_395;
  }
  else if ((v14 & 0x400) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x1000) != 0)
  {
    if ((v14 & 0x1000) == 0 || self->_cellLteSNR != *((_DWORD *)v4 + 44))
      goto LABEL_395;
  }
  else if ((v14 & 0x1000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x800) != 0)
  {
    if ((v14 & 0x800) == 0 || self->_cellLteRSRQ != *((_DWORD *)v4 + 43))
      goto LABEL_395;
  }
  else if ((v14 & 0x800) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x10000) != 0)
  {
    if ((v14 & 0x10000) == 0 || self->_cellNrRSRP != *((_DWORD *)v4 + 48))
      goto LABEL_395;
  }
  else if ((v14 & 0x10000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x20000) != 0)
  {
    if ((v14 & 0x20000) == 0 || self->_cellNrRSRQ != *((_DWORD *)v4 + 49))
      goto LABEL_395;
  }
  else if ((v14 & 0x20000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x40000) != 0)
  {
    if ((v14 & 0x40000) == 0 || self->_cellNrSNR != *((_DWORD *)v4 + 50))
      goto LABEL_395;
  }
  else if ((v14 & 0x40000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x100) != 0)
  {
    if ((v14 & 0x100) == 0 || self->_cellDataLQM != *((_DWORD *)v4 + 40))
      goto LABEL_395;
  }
  else if ((v14 & 0x100) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x400000) != 0)
  {
    if ((v14 & 0x400000) == 0 || self->_cellRrcState != *((_DWORD *)v4 + 54))
      goto LABEL_395;
  }
  else if ((v14 & 0x400000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x80000) != 0)
  {
    if ((v14 & 0x80000) == 0 || self->_cellNsaFR1 != *((_DWORD *)v4 + 51))
      goto LABEL_395;
  }
  else if ((v14 & 0x80000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x100000) != 0)
  {
    if ((v14 & 0x100000) == 0 || self->_cellNsaFR2 != *((_DWORD *)v4 + 52))
      goto LABEL_395;
  }
  else if ((v14 & 0x100000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x800000) != 0)
  {
    if ((v14 & 0x800000) == 0 || self->_cellTotalDlBW != *((_DWORD *)v4 + 55))
      goto LABEL_395;
  }
  else if ((v14 & 0x800000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x1000000) != 0)
  {
    if ((v14 & 0x1000000) == 0 || self->_cellTotalUlBW != *((_DWORD *)v4 + 56))
      goto LABEL_395;
  }
  else if ((v14 & 0x1000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x80) != 0)
  {
    if ((v14 & 0x80) == 0 || self->_cellBssLoad != *((_DWORD *)v4 + 39))
      goto LABEL_395;
  }
  else if ((v14 & 0x80) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x2000) != 0)
  {
    if ((v14 & 0x2000) == 0 || self->_cellMaxDlCaNumConf != *((_DWORD *)v4 + 45))
      goto LABEL_395;
  }
  else if ((v14 & 0x2000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x4000) != 0)
  {
    if ((v14 & 0x4000) == 0 || self->_cellMaxUlCaNumConf != *((_DWORD *)v4 + 46))
      goto LABEL_395;
  }
  else if ((v14 & 0x4000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x200) != 0)
  {
    if ((v14 & 0x200) == 0 || self->_cellEstimatedBW != *((_DWORD *)v4 + 41))
      goto LABEL_395;
  }
  else if ((v14 & 0x200) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x200000) != 0)
  {
    if ((v14 & 0x200000) == 0 || self->_cellPMax != *((_DWORD *)v4 + 53))
      goto LABEL_395;
  }
  else if ((v14 & 0x200000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x200000000000000) != 0)
  {
    if ((v14 & 0x200000000000000) == 0)
      goto LABEL_395;
    if (self->_cellIsRoaming)
    {
      if (!*((_BYTE *)v4 + 350))
        goto LABEL_395;
    }
    else if (*((_BYTE *)v4 + 350))
    {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x200000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x100000000000000) != 0)
  {
    if ((v14 & 0x100000000000000) == 0)
      goto LABEL_395;
    if (self->_cellIsNoService)
    {
      if (!*((_BYTE *)v4 + 349))
        goto LABEL_395;
    }
    else if (*((_BYTE *)v4 + 349))
    {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x100000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x80000000000000) != 0)
  {
    if ((v14 & 0x80000000000000) == 0)
      goto LABEL_395;
    if (self->_cellIsLimitedService)
    {
      if (!*((_BYTE *)v4 + 348))
        goto LABEL_395;
    }
    else if (*((_BYTE *)v4 + 348))
    {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x80000000000000) != 0)
  {
    goto LABEL_395;
  }
  ftIRATRecommendation = self->_ftIRATRecommendation;
  if ((unint64_t)ftIRATRecommendation | *((_QWORD *)v4 + 12)
    && !-[NSString isEqual:](ftIRATRecommendation, "isEqual:"))
  {
    goto LABEL_395;
  }
  ftIRATRecommendationReason = self->_ftIRATRecommendationReason;
  if ((unint64_t)ftIRATRecommendationReason | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](ftIRATRecommendationReason, "isEqual:"))
      goto LABEL_395;
  }
  v18 = (uint64_t)self->_flags;
  v19 = *((_WORD *)&self->_flags + 4);
  v20 = *((_QWORD *)v4 + 45);
  v21 = *((_WORD *)v4 + 184);
  if ((v18 & 0x200000000) != 0)
  {
    if ((v20 & 0x200000000) == 0 || self->_ftFacetimePacketLoss != *((_DWORD *)v4 + 65))
      goto LABEL_395;
  }
  else if ((v20 & 0x200000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v18 & 0x100000000) != 0)
  {
    if ((v20 & 0x100000000) == 0 || self->_ftFacetimeAction != *((_DWORD *)v4 + 64))
      goto LABEL_395;
  }
  else if ((v20 & 0x100000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v18 & 0x400000000) != 0)
  {
    if ((v20 & 0x400000000) == 0 || self->_ftFacetimeTimeDelay != *((_DWORD *)v4 + 66))
      goto LABEL_395;
  }
  else if ((v20 & 0x400000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v18 & 0x80000000) != 0)
  {
    if ((v20 & 0x80000000) == 0 || self->_ftCounter != *((_DWORD *)v4 + 63))
      goto LABEL_395;
  }
  else if ((v20 & 0x80000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v19 & 1) != 0)
  {
    if ((v21 & 1) == 0)
      goto LABEL_395;
    if (self->_wrmAlertedMode)
    {
      if (!*((_BYTE *)v4 + 357))
        goto LABEL_395;
    }
    else if (*((_BYTE *)v4 + 357))
    {
      goto LABEL_395;
    }
  }
  else if ((v21 & 1) != 0)
  {
    goto LABEL_395;
  }
  if ((v19 & 4) != 0)
  {
    if ((v21 & 4) == 0)
      goto LABEL_395;
    if (self->_wrmIsStallDetected)
    {
      if (!*((_BYTE *)v4 + 359))
        goto LABEL_395;
    }
    else if (*((_BYTE *)v4 + 359))
    {
      goto LABEL_395;
    }
  }
  else if ((v21 & 4) != 0)
  {
    goto LABEL_395;
  }
  if ((v19 & 2) != 0)
  {
    if ((v21 & 2) == 0)
      goto LABEL_395;
    if (self->_wrmIsPCDetected)
    {
      if (!*((_BYTE *)v4 + 358))
        goto LABEL_395;
    }
    else if (*((_BYTE *)v4 + 358))
    {
      goto LABEL_395;
    }
  }
  else if ((v21 & 2) != 0)
  {
    goto LABEL_395;
  }
  if ((v18 & 0x40000000000000) != 0)
  {
    if ((v20 & 0x40000000000000) == 0 || self->_wrmVideoErasure != *((_DWORD *)v4 + 86))
      goto LABEL_395;
  }
  else if ((v20 & 0x40000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v18 & 0x20000000000000) == 0)
  {
    if ((v20 & 0x20000000000000) == 0)
      goto LABEL_393;
LABEL_395:
    v23 = 0;
    goto LABEL_396;
  }
  if ((v20 & 0x20000000000000) == 0 || self->_wrmAudioErasure != *((_DWORD *)v4 + 85))
    goto LABEL_395;
LABEL_393:
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 13))
    v23 = -[GEOLocation isEqual:](location, "isEqual:");
  else
    v23 = 1;
LABEL_396:

  return v23;
}

- (unint64_t)hash
{
  uint64_t flags;
  uint64_t v4;
  float dlPeakThroughput;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  float ulPeakThroughput;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  float dlMedThroughput;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  float ulMedThroughput;
  double v22;
  long double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSUInteger v30;
  NSUInteger v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSUInteger v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSUInteger v67;
  NSUInteger v68;
  NSUInteger v69;
  NSUInteger v70;
  NSUInteger v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
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
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  NSUInteger v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;

  -[GEOCellConnectionQuality readAll:](self, "readAll:", 1);
  flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000000) != 0)
  {
    v103 = 2654435761 * self->_motionState;
    if ((flags & 0x2000000000) != 0)
    {
LABEL_3:
      v102 = 2654435761 * self->_messageType;
      if ((flags & 0x8000000) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v103 = 0;
    if ((flags & 0x2000000000) != 0)
      goto LABEL_3;
  }
  v102 = 0;
  if ((flags & 0x8000000) != 0)
  {
LABEL_4:
    v101 = 2654435761 * self->_connectionType;
    if ((flags & 0x1000000000) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v101 = 0;
  if ((flags & 0x1000000000) != 0)
  {
LABEL_5:
    v100 = 2654435761 * self->_messageTrigger;
    if ((flags & 0x40000000) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v100 = 0;
  if ((flags & 0x40000000) != 0)
  {
LABEL_6:
    v99 = 2654435761 * self->_environment;
    if ((flags & 4) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v99 = 0;
  if ((flags & 4) != 0)
  {
LABEL_7:
    v98 = 2654435761u * self->_timeOfDay;
    if ((flags & 0x4000000) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v98 = 0;
  if ((flags & 0x4000000) != 0)
  {
LABEL_8:
    v97 = 2654435761 * self->_connectionDuration;
    if ((flags & 0x1000000000000000) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v97 = 0;
  if ((flags & 0x1000000000000000) != 0)
  {
LABEL_9:
    v96 = 2654435761 * self->_isEmergency;
    if ((flags & 1) != 0)
      goto LABEL_10;
LABEL_20:
    v95 = 0;
    if ((flags & 2) != 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_19:
  v96 = 0;
  if ((flags & 1) == 0)
    goto LABEL_20;
LABEL_10:
  v95 = 2654435761u * self->_bytesDlTotal;
  if ((flags & 2) != 0)
  {
LABEL_11:
    v94 = 2654435761u * self->_bytesUlTotal;
    goto LABEL_22;
  }
LABEL_21:
  v94 = 0;
LABEL_22:
  v93 = -[NSString hash](self->_callID, "hash");
  v4 = (uint64_t)self->_flags;
  if ((v4 & 0x800000000000000) != 0)
  {
    v92 = 2654435761 * self->_isCallFailed;
    if ((v4 & 0x20000000) != 0)
      goto LABEL_24;
LABEL_29:
    v9 = 0;
    goto LABEL_32;
  }
  v92 = 0;
  if ((v4 & 0x20000000) == 0)
    goto LABEL_29;
LABEL_24:
  dlPeakThroughput = self->_dlPeakThroughput;
  v6 = dlPeakThroughput;
  if (dlPeakThroughput < 0.0)
    v6 = -dlPeakThroughput;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_32:
  if ((v4 & 0x10000000000) != 0)
  {
    ulPeakThroughput = self->_ulPeakThroughput;
    v12 = ulPeakThroughput;
    if (ulPeakThroughput < 0.0)
      v12 = -ulPeakThroughput;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((v4 & 0x10000000) != 0)
  {
    dlMedThroughput = self->_dlMedThroughput;
    v17 = dlMedThroughput;
    if (dlMedThroughput < 0.0)
      v17 = -dlMedThroughput;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  if ((v4 & 0x8000000000) != 0)
  {
    ulMedThroughput = self->_ulMedThroughput;
    v22 = ulMedThroughput;
    if (ulMedThroughput < 0.0)
      v22 = -ulMedThroughput;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  if ((v4 & 0x4000000000000000) != 0)
  {
    v89 = 2654435761 * self->_lowInternetUL;
    if ((v4 & 0x2000000000000000) != 0)
    {
LABEL_58:
      v88 = 2654435761 * self->_lowInternetDL;
      if ((v4 & 0x800000000) != 0)
        goto LABEL_59;
      goto LABEL_76;
    }
  }
  else
  {
    v89 = 0;
    if ((v4 & 0x2000000000000000) != 0)
      goto LABEL_58;
  }
  v88 = 0;
  if ((v4 & 0x800000000) != 0)
  {
LABEL_59:
    v87 = 2654435761 * self->_latency;
    if ((v4 & 8) != 0)
      goto LABEL_60;
    goto LABEL_77;
  }
LABEL_76:
  v87 = 0;
  if ((v4 & 8) != 0)
  {
LABEL_60:
    v86 = 2654435761 * self->_wifiRssi;
    if ((v4 & 0x8000000000000) != 0)
      goto LABEL_61;
    goto LABEL_78;
  }
LABEL_77:
  v86 = 0;
  if ((v4 & 0x8000000000000) != 0)
  {
LABEL_61:
    v85 = 2654435761 * self->_wifiTxPER;
    if ((v4 & 0x10) != 0)
      goto LABEL_62;
    goto LABEL_79;
  }
LABEL_78:
  v85 = 0;
  if ((v4 & 0x10) != 0)
  {
LABEL_62:
    v84 = 2654435761 * self->_wifiSNR;
    if (v4 < 0)
      goto LABEL_63;
    goto LABEL_80;
  }
LABEL_79:
  v84 = 0;
  if (v4 < 0)
  {
LABEL_63:
    v83 = 2654435761 * self->_wifiCaptiveNetworks;
    if ((v4 & 0x2000000000000) != 0)
      goto LABEL_64;
    goto LABEL_81;
  }
LABEL_80:
  v83 = 0;
  if ((v4 & 0x2000000000000) != 0)
  {
LABEL_64:
    v82 = 2654435761 * self->_wifiRxRetry;
    if ((v4 & 0x200000000000) != 0)
      goto LABEL_65;
    goto LABEL_82;
  }
LABEL_81:
  v82 = 0;
  if ((v4 & 0x200000000000) != 0)
  {
LABEL_65:
    v81 = 2654435761 * self->_wifiEstimatedBW;
    if ((v4 & 0x10000000000000) != 0)
      goto LABEL_66;
    goto LABEL_83;
  }
LABEL_82:
  v81 = 0;
  if ((v4 & 0x10000000000000) != 0)
  {
LABEL_66:
    v80 = 2654435761 * self->_wifiTxPhyRate;
    if ((v4 & 0x1000000000000) != 0)
      goto LABEL_67;
    goto LABEL_84;
  }
LABEL_83:
  v80 = 0;
  if ((v4 & 0x1000000000000) != 0)
  {
LABEL_67:
    v79 = 2654435761 * self->_wifiRxPhyRate;
    if ((v4 & 0x800000000000) != 0)
      goto LABEL_68;
    goto LABEL_85;
  }
LABEL_84:
  v79 = 0;
  if ((v4 & 0x800000000000) != 0)
  {
LABEL_68:
    v78 = 2654435761 * self->_wifiQbssLoad;
    if ((v4 & 0x40000000000) != 0)
      goto LABEL_69;
    goto LABEL_86;
  }
LABEL_85:
  v78 = 0;
  if ((v4 & 0x40000000000) != 0)
  {
LABEL_69:
    v77 = 2654435761 * self->_wifiCca;
    if ((v4 & 0x4000000000000) != 0)
      goto LABEL_70;
    goto LABEL_87;
  }
LABEL_86:
  v77 = 0;
  if ((v4 & 0x4000000000000) != 0)
  {
LABEL_70:
    v76 = 2654435761 * self->_wifiStationCount;
    if ((v4 & 0x20000000000) != 0)
      goto LABEL_71;
    goto LABEL_88;
  }
LABEL_87:
  v76 = 0;
  if ((v4 & 0x20000000000) != 0)
  {
LABEL_71:
    v75 = 2654435761 * self->_wifiBand;
    if ((v4 & 0x100000000000) != 0)
      goto LABEL_72;
LABEL_89:
    v74 = 0;
    if ((v4 & 0x80000000000) != 0)
      goto LABEL_73;
    goto LABEL_90;
  }
LABEL_88:
  v75 = 0;
  if ((v4 & 0x100000000000) == 0)
    goto LABEL_89;
LABEL_72:
  v74 = 2654435761 * self->_wifiChannel;
  if ((v4 & 0x80000000000) != 0)
  {
LABEL_73:
    v73 = 2654435761 * self->_wifiChannelWidth;
    goto LABEL_91;
  }
LABEL_90:
  v73 = 0;
LABEL_91:
  v90 = v20;
  v91 = v9;
  if ((v4 & 0x400000000000) != 0)
    v72 = 2654435761 * self->_wifiPhyMode;
  else
    v72 = 0;
  v71 = -[NSString hash](self->_cellGCI, "hash");
  v70 = -[NSString hash](self->_cellHomePLMN, "hash");
  v69 = -[NSString hash](self->_cellHomePLMN2, "hash");
  v68 = -[NSString hash](self->_cellServiceProvider, "hash");
  v67 = -[NSString hash](self->_cellServiceProvider2, "hash");
  v25 = (uint64_t)self->_flags;
  if ((v25 & 0x2000000) != 0)
  {
    v66 = 2654435761 * self->_cellVoiceLQM;
    if ((v25 & 0x400000000000000) != 0)
    {
LABEL_96:
      v65 = 2654435761 * self->_cellNpnStatus;
      if ((v25 & 0x8000) != 0)
        goto LABEL_97;
      goto LABEL_102;
    }
  }
  else
  {
    v66 = 0;
    if ((v25 & 0x400000000000000) != 0)
      goto LABEL_96;
  }
  v65 = 0;
  if ((v25 & 0x8000) != 0)
  {
LABEL_97:
    v64 = 2654435761 * self->_cellNpn;
    if ((v25 & 0x20) != 0)
      goto LABEL_98;
LABEL_103:
    v63 = 0;
    if ((v25 & 0x40) != 0)
      goto LABEL_99;
    goto LABEL_104;
  }
LABEL_102:
  v64 = 0;
  if ((v25 & 0x20) == 0)
    goto LABEL_103;
LABEL_98:
  v63 = 2654435761 * self->_cellArfcn;
  if ((v25 & 0x40) != 0)
  {
LABEL_99:
    v62 = 2654435761 * self->_cellBand;
    goto LABEL_105;
  }
LABEL_104:
  v62 = 0;
LABEL_105:
  v61 = -[NSString hash](self->_cellRatType, "hash");
  v26 = (uint64_t)self->_flags;
  if ((v26 & 0x400) != 0)
  {
    v60 = 2654435761 * self->_cellLteRSRP;
    if ((v26 & 0x1000) != 0)
    {
LABEL_107:
      v59 = 2654435761 * self->_cellLteSNR;
      if ((v26 & 0x800) != 0)
        goto LABEL_108;
      goto LABEL_127;
    }
  }
  else
  {
    v60 = 0;
    if ((v26 & 0x1000) != 0)
      goto LABEL_107;
  }
  v59 = 0;
  if ((v26 & 0x800) != 0)
  {
LABEL_108:
    v58 = 2654435761 * self->_cellLteRSRQ;
    if ((v26 & 0x10000) != 0)
      goto LABEL_109;
    goto LABEL_128;
  }
LABEL_127:
  v58 = 0;
  if ((v26 & 0x10000) != 0)
  {
LABEL_109:
    v57 = 2654435761 * self->_cellNrRSRP;
    if ((v26 & 0x20000) != 0)
      goto LABEL_110;
    goto LABEL_129;
  }
LABEL_128:
  v57 = 0;
  if ((v26 & 0x20000) != 0)
  {
LABEL_110:
    v56 = 2654435761 * self->_cellNrRSRQ;
    if ((v26 & 0x40000) != 0)
      goto LABEL_111;
    goto LABEL_130;
  }
LABEL_129:
  v56 = 0;
  if ((v26 & 0x40000) != 0)
  {
LABEL_111:
    v55 = 2654435761 * self->_cellNrSNR;
    if ((v26 & 0x100) != 0)
      goto LABEL_112;
    goto LABEL_131;
  }
LABEL_130:
  v55 = 0;
  if ((v26 & 0x100) != 0)
  {
LABEL_112:
    v54 = 2654435761 * self->_cellDataLQM;
    if ((v26 & 0x400000) != 0)
      goto LABEL_113;
    goto LABEL_132;
  }
LABEL_131:
  v54 = 0;
  if ((v26 & 0x400000) != 0)
  {
LABEL_113:
    v53 = 2654435761 * self->_cellRrcState;
    if ((v26 & 0x80000) != 0)
      goto LABEL_114;
    goto LABEL_133;
  }
LABEL_132:
  v53 = 0;
  if ((v26 & 0x80000) != 0)
  {
LABEL_114:
    v52 = 2654435761 * self->_cellNsaFR1;
    if ((v26 & 0x100000) != 0)
      goto LABEL_115;
    goto LABEL_134;
  }
LABEL_133:
  v52 = 0;
  if ((v26 & 0x100000) != 0)
  {
LABEL_115:
    v51 = 2654435761 * self->_cellNsaFR2;
    if ((v26 & 0x800000) != 0)
      goto LABEL_116;
    goto LABEL_135;
  }
LABEL_134:
  v51 = 0;
  if ((v26 & 0x800000) != 0)
  {
LABEL_116:
    v50 = 2654435761 * self->_cellTotalDlBW;
    if ((v26 & 0x1000000) != 0)
      goto LABEL_117;
    goto LABEL_136;
  }
LABEL_135:
  v50 = 0;
  if ((v26 & 0x1000000) != 0)
  {
LABEL_117:
    v49 = 2654435761 * self->_cellTotalUlBW;
    if ((v26 & 0x80) != 0)
      goto LABEL_118;
    goto LABEL_137;
  }
LABEL_136:
  v49 = 0;
  if ((v26 & 0x80) != 0)
  {
LABEL_118:
    v48 = 2654435761 * self->_cellBssLoad;
    if ((v26 & 0x2000) != 0)
      goto LABEL_119;
    goto LABEL_138;
  }
LABEL_137:
  v48 = 0;
  if ((v26 & 0x2000) != 0)
  {
LABEL_119:
    v47 = 2654435761 * self->_cellMaxDlCaNumConf;
    if ((v26 & 0x4000) != 0)
      goto LABEL_120;
    goto LABEL_139;
  }
LABEL_138:
  v47 = 0;
  if ((v26 & 0x4000) != 0)
  {
LABEL_120:
    v46 = 2654435761 * self->_cellMaxUlCaNumConf;
    if ((v26 & 0x200) != 0)
      goto LABEL_121;
    goto LABEL_140;
  }
LABEL_139:
  v46 = 0;
  if ((v26 & 0x200) != 0)
  {
LABEL_121:
    v45 = 2654435761 * self->_cellEstimatedBW;
    if ((v26 & 0x200000) != 0)
      goto LABEL_122;
    goto LABEL_141;
  }
LABEL_140:
  v45 = 0;
  if ((v26 & 0x200000) != 0)
  {
LABEL_122:
    v44 = 2654435761 * self->_cellPMax;
    if ((v26 & 0x200000000000000) != 0)
      goto LABEL_123;
LABEL_142:
    v27 = 0;
    if ((v26 & 0x100000000000000) != 0)
      goto LABEL_124;
    goto LABEL_143;
  }
LABEL_141:
  v44 = 0;
  if ((v26 & 0x200000000000000) == 0)
    goto LABEL_142;
LABEL_123:
  v27 = 2654435761 * self->_cellIsRoaming;
  if ((v26 & 0x100000000000000) != 0)
  {
LABEL_124:
    v28 = 2654435761 * self->_cellIsNoService;
    goto LABEL_144;
  }
LABEL_143:
  v28 = 0;
LABEL_144:
  if ((v26 & 0x80000000000000) != 0)
    v29 = 2654435761 * self->_cellIsLimitedService;
  else
    v29 = 0;
  v30 = -[NSString hash](self->_ftIRATRecommendation, "hash");
  v31 = -[NSString hash](self->_ftIRATRecommendationReason, "hash");
  v32 = (uint64_t)self->_flags;
  if ((v32 & 0x200000000) != 0)
  {
    v33 = 2654435761 * self->_ftFacetimePacketLoss;
    if ((v32 & 0x100000000) != 0)
      goto LABEL_149;
  }
  else
  {
    v33 = 0;
    if ((v32 & 0x100000000) != 0)
    {
LABEL_149:
      v34 = 2654435761 * self->_ftFacetimeAction;
      goto LABEL_152;
    }
  }
  v34 = 0;
LABEL_152:
  v35 = *((_WORD *)&self->_flags + 4);
  if ((v32 & 0x400000000) != 0)
  {
    v36 = 2654435761 * self->_ftFacetimeTimeDelay;
    if ((v32 & 0x80000000) != 0)
    {
LABEL_154:
      v37 = 2654435761 * self->_ftCounter;
      if ((v35 & 1) != 0)
        goto LABEL_155;
      goto LABEL_162;
    }
  }
  else
  {
    v36 = 0;
    if ((v32 & 0x80000000) != 0)
      goto LABEL_154;
  }
  v37 = 0;
  if ((v35 & 1) != 0)
  {
LABEL_155:
    v38 = 2654435761 * self->_wrmAlertedMode;
    if ((v35 & 4) != 0)
      goto LABEL_156;
    goto LABEL_163;
  }
LABEL_162:
  v38 = 0;
  if ((v35 & 4) != 0)
  {
LABEL_156:
    v39 = 2654435761 * self->_wrmIsStallDetected;
    if ((v35 & 2) != 0)
      goto LABEL_157;
    goto LABEL_164;
  }
LABEL_163:
  v39 = 0;
  if ((v35 & 2) != 0)
  {
LABEL_157:
    v40 = 2654435761 * self->_wrmIsPCDetected;
    if ((v32 & 0x40000000000000) != 0)
      goto LABEL_158;
LABEL_165:
    v41 = 0;
    if ((v32 & 0x20000000000000) != 0)
      goto LABEL_159;
LABEL_166:
    v42 = 0;
    return v102 ^ v103 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v92 ^ v91 ^ v10 ^ v15 ^ v90 ^ v89 ^ v88 ^ v93 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v33 ^ v34 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41 ^ v42 ^ -[GEOLocation hash](self->_location, "hash");
  }
LABEL_164:
  v40 = 0;
  if ((v32 & 0x40000000000000) == 0)
    goto LABEL_165;
LABEL_158:
  v41 = 2654435761 * self->_wrmVideoErasure;
  if ((v32 & 0x20000000000000) == 0)
    goto LABEL_166;
LABEL_159:
  v42 = 2654435761 * self->_wrmAudioErasure;
  return v102 ^ v103 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v92 ^ v91 ^ v10 ^ v15 ^ v90 ^ v89 ^ v88 ^ v93 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v33 ^ v34 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41 ^ v42 ^ -[GEOLocation hash](self->_location, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;
  GEOLocation *location;
  uint64_t v16;
  char *v17;

  v17 = (char *)a3;
  objc_msgSend(v17, "readAll:", 0);
  v4 = v17;
  v5 = (uint64_t *)(v17 + 360);
  v6 = *((_QWORD *)v17 + 45);
  if ((v6 & 0x4000000000) != 0)
  {
    self->_motionState = *((_DWORD *)v17 + 70);
    *(_QWORD *)&self->_flags |= 0x4000000000uLL;
    v6 = *v5;
    if ((*v5 & 0x2000000000) == 0)
    {
LABEL_3:
      if ((v6 & 0x8000000) == 0)
        goto LABEL_4;
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x2000000000) == 0)
  {
    goto LABEL_3;
  }
  self->_messageType = *((_DWORD *)v17 + 69);
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  v6 = *((_QWORD *)v17 + 45);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_4:
    if ((v6 & 0x1000000000) == 0)
      goto LABEL_5;
    goto LABEL_98;
  }
LABEL_97:
  self->_connectionType = *((_DWORD *)v17 + 59);
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  v6 = *((_QWORD *)v17 + 45);
  if ((v6 & 0x1000000000) == 0)
  {
LABEL_5:
    if ((v6 & 0x40000000) == 0)
      goto LABEL_6;
    goto LABEL_99;
  }
LABEL_98:
  self->_messageTrigger = *((_DWORD *)v17 + 68);
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  v6 = *((_QWORD *)v17 + 45);
  if ((v6 & 0x40000000) == 0)
  {
LABEL_6:
    if ((v6 & 4) == 0)
      goto LABEL_7;
    goto LABEL_100;
  }
LABEL_99:
  self->_environment = *((_DWORD *)v17 + 62);
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  v6 = *((_QWORD *)v17 + 45);
  if ((v6 & 4) == 0)
  {
LABEL_7:
    if ((v6 & 0x4000000) == 0)
      goto LABEL_8;
    goto LABEL_101;
  }
LABEL_100:
  self->_timeOfDay = *((_QWORD *)v17 + 14);
  *(_QWORD *)&self->_flags |= 4uLL;
  v6 = *((_QWORD *)v17 + 45);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_8:
    if ((v6 & 0x1000000000000000) == 0)
      goto LABEL_9;
    goto LABEL_102;
  }
LABEL_101:
  self->_connectionDuration = *((_DWORD *)v17 + 58);
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  v6 = *((_QWORD *)v17 + 45);
  if ((v6 & 0x1000000000000000) == 0)
  {
LABEL_9:
    if ((v6 & 1) == 0)
      goto LABEL_10;
    goto LABEL_103;
  }
LABEL_102:
  self->_isEmergency = v17[353];
  *(_QWORD *)&self->_flags |= 0x1000000000000000uLL;
  v6 = *((_QWORD *)v17 + 45);
  if ((v6 & 1) == 0)
  {
LABEL_10:
    if ((v6 & 2) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_103:
  self->_bytesDlTotal = *((_QWORD *)v17 + 2);
  *(_QWORD *)&self->_flags |= 1uLL;
  if ((*((_QWORD *)v17 + 45) & 2) != 0)
  {
LABEL_11:
    self->_bytesUlTotal = *((_QWORD *)v17 + 3);
    *(_QWORD *)&self->_flags |= 2uLL;
  }
LABEL_12:
  if (*((_QWORD *)v17 + 4))
  {
    -[GEOCellConnectionQuality setCallID:](self, "setCallID:");
    v4 = v17;
  }
  v7 = (uint64_t *)(v4 + 360);
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x800000000000000) != 0)
  {
    self->_isCallFailed = v4[352];
    *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
    v8 = *v7;
    if ((*v7 & 0x20000000) == 0)
    {
LABEL_16:
      if ((v8 & 0x10000000000) == 0)
        goto LABEL_17;
      goto LABEL_107;
    }
  }
  else if ((v8 & 0x20000000) == 0)
  {
    goto LABEL_16;
  }
  self->_dlPeakThroughput = *((float *)v4 + 61);
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x10000000000) == 0)
  {
LABEL_17:
    if ((v8 & 0x10000000) == 0)
      goto LABEL_18;
    goto LABEL_108;
  }
LABEL_107:
  self->_ulPeakThroughput = *((float *)v4 + 72);
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x10000000) == 0)
  {
LABEL_18:
    if ((v8 & 0x8000000000) == 0)
      goto LABEL_19;
    goto LABEL_109;
  }
LABEL_108:
  self->_dlMedThroughput = *((float *)v4 + 60);
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x8000000000) == 0)
  {
LABEL_19:
    if ((v8 & 0x4000000000000000) == 0)
      goto LABEL_20;
    goto LABEL_110;
  }
LABEL_109:
  self->_ulMedThroughput = *((float *)v4 + 71);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x4000000000000000) == 0)
  {
LABEL_20:
    if ((v8 & 0x2000000000000000) == 0)
      goto LABEL_21;
    goto LABEL_111;
  }
LABEL_110:
  self->_lowInternetUL = v4[355];
  *(_QWORD *)&self->_flags |= 0x4000000000000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x2000000000000000) == 0)
  {
LABEL_21:
    if ((v8 & 0x800000000) == 0)
      goto LABEL_22;
    goto LABEL_112;
  }
LABEL_111:
  self->_lowInternetDL = v4[354];
  *(_QWORD *)&self->_flags |= 0x2000000000000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x800000000) == 0)
  {
LABEL_22:
    if ((v8 & 8) == 0)
      goto LABEL_23;
    goto LABEL_113;
  }
LABEL_112:
  self->_latency = *((_DWORD *)v4 + 67);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 8) == 0)
  {
LABEL_23:
    if ((v8 & 0x8000000000000) == 0)
      goto LABEL_24;
    goto LABEL_114;
  }
LABEL_113:
  self->_wifiRssi = *((_QWORD *)v4 + 15);
  *(_QWORD *)&self->_flags |= 8uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x8000000000000) == 0)
  {
LABEL_24:
    if ((v8 & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_115;
  }
LABEL_114:
  self->_wifiTxPER = *((_DWORD *)v4 + 83);
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x10) == 0)
  {
LABEL_25:
    if ((v8 & 0x8000000000000000) == 0)
      goto LABEL_26;
    goto LABEL_116;
  }
LABEL_115:
  self->_wifiSNR = *((_QWORD *)v4 + 16);
  *(_QWORD *)&self->_flags |= 0x10uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x8000000000000000) == 0)
  {
LABEL_26:
    if ((v8 & 0x2000000000000) == 0)
      goto LABEL_27;
    goto LABEL_117;
  }
LABEL_116:
  self->_wifiCaptiveNetworks = v4[356];
  *(_QWORD *)&self->_flags |= 0x8000000000000000;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x2000000000000) == 0)
  {
LABEL_27:
    if ((v8 & 0x200000000000) == 0)
      goto LABEL_28;
    goto LABEL_118;
  }
LABEL_117:
  self->_wifiRxRetry = *((_DWORD *)v4 + 81);
  *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x200000000000) == 0)
  {
LABEL_28:
    if ((v8 & 0x10000000000000) == 0)
      goto LABEL_29;
    goto LABEL_119;
  }
LABEL_118:
  self->_wifiEstimatedBW = *((_DWORD *)v4 + 77);
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x10000000000000) == 0)
  {
LABEL_29:
    if ((v8 & 0x1000000000000) == 0)
      goto LABEL_30;
    goto LABEL_120;
  }
LABEL_119:
  self->_wifiTxPhyRate = *((_DWORD *)v4 + 84);
  *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x1000000000000) == 0)
  {
LABEL_30:
    if ((v8 & 0x800000000000) == 0)
      goto LABEL_31;
    goto LABEL_121;
  }
LABEL_120:
  self->_wifiRxPhyRate = *((_DWORD *)v4 + 80);
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x800000000000) == 0)
  {
LABEL_31:
    if ((v8 & 0x40000000000) == 0)
      goto LABEL_32;
    goto LABEL_122;
  }
LABEL_121:
  self->_wifiQbssLoad = *((_DWORD *)v4 + 79);
  *(_QWORD *)&self->_flags |= 0x800000000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x40000000000) == 0)
  {
LABEL_32:
    if ((v8 & 0x4000000000000) == 0)
      goto LABEL_33;
    goto LABEL_123;
  }
LABEL_122:
  self->_wifiCca = *((_DWORD *)v4 + 74);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x4000000000000) == 0)
  {
LABEL_33:
    if ((v8 & 0x20000000000) == 0)
      goto LABEL_34;
    goto LABEL_124;
  }
LABEL_123:
  self->_wifiStationCount = *((_DWORD *)v4 + 82);
  *(_QWORD *)&self->_flags |= 0x4000000000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x20000000000) == 0)
  {
LABEL_34:
    if ((v8 & 0x100000000000) == 0)
      goto LABEL_35;
    goto LABEL_125;
  }
LABEL_124:
  self->_wifiBand = *((_DWORD *)v4 + 73);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x100000000000) == 0)
  {
LABEL_35:
    if ((v8 & 0x80000000000) == 0)
      goto LABEL_36;
    goto LABEL_126;
  }
LABEL_125:
  self->_wifiChannel = *((_DWORD *)v4 + 76);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  v8 = *((_QWORD *)v4 + 45);
  if ((v8 & 0x80000000000) == 0)
  {
LABEL_36:
    if ((v8 & 0x400000000000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_126:
  self->_wifiChannelWidth = *((_DWORD *)v4 + 75);
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  if ((*((_QWORD *)v4 + 45) & 0x400000000000) != 0)
  {
LABEL_37:
    self->_wifiPhyMode = *((_DWORD *)v4 + 78);
    *(_QWORD *)&self->_flags |= 0x400000000000uLL;
  }
LABEL_38:
  if (*((_QWORD *)v4 + 5))
  {
    -[GEOCellConnectionQuality setCellGCI:](self, "setCellGCI:");
    v4 = v17;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[GEOCellConnectionQuality setCellHomePLMN:](self, "setCellHomePLMN:");
    v4 = v17;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[GEOCellConnectionQuality setCellHomePLMN2:](self, "setCellHomePLMN2:");
    v4 = v17;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[GEOCellConnectionQuality setCellServiceProvider:](self, "setCellServiceProvider:");
    v4 = v17;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[GEOCellConnectionQuality setCellServiceProvider2:](self, "setCellServiceProvider2:");
    v4 = v17;
  }
  v9 = (uint64_t *)(v4 + 360);
  v10 = *((_QWORD *)v4 + 45);
  if ((v10 & 0x2000000) != 0)
  {
    self->_cellVoiceLQM = *((_DWORD *)v4 + 57);
    *(_QWORD *)&self->_flags |= 0x2000000uLL;
    v10 = *v9;
    if ((*v9 & 0x400000000000000) == 0)
    {
LABEL_50:
      if ((v10 & 0x8000) == 0)
        goto LABEL_51;
      goto LABEL_130;
    }
  }
  else if ((v10 & 0x400000000000000) == 0)
  {
    goto LABEL_50;
  }
  self->_cellNpnStatus = v4[351];
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  v10 = *((_QWORD *)v4 + 45);
  if ((v10 & 0x8000) == 0)
  {
LABEL_51:
    if ((v10 & 0x20) == 0)
      goto LABEL_52;
    goto LABEL_131;
  }
LABEL_130:
  self->_cellNpn = *((_DWORD *)v4 + 47);
  *(_QWORD *)&self->_flags |= 0x8000uLL;
  v10 = *((_QWORD *)v4 + 45);
  if ((v10 & 0x20) == 0)
  {
LABEL_52:
    if ((v10 & 0x40) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
LABEL_131:
  self->_cellArfcn = *((_DWORD *)v4 + 37);
  *(_QWORD *)&self->_flags |= 0x20uLL;
  if ((*((_QWORD *)v4 + 45) & 0x40) != 0)
  {
LABEL_53:
    self->_cellBand = *((_DWORD *)v4 + 38);
    *(_QWORD *)&self->_flags |= 0x40uLL;
  }
LABEL_54:
  if (*((_QWORD *)v4 + 8))
  {
    -[GEOCellConnectionQuality setCellRatType:](self, "setCellRatType:");
    v4 = v17;
  }
  v11 = (uint64_t *)(v4 + 360);
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x400) != 0)
  {
    self->_cellLteRSRP = *((_DWORD *)v4 + 42);
    *(_QWORD *)&self->_flags |= 0x400uLL;
    v12 = *v11;
    if ((*v11 & 0x1000) == 0)
    {
LABEL_58:
      if ((v12 & 0x800) == 0)
        goto LABEL_59;
      goto LABEL_135;
    }
  }
  else if ((v12 & 0x1000) == 0)
  {
    goto LABEL_58;
  }
  self->_cellLteSNR = *((_DWORD *)v4 + 44);
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x800) == 0)
  {
LABEL_59:
    if ((v12 & 0x10000) == 0)
      goto LABEL_60;
    goto LABEL_136;
  }
LABEL_135:
  self->_cellLteRSRQ = *((_DWORD *)v4 + 43);
  *(_QWORD *)&self->_flags |= 0x800uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x10000) == 0)
  {
LABEL_60:
    if ((v12 & 0x20000) == 0)
      goto LABEL_61;
    goto LABEL_137;
  }
LABEL_136:
  self->_cellNrRSRP = *((_DWORD *)v4 + 48);
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x20000) == 0)
  {
LABEL_61:
    if ((v12 & 0x40000) == 0)
      goto LABEL_62;
    goto LABEL_138;
  }
LABEL_137:
  self->_cellNrRSRQ = *((_DWORD *)v4 + 49);
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x40000) == 0)
  {
LABEL_62:
    if ((v12 & 0x100) == 0)
      goto LABEL_63;
    goto LABEL_139;
  }
LABEL_138:
  self->_cellNrSNR = *((_DWORD *)v4 + 50);
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x100) == 0)
  {
LABEL_63:
    if ((v12 & 0x400000) == 0)
      goto LABEL_64;
    goto LABEL_140;
  }
LABEL_139:
  self->_cellDataLQM = *((_DWORD *)v4 + 40);
  *(_QWORD *)&self->_flags |= 0x100uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x400000) == 0)
  {
LABEL_64:
    if ((v12 & 0x80000) == 0)
      goto LABEL_65;
    goto LABEL_141;
  }
LABEL_140:
  self->_cellRrcState = *((_DWORD *)v4 + 54);
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x80000) == 0)
  {
LABEL_65:
    if ((v12 & 0x100000) == 0)
      goto LABEL_66;
    goto LABEL_142;
  }
LABEL_141:
  self->_cellNsaFR1 = *((_DWORD *)v4 + 51);
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x100000) == 0)
  {
LABEL_66:
    if ((v12 & 0x800000) == 0)
      goto LABEL_67;
    goto LABEL_143;
  }
LABEL_142:
  self->_cellNsaFR2 = *((_DWORD *)v4 + 52);
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x800000) == 0)
  {
LABEL_67:
    if ((v12 & 0x1000000) == 0)
      goto LABEL_68;
    goto LABEL_144;
  }
LABEL_143:
  self->_cellTotalDlBW = *((_DWORD *)v4 + 55);
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x1000000) == 0)
  {
LABEL_68:
    if ((v12 & 0x80) == 0)
      goto LABEL_69;
    goto LABEL_145;
  }
LABEL_144:
  self->_cellTotalUlBW = *((_DWORD *)v4 + 56);
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x80) == 0)
  {
LABEL_69:
    if ((v12 & 0x2000) == 0)
      goto LABEL_70;
    goto LABEL_146;
  }
LABEL_145:
  self->_cellBssLoad = *((_DWORD *)v4 + 39);
  *(_QWORD *)&self->_flags |= 0x80uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x2000) == 0)
  {
LABEL_70:
    if ((v12 & 0x4000) == 0)
      goto LABEL_71;
    goto LABEL_147;
  }
LABEL_146:
  self->_cellMaxDlCaNumConf = *((_DWORD *)v4 + 45);
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x4000) == 0)
  {
LABEL_71:
    if ((v12 & 0x200) == 0)
      goto LABEL_72;
    goto LABEL_148;
  }
LABEL_147:
  self->_cellMaxUlCaNumConf = *((_DWORD *)v4 + 46);
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x200) == 0)
  {
LABEL_72:
    if ((v12 & 0x200000) == 0)
      goto LABEL_73;
    goto LABEL_149;
  }
LABEL_148:
  self->_cellEstimatedBW = *((_DWORD *)v4 + 41);
  *(_QWORD *)&self->_flags |= 0x200uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x200000) == 0)
  {
LABEL_73:
    if ((v12 & 0x200000000000000) == 0)
      goto LABEL_74;
    goto LABEL_150;
  }
LABEL_149:
  self->_cellPMax = *((_DWORD *)v4 + 53);
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x200000000000000) == 0)
  {
LABEL_74:
    if ((v12 & 0x100000000000000) == 0)
      goto LABEL_75;
    goto LABEL_151;
  }
LABEL_150:
  self->_cellIsRoaming = v4[350];
  *(_QWORD *)&self->_flags |= 0x200000000000000uLL;
  v12 = *((_QWORD *)v4 + 45);
  if ((v12 & 0x100000000000000) == 0)
  {
LABEL_75:
    if ((v12 & 0x80000000000000) == 0)
      goto LABEL_77;
    goto LABEL_76;
  }
LABEL_151:
  self->_cellIsNoService = v4[349];
  *(_QWORD *)&self->_flags |= 0x100000000000000uLL;
  if ((*((_QWORD *)v4 + 45) & 0x80000000000000) != 0)
  {
LABEL_76:
    self->_cellIsLimitedService = v4[348];
    *(_QWORD *)&self->_flags |= 0x80000000000000uLL;
  }
LABEL_77:
  if (*((_QWORD *)v4 + 12))
  {
    -[GEOCellConnectionQuality setFtIRATRecommendation:](self, "setFtIRATRecommendation:");
    v4 = v17;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[GEOCellConnectionQuality setFtIRATRecommendationReason:](self, "setFtIRATRecommendationReason:");
    v4 = v17;
  }
  v13 = *((_QWORD *)v4 + 45);
  if ((v13 & 0x200000000) != 0)
  {
    self->_ftFacetimePacketLoss = *((_DWORD *)v4 + 65);
    *(_QWORD *)&self->_flags |= 0x200000000uLL;
    v13 = *((_QWORD *)v4 + 45);
  }
  v14 = *((_WORD *)v4 + 184);
  if ((v13 & 0x100000000) != 0)
  {
    self->_ftFacetimeAction = *((_DWORD *)v4 + 64);
    *(_QWORD *)&self->_flags |= 0x100000000uLL;
    v13 = *((_QWORD *)v4 + 45);
    v14 = *((_WORD *)v4 + 184);
    if ((v13 & 0x400000000) == 0)
    {
LABEL_85:
      if ((v13 & 0x80000000) == 0)
        goto LABEL_86;
      goto LABEL_155;
    }
  }
  else if ((v13 & 0x400000000) == 0)
  {
    goto LABEL_85;
  }
  self->_ftFacetimeTimeDelay = *((_DWORD *)v4 + 66);
  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  v13 = *((_QWORD *)v4 + 45);
  v14 = *((_WORD *)v4 + 184);
  if ((v13 & 0x80000000) == 0)
  {
LABEL_86:
    if ((v14 & 1) == 0)
      goto LABEL_87;
    goto LABEL_156;
  }
LABEL_155:
  self->_ftCounter = *((_DWORD *)v4 + 63);
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  v13 = *((_QWORD *)v4 + 45);
  v14 = *((_WORD *)v4 + 184);
  if ((v14 & 1) == 0)
  {
LABEL_87:
    if ((v14 & 4) == 0)
      goto LABEL_88;
    goto LABEL_157;
  }
LABEL_156:
  self->_wrmAlertedMode = v4[357];
  *((_WORD *)&self->_flags + 4) |= 1u;
  v13 = *((_QWORD *)v4 + 45);
  v14 = *((_WORD *)v4 + 184);
  if ((v14 & 4) == 0)
  {
LABEL_88:
    if ((v14 & 2) == 0)
      goto LABEL_89;
    goto LABEL_158;
  }
LABEL_157:
  self->_wrmIsStallDetected = v4[359];
  *((_WORD *)&self->_flags + 4) |= 4u;
  v13 = *((_QWORD *)v4 + 45);
  if ((*((_WORD *)v4 + 184) & 2) == 0)
  {
LABEL_89:
    if ((v13 & 0x40000000000000) == 0)
      goto LABEL_90;
    goto LABEL_159;
  }
LABEL_158:
  self->_wrmIsPCDetected = v4[358];
  *((_WORD *)&self->_flags + 4) |= 2u;
  v13 = *((_QWORD *)v4 + 45);
  if ((v13 & 0x40000000000000) == 0)
  {
LABEL_90:
    if ((v13 & 0x20000000000000) == 0)
      goto LABEL_92;
    goto LABEL_91;
  }
LABEL_159:
  self->_wrmVideoErasure = *((_DWORD *)v4 + 86);
  *(_QWORD *)&self->_flags |= 0x40000000000000uLL;
  if ((*((_QWORD *)v4 + 45) & 0x20000000000000) != 0)
  {
LABEL_91:
    self->_wrmAudioErasure = *((_DWORD *)v4 + 85);
    *(_QWORD *)&self->_flags |= 0x20000000000000uLL;
  }
LABEL_92:
  location = self->_location;
  v16 = *((_QWORD *)v4 + 13);
  if (location)
  {
    if (v16)
    {
      -[GEOLocation mergeFrom:](location, "mergeFrom:");
LABEL_163:
      v4 = v17;
    }
  }
  else if (v16)
  {
    -[GEOCellConnectionQuality setLocation:](self, "setLocation:");
    goto LABEL_163;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_ftIRATRecommendation, 0);
  objc_storeStrong((id *)&self->_ftIRATRecommendationReason, 0);
  objc_storeStrong((id *)&self->_cellServiceProvider, 0);
  objc_storeStrong((id *)&self->_cellServiceProvider2, 0);
  objc_storeStrong((id *)&self->_cellRatType, 0);
  objc_storeStrong((id *)&self->_cellHomePLMN, 0);
  objc_storeStrong((id *)&self->_cellHomePLMN2, 0);
  objc_storeStrong((id *)&self->_cellGCI, 0);
  objc_storeStrong((id *)&self->_callID, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
