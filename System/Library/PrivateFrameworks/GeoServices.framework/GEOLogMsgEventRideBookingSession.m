@implementation GEOLogMsgEventRideBookingSession

- (GEOLogMsgEventRideBookingSession)init
{
  GEOLogMsgEventRideBookingSession *v2;
  GEOLogMsgEventRideBookingSession *v3;
  GEOLogMsgEventRideBookingSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventRideBookingSession;
  v2 = -[GEOLogMsgEventRideBookingSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventRideBookingSession)initWithData:(id)a3
{
  GEOLogMsgEventRideBookingSession *v3;
  GEOLogMsgEventRideBookingSession *v4;
  GEOLogMsgEventRideBookingSession *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventRideBookingSession;
  v3 = -[GEOLogMsgEventRideBookingSession initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRideBookingSessionId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 142) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookingSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRideBookingSessionId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRideBookingSessionId
{
  -[GEOLogMsgEventRideBookingSession _readRideBookingSessionId]((uint64_t)self);
  return self->_rideBookingSessionId != 0;
}

- (NSString)rideBookingSessionId
{
  -[GEOLogMsgEventRideBookingSession _readRideBookingSessionId]((uint64_t)self);
  return self->_rideBookingSessionId;
}

- (void)setRideBookingSessionId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xA00000u;
  objc_storeStrong((id *)&self->_rideBookingSessionId, a3);
}

- (int)endState
{
  os_unfair_lock_s *p_readerLock;
  $150E7F75803E167E6CE7D122FD23A4FB flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 8) != 0)
    return self->_endState;
  else
    return 0;
}

- (void)setEndState:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800008u;
  self->_endState = a3;
}

- (void)setHasEndState:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388616;
  else
    v3 = 0x800000;
  self->_flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasEndState
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)endStateAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C21A40[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEndState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBES_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBES_BOOKED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBES_ABANDONED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBES_SUSPENDED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBES_PUNCHED_OUT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RBES_ERROR")))
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
  $150E7F75803E167E6CE7D122FD23A4FB flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x10) != 0)
    return self->_endView;
  else
    return 0;
}

- (void)setEndView:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800010u;
  self->_endView = a3;
}

- (void)setHasEndView:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388624;
  else
    v3 = 0x800000;
  self->_flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasEndView
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)endViewAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C21A70[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEndView:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBV_NOT_SET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBV_RIDE_OPTIONS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBV_DETAILS_PICKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBV_CONFIRMATION_REQUESTING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RBV_CONFIRMATION_CONFIRMED")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readRideAppId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 142) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookingSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRideAppId_tags_204);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRideAppId
{
  -[GEOLogMsgEventRideBookingSession _readRideAppId]((uint64_t)self);
  return self->_rideAppId != 0;
}

- (NSString)rideAppId
{
  -[GEOLogMsgEventRideBookingSession _readRideAppId]((uint64_t)self);
  return self->_rideAppId;
}

- (void)setRideAppId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x880000u;
  objc_storeStrong((id *)&self->_rideAppId, a3);
}

- (void)_readOriginBlurred
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 142) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookingSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginBlurred_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasOriginBlurred
{
  -[GEOLogMsgEventRideBookingSession _readOriginBlurred]((uint64_t)self);
  return self->_originBlurred != 0;
}

- (GEOLatLng)originBlurred
{
  -[GEOLogMsgEventRideBookingSession _readOriginBlurred]((uint64_t)self);
  return self->_originBlurred;
}

- (void)setOriginBlurred:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x840000u;
  objc_storeStrong((id *)&self->_originBlurred, a3);
}

- (void)_readDestinationBlurred
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 141) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookingSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestinationBlurred_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasDestinationBlurred
{
  -[GEOLogMsgEventRideBookingSession _readDestinationBlurred]((uint64_t)self);
  return self->_destinationBlurred != 0;
}

- (GEOLatLng)destinationBlurred
{
  -[GEOLogMsgEventRideBookingSession _readDestinationBlurred]((uint64_t)self);
  return self->_destinationBlurred;
}

- (void)setDestinationBlurred:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x808000u;
  objc_storeStrong((id *)&self->_destinationBlurred, a3);
}

- (BOOL)exploredOtherOptions
{
  return self->_exploredOtherOptions;
}

- (void)setExploredOtherOptions:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x800100u;
  self->_exploredOtherOptions = a3;
}

- (void)setHasExploredOtherOptions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388864;
  else
    v3 = 0x800000;
  self->_flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasExploredOtherOptions
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (void)_readRideType
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 142) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookingSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRideType_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRideType
{
  -[GEOLogMsgEventRideBookingSession _readRideType]((uint64_t)self);
  return self->_rideType != 0;
}

- (NSString)rideType
{
  -[GEOLogMsgEventRideBookingSession _readRideType]((uint64_t)self);
  return self->_rideType;
}

- (void)setRideType:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xC00000u;
  objc_storeStrong((id *)&self->_rideType, a3);
}

- (double)distanceToPickupInMeters
{
  return self->_distanceToPickupInMeters;
}

- (void)setDistanceToPickupInMeters:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x800001u;
  self->_distanceToPickupInMeters = a3;
}

- (void)setHasDistanceToPickupInMeters:(BOOL)a3
{
  self->_flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x800000);
}

- (BOOL)hasDistanceToPickupInMeters
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)paymentIsApplePay
{
  return self->_paymentIsApplePay;
}

- (void)setPaymentIsApplePay:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x800800u;
  self->_paymentIsApplePay = a3;
}

- (void)setHasPaymentIsApplePay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8390656;
  else
    v3 = 0x800000;
  self->_flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasPaymentIsApplePay
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (unsigned)numberOfAvailableExtensions
{
  return self->_numberOfAvailableExtensions;
}

- (void)setNumberOfAvailableExtensions:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800020u;
  self->_numberOfAvailableExtensions = a3;
}

- (void)setHasNumberOfAvailableExtensions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388640;
  else
    v3 = 0x800000;
  self->_flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasNumberOfAvailableExtensions
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (BOOL)switchedApp
{
  return self->_switchedApp;
}

- (void)setSwitchedApp:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x802000u;
  self->_switchedApp = a3;
}

- (void)setHasSwitchedApp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8396800;
  else
    v3 = 0x800000;
  self->_flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasSwitchedApp
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (BOOL)showedSurgePricingAlert
{
  return self->_showedSurgePricingAlert;
}

- (void)setShowedSurgePricingAlert:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x801000u;
  self->_showedSurgePricingAlert = a3;
}

- (void)setHasShowedSurgePricingAlert:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8392704;
  else
    v3 = 0x800000;
  self->_flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasShowedSurgePricingAlert
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (double)durationOfSessionInSeconds
{
  return self->_durationOfSessionInSeconds;
}

- (void)setDurationOfSessionInSeconds:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x800002u;
  self->_durationOfSessionInSeconds = a3;
}

- (void)setHasDurationOfSessionInSeconds:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388610;
  else
    v3 = 0x800000;
  self->_flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasDurationOfSessionInSeconds
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)installedApp
{
  return self->_installedApp;
}

- (void)setInstalledApp:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x800200u;
  self->_installedApp = a3;
}

