@implementation BRCContainerMetadataSyncPersistedState

+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "clientState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("containerMetadataSync"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v6, "hasCaughtUpAtLeastOnce") & 1) == 0
      && (objc_msgSend(v6, "needsContainerMetadataSyncDown") & 1) == 0)
    {
      objc_msgSend(v6, "setHasCaughtUpAtLeastOnce:", 1);
    }
  }
  else
  {
    v9 = objc_opt_new();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("containerMetadataSync"));
    v6 = (void *)v9;
  }
  objc_msgSend(v4, "clientTruthWorkloop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAssertionQueue:", v7);

  return v6;
}

- (id)description
{
  void *v3;
  __CFString *v4;
  void *v5;

  -[BRCContainerMetadataSyncPersistedState lastSyncDownDate](self, "lastSyncDownDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (description_onceToken != -1)
      dispatch_once(&description_onceToken, &__block_literal_global_54);
    objc_msgSend((id)description_df, "stringFromDate:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("never");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p>: %@:%@ %@:%lld %@:%@"), self, CFSTR("serverChangeToken"), self->_serverChangeToken, CFSTR("requestID"), self->_requestID, CFSTR("lastSyncDate"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __53__BRCContainerMetadataSyncPersistedState_description__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)description_df;
  description_df = (uint64_t)v0;

  return objc_msgSend((id)description_df, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
}

- (BRCContainerMetadataSyncPersistedState)init
{
  BRCContainerMetadataSyncPersistedState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRCContainerMetadataSyncPersistedState;
  result = -[BRCContainerMetadataSyncPersistedState init](&v3, sel_init);
  if (result)
  {
    result->_needsContainerMetadataSyncDown = 1;
    result->_needsSharedDBSyncDown = 1;
  }
  return result;
}

- (BRCContainerMetadataSyncPersistedState)initWithCoder:(id)a3
{
  id v4;
  BRCContainerMetadataSyncPersistedState *v5;
  uint64_t v6;
  CKServerChangeToken *serverChangeToken;
  uint64_t v8;
  NSDate *lastSyncDownDate;
  uint64_t v10;
  CKOperationGroup *ckGroup;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCContainerMetadataSyncPersistedState;
  v5 = -[BRCPersistedState initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverChangeToken"));
    v6 = objc_claimAutoreleasedReturnValue();
    serverChangeToken = v5->_serverChangeToken;
    v5->_serverChangeToken = (CKServerChangeToken *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastSyncDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastSyncDownDate = v5->_lastSyncDownDate;
    v5->_lastSyncDownDate = (NSDate *)v8;

    v5->_needsContainerMetadataSyncDown = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isContainerMetadataSyncIdle")) ^ 1;
    v5->_needsSharedDBSyncDown = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSharedDBSyncIdle")) ^ 1;
    v5->_requestID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("requestID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ckGroup"));
    v10 = objc_claimAutoreleasedReturnValue();
    ckGroup = v5->_ckGroup;
    v5->_ckGroup = (CKOperationGroup *)v10;

    v5->_hasCaughtUpAtLeastOnce = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("containerMetadataHasCaughtUp"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  BRCContainerMetadataSyncPersistedState *v5;
  objc_super v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6.receiver = v5;
  v6.super_class = (Class)BRCContainerMetadataSyncPersistedState;
  -[BRCPersistedState encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", v5->_serverChangeToken, CFSTR("serverChangeToken"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_lastSyncDownDate, CFSTR("lastSyncDate"));
  objc_msgSend(v4, "encodeBool:forKey:", !v5->_needsContainerMetadataSyncDown, CFSTR("isContainerMetadataSyncIdle"));
  objc_msgSend(v4, "encodeBool:forKey:", !v5->_needsSharedDBSyncDown, CFSTR("isSharedDBSyncIdle"));
  objc_msgSend(v4, "encodeInt64:forKey:", v5->_requestID, CFSTR("requestID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5->_ckGroup, CFSTR("ckGroup"));
  objc_msgSend(v4, "encodeBool:forKey:", v5->_hasCaughtUpAtLeastOnce, CFSTR("containerMetadataHasCaughtUp"));
  objc_sync_exit(v5);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)updateWithServerChangeToken:(id)a3 requestID:(unint64_t)a4
{
  id v7;
  BRCContainerMetadataSyncPersistedState *v8;
  uint64_t v9;
  NSDate *lastSyncDownDate;
  unint64_t requestID;
  void *v12;
  NSObject *v13;
  int v14;
  BRCContainerMetadataSyncPersistedState *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = self;
  objc_sync_enter(v8);
  objc_storeStrong((id *)&v8->_serverChangeToken, a3);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = objc_claimAutoreleasedReturnValue();
  lastSyncDownDate = v8->_lastSyncDownDate;
  v8->_lastSyncDownDate = (NSDate *)v9;

  requestID = v8->_requestID;
  if (requestID < a4)
  {
    if (requestID)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v14 = 138412802;
        v15 = v8;
        v16 = 2048;
        v17 = a4;
        v18 = 2112;
        v19 = v12;
        _os_log_fault_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _requestID == 0 %@: got request ID: %llu%@", (uint8_t *)&v14, 0x20u);
      }

    }
    v8->_requestID = a4;
  }
  objc_sync_exit(v8);

}

- (void)containerMetadataWasReset
{
  CKServerChangeToken *serverChangeToken;
  NSDate *lastSyncDownDate;
  BRCContainerMetadataSyncPersistedState *obj;

  obj = self;
  objc_sync_enter(obj);
  serverChangeToken = obj->_serverChangeToken;
  obj->_serverChangeToken = 0;

  lastSyncDownDate = obj->_lastSyncDownDate;
  obj->_lastSyncDownDate = 0;

  objc_sync_exit(obj);
}

- (unint64_t)allocateNextRequestID
{
  BRCContainerMetadataSyncPersistedState *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_requestID + 1;
  v2->_requestID = v3;
  objc_sync_exit(v2);

  return v3;
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (NSDate)lastSyncDownDate
{
  return self->_lastSyncDownDate;
}

- (BOOL)needsContainerMetadataSyncDown
{
  return self->_needsContainerMetadataSyncDown;
}

- (void)setNeedsContainerMetadataSyncDown:(BOOL)a3
{
  self->_needsContainerMetadataSyncDown = a3;
}

- (BOOL)needsSharedDBSyncDown
{
  return self->_needsSharedDBSyncDown;
}

- (void)setNeedsSharedDBSyncDown:(BOOL)a3
{
  self->_needsSharedDBSyncDown = a3;
}

- (BOOL)hasCaughtUpAtLeastOnce
{
  return self->_hasCaughtUpAtLeastOnce;
}

- (void)setHasCaughtUpAtLeastOnce:(BOOL)a3
{
  self->_hasCaughtUpAtLeastOnce = a3;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (CKOperationGroup)ckGroup
{
  return self->_ckGroup;
}

- (void)setCkGroup:(id)a3
{
  objc_storeStrong((id *)&self->_ckGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckGroup, 0);
  objc_storeStrong((id *)&self->_lastSyncDownDate, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
}

@end
