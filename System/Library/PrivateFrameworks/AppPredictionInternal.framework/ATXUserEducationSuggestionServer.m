@implementation ATXUserEducationSuggestionServer

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ATXUserEducationSuggestionServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_1 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_1, block);
  return (id)sharedInstance__pasExprOnceResult_1;
}

void __50__ATXUserEducationSuggestionServer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_1;
  sharedInstance__pasExprOnceResult_1 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXUserEducationSuggestionServer)init
{
  ATXUserEducationSuggestionServer *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  ATXUserEducationSuggestionConnector *connector;
  ATXUserEducationSuggestionCustomizeFocusServer *v10;
  ATXUserEducationSuggestionCustomizeFocusServer *customizeFocusServer;
  ATXUserEducationSuggestionSleepMigrationServer *v12;
  ATXUserEducationSuggestionSleepMigrationServer *sleepMigrationServer;
  ATXUserEducationSuggestionExploreFacesServer *v14;
  ATXUserEducationSuggestionExploreFacesServer *exploreFacesServer;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)ATXUserEducationSuggestionServer;
  v2 = -[ATXUserEducationSuggestionServer init](&v17, sel_init);
  if (v2)
  {
    __atxlog_handle_context_user_education_suggestions();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[ATXUserEducationSuggestionServer init]";
      _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%s: starting server", buf, 0xCu);
    }

    v4 = objc_alloc(MEMORY[0x1E0CF91A8]);
    v5 = *MEMORY[0x1E0CF9378];
    v6 = *MEMORY[0x1E0CF9370];
    v7 = (void *)objc_opt_new();
    v8 = objc_msgSend(v4, "initWithOurInterfaceFactory:theirInterfaceFactory:ourServiceName:theirServiceName:requestHandler:", MEMORY[0x1E0CF8BC0], MEMORY[0x1E0CF8BB0], v5, v6, v7);
    connector = v2->_connector;
    v2->_connector = (ATXUserEducationSuggestionConnector *)v8;

    v10 = -[ATXUserEducationSuggestionCustomizeFocusServer initWithConnector:]([ATXUserEducationSuggestionCustomizeFocusServer alloc], "initWithConnector:", v2->_connector);
    customizeFocusServer = v2->_customizeFocusServer;
    v2->_customizeFocusServer = v10;

    v12 = -[ATXUserEducationSuggestionSleepMigrationServer initWithConnector:]([ATXUserEducationSuggestionSleepMigrationServer alloc], "initWithConnector:", v2->_connector);
    sleepMigrationServer = v2->_sleepMigrationServer;
    v2->_sleepMigrationServer = v12;

    if ((objc_msgSend(MEMORY[0x1E0D81588], "isiPad") & 1) == 0)
    {
      v14 = -[ATXUserEducationSuggestionExploreFacesServer initWithConnector:]([ATXUserEducationSuggestionExploreFacesServer alloc], "initWithConnector:", v2->_connector);
      exploreFacesServer = v2->_exploreFacesServer;
      v2->_exploreFacesServer = v14;

    }
  }
  return v2;
}

- (ATXUserEducationSuggestionCustomizeFocusServer)customizeFocusServer
{
  return self->_customizeFocusServer;
}

- (ATXUserEducationSuggestionSleepMigrationServer)sleepMigrationServer
{
  return self->_sleepMigrationServer;
}

- (ATXUserEducationSuggestionExploreFacesServer)exploreFacesServer
{
  return self->_exploreFacesServer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exploreFacesServer, 0);
  objc_storeStrong((id *)&self->_sleepMigrationServer, 0);
  objc_storeStrong((id *)&self->_customizeFocusServer, 0);
  objc_storeStrong((id *)&self->_connector, 0);
}

@end
