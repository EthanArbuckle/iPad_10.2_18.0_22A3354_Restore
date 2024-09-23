@implementation BRCStagePersistedState

+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v7;

  objc_msgSend(a3, "clientState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = objc_opt_new();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("stage"));
    v5 = (void *)v7;
  }

  return v5;
}

- (BRCStagePersistedState)init
{
  return -[BRCStagePersistedState initWithLatestGCStartTime:](self, "initWithLatestGCStartTime:", time(0));
}

- (BRCStagePersistedState)initWithLatestGCStartTime:(int64_t)a3
{
  BRCStagePersistedState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCStagePersistedState;
  result = -[BRCStagePersistedState init](&v5, sel_init);
  if (result)
    result->_latestGCStartTime = a3;
  return result;
}

- (int64_t)timeSinceLatestGCStartTime
{
  uint64_t v2;
  void *v3;
  NSObject *v4;

  v2 = time(0) - self->_latestGCStartTime;
  if (v2 < 0)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
      -[BRCStagePersistedState timeSinceLatestGCStartTime].cold.1(v2);

    return 0;
  }
  return v2;
}

- (BRCStagePersistedState)initWithCoder:(id)a3
{
  id v4;
  BRCStagePersistedState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRCStagePersistedState;
  v5 = -[BRCPersistedState initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_latestGCStartTime = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("gc"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCStagePersistedState;
  v4 = a3;
  -[BRCPersistedState encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_latestGCStartTime, CFSTR("gc"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("gc:%ld"), self->_latestGCStartTime);
}

- (void)timeSinceLatestGCStartTime
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = -a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v1, v2, "[ERROR] latest GC started %lld seconds in the future%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

@end
