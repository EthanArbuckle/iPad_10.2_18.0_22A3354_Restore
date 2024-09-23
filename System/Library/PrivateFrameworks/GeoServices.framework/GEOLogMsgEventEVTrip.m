@implementation GEOLogMsgEventEVTrip

- (GEOLogMsgEventEVTrip)init
{
  GEOLogMsgEventEVTrip *v2;
  GEOLogMsgEventEVTrip *v3;
  GEOLogMsgEventEVTrip *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventEVTrip;
  v2 = -[GEOLogMsgEventEVTrip init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventEVTrip)initWithData:(id)a3
{
  GEOLogMsgEventEVTrip *v3;
  GEOLogMsgEventEVTrip *v4;
  GEOLogMsgEventEVTrip *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventEVTrip;
  v3 = -[GEOLogMsgEventEVTrip initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)outOfCharge
{
  return self->_outOfCharge;
}

- (void)setOutOfCharge:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  self->_outOfCharge = a3;
}

- (void)setHasOutOfCharge:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1028;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasOutOfCharge
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (BOOL)outOfRangeAlertDisplayed
{
  return self->_outOfRangeAlertDisplayed;
}

- (void)setOutOfRangeAlertDisplayed:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  self->_outOfRangeAlertDisplayed = a3;
}

- (void)setHasOutOfRangeAlertDisplayed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1032;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasOutOfRangeAlertDisplayed
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readChargeLocationDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventEVTripReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChargeLocationDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)chargeLocationDetails
{
  -[GEOLogMsgEventEVTrip _readChargeLocationDetails]((uint64_t)self);
  return self->_chargeLocationDetails;
}

- (void)setChargeLocationDetails:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *chargeLocationDetails;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  chargeLocationDetails = self->_chargeLocationDetails;
  self->_chargeLocationDetails = v4;

}

- (void)clearChargeLocationDetails
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  -[NSMutableArray removeAllObjects](self->_chargeLocationDetails, "removeAllObjects");
}

- (void)addChargeLocationDetails:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventEVTrip _readChargeLocationDetails]((uint64_t)self);
  -[GEOLogMsgEventEVTrip _addNoFlagsChargeLocationDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsChargeLocationDetails:(uint64_t)a1
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

- (unint64_t)chargeLocationDetailsCount
{
  -[GEOLogMsgEventEVTrip _readChargeLocationDetails]((uint64_t)self);
  return -[NSMutableArray count](self->_chargeLocationDetails, "count");
}

- (id)chargeLocationDetailsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventEVTrip _readChargeLocationDetails]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_chargeLocationDetails, "objectAtIndex:", a3);
}

+ (Class)chargeLocationDetailsType
{
  return (Class)objc_opt_class();
}

- (void)_readStopAddedDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 76) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventEVTripReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStopAddedDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)stopAddedDetails
{
  -[GEOLogMsgEventEVTrip _readStopAddedDetails]((uint64_t)self);
  return self->_stopAddedDetails;
}

- (void)setStopAddedDetails:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *stopAddedDetails;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  stopAddedDetails = self->_stopAddedDetails;
  self->_stopAddedDetails = v4;

}

- (void)clearStopAddedDetails
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  -[NSMutableArray removeAllObjects](self->_stopAddedDetails, "removeAllObjects");
}

- (void)addStopAddedDetails:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventEVTrip _readStopAddedDetails]((uint64_t)self);
  -[GEOLogMsgEventEVTrip _addNoFlagsStopAddedDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsStopAddedDetails:(uint64_t)a1
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

- (unint64_t)stopAddedDetailsCount
{
  -[GEOLogMsgEventEVTrip _readStopAddedDetails]((uint64_t)self);
  return -[NSMutableArray count](self->_stopAddedDetails, "count");
}

- (id)stopAddedDetailsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventEVTrip _readStopAddedDetails]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_stopAddedDetails, "objectAtIndex:", a3);
}

+ (Class)stopAddedDetailsType
{
  return (Class)objc_opt_class();
}

- (void)_readMetro
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventEVTripReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMetro_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMetro
{
  -[GEOLogMsgEventEVTrip _readMetro]((uint64_t)self);
  return self->_metro != 0;
}

- (NSString)metro
{
  -[GEOLogMsgEventEVTrip _readMetro]((uint64_t)self);
  return self->_metro;
}

- (void)setMetro:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_metro, a3);
}

