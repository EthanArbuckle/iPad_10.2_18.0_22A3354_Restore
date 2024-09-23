@implementation GEOLogMsgEventRideBookedSession

- (GEOLogMsgEventRideBookedSession)init
{
  GEOLogMsgEventRideBookedSession *v2;
  GEOLogMsgEventRideBookedSession *v3;
  GEOLogMsgEventRideBookedSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventRideBookedSession;
  v2 = -[GEOLogMsgEventRideBookedSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventRideBookedSession)initWithData:(id)a3
{
  GEOLogMsgEventRideBookedSession *v3;
  GEOLogMsgEventRideBookedSession *v4;
  GEOLogMsgEventRideBookedSession *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventRideBookedSession;
  v3 = -[GEOLogMsgEventRideBookedSession initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)bookedUsingMaps
{
  return self->_bookedUsingMaps;
}

- (void)setBookedUsingMaps:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_bookedUsingMaps = a3;
}

- (void)setHasBookedUsingMaps:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8194;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasBookedUsingMaps
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2004u;
  self->_cancelled = a3;
}

- (void)setHasCancelled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8196;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasCancelled
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (BOOL)contactedDriver
{
  return self->_contactedDriver;
}

- (void)setContactedDriver:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  self->_contactedDriver = a3;
}

- (void)setHasContactedDriver:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8200;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasContactedDriver
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (BOOL)viewedInProactiveTray
{
  return self->_viewedInProactiveTray;
}

- (void)setViewedInProactiveTray:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2100u;
  self->_viewedInProactiveTray = a3;
}

- (void)setHasViewedInProactiveTray:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8448;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasViewedInProactiveTray
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (BOOL)tappedProactiveTrayItem
{
  return self->_tappedProactiveTrayItem;
}

- (void)setTappedProactiveTrayItem:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2040u;
  self->_tappedProactiveTrayItem = a3;
}

- (void)setHasTappedProactiveTrayItem:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8256;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasTappedProactiveTrayItem
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (BOOL)viewedDetails
{
  return self->_viewedDetails;
}

- (void)setViewedDetails:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2080u;
  self->_viewedDetails = a3;
}

- (void)setHasViewedDetails:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8320;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasViewedDetails
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (void)_readRideAppId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 72) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookedSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRideAppId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRideAppId
{
  -[GEOLogMsgEventRideBookedSession _readRideAppId]((uint64_t)self);
  return self->_rideAppId != 0;
}

- (NSString)rideAppId
{
  -[GEOLogMsgEventRideBookedSession _readRideAppId]((uint64_t)self);
  return self->_rideAppId;
}

- (void)setRideAppId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2400u;
  objc_storeStrong((id *)&self->_rideAppId, a3);
}

- (void)_readRideBookedSessionId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 72) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookedSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRideBookedSessionId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRideBookedSessionId
{
  -[GEOLogMsgEventRideBookedSession _readRideBookedSessionId]((uint64_t)self);
  return self->_rideBookedSessionId != 0;
}

- (NSString)rideBookedSessionId
{
  -[GEOLogMsgEventRideBookedSession _readRideBookedSessionId]((uint64_t)self);
  return self->_rideBookedSessionId;
}

- (void)setRideBookedSessionId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x3000u;
  objc_storeStrong((id *)&self->_rideBookedSessionId, a3);
}

- (void)_readRideAppVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 72) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookedSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRideAppVersion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRideAppVersion
{
  -[GEOLogMsgEventRideBookedSession _readRideAppVersion]((uint64_t)self);
  return self->_rideAppVersion != 0;
}

- (NSString)rideAppVersion
{
  -[GEOLogMsgEventRideBookedSession _readRideAppVersion]((uint64_t)self);
  return self->_rideAppVersion;
}

- (void)setRideAppVersion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2800u;
  objc_storeStrong((id *)&self->_rideAppVersion, a3);
}

