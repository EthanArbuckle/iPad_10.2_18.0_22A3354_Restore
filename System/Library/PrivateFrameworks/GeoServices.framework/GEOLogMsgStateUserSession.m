@implementation GEOLogMsgStateUserSession

- (GEOSessionID)sessionId
{
  GEOSessionID *p_sessionId;
  unint64_t high;
  unint64_t low;
  GEOSessionID result;

  p_sessionId = &self->_sessionId;
  high = self->_sessionId._high;
  low = p_sessionId->_low;
  result._low = low;
  result._high = high;
  return result;
}

- (void)setSessionId:(GEOSessionID)a3
{
  *(_WORD *)&self->_flags |= 0x10u;
  self->_sessionId = a3;
}

- (void)setHasSessionId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasSessionId
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x400u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFBFF | v3;
}

- (BOOL)hasSequenceNumber
{
  return (*(_WORD *)&self->_flags >> 10) & 1;
}

- (double)relativeTimestamp
{
  return self->_relativeTimestamp;
}

- (void)setRelativeTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x100u;
  self->_relativeTimestamp = a3;
}

- (void)setHasRelativeTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasRelativeTimestamp
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (GEOSessionID)navSessionId
{
  GEOSessionID *p_navSessionId;
  unint64_t high;
  unint64_t low;
  GEOSessionID result;

  p_navSessionId = &self->_navSessionId;
  high = self->_navSessionId._high;
  low = p_navSessionId->_low;
  result._low = low;
  result._high = high;
  return result;
}

- (void)setNavSessionId:(GEOSessionID)a3
{
  *(_WORD *)&self->_flags |= 4u;
  self->_navSessionId = a3;
}

- (void)setHasNavSessionId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasNavSessionId
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (double)navSessionRelativeTimestamp
{
  return self->_navSessionRelativeTimestamp;
}

- (void)setNavSessionRelativeTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x80u;
  self->_navSessionRelativeTimestamp = a3;
}

- (void)setHasNavSessionRelativeTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasNavSessionRelativeTimestamp
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (BOOL)hasEventTime
{
  return self->_eventTime != 0;
}

- (GEOLocalTime)eventTime
{
  return self->_eventTime;
}

- (void)setEventTime:(id)a3
{
  objc_storeStrong((id *)&self->_eventTime, a3);
}

- (unint64_t)sessionEpoch
{
  return self->_sessionEpoch;
}

- (void)setSessionEpoch:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x200u;
  self->_sessionEpoch = a3;
}

- (void)setHasSessionEpoch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)hasSessionEpoch
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (double)ageOfSessionIdInSeconds
{
  return self->_ageOfSessionIdInSeconds;
}

- (void)setAgeOfSessionIdInSeconds:(double)a3
{
  *(_WORD *)&self->_flags |= 0x20u;
  self->_ageOfSessionIdInSeconds = a3;
}

- (void)setHasAgeOfSessionIdInSeconds:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasAgeOfSessionIdInSeconds
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (GEOSessionID)preSyncSessionId
{
  GEOSessionID *p_preSyncSessionId;
  unint64_t high;
  unint64_t low;
  GEOSessionID result;

  p_preSyncSessionId = &self->_preSyncSessionId;
  high = self->_preSyncSessionId._high;
  low = p_preSyncSessionId->_low;
  result._low = low;
  result._high = high;
  return result;
}

- (void)setPreSyncSessionId:(GEOSessionID)a3
{
  *(_WORD *)&self->_flags |= 8u;
  self->_preSyncSessionId = a3;
}

- (void)setHasPreSyncSessionId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasPreSyncSessionId
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (GEOSessionID)initialDeviceSessionId
{
  GEOSessionID *p_initialDeviceSessionId;
  unint64_t high;
  unint64_t low;
  GEOSessionID result;

  p_initialDeviceSessionId = &self->_initialDeviceSessionId;
  high = self->_initialDeviceSessionId._high;
  low = p_initialDeviceSessionId->_low;
  result._low = low;
  result._high = high;
  return result;
}

- (void)setInitialDeviceSessionId:(GEOSessionID)a3
{
  *(_WORD *)&self->_flags |= 2u;
  self->_initialDeviceSessionId = a3;
}

- (void)setHasInitialDeviceSessionId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasInitialDeviceSessionId
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (double)lastIcloudSyncDate
{
  return self->_lastIcloudSyncDate;
}

- (void)setLastIcloudSyncDate:(double)a3
{
  *(_WORD *)&self->_flags |= 0x40u;
  self->_lastIcloudSyncDate = a3;
}

- (void)setHasLastIcloudSyncDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasLastIcloudSyncDate
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (BOOL)didPreviouslyRotate
{
  return self->_didPreviouslyRotate;
}

- (void)setDidPreviouslyRotate:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1000u;
  self->_didPreviouslyRotate = a3;
}

- (void)setHasDidPreviouslyRotate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xEFFF | v3;
}

- (BOOL)hasDidPreviouslyRotate
{
  return (*(_WORD *)&self->_flags >> 12) & 1;
}

- (GEOSessionID)deviceLocalSessionId
{
  GEOSessionID *p_deviceLocalSessionId;
  unint64_t high;
  unint64_t low;
  GEOSessionID result;

  p_deviceLocalSessionId = &self->_deviceLocalSessionId;
  high = self->_deviceLocalSessionId._high;
  low = p_deviceLocalSessionId->_low;
  result._low = low;
  result._high = high;
  return result;
}

- (void)setDeviceLocalSessionId:(GEOSessionID)a3
{
  *(_WORD *)&self->_flags |= 1u;
  self->_deviceLocalSessionId = a3;
}

- (void)setHasDeviceLocalSessionId:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)hasDeviceLocalSessionId
{
  return *(_WORD *)&self->_flags & 1;
}

- (unsigned)userCohortValue
{
  return self->_userCohortValue;
}

- (void)setUserCohortValue:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x800u;
  self->_userCohortValue = a3;
}

- (void)setHasUserCohortValue:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xF7FF | v3;
}

- (BOOL)hasUserCohortValue
{
  return (*(_WORD *)&self->_flags >> 11) & 1;
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
  v8.super_class = (Class)GEOLogMsgStateUserSession;
  -[GEOLogMsgStateUserSession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateUserSession dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateUserSession _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 148);
  if ((v5 & 0x10) != 0)
  {
    _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 72));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("sessionId");
    else
      v13 = CFSTR("session_id");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

    v5 = *(_WORD *)(a1 + 148);
    if ((v5 & 0x400) == 0)
    {
LABEL_4:
      if ((v5 & 0x100) == 0)
        goto LABEL_5;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)(a1 + 148) & 0x400) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 136));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v15 = CFSTR("sequenceNumber");
  else
    v15 = CFSTR("sequence_number");
  objc_msgSend(v4, "setObject:forKey:", v14, v15);

  v5 = *(_WORD *)(a1 + 148);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 120));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v17 = CFSTR("relativeTimestamp");
  else
    v17 = CFSTR("relative_timestamp");
  objc_msgSend(v4, "setObject:forKey:", v16, v17);

  v5 = *(_WORD *)(a1 + 148);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_7;
  }
LABEL_26:
  _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 40));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v19 = CFSTR("navSessionId");
  else
    v19 = CFSTR("nav_session_id");
  objc_msgSend(v4, "setObject:forKey:", v18, v19);

  if ((*(_WORD *)(a1 + 148) & 0x80) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 112));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("navSessionRelativeTimestamp");
    else
      v7 = CFSTR("nav_session_relative_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_11:
  objc_msgSend((id)a1, "eventTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("eventTime");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("event_time");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  v20 = *(_WORD *)(a1 + 148);
  if ((v20 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 128));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("sessionEpoch");
    else
      v22 = CFSTR("session_epoch");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

    v20 = *(_WORD *)(a1 + 148);
    if ((v20 & 0x20) == 0)
    {
LABEL_35:
      if ((v20 & 8) == 0)
        goto LABEL_36;
      goto LABEL_50;
    }
  }
  else if ((v20 & 0x20) == 0)
  {
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 88));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v24 = CFSTR("ageOfSessionIdInSeconds");
  else
    v24 = CFSTR("age_of_session_id_in_seconds");
  objc_msgSend(v4, "setObject:forKey:", v23, v24);

  v20 = *(_WORD *)(a1 + 148);
  if ((v20 & 8) == 0)
  {
LABEL_36:
    if ((v20 & 2) == 0)
      goto LABEL_37;
    goto LABEL_54;
  }
LABEL_50:
  _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 56));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v26 = CFSTR("preSyncSessionId");
  else
    v26 = CFSTR("pre_sync_session_id");
  objc_msgSend(v4, "setObject:forKey:", v25, v26);

  v20 = *(_WORD *)(a1 + 148);
  if ((v20 & 2) == 0)
  {
LABEL_37:
    if ((v20 & 0x40) == 0)
      goto LABEL_38;
    goto LABEL_58;
  }
