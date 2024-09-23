@implementation ATXAppInstallMonitor

uint64_t __76___ATXAppInstallMonitor_synchronousUpdateWithUninstallWaitTime_andBackdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "noSyncUpdateWithWaitTime:andBackdate:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void __62___ATXAppInstallMonitor_noSyncUpdateWithWaitTime_andBackdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchAllApps");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v8, "minusSet:", v5);
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v8, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleUninstallationOfApps:", v7);

  }
}

uint64_t __62___ATXAppInstallMonitor_noSyncUpdateWithWaitTime_andBackdate___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

@end
