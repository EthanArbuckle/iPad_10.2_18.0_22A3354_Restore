@implementation CSAttendingSelfLogger

+ (void)emitAttendingContextEndedEventWithStopReason:(int64_t)a3 withMHUUID:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "+[CSAttendingSelfLogger emitAttendingContextEndedEventWithStopReason:withMHUUID:]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Mint a new MHUUID for attending ended events", (uint8_t *)&v21, 0xCu);
    }
  }
  v8 = objc_alloc_init(MEMORY[0x1E0D99A38]);
  v9 = objc_alloc_init(MEMORY[0x1E0D99A40]);
  if (a3 == 1)
  {
    v12 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "+[CSAttendingSelfLogger emitAttendingContextEndedEventWithStopReason:withMHUUID:]";
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Emit AttendingEnded with reason: New request started", (uint8_t *)&v21, 0xCu);
    }
    v11 = 1;
  }
  else if (a3 == 7)
  {
    v10 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "+[CSAttendingSelfLogger emitAttendingContextEndedEventWithStopReason:withMHUUID:]";
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Emit AttendingEnded with reason: UI requested", (uint8_t *)&v21, 0xCu);
    }
    v11 = 2;
  }
  else
  {
    v13 = *MEMORY[0x1E0D18F60];
    v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
    v11 = 0;
    if (v14)
    {
      v21 = 136315138;
      v22 = "+[CSAttendingSelfLogger emitAttendingContextEndedEventWithStopReason:withMHUUID:]";
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s Emit AttendingEnded with reason: Other reasons", (uint8_t *)&v21, 0xCu);
      v11 = 0;
    }
  }
  objc_msgSend(v9, "setEndReason:", v11);
  objc_msgSend(v8, "setEnded:", v9);
  v15 = objc_alloc_init(MEMORY[0x1E0D99A60]);
  v16 = objc_alloc_init(MEMORY[0x1E0D99A68]);
  v17 = objc_alloc(MEMORY[0x1E0D9A500]);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
  v19 = (void *)objc_msgSend(v17, "initWithNSUUID:", v18);
  objc_msgSend(v16, "setMhId:", v19);

  objc_msgSend(v15, "setEventMetadata:", v16);
  objc_msgSend(v15, "setAttendingContext:", v8);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "emitMessage:", v15);

}

+ (void)emitAttendingContextStartedEventWithAttendingOptions:(id)a3 withMHUUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315138;
      v23 = "+[CSAttendingSelfLogger emitAttendingContextStartedEventWithAttendingOptions:withMHUUID:]";
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Mint a new MHUUID for attending started events", (uint8_t *)&v22, 0xCu);
    }
  }
  v9 = objc_alloc_init(MEMORY[0x1E0D99A38]);
  v10 = objc_alloc_init(MEMORY[0x1E0D99A48]);
  if (objc_msgSend(v5, "attendingType") == 1)
  {
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315138;
      v23 = "+[CSAttendingSelfLogger emitAttendingContextStartedEventWithAttendingOptions:withMHUUID:]";
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Emit AttendingStarted with reason: Flexible FollowUp", (uint8_t *)&v22, 0xCu);
    }
    v12 = 1;
  }
  else if (objc_msgSend(v5, "attendingType") == 6 || objc_msgSend(v5, "attendingType") == 7)
  {
    v13 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315138;
      v23 = "+[CSAttendingSelfLogger emitAttendingContextStartedEventWithAttendingOptions:withMHUUID:]";
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s Emit AttendingStarted with reason: Announce Notification", (uint8_t *)&v22, 0xCu);
    }
    v12 = 2;
  }
  else
  {
    v20 = *MEMORY[0x1E0D18F60];
    v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
    v12 = 0;
    if (v21)
    {
      v22 = 136315138;
      v23 = "+[CSAttendingSelfLogger emitAttendingContextStartedEventWithAttendingOptions:withMHUUID:]";
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s Emit AttendingStarted with reason: Other reasons", (uint8_t *)&v22, 0xCu);
      v12 = 0;
    }
  }
  objc_msgSend(v10, "setStartReason:", v12);
  objc_msgSend(v9, "setStartedOrChanged:", v10);
  v14 = objc_alloc_init(MEMORY[0x1E0D99A60]);
  v15 = objc_alloc_init(MEMORY[0x1E0D99A68]);
  v16 = objc_alloc(MEMORY[0x1E0D9A500]);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
  v18 = (void *)objc_msgSend(v16, "initWithNSUUID:", v17);
  objc_msgSend(v15, "setMhId:", v18);

  objc_msgSend(v14, "setEventMetadata:", v15);
  objc_msgSend(v14, "setAttendingContext:", v9);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "emitMessage:", v14);

}

@end
