@implementation GCCurrentApplicationForegroundMonitor

void __56___GCCurrentApplicationForegroundMonitor_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_Shared;
  sharedInstance_Shared = v0;

}

void __46___GCCurrentApplicationForegroundMonitor_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_CBApplicationWillResignActive_, *MEMORY[0x24BEBE010], 0);

  +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_CBApplicationDidBecomeActive_, *MEMORY[0x24BEBDF88], 0);

  +[UIApplication sharedApplication](&off_254DF2320, "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "applicationState") != 0;

  atomic_store(v5, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __68___GCCurrentApplicationForegroundMonitor_addObserver_notifyCurrent___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  -[_GCCurrentApplicationForegroundMonitor addObserver:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 32), "isAppInBackground");
  v3 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "CBApplicationWillResignActive");
  else
    return objc_msgSend(v3, "CBApplicationDidBecomeActive");
}

void __71___GCCurrentApplicationForegroundMonitor_CBApplicationDidBecomeActive___block_invoke(uint64_t a1)
{
  -[_GCCurrentApplicationForegroundMonitor CBApplicationDidBecomeActive](*(void **)(a1 + 32));
}

void __72___GCCurrentApplicationForegroundMonitor_CBApplicationWillResignActive___block_invoke(uint64_t a1)
{
  -[_GCCurrentApplicationForegroundMonitor CBApplicationWillResignActive](*(void **)(a1 + 32));
}

@end
