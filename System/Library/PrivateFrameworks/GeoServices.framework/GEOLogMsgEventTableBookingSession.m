@implementation GEOLogMsgEventTableBookingSession

- (GEOLogMsgEventTableBookingSession)init
{
  GEOLogMsgEventTableBookingSession *v2;
  GEOLogMsgEventTableBookingSession *v3;
  GEOLogMsgEventTableBookingSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventTableBookingSession;
  v2 = -[GEOLogMsgEventTableBookingSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventTableBookingSession)initWithData:(id)a3
{
  GEOLogMsgEventTableBookingSession *v3;
  GEOLogMsgEventTableBookingSession *v4;
  GEOLogMsgEventTableBookingSession *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventTableBookingSession;
  v3 = -[GEOLogMsgEventTableBookingSession initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readBookTableSessionId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 113) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTableBookingSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBookTableSessionId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasBookTableSessionId
{
  -[GEOLogMsgEventTableBookingSession _readBookTableSessionId]((uint64_t)self);
  return self->_bookTableSessionId != 0;
}

- (NSString)bookTableSessionId
{
  -[GEOLogMsgEventTableBookingSession _readBookTableSessionId]((uint64_t)self);
  return self->_bookTableSessionId;
}

- (void)setBookTableSessionId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x12000u;
  objc_storeStrong((id *)&self->_bookTableSessionId, a3);
}

- (int)endState
{
  os_unfair_lock_s *p_readerLock;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x10) != 0)
    return self->_endState;
  else
    return 0;
}

- (void)setEndState:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10010u;
  self->_endState = a3;
}

- (void)setHasEndState:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65552;
  else
    v3 = 0x10000;
  self->_flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasEndState
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)endStateAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C15B70[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEndState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BTES_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BTES_BOOKED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BTES_ABANDONED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BTES_SUSPENDED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BTES_PUNCHED_OUT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BTES_ERROR")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)endView
{
  os_unfair_lock_s *p_readerLock;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x20) != 0)
    return self->_endView;
  else
    return 0;
}

- (void)setEndView:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10020u;
  self->_endView = a3;
}

- (void)setHasEndView:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65568;
  else
    v3 = 0x10000;
  self->_flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasEndView
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (id)endViewAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C15BA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEndView:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BTV_NOT_SET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BTV_INSTALL_NEEDED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BTV_PRE_ENABLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BTV_PICK_TIME")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BTV_PICK_DETAILS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BTV_PRE_RESERVE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BTV_RESERVING")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BTV_RESERVED")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readBookTableAppId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 113) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTableBookingSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBookTableAppId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasBookTableAppId
{
  -[GEOLogMsgEventTableBookingSession _readBookTableAppId]((uint64_t)self);
  return self->_bookTableAppId != 0;
}

- (NSString)bookTableAppId
{
  -[GEOLogMsgEventTableBookingSession _readBookTableAppId]((uint64_t)self);
  return self->_bookTableAppId;
}

- (void)setBookTableAppId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x11000u;
  objc_storeStrong((id *)&self->_bookTableAppId, a3);
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x10008u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65544;
  else
    v3 = 0x10000;
  self->_flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasMuid
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (int64_t)blurredReservationTimestamp
{
  return self->_blurredReservationTimestamp;
}

- (void)setBlurredReservationTimestamp:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x10002u;
  self->_blurredReservationTimestamp = a3;
}

- (void)setHasBlurredReservationTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65538;
  else
    v3 = 0x10000;
  self->_flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasBlurredReservationTimestamp
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int64_t)blurredBookingTimestamp
{
  return self->_blurredBookingTimestamp;
}

- (void)setBlurredBookingTimestamp:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x10001u;
  self->_blurredBookingTimestamp = a3;
}

- (void)setHasBlurredBookingTimestamp:(BOOL)a3
{
  self->_flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFEFFFE | a3 | 0x10000);
}

- (BOOL)hasBlurredBookingTimestamp
{
  return *(_DWORD *)&self->_flags & 1;
}

- (double)durationOfSessionInSeconds
{
  return self->_durationOfSessionInSeconds;
}

- (void)setDurationOfSessionInSeconds:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x10004u;
  self->_durationOfSessionInSeconds = a3;
}

- (void)setHasDurationOfSessionInSeconds:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65540;
  else
    v3 = 0x10000;
  self->_flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDurationOfSessionInSeconds
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)installNeeded
{
  return self->_installNeeded;
}

- (void)setInstallNeeded:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10200u;
  self->_installNeeded = a3;
}

- (void)setHasInstallNeeded:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 66048;
  else
    v3 = 0x10000;
  self->_flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasInstallNeeded
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (void)_readInstallNeededTappedAppId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 113) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTableBookingSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInstallNeededTappedAppId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasInstallNeededTappedAppId
{
  -[GEOLogMsgEventTableBookingSession _readInstallNeededTappedAppId]((uint64_t)self);
  return self->_installNeededTappedAppId != 0;
}

