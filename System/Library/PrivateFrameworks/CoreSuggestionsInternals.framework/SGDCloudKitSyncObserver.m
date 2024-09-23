@implementation SGDCloudKitSyncObserver

- (SGDCloudKitSyncObserver)initWithCloudKitSyncGetter:(id)a3
{
  id v4;
  SGDCloudKitSyncObserver *v5;
  uint64_t v6;
  id cksGetter;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGDCloudKitSyncObserver;
  v5 = -[SGDCloudKitSyncObserver init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    cksGetter = v5->_cksGetter;
    v5->_cksGetter = (id)v6;

  }
  return v5;
}

- (id)cloudKitSync
{
  SGDCloudKitSyncObserver *v2;
  void (**cksGetter)(void);
  uint64_t v4;
  SGDCloudKitSync *cks;
  id v6;

  v2 = self;
  objc_sync_enter(v2);
  cksGetter = (void (**)(void))v2->_cksGetter;
  if (cksGetter)
  {
    cksGetter[2]();
    v4 = objc_claimAutoreleasedReturnValue();
    cks = v2->_cks;
    v2->_cks = (SGDCloudKitSync *)v4;

    v6 = v2->_cksGetter;
    v2->_cksGetter = 0;

  }
  objc_sync_exit(v2);

  return v2->_cks;
}

- (void)confirmEventFromThisDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "SGCK confirmEventFromThisDevice", v7, 2u);
  }

  -[SGDCloudKitSyncObserver cloudKitSync](self, "cloudKitSync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteStorageEvent:", v4);

}

- (void)confirmEventFromOtherDevice:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEBUG, "SGCK confirmEventFromOtherDevice [IGNORED]", v4, 2u);
  }

}

- (void)rejectEventFromThisDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "SGCK rejectEventFromThisDevice", v7, 2u);
  }

  -[SGDCloudKitSyncObserver cloudKitSync](self, "cloudKitSync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteStorageEvent:", v4);

}

- (void)rejectEventFromOtherDevice:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEBUG, "SGCK rejectEventFromOtherDevice [IGNORED]", v4, 2u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cks, 0);
  objc_storeStrong(&self->_cksGetter, 0);
}

@end
