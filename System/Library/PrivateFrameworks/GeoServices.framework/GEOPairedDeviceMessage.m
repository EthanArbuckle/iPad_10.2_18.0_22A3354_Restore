@implementation GEOPairedDeviceMessage

- (GEOPairedDeviceMessage)init
{
  GEOPairedDeviceMessage *v2;
  GEOPairedDeviceMessage *v3;
  GEOPairedDeviceMessage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPairedDeviceMessage;
  v2 = -[GEOPairedDeviceMessage init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPairedDeviceMessage)initWithData:(id)a3
{
  GEOPairedDeviceMessage *v3;
  GEOPairedDeviceMessage *v4;
  GEOPairedDeviceMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPairedDeviceMessage;
  v3 = -[GEOPairedDeviceMessage initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)resetPayload
{
  GEOPairedDevicePingRequest *ping;
  GEOPairedDeviceGetStorageInfoRequest *getStorageInfo;
  GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *configureSubscriptionShouldSync;
  GEOPairedDeviceSubscriptionStartStopDownloadRequest *startStopSubscriptionDownload;
  GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *checkinWithSubscriptionStateSummary;
  GEOPairedDeviceSubscriptionStatesSummary *setSubscriptionStateSummary;
  GEOPairedDeviceSubscriptionStateSynchronizationRequest *setObservedSubscriptionIdentifiers;
  GEOPairedDeviceSubscriptionStateUpdate *updateSubscriptionState;

  ping = self->_ping;
  self->_ping = 0;

  getStorageInfo = self->_getStorageInfo;
  self->_getStorageInfo = 0;

  configureSubscriptionShouldSync = self->_configureSubscriptionShouldSync;
  self->_configureSubscriptionShouldSync = 0;

  startStopSubscriptionDownload = self->_startStopSubscriptionDownload;
  self->_startStopSubscriptionDownload = 0;

  checkinWithSubscriptionStateSummary = self->_checkinWithSubscriptionStateSummary;
  self->_checkinWithSubscriptionStateSummary = 0;

  setSubscriptionStateSummary = self->_setSubscriptionStateSummary;
  self->_setSubscriptionStateSummary = 0;

  setObservedSubscriptionIdentifiers = self->_setObservedSubscriptionIdentifiers;
  self->_setObservedSubscriptionIdentifiers = 0;

  updateSubscriptionState = self->_updateSubscriptionState;
  self->_updateSubscriptionState = 0;

  self->_whichPayload = 0;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x400u;
  self->_type = a3;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 <= 99)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        return CFSTR("PING");
      }
      else if (a3 == 2)
      {
        return CFSTR("GET_STORAGE_INFO");
      }
      else
      {
LABEL_17:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v3;
      }
    }
    else
    {
      return CFSTR("INVALID");
    }
  }
  else
  {
    switch(a3)
    {
      case 'd':
        v3 = CFSTR("CONFIGURE_SUBSCRIPTION_SHOULD_SYNC");
        return v3;
      case 'e':
        result = CFSTR("START_STOP_SUBSCRIPTION_DOWNLOAD");
        break;
      case 'f':
        result = CFSTR("CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY");
        break;
      case 'g':
        result = CFSTR("SET_SUBSCRIPTION_STATE_SUMMARY");
        break;
      case 'h':
        result = CFSTR("SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS");
        break;
      case 'i':
        result = CFSTR("UPDATE_SUBSCRIPTION_STATE");
        break;
      default:
        goto LABEL_17;
    }
  }
  return result;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GET_STORAGE_INFO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONFIGURE_SUBSCRIPTION_SHOULD_SYNC")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("START_STOP_SUBSCRIPTION_DOWNLOAD")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SET_SUBSCRIPTION_STATE_SUMMARY")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS")) & 1) != 0)
  {
    v4 = 104;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UPDATE_SUBSCRIPTION_STATE")))
  {
    v4 = 105;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPairedDeviceMessageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMetadata_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasMetadata
{
  -[GEOPairedDeviceMessage _readMetadata]((uint64_t)self);
  return self->_metadata != 0;
}

- (GEOPairedDeviceMessageMetadata)metadata
{
  -[GEOPairedDeviceMessage _readMetadata]((uint64_t)self);
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (GEOPairedDevicePingRequest)ping
{
  PBDataReader *reader;
  PBDataReader *v4;
  GEOPairedDevicePingRequest *v5;

  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x20) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readPing_tags);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 1)
    v5 = self->_ping;
  else
    v5 = 0;
  return v5;
}

