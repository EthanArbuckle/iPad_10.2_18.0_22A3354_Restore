@implementation _ATXInternalInstallNotification

- (_ATXInternalInstallNotification)init
{
  _ATXInternalInstallNotification *v2;
  _ATXInternalNotification *v3;
  _ATXInternalNotification *note;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ATXInternalInstallNotification;
  v2 = -[_ATXInternalInstallNotification init](&v6, sel_init);
  if (v2)
  {
    v3 = -[_ATXInternalNotification initWithNotificationName:]([_ATXInternalNotification alloc], "initWithNotificationName:", CFSTR("com.apple.duetexpertd._ATXInternalInstallNotification.appInstalled"));
    note = v2->_note;
    v2->_note = v3;

  }
  return v2;
}

- (void)registerForNotificationsWithInstallBlock:(id)a3
{
  id v4;
  _ATXInternalNotification *note;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  note = self->_note;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76___ATXInternalInstallNotification_registerForNotificationsWithInstallBlock___block_invoke;
  v7[3] = &unk_1E82DFDD8;
  v8 = v4;
  v6 = v4;
  -[_ATXInternalNotification registerForNotifications:](note, "registerForNotifications:", v7);

}

+ (void)postNotificationWithInstallDictionary:(id)a3
{
  +[_ATXInternalNotification postData:forNotificationNamed:](_ATXInternalNotification, "postData:forNotificationNamed:", a3, CFSTR("com.apple.duetexpertd._ATXInternalInstallNotification.appInstalled"));
}

+ (id)_installedAppsWithDatesFromNotificationData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = v3;
    objc_msgSend(v4, "keysOfEntriesPassingTest:", &__block_literal_global_219);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v12, (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    v14 = (void *)objc_msgSend(v6, "copy");
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
}

@end