- (NSString)installNeededTappedAppId
{
  -[GEOLogMsgEventTableBookingSession _readInstallNeededTappedAppId]((uint64_t)self);
  return self->_installNeededTappedAppId;
}

- (void)setInstallNeededTappedAppId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x18000u;
  objc_storeStrong((id *)&self->_installNeededTappedAppId, a3);
}

- (BOOL)installCompleted
{
  return self->_installCompleted;
}

- (void)setInstallCompleted:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10100u;
  self->_installCompleted = a3;
}

- (void)setHasInstallCompleted:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65792;
  else
    v3 = 0x10000;
  self->_flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasInstallCompleted
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (unsigned)tableSize
{
  return self->_tableSize;
}

- (void)setTableSize:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10040u;
  self->_tableSize = a3;
}

- (void)setHasTableSize:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65600;
  else
    v3 = 0x10000;
  self->_flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasTableSize
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (BOOL)addedSpecialRequest
{
  return self->_addedSpecialRequest;
}

- (void)setAddedSpecialRequest:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10080u;
  self->_addedSpecialRequest = a3;
}

- (void)setHasAddedSpecialRequest:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65664;
  else
    v3 = 0x10000;
  self->_flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasAddedSpecialRequest
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (BOOL)swipedAvailableTimes
{
  return self->_swipedAvailableTimes;
}

- (void)setSwipedAvailableTimes:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10400u;
  self->_swipedAvailableTimes = a3;
}

- (void)setHasSwipedAvailableTimes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 66560;
  else
    v3 = 0x10000;
  self->_flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasSwipedAvailableTimes
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (BOOL)tappedDatePicker
{
  return self->_tappedDatePicker;
}

- (void)setTappedDatePicker:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10800u;
  self->_tappedDatePicker = a3;
}

- (void)setHasTappedDatePicker:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 67584;
  else
    v3 = 0x10000;
  self->_flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasTappedDatePicker
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)_readErrorMessages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 113) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTableBookingSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readErrorMessages_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)errorMessages
{
  -[GEOLogMsgEventTableBookingSession _readErrorMessages]((uint64_t)self);
  return self->_errorMessages;
}

- (void)setErrorMessages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *errorMessages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  errorMessages = self->_errorMessages;
  self->_errorMessages = v4;

}

- (void)clearErrorMessages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  -[NSMutableArray removeAllObjects](self->_errorMessages, "removeAllObjects");
}

- (void)addErrorMessage:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventTableBookingSession _readErrorMessages]((uint64_t)self);
  -[GEOLogMsgEventTableBookingSession _addNoFlagsErrorMessage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsErrorMessage:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)errorMessagesCount
{
  -[GEOLogMsgEventTableBookingSession _readErrorMessages]((uint64_t)self);
  return -[NSMutableArray count](self->_errorMessages, "count");
}

- (id)errorMessageAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventTableBookingSession _readErrorMessages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_errorMessages, "objectAtIndex:", a3);
}

+ (Class)errorMessageType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOLogMsgEventTableBookingSession;
  -[GEOLogMsgEventTableBookingSession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventTableBookingSession dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventTableBookingSession _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  int v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  int v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  int v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "bookTableSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("bookTableSessionId");
    else
      v6 = CFSTR("book_table_session_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  v7 = *(_DWORD *)(a1 + 112);
  if ((v7 & 0x10) != 0)
  {
    v8 = *(int *)(a1 + 92);
    if (v8 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 92));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E1C15B70[v8];
    }
    if (a2)
      v10 = CFSTR("endState");
    else
      v10 = CFSTR("end_state");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

    v7 = *(_DWORD *)(a1 + 112);
  }
  if ((v7 & 0x20) != 0)
  {
    v11 = *(int *)(a1 + 96);
    if (v11 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 96));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E1C15BA0[v11];
    }
    if (a2)
      v13 = CFSTR("endView");
    else
      v13 = CFSTR("end_view");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  objc_msgSend((id)a1, "bookTableAppId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (a2)
      v15 = CFSTR("bookTableAppId");
    else
      v15 = CFSTR("book_table_app_id");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);
  }

  v16 = *(_DWORD *)(a1 + 112);
  if ((v16 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 72));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("muid"));

    v16 = *(_DWORD *)(a1 + 112);
    if ((v16 & 2) == 0)
    {
LABEL_30:
      if ((v16 & 1) == 0)
        goto LABEL_31;
      goto LABEL_62;
    }
  }
  else if ((v16 & 2) == 0)
  {
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 24));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v29 = CFSTR("blurredReservationTimestamp");
  else
    v29 = CFSTR("blurred_reservation_timestamp");
  objc_msgSend(v4, "setObject:forKey:", v28, v29);

  v16 = *(_DWORD *)(a1 + 112);
  if ((v16 & 1) == 0)
  {
LABEL_31:
    if ((v16 & 4) == 0)
      goto LABEL_32;
    goto LABEL_66;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 16));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v31 = CFSTR("blurredBookingTimestamp");
  else
    v31 = CFSTR("blurred_booking_timestamp");
  objc_msgSend(v4, "setObject:forKey:", v30, v31);

  v16 = *(_DWORD *)(a1 + 112);
  if ((v16 & 4) == 0)
  {
LABEL_32:
    if ((v16 & 0x200) == 0)
      goto LABEL_37;
    goto LABEL_33;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v33 = CFSTR("durationOfSessionInSeconds");
  else
    v33 = CFSTR("duration_of_session_in_seconds");
  objc_msgSend(v4, "setObject:forKey:", v32, v33);

  if ((*(_DWORD *)(a1 + 112) & 0x200) != 0)
  {
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 106));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("installNeeded");
    else
      v18 = CFSTR("install_needed");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