- (void)setPing:(id)a3
{
  GEOPairedDevicePingRequest *v4;
  GEOPairedDevicePingRequest *ping;

  v4 = (GEOPairedDevicePingRequest *)a3;
  *(_WORD *)&self->_flags |= 0x420u;
  -[GEOPairedDeviceMessage resetPayload](self, "resetPayload");
  ping = self->_ping;
  self->_ping = v4;

  if (v4)
    self->_whichPayload = 1;
}

- (GEOPairedDeviceGetStorageInfoRequest)getStorageInfo
{
  PBDataReader *reader;
  PBDataReader *v4;
  GEOPairedDeviceGetStorageInfoRequest *v5;

  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 8) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readGetStorageInfo_tags);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 2)
    v5 = self->_getStorageInfo;
  else
    v5 = 0;
  return v5;
}

- (void)setGetStorageInfo:(id)a3
{
  GEOPairedDeviceGetStorageInfoRequest *v4;
  GEOPairedDeviceGetStorageInfoRequest *getStorageInfo;

  v4 = (GEOPairedDeviceGetStorageInfoRequest *)a3;
  *(_WORD *)&self->_flags |= 0x408u;
  -[GEOPairedDeviceMessage resetPayload](self, "resetPayload");
  getStorageInfo = self->_getStorageInfo;
  self->_getStorageInfo = v4;

  if (v4)
    self->_whichPayload = 2;
}

- (GEOPairedDeviceConfigureSubscriptionShouldSyncRequest)configureSubscriptionShouldSync
{
  PBDataReader *reader;
  PBDataReader *v4;
  GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *v5;

  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 4) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readConfigureSubscriptionShouldSync_tags);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 3)
    v5 = self->_configureSubscriptionShouldSync;
  else
    v5 = 0;
  return v5;
}

- (void)setConfigureSubscriptionShouldSync:(id)a3
{
  GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *v4;
  GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *configureSubscriptionShouldSync;

  v4 = (GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *)a3;
  *(_WORD *)&self->_flags |= 0x404u;
  -[GEOPairedDeviceMessage resetPayload](self, "resetPayload");
  configureSubscriptionShouldSync = self->_configureSubscriptionShouldSync;
  self->_configureSubscriptionShouldSync = v4;

  if (v4)
    self->_whichPayload = 3;
}

- (GEOPairedDeviceSubscriptionStartStopDownloadRequest)startStopSubscriptionDownload
{
  PBDataReader *reader;
  PBDataReader *v4;
  GEOPairedDeviceSubscriptionStartStopDownloadRequest *v5;

  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readStartStopSubscriptionDownload_tags);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 4)
    v5 = self->_startStopSubscriptionDownload;
  else
    v5 = 0;
  return v5;
}

- (void)setStartStopSubscriptionDownload:(id)a3
{
  GEOPairedDeviceSubscriptionStartStopDownloadRequest *v4;
  GEOPairedDeviceSubscriptionStartStopDownloadRequest *startStopSubscriptionDownload;

  v4 = (GEOPairedDeviceSubscriptionStartStopDownloadRequest *)a3;
  *(_WORD *)&self->_flags |= 0x500u;
  -[GEOPairedDeviceMessage resetPayload](self, "resetPayload");
  startStopSubscriptionDownload = self->_startStopSubscriptionDownload;
  self->_startStopSubscriptionDownload = v4;

  if (v4)
    self->_whichPayload = 4;
}

- (GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest)checkinWithSubscriptionStateSummary
{
  PBDataReader *reader;
  PBDataReader *v4;
  GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *v5;

  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 2) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readCheckinWithSubscriptionStateSummary_tags);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 5)
    v5 = self->_checkinWithSubscriptionStateSummary;
  else
    v5 = 0;
  return v5;
}

- (void)setCheckinWithSubscriptionStateSummary:(id)a3
{
  GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *v4;
  GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *checkinWithSubscriptionStateSummary;

  v4 = (GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *)a3;
  *(_WORD *)&self->_flags |= 0x402u;
  -[GEOPairedDeviceMessage resetPayload](self, "resetPayload");
  checkinWithSubscriptionStateSummary = self->_checkinWithSubscriptionStateSummary;
  self->_checkinWithSubscriptionStateSummary = v4;

  if (v4)
    self->_whichPayload = 5;
}

