@implementation BMPBScreenTimeRequestEvent

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (void)setEventTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventTime = a3;
}

- (void)setHasEventTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasRequesterDSID
{
  return self->_requesterDSID != 0;
}

- (BOOL)hasResponderDSID
{
  return self->_responderDSID != 0;
}

- (int)kind
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_kind;
  else
    return 0;
}

- (void)setKind:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_kind = a3;
}

- (void)setHasKind:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasKind
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)kindAsString:(int)a3
{
  if (a3 < 3)
    return off_1E26483A0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKind:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("website")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("app")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)status
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 < 4)
    return off_1E26483B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("pending")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("declined")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("approved")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)approvalTime
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_approvalTime;
  else
    return 0;
}

- (void)setApprovalTime:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_approvalTime = a3;
}

- (void)setHasApprovalTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasApprovalTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)approvalTimeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E26483D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsApprovalTime:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("time15")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("time60")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("allDay")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasWebsitePath
{
  return self->_websitePath != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setIsActionUserDevice:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isActionUserDevice = a3;
}

- (void)setHasIsActionUserDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsActionUserDevice
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)BMPBScreenTimeRequestEvent;
  -[BMPBScreenTimeRequestEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBScreenTimeRequestEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *requestID;
  void *v6;
  NSString *requesterDSID;
  NSString *responderDSID;
  char has;
  uint64_t kind;
  __CFString *v11;
  uint64_t status;
  __CFString *v13;
  uint64_t approvalTime;
  __CFString *v15;
  NSString *websitePath;
  NSString *bundleID;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestID = self->_requestID;
  if (requestID)
    objc_msgSend(v3, "setObject:forKey:", requestID, CFSTR("requestID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_eventTime);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("eventTime"));

  }
  requesterDSID = self->_requesterDSID;
  if (requesterDSID)
    objc_msgSend(v4, "setObject:forKey:", requesterDSID, CFSTR("requesterDSID"));
  responderDSID = self->_responderDSID;
  if (responderDSID)
    objc_msgSend(v4, "setObject:forKey:", responderDSID, CFSTR("responderDSID"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    kind = self->_kind;
    if (kind >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_kind);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E26483A0[kind];
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("kind"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 2) == 0)
        goto LABEL_25;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  status = self->_status;
  if (status >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_status);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E26483B8[status];
  }
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("status"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_21:
    approvalTime = self->_approvalTime;
    if (approvalTime >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_approvalTime);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E26483D8[approvalTime];
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("approvalTime"));

  }
LABEL_25:
  websitePath = self->_websitePath;
  if (websitePath)
    objc_msgSend(v4, "setObject:forKey:", websitePath, CFSTR("websitePath"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v4, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isActionUserDevice);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("isActionUserDevice"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBScreenTimeRequestEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_requestID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_requesterDSID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_responderDSID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 2) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_12:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_13:
  if (self->_websitePath)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_requestID)
  {
    objc_msgSend(v4, "setRequestID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_eventTime;
    *((_BYTE *)v4 + 84) |= 1u;
  }
  if (self->_requesterDSID)
  {
    objc_msgSend(v6, "setRequesterDSID:");
    v4 = v6;
  }
  if (self->_responderDSID)
  {
    objc_msgSend(v6, "setResponderDSID:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_kind;
    *((_BYTE *)v4 + 84) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 2) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v4 + 16) = self->_status;
  *((_BYTE *)v4 + 84) |= 8u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 4) = self->_approvalTime;
    *((_BYTE *)v4 + 84) |= 2u;
  }
LABEL_13:
  if (self->_websitePath)
  {
    objc_msgSend(v6, "setWebsitePath:");
    v4 = v6;
  }
  if (self->_bundleID)
  {
    objc_msgSend(v6, "setBundleID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_BYTE *)v4 + 80) = self->_isActionUserDevice;
    *((_BYTE *)v4 + 84) |= 0x10u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char has;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_eventTime;
    *(_BYTE *)(v5 + 84) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_requesterDSID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[NSString copyWithZone:](self->_responderDSID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_kind;
    *(_BYTE *)(v5 + 84) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v5 + 64) = self->_status;
  *(_BYTE *)(v5 + 84) |= 8u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 16) = self->_approvalTime;
    *(_BYTE *)(v5 + 84) |= 2u;
  }
