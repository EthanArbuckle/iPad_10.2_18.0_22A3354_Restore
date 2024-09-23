@implementation AVTFaceTrackingManager

+ (double)desiredUserInfoLabelAlphaForFaceTrackingState:(BOOL)a3
{
  double result;

  result = 1.0;
  if (a3)
    return 0.0;
  return result;
}

- (AVTFaceTrackingManager)initWithAvatarView:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  AVTUserInfoView *v8;
  AVTUserInfoView *v9;
  AVTFaceTrackingManager *v10;

  v6 = a4;
  v7 = a3;
  v8 = [AVTUserInfoView alloc];
  v9 = -[AVTUserInfoView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = -[AVTFaceTrackingManager initWithAvatarView:userInfoView:environment:](self, "initWithAvatarView:userInfoView:environment:", v7, v9, v6);

  return v10;
}

- (AVTFaceTrackingManager)initWithAvatarView:(id)a3 userInfoView:(id)a4 environment:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTFaceTrackingManager *v12;
  AVTFaceTrackingManager *v13;
  void *v14;
  uint64_t v15;
  NSString *localizedDeviceName;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AVTFaceTrackingManager;
  v12 = -[AVTFaceTrackingManager init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_environment, a5);
    objc_storeStrong((id *)&v13->_avatarView, a3);
    objc_msgSend(v9, "setFaceTrackingDelegate:", v13);
    objc_storeStrong((id *)&v13->_userInfoView, a4);
    objc_msgSend(v10, "setUserInteractionEnabled:", 0);
    -[AVTUserInfoView setAlpha:](v13->_userInfoView, "setAlpha:", 0.0);
    v14 = (void *)MGCopyAnswer();
    v15 = objc_msgSend(v14, "copy");
    localizedDeviceName = v13->_localizedDeviceName;
    v13->_localizedDeviceName = (NSString *)v15;

    -[AVTFaceTrackingManager setupDisplayLayoutMonitor](v13, "setupDisplayLayoutMonitor");
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AVTFaceTrackingManager displayLayoutMonitor](self, "displayLayoutMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[AVTFaceTrackingManager invalidateFaceTrackingTimers](self, "invalidateFaceTrackingTimers");
  -[AVTFaceTrackingManager cancelLowLightAndSensorOcclusionTimer](self, "cancelLowLightAndSensorOcclusionTimer");
  v4.receiver = self;
  v4.super_class = (Class)AVTFaceTrackingManager;
  -[AVTFaceTrackingManager dealloc](&v4, sel_dealloc);
}

- (void)setFaceTrackingManagementPaused:(BOOL)a3
{
  void *v4;
  char v5;

  if (self->_faceTrackingManagementPaused != a3)
  {
    self->_faceTrackingManagementPaused = a3;
    if (a3)
    {
      -[AVTFaceTrackingManager updateUserInfoLabelAlphaForFaceTrackingState:animated:](self, "updateUserInfoLabelAlphaForFaceTrackingState:animated:", 1, 0);
      -[AVTFaceTrackingManager resetForResumingTrackingAnimated:](self, "resetForResumingTrackingAnimated:", 0);
      -[AVTFaceTrackingManager cancelLowLightAndSensorOcclusionTimer](self, "cancelLowLightAndSensorOcclusionTimer");
    }
    else
    {
      -[AVTFaceTrackingManager avatarView](self, "avatarView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "faceIsTracked");

      if ((v5 & 1) == 0)
        -[AVTFaceTrackingManager startTrackingLostTimers](self, "startTrackingLostTimers");
    }
  }
}

- (void)resumeFaceTrackingIfNeededAnimated:(BOOL)a3
{
  void *v4;
  char v5;

  -[AVTFaceTrackingManager resetForResumingTrackingAnimated:](self, "resetForResumingTrackingAnimated:", a3);
  -[AVTFaceTrackingManager avatarView](self, "avatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "faceIsTracked");

  if ((v5 & 1) == 0)
    -[AVTFaceTrackingManager startTrackingLostTimers](self, "startTrackingLostTimers");
}

- (void)updateInterruptionTypeIfNeeded:(unint64_t)a3
{
  if (-[AVTFaceTrackingManager interruptionType](self, "interruptionType") < a3)
    -[AVTFaceTrackingManager setInterruptionType:](self, "setInterruptionType:", a3);
}

- (void)updateUserInfoBackdropForCurrentLabel
{
  void *v3;
  id WeakRetained;
  char v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  -[AVTFaceTrackingManager userInfoView](self, "userInfoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    -[AVTFaceTrackingManager userInfoView](self, "userInfoView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v9, "faceTrackingManager:didUpdateUserInfoWithSize:", self, v7, v8);

  }
}

- (void)resetForTrackingFoundAFaceAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[AVTFaceTrackingManager invalidateFaceTrackingTimers](self, "invalidateFaceTrackingTimers");
  -[AVTFaceTrackingManager updateUserInfoLabelAlphaForFaceTrackingState:animated:](self, "updateUserInfoLabelAlphaForFaceTrackingState:animated:", 1, v3);
}