LABEL_37:
  objc_msgSend((id)a1, "installNeededTappedAppId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (a2)
      v20 = CFSTR("installNeededTappedAppId");
    else
      v20 = CFSTR("install_needed_tapped_app_id");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);
  }

  v21 = *(_DWORD *)(a1 + 112);
  if ((v21 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 105));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v35 = CFSTR("installCompleted");
    else
      v35 = CFSTR("install_completed");
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

    v21 = *(_DWORD *)(a1 + 112);
    if ((v21 & 0x40) == 0)
    {
LABEL_44:
      if ((v21 & 0x80) == 0)
        goto LABEL_45;
      goto LABEL_79;
    }
  }
  else if ((v21 & 0x40) == 0)
  {
    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 100));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v37 = CFSTR("tableSize");
  else
    v37 = CFSTR("table_size");
  objc_msgSend(v4, "setObject:forKey:", v36, v37);

  v21 = *(_DWORD *)(a1 + 112);
  if ((v21 & 0x80) == 0)
  {
LABEL_45:
    if ((v21 & 0x400) == 0)
      goto LABEL_46;
    goto LABEL_83;
  }
LABEL_79:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 104));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v39 = CFSTR("addedSpecialRequest");
  else
    v39 = CFSTR("added_special_request");
  objc_msgSend(v4, "setObject:forKey:", v38, v39);

  v21 = *(_DWORD *)(a1 + 112);
  if ((v21 & 0x400) == 0)
  {
LABEL_46:
    if ((v21 & 0x800) == 0)
      goto LABEL_51;
    goto LABEL_47;
  }
LABEL_83:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 107));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v41 = CFSTR("swipedAvailableTimes");
  else
    v41 = CFSTR("swiped_available_times");
  objc_msgSend(v4, "setObject:forKey:", v40, v41);

  if ((*(_DWORD *)(a1 + 112) & 0x800) != 0)
  {
LABEL_47:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 108));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("tappedDatePicker");
    else
      v23 = CFSTR("tapped_date_picker");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