- (BOOL)originalTripIncludedChargingStation
{
  return self->_originalTripIncludedChargingStation;
}

- (void)setOriginalTripIncludedChargingStation:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  self->_originalTripIncludedChargingStation = a3;
}

- (void)setHasOriginalTripIncludedChargingStation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1026;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasOriginalTripIncludedChargingStation
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)chargingStopAddedThroughSar
{
  return self->_chargingStopAddedThroughSar;
}

- (void)setChargingStopAddedThroughSar:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_chargingStopAddedThroughSar = a3;
}

- (void)setHasChargingStopAddedThroughSar:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasChargingStopAddedThroughSar
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)tripIncludedPreferredChargingStation
{
  return self->_tripIncludedPreferredChargingStation;
}

- (void)setTripIncludedPreferredChargingStation:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  self->_tripIncludedPreferredChargingStation = a3;
}

- (void)setHasTripIncludedPreferredChargingStation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1040;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasTripIncludedPreferredChargingStation
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)_readStopRemovedDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 76) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventEVTripReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStopRemovedDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)stopRemovedDetails
{
  -[GEOLogMsgEventEVTrip _readStopRemovedDetails]((uint64_t)self);
  return self->_stopRemovedDetails;
}

- (void)setStopRemovedDetails:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *stopRemovedDetails;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  stopRemovedDetails = self->_stopRemovedDetails;
  self->_stopRemovedDetails = v4;

}

- (void)clearStopRemovedDetails
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  -[NSMutableArray removeAllObjects](self->_stopRemovedDetails, "removeAllObjects");
}

- (void)addStopRemovedDetails:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventEVTrip _readStopRemovedDetails]((uint64_t)self);
  -[GEOLogMsgEventEVTrip _addNoFlagsStopRemovedDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsStopRemovedDetails:(uint64_t)a1
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

- (unint64_t)stopRemovedDetailsCount
{
  -[GEOLogMsgEventEVTrip _readStopRemovedDetails]((uint64_t)self);
  return -[NSMutableArray count](self->_stopRemovedDetails, "count");
}

- (id)stopRemovedDetailsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventEVTrip _readStopRemovedDetails]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_stopRemovedDetails, "objectAtIndex:", a3);
}

+ (Class)stopRemovedDetailsType
{
  return (Class)objc_opt_class();
}

- (void)_readRealtimeDodgeballs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 76) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventEVTripReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRealtimeDodgeballs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)realtimeDodgeballs
{
  -[GEOLogMsgEventEVTrip _readRealtimeDodgeballs]((uint64_t)self);
  return self->_realtimeDodgeballs;
}

- (void)setRealtimeDodgeballs:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *realtimeDodgeballs;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  realtimeDodgeballs = self->_realtimeDodgeballs;
  self->_realtimeDodgeballs = v4;

}

- (void)clearRealtimeDodgeballs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  -[NSMutableArray removeAllObjects](self->_realtimeDodgeballs, "removeAllObjects");
}

- (void)addRealtimeDodgeball:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventEVTrip _readRealtimeDodgeballs]((uint64_t)self);
  -[GEOLogMsgEventEVTrip _addNoFlagsRealtimeDodgeball:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsRealtimeDodgeball:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)realtimeDodgeballsCount
{
  -[GEOLogMsgEventEVTrip _readRealtimeDodgeballs]((uint64_t)self);
  return -[NSMutableArray count](self->_realtimeDodgeballs, "count");
}

- (id)realtimeDodgeballAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventEVTrip _readRealtimeDodgeballs]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_realtimeDodgeballs, "objectAtIndex:", a3);
}

