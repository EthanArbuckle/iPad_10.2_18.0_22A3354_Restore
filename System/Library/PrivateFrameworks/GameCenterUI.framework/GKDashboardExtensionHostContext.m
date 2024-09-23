@implementation GKDashboardExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[GKViewServiceInterface gameCenterServiceViewControllerInterface](GKViewServiceInterface, "gameCenterServiceViewControllerInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[GKViewServiceInterface gameCenterHostViewControllerInterface](GKViewServiceInterface, "gameCenterHostViewControllerInterface");
}

- (void)requestDashboardLogoImageWithHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)requestImagesForLeaderboardSetsWithHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)requestImagesForLeaderboardsInSet:(id)a3 handler:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)getMethodsImplementedByChallengeEventHandlerDelegate:(id)a3
{
  id v3;
  void *v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__GKDashboardExtensionHostContext_getMethodsImplementedByChallengeEventHandlerDelegate___block_invoke;
    block[3] = &unk_1E59C4DA8;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __88__GKDashboardExtensionHostContext_getMethodsImplementedByChallengeEventHandlerDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0D25288], "challengeEventHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    NSStringFromSelector(sel_localPlayerDidSelectChallenge_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v4);

  }
  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventEmitter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "listenerRegisteredForSelector:", sel_player_wantsToPlayChallenge_))
  {
    NSStringFromSelector(sel_player_wantsToPlayChallenge_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v7);

  }
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v10, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

}

@end