LABEL_51:
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend((id)a1, "errorMessages");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("errorMessage");
    else
      v25 = CFSTR("error_message");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventTableBookingSession _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventTableBookingSession)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventTableBookingSession *)-[GEOLogMsgEventTableBookingSession _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_126;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_126;
  if (a3)
    v6 = CFSTR("bookTableSessionId");
  else
    v6 = CFSTR("book_table_session_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setBookTableSessionId:", v8);

  }
  if (a3)
    v9 = CFSTR("endState");
  else
    v9 = CFSTR("end_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BTES_UNKNOWN")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BTES_BOOKED")) & 1) != 0)
    {
      v12 = 1;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BTES_ABANDONED")) & 1) != 0)
    {
      v12 = 2;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BTES_SUSPENDED")) & 1) != 0)
    {
      v12 = 3;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BTES_PUNCHED_OUT")) & 1) != 0)
    {
      v12 = 4;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("BTES_ERROR")))
    {
      v12 = 5;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_29;
    v12 = objc_msgSend(v10, "intValue");
  }
  objc_msgSend(a1, "setEndState:", v12);
LABEL_29:

  if (a3)
    v13 = CFSTR("endView");
  else
    v13 = CFSTR("end_view");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BTV_NOT_SET")) & 1) != 0)
    {
      v16 = 0;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BTV_INSTALL_NEEDED")) & 1) != 0)
    {
      v16 = 1;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BTV_PRE_ENABLE")) & 1) != 0)
    {
      v16 = 2;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BTV_PICK_TIME")) & 1) != 0)
    {
      v16 = 3;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BTV_PICK_DETAILS")) & 1) != 0)
    {
      v16 = 4;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BTV_PRE_RESERVE")) & 1) != 0)
    {
      v16 = 5;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BTV_RESERVING")) & 1) != 0)
    {
      v16 = 6;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("BTV_RESERVED")))
    {
      v16 = 7;
    }
    else
    {
      v16 = 0;
    }

    goto LABEL_53;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_msgSend(v14, "intValue");
LABEL_53:
    objc_msgSend(a1, "setEndView:", v16);
  }

  if (a3)
    v17 = CFSTR("bookTableAppId");
  else
    v17 = CFSTR("book_table_app_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(a1, "setBookTableAppId:", v19);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMuid:", objc_msgSend(v20, "unsignedLongLongValue"));

  if (a3)
    v21 = CFSTR("blurredReservationTimestamp");
  else
    v21 = CFSTR("blurred_reservation_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBlurredReservationTimestamp:", objc_msgSend(v22, "longLongValue"));

  if (a3)
    v23 = CFSTR("blurredBookingTimestamp");
  else
    v23 = CFSTR("blurred_booking_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBlurredBookingTimestamp:", objc_msgSend(v24, "longLongValue"));

  if (a3)
    v25 = CFSTR("durationOfSessionInSeconds");
  else
    v25 = CFSTR("duration_of_session_in_seconds");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v26, "doubleValue");
    objc_msgSend(a1, "setDurationOfSessionInSeconds:");
  }

  if (a3)
    v27 = CFSTR("installNeeded");
  else
    v27 = CFSTR("install_needed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setInstallNeeded:", objc_msgSend(v28, "BOOLValue"));

  if (a3)
    v29 = CFSTR("installNeededTappedAppId");
  else
    v29 = CFSTR("install_needed_tapped_app_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = (void *)objc_msgSend(v30, "copy");
    objc_msgSend(a1, "setInstallNeededTappedAppId:", v31);

  }
  if (a3)
    v32 = CFSTR("installCompleted");
  else
    v32 = CFSTR("install_completed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setInstallCompleted:", objc_msgSend(v33, "BOOLValue"));

  if (a3)
    v34 = CFSTR("tableSize");
  else
    v34 = CFSTR("table_size");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTableSize:", objc_msgSend(v35, "unsignedIntValue"));

  if (a3)
    v36 = CFSTR("addedSpecialRequest");
  else
    v36 = CFSTR("added_special_request");
  objc_msgSend(v5, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAddedSpecialRequest:", objc_msgSend(v37, "BOOLValue"));

  if (a3)
    v38 = CFSTR("swipedAvailableTimes");
  else
    v38 = CFSTR("swiped_available_times");
  objc_msgSend(v5, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSwipedAvailableTimes:", objc_msgSend(v39, "BOOLValue"));

  if (a3)
    v40 = CFSTR("tappedDatePicker");
  else
    v40 = CFSTR("tapped_date_picker");
  objc_msgSend(v5, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTappedDatePicker:", objc_msgSend(v41, "BOOLValue"));

  if (a3)
    v42 = CFSTR("errorMessage");
  else
    v42 = CFSTR("error_message");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v44 = v43;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v53;
      do
      {
        v48 = 0;
        do
        {
          if (*(_QWORD *)v53 != v47)
            objc_enumerationMutation(v44);
          v49 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v48);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v50 = (void *)objc_msgSend(v49, "copy", (_QWORD)v52);
            objc_msgSend(a1, "addErrorMessage:", v50);

          }
          ++v48;
        }
        while (v46 != v48);
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v46);
    }

  }
LABEL_126:

  return a1;
}

- (GEOLogMsgEventTableBookingSession)initWithJSON:(id)a3
{
  return (GEOLogMsgEventTableBookingSession *)-[GEOLogMsgEventTableBookingSession _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_289_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_290_0;
    GEOLogMsgEventTableBookingSessionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventTableBookingSessionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventTableBookingSessionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE flags;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v7;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  PBDataReader *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0x1F000) == 0)
    {
      v13 = self->_reader;
      objc_sync_enter(v13);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v14);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v13);
      goto LABEL_44;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventTableBookingSession readAll:](self, "readAll:", 0);
  if (self->_bookTableSessionId)
    PBDataWriterWriteStringField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_bookTableAppId)
    PBDataWriterWriteStringField();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    v7 = self->_flags;
    if ((*(_BYTE *)&v7 & 2) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&v7 & 1) == 0)
        goto LABEL_14;
      goto LABEL_35;
    }
  }
  else if ((*(_BYTE *)&v7 & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteInt64Field();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 1) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&v7 & 4) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt64Field();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 4) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v7 & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_36:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_flags & 0x200) != 0)
LABEL_16:
    PBDataWriterWriteBOOLField();