- (void)resetForResumingTrackingAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AVTFaceTrackingManager invalidateFaceTrackingTimers](self, "invalidateFaceTrackingTimers", a3);
  -[AVTFaceTrackingManager avatarView](self, "avatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFaceTrackingPaused:", 0);

  -[AVTFaceTrackingManager userInfoStringForCurrentTrackingState](self, "userInfoStringForCurrentTrackingState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTFaceTrackingManager userInfoView](self, "userInfoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[AVTFaceTrackingManager updateUserInfoBackdropForCurrentLabel](self, "updateUserInfoBackdropForCurrentLabel");
  -[AVTFaceTrackingManager avatarView](self, "avatarView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v7, "faceIsTracked");

  if ((_DWORD)v6)
    -[AVTFaceTrackingManager updateUserInfoLabelAlphaForFaceTrackingState:animated:](self, "updateUserInfoLabelAlphaForFaceTrackingState:animated:", 1, 1);
  -[AVTFaceTrackingManager environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "usageTrackingSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didResumeFaceTracking");

  -[AVTFaceTrackingManager setInterruptionType:](self, "setInterruptionType:", 0);
}

- (void)updateUserInfoLabelAlphaForFaceTrackingState:(BOOL)a3
{
  double v3;
  id v4;

  if (a3)
    v3 = 0.0;
  else
    v3 = 1.0;
  -[AVTFaceTrackingManager userInfoView](self, "userInfoView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

}

- (void)updateUserInfoLabelAlphaForFaceTrackingState:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[5];
  BOOL v13;

  v4 = a4;
  v5 = a3;
  -[AVTFaceTrackingManager userInfoView](self, "userInfoView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alpha");
  v9 = v8;
  objc_msgSend((id)objc_opt_class(), "desiredUserInfoLabelAlphaForFaceTrackingState:", v5);
  v11 = v10;

  if (v9 != v11)
  {
    if (v4)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __80__AVTFaceTrackingManager_updateUserInfoLabelAlphaForFaceTrackingState_animated___block_invoke;
      v12[3] = &unk_1EA51E268;
      v12[4] = self;
      v13 = v5;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v12, 0.5);
    }
    else
    {
      -[AVTFaceTrackingManager updateUserInfoLabelAlphaForFaceTrackingState:](self, "updateUserInfoLabelAlphaForFaceTrackingState:", v5);
    }
  }
}

uint64_t __80__AVTFaceTrackingManager_updateUserInfoLabelAlphaForFaceTrackingState_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateUserInfoLabelAlphaForFaceTrackingState:", *(unsigned __int8 *)(a1 + 40));
}