- (GEOPairedDeviceSubscriptionStatesSummary)setSubscriptionStateSummary
{
  PBDataReader *reader;
  PBDataReader *v4;
  GEOPairedDeviceSubscriptionStatesSummary *v5;

  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x80) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readSetSubscriptionStateSummary_tags);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 6)
    v5 = self->_setSubscriptionStateSummary;
  else
    v5 = 0;
  return v5;
}

- (void)setSetSubscriptionStateSummary:(id)a3
{
  GEOPairedDeviceSubscriptionStatesSummary *v4;
  GEOPairedDeviceSubscriptionStatesSummary *setSubscriptionStateSummary;

  v4 = (GEOPairedDeviceSubscriptionStatesSummary *)a3;
  *(_WORD *)&self->_flags |= 0x480u;
  -[GEOPairedDeviceMessage resetPayload](self, "resetPayload");
  setSubscriptionStateSummary = self->_setSubscriptionStateSummary;
  self->_setSubscriptionStateSummary = v4;

  if (v4)
    self->_whichPayload = 6;
}

- (GEOPairedDeviceSubscriptionStateSynchronizationRequest)setObservedSubscriptionIdentifiers
{
  PBDataReader *reader;
  PBDataReader *v4;
  GEOPairedDeviceSubscriptionStateSynchronizationRequest *v5;

  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x40) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readSetObservedSubscriptionIdentifiers_tags);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 7)
    v5 = self->_setObservedSubscriptionIdentifiers;
  else
    v5 = 0;
  return v5;
}

- (void)setSetObservedSubscriptionIdentifiers:(id)a3
{
  GEOPairedDeviceSubscriptionStateSynchronizationRequest *v4;
  GEOPairedDeviceSubscriptionStateSynchronizationRequest *setObservedSubscriptionIdentifiers;

  v4 = (GEOPairedDeviceSubscriptionStateSynchronizationRequest *)a3;
  *(_WORD *)&self->_flags |= 0x440u;
  -[GEOPairedDeviceMessage resetPayload](self, "resetPayload");
  setObservedSubscriptionIdentifiers = self->_setObservedSubscriptionIdentifiers;
  self->_setObservedSubscriptionIdentifiers = v4;

  if (v4)
    self->_whichPayload = 7;
}

- (GEOPairedDeviceSubscriptionStateUpdate)updateSubscriptionState
{
  PBDataReader *reader;
  PBDataReader *v4;
  GEOPairedDeviceSubscriptionStateUpdate *v5;

  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readUpdateSubscriptionState_tags);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 8)
    v5 = self->_updateSubscriptionState;
  else
    v5 = 0;
  return v5;
}