LABEL_54:
  _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 24));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v28 = CFSTR("initialDeviceSessionId");
  else
    v28 = CFSTR("initial_device_session_id");
  objc_msgSend(v4, "setObject:forKey:", v27, v28);

  v20 = *(_WORD *)(a1 + 148);
  if ((v20 & 0x40) == 0)
  {
LABEL_38:
    if ((v20 & 0x1000) == 0)
      goto LABEL_39;
    goto LABEL_62;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 104));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v30 = CFSTR("lastIcloudSyncDate");
  else
    v30 = CFSTR("last_icloud_sync_date");
  objc_msgSend(v4, "setObject:forKey:", v29, v30);

  v20 = *(_WORD *)(a1 + 148);
  if ((v20 & 0x1000) == 0)
  {
LABEL_39:
    if ((v20 & 1) == 0)
      goto LABEL_40;
    goto LABEL_66;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 144));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v32 = CFSTR("didPreviouslyRotate");
  else
    v32 = CFSTR("did_previously_rotate");
  objc_msgSend(v4, "setObject:forKey:", v31, v32);

  v20 = *(_WORD *)(a1 + 148);
  if ((v20 & 1) == 0)
  {
LABEL_40:
    if ((v20 & 0x800) == 0)
      return v4;
    goto LABEL_70;
  }
