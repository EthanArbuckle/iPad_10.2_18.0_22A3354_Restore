@implementation AVPlayerVolumeController

- (AVPlayerVolumeController)init
{
  AVPlayerVolumeController *v2;
  AVObservationController *v3;
  AVObservationController *keyValueObservationController;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVPlayerVolumeController;
  v2 = -[AVPlayerVolumeController init](&v7, sel_init);
  if (v2)
  {
    v3 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v2);
    keyValueObservationController = v2->_keyValueObservationController;
    v2->_keyValueObservationController = v3;

    v5 = -[AVObservationController startObserving:keyPath:includeInitialValue:observationHandler:](v2->_keyValueObservationController, "startObserving:keyPath:includeInitialValue:observationHandler:", v2, CFSTR("playerController.volume"), 0, &__block_literal_global_11822);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AVObservationController stopAllObservation](self->_keyValueObservationController, "stopAllObservation");
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerVolumeController;
  -[AVPlayerVolumeController dealloc](&v3, sel_dealloc);
}

- (float)volume
{
  void *v2;
  double v3;
  float v4;

  -[AVPlayerVolumeController playerController](self, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volume");
  v4 = v3;

  return v4;
}

- (void)setTargetVolume:(float)a3
{
  id v4;

  -[AVPlayerVolumeController playerController](self, "playerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVolume:", fmin(fmax(a3, 0.0), 1.0));

}

- (BOOL)currentRouteHasVolumeControl
{
  void *v2;
  char v3;

  -[AVPlayerVolumeController playerController](self, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void)beginChangingVolume
{
  -[AVPlayerVolumeController setChangingVolume:](self, "setChangingVolume:", 1);
}

- (void)endChangingVolume
{
  -[AVPlayerVolumeController setChangingVolume:](self, "setChangingVolume:", 0);
}

- (BOOL)prefersSystemVolumeHUDHidden
{
  return self->_prefersSystemVolumeHUDHidden;
}

- (void)setPrefersSystemVolumeHUDHidden:(BOOL)a3
{
  self->_prefersSystemVolumeHUDHidden = a3;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)setPlayerController:(id)a3
{
  objc_storeStrong((id *)&self->_playerController, a3);
}

- (BOOL)isChangingVolume
{
  return self->_changingVolume;
}

- (void)setChangingVolume:(BOOL)a3
{
  self->_changingVolume = a3;
}

- (AVObservationController)keyValueObservationController
{
  return self->_keyValueObservationController;
}

- (void)setKeyValueObservationController:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueObservationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueObservationController, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
}

void __32__AVPlayerVolumeController_init__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0CB37D0];
  v3 = a2;
  objc_msgSend(v2, "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("AVVolumeControllerVolumeChangedNotification"), v3);

}

+ (id)volumeController
{
  return objc_alloc_init((Class)a1);
}

@end