- (void)setUpdateSubscriptionState:(id)a3
{
  GEOPairedDeviceSubscriptionStateUpdate *v4;
  GEOPairedDeviceSubscriptionStateUpdate *updateSubscriptionState;

  v4 = (GEOPairedDeviceSubscriptionStateUpdate *)a3;
  *(_WORD *)&self->_flags |= 0x600u;
  -[GEOPairedDeviceMessage resetPayload](self, "resetPayload");
  updateSubscriptionState = self->_updateSubscriptionState;
  self->_updateSubscriptionState = v4;

  if (v4)
    self->_whichPayload = 8;
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
  v8.super_class = (Class)GEOPairedDeviceMessage;
  -[GEOPairedDeviceMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPairedDeviceMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceMessage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(*(_QWORD *)(a1 + 120))
  {
    case 1:
      objc_msgSend((id)a1, "ping");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!v5)
        goto LABEL_37;
      if ((a2 & 1) != 0)
        objc_msgSend(v5, "jsonRepresentation");
      else
        objc_msgSend(v5, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("ping");
      break;
    case 2:
      objc_msgSend((id)a1, "getStorageInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v7;
      if (!v7)
        goto LABEL_37;
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v7, "jsonRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("getStorageInfo");
      }
      else
      {
        objc_msgSend(v7, "dictionaryRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("get_storage_info");
      }
      break;
    case 3:
      objc_msgSend((id)a1, "configureSubscriptionShouldSync");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v10;
      if (!v10)
        goto LABEL_37;
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v10, "jsonRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("configureSubscriptionShouldSync");
      }
      else
      {
        objc_msgSend(v10, "dictionaryRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("configure_subscription_should_sync");
      }
      break;
    case 4:
      objc_msgSend((id)a1, "startStopSubscriptionDownload");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v11;
      if (!v11)
        goto LABEL_37;
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v11, "jsonRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("startStopSubscriptionDownload");
      }
      else
      {
        objc_msgSend(v11, "dictionaryRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("start_stop_subscription_download");
      }
      break;
    case 5:
      objc_msgSend((id)a1, "checkinWithSubscriptionStateSummary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v12;
      if (!v12)
        goto LABEL_37;
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v12, "jsonRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("checkinWithSubscriptionStateSummary");
      }
      else
      {
        objc_msgSend(v12, "dictionaryRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("checkin_with_subscription_state_summary");
      }
      break;
    case 6:
      objc_msgSend((id)a1, "setSubscriptionStateSummary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v13;
      if (!v13)
        goto LABEL_37;
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v13, "jsonRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("setSubscriptionStateSummary");
      }
      else
      {
        objc_msgSend(v13, "dictionaryRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("set_subscription_state_summary");
      }
      break;
    case 7:
      objc_msgSend((id)a1, "setObservedSubscriptionIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v14;
      if (!v14)
        goto LABEL_37;
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v14, "jsonRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("setObservedSubscriptionIdentifiers");
      }
      else
      {
        objc_msgSend(v14, "dictionaryRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("set_observed_subscription_identifiers");
      }
      break;
    case 8:
      objc_msgSend((id)a1, "updateSubscriptionState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v15;
      if (!v15)
        goto LABEL_37;
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v15, "jsonRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("updateSubscriptionState");
      }
      else
      {
        objc_msgSend(v15, "dictionaryRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = CFSTR("update_subscription_state");
      }
      break;
    default:
      goto LABEL_38;
  }
  objc_msgSend(v4, "setObject:forKey:", v8, v9);

LABEL_37:
LABEL_38:
  v16 = *(_DWORD *)(a1 + 108);
  if (v16 <= 99)
  {
    if (v16)
    {
      if (v16 == 1)
      {
        v17 = CFSTR("PING");
      }
      else if (v16 == 2)
      {
        v17 = CFSTR("GET_STORAGE_INFO");
      }
      else
      {
LABEL_52:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 108));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v17 = CFSTR("INVALID");
    }
  }
  else
  {
    switch(v16)
    {
      case 'd':
        v17 = CFSTR("CONFIGURE_SUBSCRIPTION_SHOULD_SYNC");
        break;
      case 'e':
        v17 = CFSTR("START_STOP_SUBSCRIPTION_DOWNLOAD");
        break;
      case 'f':
        v17 = CFSTR("CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY");
        break;
      case 'g':
        v17 = CFSTR("SET_SUBSCRIPTION_STATE_SUMMARY");
        break;
      case 'h':
        v17 = CFSTR("SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS");
        break;
      case 'i':
        v17 = CFSTR("UPDATE_SUBSCRIPTION_STATE");
        break;
      default:
        goto LABEL_52;
    }
  }
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("type"));

  objc_msgSend((id)a1, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v18, "jsonRepresentation");
    else
      objc_msgSend(v18, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("metadata"));

  }
  v21 = *(void **)(a1 + 16);
  if (v21)
  {
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __52__GEOPairedDeviceMessage__dictionaryRepresentation___block_invoke;
      v28[3] = &unk_1E1C00600;
      v25 = v24;
      v29 = v25;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v28);
      v26 = v25;

      v23 = v26;
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPairedDeviceMessage _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEOPairedDeviceMessage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOPairedDeviceMessage)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceMessage *)-[GEOPairedDeviceMessage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  GEOPairedDeviceMessageMetadata *v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  if (!a1)
    goto LABEL_33;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_33;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INVALID")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PING")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("GET_STORAGE_INFO")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CONFIGURE_SUBSCRIPTION_SHOULD_SYNC")) & 1) != 0)
    {
      v8 = 100;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("START_STOP_SUBSCRIPTION_DOWNLOAD")) & 1) != 0)
    {
      v8 = 101;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY")) & 1) != 0)
    {
      v8 = 102;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SET_SUBSCRIPTION_STATE_SUMMARY")) & 1) != 0)
    {
      v8 = 103;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS")) & 1) != 0)
    {
      v8 = 104;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("UPDATE_SUBSCRIPTION_STATE")))
    {
      v8 = 105;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_26:
    objc_msgSend(a1, "setType:", v8);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [GEOPairedDeviceMessageMetadata alloc];
    if ((a3 & 1) != 0)
      v11 = -[GEOPairedDeviceMessageMetadata initWithJSON:](v10, "initWithJSON:", v9);
    else
      v11 = -[GEOPairedDeviceMessageMetadata initWithDictionary:](v10, "initWithDictionary:", v9);
    v12 = (void *)v11;
    objc_msgSend(a1, "setMetadata:", v11);

  }
LABEL_33:

  return a1;
}

- (GEOPairedDeviceMessage)initWithJSON:(id)a3
{
  return (GEOPairedDeviceMessage *)-[GEOPairedDeviceMessage _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_77;
    else
      v8 = (int *)&readAll__nonRecursiveTag_77;
    GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPairedDeviceMessageCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceMessageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceMessageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  unint64_t whichPayload;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPairedDeviceMessageIsDirty((uint64_t)self))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPairedDeviceMessage readAll:](self, "readAll:", 0);
    PBDataWriterWriteInt32Field();
    if (self->_metadata)
      PBDataWriterWriteSubmessage();
    whichPayload = self->_whichPayload;
    if (whichPayload == 1)
    {
      PBDataWriterWriteSubmessage();
      whichPayload = self->_whichPayload;
    }
    v6 = v9;
    if (whichPayload == 2)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
      whichPayload = self->_whichPayload;
    }
    if (whichPayload == 3)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
      whichPayload = self->_whichPayload;
    }
    if (whichPayload == 4)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
      whichPayload = self->_whichPayload;
    }
    if (whichPayload == 5)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
      whichPayload = self->_whichPayload;
    }
    if (whichPayload == 6)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
      whichPayload = self->_whichPayload;
    }
    if (whichPayload == 7)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
      whichPayload = self->_whichPayload;
    }
    if (whichPayload == 8)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t whichPayload;
  uint64_t v5;
  id v6;
  void *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEOPairedDeviceMessage readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 24) = self->_readerMarkPos;
  *((_DWORD *)v8 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPairedDeviceMessage resetPayload](self, "resetPayload");
  whichPayload = self->_whichPayload;
  if (whichPayload - 1 <= 7)
  {
    v5 = *off_1E1C156F8[whichPayload - 1];
    v6 = *(id *)((char *)&self->super.super.isa + v5);
    v7 = *(id *)((char *)v8 + v5);
    *(id *)((char *)v8 + v5) = v6;

    whichPayload = self->_whichPayload;
  }
  v8[15] = (id)whichPayload;
  *((_DWORD *)v8 + 27) = self->_type;
  if (self->_metadata)
    objc_msgSend(v8, "setMetadata:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  unint64_t whichPayload;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

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
      GEOPairedDeviceMessageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPairedDeviceMessage readAll:](self, "readAll:", 0);
  whichPayload = self->_whichPayload;
  switch(whichPayload)
  {
    case 1uLL:
      v9 = 56;
      goto LABEL_14;
    case 2uLL:
      v9 = 40;
      goto LABEL_14;
    case 3uLL:
      v9 = 32;
      goto LABEL_14;
    case 4uLL:
      v9 = 80;
      goto LABEL_14;
    case 5uLL:
      v9 = 24;
      goto LABEL_14;
    case 6uLL:
      v9 = 72;
      goto LABEL_14;
    case 7uLL:
      v9 = 64;
      goto LABEL_14;
    case 8uLL:
      v9 = 88;
LABEL_14:
      v10 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v9), "copyWithZone:", a3);
      v11 = *(void **)(v5 + v9);
      *(_QWORD *)(v5 + v9) = v10;

      whichPayload = self->_whichPayload;
      break;
    default:
      break;
  }
  *(_QWORD *)(v5 + 120) = whichPayload;
  *(_DWORD *)(v5 + 108) = self->_type;
  v12 = -[GEOPairedDeviceMessageMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  unint64_t whichPayload;
  uint64_t v6;
  GEOPairedDeviceMessageMetadata *metadata;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOPairedDeviceMessage readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        whichPayload = self->_whichPayload,
        whichPayload == v4[15]))
  {
    switch(whichPayload)
    {
      case 1uLL:
        v6 = 7;
        goto LABEL_11;
      case 2uLL:
        v6 = 5;
        goto LABEL_11;
      case 3uLL:
        v6 = 4;
        goto LABEL_11;
      case 4uLL:
        v6 = 10;
        goto LABEL_11;
      case 5uLL:
        v6 = 3;
        goto LABEL_11;
      case 6uLL:
        v6 = 9;
        goto LABEL_11;
      case 7uLL:
        v6 = 8;
LABEL_11:
        if ((objc_msgSend(*(id *)((char *)&self->super.super.isa + v6 * 8), "isEqual:", v4[v6]) & 1) != 0)
          goto LABEL_12;
        goto LABEL_17;
      case 8uLL:
        if (!-[GEOPairedDeviceSubscriptionStateUpdate isEqual:](self->_updateSubscriptionState, "isEqual:", v4[11]))
          goto LABEL_17;
        goto LABEL_12;
      default:
LABEL_12:
        if (self->_type != *((_DWORD *)v4 + 27))
          goto LABEL_17;
        metadata = self->_metadata;
        if ((unint64_t)metadata | v4[6])
          v8 = -[GEOPairedDeviceMessageMetadata isEqual:](metadata, "isEqual:");
        else
          v8 = 1;
        break;
    }
  }
  else
  {
LABEL_17:
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t whichPayload;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  -[GEOPairedDeviceMessage readAll:](self, "readAll:", 1);
  whichPayload = self->_whichPayload;
  v4 = 2654435761u * whichPayload;
  v5 = whichPayload - 1;
  if (v5 <= 7)
    v4 ^= objc_msgSend(*(id *)((char *)&self->super.super.isa + *off_1E1C15688[v5]), "hash");
  v6 = 2654435761 * self->_type;
  return v6 ^ v4 ^ -[GEOPairedDeviceMessageMetadata hash](self->_metadata, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  GEOPairedDeviceMessageMetadata *metadata;
  uint64_t v10;
  _QWORD *v11;

  v11 = a3;
  objc_msgSend(v11, "readAll:", 0);
  -[GEOPairedDeviceMessage resetPayload](self, "resetPayload");
  v4 = v11;
  v5 = v11[15];
  if (v5 - 1 <= 7)
  {
    v6 = *off_1E1C15738[v5 - 1];
    v7 = (objc_class *)*(id *)((char *)v11 + v6);
    v8 = *(Class *)((char *)&self->super.super.isa + v6);
    *(Class *)((char *)&self->super.super.isa + v6) = v7;

    v4 = v11;
    v5 = v11[15];
  }
  self->_whichPayload = v5;
  self->_type = *((_DWORD *)v4 + 27);
  metadata = self->_metadata;
  v10 = v4[6];
  if (metadata)
  {
    if (v10)
    {
      -[GEOPairedDeviceMessageMetadata mergeFrom:](metadata, "mergeFrom:");
LABEL_8:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[GEOPairedDeviceMessage setMetadata:](self, "setMetadata:");
    goto LABEL_8;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_15);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x401u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPairedDeviceMessage readAll:](self, "readAll:", 0);
    -[GEOPairedDeviceMessageMetadata clearUnknownFields:](self->_metadata, "clearUnknownFields:", 1);
    -[GEOPairedDevicePingRequest clearUnknownFields:](self->_ping, "clearUnknownFields:", 1);
    -[GEOPairedDeviceGetStorageInfoRequest clearUnknownFields:](self->_getStorageInfo, "clearUnknownFields:", 1);
    -[GEOPairedDeviceConfigureSubscriptionShouldSyncRequest clearUnknownFields:](self->_configureSubscriptionShouldSync, "clearUnknownFields:", 1);
    -[GEOPairedDeviceSubscriptionStartStopDownloadRequest clearUnknownFields:](self->_startStopSubscriptionDownload, "clearUnknownFields:", 1);
    -[GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest clearUnknownFields:](self->_checkinWithSubscriptionStateSummary, "clearUnknownFields:", 1);
    -[GEOPairedDeviceSubscriptionStatesSummary clearUnknownFields:](self->_setSubscriptionStateSummary, "clearUnknownFields:", 1);
    -[GEOPairedDeviceSubscriptionStateSynchronizationRequest clearUnknownFields:](self->_setObservedSubscriptionIdentifiers, "clearUnknownFields:", 1);
    -[GEOPairedDeviceSubscriptionStateUpdate clearUnknownFields:](self->_updateSubscriptionState, "clearUnknownFields:", 1);
  }
}

- (unint64_t)whichPayload
{
  return self->_whichPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateSubscriptionState, 0);
  objc_storeStrong((id *)&self->_startStopSubscriptionDownload, 0);
  objc_storeStrong((id *)&self->_setSubscriptionStateSummary, 0);
  objc_storeStrong((id *)&self->_setObservedSubscriptionIdentifiers, 0);
  objc_storeStrong((id *)&self->_ping, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_getStorageInfo, 0);
  objc_storeStrong((id *)&self->_configureSubscriptionShouldSync, 0);
  objc_storeStrong((id *)&self->_checkinWithSubscriptionStateSummary, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
