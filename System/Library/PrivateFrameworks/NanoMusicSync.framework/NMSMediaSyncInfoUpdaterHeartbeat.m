@implementation NMSMediaSyncInfoUpdaterHeartbeat

- (NMSMediaSyncInfoUpdaterHeartbeat)initWithBundleIdentifier:(id)a3
{
  id v5;
  NMSMediaSyncInfoUpdaterHeartbeat *v6;
  NMSMediaSyncInfoUpdaterHeartbeat *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NMSMediaSyncInfoUpdaterHeartbeat;
  v6 = -[NMSMediaSyncInfoUpdaterHeartbeat init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);

  return v7;
}

- (void)dealloc
{
  NSObject *currentSyncInfoRequestDateTimer;
  OS_dispatch_source *v4;
  objc_super v5;

  currentSyncInfoRequestDateTimer = self->_currentSyncInfoRequestDateTimer;
  if (currentSyncInfoRequestDateTimer)
  {
    dispatch_source_cancel(currentSyncInfoRequestDateTimer);
    v4 = self->_currentSyncInfoRequestDateTimer;
    self->_currentSyncInfoRequestDateTimer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)NMSMediaSyncInfoUpdaterHeartbeat;
  -[NMSMediaSyncInfoUpdaterHeartbeat dealloc](&v5, sel_dealloc);
}

- (void)start
{
  NSObject *v3;
  NSString *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *currentSyncInfoRequestDateTimer;
  NSObject *v7;
  _QWORD handler[4];
  NSString *v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[NMSMediaSyncInfoUpdaterHeartbeat start]";
    _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = self->_bundleIdentifier;
  if (!self->_currentSyncInfoRequestDateTimer)
  {
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    currentSyncInfoRequestDateTimer = self->_currentSyncInfoRequestDateTimer;
    self->_currentSyncInfoRequestDateTimer = v5;

    dispatch_source_set_timer((dispatch_source_t)self->_currentSyncInfoRequestDateTimer, 0, 0x37E11D600uLL, 0x3B9ACA00uLL);
    v7 = self->_currentSyncInfoRequestDateTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __41__NMSMediaSyncInfoUpdaterHeartbeat_start__block_invoke;
    handler[3] = &unk_24D646F30;
    v9 = v4;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_currentSyncInfoRequestDateTimer);

  }
}

void __41__NMSMediaSyncInfoUpdaterHeartbeat_start__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[NMSMediaSyncInfoUpdaterHeartbeat start]_block_invoke";
    v8 = 2112;
    v9 = v2;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "%s updating last sync info request date: %@ for bundleID: %@", (uint8_t *)&v6, 0x20u);
  }

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastSyncInfoRequestDate:forBundleIdentifier:", v2, *(_QWORD *)(a1 + 32));

}

- (void)stop
{
  NSObject *v3;
  NSObject *currentSyncInfoRequestDateTimer;
  OS_dispatch_source *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[NMSMediaSyncInfoUpdaterHeartbeat stop]";
    _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  currentSyncInfoRequestDateTimer = self->_currentSyncInfoRequestDateTimer;
  if (currentSyncInfoRequestDateTimer)
  {
    dispatch_source_cancel(currentSyncInfoRequestDateTimer);
    v5 = self->_currentSyncInfoRequestDateTimer;
    self->_currentSyncInfoRequestDateTimer = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_currentSyncInfoRequestDateTimer, 0);
}

@end
