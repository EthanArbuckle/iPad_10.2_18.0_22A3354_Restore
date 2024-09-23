@implementation _ATXAppProtectionMonitor

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_35 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_35, &__block_literal_global_193);
  return (id)sharedInstance__pasExprOnceResult_46;
}

- (_ATXAppProtectionMonitor)init
{
  _ATXAppProtectionMonitor *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_ATXAppProtectionMonitor;
  v2 = -[_ATXAppProtectionMonitor init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addMonitor:subjectMask:", v2, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v2->_appProtectionSubjectMonitorSubscription, v4);

    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "_ATXAppProtectionMonitor initialized", v7, 2u);
    }

  }
  return v2;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
  objc_msgSend(WeakRetained, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)_ATXAppProtectionMonitor;
  -[_ATXAppProtectionMonitor dealloc](&v4, sel_dealloc);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _ATXAppProtectionMonitor *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(25, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73___ATXAppProtectionMonitor_appProtectionSubjectsChanged_forSubscription___block_invoke;
  block[3] = &unk_1E82DB9D8;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription
{
  return (APSubjectMonitorSubscription *)objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appProtectionSubjectMonitorSubscription);
}

@end
