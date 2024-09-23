@implementation MFUnreadCountProbe

+ (BOOL)addProbeWithConnection:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  sqlite3 *v7;
  char v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6)
  {
    v7 = (sqlite3 *)objc_msgSend(v4, "sqlDB");
    sqlite3_create_function(v7, "probe_message_update", -1, 1, a1, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))probeMessageUpdate, 0, 0);
    sqlite3_create_function(v7, "probe_message_add", -1, 1, a1, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))probeMessageAdd, 0, 0);
    sqlite3_create_function(v7, "probe_message_delete", -1, 1, a1, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))probeMessageDelete, 0, 0);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__MFUnreadCountProbe_addProbeWithConnection___block_invoke;
    v10[3] = &unk_1E4E8A850;
    v10[4] = &v11;
    v10[5] = v7;
    objc_msgSend(v4, "performWithOptions:transactionError:block:", 3, 0, v10);
  }
  v8 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v8;
}

BOOL __45__MFUnreadCountProbe_addProbeWithConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  const char *v5;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v2 = 0;
  v11 = *MEMORY[0x1E0C80C00];
  while (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v3 = sqlite3_exec(*(sqlite3 **)(a1 + 40), off_1E4E8EB08[v2], 0, 0, 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3 == 0;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      MFLogGeneral();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = sqlite3_errmsg(*(sqlite3 **)(a1 + 40));
        *(_DWORD *)buf = 67109378;
        v8 = v3;
        v9 = 2080;
        v10 = v5;
        _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "#Warning Error %d: %s", buf, 0x12u);
      }

    }
    if (++v2 == 3)
      return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != 0;
  }
  return 0;
}

@end