- (void)invalidateFaceTrackingTimers
{
  void *v3;
  void *v4;

  -[AVTFaceTrackingManager trackingLostMessageTimer](self, "trackingLostMessageTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[AVTFaceTrackingManager setTrackingLostMessageTimer:](self, "setTrackingLostMessageTimer:", 0);
  -[AVTFaceTrackingManager pauseTrackingTimer](self, "pauseTrackingTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[AVTFaceTrackingManager setPauseTrackingTimer:](self, "setPauseTrackingTimer:", 0);
}

- (void)startTrackingLostTimers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  -[AVTFaceTrackingManager pauseTrackingTimer](self, "pauseTrackingTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && !-[AVTFaceTrackingManager faceTrackingManagementPaused](self, "faceTrackingManagementPaused"))
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0C99E88];
    v5 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49__AVTFaceTrackingManager_startTrackingLostTimers__block_invoke;
    v16[3] = &unk_1EA51E290;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v4, "timerWithTimeInterval:repeats:block:", 0, v16, 2.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTFaceTrackingManager setTrackingLostMessageTimer:](self, "setTrackingLostMessageTimer:", v6);

    v7 = (void *)MEMORY[0x1E0C99E88];
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __49__AVTFaceTrackingManager_startTrackingLostTimers__block_invoke_2;
    v14[3] = &unk_1EA51E290;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v7, "timerWithTimeInterval:repeats:block:", 0, v14, 10.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTFaceTrackingManager setPauseTrackingTimer:](self, "setPauseTrackingTimer:", v8);

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTFaceTrackingManager pauseTrackingTimer](self, "pauseTrackingTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C99860];
    objc_msgSend(v9, "addTimer:forMode:", v10, *MEMORY[0x1E0C99860]);

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTFaceTrackingManager trackingLostMessageTimer](self, "trackingLostMessageTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addTimer:forMode:", v13, v11);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __49__AVTFaceTrackingManager_startTrackingLostTimers__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateForTrackingLost");
  objc_msgSend(WeakRetained, "setTrackingLostMessageTimer:", 0);

}

void __49__AVTFaceTrackingManager_startTrackingLostTimers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateForPausingTracking");

}

- (void)updateForTrackingLost
{
  void *v3;
  void *v4;

  -[AVTFaceTrackingManager userInfoStringForCurrentTrackingState](self, "userInfoStringForCurrentTrackingState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTFaceTrackingManager userInfoView](self, "userInfoView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  -[AVTFaceTrackingManager updateUserInfoBackdropForCurrentLabel](self, "updateUserInfoBackdropForCurrentLabel");
  -[AVTFaceTrackingManager updateUserInfoLabelAlphaForFaceTrackingState:animated:](self, "updateUserInfoLabelAlphaForFaceTrackingState:animated:", 0, 1);
}

- (void)updateForPausingTracking
{
  -[AVTFaceTrackingManager updateForPausingTrackingWithLabel:](self, "updateForPausingTrackingWithLabel:", 1);
}

- (void)updateForPausingTrackingWithLabel:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[AVTFaceTrackingManager cancelLowLightAndSensorOcclusionTimer](self, "cancelLowLightAndSensorOcclusionTimer");
  if (v3)
  {
    AVTAvatarUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TAP_TO_RESUME"), &stru_1EA5207B8, CFSTR("Localized"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTFaceTrackingManager userInfoView](self, "userInfoView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    -[AVTFaceTrackingManager updateUserInfoBackdropForCurrentLabel](self, "updateUserInfoBackdropForCurrentLabel");
  }
  -[AVTFaceTrackingManager updateUserInfoLabelAlphaForFaceTrackingState:animated:](self, "updateUserInfoLabelAlphaForFaceTrackingState:animated:", !v3, 1);
  -[AVTFaceTrackingManager avatarView](self, "avatarView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFaceTrackingPaused:", 1);

  -[AVTFaceTrackingManager setPauseTrackingTimer:](self, "setPauseTrackingTimer:", 0);
  -[AVTFaceTrackingManager updateInterruptionTypeIfNeeded:](self, "updateInterruptionTypeIfNeeded:", 1);
  -[AVTFaceTrackingManager environment](self, "environment");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "usageTrackingSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didPauseFaceTracking");

}

