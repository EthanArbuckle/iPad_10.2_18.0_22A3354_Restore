@implementation BRCServerChangeState

- (id)descriptionWithContext:(id)a3
{
  id v4;
  BRCServerChangeState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  CKServerChangeToken *changeToken;
  void *v13;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 64);
  -[BRCServerChangeState lastSyncDownDate](v5, "lastSyncDownDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dumpDateFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "stringFromDate:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("last-sync:%@"), v10);

  }
  else
  {
    objc_msgSend(v6, "appendString:", CFSTR("last-sync:never"));
  }
  if (v5->_clientRequestID)
    objc_msgSend(v6, "appendFormat:", CFSTR(", requestID:%llu"), v5->_clientRequestID);
  v11 = CFSTR(", inconsistent");
  switch(v5->_lastSyncDownStatus)
  {
    case 0:
      break;
    case 1:
      goto LABEL_9;
    case 2:
      v11 = CFSTR(", consistent");
      goto LABEL_9;
    case 3:
      v11 = CFSTR(", caught-up");
LABEL_9:
      objc_msgSend(v6, "appendString:", v11);
      break;
    default:
      objc_msgSend(v6, "appendFormat:", CFSTR(", status:%d(?)"), v5->_lastSyncDownStatus);
      break;
  }
  changeToken = v5->_changeToken;
  if (changeToken)
  {
    prettyPrintServerChangeToken(changeToken, (uint64_t)v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(", token:%@"), v13);

  }
  objc_sync_exit(v5);

  return v6;
}

- (id)description
{
  return -[BRCServerChangeState descriptionWithContext:](self, "descriptionWithContext:", 0);
}

- (BOOL)hasNeverSyncedDown
{
  BRCServerChangeState *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lastSyncDownDate == 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)updateWithServerChangeToken:(id)a3 clientRequestID:(unint64_t)a4 caughtUp:(BOOL)a5
{
  _BOOL4 v5;
  BRCServerChangeState *v9;
  uint64_t v10;
  NSDate *lastSyncDownDate;
  uint64_t v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v9 = self;
  objc_sync_enter(v9);
  objc_storeStrong((id *)&v9->_changeToken, a3);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = objc_claimAutoreleasedReturnValue();
  lastSyncDownDate = v9->_lastSyncDownDate;
  v9->_lastSyncDownDate = (NSDate *)v10;

  v12 = 2;
  if (v5)
    v12 = 3;
  v9->_lastSyncDownStatus = v12;
  v9->_clientRequestID = a4;
  objc_sync_exit(v9);

}

- (void)forgetChangeTokens
{
  CKServerChangeToken *changeToken;
  NSDate *lastSyncDownDate;
  BRCServerChangeState *obj;

  obj = self;
  objc_sync_enter(obj);
  changeToken = obj->_changeToken;
  obj->_changeToken = 0;

  lastSyncDownDate = obj->_lastSyncDownDate;
  obj->_lastSyncDownDate = 0;

  obj->_lastSyncDownStatus = 0;
  objc_sync_exit(obj);

}

- (void)forgetClientRequestID
{
  self->_clientRequestID = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BRCServerChangeState)initWithCoder:(id)a3
{
  id v4;
  BRCServerChangeState *v5;
  uint64_t v6;
  NSDate *lastSyncDownDate;
  uint64_t v8;
  CKServerChangeToken *changeToken;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRCServerChangeState;
  v5 = -[BRCServerChangeState init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lsdDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastSyncDownDate = v5->_lastSyncDownDate;
    v5->_lastSyncDownDate = (NSDate *)v6;

    v5->_lastSyncDownStatus = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("lsdStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
    v8 = objc_claimAutoreleasedReturnValue();
    changeToken = v5->_changeToken;
    v5->_changeToken = (CKServerChangeToken *)v8;

    v5->_clientRequestID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("requestID"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BRCServerChangeState *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v5, "encodeObject:forKey:", v4->_lastSyncDownDate, CFSTR("lsdDate"));
  objc_msgSend(v5, "encodeObject:forKey:", v4->_changeToken, CFSTR("token"));
  objc_msgSend(v5, "encodeInt64:forKey:", v4->_lastSyncDownStatus, CFSTR("lsdStatus"));
  objc_msgSend(v5, "encodeInt64:forKey:", v4->_clientRequestID, CFSTR("requestID"));
  objc_sync_exit(v4);

}

- (BRCServerChangeState)initWithServerSyncState:(id)a3
{
  id v4;
  BRCServerChangeState *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCServerChangeState;
  v5 = -[BRCServerChangeState init](&v8, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v5->_lastSyncDownDate, *((id *)v6 + 1));
    v5->_lastSyncDownStatus = *((_QWORD *)v6 + 2);
    objc_storeStrong((id *)&v5->_changeToken, *((id *)v6 + 3));
    v5->_clientRequestID = *((_QWORD *)v6 + 4);
    objc_sync_exit(v6);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithServerSyncState:", self);
}

- (NSDate)lastSyncDownDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLastSyncDownDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (int64_t)lastSyncDownStatus
{
  return self->_lastSyncDownStatus;
}

- (void)setLastSyncDownStatus:(int64_t)a3
{
  self->_lastSyncDownStatus = a3;
}

- (CKServerChangeToken)changeToken
{
  return self->_changeToken;
}

- (void)setChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_changeToken, a3);
}

- (unint64_t)clientRequestID
{
  return self->_clientRequestID;
}

- (void)setClientRequestID:(unint64_t)a3
{
  self->_clientRequestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_lastSyncDownDate, 0);
}

@end