+ (Class)realtimeDodgeballType
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
  v8.super_class = (Class)GEOLogMsgEventEVTrip;
  -[GEOLogMsgEventEVTrip description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventEVTrip dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventEVTrip _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  unint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  __int16 v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v52;
  const __CFString *v53;
  void *v54;
  const __CFString *v55;
  __int128 v56;
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
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 76);
  v6 = 0x1E0CB3000uLL;
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 70));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("outOfCharge");
    else
      v8 = CFSTR("out_of_charge");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_WORD *)(a1 + 76);
  }
  if ((v5 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 71));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("outOfRangeAlertDisplayed");
    else
      v10 = CFSTR("out_of_range_alert_displayed");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v12 = *(id *)(a1 + 16);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v69 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v17, "jsonRepresentation");
          else
            objc_msgSend(v17, "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
      }
      while (v14);
    }

    if (a2)
      v19 = CFSTR("chargeLocationDetails");
    else
      v19 = CFSTR("charge_location_details");
    objc_msgSend(v4, "setObject:forKey:", v11, v19);

    v6 = 0x1E0CB3000;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v21 = *(id *)(a1 + 40);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v65 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v26, "jsonRepresentation");
          else
            objc_msgSend(v26, "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v27);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
      }
      while (v23);
    }

    if (a2)
      v28 = CFSTR("stopAddedDetails");
    else
      v28 = CFSTR("stop_added_details");
    objc_msgSend(v4, "setObject:forKey:", v20, v28);

    v6 = 0x1E0CB3000uLL;
  }
  objc_msgSend((id)a1, "metro");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("metro"));

  v30 = *(_WORD *)(a1 + 76);
  if ((v30 & 2) == 0)
  {
    if ((v30 & 1) == 0)
      goto LABEL_46;
LABEL_86:
    objc_msgSend(*(id *)(v6 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 68));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v55 = CFSTR("chargingStopAddedThroughSar");
    else
      v55 = CFSTR("charging_stop_added_through_sar");
    objc_msgSend(v4, "setObject:forKey:", v54, v55);

    if ((*(_WORD *)(a1 + 76) & 0x10) == 0)
      goto LABEL_51;
    goto LABEL_47;
  }
  objc_msgSend(*(id *)(v6 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 69));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v53 = CFSTR("originalTripIncludedChargingStation");
  else
    v53 = CFSTR("original_trip_included_charging_station");
  objc_msgSend(v4, "setObject:forKey:", v52, v53);

  v30 = *(_WORD *)(a1 + 76);
  if ((v30 & 1) != 0)
    goto LABEL_86;
