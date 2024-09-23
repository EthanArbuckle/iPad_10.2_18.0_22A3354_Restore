@implementation GKScopedIdManager

+ (void)gameCenterEnabledGameInstalled:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!os_log_GKGeneral)
    v7 = GKOSLoggers();
  v8 = os_log_GKCache;
  if (os_log_type_enabled((os_log_t)os_log_GKCache, OS_LOG_TYPE_DEBUG))
    +[GKScopedIdManager gameCenterEnabledGameInstalled:withCompletionHandler:].cold.1((uint64_t)v5, v8);
  +[GKDaemonProxy daemonProxy](GKDaemonProxy, "daemonProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "gameService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "storeGameForBundleIDs:completion:", v11, v6);

}

+ (void)gameCenterEnabledGameInstalled:(uint64_t)a1 withCompletionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1BCDE3000, a2, OS_LOG_TYPE_DEBUG, "Game install notification for title: %@", (uint8_t *)&v2, 0xCu);
}

@end
