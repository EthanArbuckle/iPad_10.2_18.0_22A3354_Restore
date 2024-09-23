@implementation GKUnauthenticatedPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unsigned int *v4;
  id v5;
  objc_super v6;

  v4 = (unsigned int *)(&self->super._allowMultiplayerFriendInvites + 1);
  v5 = a3;
  GKAtomicIncrement32(v4);
  v6.receiver = self;
  v6.super_class = (Class)GKUnauthenticatedPlayerInternal;
  -[GKPlayerInternal encodeWithCoder:](&v6, sel_encodeWithCoder_, v5);

  GKAtomicDecrement32(v4);
}

- (id)playerID
{
  id v2;
  void *v3;

  if (!*(_DWORD *)(&self->super._allowMultiplayerFriendInvites + 1))
  {
    if (!os_log_GKGeneral)
      v2 = GKOSLoggers();
    v3 = (void *)os_log_GKAccount;
    if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_DEBUG))
      -[GKUnauthenticatedPlayerInternal playerID].cold.1(v3);
  }
  return 0;
}

- (id)alias
{
  id v2;
  void *v3;

  if (!*(_DWORD *)(&self->super._allowMultiplayerFriendInvites + 1))
  {
    if (!os_log_GKGeneral)
      v2 = GKOSLoggers();
    v3 = (void *)os_log_GKAccount;
    if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_DEBUG))
      -[GKUnauthenticatedPlayerInternal alias].cold.1(v3);
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (void)playerID
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  GKStackTraceWithFrameLimit(5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_8(&dword_1BCDE3000, v3, v4, "asking for GKLocalPlayer playerID when player is not authenticated. Might be in the process of being authenticated or this is a race condition.Call stack:%@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)alias
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  GKStackTraceWithFrameLimit(5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_8(&dword_1BCDE3000, v3, v4, "asking for GKLocalPlayer playerID when player is not authenticated.Might be in the process of being authenticated or this is a race condition.Call stack:%@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