- (void)setHasInstalledApp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8389120;
  else
    v3 = 0x800000;
  self->_flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasInstalledApp
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (int64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x800004u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388612;
  else
    v3 = 0x800000;
  self->_flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)unavailable
{
  return self->_unavailable;
}

- (void)setUnavailable:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x804000u;
  self->_unavailable = a3;
}

- (void)setHasUnavailable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8404992;
  else
    v3 = 0x800000;
  self->_flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v3);
}

- (BOOL)hasUnavailable
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (BOOL)movedPickupLocation
{
  return self->_movedPickupLocation;
}

- (void)setMovedPickupLocation:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x800400u;
  self->_movedPickupLocation = a3;
}

- (void)setHasMovedPickupLocation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8389632;
  else
    v3 = 0x800000;
  self->_flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasMovedPickupLocation
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)_readErrorMessages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 142) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookingSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readErrorMessages_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (NSMutableArray)errorMessages
{
  -[GEOLogMsgEventRideBookingSession _readErrorMessages]((uint64_t)self);
  return self->_errorMessages;
}

- (void)setErrorMessages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *errorMessages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x800000u;
  errorMessages = self->_errorMessages;
  self->_errorMessages = v4;

}

- (void)clearErrorMessages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x800000u;
  -[NSMutableArray removeAllObjects](self->_errorMessages, "removeAllObjects");
}

- (void)addErrorMessage:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventRideBookingSession _readErrorMessages]((uint64_t)self);
  -[GEOLogMsgEventRideBookingSession _addNoFlagsErrorMessage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x800000u;
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
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)errorMessagesCount
{
  -[GEOLogMsgEventRideBookingSession _readErrorMessages]((uint64_t)self);
  return -[NSMutableArray count](self->_errorMessages, "count");
}

- (id)errorMessageAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventRideBookingSession _readErrorMessages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_errorMessages, "objectAtIndex:", a3);
}

+ (Class)errorMessageType
{
  return (Class)objc_opt_class();
}

- (void)_readRideAppVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 142) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookingSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRideAppVersion_tags_205);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRideAppVersion
{
  -[GEOLogMsgEventRideBookingSession _readRideAppVersion]((uint64_t)self);
  return self->_rideAppVersion != 0;
}

- (NSString)rideAppVersion
{
  -[GEOLogMsgEventRideBookingSession _readRideAppVersion]((uint64_t)self);
  return self->_rideAppVersion;
}

- (void)setRideAppVersion:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x900000u;
  objc_storeStrong((id *)&self->_rideAppVersion, a3);
}

- (BOOL)comparedRideOptions
{
  return self->_comparedRideOptions;
}

- (void)setComparedRideOptions:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x800080u;
  self->_comparedRideOptions = a3;
}

- (void)setHasComparedRideOptions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388736;
  else
    v3 = 0x800000;
  self->_flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFF7FFF7F | v3);
}

- (BOOL)hasComparedRideOptions
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (int)statusIssue
{
  os_unfair_lock_s *p_readerLock;
  $150E7F75803E167E6CE7D122FD23A4FB flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x40) != 0)
    return self->_statusIssue;
  else
    return 0;
}

- (void)setStatusIssue:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800040u;
  self->_statusIssue = a3;
}

- (void)setHasStatusIssue:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388672;
  else
    v3 = 0x800000;
  self->_flags = ($150E7F75803E167E6CE7D122FD23A4FB)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasStatusIssue
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (id)statusIssueAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C21A98[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatusIssue:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBSI_NOT_SET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBSI_MISSING_RIDE_OPTION_NAME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBSI_MISSING_RIDE_IDENTIFIER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RBSI_MISSING_RIDE_ETA")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readIntentResponseFailures
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 142) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookingSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIntentResponseFailures_tags_206);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (NSMutableArray)intentResponseFailures
{
  -[GEOLogMsgEventRideBookingSession _readIntentResponseFailures]((uint64_t)self);
  return self->_intentResponseFailures;
}

- (void)setIntentResponseFailures:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *intentResponseFailures;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x800000u;
  intentResponseFailures = self->_intentResponseFailures;
  self->_intentResponseFailures = v4;

}

- (void)clearIntentResponseFailures
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x800000u;
  -[NSMutableArray removeAllObjects](self->_intentResponseFailures, "removeAllObjects");
}

- (void)addIntentResponseFailure:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventRideBookingSession _readIntentResponseFailures]((uint64_t)self);
  -[GEOLogMsgEventRideBookingSession _addNoFlagsIntentResponseFailure:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x800000u;
}

- (void)_addNoFlagsIntentResponseFailure:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)intentResponseFailuresCount
{
  -[GEOLogMsgEventRideBookingSession _readIntentResponseFailures]((uint64_t)self);
  return -[NSMutableArray count](self->_intentResponseFailures, "count");
}

- (id)intentResponseFailureAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventRideBookingSession _readIntentResponseFailures]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_intentResponseFailures, "objectAtIndex:", a3);
}

+ (Class)intentResponseFailureType
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
  v8.super_class = (Class)GEOLogMsgEventRideBookingSession;
  -[GEOLogMsgEventRideBookingSession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventRideBookingSession dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventRideBookingSession _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  int v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  int v35;
  void *v36;
  const __CFString *v37;
  uint64_t v38;
  __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  void *v63;
  void *v64;
  const __CFString *v65;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "rideBookingSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("rideBookingSessionId");
    else
      v6 = CFSTR("ride_booking_session_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  v7 = *(_DWORD *)(a1 + 140);
  if ((v7 & 8) != 0)
  {
    v8 = *(int *)(a1 + 116);
    if (v8 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 116));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E1C21A40[v8];
    }
    if (a2)
      v10 = CFSTR("endState");
    else
      v10 = CFSTR("end_state");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

    v7 = *(_DWORD *)(a1 + 140);
  }
  if ((v7 & 0x10) != 0)
  {
    v11 = *(int *)(a1 + 120);
    if (v11 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 120));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E1C21A70[v11];
    }
    if (a2)
      v13 = CFSTR("endView");
    else
      v13 = CFSTR("end_view");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  objc_msgSend((id)a1, "rideAppId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (a2)
      v15 = CFSTR("rideAppId");
    else
      v15 = CFSTR("ride_app_id");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);
  }

  objc_msgSend((id)a1, "originBlurred");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("originBlurred");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("origin_blurred");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  objc_msgSend((id)a1, "destinationBlurred");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v20, "jsonRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("destinationBlurred");
    }
    else
    {
      objc_msgSend(v20, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("destination_blurred");
    }
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  if ((*(_BYTE *)(a1 + 141) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 133));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("exploredOtherOptions");
    else
      v25 = CFSTR("explored_other_options");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  objc_msgSend((id)a1, "rideType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    if (a2)
      v27 = CFSTR("rideType");
    else
      v27 = CFSTR("ride_type");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);
  }

  v28 = *(_DWORD *)(a1 + 140);
  if ((v28 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v41 = CFSTR("distanceToPickupInMeters");
    else
      v41 = CFSTR("distance_to_pickup_in_meters");
    objc_msgSend(v4, "setObject:forKey:", v40, v41);

    v28 = *(_DWORD *)(a1 + 140);
    if ((v28 & 0x800) == 0)
    {
LABEL_50:
      if ((v28 & 0x20) == 0)
        goto LABEL_51;
      goto LABEL_88;
    }
  }
  else if ((v28 & 0x800) == 0)
  {
    goto LABEL_50;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 136));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v43 = CFSTR("paymentIsApplePay");
  else
    v43 = CFSTR("payment_is_apple_pay");
  objc_msgSend(v4, "setObject:forKey:", v42, v43);

  v28 = *(_DWORD *)(a1 + 140);
  if ((v28 & 0x20) == 0)
  {
LABEL_51:
    if ((v28 & 0x2000) == 0)
      goto LABEL_52;
    goto LABEL_92;
  }
