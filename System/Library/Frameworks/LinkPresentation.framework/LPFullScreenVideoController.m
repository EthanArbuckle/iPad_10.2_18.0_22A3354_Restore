@implementation LPFullScreenVideoController

- (LPFullScreenVideoController)initWithPlayer:(id)a3 sourceView:(id)a4
{
  id v7;
  id v8;
  LPFullScreenVideoController *v9;
  LPFullScreenVideoController *v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  __AVPlayerLayerView *playerLayerView;
  void *v16;
  void *v17;
  LPFullScreenVideoController *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)LPFullScreenVideoController;
  v9 = -[LPFullScreenVideoController init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceView, a4);
    objc_storeStrong((id *)&v10->_player, a3);
    v11 = objc_alloc(MEMORY[0x1E0C8B460]);
    objc_msgSend(v8, "bounds");
    v13 = v12;
    objc_msgSend(v8, "bounds");
    v14 = objc_msgSend(v11, "initWithFrame:", 0.0, 0.0, v13);
    playerLayerView = v10->_playerLayerView;
    v10->_playerLayerView = (__AVPlayerLayerView *)v14;

    -[__AVPlayerLayerView layer](v10->_playerLayerView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMasksToBounds:", 1);

    -[__AVPlayerLayerView playerLayer](v10->_playerLayerView, "playerLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPlayer:", v7);

    v18 = v10;
  }

  return v10;
}

- (void)prepareForDisplayWithCompletionHandler:(id)a3
{
  id v4;

  v4 = a3;
  -[LPFullScreenVideoController setUpFullScreenVideoViewControllerIfNeeded](self, "setUpFullScreenVideoViewControllerIfNeeded");
  -[LPAVPlayerViewController prepareForDisplayWithCompletionHandler:](self->_playerViewController, "prepareForDisplayWithCompletionHandler:", v4);

}

- (void)setUpFullScreenVideoViewControllerIfNeeded
{
  AVPlayerController *v3;
  AVPlayerController *playerController;
  LPAVPlayerViewController *v5;
  LPAVPlayerViewController *playerViewController;

  if (!self->_playerController)
  {
    v3 = (AVPlayerController *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B440]), "initWithPlayer:", self->_player);
    playerController = self->_playerController;
    self->_playerController = v3;

    v5 = objc_alloc_init(LPAVPlayerViewController);
    playerViewController = self->_playerViewController;
    self->_playerViewController = v5;

    -[LPAVPlayerViewController setPlayer:](self->_playerViewController, "setPlayer:", self->_player);
    -[LPAVPlayerViewController setDelegate:](self->_playerViewController, "setDelegate:", self);
    -[LPAVPlayerViewController setEntersFullScreenWhenPlaybackBegins:](self->_playerViewController, "setEntersFullScreenWhenPlaybackBegins:", 1);
    -[LPAVPlayerViewController setAllowsPictureInPicturePlayback:](self->_playerViewController, "setAllowsPictureInPicturePlayback:", 0);
    -[LPAVPlayerViewController setUpdatesNowPlayingInfoCenter:](self->_playerViewController, "setUpdatesNowPlayingInfoCenter:", 0);
    -[LPAVPlayerViewController setCanPausePlaybackWhenExitingFullScreen:](self->_playerViewController, "setCanPausePlaybackWhenExitingFullScreen:", 0);
    -[LPAVPlayerViewController setPlayerController:](self->_playerViewController, "setPlayerController:", self->_playerController);
    -[__AVPlayerLayerView setPlayerController:](self->_playerLayerView, "setPlayerController:", self->_playerController);
  }
}

- (void)present
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __38__LPFullScreenVideoController_present__block_invoke;
  v2[3] = &unk_1E44A7CE8;
  v2[4] = self;
  -[LPFullScreenVideoController prepareForDisplayWithCompletionHandler:](self, "prepareForDisplayWithCompletionHandler:", v2);
}

uint64_t __38__LPFullScreenVideoController_present__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "showFullScreenPresentationFromView:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0);
}

- (void)dismiss
{
  LPAVPlayerViewController *playerViewController;
  _QWORD v3[5];

  playerViewController = self->_playerViewController;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__LPFullScreenVideoController_dismiss__block_invoke;
  v3[3] = &unk_1E44A7CE8;
  v3[4] = self;
  -[LPAVPlayerViewController dismissViewControllerAnimated:completion:](playerViewController, "dismissViewControllerAnimated:completion:", 1, v3);
}

uint64_t __38__LPFullScreenVideoController_dismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didCompleteDismissal");
}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  -[LPVisualMediaView fullScreenVideoDidPresent](self->_sourceView, "fullScreenVideoDidPresent", a3, a4);
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  _QWORD v4[5];
  _QWORD v5[5];

  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __106__LPFullScreenVideoController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke;
  v5[3] = &unk_1E44A91C8;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __106__LPFullScreenVideoController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2;
  v4[3] = &unk_1E44A91C8;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v5, v4);
}

void __106__LPFullScreenVideoController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  objc_msgSend(*(id *)(v1 + 8), "configuration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullScreenTransitionCornerRadius");
  objc_msgSend(v2, "_lp_setCornerRadius:");

}

void __106__LPFullScreenVideoController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "_lp_setCornerRadius:", 0.0);
  if ((objc_msgSend(v3, "isCancelled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "didCompleteDismissal");

}

- (void)didCompleteDismissal
{
  _QWORD block[5];

  -[LPVisualMediaView fullScreenVideoWillDismiss](self->_sourceView, "fullScreenVideoWillDismiss");
  -[LPVisualMediaView fullScreenVideoDidDismiss](self->_sourceView, "fullScreenVideoDidDismiss");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__LPFullScreenVideoController_didCompleteDismissal__block_invoke;
  block[3] = &unk_1E44A7CE8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __51__LPFullScreenVideoController_didCompleteDismissal__block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setVolume:", a2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setMuted:", 0);
}

- (BOOL)playerViewControllerShouldMuteVolumeForFullScreenDismissalTransition:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_playerLayerView, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
}

@end
