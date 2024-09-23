@implementation _HFAlarmConnectionProvider

- (NSXPCConnection)alarmManagerServiceConnection
{
  _HFAlarmConnectionProvider *v2;
  NSXPCConnection *v3;
  id v4;
  uint64_t v5;
  NSXPCConnection *alarmManagerServiceConnection;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_alarmManagerServiceConnection;
  if (!v3)
  {
    if (!v2->_alarmManagerServiceConnection)
    {
      v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
      v5 = objc_msgSend(v4, "initWithMachServiceName:options:", *MEMORY[0x1E0D14870], 4096);
      alarmManagerServiceConnection = v2->_alarmManagerServiceConnection;
      v2->_alarmManagerServiceConnection = (NSXPCConnection *)v5;

    }
    objc_initWeak(&location, v2);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __59___HFAlarmConnectionProvider_alarmManagerServiceConnection__block_invoke;
    v12 = &unk_1EA728AE8;
    objc_copyWeak(&v13, &location);
    v7 = _Block_copy(&v9);
    -[NSXPCConnection setInterruptionHandler:](v2->_alarmManagerServiceConnection, "setInterruptionHandler:", v7, v9, v10, v11, v12);
    -[NSXPCConnection setInvalidationHandler:](v2->_alarmManagerServiceConnection, "setInvalidationHandler:", v7);
    v3 = v2->_alarmManagerServiceConnection;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmManagerServiceConnection, 0);
}

@end
