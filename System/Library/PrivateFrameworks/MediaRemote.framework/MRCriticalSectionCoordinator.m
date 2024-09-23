@implementation MRCriticalSectionCoordinator

+ (id)enterCriticalSection
{
  void *v2;
  char v3;
  MRCriticalSectionToken *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  MRCriticalSectionToken *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportCriticalSectionManagement");

  if ((v3 & 1) != 0)
  {
    v4 = objc_alloc_init(MRCriticalSectionToken);
    MRCreateXPCMessage(0x10000000000001BuLL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_int64(v5, "MRXPC_CRITICAL_SECTION_TRANSITION_KEY", 0);
    -[MRCriticalSectionToken requestID](v4, "requestID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v5, "MRXPC_CRITICAL_SECTION_IDENTIFIER_KEY", (const char *)objc_msgSend(v7, "UTF8String"));

    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mrXPCConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v11 = (id)objc_msgSend(v10, "sendSyncMessage:error:", v5, &v23);
    v12 = v23;

    if (v12)
    {
      _MRLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[MRCriticalSectionCoordinator enterCriticalSection].cold.1(v12, v13);

      v14 = 0;
    }
    else
    {
      v14 = v4;
    }

  }
  else
  {
    _MRLogForCategory(0);
    v4 = (MRCriticalSectionToken *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
      +[MRCriticalSectionCoordinator enterCriticalSection].cold.2(&v4->super, v15, v16, v17, v18, v19, v20, v21);
    v14 = 0;
  }

  return v14;
}

+ (void)exitCriticalSection:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportCriticalSectionManagement");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "setInvalidated:", 1);
    objc_msgSend(v3, "requestID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    +[MRCriticalSectionCoordinator exitCriticalSectionUsingRequestID:](MRCriticalSectionCoordinator, "exitCriticalSectionUsingRequestID:", v7);
  }
  else
  {
    _MRLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[MRCriticalSectionCoordinator enterCriticalSection].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

+ (void)exitCriticalSectionUsingRequestID:(id)a3
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v3 = a3;
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportCriticalSectionManagement");

  if ((v5 & 1) == 0)
  {
    _MRLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[MRCriticalSectionCoordinator enterCriticalSection].cold.2(v6, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_10;
  }
  if (v3)
  {
    MRCreateXPCMessage(0x10000000000001BuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_int64(v6, "MRXPC_CRITICAL_SECTION_TRANSITION_KEY", 1);
    objc_msgSend(v3, "UUIDString");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v6, "MRXPC_CRITICAL_SECTION_IDENTIFIER_KEY", (const char *)objc_msgSend(v7, "UTF8String"));

    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mrXPCConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v11 = (id)objc_msgSend(v10, "sendSyncMessage:error:", v6, &v21);
    v12 = v21;

    if (v12)
    {
      _MRLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[MRCriticalSectionCoordinator exitCriticalSectionUsingRequestID:].cold.1(v3, v12, v13);

    }
LABEL_10:

  }
}

+ (void)enterCriticalSection
{
  OUTLINED_FUNCTION_2_0(&dword_193827000, a1, a3, "critical section management is disabled. dropping message", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

+ (void)exitCriticalSectionUsingRequestID:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_193827000, a3, OS_LOG_TYPE_ERROR, "failed to exit critical section for requestID: %@. error: %@", (uint8_t *)&v7, 0x16u);

}

@end