LABEL_46:
  if ((v30 & 0x10) != 0)
  {
LABEL_47:
    objc_msgSend(*(id *)(v6 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v32 = CFSTR("tripIncludedPreferredChargingStation");
    else
      v32 = CFSTR("trip_included_preferred_charging_station");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
LABEL_51:
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v34 = *(id *)(a1 + 48);
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v61;
      do
      {
        for (k = 0; k != v36; ++k)
        {
          if (*(_QWORD *)v61 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v39, "jsonRepresentation");
          else
            objc_msgSend(v39, "dictionaryRepresentation");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v40);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
      }
      while (v36);
    }

    if (a2)
      v41 = CFSTR("stopRemovedDetails");
    else
      v41 = CFSTR("stop_removed_details");
    objc_msgSend(v4, "setObject:forKey:", v33, v41);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v43 = *(id *)(a1 + 32);
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v57;
      do
      {
        for (m = 0; m != v45; ++m)
        {
          if (*(_QWORD *)v57 != v46)
            objc_enumerationMutation(v43);
          v48 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v48, "jsonRepresentation");
          else
            objc_msgSend(v48, "dictionaryRepresentation", (_QWORD)v56);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v49, (_QWORD)v56);

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
      }
      while (v45);
    }

    if (a2)
      v50 = CFSTR("realtimeDodgeball");
    else
      v50 = CFSTR("realtime_dodgeball");
    objc_msgSend(v4, "setObject:forKey:", v42, v50, (_QWORD)v56);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventEVTrip _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventEVTrip)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventEVTrip *)-[GEOLogMsgEventEVTrip _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  GEOChargeLocationDetails *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  GEOStopAddedDetails *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  uint64_t v47;
  GEODodgeballDetails *v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  uint64_t v58;
  GEODodgeballDetails *v59;
  uint64_t v60;
  void *v61;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("outOfCharge");
      else
        v6 = CFSTR("out_of_charge");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setOutOfCharge:", objc_msgSend(v7, "BOOLValue"));

      if (a3)
        v8 = CFSTR("outOfRangeAlertDisplayed");
      else
        v8 = CFSTR("out_of_range_alert_displayed");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setOutOfRangeAlertDisplayed:", objc_msgSend(v9, "BOOLValue"));

      if (a3)
        v10 = CFSTR("chargeLocationDetails");
      else
        v10 = CFSTR("charge_location_details");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v63 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v77;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v77 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v18 = [GEOChargeLocationDetails alloc];
                if ((a3 & 1) != 0)
                  v19 = -[GEOChargeLocationDetails initWithJSON:](v18, "initWithJSON:", v17);
                else
                  v19 = -[GEOChargeLocationDetails initWithDictionary:](v18, "initWithDictionary:", v17);
                v20 = (void *)v19;
                objc_msgSend(a1, "addChargeLocationDetails:", v19);

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
          }
          while (v14);
        }

        v5 = v63;
      }

      if (a3)
        v21 = CFSTR("stopAddedDetails");
      else
        v21 = CFSTR("stop_added_details");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v23 = v22;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v73;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v73 != v26)
                objc_enumerationMutation(v23);
              v28 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v29 = [GEOStopAddedDetails alloc];
                if ((a3 & 1) != 0)
                  v30 = -[GEOStopAddedDetails initWithJSON:](v29, "initWithJSON:", v28);
                else
                  v30 = -[GEOStopAddedDetails initWithDictionary:](v29, "initWithDictionary:", v28);
                v31 = (void *)v30;
                objc_msgSend(a1, "addStopAddedDetails:", v30);

              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
          }
          while (v25);
        }

        v5 = v63;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metro"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = (void *)objc_msgSend(v32, "copy");
        objc_msgSend(a1, "setMetro:", v33);

      }
      if (a3)
        v34 = CFSTR("originalTripIncludedChargingStation");
      else
        v34 = CFSTR("original_trip_included_charging_station");
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setOriginalTripIncludedChargingStation:", objc_msgSend(v35, "BOOLValue"));

      if (a3)
        v36 = CFSTR("chargingStopAddedThroughSar");
      else
        v36 = CFSTR("charging_stop_added_through_sar");
      objc_msgSend(v5, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setChargingStopAddedThroughSar:", objc_msgSend(v37, "BOOLValue"));

      if (a3)
        v38 = CFSTR("tripIncludedPreferredChargingStation");
      else
        v38 = CFSTR("trip_included_preferred_charging_station");
      objc_msgSend(v5, "objectForKeyedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTripIncludedPreferredChargingStation:", objc_msgSend(v39, "BOOLValue"));

      if (a3)
        v40 = CFSTR("stopRemovedDetails");
      else
        v40 = CFSTR("stop_removed_details");
      objc_msgSend(v5, "objectForKeyedSubscript:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v42 = v41;
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v69;
          do
          {
            for (k = 0; k != v44; ++k)
            {
              if (*(_QWORD *)v69 != v45)
                objc_enumerationMutation(v42);
              v47 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v48 = [GEODodgeballDetails alloc];
                if ((a3 & 1) != 0)
                  v49 = -[GEODodgeballDetails initWithJSON:](v48, "initWithJSON:", v47);
                else
                  v49 = -[GEODodgeballDetails initWithDictionary:](v48, "initWithDictionary:", v47);
                v50 = (void *)v49;
                objc_msgSend(a1, "addStopRemovedDetails:", v49);

              }
            }
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
          }
          while (v44);
        }

        v5 = v63;
      }

      if (a3)
        v51 = CFSTR("realtimeDodgeball");
      else
        v51 = CFSTR("realtime_dodgeball");
      objc_msgSend(v5, "objectForKeyedSubscript:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v53 = v52;
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
        if (v54)
        {
          v55 = v54;
          v56 = *(_QWORD *)v65;
          do
          {
            for (m = 0; m != v55; ++m)
            {
              if (*(_QWORD *)v65 != v56)
                objc_enumerationMutation(v53);
              v58 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v59 = [GEODodgeballDetails alloc];
                if ((a3 & 1) != 0)
                  v60 = -[GEODodgeballDetails initWithJSON:](v59, "initWithJSON:", v58);
                else
                  v60 = -[GEODodgeballDetails initWithDictionary:](v59, "initWithDictionary:", v58);
                v61 = (void *)v60;
                objc_msgSend(a1, "addRealtimeDodgeball:", v60);

              }
            }
            v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
          }
          while (v55);
        }

        v5 = v63;
      }

    }
  }

  return a1;
}