LABEL_17:
  if (self->_installNeededTappedAppId)
    PBDataWriterWriteStringField();
  v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    v8 = self->_flags;
    if ((*(_BYTE *)&v8 & 0x40) == 0)
    {
LABEL_21:
      if ((*(_BYTE *)&v8 & 0x80) == 0)
        goto LABEL_22;
      goto LABEL_40;
    }
  }
  else if ((*(_BYTE *)&v8 & 0x40) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteUint32Field();
  v8 = self->_flags;
  if ((*(_BYTE *)&v8 & 0x80) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v8 & 0x400) == 0)
      goto LABEL_23;
LABEL_41:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_flags & 0x800) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_40:
  PBDataWriterWriteBOOLField();
  v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x400) != 0)
    goto LABEL_41;
LABEL_23:
  if ((*(_WORD *)&v8 & 0x800) != 0)
LABEL_24:
    PBDataWriterWriteBOOLField();
LABEL_25:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_errorMessages;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        PBDataWriterWriteStringField();
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

LABEL_44:
}

- (void)copyTo:(id)a3
{
  $9F9A2A9579ABD3305E4426CE4C6AFAEE flags;
  id *v5;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v6;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  id *v12;

  v12 = (id *)a3;
  -[GEOLogMsgEventTableBookingSession readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 20) = self->_readerMarkPos;
  *((_DWORD *)v12 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_bookTableSessionId)
    objc_msgSend(v12, "setBookTableSessionId:");
  flags = self->_flags;
  v5 = v12;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    *((_DWORD *)v12 + 23) = self->_endState;
    *((_DWORD *)v12 + 28) |= 0x10u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    *((_DWORD *)v12 + 24) = self->_endView;
    *((_DWORD *)v12 + 28) |= 0x20u;
  }
  if (self->_bookTableAppId)
  {
    objc_msgSend(v12, "setBookTableAppId:");
    v5 = v12;
  }
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 8) != 0)
  {
    v5[9] = (id)self->_muid;
    *((_DWORD *)v5 + 28) |= 8u;
    v6 = self->_flags;
    if ((*(_BYTE *)&v6 & 2) == 0)
    {
LABEL_11:
      if ((*(_BYTE *)&v6 & 1) == 0)
        goto LABEL_12;
      goto LABEL_30;
    }
  }
  else if ((*(_BYTE *)&v6 & 2) == 0)
  {
    goto LABEL_11;
  }
  v5[3] = (id)self->_blurredReservationTimestamp;
  *((_DWORD *)v5 + 28) |= 2u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 1) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  v5[2] = (id)self->_blurredBookingTimestamp;
  *((_DWORD *)v5 + 28) |= 1u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v6 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_31:
  v5[6] = *(id *)&self->_durationOfSessionInSeconds;
  *((_DWORD *)v5 + 28) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x200) != 0)
  {
LABEL_14:
    *((_BYTE *)v5 + 106) = self->_installNeeded;
    *((_DWORD *)v5 + 28) |= 0x200u;
  }
LABEL_15:
  if (self->_installNeededTappedAppId)
  {
    objc_msgSend(v12, "setInstallNeededTappedAppId:");
    v5 = v12;
  }
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x100) != 0)
  {
    *((_BYTE *)v5 + 105) = self->_installCompleted;
    *((_DWORD *)v5 + 28) |= 0x100u;
    v7 = self->_flags;
    if ((*(_BYTE *)&v7 & 0x40) == 0)
    {
LABEL_19:
      if ((*(_BYTE *)&v7 & 0x80) == 0)
        goto LABEL_20;
      goto LABEL_35;
    }
  }
  else if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
    goto LABEL_19;
  }
  *((_DWORD *)v5 + 25) = self->_tableSize;
  *((_DWORD *)v5 + 28) |= 0x40u;
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x80) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v7 & 0x400) == 0)
      goto LABEL_21;
LABEL_36:
    *((_BYTE *)v5 + 107) = self->_swipedAvailableTimes;
    *((_DWORD *)v5 + 28) |= 0x400u;
    if ((*(_DWORD *)&self->_flags & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_35:
  *((_BYTE *)v5 + 104) = self->_addedSpecialRequest;
  *((_DWORD *)v5 + 28) |= 0x80u;
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x400) != 0)
    goto LABEL_36;
LABEL_21:
  if ((*(_WORD *)&v7 & 0x800) != 0)
  {
LABEL_22:
    *((_BYTE *)v5 + 108) = self->_tappedDatePicker;
    *((_DWORD *)v5 + 28) |= 0x800u;
  }
