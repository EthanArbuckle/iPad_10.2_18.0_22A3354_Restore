@implementation MOEffectiveSettings

- (MOEffectiveShieldSettings)shield
{
  return (MOEffectiveShieldSettings *)objc_getProperty(self, a2, 24, 1);
}

- (MOEffectiveSettings)init
{
  MOEffectiveSettings *v2;
  uint64_t v3;
  MOEffectiveAccountSettings *account;
  uint64_t v5;
  MOEffectiveAllowedClientSettings *allowedClient;
  uint64_t v7;
  MOEffectiveShieldSettings *shield;
  uint64_t v9;
  MOEffectiveUserSettings *user;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MOEffectiveSettings;
  v2 = -[MOEffectiveSettings init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    account = v2->_account;
    v2->_account = (MOEffectiveAccountSettings *)v3;

    v5 = objc_opt_new();
    allowedClient = v2->_allowedClient;
    v2->_allowedClient = (MOEffectiveAllowedClientSettings *)v5;

    v7 = objc_opt_new();
    shield = v2->_shield;
    v2->_shield = (MOEffectiveShieldSettings *)v7;

    v9 = objc_opt_new();
    user = v2->_user;
    v2->_user = (MOEffectiveUserSettings *)v9;

  }
  return v2;
}

- (MOEffectiveAccountSettings)account
{
  return (MOEffectiveAccountSettings *)objc_getProperty(self, a2, 8, 1);
}

- (MOEffectiveAllowedClientSettings)allowedClient
{
  return (MOEffectiveAllowedClientSettings *)objc_getProperty(self, a2, 16, 1);
}

- (MOEffectiveUserSettings)user
{
  return (MOEffectiveUserSettings *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_shield, 0);
  objc_storeStrong((id *)&self->_allowedClient, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

+ (void)subscribeForChangesInGroups:(id)a3 eventName:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  xpc_object_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  xpc_object_t v17;
  xpc_object_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[MOLogger xpc](MOLogger, "xpc");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v5;
    v25 = 2114;
    v26 = v6;
    _os_log_impl(&dword_1B4020000, v7, OS_LOG_TYPE_DEFAULT, "Subscribing for changes to settings groups: %{public}@ with event name: %{public}@", buf, 0x16u);
  }

  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "UTF8String");
  v9 = v5;
  if (v9)
  {
    v10 = xpc_array_create(0, 0);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, buf, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i));
          v17 = xpc_string_create((const char *)objc_msgSend(v16, "UTF8String", (_QWORD)v19));
          xpc_array_append_value(v10, v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, buf, 16);
      }
      while (v13);
    }

    v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v18, "SettingsGroups", v10);

  }
  else
  {
    v18 = 0;
  }

  xpc_set_event();
}

+ (void)startObservingChangesWithHandler:(id)a3
{
  id v3;
  id v4;
  _QWORD handler[4];
  id v6;

  v3 = a3;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __69__MOEffectiveSettings_EventStream__startObservingChangesWithHandler___block_invoke;
  handler[3] = &unk_1E675E8D8;
  v6 = v3;
  v4 = v3;
  xpc_set_event_stream_handler("com.apple.ManagedSettings.effective-settings.changed", 0, handler);

}

void __69__MOEffectiveSettings_EventStream__startObservingChangesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BYTE v9[24];
  void *v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81298]));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = (void *)objc_opt_new();
  xpc_dictionary_get_array(v5, "SettingsGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    *(_QWORD *)v9 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v9[8] = 3221225472;
    *(_QWORD *)&v9[16] = __MOSettingsGroupsWithXPCEvent_block_invoke;
    v10 = &unk_1E675E900;
    v11 = v6;
    xpc_array_apply(v7, v9);

  }
  +[MOLogger xpc](MOLogger, "xpc");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v9 = 138543618;
    *(_QWORD *)&v9[4] = v4;
    *(_WORD *)&v9[12] = 2114;
    *(_QWORD *)&v9[14] = v6;
    _os_log_impl(&dword_1B4020000, v8, OS_LOG_TYPE_DEFAULT, "Observed changes for event: %{public}@ with settings groups: %{public}@", v9, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