LABEL_7:
  v13 = -[NSString copyWithZone:](self->_websitePath, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v13;

  v15 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v15;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 80) = self->_isActionUserDevice;
    *(_BYTE *)(v5 + 84) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *requestID;
  NSString *requesterDSID;
  NSString *responderDSID;
  NSString *websitePath;
  NSString *bundleID;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  requestID = self->_requestID;
  if ((unint64_t)requestID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](requestID, "isEqual:"))
      goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_eventTime != *((double *)v4 + 1))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    goto LABEL_34;
  }
  requesterDSID = self->_requesterDSID;
  if ((unint64_t)requesterDSID | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](requesterDSID, "isEqual:"))
  {
    goto LABEL_34;
  }
  responderDSID = self->_responderDSID;
  if ((unint64_t)responderDSID | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](responderDSID, "isEqual:"))
      goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 4) == 0 || self->_kind != *((_DWORD *)v4 + 8))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 84) & 4) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 8) == 0 || self->_status != *((_DWORD *)v4 + 16))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 84) & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 2) == 0 || self->_approvalTime != *((_DWORD *)v4 + 4))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 84) & 2) != 0)
  {
    goto LABEL_34;
  }
  websitePath = self->_websitePath;
  if ((unint64_t)websitePath | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](websitePath, "isEqual:"))
  {
    goto LABEL_34;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:"))
      goto LABEL_34;
  }
  v10 = (*((_BYTE *)v4 + 84) & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 0x10) == 0)
    {
LABEL_34:
      v10 = 0;
      goto LABEL_35;
    }
    if (self->_isActionUserDevice)
    {
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_34;
    }
    else if (*((_BYTE *)v4 + 80))
    {
      goto LABEL_34;
    }
    v10 = 1;
  }
LABEL_35:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  double eventTime;
  double v5;
  long double v6;
  double v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  NSUInteger v17;

  v17 = -[NSString hash](self->_requestID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    eventTime = self->_eventTime;
    v5 = -eventTime;
    if (eventTime >= 0.0)
      v5 = self->_eventTime;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSString hash](self->_requesterDSID, "hash");
  v9 = -[NSString hash](self->_responderDSID, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_11;
LABEL_14:
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_12;
    goto LABEL_15;
  }
  v10 = 2654435761 * self->_kind;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_14;
LABEL_11:
  v11 = 2654435761 * self->_status;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_12:
    v12 = 2654435761 * self->_approvalTime;
    goto LABEL_16;
  }
LABEL_15:
  v12 = 0;
LABEL_16:
  v13 = -[NSString hash](self->_websitePath, "hash");
  v14 = -[NSString hash](self->_bundleID, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v15 = 2654435761 * self->_isActionUserDevice;
  else
    v15 = 0;
  return v3 ^ v17 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[BMPBScreenTimeRequestEvent setRequestID:](self, "setRequestID:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    self->_eventTime = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[BMPBScreenTimeRequestEvent setRequesterDSID:](self, "setRequesterDSID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[BMPBScreenTimeRequestEvent setResponderDSID:](self, "setResponderDSID:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 84);
  if ((v5 & 4) != 0)
  {
    self->_kind = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 84);
    if ((v5 & 8) == 0)
    {
LABEL_11:
      if ((v5 & 2) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 84) & 8) == 0)
  {
    goto LABEL_11;
  }
  self->_status = *((_DWORD *)v4 + 16);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 84) & 2) != 0)
  {
LABEL_12:
    self->_approvalTime = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_13:
  if (*((_QWORD *)v4 + 9))
  {
    -[BMPBScreenTimeRequestEvent setWebsitePath:](self, "setWebsitePath:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[BMPBScreenTimeRequestEvent setBundleID:](self, "setBundleID:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 84) & 0x10) != 0)
  {
    self->_isActionUserDevice = *((_BYTE *)v4 + 80);
    *(_BYTE *)&self->_has |= 0x10u;
  }

}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
}

- (double)eventTime
{
  return self->_eventTime;
}

- (NSString)requesterDSID
{
  return self->_requesterDSID;
}

- (void)setRequesterDSID:(id)a3
{
  objc_storeStrong((id *)&self->_requesterDSID, a3);
}

- (NSString)responderDSID
{
  return self->_responderDSID;
}

- (void)setResponderDSID:(id)a3
{
  objc_storeStrong((id *)&self->_responderDSID, a3);
}

- (NSString)websitePath
{
  return self->_websitePath;
}

- (void)setWebsitePath:(id)a3
{
  objc_storeStrong((id *)&self->_websitePath, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (BOOL)isActionUserDevice
{
  return self->_isActionUserDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_websitePath, 0);
  objc_storeStrong((id *)&self->_responderDSID, 0);
  objc_storeStrong((id *)&self->_requesterDSID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
