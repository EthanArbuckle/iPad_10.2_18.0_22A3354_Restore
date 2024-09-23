@implementation _IMDLegacySpotlightClientStateManager

- (_IMDLegacySpotlightClientStateManager)init
{
  _IMDLegacySpotlightClientStateManager *v2;
  _IMDModernSpotlightClientStateManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_IMDLegacySpotlightClientStateManager;
  v2 = -[_IMDLegacySpotlightClientStateManager init](&v5, sel_init);
  if (v2 && objc_msgSend(MEMORY[0x1E0D39B00], "_needsMigrationToDefaults"))
  {
    v3 = objc_alloc_init(_IMDModernSpotlightClientStateManager);
    -[IMDSpotlightClientStateManager _migrateClientStateFromManager:](v2, "_migrateClientStateFromManager:", v3);

  }
  return v2;
}

- (void)_currentClientStateWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD, void *);
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD, void *))a3;
  sub_1ABB726B0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1ABC562B8();

    v3[2](v3, 0, v4);
  }
  else
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D39B00]), "initImportingFromDefaults");
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Current client state: %@", (uint8_t *)&v8, 0xCu);
    }

    v3[2](v3, v6, 0);
    v3 = (void (**)(id, _QWORD, void *))v6;
  }

}

- (void)_saveClientState:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  sub_1ABBD6E7C();
  IMLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Saving client state: %@", (uint8_t *)&v10, 0xCu);
  }

  sub_1ABB72BA8();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1ABC563DC();

    v6[2](v6, v8);
  }
  else
  {
    objc_msgSend(v5, "_writeToDefaults");
    notify_post("com.apple.imdpersistenceagent.notification.spotlightclientstateupdated");
    v6[2](v6, 0);
  }

}

@end