LABEL_88:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 124));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v45 = CFSTR("numberOfAvailableExtensions");
  else
    v45 = CFSTR("number_of_available_extensions");
  objc_msgSend(v4, "setObject:forKey:", v44, v45);

  v28 = *(_DWORD *)(a1 + 140);
  if ((v28 & 0x2000) == 0)
  {
LABEL_52:
    if ((v28 & 0x1000) == 0)
      goto LABEL_53;
    goto LABEL_96;
  }
LABEL_92:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 138));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v47 = CFSTR("switchedApp");
  else
    v47 = CFSTR("switched_app");
  objc_msgSend(v4, "setObject:forKey:", v46, v47);

  v28 = *(_DWORD *)(a1 + 140);
  if ((v28 & 0x1000) == 0)
  {
LABEL_53:
    if ((v28 & 2) == 0)
      goto LABEL_54;
    goto LABEL_100;
  }
LABEL_96:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 137));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v49 = CFSTR("showedSurgePricingAlert");
  else
    v49 = CFSTR("showed_surge_pricing_alert");
  objc_msgSend(v4, "setObject:forKey:", v48, v49);

  v28 = *(_DWORD *)(a1 + 140);
  if ((v28 & 2) == 0)
  {
LABEL_54:
    if ((v28 & 0x200) == 0)
      goto LABEL_55;
    goto LABEL_104;
  }
LABEL_100:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v51 = CFSTR("durationOfSessionInSeconds");
  else
    v51 = CFSTR("duration_of_session_in_seconds");
  objc_msgSend(v4, "setObject:forKey:", v50, v51);

  v28 = *(_DWORD *)(a1 + 140);
  if ((v28 & 0x200) == 0)
  {
LABEL_55:
    if ((v28 & 4) == 0)
      goto LABEL_56;
    goto LABEL_108;
  }
LABEL_104:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 134));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v53 = CFSTR("installedApp");
  else
    v53 = CFSTR("installed_app");
  objc_msgSend(v4, "setObject:forKey:", v52, v53);

  v28 = *(_DWORD *)(a1 + 140);
  if ((v28 & 4) == 0)
  {
LABEL_56:
    if ((v28 & 0x4000) == 0)
      goto LABEL_57;
LABEL_109:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 139));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v55, CFSTR("unavailable"));

    if ((*(_DWORD *)(a1 + 140) & 0x400) != 0)
      goto LABEL_58;
    goto LABEL_62;
  }
LABEL_108:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 96));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("timestamp"));

  v28 = *(_DWORD *)(a1 + 140);
  if ((v28 & 0x4000) != 0)
    goto LABEL_109;
LABEL_57:
  if ((v28 & 0x400) != 0)
  {
LABEL_58:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 135));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v30 = CFSTR("movedPickupLocation");
    else
      v30 = CFSTR("moved_pickup_location");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
LABEL_62:
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend((id)a1, "errorMessages");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v32 = CFSTR("errorMessage");
    else
      v32 = CFSTR("error_message");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
  objc_msgSend((id)a1, "rideAppVersion");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    if (a2)
      v34 = CFSTR("rideAppVersion");
    else
      v34 = CFSTR("ride_app_version");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);
  }

  v35 = *(_DWORD *)(a1 + 140);
  if ((v35 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 132));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v37 = CFSTR("comparedRideOptions");
    else
      v37 = CFSTR("compared_ride_options");
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

    v35 = *(_DWORD *)(a1 + 140);
  }
  if ((v35 & 0x40) != 0)
  {
    v38 = *(int *)(a1 + 128);
    if (v38 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 128));
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = off_1E1C21A98[v38];
    }
    if (a2)
      v56 = CFSTR("statusIssue");
    else
      v56 = CFSTR("status_issue");
    objc_msgSend(v4, "setObject:forKey:", v39, v56);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v58 = *(id *)(a1 + 48);
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v60; ++i)
        {
          if (*(_QWORD *)v68 != v61)
            objc_enumerationMutation(v58);
          v63 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v63, "jsonRepresentation");
          else
            objc_msgSend(v63, "dictionaryRepresentation");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addObject:", v64);

        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      }
      while (v60);
    }

    if (a2)
      v65 = CFSTR("intentResponseFailure");
    else
      v65 = CFSTR("intent_response_failure");
    objc_msgSend(v4, "setObject:forKey:", v57, v65);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventRideBookingSession _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventRideBookingSession)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventRideBookingSession *)-[GEOLogMsgEventRideBookingSession _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  GEOLatLng *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  GEOLatLng *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  id v71;
  uint64_t v72;
  const __CFString *v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t j;
  uint64_t v80;
  GEORideBookingIntentResponseFailure *v81;
  uint64_t v82;
  void *v83;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1 || (v6 = (id)objc_msgSend(a1, "init"), v6, !v6))
  {
    v14 = 0;
    goto LABEL_183;
  }
  if (a3)
    v7 = CFSTR("rideBookingSessionId");
  else
    v7 = CFSTR("ride_booking_session_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v6, "setRideBookingSessionId:", v9);

  }
  if (a3)
    v10 = CFSTR("endState");
  else
    v10 = CFSTR("end_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("RBES_UNKNOWN")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("RBES_BOOKED")) & 1) != 0)
    {
      v13 = 1;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("RBES_ABANDONED")) & 1) != 0)
    {
      v13 = 2;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("RBES_SUSPENDED")) & 1) != 0)
    {
      v13 = 3;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("RBES_PUNCHED_OUT")) & 1) != 0)
    {
      v13 = 4;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("RBES_ERROR")))
    {
      v13 = 5;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_30;
    v13 = objc_msgSend(v11, "intValue");
  }
  objc_msgSend(v6, "setEndState:", v13);
