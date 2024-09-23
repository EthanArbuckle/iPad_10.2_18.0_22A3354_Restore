@implementation MPMediaControlsStatusBarStyleOverridesCoordinator

- (MPMediaControlsStatusBarStyleOverridesCoordinator)init
{
  MPMediaControlsStatusBarStyleOverridesCoordinator *v2;
  SBSStatusBarStyleOverridesCoordinator *v3;
  SBSStatusBarStyleOverridesCoordinator *coordinator;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPMediaControlsStatusBarStyleOverridesCoordinator;
  v2 = -[MPMediaControlsStatusBarStyleOverridesCoordinator init](&v6, sel_init);
  if (v2)
  {
    v3 = (SBSStatusBarStyleOverridesCoordinator *)objc_alloc_init(MEMORY[0x1E0DAAFE0]);
    coordinator = v2->_coordinator;
    v2->_coordinator = v3;

    -[SBSStatusBarStyleOverridesCoordinator setDelegate:](v2->_coordinator, "setDelegate:", v2);
    -[SBSStatusBarStyleOverridesCoordinator setRegisteredStyleOverrides:reply:](v2->_coordinator, "setRegisteredStyleOverrides:reply:", 12582912, &__block_literal_global_5822);
  }
  return v2;
}

- (void)presentMediaControls
{
  -[MPMediaControlsStatusBarStyleOverridesCoordinator presentMediaControlsWithCompletion:](self, "presentMediaControlsWithCompletion:", 0);
}

- (void)presentMediaControlsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  MPMediaControlsConfiguration *v6;
  MPMediaControls *v7;
  MPMediaControls *mediaControls;
  MPMediaControls *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  MPMediaControlsStatusBarStyleOverridesCoordinator *v15;
  id v16;

  v4 = a3;
  if (MRAVOutputContextGetSharedAudioPresentationContext())
    v5 = (void *)MRAVOutputContextCopyUniqueIdentifier();
  else
    v5 = 0;
  v6 = objc_alloc_init(MPMediaControlsConfiguration);
  -[MPMediaControlsConfiguration setRoutingContextUID:](v6, "setRoutingContextUID:", v5);
  -[MPMediaControlsConfiguration setStyle:](v6, "setStyle:", 6);
  -[MPMediaControlsConfiguration setAllowsNowPlayingApplicationLaunch:](v6, "setAllowsNowPlayingApplicationLaunch:", 1);
  v7 = -[MPMediaControls initWithConfiguration:]([MPMediaControls alloc], "initWithConfiguration:", v6);
  mediaControls = self->_mediaControls;
  self->_mediaControls = v7;

  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __88__MPMediaControlsStatusBarStyleOverridesCoordinator_presentMediaControlsWithCompletion___block_invoke;
  v14 = &unk_1E3162560;
  v15 = self;
  v16 = v4;
  v9 = self->_mediaControls;
  v10 = v4;
  -[MPMediaControls setDismissHandler:](v9, "setDismissHandler:", &v11);
  -[MPMediaControls present](self->_mediaControls, "present", v11, v12, v13, v14, v15);

}

- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5
{
  -[MPMediaControlsStatusBarStyleOverridesCoordinator presentMediaControlsWithCompletion:](self, "presentMediaControlsWithCompletion:", a5, a4);
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_statusBarStyleOverride, 0);
}

uint64_t __88__MPMediaControlsStatusBarStyleOverridesCoordinator_presentMediaControlsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __57__MPMediaControlsStatusBarStyleOverridesCoordinator_init__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if (a2)
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "Could not register tap handler for status bar override", v3, 2u);
    }

  }
}

@end
