@implementation BRCSyncOperationThrottleParams

- (double)doubleForKey:(id)a3 inParams:(id)a4 defaults:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v11 = v13;

  }
  return v11;
}

- (void)setupWithParams:(id)a3 defaults:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v6 = a4;
  v7 = a3;
  -[BRCSyncOperationThrottleParams doubleForKey:inParams:defaults:](self, "doubleForKey:inParams:defaults:", CFSTR("wait-at-least"), v7, v6);
  self->minWait = v8;
  -[BRCSyncOperationThrottleParams doubleForKey:inParams:defaults:](self, "doubleForKey:inParams:defaults:", CFSTR("wait-at-most"), v7, v6);
  self->maxWait = v9;
  -[BRCSyncOperationThrottleParams doubleForKey:inParams:defaults:](self, "doubleForKey:inParams:defaults:", CFSTR("success-ratio"), v7, v6);
  self->ratioOnSuccess = v10;
  -[BRCSyncOperationThrottleParams doubleForKey:inParams:defaults:](self, "doubleForKey:inParams:defaults:", CFSTR("quota-clear-ratio"), v7, v6);
  self->ratioOnQuotaErrorClear = v11;
  -[BRCSyncOperationThrottleParams doubleForKey:inParams:defaults:](self, "doubleForKey:inParams:defaults:", CFSTR("error-ratio"), v7, v6);
  self->ratioOnFailure = v12;
  -[BRCSyncOperationThrottleParams doubleForKey:inParams:defaults:](self, "doubleForKey:inParams:defaults:", CFSTR("kickback-delay"), v7, v6);
  self->inactivityKickbackDelay = v13;
  -[BRCSyncOperationThrottleParams doubleForKey:inParams:defaults:](self, "doubleForKey:inParams:defaults:", CFSTR("kickback-ratio"), v7, v6);
  v15 = v14;

  self->inactivityKickbackRatio = v15;
}

- (BOOL)check
{
  double minWait;
  double ratioOnSuccess;
  double ratioOnQuotaErrorClear;
  BOOL v6;
  double inactivityKickbackRatio;

  minWait = self->minWait;
  if (minWait < 0.0 || self->maxWait < minWait)
    return 0;
  ratioOnSuccess = self->ratioOnSuccess;
  if (ratioOnSuccess < 0.0 || ratioOnSuccess > 1.0)
    return 0;
  ratioOnQuotaErrorClear = self->ratioOnQuotaErrorClear;
  v6 = ratioOnQuotaErrorClear >= 0.0 && ratioOnQuotaErrorClear <= 1.0;
  if (!v6 || self->ratioOnFailure < 1.0 || self->inactivityKickbackDelay < 0.0)
    return 0;
  inactivityKickbackRatio = self->inactivityKickbackRatio;
  return inactivityKickbackRatio <= 1.0 && inactivityKickbackRatio >= 0.0;
}

- (BRCSyncOperationThrottleParams)initWithParams:(id)a3 defaults:(id)a4
{
  BRCSyncOperationThrottleParams *v6;
  id v7;
  BRCSyncOperationThrottleParams *v8;
  BRCSyncOperationThrottleParams *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  BRCSyncOperationThrottleParams *v13;
  objc_super v15;
  uint8_t buf[4];
  BRCSyncOperationThrottleParams *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (BRCSyncOperationThrottleParams *)a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BRCSyncOperationThrottleParams;
  v8 = -[BRCSyncOperationThrottleParams init](&v15, sel_init);
  if (!v8)
    goto LABEL_15;
  if (!v6)
    goto LABEL_14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[BRCSyncOperationThrottleParams setupWithParams:defaults:](v8, "setupWithParams:defaults:", v6, v7);
      if (-[BRCSyncOperationThrottleParams check](v8, "check"))
      {
LABEL_15:
        v9 = v8;
        goto LABEL_16;
      }
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, (os_log_type_t)0x90u))
        goto LABEL_13;
    }
    else
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, (os_log_type_t)0x90u))
        goto LABEL_13;
    }
    *(_DWORD *)buf = 138412802;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v10;
    v12 = "[ERROR] Invalid user defaults: %@, using %@%@";
    goto LABEL_18;
  }
  if (!-[BRCSyncOperationThrottleParams check](v6, "check"))
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v10;
      v12 = "[ERROR] Default value %@ is malformed, using %@%@";
LABEL_18:
      _os_log_error_impl(&dword_1CBD43000, v11, (os_log_type_t)0x90u, v12, buf, 0x20u);
    }
LABEL_13:

LABEL_14:
    -[BRCSyncOperationThrottleParams setupWithParams:defaults:](v8, "setupWithParams:defaults:", 0, v7);
    v6 = 0;
    goto LABEL_15;
  }
  v9 = v6;
  v6 = v9;
LABEL_16:
  v13 = v9;

  return v13;
}

- (id)paramsToDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("wait-at-least");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->minWait);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("wait-at-most");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->maxWait);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("success-ratio");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->ratioOnSuccess);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("quota-clear-ratio");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->ratioOnQuotaErrorClear);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  v12[4] = CFSTR("error-ratio");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->ratioOnFailure);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v7;
  v12[5] = CFSTR("kickback-delay");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->inactivityKickbackDelay);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v8;
  v12[6] = CFSTR("kickback-ratio");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->inactivityKickbackRatio);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  BRCSyncOperationThrottleParams *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (BRCSyncOperationThrottleParams *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[BRCSyncOperationThrottleParams paramsToDictionary](self, "paramsToDictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncOperationThrottleParams paramsToDictionary](v4, "paramsToDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[BRCSyncOperationThrottleParams paramsToDictionary](self, "paramsToDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (double)minWait
{
  return self->minWait;
}

- (void)setMinWait:(double)a3
{
  self->minWait = a3;
}

- (double)maxWait
{
  return self->maxWait;
}

- (void)setMaxWait:(double)a3
{
  self->maxWait = a3;
}

- (double)ratioOnSuccess
{
  return self->ratioOnSuccess;
}

- (void)setRatioOnSuccess:(double)a3
{
  self->ratioOnSuccess = a3;
}

- (double)ratioOnFailure
{
  return self->ratioOnFailure;
}

- (void)setRatioOnFailure:(double)a3
{
  self->ratioOnFailure = a3;
}

- (double)ratioOnQuotaErrorClear
{
  return self->ratioOnQuotaErrorClear;
}

- (void)setRatioOnQuotaErrorClear:(double)a3
{
  self->ratioOnQuotaErrorClear = a3;
}

- (double)inactivityKickbackDelay
{
  return self->inactivityKickbackDelay;
}

- (void)setInactivityKickbackDelay:(double)a3
{
  self->inactivityKickbackDelay = a3;
}

- (double)inactivityKickbackRatio
{
  return self->inactivityKickbackRatio;
}

- (void)setInactivityKickbackRatio:(double)a3
{
  self->inactivityKickbackRatio = a3;
}

@end