- (id)userInfoStringForCurrentTrackingState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  int v16;

  -[AVTFaceTrackingManager environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "deviceIsPad") & 1) != 0)
  {
    -[AVTFaceTrackingManager delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "interfaceOrientationForFaceTrackingManager:", self);

    if (v5 == 2)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      AVTAvatarUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ROTATE_DEVICE"), &stru_1EA5207B8, CFSTR("Localized"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTFaceTrackingManager localizedDeviceName](self, "localizedDeviceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
  }
  else
  {

  }
  -[AVTFaceTrackingManager avatarView](self, "avatarView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isSensorCovered");

  if (v12)
  {
    AVTAvatarUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    v14 = CFSTR("CAMERA_COVERED");
  }
  else
  {
    -[AVTFaceTrackingManager avatarView](self, "avatarView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "captureImageIsTooDark");

    AVTAvatarUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (v16)
      v14 = CFSTR("LOW_LIGHT");
    else
      v14 = CFSTR("TRACKING_LOST");
  }
  objc_msgSend(v13, "localizedStringForKey:value:table:", v14, &stru_1EA5207B8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v10;
}

- (void)avatarView:(id)a3 didUpdateWithFaceTrackingStatus:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__AVTFaceTrackingManager_avatarView_didUpdateWithFaceTrackingStatus___block_invoke;
  v4[3] = &unk_1EA51E268;
  v4[4] = self;
  v5 = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

uint64_t __69__AVTFaceTrackingManager_avatarView_didUpdateWithFaceTrackingStatus___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = objc_msgSend(*(id *)(a1 + 32), "faceTrackingManagementPaused");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "interruptionType");
    if (!result)
    {
      v3 = *(void **)(a1 + 32);
      if (*(_BYTE *)(a1 + 40))
        return objc_msgSend(v3, "resetForTrackingFoundAFaceAnimated:", 1);
      else
        return objc_msgSend(v3, "startTrackingLostTimers");
    }
  }
  return result;
}

- (void)cancelLowLightAndSensorOcclusionTimer
{
  void *v3;

  -[AVTFaceTrackingManager lowLightAndSensorOcclusionLockoutTimer](self, "lowLightAndSensorOcclusionLockoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[AVTFaceTrackingManager setLowLightAndSensorOcclusionLockoutTimer:](self, "setLowLightAndSensorOcclusionLockoutTimer:", 0);
  -[AVTFaceTrackingManager setShouldRecheckLowLightAndSensorOcclusionState:](self, "setShouldRecheckLowLightAndSensorOcclusionState:", 0);
}

- (void)avatarViewDidUpdateWithLowLightOrCameraOcclusionStatus
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__AVTFaceTrackingManager_avatarViewDidUpdateWithLowLightOrCameraOcclusionStatus__block_invoke;
  block[3] = &unk_1EA51D188;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __80__AVTFaceTrackingManager_avatarViewDidUpdateWithLowLightOrCameraOcclusionStatus__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  if ((objc_msgSend(*(id *)(a1 + 32), "faceTrackingManagementPaused") & 1) == 0
    && (!objc_msgSend(*(id *)(a1 + 32), "interruptionType") || objc_msgSend(*(id *)(a1 + 32), "interruptionType") == 1))
  {
    objc_msgSend(*(id *)(a1 + 32), "lowLightAndSensorOcclusionLockoutTimer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = *(void **)(a1 + 32);
    if (v2)
    {
      objc_msgSend(v3, "setShouldRecheckLowLightAndSensorOcclusionState:", 1);
      return;
    }
    objc_msgSend(v3, "avatarView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "faceIsTracked"))
    {
      objc_msgSend(*(id *)(a1 + 32), "avatarView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "captureImageIsTooDark"))
      {
        objc_msgSend(*(id *)(a1 + 32), "avatarView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isSensorCovered");

        if ((v14 & 1) == 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
LABEL_10:
        objc_msgSend(*(id *)(a1 + 32), "userInfoStringForCurrentTrackingState");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "userInfoView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setText:", v6);

        objc_msgSend(*(id *)(a1 + 32), "updateUserInfoBackdropForCurrentLabel");
        v8 = 0;
LABEL_11:
        objc_msgSend(*(id *)(a1 + 32), "updateUserInfoLabelAlphaForFaceTrackingState:animated:", v8, 1);
        objc_initWeak(&location, *(id *)(a1 + 32));
        v9 = (void *)MEMORY[0x1E0C99E88];
        v15 = MEMORY[0x1E0C809B0];
        v16 = 3221225472;
        v17 = __80__AVTFaceTrackingManager_avatarViewDidUpdateWithLowLightOrCameraOcclusionStatus__block_invoke_2;
        v18 = &unk_1EA51E290;
        objc_copyWeak(&v19, &location);
        objc_msgSend(v9, "timerWithTimeInterval:repeats:block:", 0, &v15, 1.0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setLowLightAndSensorOcclusionLockoutTimer:", v10, v15, v16, v17, v18);

        objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "lowLightAndSensorOcclusionLockoutTimer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addTimer:forMode:", v12, *MEMORY[0x1E0C99860]);

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
        return;
      }

    }
    goto LABEL_10;
  }
}

void __80__AVTFaceTrackingManager_avatarViewDidUpdateWithLowLightOrCameraOcclusionStatus__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "shouldRecheckLowLightAndSensorOcclusionState"))
  {
    objc_msgSend(WeakRetained, "setLowLightAndSensorOcclusionLockoutTimer:", 0);
    objc_msgSend(WeakRetained, "avatarViewDidUpdateWithLowLightOrCameraOcclusionStatus");
  }

}