LABEL_30:

  if (a3)
    v15 = CFSTR("endView");
  else
    v15 = CFSTR("end_view");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v16;
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RBV_NOT_SET")) & 1) != 0)
    {
      v18 = 0;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RBV_RIDE_OPTIONS")) & 1) != 0)
    {
      v18 = 1;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RBV_DETAILS_PICKING")) & 1) != 0)
    {
      v18 = 2;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RBV_CONFIRMATION_REQUESTING")) & 1) != 0)
    {
      v18 = 3;
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("RBV_CONFIRMATION_CONFIRMED")))
    {
      v18 = 4;
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_49;
    v18 = objc_msgSend(v16, "intValue");
  }
  objc_msgSend(v6, "setEndView:", v18);
LABEL_49:

  if (a3)
    v19 = CFSTR("rideAppId");
  else
    v19 = CFSTR("ride_app_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v6, "setRideAppId:", v21);

  }
  if (a3)
    v22 = CFSTR("originBlurred");
  else
    v22 = CFSTR("origin_blurred");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v25 = -[GEOLatLng initWithJSON:](v24, "initWithJSON:", v23);
    else
      v25 = -[GEOLatLng initWithDictionary:](v24, "initWithDictionary:", v23);
    v26 = (void *)v25;
    objc_msgSend(v6, "setOriginBlurred:", v25);

  }
  if (a3)
    v27 = CFSTR("destinationBlurred");
  else
    v27 = CFSTR("destination_blurred");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v30 = -[GEOLatLng initWithJSON:](v29, "initWithJSON:", v28);
    else
      v30 = -[GEOLatLng initWithDictionary:](v29, "initWithDictionary:", v28);
    v31 = (void *)v30;
    objc_msgSend(v6, "setDestinationBlurred:", v30);

  }
  if (a3)
    v32 = CFSTR("exploredOtherOptions");
  else
    v32 = CFSTR("explored_other_options");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setExploredOtherOptions:", objc_msgSend(v33, "BOOLValue"));

  if (a3)
    v34 = CFSTR("rideType");
  else
    v34 = CFSTR("ride_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = (void *)objc_msgSend(v35, "copy");
    objc_msgSend(v6, "setRideType:", v36);

  }
  if (a3)
    v37 = CFSTR("distanceToPickupInMeters");
  else
    v37 = CFSTR("distance_to_pickup_in_meters");
  objc_msgSend(v5, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v38, "doubleValue");
    objc_msgSend(v6, "setDistanceToPickupInMeters:");
  }

  if (a3)
    v39 = CFSTR("paymentIsApplePay");
  else
    v39 = CFSTR("payment_is_apple_pay");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setPaymentIsApplePay:", objc_msgSend(v40, "BOOLValue"));

  if (a3)
    v41 = CFSTR("numberOfAvailableExtensions");
  else
    v41 = CFSTR("number_of_available_extensions");
  objc_msgSend(v5, "objectForKeyedSubscript:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setNumberOfAvailableExtensions:", objc_msgSend(v42, "unsignedIntValue"));

  if (a3)
    v43 = CFSTR("switchedApp");
  else
    v43 = CFSTR("switched_app");
  objc_msgSend(v5, "objectForKeyedSubscript:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSwitchedApp:", objc_msgSend(v44, "BOOLValue"));

  if (a3)
    v45 = CFSTR("showedSurgePricingAlert");
  else
    v45 = CFSTR("showed_surge_pricing_alert");
  objc_msgSend(v5, "objectForKeyedSubscript:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setShowedSurgePricingAlert:", objc_msgSend(v46, "BOOLValue"));

  if (a3)
    v47 = CFSTR("durationOfSessionInSeconds");
  else
    v47 = CFSTR("duration_of_session_in_seconds");
  objc_msgSend(v5, "objectForKeyedSubscript:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v48, "doubleValue");
    objc_msgSend(v6, "setDurationOfSessionInSeconds:");
  }

  if (a3)
    v49 = CFSTR("installedApp");
  else
    v49 = CFSTR("installed_app");
  objc_msgSend(v5, "objectForKeyedSubscript:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setInstalledApp:", objc_msgSend(v50, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setTimestamp:", objc_msgSend(v51, "longLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("unavailable"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setUnavailable:", objc_msgSend(v52, "BOOLValue"));

  if (a3)
    v53 = CFSTR("movedPickupLocation");
  else
    v53 = CFSTR("moved_pickup_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setMovedPickupLocation:", objc_msgSend(v54, "BOOLValue"));

  if (a3)
    v55 = CFSTR("errorMessage");
  else
    v55 = CFSTR("error_message");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v85 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v57 = v56;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v59; ++i)
        {
          if (*(_QWORD *)v91 != v60)
            objc_enumerationMutation(v57);
          v62 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v63 = (void *)objc_msgSend(v62, "copy");
            objc_msgSend(v6, "addErrorMessage:", v63);

          }
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
      }
      while (v59);
    }

    v5 = v85;
  }

  if (a3)
    v64 = CFSTR("rideAppVersion");
  else
    v64 = CFSTR("ride_app_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v66 = (void *)objc_msgSend(v65, "copy");
    objc_msgSend(v6, "setRideAppVersion:", v66);

  }
  if (a3)
    v67 = CFSTR("comparedRideOptions");
  else
    v67 = CFSTR("compared_ride_options");
  objc_msgSend(v5, "objectForKeyedSubscript:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setComparedRideOptions:", objc_msgSend(v68, "BOOLValue"));

  if (a3)
    v69 = CFSTR("statusIssue");
  else
    v69 = CFSTR("status_issue");
  objc_msgSend(v5, "objectForKeyedSubscript:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v71 = v70;
    if ((objc_msgSend(v71, "isEqualToString:", CFSTR("RBSI_NOT_SET")) & 1) != 0)
    {
      v72 = 0;
    }
    else if ((objc_msgSend(v71, "isEqualToString:", CFSTR("RBSI_MISSING_RIDE_OPTION_NAME")) & 1) != 0)
    {
      v72 = 1;
    }
    else if ((objc_msgSend(v71, "isEqualToString:", CFSTR("RBSI_MISSING_RIDE_IDENTIFIER")) & 1) != 0)
    {
      v72 = 2;
    }
    else if (objc_msgSend(v71, "isEqualToString:", CFSTR("RBSI_MISSING_RIDE_ETA")))
    {
      v72 = 3;
    }
    else
    {
      v72 = 0;
    }

    goto LABEL_164;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v72 = objc_msgSend(v70, "intValue");
LABEL_164:
    objc_msgSend(v6, "setStatusIssue:", v72);
  }

  if (a3)
    v73 = CFSTR("intentResponseFailure");
  else
    v73 = CFSTR("intent_response_failure");
  objc_msgSend(v5, "objectForKeyedSubscript:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v75 = v74;
    v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
    if (v76)
    {
      v77 = v76;
      v78 = *(_QWORD *)v87;
      do
      {
        for (j = 0; j != v77; ++j)
        {
          if (*(_QWORD *)v87 != v78)
            objc_enumerationMutation(v75);
          v80 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v81 = [GEORideBookingIntentResponseFailure alloc];
            if ((a3 & 1) != 0)
              v82 = -[GEORideBookingIntentResponseFailure initWithJSON:](v81, "initWithJSON:", v80);
            else
              v82 = -[GEORideBookingIntentResponseFailure initWithDictionary:](v81, "initWithDictionary:", v80);
            v83 = (void *)v82;
            objc_msgSend(v6, "addIntentResponseFailure:", v82);

          }
        }
        v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
      }
      while (v77);
    }

    v5 = v85;
  }

  v14 = v6;
LABEL_183:

  return v14;
}