- (BOOL)invalidVehicleLocation
{
  return self->_invalidVehicleLocation;
}

- (void)setInvalidVehicleLocation:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  self->_invalidVehicleLocation = a3;
}

- (void)setHasInvalidVehicleLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8208;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasInvalidVehicleLocation
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (BOOL)missingVehicleLocation
{
  return self->_missingVehicleLocation;
}

- (void)setMissingVehicleLocation:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2020u;
  self->_missingVehicleLocation = a3;
}

- (void)setHasMissingVehicleLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8224;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasMissingVehicleLocation
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (int)statusIssue
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_statusIssue;
  else
    return 0;
}

- (void)setStatusIssue:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_statusIssue = a3;
}

- (void)setHasStatusIssue:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasStatusIssue
{
  return *(_WORD *)&self->_flags & 1;
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 72) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventRideBookedSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIntentResponseFailures_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)intentResponseFailures
{
  -[GEOLogMsgEventRideBookedSession _readIntentResponseFailures]((uint64_t)self);
  return self->_intentResponseFailures;
}

- (void)setIntentResponseFailures:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *intentResponseFailures;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  intentResponseFailures = self->_intentResponseFailures;
  self->_intentResponseFailures = v4;

}

- (void)clearIntentResponseFailures
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[NSMutableArray removeAllObjects](self->_intentResponseFailures, "removeAllObjects");
}

- (void)addIntentResponseFailure:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventRideBookedSession _readIntentResponseFailures]((uint64_t)self);
  -[GEOLogMsgEventRideBookedSession _addNoFlagsIntentResponseFailure:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
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
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)intentResponseFailuresCount
{
  -[GEOLogMsgEventRideBookedSession _readIntentResponseFailures]((uint64_t)self);
  return -[NSMutableArray count](self->_intentResponseFailures, "count");
}

- (id)intentResponseFailureAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventRideBookedSession _readIntentResponseFailures]((uint64_t)self);
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
  v8.super_class = (Class)GEOLogMsgEventRideBookedSession;
  -[GEOLogMsgEventRideBookedSession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventRideBookedSession dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventRideBookedSession _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  __CFString *v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  const __CFString *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 72);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("bookedUsingMaps");
    else
      v16 = CFSTR("booked_using_maps");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v5 = *(_WORD *)(a1 + 72);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 8) == 0)
        goto LABEL_5;
      goto LABEL_36;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 65));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("cancelled"));

  v5 = *(_WORD *)(a1 + 72);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_40;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 66));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v19 = CFSTR("contactedDriver");
  else
    v19 = CFSTR("contacted_driver");
  objc_msgSend(v4, "setObject:forKey:", v18, v19);

  v5 = *(_WORD *)(a1 + 72);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 71));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v21 = CFSTR("viewedInProactiveTray");
  else
    v21 = CFSTR("viewed_in_proactive_tray");
  objc_msgSend(v4, "setObject:forKey:", v20, v21);

  v5 = *(_WORD *)(a1 + 72);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_8;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 69));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v23 = CFSTR("tappedProactiveTrayItem");
  else
    v23 = CFSTR("tapped_proactive_tray_item");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  if ((*(_WORD *)(a1 + 72) & 0x80) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 70));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("viewedDetails");
    else
      v7 = CFSTR("viewed_details");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_12:
  objc_msgSend((id)a1, "rideAppId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a2)
      v9 = CFSTR("rideAppId");
    else
      v9 = CFSTR("ride_app_id");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);
  }

  objc_msgSend((id)a1, "rideBookedSessionId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("rideBookedSessionId");
    else
      v11 = CFSTR("ride_booked_session_id");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  objc_msgSend((id)a1, "rideAppVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a2)
      v13 = CFSTR("rideAppVersion");
    else
      v13 = CFSTR("ride_app_version");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);
  }

  v14 = *(_WORD *)(a1 + 72);
  if ((v14 & 0x10) == 0)
  {
    if ((v14 & 0x20) == 0)
      goto LABEL_29;
LABEL_53:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 68));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v27 = CFSTR("missingVehicleLocation");
    else
      v27 = CFSTR("missing_vehicle_location");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

    if ((*(_WORD *)(a1 + 72) & 1) == 0)
      goto LABEL_64;
    goto LABEL_57;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 67));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v25 = CFSTR("invalidVehicleLocation");
  else
    v25 = CFSTR("invalid_vehicle_location");
  objc_msgSend(v4, "setObject:forKey:", v24, v25);

  v14 = *(_WORD *)(a1 + 72);
  if ((v14 & 0x20) != 0)
    goto LABEL_53;
