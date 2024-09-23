@implementation AVPlayerControllerVolumeAnimator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerController, 0);
}

- (AVPlayerControllerVolumeAnimator)initWithPlayerController:(id)a3
{
  id v5;
  AVPlayerControllerVolumeAnimator *v6;
  AVPlayerControllerVolumeAnimator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVPlayerControllerVolumeAnimator;
  v6 = -[AVPlayerControllerVolumeAnimator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_playerController, a3);

  return v7;
}

- (BOOL)canAnimateVolumeTowardsZero
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  double v8;

  if (!-[AVPlayerControllerVolumeAnimator currentRouteHasVolumeControl](self, "currentRouteHasVolumeControl"))
    return 0;
  -[AVPlayerControllerVolumeAnimator playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && !-[AVPlayerControllerVolumeAnimator isAnimatingAwayFromZero](self, "isAnimatingAwayFromZero"))
  {
    -[AVPlayerControllerVolumeAnimator playerController](self, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isMuted") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[AVPlayerControllerVolumeAnimator playerController](self, "playerController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "volume");
      v5 = v8 > 0.0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (BOOL)isAnimatingAwayFromZero
{
  return self->_animatingAwayFromZero;
}

- (BOOL)currentRouteHasVolumeControl
{
  void *v2;
  char v3;

  +[AVSystemVolumeController volumeController](AVSystemVolumeController, "volumeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentRouteHasVolumeControl");

  return v3;
}

- (BOOL)canAnimateVolumeAwayFromZero
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  double v8;

  if (!-[AVPlayerControllerVolumeAnimator currentRouteHasVolumeControl](self, "currentRouteHasVolumeControl"))
    return 0;
  -[AVPlayerControllerVolumeAnimator playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && !-[AVPlayerControllerVolumeAnimator isAnimatingTowardsZero](self, "isAnimatingTowardsZero"))
  {
    -[AVPlayerControllerVolumeAnimator playerController](self, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isMuted"))
    {
      -[AVPlayerControllerVolumeAnimator playerController](self, "playerController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "volume");
      v5 = v8 > 0.0;

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setProgressTowardsZero:(double)a3
{
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint8_t v12[16];

  if (-[AVPlayerControllerVolumeAnimator isAnimatingAwayFromZero](self, "isAnimatingAwayFromZero"))
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_ERROR, "Cannot mute when unmuting.", v12, 2u);
    }

  }
  if (!-[AVPlayerControllerVolumeAnimator isAnimatingTowardsZero](self, "isAnimatingTowardsZero"))
  {
    -[AVPlayerControllerVolumeAnimator setAnimatingTowardsZero:](self, "setAnimatingTowardsZero:", 1);
    -[AVPlayerControllerVolumeAnimator playerController](self, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "volume");
    -[AVPlayerControllerVolumeAnimator setVolumeToRestore:](self, "setVolumeToRestore:");

  }
  -[AVPlayerControllerVolumeAnimator volumeToRestore](self, "volumeToRestore");
  v8 = 0.0;
  v9 = fmax(a3, 0.0);
  if (v9 < 1.0)
    v8 = 1.0 - v9;
  v10 = v8 * v7;
  -[AVPlayerControllerVolumeAnimator playerController](self, "playerController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVolume:", v10);

}

- (void)setProgressAwayFromZero:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint8_t v12[16];

  if (-[AVPlayerControllerVolumeAnimator isAnimatingTowardsZero](self, "isAnimatingTowardsZero"))
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_ERROR, "Cannot unmute when muting.", v12, 2u);
    }

  }
  if (!-[AVPlayerControllerVolumeAnimator isAnimatingAwayFromZero](self, "isAnimatingAwayFromZero"))
  {
    -[AVPlayerControllerVolumeAnimator setAnimatingAwayFromZero:](self, "setAnimatingAwayFromZero:", 1);
    -[AVPlayerControllerVolumeAnimator playerController](self, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "volume");
    -[AVPlayerControllerVolumeAnimator setVolumeToRestore:](self, "setVolumeToRestore:");

    -[AVPlayerControllerVolumeAnimator playerController](self, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVolume:", 0.0);

    -[AVPlayerControllerVolumeAnimator playerController](self, "playerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMuted:", 0);

  }
  -[AVPlayerControllerVolumeAnimator volumeToRestore](self, "volumeToRestore");
  v10 = fmin(fmax(a3, 0.0), 1.0) * v9;
  -[AVPlayerControllerVolumeAnimator playerController](self, "playerController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVolume:", v10);

}

- (void)restoreVolumeIfNeeded
{
  double v3;
  double v4;
  void *v5;

  if (-[AVPlayerControllerVolumeAnimator isAnimatingTowardsZero](self, "isAnimatingTowardsZero")
    || -[AVPlayerControllerVolumeAnimator isAnimatingAwayFromZero](self, "isAnimatingAwayFromZero"))
  {
    -[AVPlayerControllerVolumeAnimator volumeToRestore](self, "volumeToRestore");
    v4 = v3;
    -[AVPlayerControllerVolumeAnimator playerController](self, "playerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVolume:", v4);

  }
  -[AVPlayerControllerVolumeAnimator setAnimatingTowardsZero:](self, "setAnimatingTowardsZero:", 0);
  -[AVPlayerControllerVolumeAnimator setAnimatingAwayFromZero:](self, "setAnimatingAwayFromZero:", 0);
}

- (double)volumeToRestore
{
  return self->_volumeToRestore;
}

- (void)setVolumeToRestore:(double)a3
{
  self->_volumeToRestore = a3;
}

- (BOOL)isAnimatingTowardsZero
{
  return self->_animatingTowardsZero;
}

- (void)setAnimatingTowardsZero:(BOOL)a3
{
  self->_animatingTowardsZero = a3;
}

- (void)setAnimatingAwayFromZero:(BOOL)a3
{
  self->_animatingAwayFromZero = a3;
}

@end
