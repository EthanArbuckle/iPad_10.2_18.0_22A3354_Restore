@implementation IDSMessageHashStore

+ (id)sharedInstance
{
  if (qword_253F211D0 != -1)
    dispatch_once(&qword_253F211D0, &unk_24DE29C00);
  return (id)qword_253F211E0;
}

- (IDSMessageHashStore)init
{
  IDSMessageHashStore *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *ivarQueue;
  double v8;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IDSMessageHashStore;
  v2 = -[IDSMessageHashStore init](&v11, sel_init);
  if (v2)
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21B03C000, v3, OS_LOG_TYPE_DEFAULT, "Hash Store initialized", v10, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = dispatch_queue_create("IDSHashMessageStore", v5);
    ivarQueue = v2->_ivarQueue;
    v2->_ivarQueue = (OS_dispatch_queue *)v6;

    v2->_initialProcessTime = mach_continuous_time();
    objc_msgSend((id)MEMORY[0x22075BF7C](CFSTR("APSConnection"), CFSTR("ApplePushService")), "serverTime");
    v2->_initialServerTime = (unint64_t)v8;
    -[IDSMessageHashStore _performInitialHousekeeping](v2, "_performInitialHousekeeping");
    -[IDSMessageHashStore _startCleanupTimer](v2, "_startCleanupTimer");

  }
  return v2;
}

- (BOOL)containsMessageHash:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[5];
  id v14;
  __int128 *p_buf;
  uint8_t v16[4];
  id v17;
  __int128 buf;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_21B03C000, v5, OS_LOG_TYPE_DEFAULT, "Checking if message hash %@ is contained in the database", (uint8_t *)&buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v19 = 0x2020000000;
  v20 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_21B03EF90;
  v13[3] = &unk_24DE29C28;
  p_buf = &buf;
  v13[4] = self;
  v6 = v4;
  v14 = v6;
  sub_21B03DE40(v13);
  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
  {
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_21B03C000, v7, OS_LOG_TYPE_DEFAULT, "Database reports that this message hash %@ has been seen before", v16, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV();
    v8 = objc_alloc_init(MEMORY[0x24BE4FE20]);
    objc_msgSend(MEMORY[0x24BE4FE10], "defaultLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logMetric:", v8);

    +[IDSHashPersistenceAWDLogging sharedInstance](IDSHashPersistenceAWDLogging, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "duplicateMessageEncounted");

    v11 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
  }
  else
  {
    v11 = 0;
  }

  _Block_object_dispose(&buf, 8);
  return v11;
}

- (void)addMessageHash:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *ivarQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  IDSMessageHashStore *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_21B03F0A8;
  v12[3] = &unk_24DE29C50;
  v12[4] = self;
  v6 = v4;
  v13 = v6;
  sub_21B03DE40(v12);
  ivarQueue = self->_ivarQueue;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = sub_21B03F20C;
  v9[3] = &unk_24DE29C50;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(ivarQueue, v9);

}

- (void)updateCreationDateForHash:(id)a3
{
  id v4;
  NSObject *ivarQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_21B03F548;
  v7[3] = &unk_24DE29C50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(ivarQueue, v7);

}

- (unint64_t)_currentLocalTime
{
  void *v3;
  double v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  mach_timebase_info info;

  info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  if (mach_timebase_info(&info))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSince1970");
    v5 = (unint64_t)v4;

  }
  else
  {
    v6 = mach_continuous_time();
    v7 = -[IDSMessageHashStore initialProcessTime](self, "initialProcessTime");
    v8 = (v6 - v7) * info.numer / info.denom;
    return -[IDSMessageHashStore initialServerTime](self, "initialServerTime") + v8 / 0x3B9ACA00;
  }
  return v5;
}

- (void)_performInitialHousekeeping
{
  sub_21B03DE40(&unk_24DE29C70);
}

- (void)_setDatabaseCloseTimerOnIvarQueue
{
  OS_dispatch_source *v3;
  OS_dispatch_source *databaseCloseTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[5];

  sub_21B03DE34();
  self->_databaseLastUpdateTime = CFAbsoluteTimeGetCurrent();
  if (!self->_databaseCloseTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_ivarQueue);
    databaseCloseTimer = self->_databaseCloseTimer;
    self->_databaseCloseTimer = v3;

    v5 = self->_databaseCloseTimer;
    v6 = dispatch_time(0, 0x8BB2C90000);
    dispatch_source_set_timer(v5, v6, 0x7FFFFFFFFFFFFFFFuLL, 0xDF8474CCCuLL);
    v7 = self->_databaseCloseTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = sub_21B03F964;
    handler[3] = &unk_24DE29960;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_databaseCloseTimer);
  }
}

- (void)closeDatabase
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B03C000, v3, OS_LOG_TYPE_DEFAULT, "Closing database.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_21B03FAEC;
  v4[3] = &unk_24DE29960;
  v4[4] = self;
  sub_21B03DE40(v4);
}

- (void)_startCleanupTimer
{
  NSObject *v3;
  dispatch_source_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD handler[5];
  uint8_t buf[16];

  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B03C000, v3, OS_LOG_TYPE_DEBUG, "Scheduling Cleanup Timer", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  v4 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_ivarQueue);
  v5 = (void *)qword_253F211C0;
  qword_253F211C0 = (uint64_t)v4;

  v6 = qword_253F211C0;
  if (qword_253F211C0)
  {
    v7 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v6, v7, 0x8BB2C97000uLL, 0x3B9ACA00uLL);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = sub_21B03FC9C;
    handler[3] = &unk_24DE29960;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)qword_253F211C0, handler);
    dispatch_resume((dispatch_object_t)qword_253F211C0);
  }
}

- (void)_runCleanup
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B03C000, v3, OS_LOG_TYPE_DEBUG, "Scheduling timer called", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_21B03FDA0;
  v4[3] = &unk_24DE29960;
  v4[4] = self;
  sub_21B03DE40(v4);
}

- (unint64_t)initialProcessTime
{
  return self->_initialProcessTime;
}

- (void)setInitialProcessTime:(unint64_t)a3
{
  self->_initialProcessTime = a3;
}

- (unint64_t)initialServerTime
{
  return self->_initialServerTime;
}

- (void)setInitialServerTime:(unint64_t)a3
{
  self->_initialServerTime = a3;
}

- (OS_dispatch_queue)ivarQueue
{
  return self->_ivarQueue;
}

- (void)setIvarQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ivarQueue, a3);
}

- (OS_dispatch_source)databaseCloseTimer
{
  return self->_databaseCloseTimer;
}

- (void)setDatabaseCloseTimer:(id)a3
{
  objc_storeStrong((id *)&self->_databaseCloseTimer, a3);
}

- (double)databaseLastUpdateTime
{
  return self->_databaseLastUpdateTime;
}

- (void)setDatabaseLastUpdateTime:(double)a3
{
  self->_databaseLastUpdateTime = a3;
}

- (NSMutableArray)recentlySeenHashes
{
  return self->_recentlySeenHashes;
}

- (void)setRecentlySeenHashes:(id)a3
{
  objc_storeStrong((id *)&self->_recentlySeenHashes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlySeenHashes, 0);
  objc_storeStrong((id *)&self->_databaseCloseTimer, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
}

@end
