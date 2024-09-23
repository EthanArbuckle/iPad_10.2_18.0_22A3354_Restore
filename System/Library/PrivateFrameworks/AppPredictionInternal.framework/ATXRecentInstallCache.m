@implementation ATXRecentInstallCache

void __89___ATXRecentInstallCache_initTrackingAppsMoreRecentThan_installMonitor_uninstallMonitor___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_notifiedOfInstalls:", v3);

}

void __89___ATXRecentInstallCache_initTrackingAppsMoreRecentThan_installMonitor_uninstallMonitor___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_notifiedOfUninstalls:", v3);

}

@end