- (void)avatarView:(id)a3 faceTrackingSessionFailedWithError:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (!-[AVTFaceTrackingManager faceTrackingManagementPaused](self, "faceTrackingManagementPaused", a3, a4))
  {
    -[AVTFaceTrackingManager updateInterruptionTypeIfNeeded:](self, "updateInterruptionTypeIfNeeded:", 4);
    -[AVTFaceTrackingManager invalidateFaceTrackingTimers](self, "invalidateFaceTrackingTimers");
    -[AVTFaceTrackingManager cancelLowLightAndSensorOcclusionTimer](self, "cancelLowLightAndSensorOcclusionTimer");
    -[AVTFaceTrackingManager avatarView](self, "avatarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFaceTrackingPaused:", 1);

    AVTAvatarUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FACE_TRACKING_FAILED"), &stru_1EA5207B8, CFSTR("Localized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTFaceTrackingManager userInfoView](self, "userInfoView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    -[AVTFaceTrackingManager updateUserInfoBackdropForCurrentLabel](self, "updateUserInfoBackdropForCurrentLabel");
    -[AVTFaceTrackingManager updateUserInfoLabelAlphaForFaceTrackingState:animated:](self, "updateUserInfoLabelAlphaForFaceTrackingState:animated:", 0, 1);
  }
}

- (void)avatarViewFaceTrackingSessionInterruptionDidBegin:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (!-[AVTFaceTrackingManager faceTrackingManagementPaused](self, "faceTrackingManagementPaused", a3))
  {
    -[AVTFaceTrackingManager updateInterruptionTypeIfNeeded:](self, "updateInterruptionTypeIfNeeded:", 2);
    if (-[AVTFaceTrackingManager interruptionType](self, "interruptionType") == 2)
    {
      -[AVTFaceTrackingManager invalidateFaceTrackingTimers](self, "invalidateFaceTrackingTimers");
      -[AVTFaceTrackingManager cancelLowLightAndSensorOcclusionTimer](self, "cancelLowLightAndSensorOcclusionTimer");
      AVTAvatarUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SESSION_INTERRUPTED"), &stru_1EA5207B8, CFSTR("Localized"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTFaceTrackingManager userInfoView](self, "userInfoView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setText:", v5);

      -[AVTFaceTrackingManager updateUserInfoBackdropForCurrentLabel](self, "updateUserInfoBackdropForCurrentLabel");
      -[AVTFaceTrackingManager updateUserInfoLabelAlphaForFaceTrackingState:animated:](self, "updateUserInfoLabelAlphaForFaceTrackingState:animated:", 0, 1);
    }
  }
}

- (void)avatarViewFaceTrackingSessionInterruptionDidEnd:(id)a3
{
  if (!-[AVTFaceTrackingManager faceTrackingManagementPaused](self, "faceTrackingManagementPaused", a3)
    && -[AVTFaceTrackingManager interruptionType](self, "interruptionType") == 2)
  {
    -[AVTFaceTrackingManager resumeFaceTrackingIfNeededAnimated:](self, "resumeFaceTrackingIfNeededAnimated:", 1);
  }
}

- (void)setupDisplayLayoutMonitor
{
  void *v3;
  FBSDisplayLayoutMonitor *v4;
  FBSDisplayLayoutMonitor *displayLayoutMonitor;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, void *, void *);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __51__AVTFaceTrackingManager_setupDisplayLayoutMonitor__block_invoke;
  v9 = &unk_1EA51FFD8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setTransitionHandler:", &v6);
  objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v3, v6, v7, v8, v9);
  v4 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
  displayLayoutMonitor = self->_displayLayoutMonitor;
  self->_displayLayoutMonitor = v4;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __51__AVTFaceTrackingManager_setupDisplayLayoutMonitor__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "layoutMonitorDidUpdateDisplayLayout:withContext:", v7, v6);

}