- (GEOLogMsgEventEVTrip)initWithJSON:(id)a3
{
  return (GEOLogMsgEventEVTrip *)-[GEOLogMsgEventEVTrip _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2575;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2576;
    GEOLogMsgEventEVTripReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgEventEVTripCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventEVTripIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventEVTripReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int16 v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  PBDataReader *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
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
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x7E0) == 0))
  {
    v24 = self->_reader;
    objc_sync_enter(v24);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v25);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v24);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventEVTrip readAll:](self, "readAll:", 0);
    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
      PBDataWriterWriteBOOLField();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v7 = self->_chargeLocationDetails;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v39 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      }
      while (v8);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v11 = self->_stopAddedDetails;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      }
      while (v12);
    }

    if (self->_metro)
      PBDataWriterWriteStringField();
    v15 = (__int16)self->_flags;
    if ((v15 & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      v15 = (__int16)self->_flags;
    }
    if ((v15 & 1) != 0)
    {
      PBDataWriterWriteBOOLField();
      v15 = (__int16)self->_flags;
    }
    if ((v15 & 0x10) != 0)
      PBDataWriterWriteBOOLField();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = self->_stopRemovedDetails;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v31;
      do
      {
        for (k = 0; k != v17; ++k)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v16);
          PBDataWriterWriteSubmessage();
        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
      }
      while (v17);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v20 = self->_realtimeDodgeballs;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v27;
      do
      {
        for (m = 0; m != v21; ++m)
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v20);
          PBDataWriterWriteSubmessage();
        }
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
      }
      while (v21);
    }

  }
}

- (void)copyTo:(id)a3
{
  __int16 flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t m;
  void *v21;
  id *v22;

  v22 = (id *)a3;
  -[GEOLogMsgEventEVTrip readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v22 + 1, self->_reader);
  *((_DWORD *)v22 + 14) = self->_readerMarkPos;
  *((_DWORD *)v22 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_BYTE *)v22 + 70) = self->_outOfCharge;
    *((_WORD *)v22 + 38) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    *((_BYTE *)v22 + 71) = self->_outOfRangeAlertDisplayed;
    *((_WORD *)v22 + 38) |= 8u;
  }
  if (-[GEOLogMsgEventEVTrip chargeLocationDetailsCount](self, "chargeLocationDetailsCount"))
  {
    objc_msgSend(v22, "clearChargeLocationDetails");
    v5 = -[GEOLogMsgEventEVTrip chargeLocationDetailsCount](self, "chargeLocationDetailsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOLogMsgEventEVTrip chargeLocationDetailsAtIndex:](self, "chargeLocationDetailsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addChargeLocationDetails:", v8);

      }
    }
  }
  if (-[GEOLogMsgEventEVTrip stopAddedDetailsCount](self, "stopAddedDetailsCount"))
  {
    objc_msgSend(v22, "clearStopAddedDetails");
    v9 = -[GEOLogMsgEventEVTrip stopAddedDetailsCount](self, "stopAddedDetailsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOLogMsgEventEVTrip stopAddedDetailsAtIndex:](self, "stopAddedDetailsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addStopAddedDetails:", v12);

      }
    }
  }
  if (self->_metro)
    objc_msgSend(v22, "setMetro:");
  v13 = (__int16)self->_flags;
  if ((v13 & 2) == 0)
  {
    if ((v13 & 1) == 0)
      goto LABEL_17;
LABEL_29:
    *((_BYTE *)v22 + 68) = self->_chargingStopAddedThroughSar;
    *((_WORD *)v22 + 38) |= 1u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  *((_BYTE *)v22 + 69) = self->_originalTripIncludedChargingStation;
  *((_WORD *)v22 + 38) |= 2u;
  v13 = (__int16)self->_flags;
  if ((v13 & 1) != 0)
    goto LABEL_29;
LABEL_17:
  if ((v13 & 0x10) != 0)
  {
LABEL_18:
    *((_BYTE *)v22 + 72) = self->_tripIncludedPreferredChargingStation;
    *((_WORD *)v22 + 38) |= 0x10u;
  }
LABEL_19:
  if (-[GEOLogMsgEventEVTrip stopRemovedDetailsCount](self, "stopRemovedDetailsCount"))
  {
    objc_msgSend(v22, "clearStopRemovedDetails");
    v14 = -[GEOLogMsgEventEVTrip stopRemovedDetailsCount](self, "stopRemovedDetailsCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        -[GEOLogMsgEventEVTrip stopRemovedDetailsAtIndex:](self, "stopRemovedDetailsAtIndex:", k);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addStopRemovedDetails:", v17);

      }
    }
  }
  if (-[GEOLogMsgEventEVTrip realtimeDodgeballsCount](self, "realtimeDodgeballsCount"))
  {
    objc_msgSend(v22, "clearRealtimeDodgeballs");
    v18 = -[GEOLogMsgEventEVTrip realtimeDodgeballsCount](self, "realtimeDodgeballsCount");
    if (v18)
    {
      v19 = v18;
      for (m = 0; m != v19; ++m)
      {
        -[GEOLogMsgEventEVTrip realtimeDodgeballAtIndex:](self, "realtimeDodgeballAtIndex:", m);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addRealtimeDodgeball:", v21);

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
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  void *v21;
  __int16 v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgEventEVTripReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_41;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventEVTrip readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 70) = self->_outOfCharge;
    *(_WORD *)(v5 + 76) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    *(_BYTE *)(v5 + 71) = self->_outOfRangeAlertDisplayed;
    *(_WORD *)(v5 + 76) |= 8u;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v10 = self->_chargeLocationDetails;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addChargeLocationDetails:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v11);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v15 = self->_stopAddedDetails;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v42 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addStopAddedDetails:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v16);
  }

  v20 = -[NSString copyWithZone:](self->_metro, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v20;

  v22 = (__int16)self->_flags;
  if ((v22 & 2) == 0)
  {
    if ((v22 & 1) == 0)
      goto LABEL_25;
LABEL_43:
    *(_BYTE *)(v5 + 68) = self->_chargingStopAddedThroughSar;
    *(_WORD *)(v5 + 76) |= 1u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
  *(_BYTE *)(v5 + 69) = self->_originalTripIncludedChargingStation;
  *(_WORD *)(v5 + 76) |= 2u;
  v22 = (__int16)self->_flags;
  if ((v22 & 1) != 0)
    goto LABEL_43;
LABEL_25:
  if ((v22 & 0x10) != 0)
  {
LABEL_26:
    *(_BYTE *)(v5 + 72) = self->_tripIncludedPreferredChargingStation;
    *(_WORD *)(v5 + 76) |= 0x10u;
  }
LABEL_27:
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v23 = self->_stopRemovedDetails;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(v23);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addStopRemovedDetails:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v24);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = self->_realtimeDodgeballs;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v34;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v34 != v29)
          objc_enumerationMutation(v8);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v33);
        objc_msgSend((id)v5, "addRealtimeDodgeball:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    }
    while (v28);
  }
