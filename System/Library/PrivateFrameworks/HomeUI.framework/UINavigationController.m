@implementation UINavigationController

id __119__UINavigationController_HUPreloadingNavigationPresentation__hu_pushPreloadableViewController_animated_waitForPreload___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  id v7;
  char v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __119__UINavigationController_HUPreloadingNavigationPresentation__hu_pushPreloadableViewController_animated_waitForPreload___block_invoke_2;
  v6[3] = &unk_1E6F4DF30;
  v2 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0D519C0];
  v6[1] = 3221225472;
  v7 = v2;
  v8 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v3, "futureWithBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __119__UINavigationController_HUPreloadingNavigationPresentation__hu_pushPreloadableViewController_animated_waitForPreload___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __119__UINavigationController_HUPreloadingNavigationPresentation__hu_pushPreloadableViewController_animated_waitForPreload___block_invoke_3;
    v5[3] = &unk_1E6F4F2F8;
    v6 = v3;
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v4, "animateAlongsideTransition:completion:", 0, v5);

  }
  else
  {
    objc_msgSend(v3, "finishWithResult:", *(_QWORD *)(a1 + 40));
  }

}

void __119__UINavigationController_HUPreloadingNavigationPresentation__hu_pushPreloadableViewController_animated_waitForPreload___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "presentingViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

BOOL __75__UINavigationController_HUModalPresentation__finishPresentation_animated___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  BOOL v5;
  _BOOL8 v6;
  uint64_t v7;

  v2 = *(id *)(a1 + 32);
  if (!v2)
    return 0;
  v3 = v2;
  do
  {
    objc_msgSend(*(id *)(a1 + 40), "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v3 == v4;
    v6 = v3 == v4;
    if (v5)
      break;
    objc_msgSend(v3, "parentViewController");
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  while (v7);

  return v6;
}

@end