- (void)layoutMonitorDidUpdateDisplayLayout:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__AVTFaceTrackingManager_layoutMonitorDidUpdateDisplayLayout_withContext___block_invoke;
  v7[3] = &unk_1EA51D570;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __74__AVTFaceTrackingManager_layoutMonitorDidUpdateDisplayLayout_withContext___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  unint64_t v16;
  void *v17;
  char v18;
  uint64_t v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v1 = a1;
  v28 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "faceTrackingManagementPaused");
  if ((result & 1) == 0)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(*(id *)(v1 + 40), "elements");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v3)
    {
      v4 = v3;
      v22 = *(_QWORD *)v24;
      v5 = *MEMORY[0x1E0D22C70];
      v6 = *MEMORY[0x1E0D22C78];
      v7 = *MEMORY[0x1E0D22C88];
      v21 = *MEMORY[0x1E0D22C80];
      v19 = v1;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v24 != v22)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v9, "identifier", v19);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "isEqualToString:", v5) & 1) != 0)
            goto LABEL_17;
          objc_msgSend(v9, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "isEqualToString:", v6) & 1) != 0)
            goto LABEL_16;
          objc_msgSend(v9, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqualToString:", v7))
          {

LABEL_16:
LABEL_17:

LABEL_18:
            v15 = 1;
            v1 = v19;
            goto LABEL_19;
          }
          objc_msgSend(v9, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v21);

          if ((v14 & 1) != 0)
            goto LABEL_18;
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        v15 = 0;
        v1 = v19;
        if (v4)
          continue;
        break;
      }
    }
    else
    {
      v15 = 0;
    }
LABEL_19:

    v16 = objc_msgSend(*(id *)(v1 + 32), "interruptionType");
    v17 = *(void **)(v1 + 32);
    if (v15 && v16 <= 2)
    {
      objc_msgSend(v17, "updateInterruptionTypeIfNeeded:", 3);
      objc_msgSend(*(id *)(v1 + 32), "invalidateFaceTrackingTimers");
      return objc_msgSend(*(id *)(v1 + 32), "updateForPausingTrackingWithLabel:", 0);
    }
    else
    {
      result = objc_msgSend(v17, "interruptionType");
      if (result == 3)
        v18 = v15;
      else
        v18 = 1;
      if ((v18 & 1) == 0)
        return objc_msgSend(*(id *)(v1 + 32), "resumeFaceTrackingIfNeededAnimated:", 1);
    }
  }
  return result;
}

- (BOOL)faceTrackingManagementPaused
{
  return self->_faceTrackingManagementPaused;
}

- (AVTFaceTrackingManagerDelegate)delegate
{
  return (AVTFaceTrackingManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTUserInfoView)userInfoView
{
  return self->_userInfoView;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTView)avatarView
{
  return self->_avatarView;
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (NSTimer)lowLightAndSensorOcclusionLockoutTimer
{
  return self->_lowLightAndSensorOcclusionLockoutTimer;
}

- (void)setLowLightAndSensorOcclusionLockoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_lowLightAndSensorOcclusionLockoutTimer, a3);
}

- (BOOL)shouldRecheckLowLightAndSensorOcclusionState
{
  return self->_shouldRecheckLowLightAndSensorOcclusionState;
}

- (void)setShouldRecheckLowLightAndSensorOcclusionState:(BOOL)a3
{
  self->_shouldRecheckLowLightAndSensorOcclusionState = a3;
}

- (NSTimer)trackingLostMessageTimer
{
  return self->_trackingLostMessageTimer;
}

- (void)setTrackingLostMessageTimer:(id)a3
{
  objc_storeStrong((id *)&self->_trackingLostMessageTimer, a3);
}

- (NSTimer)pauseTrackingTimer
{
  return self->_pauseTrackingTimer;
}

- (void)setPauseTrackingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pauseTrackingTimer, a3);
}

- (unint64_t)interruptionType
{
  return self->_interruptionType;
}

- (void)setInterruptionType:(unint64_t)a3
{
  self->_interruptionType = a3;
}

- (NSString)localizedDeviceName
{
  return self->_localizedDeviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDeviceName, 0);
  objc_storeStrong((id *)&self->_pauseTrackingTimer, 0);
  objc_storeStrong((id *)&self->_trackingLostMessageTimer, 0);
  objc_storeStrong((id *)&self->_lowLightAndSensorOcclusionLockoutTimer, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_userInfoView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