LABEL_41:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSMutableArray *chargeLocationDetails;
  NSMutableArray *stopAddedDetails;
  NSString *metro;
  __int16 v10;
  __int16 v11;
  NSMutableArray *stopRemovedDetails;
  NSMutableArray *realtimeDodgeballs;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  -[GEOLogMsgEventEVTrip readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 38);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0)
      goto LABEL_52;
    if (self->_outOfCharge)
    {
      if (!*((_BYTE *)v4 + 70))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 70))
    {
      goto LABEL_52;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0)
      goto LABEL_52;
    if (self->_outOfRangeAlertDisplayed)
    {
      if (!*((_BYTE *)v4 + 71))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 71))
    {
      goto LABEL_52;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_52;
  }
  chargeLocationDetails = self->_chargeLocationDetails;
  if ((unint64_t)chargeLocationDetails | *((_QWORD *)v4 + 2)
    && !-[NSMutableArray isEqual:](chargeLocationDetails, "isEqual:"))
  {
    goto LABEL_52;
  }
  stopAddedDetails = self->_stopAddedDetails;
  if ((unint64_t)stopAddedDetails | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](stopAddedDetails, "isEqual:"))
      goto LABEL_52;
  }
  metro = self->_metro;
  if ((unint64_t)metro | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](metro, "isEqual:"))
      goto LABEL_52;
  }
  v10 = (__int16)self->_flags;
  v11 = *((_WORD *)v4 + 38);
  if ((v10 & 2) != 0)
  {
    if ((v11 & 2) == 0)
      goto LABEL_52;
    if (self->_originalTripIncludedChargingStation)
    {
      if (!*((_BYTE *)v4 + 69))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 69))
    {
      goto LABEL_52;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_52;
  }
  if ((v10 & 1) != 0)
  {
    if ((v11 & 1) == 0)
      goto LABEL_52;
    if (self->_chargingStopAddedThroughSar)
    {
      if (!*((_BYTE *)v4 + 68))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 68))
    {
      goto LABEL_52;
    }
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_52;
  }
  if ((v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) != 0)
    {
      if (self->_tripIncludedPreferredChargingStation)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_52;
        goto LABEL_48;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_48;
    }
LABEL_52:
    v14 = 0;
    goto LABEL_53;
  }
  if ((v11 & 0x10) != 0)
    goto LABEL_52;