LABEL_23:
  if (-[GEOLogMsgEventTableBookingSession errorMessagesCount](self, "errorMessagesCount"))
  {
    objc_msgSend(v12, "clearErrorMessages");
    v8 = -[GEOLogMsgEventTableBookingSession errorMessagesCount](self, "errorMessagesCount");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        -[GEOLogMsgEventTableBookingSession errorMessageAtIndex:](self, "errorMessageAtIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addErrorMessage:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  void *v10;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE flags;
  uint64_t v12;
  void *v13;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v14;
  uint64_t v15;
  void *v16;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 1) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgEventTableBookingSessionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_28;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventTableBookingSession readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_bookTableSessionId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_endState;
    *(_DWORD *)(v5 + 112) |= 0x10u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_endView;
    *(_DWORD *)(v5 + 112) |= 0x20u;
  }
  v12 = -[NSString copyWithZone:](self->_bookTableAppId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = self->_flags;
  if ((*(_BYTE *)&v14 & 8) != 0)
  {
    *(_QWORD *)(v5 + 72) = self->_muid;
    *(_DWORD *)(v5 + 112) |= 8u;
    v14 = self->_flags;
    if ((*(_BYTE *)&v14 & 2) == 0)
    {
LABEL_11:
      if ((*(_BYTE *)&v14 & 1) == 0)
        goto LABEL_12;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&v14 & 2) == 0)
  {
    goto LABEL_11;
  }
  *(_QWORD *)(v5 + 24) = self->_blurredReservationTimestamp;
  *(_DWORD *)(v5 + 112) |= 2u;
  v14 = self->_flags;
  if ((*(_BYTE *)&v14 & 1) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&v14 & 4) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  *(_QWORD *)(v5 + 16) = self->_blurredBookingTimestamp;
  *(_DWORD *)(v5 + 112) |= 1u;
  v14 = self->_flags;
  if ((*(_BYTE *)&v14 & 4) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v14 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_32:
  *(double *)(v5 + 48) = self->_durationOfSessionInSeconds;
  *(_DWORD *)(v5 + 112) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x200) != 0)
  {
LABEL_14:
    *(_BYTE *)(v5 + 106) = self->_installNeeded;
    *(_DWORD *)(v5 + 112) |= 0x200u;
  }
LABEL_15:
  v15 = -[NSString copyWithZone:](self->_installNeededTappedAppId, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v15;

  v17 = self->_flags;
  if ((*(_WORD *)&v17 & 0x100) != 0)
  {
    *(_BYTE *)(v5 + 105) = self->_installCompleted;
    *(_DWORD *)(v5 + 112) |= 0x100u;
    v17 = self->_flags;
    if ((*(_BYTE *)&v17 & 0x40) == 0)
    {
LABEL_17:
      if ((*(_BYTE *)&v17 & 0x80) == 0)
        goto LABEL_18;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&v17 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  *(_DWORD *)(v5 + 100) = self->_tableSize;
  *(_DWORD *)(v5 + 112) |= 0x40u;
  v17 = self->_flags;
  if ((*(_BYTE *)&v17 & 0x80) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v17 & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_37;
  }
LABEL_36:
  *(_BYTE *)(v5 + 104) = self->_addedSpecialRequest;
  *(_DWORD *)(v5 + 112) |= 0x80u;
  v17 = self->_flags;
  if ((*(_WORD *)&v17 & 0x400) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v17 & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_37:
  *(_BYTE *)(v5 + 107) = self->_swipedAvailableTimes;
  *(_DWORD *)(v5 + 112) |= 0x400u;
  if ((*(_DWORD *)&self->_flags & 0x800) != 0)
  {
LABEL_20:
    *(_BYTE *)(v5 + 108) = self->_tappedDatePicker;
    *(_DWORD *)(v5 + 112) |= 0x800u;
  }
LABEL_21:
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = self->_errorMessages;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v8);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend((id)v5, "addErrorMessage:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }
LABEL_28:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bookTableSessionId;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE flags;
  int v7;
  NSString *bookTableAppId;
  NSString *installNeededTappedAppId;
  char v10;
  NSMutableArray *errorMessages;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_81;
  -[GEOLogMsgEventTableBookingSession readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  bookTableSessionId = self->_bookTableSessionId;
  if ((unint64_t)bookTableSessionId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](bookTableSessionId, "isEqual:"))
      goto LABEL_81;
  }
  flags = self->_flags;
  v7 = *((_DWORD *)v4 + 28);
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_endState != *((_DWORD *)v4 + 23))
      goto LABEL_81;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_endView != *((_DWORD *)v4 + 24))
      goto LABEL_81;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_81;
  }
  bookTableAppId = self->_bookTableAppId;
  if ((unint64_t)bookTableAppId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](bookTableAppId, "isEqual:"))
      goto LABEL_81;
    flags = self->_flags;
    v7 = *((_DWORD *)v4 + 28);
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_muid != *((_QWORD *)v4 + 9))
      goto LABEL_81;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_blurredReservationTimestamp != *((_QWORD *)v4 + 3))
      goto LABEL_81;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_blurredBookingTimestamp != *((_QWORD *)v4 + 2))
      goto LABEL_81;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_durationOfSessionInSeconds != *((double *)v4 + 6))
      goto LABEL_81;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0)
      goto LABEL_81;
    if (self->_installNeeded)
    {
      if (!*((_BYTE *)v4 + 106))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 106))
    {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_81;
  }
  installNeededTappedAppId = self->_installNeededTappedAppId;
  if ((unint64_t)installNeededTappedAppId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](installNeededTappedAppId, "isEqual:"))
      goto LABEL_81;
    flags = self->_flags;
    v7 = *((_DWORD *)v4 + 28);
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0)
      goto LABEL_81;
    if (self->_installCompleted)
    {
      if (!*((_BYTE *)v4 + 105))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 105))
    {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_tableSize != *((_DWORD *)v4 + 25))
      goto LABEL_81;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_81;
    if (self->_addedSpecialRequest)
    {
      if (!*((_BYTE *)v4 + 104))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 104))
    {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0)
      goto LABEL_81;
    if (self->_swipedAvailableTimes)
    {
      if (!*((_BYTE *)v4 + 107))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 107))
    {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
    if ((v7 & 0x800) == 0)
      goto LABEL_87;
LABEL_81:
    v10 = 0;
    goto LABEL_82;
  }
  if ((v7 & 0x800) == 0)
    goto LABEL_81;
  if (!self->_tappedDatePicker)
  {
    if (!*((_BYTE *)v4 + 108))
      goto LABEL_87;
    goto LABEL_81;
  }
  if (!*((_BYTE *)v4 + 108))
    goto LABEL_81;
