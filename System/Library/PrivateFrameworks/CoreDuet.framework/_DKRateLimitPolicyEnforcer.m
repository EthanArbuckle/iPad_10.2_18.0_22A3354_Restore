@implementation _DKRateLimitPolicyEnforcer

- (id)filterObjectsByEnforcingRateLimit:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_8;
        objc_msgSend(v10, "stream", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        +[_CDEventStreams rateLimiterForEventStreamName:](_CDEventStreams, "rateLimiterForEventStreamName:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
LABEL_8:
          +[_CDRateLimiter sharedRateLimiter](_CDRateLimiter, "sharedRateLimiter", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (objc_msgSend(v13, "debited"))
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)rateLimitPolicyEnforcer
{
  if (rateLimitPolicyEnforcer_onceToken != -1)
    dispatch_once(&rateLimitPolicyEnforcer_onceToken, &__block_literal_global_37);
  return (id)rateLimitPolicyEnforcer_enforcer;
}

- (void)creditForDeletion:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "stream");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          +[_CDEventStreams rateLimiterForEventStreamName:](_CDEventStreams, "rateLimiterForEventStreamName:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            +[_CDRateLimiter sharedRateLimiter](_CDRateLimiter, "sharedRateLimiter");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v11, "credit");

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

@end