LABEL_29:
  if ((v14 & 1) != 0)
  {
LABEL_57:
    v28 = *(int *)(a1 + 60);
    if (v28 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E1C21A98[v28];
    }
    if (a2)
      v30 = CFSTR("statusIssue");
    else
      v30 = CFSTR("status_issue");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
LABEL_64:
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v32 = *(id *)(a1 + 16);
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v42 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v37, "jsonRepresentation");
          else
            objc_msgSend(v37, "dictionaryRepresentation");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v38);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v34);
    }

    if (a2)
      v39 = CFSTR("intentResponseFailure");
    else
      v39 = CFSTR("intent_response_failure");
    objc_msgSend(v4, "setObject:forKey:", v31, v39);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventRideBookedSession _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventRideBookedSession)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventRideBookedSession *)-[GEOLogMsgEventRideBookedSession _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  GEORideBookingIntentResponseFailure *v42;
  uint64_t v43;
  void *v44;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_90;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_90;
  if (a3)
    v6 = CFSTR("bookedUsingMaps");
  else
    v6 = CFSTR("booked_using_maps");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBookedUsingMaps:", objc_msgSend(v7, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cancelled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCancelled:", objc_msgSend(v8, "BOOLValue"));

  if (a3)
    v9 = CFSTR("contactedDriver");
  else
    v9 = CFSTR("contacted_driver");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setContactedDriver:", objc_msgSend(v10, "BOOLValue"));

  if (a3)
    v11 = CFSTR("viewedInProactiveTray");
  else
    v11 = CFSTR("viewed_in_proactive_tray");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setViewedInProactiveTray:", objc_msgSend(v12, "BOOLValue"));

  if (a3)
    v13 = CFSTR("tappedProactiveTrayItem");
  else
    v13 = CFSTR("tapped_proactive_tray_item");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTappedProactiveTrayItem:", objc_msgSend(v14, "BOOLValue"));

  if (a3)
    v15 = CFSTR("viewedDetails");
  else
    v15 = CFSTR("viewed_details");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setViewedDetails:", objc_msgSend(v16, "BOOLValue"));

  if (a3)
    v17 = CFSTR("rideAppId");
  else
    v17 = CFSTR("ride_app_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(a1, "setRideAppId:", v19);

  }
  if (a3)
    v20 = CFSTR("rideBookedSessionId");
  else
    v20 = CFSTR("ride_booked_session_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(a1, "setRideBookedSessionId:", v22);

  }
  if (a3)
    v23 = CFSTR("rideAppVersion");
  else
    v23 = CFSTR("ride_app_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(a1, "setRideAppVersion:", v25);

  }
  if (a3)
    v26 = CFSTR("invalidVehicleLocation");
  else
    v26 = CFSTR("invalid_vehicle_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setInvalidVehicleLocation:", objc_msgSend(v27, "BOOLValue"));

  if (a3)
    v28 = CFSTR("missingVehicleLocation");
  else
    v28 = CFSTR("missing_vehicle_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMissingVehicleLocation:", objc_msgSend(v29, "BOOLValue"));

  if (a3)
    v30 = CFSTR("statusIssue");
  else
    v30 = CFSTR("status_issue");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = v31;
    if ((objc_msgSend(v32, "isEqualToString:", CFSTR("RBSI_NOT_SET")) & 1) != 0)
    {
      v33 = 0;
    }
    else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("RBSI_MISSING_RIDE_OPTION_NAME")) & 1) != 0)
    {
      v33 = 1;
    }
    else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("RBSI_MISSING_RIDE_IDENTIFIER")) & 1) != 0)
    {
      v33 = 2;
    }
    else if (objc_msgSend(v32, "isEqualToString:", CFSTR("RBSI_MISSING_RIDE_ETA")))
    {
      v33 = 3;
    }
    else
    {
      v33 = 0;
    }

    goto LABEL_71;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = objc_msgSend(v31, "intValue");