LABEL_87:
  errorMessages = self->_errorMessages;
  if ((unint64_t)errorMessages | *((_QWORD *)v4 + 7))
    v10 = -[NSMutableArray isEqual:](errorMessages, "isEqual:");
  else
    v10 = 1;
LABEL_82:

  return v10;
}

- (unint64_t)hash
{
  $9F9A2A9579ABD3305E4426CE4C6AFAEE flags;
  uint64_t v4;
  NSUInteger v5;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double durationOfSessionInSeconds;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  NSUInteger v26;

  -[GEOLogMsgEventTableBookingSession readAll:](self, "readAll:", 1);
  v26 = -[NSString hash](self->_bookTableSessionId, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    v24 = 2654435761 * self->_endState;
    if ((*(_BYTE *)&flags & 0x20) != 0)
      goto LABEL_3;
  }
  else
  {
    v24 = 0;
    if ((*(_BYTE *)&flags & 0x20) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_endView;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_bookTableAppId, "hash", v24);
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 8) != 0)
  {
    v7 = 2654435761u * self->_muid;
    if ((*(_BYTE *)&v6 & 2) != 0)
    {
LABEL_8:
      v8 = 2654435761 * self->_blurredReservationTimestamp;
      if ((*(_BYTE *)&v6 & 1) != 0)
        goto LABEL_9;
LABEL_16:
      v9 = 0;
      if ((*(_BYTE *)&v6 & 4) != 0)
        goto LABEL_10;
LABEL_17:
      v14 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&v6 & 2) != 0)
      goto LABEL_8;
  }
  v8 = 0;
  if ((*(_BYTE *)&v6 & 1) == 0)
    goto LABEL_16;
LABEL_9:
  v9 = 2654435761 * self->_blurredBookingTimestamp;
  if ((*(_BYTE *)&v6 & 4) == 0)
    goto LABEL_17;
LABEL_10:
  durationOfSessionInSeconds = self->_durationOfSessionInSeconds;
  v11 = -durationOfSessionInSeconds;
  if (durationOfSessionInSeconds >= 0.0)
    v11 = self->_durationOfSessionInSeconds;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_20:
  if ((*(_WORD *)&v6 & 0x200) != 0)
    v15 = 2654435761 * self->_installNeeded;
  else
    v15 = 0;
  v16 = -[NSString hash](self->_installNeededTappedAppId, "hash");
  v17 = self->_flags;
  if ((*(_WORD *)&v17 & 0x100) != 0)
  {
    v18 = 2654435761 * self->_installCompleted;
    if ((*(_BYTE *)&v17 & 0x40) != 0)
    {
LABEL_25:
      v19 = 2654435761 * self->_tableSize;
      if ((*(_BYTE *)&v17 & 0x80) != 0)
        goto LABEL_26;
      goto LABEL_31;
    }
  }
  else
  {
    v18 = 0;
    if ((*(_BYTE *)&v17 & 0x40) != 0)
      goto LABEL_25;
  }
  v19 = 0;
  if ((*(_BYTE *)&v17 & 0x80) != 0)
  {
LABEL_26:
    v20 = 2654435761 * self->_addedSpecialRequest;
    if ((*(_WORD *)&v17 & 0x400) != 0)
      goto LABEL_27;
LABEL_32:
    v21 = 0;
    if ((*(_WORD *)&v17 & 0x800) != 0)
      goto LABEL_28;
LABEL_33:
    v22 = 0;
    return v25 ^ v26 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ -[NSMutableArray hash](self->_errorMessages, "hash");
  }