- (GEOLogMsgEventRideBookingSession)initWithJSON:(id)a3
{
  return (GEOLogMsgEventRideBookingSession *)-[GEOLogMsgEventRideBookingSession _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_280_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_281_0;
    GEOLogMsgEventRideBookingSessionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgEventRideBookingSessionCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventRideBookingSessionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventRideBookingSessionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $150E7F75803E167E6CE7D122FD23A4FB flags;
  $150E7F75803E167E6CE7D122FD23A4FB v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  $150E7F75803E167E6CE7D122FD23A4FB v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  PBDataReader *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0xFF8000) == 0)
    {
      v17 = self->_reader;
      objc_sync_enter(v17);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v18);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v17);
      goto LABEL_62;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventRideBookingSession readAll:](self, "readAll:", 0);
  if (self->_rideBookingSessionId)
    PBDataWriterWriteStringField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_rideAppId)
    PBDataWriterWriteStringField();
  if (self->_originBlurred)
    PBDataWriterWriteSubmessage();
  if (self->_destinationBlurred)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_rideType)
    PBDataWriterWriteStringField();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v7 = self->_flags;
    if ((*(_WORD *)&v7 & 0x800) == 0)
    {
LABEL_21:
      if ((*(_BYTE *)&v7 & 0x20) == 0)
        goto LABEL_22;
      goto LABEL_53;
    }
  }
  else if ((*(_WORD *)&v7 & 0x800) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteBOOLField();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v7 & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v7 & 0x1000) == 0)
      goto LABEL_24;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteBOOLField();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v7 & 2) == 0)
      goto LABEL_25;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteBOOLField();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 2) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v7 & 0x200) == 0)
      goto LABEL_26;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteDoubleField();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v7 & 4) == 0)
      goto LABEL_27;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 4) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v7 & 0x4000) == 0)
      goto LABEL_28;
LABEL_59:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_flags & 0x400) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_58:
  PBDataWriterWriteInt64Field();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x4000) != 0)
    goto LABEL_59;
LABEL_28:
  if ((*(_WORD *)&v7 & 0x400) != 0)
LABEL_29:
    PBDataWriterWriteBOOLField();
LABEL_30:
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = self->_errorMessages;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v8);
        PBDataWriterWriteStringField();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  if (self->_rideAppVersion)
    PBDataWriterWriteStringField();
  v12 = self->_flags;
  if ((*(_BYTE *)&v12 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_flags;
  }
  if ((*(_BYTE *)&v12 & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = self->_intentResponseFailures;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

LABEL_62:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOLogMsgEventRideBookingSession _readDestinationBlurred]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_destinationBlurred, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOLogMsgEventRideBookingSession _readOriginBlurred]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_originBlurred, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  $150E7F75803E167E6CE7D122FD23A4FB flags;
  id *v5;
  $150E7F75803E167E6CE7D122FD23A4FB v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  $150E7F75803E167E6CE7D122FD23A4FB v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t j;
  void *v15;
  id *v16;

  v16 = (id *)a3;
  -[GEOLogMsgEventRideBookingSession readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 26) = self->_readerMarkPos;
  *((_DWORD *)v16 + 27) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_rideBookingSessionId)
    objc_msgSend(v16, "setRideBookingSessionId:");
  flags = self->_flags;
  v5 = v16;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    *((_DWORD *)v16 + 29) = self->_endState;
    *((_DWORD *)v16 + 35) |= 8u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    *((_DWORD *)v16 + 30) = self->_endView;
    *((_DWORD *)v16 + 35) |= 0x10u;
  }
  if (self->_rideAppId)
  {
    objc_msgSend(v16, "setRideAppId:");
    v5 = v16;
  }
  if (self->_originBlurred)
  {
    objc_msgSend(v16, "setOriginBlurred:");
    v5 = v16;
  }
  if (self->_destinationBlurred)
  {
    objc_msgSend(v16, "setDestinationBlurred:");
    v5 = v16;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *((_BYTE *)v5 + 133) = self->_exploredOtherOptions;
    *((_DWORD *)v5 + 35) |= 0x100u;
  }
  if (self->_rideType)
  {
    objc_msgSend(v16, "setRideType:");
    v5 = v16;
  }
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 1) != 0)
  {
    v5[3] = *(id *)&self->_distanceToPickupInMeters;
    *((_DWORD *)v5 + 35) |= 1u;
    v6 = self->_flags;
    if ((*(_WORD *)&v6 & 0x800) == 0)
    {
LABEL_19:
      if ((*(_BYTE *)&v6 & 0x20) == 0)
        goto LABEL_20;
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&v6 & 0x800) == 0)
  {
    goto LABEL_19;
  }
  *((_BYTE *)v5 + 136) = self->_paymentIsApplePay;
  *((_DWORD *)v5 + 35) |= 0x800u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v5 + 31) = self->_numberOfAvailableExtensions;
  *((_DWORD *)v5 + 35) |= 0x20u;
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  *((_BYTE *)v5 + 138) = self->_switchedApp;
  *((_DWORD *)v5 + 35) |= 0x2000u;
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v6 & 2) == 0)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_47:
  *((_BYTE *)v5 + 137) = self->_showedSurgePricingAlert;
  *((_DWORD *)v5 + 35) |= 0x1000u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 2) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_49;
  }
LABEL_48:
  v5[4] = *(id *)&self->_durationOfSessionInSeconds;
  *((_DWORD *)v5 + 35) |= 2u;
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_25;
    goto LABEL_50;
  }
LABEL_49:
  *((_BYTE *)v5 + 134) = self->_installedApp;
  *((_DWORD *)v5 + 35) |= 0x200u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_26;