LABEL_71:
    objc_msgSend(a1, "setStatusIssue:", v33);
  }

  if (a3)
    v34 = CFSTR("intentResponseFailure");
  else
    v34 = CFSTR("intent_response_failure");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v46 = v35;
    v36 = v35;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v48 != v39)
            objc_enumerationMutation(v36);
          v41 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v42 = [GEORideBookingIntentResponseFailure alloc];
            if ((a3 & 1) != 0)
              v43 = -[GEORideBookingIntentResponseFailure initWithJSON:](v42, "initWithJSON:", v41);
            else
              v43 = -[GEORideBookingIntentResponseFailure initWithDictionary:](v42, "initWithDictionary:", v41);
            v44 = (void *)v43;
            objc_msgSend(a1, "addIntentResponseFailure:", v43);

          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v38);
    }

    v35 = v46;
  }

LABEL_90:
  return a1;
}

- (GEOLogMsgEventRideBookedSession)initWithJSON:(id)a3
{
  return (GEOLogMsgEventRideBookedSession *)-[GEOLogMsgEventRideBookedSession _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_86;
    else
      v8 = (int *)&readAll__nonRecursiveTag_86;
    GEOLogMsgEventRideBookedSessionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgEventRideBookedSessionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventRideBookedSessionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventRideBookedSessionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  __int16 v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  PBDataReader *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x3E00) == 0)
    {
      v12 = self->_reader;
      objc_sync_enter(v12);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v13);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v12);
      goto LABEL_38;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventRideBookedSession readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 8) == 0)
        goto LABEL_6;
      goto LABEL_30;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_8:
    if ((flags & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_32:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
LABEL_9:
    PBDataWriterWriteBOOLField();
LABEL_10:
  if (self->_rideAppId)
    PBDataWriterWriteStringField();
  if (self->_rideBookedSessionId)
    PBDataWriterWriteStringField();
  if (self->_rideAppVersion)
    PBDataWriterWriteStringField();
  v7 = (__int16)self->_flags;
  if ((v7 & 0x10) == 0)
  {
    if ((v7 & 0x20) == 0)
      goto LABEL_18;
LABEL_35:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_flags & 1) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  PBDataWriterWriteBOOLField();
  v7 = (__int16)self->_flags;
  if ((v7 & 0x20) != 0)
    goto LABEL_35;
LABEL_18:
  if ((v7 & 1) != 0)
LABEL_19:
    PBDataWriterWriteInt32Field();
LABEL_20:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_intentResponseFailures;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

LABEL_38:
}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  __int16 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  id *v11;

  v11 = (id *)a3;
  -[GEOLogMsgEventRideBookedSession readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 12) = self->_readerMarkPos;
  *((_DWORD *)v11 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v11;
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v11 + 64) = self->_bookedUsingMaps;
    *((_WORD *)v11 + 36) |= 2u;
    flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v11 + 65) = self->_cancelled;
  *((_WORD *)v11 + 36) |= 4u;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  *((_BYTE *)v11 + 66) = self->_contactedDriver;
  *((_WORD *)v11 + 36) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_5:
    if ((flags & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  *((_BYTE *)v11 + 71) = self->_viewedInProactiveTray;
  *((_WORD *)v11 + 36) |= 0x100u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_6:
    if ((flags & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_27:
  *((_BYTE *)v11 + 69) = self->_tappedProactiveTrayItem;
  *((_WORD *)v11 + 36) |= 0x40u;
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
LABEL_7:
    *((_BYTE *)v11 + 70) = self->_viewedDetails;
    *((_WORD *)v11 + 36) |= 0x80u;
  }
LABEL_8:
  if (self->_rideAppId)
  {
    objc_msgSend(v11, "setRideAppId:");
    v4 = v11;
  }
  if (self->_rideBookedSessionId)
  {
    objc_msgSend(v11, "setRideBookedSessionId:");
    v4 = v11;
  }
  if (self->_rideAppVersion)
  {
    objc_msgSend(v11, "setRideAppVersion:");
    v4 = v11;
  }
  v6 = (__int16)self->_flags;
  if ((v6 & 0x10) == 0)
  {
    if ((v6 & 0x20) == 0)
      goto LABEL_16;
LABEL_30:
    *((_BYTE *)v4 + 68) = self->_missingVehicleLocation;
    *((_WORD *)v4 + 36) |= 0x20u;
    if ((*(_WORD *)&self->_flags & 1) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  *((_BYTE *)v4 + 67) = self->_invalidVehicleLocation;
  *((_WORD *)v4 + 36) |= 0x10u;
  v6 = (__int16)self->_flags;
  if ((v6 & 0x20) != 0)
    goto LABEL_30;
LABEL_16:
  if ((v6 & 1) != 0)
  {
LABEL_17:
    *((_DWORD *)v4 + 15) = self->_statusIssue;
    *((_WORD *)v4 + 36) |= 1u;
  }
LABEL_18:
  if (-[GEOLogMsgEventRideBookedSession intentResponseFailuresCount](self, "intentResponseFailuresCount"))
  {
    objc_msgSend(v11, "clearIntentResponseFailures");
    v7 = -[GEOLogMsgEventRideBookedSession intentResponseFailuresCount](self, "intentResponseFailuresCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[GEOLogMsgEventRideBookedSession intentResponseFailureAtIndex:](self, "intentResponseFailureAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addIntentResponseFailure:", v10);

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
  __int16 flags;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x2000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgEventRideBookedSessionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventRideBookedSession readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 64) = self->_bookedUsingMaps;
    *(_WORD *)(v5 + 72) |= 2u;
    flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0)
        goto LABEL_8;
      goto LABEL_26;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v5 + 65) = self->_cancelled;
  *(_WORD *)(v5 + 72) |= 4u;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_8:
    if ((flags & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *(_BYTE *)(v5 + 66) = self->_contactedDriver;
  *(_WORD *)(v5 + 72) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_9:
    if ((flags & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *(_BYTE *)(v5 + 71) = self->_viewedInProactiveTray;
  *(_WORD *)(v5 + 72) |= 0x100u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_10:
    if ((flags & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_28:
  *(_BYTE *)(v5 + 69) = self->_tappedProactiveTrayItem;
  *(_WORD *)(v5 + 72) |= 0x40u;
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
LABEL_11:
    *(_BYTE *)(v5 + 70) = self->_viewedDetails;
    *(_WORD *)(v5 + 72) |= 0x80u;
  }
LABEL_12:
  v10 = -[NSString copyWithZone:](self->_rideAppId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_rideBookedSessionId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[NSString copyWithZone:](self->_rideAppVersion, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  v16 = (__int16)self->_flags;
  if ((v16 & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 67) = self->_invalidVehicleLocation;
    *(_WORD *)(v5 + 72) |= 0x10u;
    v16 = (__int16)self->_flags;
    if ((v16 & 0x20) == 0)
    {
LABEL_14:
      if ((v16 & 1) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((v16 & 0x20) == 0)
  {
    goto LABEL_14;
  }
  *(_BYTE *)(v5 + 68) = self->_missingVehicleLocation;
  *(_WORD *)(v5 + 72) |= 0x20u;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
LABEL_15:
    *(_DWORD *)(v5 + 60) = self->_statusIssue;
    *(_WORD *)(v5 + 72) |= 1u;
  }
LABEL_16:
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_intentResponseFailures;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v8);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v5, "addIntentResponseFailure:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v17);
  }
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSString *rideAppId;
  NSString *rideBookedSessionId;
  NSString *rideAppVersion;
  __int16 v10;
  __int16 v11;
  NSMutableArray *intentResponseFailures;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_79;
  -[GEOLogMsgEventRideBookedSession readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 36);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0)
      goto LABEL_79;
    if (self->_bookedUsingMaps)
    {
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 64))
    {
      goto LABEL_79;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_79;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0)
      goto LABEL_79;
    if (self->_cancelled)
    {
      if (!*((_BYTE *)v4 + 65))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 65))
    {
      goto LABEL_79;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_79;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0)
      goto LABEL_79;
    if (self->_contactedDriver)
    {
      if (!*((_BYTE *)v4 + 66))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 66))
    {
      goto LABEL_79;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x100) == 0)
      goto LABEL_79;
    if (self->_viewedInProactiveTray)
    {
      if (!*((_BYTE *)v4 + 71))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 71))
    {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x100) != 0)
  {
    goto LABEL_79;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0)
      goto LABEL_79;
    if (self->_tappedProactiveTrayItem)
    {
      if (!*((_BYTE *)v4 + 69))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 69))
    {
      goto LABEL_79;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_79;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0)
      goto LABEL_79;
    if (self->_viewedDetails)
    {
      if (!*((_BYTE *)v4 + 70))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 70))
    {
      goto LABEL_79;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_79;
  }
  rideAppId = self->_rideAppId;
  if ((unint64_t)rideAppId | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](rideAppId, "isEqual:"))
    goto LABEL_79;
  rideBookedSessionId = self->_rideBookedSessionId;
  if ((unint64_t)rideBookedSessionId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](rideBookedSessionId, "isEqual:"))
      goto LABEL_79;
  }
  rideAppVersion = self->_rideAppVersion;
  if ((unint64_t)rideAppVersion | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](rideAppVersion, "isEqual:"))
      goto LABEL_79;
  }
  v10 = (__int16)self->_flags;
  v11 = *((_WORD *)v4 + 36);
  if ((v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0)
      goto LABEL_79;
    if (self->_invalidVehicleLocation)
    {
      if (!*((_BYTE *)v4 + 67))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 67))
    {
      goto LABEL_79;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  if ((v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) != 0)
    {
      if (self->_missingVehicleLocation)
      {
        if (!*((_BYTE *)v4 + 68))
          goto LABEL_79;
        goto LABEL_72;
      }
      if (!*((_BYTE *)v4 + 68))
        goto LABEL_72;
    }
LABEL_79:
    v13 = 0;
    goto LABEL_80;
  }
  if ((v11 & 0x20) != 0)
    goto LABEL_79;