LABEL_31:
  v20 = 0;
  if ((*(_WORD *)&v17 & 0x400) == 0)
    goto LABEL_32;
LABEL_27:
  v21 = 2654435761 * self->_swipedAvailableTimes;
  if ((*(_WORD *)&v17 & 0x800) == 0)
    goto LABEL_33;
LABEL_28:
  v22 = 2654435761 * self->_tappedDatePicker;
  return v25 ^ v26 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ -[NSMutableArray hash](self->_errorMessages, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 5))
    -[GEOLogMsgEventTableBookingSession setBookTableSessionId:](self, "setBookTableSessionId:");
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x10) != 0)
  {
    self->_endState = *((_DWORD *)v4 + 23);
    *(_DWORD *)&self->_flags |= 0x10u;
    v5 = *((_DWORD *)v4 + 28);
  }
  if ((v5 & 0x20) != 0)
  {
    self->_endView = *((_DWORD *)v4 + 24);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
  if (*((_QWORD *)v4 + 4))
    -[GEOLogMsgEventTableBookingSession setBookTableAppId:](self, "setBookTableAppId:");
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 8) != 0)
  {
    self->_muid = *((_QWORD *)v4 + 9);
    *(_DWORD *)&self->_flags |= 8u;
    v6 = *((_DWORD *)v4 + 28);
    if ((v6 & 2) == 0)
    {
LABEL_11:
      if ((v6 & 1) == 0)
        goto LABEL_12;
      goto LABEL_33;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_blurredReservationTimestamp = *((_QWORD *)v4 + 3);
  *(_DWORD *)&self->_flags |= 2u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 1) == 0)
  {
LABEL_12:
    if ((v6 & 4) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  self->_blurredBookingTimestamp = *((_QWORD *)v4 + 2);
  *(_DWORD *)&self->_flags |= 1u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 4) == 0)
  {
LABEL_13:
    if ((v6 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_34:
  self->_durationOfSessionInSeconds = *((double *)v4 + 6);
  *(_DWORD *)&self->_flags |= 4u;
  if ((*((_DWORD *)v4 + 28) & 0x200) != 0)
  {
LABEL_14:
    self->_installNeeded = *((_BYTE *)v4 + 106);
    *(_DWORD *)&self->_flags |= 0x200u;
  }
LABEL_15:
  if (*((_QWORD *)v4 + 8))
    -[GEOLogMsgEventTableBookingSession setInstallNeededTappedAppId:](self, "setInstallNeededTappedAppId:");
  v7 = *((_DWORD *)v4 + 28);
  if ((v7 & 0x100) != 0)
  {
    self->_installCompleted = *((_BYTE *)v4 + 105);
    *(_DWORD *)&self->_flags |= 0x100u;
    v7 = *((_DWORD *)v4 + 28);
    if ((v7 & 0x40) == 0)
    {
LABEL_19:
      if ((v7 & 0x80) == 0)
        goto LABEL_20;
      goto LABEL_38;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_19;
  }
  self->_tableSize = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_flags |= 0x40u;
  v7 = *((_DWORD *)v4 + 28);
  if ((v7 & 0x80) == 0)
  {
LABEL_20:
    if ((v7 & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_39;
  }
LABEL_38:
  self->_addedSpecialRequest = *((_BYTE *)v4 + 104);
  *(_DWORD *)&self->_flags |= 0x80u;
  v7 = *((_DWORD *)v4 + 28);
  if ((v7 & 0x400) == 0)
  {
LABEL_21:
    if ((v7 & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_39:
  self->_swipedAvailableTimes = *((_BYTE *)v4 + 107);
  *(_DWORD *)&self->_flags |= 0x400u;
  if ((*((_DWORD *)v4 + 28) & 0x800) != 0)
  {
LABEL_22:
    self->_tappedDatePicker = *((_BYTE *)v4 + 108);
    *(_DWORD *)&self->_flags |= 0x800u;
  }
LABEL_23:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *((id *)v4 + 7);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[GEOLogMsgEventTableBookingSession addErrorMessage:](self, "addErrorMessage:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installNeededTappedAppId, 0);
  objc_storeStrong((id *)&self->_errorMessages, 0);
  objc_storeStrong((id *)&self->_bookTableSessionId, 0);
  objc_storeStrong((id *)&self->_bookTableAppId, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