LABEL_51:
    *((_BYTE *)v5 + 139) = self->_unavailable;
    *((_DWORD *)v5 + 35) |= 0x4000u;
    if ((*(_DWORD *)&self->_flags & 0x400) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_50:
  v5[12] = (id)self->_timestamp;
  *((_DWORD *)v5 + 35) |= 4u;
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
    goto LABEL_51;
LABEL_26:
  if ((*(_WORD *)&v6 & 0x400) != 0)
  {
LABEL_27:
    *((_BYTE *)v5 + 135) = self->_movedPickupLocation;
    *((_DWORD *)v5 + 35) |= 0x400u;
  }
LABEL_28:
  if (-[GEOLogMsgEventRideBookingSession errorMessagesCount](self, "errorMessagesCount"))
  {
    objc_msgSend(v16, "clearErrorMessages");
    v7 = -[GEOLogMsgEventRideBookingSession errorMessagesCount](self, "errorMessagesCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[GEOLogMsgEventRideBookingSession errorMessageAtIndex:](self, "errorMessageAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addErrorMessage:", v10);

      }
    }
  }
  if (self->_rideAppVersion)
    objc_msgSend(v16, "setRideAppVersion:");
  v11 = self->_flags;
  if ((*(_BYTE *)&v11 & 0x80) != 0)
  {
    *((_BYTE *)v16 + 132) = self->_comparedRideOptions;
    *((_DWORD *)v16 + 35) |= 0x80u;
    v11 = self->_flags;
  }
  if ((*(_BYTE *)&v11 & 0x40) != 0)
  {
    *((_DWORD *)v16 + 32) = self->_statusIssue;
    *((_DWORD *)v16 + 35) |= 0x40u;
  }
  if (-[GEOLogMsgEventRideBookingSession intentResponseFailuresCount](self, "intentResponseFailuresCount"))
  {
    objc_msgSend(v16, "clearIntentResponseFailures");
    v12 = -[GEOLogMsgEventRideBookingSession intentResponseFailuresCount](self, "intentResponseFailuresCount");
    if (v12)
    {
      v13 = v12;
      for (j = 0; j != v13; ++j)
      {
        -[GEOLogMsgEventRideBookingSession intentResponseFailureAtIndex:](self, "intentResponseFailureAtIndex:", j);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addIntentResponseFailure:", v15);

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
  $150E7F75803E167E6CE7D122FD23A4FB flags;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  $150E7F75803E167E6CE7D122FD23A4FB v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  void *v27;
  $150E7F75803E167E6CE7D122FD23A4FB v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 0x80) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgEventRideBookingSessionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_40;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventRideBookingSession readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_rideBookingSessionId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v9;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 116) = self->_endState;
    *(_DWORD *)(v5 + 140) |= 8u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_endView;
    *(_DWORD *)(v5 + 140) |= 0x10u;
  }
  v12 = -[NSString copyWithZone:](self->_rideAppId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  v14 = -[GEOLatLng copyWithZone:](self->_originBlurred, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v16 = -[GEOLatLng copyWithZone:](self->_destinationBlurred, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;

  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *(_BYTE *)(v5 + 133) = self->_exploredOtherOptions;
    *(_DWORD *)(v5 + 140) |= 0x100u;
  }
  v18 = -[NSString copyWithZone:](self->_rideType, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v18;

  v20 = self->_flags;
  if ((*(_BYTE *)&v20 & 1) != 0)
  {
    *(double *)(v5 + 24) = self->_distanceToPickupInMeters;
    *(_DWORD *)(v5 + 140) |= 1u;
    v20 = self->_flags;
    if ((*(_WORD *)&v20 & 0x800) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&v20 & 0x20) == 0)
        goto LABEL_14;
      goto LABEL_43;
    }
  }
  else if ((*(_WORD *)&v20 & 0x800) == 0)
  {
    goto LABEL_13;
  }
  *(_BYTE *)(v5 + 136) = self->_paymentIsApplePay;
  *(_DWORD *)(v5 + 140) |= 0x800u;
  v20 = self->_flags;
  if ((*(_BYTE *)&v20 & 0x20) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v20 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v5 + 124) = self->_numberOfAvailableExtensions;
  *(_DWORD *)(v5 + 140) |= 0x20u;
  v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v20 & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  *(_BYTE *)(v5 + 138) = self->_switchedApp;
  *(_DWORD *)(v5 + 140) |= 0x2000u;
  v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&v20 & 2) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  *(_BYTE *)(v5 + 137) = self->_showedSurgePricingAlert;
  *(_DWORD *)(v5 + 140) |= 0x1000u;
  v20 = self->_flags;
  if ((*(_BYTE *)&v20 & 2) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v20 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  *(double *)(v5 + 32) = self->_durationOfSessionInSeconds;
  *(_DWORD *)(v5 + 140) |= 2u;
  v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x200) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v20 & 4) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  *(_BYTE *)(v5 + 134) = self->_installedApp;
  *(_DWORD *)(v5 + 140) |= 0x200u;
  v20 = self->_flags;
  if ((*(_BYTE *)&v20 & 4) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v20 & 0x4000) == 0)
      goto LABEL_20;
LABEL_49:
    *(_BYTE *)(v5 + 139) = self->_unavailable;
    *(_DWORD *)(v5 + 140) |= 0x4000u;
    if ((*(_DWORD *)&self->_flags & 0x400) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_48:
  *(_QWORD *)(v5 + 96) = self->_timestamp;
  *(_DWORD *)(v5 + 140) |= 4u;
  v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x4000) != 0)
    goto LABEL_49;
LABEL_20:
  if ((*(_WORD *)&v20 & 0x400) != 0)
  {
LABEL_21:
    *(_BYTE *)(v5 + 135) = self->_movedPickupLocation;
    *(_DWORD *)(v5 + 140) |= 0x400u;
  }
LABEL_22:
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v21 = self->_errorMessages;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v39 != v23)
          objc_enumerationMutation(v21);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addErrorMessage:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v22);
  }

  v26 = -[NSString copyWithZone:](self->_rideAppVersion, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v26;

  v28 = self->_flags;
  if ((*(_BYTE *)&v28 & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 132) = self->_comparedRideOptions;
    *(_DWORD *)(v5 + 140) |= 0x80u;
    v28 = self->_flags;
  }
  if ((*(_BYTE *)&v28 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_statusIssue;
    *(_DWORD *)(v5 + 140) |= 0x40u;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = self->_intentResponseFailures;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(v8);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v34);
        objc_msgSend((id)v5, "addIntentResponseFailure:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v29);
  }
LABEL_40:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *rideBookingSessionId;
  $150E7F75803E167E6CE7D122FD23A4FB flags;
  int v7;
  NSString *rideAppId;
  GEOLatLng *originBlurred;
  GEOLatLng *destinationBlurred;
  $150E7F75803E167E6CE7D122FD23A4FB v11;
  int v12;
  NSString *rideType;
  NSMutableArray *errorMessages;
  NSString *rideAppVersion;
  $150E7F75803E167E6CE7D122FD23A4FB v16;
  int v17;
  NSMutableArray *intentResponseFailures;
  char v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_118;
  -[GEOLogMsgEventRideBookingSession readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  rideBookingSessionId = self->_rideBookingSessionId;
  if ((unint64_t)rideBookingSessionId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](rideBookingSessionId, "isEqual:"))
      goto LABEL_118;
  }
  flags = self->_flags;
  v7 = *((_DWORD *)v4 + 35);
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_endState != *((_DWORD *)v4 + 29))
      goto LABEL_118;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_endView != *((_DWORD *)v4 + 30))
      goto LABEL_118;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_118;
  }
  rideAppId = self->_rideAppId;
  if ((unint64_t)rideAppId | *((_QWORD *)v4 + 8) && !-[NSString isEqual:](rideAppId, "isEqual:"))
    goto LABEL_118;
  originBlurred = self->_originBlurred;
  if ((unint64_t)originBlurred | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](originBlurred, "isEqual:"))
      goto LABEL_118;
  }
  destinationBlurred = self->_destinationBlurred;
  if ((unint64_t)destinationBlurred | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](destinationBlurred, "isEqual:"))
      goto LABEL_118;
  }
  v11 = self->_flags;
  v12 = *((_DWORD *)v4 + 35);
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0)
      goto LABEL_118;
    if (self->_exploredOtherOptions)
    {
      if (!*((_BYTE *)v4 + 133))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 133))
    {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_118;
  }
  rideType = self->_rideType;
  if ((unint64_t)rideType | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](rideType, "isEqual:"))
      goto LABEL_118;
    v11 = self->_flags;
    v12 = *((_DWORD *)v4 + 35);
  }
  if ((*(_BYTE *)&v11 & 1) != 0)
  {
    if ((v12 & 1) == 0 || self->_distanceToPickupInMeters != *((double *)v4 + 3))
      goto LABEL_118;
  }
  else if ((v12 & 1) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&v11 & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0)
      goto LABEL_118;
    if (self->_paymentIsApplePay)
    {
      if (!*((_BYTE *)v4 + 136))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 136))
    {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_BYTE *)&v11 & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_numberOfAvailableExtensions != *((_DWORD *)v4 + 31))
      goto LABEL_118;
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    if ((v12 & 0x2000) == 0)
      goto LABEL_118;
    if (self->_switchedApp)
    {
      if (!*((_BYTE *)v4 + 138))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 138))
    {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x2000) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0)
      goto LABEL_118;
    if (self->_showedSurgePricingAlert)
    {
      if (!*((_BYTE *)v4 + 137))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 137))
    {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_BYTE *)&v11 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_durationOfSessionInSeconds != *((double *)v4 + 4))
      goto LABEL_118;
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&v11 & 0x200) != 0)
  {
    if ((v12 & 0x200) == 0)
      goto LABEL_118;
    if (self->_installedApp)
    {
      if (!*((_BYTE *)v4 + 134))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 134))
    {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x200) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_BYTE *)&v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_timestamp != *((_QWORD *)v4 + 12))
      goto LABEL_118;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&v11 & 0x4000) != 0)
  {
    if ((v12 & 0x4000) == 0)
      goto LABEL_118;
    if (self->_unavailable)
    {
      if (!*((_BYTE *)v4 + 139))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 139))
    {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x4000) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&v11 & 0x400) != 0)
  {
    if ((v12 & 0x400) == 0)
      goto LABEL_118;
    if (self->_movedPickupLocation)
    {
      if (!*((_BYTE *)v4 + 135))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 135))
    {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x400) != 0)
  {
    goto LABEL_118;
  }
  errorMessages = self->_errorMessages;
  if ((unint64_t)errorMessages | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](errorMessages, "isEqual:"))
  {
    goto LABEL_118;
  }
  rideAppVersion = self->_rideAppVersion;
  if ((unint64_t)rideAppVersion | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](rideAppVersion, "isEqual:"))
      goto LABEL_118;
  }
  v16 = self->_flags;
  v17 = *((_DWORD *)v4 + 35);
  if ((*(_BYTE *)&v16 & 0x80) != 0)
  {
    if ((v17 & 0x80) != 0)
    {
      if (self->_comparedRideOptions)
      {
        if (!*((_BYTE *)v4 + 132))
          goto LABEL_118;
        goto LABEL_111;
      }
      if (!*((_BYTE *)v4 + 132))
        goto LABEL_111;
    }
LABEL_118:
    v19 = 0;
    goto LABEL_119;
  }
  if ((v17 & 0x80) != 0)
    goto LABEL_118;
