@implementation GKMatchmakerExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[GKViewServiceInterface matchmakerServiceViewControllerInterface](GKViewServiceInterface, "matchmakerServiceViewControllerInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[GKViewServiceInterface matchmakerHostViewControllerInterface](GKViewServiceInterface, "matchmakerHostViewControllerInterface");
}

- (void)shareMatchWithRequest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__GKMatchmakerExtensionHostContext_shareMatchWithRequest_handler___block_invoke;
  block[3] = &unk_1E59C6118;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __66__GKMatchmakerExtensionHostContext_shareMatchWithRequest_handler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "remoteViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shareMatchWithRequest:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
