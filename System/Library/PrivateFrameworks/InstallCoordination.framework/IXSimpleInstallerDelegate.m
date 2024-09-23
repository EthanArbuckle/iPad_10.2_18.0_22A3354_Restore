@implementation IXSimpleInstallerDelegate

void __86___IXSimpleInstallerDelegate_coordinatorDidCompleteSuccessfully_forApplicationRecord___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v3)[2](v3, v4, 0);

    objc_msgSend(*(id *)(a1 + 32), "setCompletion:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "setCoordinator:", 0);
  _RemoveDelegateFromMap(*(void **)(a1 + 32));
}

void __68___IXSimpleInstallerDelegate_coordinator_canceledWithReason_client___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "setCompletion:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "setCoordinator:", 0);
  _RemoveDelegateFromMap(*(void **)(a1 + 32));
}

@end