LABEL_66:
  _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 8));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v34 = CFSTR("deviceLocalSessionId");
  else
    v34 = CFSTR("device_local_session_id");
  objc_msgSend(v4, "setObject:forKey:", v33, v34);

  if ((*(_WORD *)(a1 + 148) & 0x800) != 0)
  {
LABEL_70:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 140));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v36 = CFSTR("userCohortValue");
    else
      v36 = CFSTR("user_cohort_value");
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateUserSession _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateUserSession)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateUserSession *)-[GEOLogMsgStateUserSession _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEOLocalTime *v18;
  uint64_t v19;
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
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  uint64_t v38;
  uint64_t v39;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("sessionId");
      else
        v6 = CFSTR("session_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = 0;
        v39 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v7, &v38);
        objc_msgSend(a1, "setSessionId:", v38, v39);
      }

      if (a3)
        v8 = CFSTR("sequenceNumber");
      else
        v8 = CFSTR("sequence_number");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSequenceNumber:", objc_msgSend(v9, "unsignedIntValue"));

      if (a3)
        v10 = CFSTR("relativeTimestamp");
      else
        v10 = CFSTR("relative_timestamp");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(a1, "setRelativeTimestamp:");
      }

      if (a3)
        v12 = CFSTR("navSessionId");
      else
        v12 = CFSTR("nav_session_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = 0;
        v39 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v13, &v38);
        objc_msgSend(a1, "setNavSessionId:", v38, v39);
      }

      if (a3)
        v14 = CFSTR("navSessionRelativeTimestamp");
      else
        v14 = CFSTR("nav_session_relative_timestamp");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "doubleValue");
        objc_msgSend(a1, "setNavSessionRelativeTimestamp:");
      }

      if (a3)
        v16 = CFSTR("eventTime");
      else
        v16 = CFSTR("event_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEOLocalTime alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEOLocalTime initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEOLocalTime initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setEventTime:", v19);

      }
      if (a3)
        v21 = CFSTR("sessionEpoch");
      else
        v21 = CFSTR("session_epoch");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSessionEpoch:", objc_msgSend(v22, "unsignedLongLongValue"));

      if (a3)
        v23 = CFSTR("ageOfSessionIdInSeconds");
      else
        v23 = CFSTR("age_of_session_id_in_seconds");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v24, "doubleValue");
        objc_msgSend(a1, "setAgeOfSessionIdInSeconds:");
      }

      if (a3)
        v25 = CFSTR("preSyncSessionId");
      else
        v25 = CFSTR("pre_sync_session_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = 0;
        v39 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v26, &v38);
        objc_msgSend(a1, "setPreSyncSessionId:", v38, v39);
      }

      if (a3)
        v27 = CFSTR("initialDeviceSessionId");
      else
        v27 = CFSTR("initial_device_session_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = 0;
        v39 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v28, &v38);
        objc_msgSend(a1, "setInitialDeviceSessionId:", v38, v39);
      }

      if (a3)
        v29 = CFSTR("lastIcloudSyncDate");
      else
        v29 = CFSTR("last_icloud_sync_date");
      objc_msgSend(v5, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v30, "doubleValue");
        objc_msgSend(a1, "setLastIcloudSyncDate:");
      }

      if (a3)
        v31 = CFSTR("didPreviouslyRotate");
      else
        v31 = CFSTR("did_previously_rotate");
      objc_msgSend(v5, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDidPreviouslyRotate:", objc_msgSend(v32, "BOOLValue"));

      if (a3)
        v33 = CFSTR("deviceLocalSessionId");
      else
        v33 = CFSTR("device_local_session_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = 0;
        v39 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v34, &v38);
        objc_msgSend(a1, "setDeviceLocalSessionId:", v38, v39);
      }

      if (a3)
        v35 = CFSTR("userCohortValue");
      else
        v35 = CFSTR("user_cohort_value");
      objc_msgSend(v5, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setUserCohortValue:", objc_msgSend(v36, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOLogMsgStateUserSession)initWithJSON:(id)a3
{
  return (GEOLogMsgStateUserSession *)-[GEOLogMsgStateUserSession _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateUserSessionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateUserSessionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;

  v4 = a3;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterPlaceMark();
    PBDataWriterWriteUint64Field();
    PBDataWriterWriteUint64Field();
    PBDataWriterRecallMark();
    flags = (__int16)self->_flags;
    if ((flags & 0x400) == 0)
    {
LABEL_3:
      if ((flags & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_22:
  PBDataWriterPlaceMark();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterRecallMark();
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
LABEL_6:
    PBDataWriterWriteDoubleField();
LABEL_7:
  if (self->_eventTime)
    PBDataWriterWriteSubmessage();
  v6 = (__int16)self->_flags;
  if ((v6 & 0x200) != 0)
  {
    PBDataWriterWriteUint64Field();
    v6 = (__int16)self->_flags;
    if ((v6 & 0x20) == 0)
    {
LABEL_11:
      if ((v6 & 8) == 0)
        goto LABEL_12;
      goto LABEL_26;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteDoubleField();
  v6 = (__int16)self->_flags;
  if ((v6 & 8) == 0)
  {
LABEL_12:
    if ((v6 & 2) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterPlaceMark();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterRecallMark();
  v6 = (__int16)self->_flags;
  if ((v6 & 2) == 0)
  {
LABEL_13:
    if ((v6 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterPlaceMark();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterRecallMark();
  v6 = (__int16)self->_flags;
  if ((v6 & 0x40) == 0)
  {
LABEL_14:
    if ((v6 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField();
  v6 = (__int16)self->_flags;
  if ((v6 & 0x1000) == 0)
  {
LABEL_15:
    if ((v6 & 1) == 0)
      goto LABEL_16;
LABEL_30:
    PBDataWriterPlaceMark();
    PBDataWriterWriteUint64Field();
    PBDataWriterWriteUint64Field();
    PBDataWriterRecallMark();
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  v6 = (__int16)self->_flags;
  if ((v6 & 1) != 0)
    goto LABEL_30;
LABEL_16:
  if ((v6 & 0x800) != 0)
LABEL_17:
    PBDataWriterWriteUint32Field();
LABEL_18:

}

- (void)copyTo:(id)a3
{
  char *v4;
  __int16 flags;
  __int16 v6;
  char *v7;

  v7 = (char *)a3;
  -[GEOLogMsgStateUserSession readAll:](self, "readAll:", 0);
  v4 = v7;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *(GEOSessionID *)(v7 + 72) = self->_sessionId;
    *((_WORD *)v7 + 74) |= 0x10u;
    flags = (__int16)self->_flags;
    if ((flags & 0x400) == 0)
    {
LABEL_3:
      if ((flags & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v7 + 34) = self->_sequenceNumber;
  *((_WORD *)v7 + 74) |= 0x400u;
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)v7 + 15) = *(_QWORD *)&self->_relativeTimestamp;
  *((_WORD *)v7 + 74) |= 0x100u;
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_22:
  *(GEOSessionID *)(v7 + 40) = self->_navSessionId;
  *((_WORD *)v7 + 74) |= 4u;
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
LABEL_6:
    *((_QWORD *)v7 + 14) = *(_QWORD *)&self->_navSessionRelativeTimestamp;
    *((_WORD *)v7 + 74) |= 0x80u;
  }
LABEL_7:
  if (self->_eventTime)
  {
    objc_msgSend(v7, "setEventTime:");
    v4 = v7;
  }
  v6 = (__int16)self->_flags;
  if ((v6 & 0x200) != 0)
  {
    *((_QWORD *)v4 + 16) = self->_sessionEpoch;
    *((_WORD *)v4 + 74) |= 0x200u;
    v6 = (__int16)self->_flags;
    if ((v6 & 0x20) == 0)
    {
LABEL_11:
      if ((v6 & 8) == 0)
        goto LABEL_12;
      goto LABEL_26;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  *((_QWORD *)v4 + 11) = *(_QWORD *)&self->_ageOfSessionIdInSeconds;
  *((_WORD *)v4 + 74) |= 0x20u;
  v6 = (__int16)self->_flags;
  if ((v6 & 8) == 0)
  {
LABEL_12:
    if ((v6 & 2) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *(GEOSessionID *)(v4 + 56) = self->_preSyncSessionId;
  *((_WORD *)v4 + 74) |= 8u;
  v6 = (__int16)self->_flags;
  if ((v6 & 2) == 0)
  {
LABEL_13:
    if ((v6 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  *(GEOSessionID *)(v4 + 24) = self->_initialDeviceSessionId;
  *((_WORD *)v4 + 74) |= 2u;
  v6 = (__int16)self->_flags;
  if ((v6 & 0x40) == 0)
  {
LABEL_14:
    if ((v6 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)v4 + 13) = *(_QWORD *)&self->_lastIcloudSyncDate;
  *((_WORD *)v4 + 74) |= 0x40u;
  v6 = (__int16)self->_flags;
  if ((v6 & 0x1000) == 0)
  {
LABEL_15:
    if ((v6 & 1) == 0)
      goto LABEL_16;
LABEL_30:
    *(GEOSessionID *)(v4 + 8) = self->_deviceLocalSessionId;
    *((_WORD *)v4 + 74) |= 1u;
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_29:
  v4[144] = self->_didPreviouslyRotate;
  *((_WORD *)v4 + 74) |= 0x1000u;
  v6 = (__int16)self->_flags;
  if ((v6 & 1) != 0)
    goto LABEL_30;
LABEL_16:
  if ((v6 & 0x800) != 0)
  {
LABEL_17:
    *((_DWORD *)v4 + 35) = self->_userCohortValue;
    *((_WORD *)v4 + 74) |= 0x800u;
  }
LABEL_18:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 flags;
  id v8;
  void *v9;
  __int16 v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *(GEOSessionID *)(v5 + 72) = self->_sessionId;
    *(_WORD *)(v5 + 148) |= 0x10u;
    flags = (__int16)self->_flags;
    if ((flags & 0x400) == 0)
    {
LABEL_3:
      if ((flags & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 136) = self->_sequenceNumber;
  *(_WORD *)(v5 + 148) |= 0x400u;
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *(double *)(v5 + 120) = self->_relativeTimestamp;
  *(_WORD *)(v5 + 148) |= 0x100u;
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_20:
  *(GEOSessionID *)(v5 + 40) = self->_navSessionId;
  *(_WORD *)(v5 + 148) |= 4u;
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
LABEL_6:
    *(double *)(v5 + 112) = self->_navSessionRelativeTimestamp;
    *(_WORD *)(v5 + 148) |= 0x80u;
  }
LABEL_7:
  v8 = -[GEOLocalTime copyWithZone:](self->_eventTime, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v8;

  v10 = (__int16)self->_flags;
  if ((v10 & 0x200) != 0)
  {
    *(_QWORD *)(v6 + 128) = self->_sessionEpoch;
    *(_WORD *)(v6 + 148) |= 0x200u;
    v10 = (__int16)self->_flags;
    if ((v10 & 0x20) == 0)
    {
LABEL_9:
      if ((v10 & 8) == 0)
        goto LABEL_10;
      goto LABEL_24;
    }
  }
  else if ((v10 & 0x20) == 0)
  {
    goto LABEL_9;
  }
  *(double *)(v6 + 88) = self->_ageOfSessionIdInSeconds;
  *(_WORD *)(v6 + 148) |= 0x20u;
  v10 = (__int16)self->_flags;
  if ((v10 & 8) == 0)
  {
LABEL_10:
    if ((v10 & 2) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *(GEOSessionID *)(v6 + 56) = self->_preSyncSessionId;
  *(_WORD *)(v6 + 148) |= 8u;
  v10 = (__int16)self->_flags;
  if ((v10 & 2) == 0)
  {
LABEL_11:
    if ((v10 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *(GEOSessionID *)(v6 + 24) = self->_initialDeviceSessionId;
  *(_WORD *)(v6 + 148) |= 2u;
  v10 = (__int16)self->_flags;
  if ((v10 & 0x40) == 0)
  {
LABEL_12:
    if ((v10 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *(double *)(v6 + 104) = self->_lastIcloudSyncDate;
  *(_WORD *)(v6 + 148) |= 0x40u;
  v10 = (__int16)self->_flags;
  if ((v10 & 0x1000) == 0)
  {
LABEL_13:
    if ((v10 & 1) == 0)
      goto LABEL_14;
LABEL_28:
    *(GEOSessionID *)(v6 + 8) = self->_deviceLocalSessionId;
    *(_WORD *)(v6 + 148) |= 1u;
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
      return (id)v6;
    goto LABEL_15;
  }
LABEL_27:
  *(_BYTE *)(v6 + 144) = self->_didPreviouslyRotate;
  *(_WORD *)(v6 + 148) |= 0x1000u;
  v10 = (__int16)self->_flags;
  if ((v10 & 1) != 0)
    goto LABEL_28;
LABEL_14:
  if ((v10 & 0x800) != 0)
  {
LABEL_15:
    *(_DWORD *)(v6 + 140) = self->_userCohortValue;
    *(_WORD *)(v6 + 148) |= 0x800u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $935DF3B29576F725C51CEB4E3E16265A flags;
  int v6;
  BOOL v8;
  GEOLocalTime *eventTime;
  BOOL v13;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_90;
  -[GEOLogMsgStateUserSession readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = v4[74];
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0)
      goto LABEL_90;
    if (self->_sessionId._high != *((_QWORD *)v4 + 9) || self->_sessionId._low != *((_QWORD *)v4 + 10))
      goto LABEL_90;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 34))
      goto LABEL_90;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_relativeTimestamp != *((double *)v4 + 15))
      goto LABEL_90;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_DWORD *)&flags & v6 & 4) == 0
    || (self->_navSessionId._high == *((_QWORD *)v4 + 5)
      ? (v8 = self->_navSessionId._low == *((_QWORD *)v4 + 6))
      : (v8 = 0),
        !v8))
  {
    if (((*(_DWORD *)&flags | v6) & 4) != 0)
      goto LABEL_90;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_navSessionRelativeTimestamp != *((double *)v4 + 14))
      goto LABEL_90;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_90;
  }
  eventTime = self->_eventTime;
  if ((unint64_t)eventTime | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOLocalTime isEqual:](eventTime, "isEqual:"))
      goto LABEL_90;
    flags = self->_flags;
    v6 = v4[74];
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_sessionEpoch != *((_QWORD *)v4 + 16))
      goto LABEL_90;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_ageOfSessionIdInSeconds != *((double *)v4 + 11))
      goto LABEL_90;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_BYTE *)&flags & 8) != 0 && (v6 & 8) != 0)
  {
    if (self->_preSyncSessionId._high != *((_QWORD *)v4 + 7) || self->_preSyncSessionId._low != *((_QWORD *)v4 + 8))
      goto LABEL_90;
  }
  else if (((*(_DWORD *)&flags | v6) & 8) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_BYTE *)&flags & 2) != 0 && (v6 & 2) != 0)
  {
    if (self->_initialDeviceSessionId._high != *((_QWORD *)v4 + 3)
      || self->_initialDeviceSessionId._low != *((_QWORD *)v4 + 4))
    {
      goto LABEL_90;
    }
  }
  else if (((*(_DWORD *)&flags | v6) & 2) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_lastIcloudSyncDate != *((double *)v4 + 13))
      goto LABEL_90;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0)
      goto LABEL_90;
    if (self->_didPreviouslyRotate)
    {
      if (!*((_BYTE *)v4 + 144))
        goto LABEL_90;
    }
    else if (*((_BYTE *)v4 + 144))
    {
      goto LABEL_90;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_BYTE *)&flags & 1) == 0 || (v6 & 1) == 0)
  {
    if (((*(_DWORD *)&flags | v6) & 1) == 0)
      goto LABEL_85;
LABEL_90:
    v13 = 0;
    goto LABEL_91;
  }
  if (self->_deviceLocalSessionId._high != *((_QWORD *)v4 + 1)
    || self->_deviceLocalSessionId._low != *((_QWORD *)v4 + 2))
  {
    goto LABEL_90;
  }
LABEL_85:
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_userCohortValue != *((_DWORD *)v4 + 35))
      goto LABEL_90;
    v13 = 1;
  }
  else
  {
    v13 = (v6 & 0x800) == 0;
  }
LABEL_91:

  return v13;
}

- (unint64_t)hash
{
  __int16 flags;
  double relativeTimestamp;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  double navSessionRelativeTimestamp;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  __int16 v14;
  double ageOfSessionIdInSeconds;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double lastIcloudSyncDate;
  double v23;
  long double v24;
  double v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;

  -[GEOLogMsgStateUserSession readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v36 = PBHashBytes();
    flags = (__int16)self->_flags;
  }
  else
  {
    v36 = 0;
  }
  if ((flags & 0x400) != 0)
  {
    v35 = 2654435761 * self->_sequenceNumber;
    if ((flags & 0x100) != 0)
      goto LABEL_6;
LABEL_11:
    v8 = 0;
    goto LABEL_14;
  }
  v35 = 0;
  if ((flags & 0x100) == 0)
    goto LABEL_11;
LABEL_6:
  relativeTimestamp = self->_relativeTimestamp;
  v5 = -relativeTimestamp;
  if (relativeTimestamp >= 0.0)
    v5 = self->_relativeTimestamp;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_14:
  v34 = v8;
  if ((flags & 4) != 0)
  {
    v33 = PBHashBytes();
    if ((*(_WORD *)&self->_flags & 0x80) != 0)
      goto LABEL_16;
LABEL_21:
    v13 = 0;
    goto LABEL_24;
  }
  v33 = 0;
  if ((flags & 0x80) == 0)
    goto LABEL_21;
LABEL_16:
  navSessionRelativeTimestamp = self->_navSessionRelativeTimestamp;
  v10 = -navSessionRelativeTimestamp;
  if (navSessionRelativeTimestamp >= 0.0)
    v10 = self->_navSessionRelativeTimestamp;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_24:
  v32 = -[GEOLocalTime hash](self->_eventTime, "hash");
  v14 = (__int16)self->_flags;
  if ((v14 & 0x200) != 0)
  {
    v31 = 2654435761u * self->_sessionEpoch;
    if ((v14 & 0x20) != 0)
      goto LABEL_26;
LABEL_31:
    v19 = 0;
    goto LABEL_34;
  }
  v31 = 0;
  if ((v14 & 0x20) == 0)
    goto LABEL_31;
LABEL_26:
  ageOfSessionIdInSeconds = self->_ageOfSessionIdInSeconds;
  v16 = -ageOfSessionIdInSeconds;
  if (ageOfSessionIdInSeconds >= 0.0)
    v16 = self->_ageOfSessionIdInSeconds;
  v17 = floor(v16 + 0.5);
  v18 = (v16 - v17) * 1.84467441e19;
  v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0)
      v19 += (unint64_t)v18;
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
LABEL_34:
  if ((v14 & 8) == 0)
  {
    v20 = 0;
    if ((v14 & 2) != 0)
      goto LABEL_36;
LABEL_42:
    v21 = 0;
    if ((v14 & 0x40) != 0)
      goto LABEL_37;
LABEL_43:
    v26 = 0;
    goto LABEL_46;
  }
  v20 = PBHashBytes();
  v14 = (__int16)self->_flags;
  if ((v14 & 2) == 0)
    goto LABEL_42;
LABEL_36:
  v21 = PBHashBytes();
  v14 = (__int16)self->_flags;
  if ((v14 & 0x40) == 0)
    goto LABEL_43;
LABEL_37:
  lastIcloudSyncDate = self->_lastIcloudSyncDate;
  v23 = -lastIcloudSyncDate;
  if (lastIcloudSyncDate >= 0.0)
    v23 = self->_lastIcloudSyncDate;
  v24 = floor(v23 + 0.5);
  v25 = (v23 - v24) * 1.84467441e19;
  v26 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
  if (v25 >= 0.0)
  {
    if (v25 > 0.0)
      v26 += (unint64_t)v25;
  }
  else
  {
    v26 -= (unint64_t)fabs(v25);
  }
LABEL_46:
  if ((v14 & 0x1000) == 0)
  {
    v27 = 0;
    if ((v14 & 1) != 0)
      goto LABEL_48;
LABEL_51:
    v28 = 0;
    if ((v14 & 0x800) != 0)
      goto LABEL_49;
LABEL_52:
    v29 = 0;
    return v35 ^ v36 ^ v34 ^ v33 ^ v13 ^ v31 ^ v19 ^ v20 ^ v21 ^ v26 ^ v27 ^ v28 ^ v29 ^ v32;
  }
  v27 = 2654435761 * self->_didPreviouslyRotate;
  if ((v14 & 1) == 0)
    goto LABEL_51;
LABEL_48:
  v28 = PBHashBytes();
  if ((*(_WORD *)&self->_flags & 0x800) == 0)
    goto LABEL_52;
LABEL_49:
  v29 = 2654435761 * self->_userCohortValue;
  return v35 ^ v36 ^ v34 ^ v33 ^ v13 ^ v31 ^ v19 ^ v20 ^ v21 ^ v26 ^ v27 ^ v28 ^ v29 ^ v32;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  __int16 v5;
  GEOLocalTime *eventTime;
  uint64_t v7;
  __int16 v8;
  char *v9;

  v9 = (char *)a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  v5 = *((_WORD *)v9 + 74);
  if ((v5 & 0x10) != 0)
  {
    self->_sessionId = *(GEOSessionID *)(v9 + 72);
    *(_WORD *)&self->_flags |= 0x10u;
    v5 = *((_WORD *)v9 + 74);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_WORD *)v9 + 74) & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_sequenceNumber = *((_DWORD *)v9 + 34);
  *(_WORD *)&self->_flags |= 0x400u;
  v5 = *((_WORD *)v9 + 74);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_relativeTimestamp = *((double *)v9 + 15);
  *(_WORD *)&self->_flags |= 0x100u;
  v5 = *((_WORD *)v9 + 74);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  self->_navSessionId = *(GEOSessionID *)(v9 + 40);
  *(_WORD *)&self->_flags |= 4u;
  if ((*((_WORD *)v9 + 74) & 0x80) != 0)
  {
LABEL_6:
    self->_navSessionRelativeTimestamp = *((double *)v9 + 14);
    *(_WORD *)&self->_flags |= 0x80u;
  }
LABEL_7:
  eventTime = self->_eventTime;
  v7 = *((_QWORD *)v9 + 12);
  if (eventTime)
  {
    if (!v7)
      goto LABEL_18;
    -[GEOLocalTime mergeFrom:](eventTime, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_18;
    -[GEOLogMsgStateUserSession setEventTime:](self, "setEventTime:");
  }
  v4 = v9;
LABEL_18:
  v8 = *((_WORD *)v4 + 74);
  if ((v8 & 0x200) != 0)
  {
    self->_sessionEpoch = *((_QWORD *)v4 + 16);
    *(_WORD *)&self->_flags |= 0x200u;
    v8 = *((_WORD *)v4 + 74);
    if ((v8 & 0x20) == 0)
    {
LABEL_20:
      if ((v8 & 8) == 0)
        goto LABEL_21;
      goto LABEL_30;
    }
  }
  else if ((v8 & 0x20) == 0)
  {
    goto LABEL_20;
  }
  self->_ageOfSessionIdInSeconds = *((double *)v4 + 11);
  *(_WORD *)&self->_flags |= 0x20u;
  v8 = *((_WORD *)v4 + 74);
  if ((v8 & 8) == 0)
  {
LABEL_21:
    if ((v8 & 2) == 0)
      goto LABEL_22;
    goto LABEL_31;
  }
LABEL_30:
  self->_preSyncSessionId = *(GEOSessionID *)(v4 + 56);
  *(_WORD *)&self->_flags |= 8u;
  v8 = *((_WORD *)v4 + 74);
  if ((v8 & 2) == 0)
  {
LABEL_22:
    if ((v8 & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_32;
  }
LABEL_31:
  self->_initialDeviceSessionId = *(GEOSessionID *)(v4 + 24);
  *(_WORD *)&self->_flags |= 2u;
  v8 = *((_WORD *)v4 + 74);
  if ((v8 & 0x40) == 0)
  {
LABEL_23:
    if ((v8 & 0x1000) == 0)
      goto LABEL_24;
    goto LABEL_33;
  }
LABEL_32:
  self->_lastIcloudSyncDate = *((double *)v4 + 13);
  *(_WORD *)&self->_flags |= 0x40u;
  v8 = *((_WORD *)v4 + 74);
  if ((v8 & 0x1000) == 0)
  {
LABEL_24:
    if ((v8 & 1) == 0)
      goto LABEL_25;
LABEL_34:
    self->_deviceLocalSessionId = *(GEOSessionID *)(v4 + 8);
    *(_WORD *)&self->_flags |= 1u;
    if ((*((_WORD *)v4 + 74) & 0x800) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_33:
  self->_didPreviouslyRotate = v4[144];
  *(_WORD *)&self->_flags |= 0x1000u;
  v8 = *((_WORD *)v4 + 74);
  if ((v8 & 1) != 0)
    goto LABEL_34;
LABEL_25:
  if ((v8 & 0x800) != 0)
  {
LABEL_26:
    self->_userCohortValue = *((_DWORD *)v4 + 35);
    *(_WORD *)&self->_flags |= 0x800u;
  }
LABEL_27:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTime, 0);
}

@end
