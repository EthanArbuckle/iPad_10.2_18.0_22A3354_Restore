@implementation BRAccountTokenWillChangeObserver

- (BRAccountTokenWillChangeObserver)initWithPersonaID:(id)a3
{
  NSString *v4;
  void *v5;
  NSObject *v6;
  NSString *personaID;
  NSString *v8;
  void *v9;

  v4 = (NSString *)a3;
  brc_bread_crumbs((uint64_t)"-[BRAccountTokenWillChangeObserver initWithPersonaID:]", 42);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRAccountTokenWillChangeObserver initWithPersonaID:].cold.1();

  personaID = self->_personaID;
  self->_personaID = v4;
  v8 = v4;

  +[BRAccount startAccountTokenChangeObserverIfNeeded](BRAccount, "startAccountTokenChangeObserverIfNeeded");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__accountWillChange, CFSTR("BRAccountTokenWillChangeNotification"), 0);

  return self;
}

- (void)_accountWillChange
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "personaID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_7(&dword_19CBF0000, a3, v6, "[DEBUG] received token change notification, invalidating cache for persona: %@%@", (uint8_t *)&v7);

}

- (NSString)personaID
{
  return self->_personaID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
}

- (void)initWithPersonaID:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_19CBF0000, v0, (uint64_t)v0, "[DEBUG] Initializing BRAccountTokenWillChangeObserver with persona: %@%@", v1);
  OUTLINED_FUNCTION_1();
}

@end