LABEL_111:
  if ((*(_BYTE *)&v16 & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0 || self->_statusIssue != *((_DWORD *)v4 + 32))
      goto LABEL_118;
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_118;
  }
  intentResponseFailures = self->_intentResponseFailures;
  if ((unint64_t)intentResponseFailures | *((_QWORD *)v4 + 6))
    v19 = -[NSMutableArray isEqual:](intentResponseFailures, "isEqual:");
  else
    v19 = 1;
LABEL_119:

  return v19;
}

- (unint64_t)hash
{
  $150E7F75803E167E6CE7D122FD23A4FB flags;
  $150E7F75803E167E6CE7D122FD23A4FB v4;
  unint64_t v5;
  double distanceToPickupInMeters;
  double v7;
  long double v8;
  double v9;
  double durationOfSessionInSeconds;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  $150E7F75803E167E6CE7D122FD23A4FB v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSUInteger v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  NSUInteger v34;
  uint64_t v35;
  uint64_t v36;
  NSUInteger v37;

  -[GEOLogMsgEventRideBookingSession readAll:](self, "readAll:", 1);
  v37 = -[NSString hash](self->_rideBookingSessionId, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    v36 = 2654435761 * self->_endState;
    if ((*(_BYTE *)&flags & 0x10) != 0)
      goto LABEL_3;
  }
  else
  {
    v36 = 0;
    if ((*(_BYTE *)&flags & 0x10) != 0)
    {
LABEL_3:
      v35 = 2654435761 * self->_endView;
      goto LABEL_6;
    }
  }
  v35 = 0;
LABEL_6:
  v34 = -[NSString hash](self->_rideAppId, "hash");
  v33 = -[GEOLatLng hash](self->_originBlurred, "hash");
  v32 = -[GEOLatLng hash](self->_destinationBlurred, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
    v31 = 2654435761 * self->_exploredOtherOptions;
  else
    v31 = 0;
  v30 = -[NSString hash](self->_rideType, "hash");
  v4 = self->_flags;
  if ((*(_BYTE *)&v4 & 1) != 0)
  {
    distanceToPickupInMeters = self->_distanceToPickupInMeters;
    v7 = -distanceToPickupInMeters;
    if (distanceToPickupInMeters >= 0.0)
      v7 = self->_distanceToPickupInMeters;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
    v29 = 2654435761 * self->_paymentIsApplePay;
    if ((*(_BYTE *)&v4 & 0x20) != 0)
    {
LABEL_19:
      v28 = 2654435761 * self->_numberOfAvailableExtensions;
      if ((*(_WORD *)&v4 & 0x2000) != 0)
        goto LABEL_20;
      goto LABEL_28;
    }
  }
  else
  {
    v29 = 0;
    if ((*(_BYTE *)&v4 & 0x20) != 0)
      goto LABEL_19;
  }
  v28 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_20:
    v27 = 2654435761 * self->_switchedApp;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
      goto LABEL_21;
LABEL_29:
    v25 = 0;
    if ((*(_BYTE *)&v4 & 2) != 0)
      goto LABEL_22;
LABEL_30:
    v14 = 0;
    goto LABEL_33;
  }
LABEL_28:
  v27 = 0;
  if ((*(_WORD *)&v4 & 0x1000) == 0)
    goto LABEL_29;
LABEL_21:
  v25 = 2654435761 * self->_showedSurgePricingAlert;
  if ((*(_BYTE *)&v4 & 2) == 0)
    goto LABEL_30;
LABEL_22:
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
LABEL_33:
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
    v15 = 2654435761 * self->_installedApp;
    if ((*(_BYTE *)&v4 & 4) != 0)
    {
LABEL_35:
      v16 = 2654435761 * self->_timestamp;
      if ((*(_WORD *)&v4 & 0x4000) != 0)
        goto LABEL_36;
LABEL_40:
      v17 = 0;
      if ((*(_WORD *)&v4 & 0x400) != 0)
        goto LABEL_37;
      goto LABEL_41;
    }
  }
  else
  {
    v15 = 0;
    if ((*(_BYTE *)&v4 & 4) != 0)
      goto LABEL_35;
  }
  v16 = 0;
  if ((*(_WORD *)&v4 & 0x4000) == 0)
    goto LABEL_40;
LABEL_36:
  v17 = 2654435761 * self->_unavailable;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_37:
    v18 = 2654435761 * self->_movedPickupLocation;
    goto LABEL_42;
  }
LABEL_41:
  v18 = 0;
LABEL_42:
  v19 = -[NSMutableArray hash](self->_errorMessages, "hash", v25);
  v20 = -[NSString hash](self->_rideAppVersion, "hash");
  v21 = self->_flags;
  if ((*(_BYTE *)&v21 & 0x80) != 0)
  {
    v22 = 2654435761 * self->_comparedRideOptions;
    if ((*(_BYTE *)&v21 & 0x40) != 0)
      goto LABEL_44;
LABEL_46:
    v23 = 0;
    return v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v5 ^ v29 ^ v28 ^ v27 ^ v26 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v22 ^ v23 ^ -[NSMutableArray hash](self->_intentResponseFailures, "hash");
  }
  v22 = 0;
  if ((*(_BYTE *)&v21 & 0x40) == 0)
    goto LABEL_46;