LABEL_72:
  if ((v10 & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_statusIssue != *((_DWORD *)v4 + 15))
      goto LABEL_79;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_79;
  }
  intentResponseFailures = self->_intentResponseFailures;
  if ((unint64_t)intentResponseFailures | *((_QWORD *)v4 + 2))
    v13 = -[NSMutableArray isEqual:](intentResponseFailures, "isEqual:");
  else
    v13 = 1;
LABEL_80:

  return v13;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  -[GEOLogMsgEventRideBookedSession readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v18 = 2654435761 * self->_bookedUsingMaps;
    if ((flags & 4) != 0)
    {
LABEL_3:
      v16 = 2654435761 * self->_cancelled;
      if ((flags & 8) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v18 = 0;
    if ((flags & 4) != 0)
      goto LABEL_3;
  }
  v16 = 0;
  if ((flags & 8) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_contactedDriver;
    if ((*(_WORD *)&self->_flags & 0x100) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_viewedInProactiveTray;
    if ((flags & 0x40) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((flags & 0x80) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v5 = 0;
  if ((flags & 0x40) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_tappedProactiveTrayItem;
  if ((flags & 0x80) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_viewedDetails;
    goto LABEL_14;
  }
LABEL_13:
  v7 = 0;
LABEL_14:
  v8 = -[NSString hash](self->_rideAppId, "hash", v16);
  v9 = -[NSString hash](self->_rideBookedSessionId, "hash");
  v10 = -[NSString hash](self->_rideAppVersion, "hash");
  v11 = (__int16)self->_flags;
  if ((v11 & 0x10) == 0)
  {
    v12 = 0;
    if ((v11 & 0x20) != 0)
      goto LABEL_16;
LABEL_19:
    v13 = 0;
    if ((v11 & 1) != 0)
      goto LABEL_17;
LABEL_20:
    v14 = 0;
    return v17 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ -[NSMutableArray hash](self->_intentResponseFailures, "hash");
  }
  v12 = 2654435761 * self->_invalidVehicleLocation;
  if ((v11 & 0x20) == 0)
    goto LABEL_19;
LABEL_16:
  v13 = 2654435761 * self->_missingVehicleLocation;
  if ((v11 & 1) == 0)
    goto LABEL_20;
LABEL_17:
  v14 = 2654435761 * self->_statusIssue;
  return v17 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ -[NSMutableArray hash](self->_intentResponseFailures, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_bookedUsingMaps = *((_BYTE *)v4 + 64);
    *(_WORD *)&self->_flags |= 2u;
    v5 = *((_WORD *)v4 + 36);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_cancelled = *((_BYTE *)v4 + 65);
  *(_WORD *)&self->_flags |= 4u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  self->_contactedDriver = *((_BYTE *)v4 + 66);
  *(_WORD *)&self->_flags |= 8u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_29:
  self->_viewedInProactiveTray = *((_BYTE *)v4 + 71);
  *(_WORD *)&self->_flags |= 0x100u;
  v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_30:
  self->_tappedProactiveTrayItem = *((_BYTE *)v4 + 69);
  *(_WORD *)&self->_flags |= 0x40u;
  if ((*((_WORD *)v4 + 36) & 0x80) != 0)
  {
LABEL_7:
    self->_viewedDetails = *((_BYTE *)v4 + 70);
    *(_WORD *)&self->_flags |= 0x80u;
  }
LABEL_8:
  if (*((_QWORD *)v4 + 3))
    -[GEOLogMsgEventRideBookedSession setRideAppId:](self, "setRideAppId:");
  if (*((_QWORD *)v4 + 5))
    -[GEOLogMsgEventRideBookedSession setRideBookedSessionId:](self, "setRideBookedSessionId:");
  if (*((_QWORD *)v4 + 4))
    -[GEOLogMsgEventRideBookedSession setRideAppVersion:](self, "setRideAppVersion:");
  v6 = *((_WORD *)v4 + 36);
  if ((v6 & 0x10) != 0)
  {
    self->_invalidVehicleLocation = *((_BYTE *)v4 + 67);
    *(_WORD *)&self->_flags |= 0x10u;
    v6 = *((_WORD *)v4 + 36);
    if ((v6 & 0x20) == 0)
    {
LABEL_16:
      if ((v6 & 1) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_16;
  }
  self->_missingVehicleLocation = *((_BYTE *)v4 + 68);
  *(_WORD *)&self->_flags |= 0x20u;
  if ((*((_WORD *)v4 + 36) & 1) != 0)
  {
LABEL_17:
    self->_statusIssue = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_18:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[GEOLogMsgEventRideBookedSession addIntentResponseFailure:](self, "addIntentResponseFailure:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideBookedSessionId, 0);
  objc_storeStrong((id *)&self->_rideAppVersion, 0);
  objc_storeStrong((id *)&self->_rideAppId, 0);
  objc_storeStrong((id *)&self->_intentResponseFailures, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
