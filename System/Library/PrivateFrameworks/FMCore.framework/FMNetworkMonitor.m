@implementation FMNetworkMonitor

void __67__FMNetworkMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("IsNetworkAvailable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("com.apple.icloud.FMNetworkMonitor.networkChanged"), 0, v4);

}

- (void)startMonitoring
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CCECB0], "sharedDefaultEvaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMNetworkMonitor setEvaluator:](self, "setEvaluator:", v3);

  -[FMNetworkMonitor evaluator](self, "evaluator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("path"), 5, 0);

}

- (void)setEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_evaluator, a3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  _QWORD activity_block[4];
  BOOL v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("path")))
  {
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "status");

    LogCategory_Unspecified();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("DOWN");
      if (v9 == 1)
        v11 = CFSTR("UP");
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1C9967000, v10, OS_LOG_TYPE_INFO, "Network state changed: %@", buf, 0xCu);
    }

    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __67__FMNetworkMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    activity_block[3] = &__block_descriptor_33_e5_v8__0l;
    v13 = v9 == 1;
    _os_activity_initiate(&dword_1C9967000, "Network state changed", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }

}

- (BOOL)isNetworkUp
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = -[FMNetworkMonitor isMonitoring](self, "isMonitoring");
  if (v3)
  {
    -[FMNetworkMonitor evaluator](self, "evaluator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "status");

    LOBYTE(v3) = (v6 & 0xFFFFFFFFFFFFFFFDLL) == 1;
  }
  return v3;
}

- (BOOL)isMonitoring
{
  void *v2;
  BOOL v3;

  -[FMNetworkMonitor evaluator](self, "evaluator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NWPathEvaluator)evaluator
{
  return self->_evaluator;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_9);
  return (id)sharedInstance___instance_1;
}

void __34__FMNetworkMonitor_sharedInstance__block_invoke()
{
  FMNetworkMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(FMNetworkMonitor);
  v1 = (void *)sharedInstance___instance_1;
  sharedInstance___instance_1 = (uint64_t)v0;

}

- (void)stopMonitoring
{
  void *v3;

  -[FMNetworkMonitor evaluator](self, "evaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("path"), 0);

  -[FMNetworkMonitor setEvaluator:](self, "setEvaluator:", 0);
}

- (void)registerNetworkMonitorLaunchEvent:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];

  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9967000, v3, OS_LOG_TYPE_DEFAULT, "FMNetworkMonitor registerNetworkMonitorLaunchEvent: not implemented for this platform.", v4, 2u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluator, 0);
}

@end
