@implementation SFRequestDesktopSiteQuirksManager

void __51___SFRequestDesktopSiteQuirksManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_sharedQuirksManager;
  sharedManager_sharedQuirksManager = v0;

}

uint64_t __42___SFRequestDesktopSiteQuirksManager_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "data");
}

void __77___SFRequestDesktopSiteQuirksManager_quirksValueForDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "requestDesktopSiteSettingForDomain:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __77___SFRequestDesktopSiteQuirksManager_getAllQuirkValuesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "allRequestDesktopSiteQuirks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

@end
