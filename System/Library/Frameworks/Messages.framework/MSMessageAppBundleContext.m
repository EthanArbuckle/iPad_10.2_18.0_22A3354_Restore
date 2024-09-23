@implementation MSMessageAppBundleContext

void __59___MSMessageAppBundleContext__hostDidBeginDeferredTeardown__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59___MSMessageAppBundleContext__hostDidBeginDeferredTeardown__block_invoke_2;
  v3[3] = &unk_1EA25C838;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "updateSnapshotWithCompletionBlock:", v3);

}

void __59___MSMessageAppBundleContext__hostDidBeginDeferredTeardown__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = a2;
    objc_msgSend(v2, "hostContext");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateSnapshotForNextLaunch:", v3);

  }
}

void __59___MSMessageAppBundleContext_beginDisablingUserInteraction__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disableUserInteraction");

  }
}

void __57___MSMessageAppBundleContext_endDisablingUserInteraction__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableUserInteraction");

  }
}

@end