LABEL_44:
  v23 = 2654435761 * self->_statusIssue;
  return v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v5 ^ v29 ^ v28 ^ v27 ^ v26 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v22 ^ v23 ^ -[NSMutableArray hash](self->_intentResponseFailures, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  GEOLatLng *originBlurred;
  uint64_t v7;
  GEOLatLng *destinationBlurred;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 10))
    -[GEOLogMsgEventRideBookingSession setRideBookingSessionId:](self, "setRideBookingSessionId:");
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 8) != 0)
  {
    self->_endState = *((_DWORD *)v4 + 29);
    *(_DWORD *)&self->_flags |= 8u;
    v5 = *((_DWORD *)v4 + 35);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_endView = *((_DWORD *)v4 + 30);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  if (*((_QWORD *)v4 + 8))
    -[GEOLogMsgEventRideBookingSession setRideAppId:](self, "setRideAppId:");
  originBlurred = self->_originBlurred;
  v7 = *((_QWORD *)v4 + 7);
  if (originBlurred)
  {
    if (v7)
      -[GEOLatLng mergeFrom:](originBlurred, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOLogMsgEventRideBookingSession setOriginBlurred:](self, "setOriginBlurred:");
  }
  destinationBlurred = self->_destinationBlurred;
  v9 = *((_QWORD *)v4 + 2);
  if (destinationBlurred)
  {
    if (v9)
      -[GEOLatLng mergeFrom:](destinationBlurred, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOLogMsgEventRideBookingSession setDestinationBlurred:](self, "setDestinationBlurred:");
  }
  if ((*((_BYTE *)v4 + 141) & 1) != 0)
  {
    self->_exploredOtherOptions = *((_BYTE *)v4 + 133);
    *(_DWORD *)&self->_flags |= 0x100u;
  }
  if (*((_QWORD *)v4 + 11))
    -[GEOLogMsgEventRideBookingSession setRideType:](self, "setRideType:");
  v10 = *((_DWORD *)v4 + 35);
  if ((v10 & 1) != 0)
  {
    self->_distanceToPickupInMeters = *((double *)v4 + 3);
    *(_DWORD *)&self->_flags |= 1u;
    v10 = *((_DWORD *)v4 + 35);
    if ((v10 & 0x800) == 0)
    {
LABEL_25:
      if ((v10 & 0x20) == 0)
        goto LABEL_26;
      goto LABEL_57;
    }
  }
  else if ((v10 & 0x800) == 0)
  {
    goto LABEL_25;
  }
  self->_paymentIsApplePay = *((_BYTE *)v4 + 136);
  *(_DWORD *)&self->_flags |= 0x800u;
  v10 = *((_DWORD *)v4 + 35);
  if ((v10 & 0x20) == 0)
  {
LABEL_26:
    if ((v10 & 0x2000) == 0)
      goto LABEL_27;
    goto LABEL_58;
  }
LABEL_57:
  self->_numberOfAvailableExtensions = *((_DWORD *)v4 + 31);
  *(_DWORD *)&self->_flags |= 0x20u;
  v10 = *((_DWORD *)v4 + 35);
  if ((v10 & 0x2000) == 0)
  {
LABEL_27:
    if ((v10 & 0x1000) == 0)
      goto LABEL_28;
    goto LABEL_59;
  }
LABEL_58:
  self->_switchedApp = *((_BYTE *)v4 + 138);
  *(_DWORD *)&self->_flags |= 0x2000u;
  v10 = *((_DWORD *)v4 + 35);
  if ((v10 & 0x1000) == 0)
  {
LABEL_28:
    if ((v10 & 2) == 0)
      goto LABEL_29;
    goto LABEL_60;
  }
LABEL_59:
  self->_showedSurgePricingAlert = *((_BYTE *)v4 + 137);
  *(_DWORD *)&self->_flags |= 0x1000u;
  v10 = *((_DWORD *)v4 + 35);
  if ((v10 & 2) == 0)
  {
LABEL_29:
    if ((v10 & 0x200) == 0)
      goto LABEL_30;
    goto LABEL_61;
  }
LABEL_60:
  self->_durationOfSessionInSeconds = *((double *)v4 + 4);
  *(_DWORD *)&self->_flags |= 2u;
  v10 = *((_DWORD *)v4 + 35);
  if ((v10 & 0x200) == 0)
  {
LABEL_30:
    if ((v10 & 4) == 0)
      goto LABEL_31;
    goto LABEL_62;
  }
LABEL_61:
  self->_installedApp = *((_BYTE *)v4 + 134);
  *(_DWORD *)&self->_flags |= 0x200u;
  v10 = *((_DWORD *)v4 + 35);
  if ((v10 & 4) == 0)
  {
LABEL_31:
    if ((v10 & 0x4000) == 0)
      goto LABEL_32;
    goto LABEL_63;
  }
LABEL_62:
  self->_timestamp = *((_QWORD *)v4 + 12);
  *(_DWORD *)&self->_flags |= 4u;
  v10 = *((_DWORD *)v4 + 35);
  if ((v10 & 0x4000) == 0)
  {
LABEL_32:
    if ((v10 & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_63:
  self->_unavailable = *((_BYTE *)v4 + 139);
  *(_DWORD *)&self->_flags |= 0x4000u;
  if ((*((_DWORD *)v4 + 35) & 0x400) != 0)
  {
LABEL_33:
    self->_movedPickupLocation = *((_BYTE *)v4 + 135);
    *(_DWORD *)&self->_flags |= 0x400u;
  }
LABEL_34:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = *((id *)v4 + 5);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        -[GEOLogMsgEventRideBookingSession addErrorMessage:](self, "addErrorMessage:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v13);
  }

  if (*((_QWORD *)v4 + 9))
    -[GEOLogMsgEventRideBookingSession setRideAppVersion:](self, "setRideAppVersion:");
  v16 = *((_DWORD *)v4 + 35);
  if ((v16 & 0x80) != 0)
  {
    self->_comparedRideOptions = *((_BYTE *)v4 + 132);
    *(_DWORD *)&self->_flags |= 0x80u;
    v16 = *((_DWORD *)v4 + 35);
  }
  if ((v16 & 0x40) != 0)
  {
    self->_statusIssue = *((_DWORD *)v4 + 32);
    *(_DWORD *)&self->_flags |= 0x40u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = *((id *)v4 + 6);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        -[GEOLogMsgEventRideBookingSession addIntentResponseFailure:](self, "addIntentResponseFailure:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), (_QWORD)v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v19);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideType, 0);
  objc_storeStrong((id *)&self->_rideBookingSessionId, 0);
  objc_storeStrong((id *)&self->_rideAppVersion, 0);
  objc_storeStrong((id *)&self->_rideAppId, 0);
  objc_storeStrong((id *)&self->_originBlurred, 0);
  objc_storeStrong((id *)&self->_intentResponseFailures, 0);
  objc_storeStrong((id *)&self->_errorMessages, 0);
  objc_storeStrong((id *)&self->_destinationBlurred, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