LABEL_48:
  stopRemovedDetails = self->_stopRemovedDetails;
  if ((unint64_t)stopRemovedDetails | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](stopRemovedDetails, "isEqual:"))
  {
    goto LABEL_52;
  }
  realtimeDodgeballs = self->_realtimeDodgeballs;
  if ((unint64_t)realtimeDodgeballs | *((_QWORD *)v4 + 4))
    v14 = -[NSMutableArray isEqual:](realtimeDodgeballs, "isEqual:");
  else
    v14 = 1;
LABEL_53:

  return v14;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;

  -[GEOLogMsgEventEVTrip readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v4 = 2654435761 * self->_outOfCharge;
    if ((flags & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((flags & 8) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_outOfRangeAlertDisplayed;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSMutableArray hash](self->_chargeLocationDetails, "hash");
  v7 = -[NSMutableArray hash](self->_stopAddedDetails, "hash");
  v8 = -[NSString hash](self->_metro, "hash");
  v9 = (__int16)self->_flags;
  if ((v9 & 2) == 0)
  {
    v10 = 0;
    if ((v9 & 1) != 0)
      goto LABEL_8;
LABEL_11:
    v11 = 0;
    if ((v9 & 0x10) != 0)
      goto LABEL_9;
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v10 = 2654435761 * self->_originalTripIncludedChargingStation;
  if ((v9 & 1) == 0)
    goto LABEL_11;
LABEL_8:
  v11 = 2654435761 * self->_chargingStopAddedThroughSar;
  if ((v9 & 0x10) == 0)
    goto LABEL_12;
LABEL_9:
  v12 = 2654435761 * self->_tripIncludedPreferredChargingStation;
LABEL_13:
  v13 = v5 ^ v4 ^ v6 ^ v7 ^ v8;
  v14 = v10 ^ v11 ^ v12 ^ -[NSMutableArray hash](self->_stopRemovedDetails, "hash");
  return v13 ^ v14 ^ -[NSMutableArray hash](self->_realtimeDodgeballs, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int16 v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 4) != 0)
  {
    self->_outOfCharge = *((_BYTE *)v4 + 70);
    *(_WORD *)&self->_flags |= 4u;
    v5 = *((_WORD *)v4 + 38);
  }
  if ((v5 & 8) != 0)
  {
    self->_outOfRangeAlertDisplayed = *((_BYTE *)v4 + 71);
    *(_WORD *)&self->_flags |= 8u;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        -[GEOLogMsgEventEVTrip addChargeLocationDetails:](self, "addChargeLocationDetails:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v8);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = *((id *)v4 + 5);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v11);
        -[GEOLogMsgEventEVTrip addStopAddedDetails:](self, "addStopAddedDetails:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v13);
  }

  if (*((_QWORD *)v4 + 3))
    -[GEOLogMsgEventEVTrip setMetro:](self, "setMetro:");
  v16 = *((_WORD *)v4 + 38);
  if ((v16 & 2) != 0)
  {
    self->_originalTripIncludedChargingStation = *((_BYTE *)v4 + 69);
    *(_WORD *)&self->_flags |= 2u;
    v16 = *((_WORD *)v4 + 38);
    if ((v16 & 1) == 0)
    {
LABEL_23:
      if ((v16 & 0x10) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((v16 & 1) == 0)
  {
    goto LABEL_23;
  }
  self->_chargingStopAddedThroughSar = *((_BYTE *)v4 + 68);
  *(_WORD *)&self->_flags |= 1u;
  if ((*((_WORD *)v4 + 38) & 0x10) != 0)
  {
LABEL_24:
    self->_tripIncludedPreferredChargingStation = *((_BYTE *)v4 + 72);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_25:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = *((id *)v4 + 6);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v17);
        -[GEOLogMsgEventEVTrip addStopRemovedDetails:](self, "addStopRemovedDetails:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v19);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = *((id *)v4 + 4);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        -[GEOLogMsgEventEVTrip addRealtimeDodgeball:](self, "addRealtimeDodgeball:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * m), (_QWORD)v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v24);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopRemovedDetails, 0);
  objc_storeStrong((id *)&self->_stopAddedDetails, 0);
  objc_storeStrong((id *)&self->_realtimeDodgeballs, 0);
  objc_storeStrong((id *)&self->_metro, 0);
  objc_storeStrong((id *)&self->_chargeLocationDetails, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
