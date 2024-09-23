@implementation _EXSceneSessionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_12);
  return (id)sharedInstance_sharedInstance_0;
}

- (id)_init
{
  _EXSceneSessionManager *v2;
  uint64_t v3;
  NSMutableDictionary *sessions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_EXSceneSessionManager;
  v2 = -[_EXSceneSessionManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    sessions = v2->__sessions;
    v2->__sessions = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)addSession:(id)a3
{
  id v4;
  NSMutableDictionary *sessions;
  void *v6;
  NSObject *v7;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  sessions = self->__sessions;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](sessions, "setObject:forKey:", v4, v6);

  _EXDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_EXSceneSessionManager addSession:].cold.1();

}

- (id)sessionForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSMutableDictionary objectForKey:](self->__sessions, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)removeSessionForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSMutableDictionary removeObjectForKey:](self->__sessions, "removeObjectForKey:", v4);
  _EXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_EXSceneSessionManager removeSessionForIdentifier:].cold.1();

}

- (id)sessions
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  return (id)-[NSMutableDictionary allValues](self->__sessions, "allValues");
}

- (NSMutableDictionary)_sessions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__sessions, 0);
}

- (void)addSession:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_190C25000, v0, v1, "%{public}@ Added session: %{public}@");
}

- (void)removeSessionForIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_190C25000, v0, v1, "%{public}@ removed session with identifier: %{public}@");
}

@end
