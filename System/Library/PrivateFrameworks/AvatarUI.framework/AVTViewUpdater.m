@implementation AVTViewUpdater

- (AVTViewUpdater)initWithAVTView:(id)a3 logger:(id)a4
{
  return -[AVTViewUpdater initWithAVTView:callbackQueue:logger:](self, "initWithAVTView:callbackQueue:logger:", a3, MEMORY[0x1E0C80D38], a4);
}

- (AVTViewUpdater)initWithAVTView:(id)a3 callbackQueue:(id)a4 logger:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTViewUpdater *v12;
  AVTViewUpdater *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTViewUpdater;
  v12 = -[AVTViewUpdater init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_logger, a5);
    objc_storeStrong((id *)&v13->_avtView, a3);
    objc_storeStrong((id *)&v13->_callbackQueue, a4);
    v13->_lock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (void)setAvatarRecord:(id)a3 completionHandler:(id)a4
{
  -[AVTViewUpdater setAvatarRecord:avatar:completionHandler:](self, "setAvatarRecord:avatar:completionHandler:", a3, 0, a4);
}

- (void)setStickerConfiguration:(id)a3 completionHandler:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  CFTimeInterval v8;
  void *v9;
  id v10;

  p_lock = &self->_lock;
  v10 = a4;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  v8 = CACurrentMediaTime();
  self->_lastUpdateTimestamp = v8;
  os_unfair_lock_unlock(p_lock);
  -[AVTViewUpdater avtView](self, "avtView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitionToStickerConfiguration:duration:completionHandler:", v7, 0, 0.0);

  -[AVTViewUpdater addAvatarPresentedOnScreenCallbackWithQueue:forTimestamp:](self, "addAvatarPresentedOnScreenCallbackWithQueue:forTimestamp:", v10, v8);
}

- (void)setAvatarRecord:(id)a3 avatar:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  CFTimeInterval v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  v10 = CACurrentMediaTime();
  self->_lastUpdateTimestamp = v10;
  os_unfair_lock_unlock(&self->_lock);
  v11 = -[AVTViewUpdater willUpdateViewForRecord:avatar:](self, "willUpdateViewForRecord:avatar:", v23, v8);
  -[AVTViewUpdater setAvatarRecord:](self, "setAvatarRecord:", v23);
  if (v11)
  {
    v12 = v8;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0D00858], "avatarForRecord:", v23);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[AVTViewUpdater setCurrentAvatar:](self, "setCurrentAvatar:", v12);
    -[AVTViewUpdater logger](self, "logger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logAVTViewSetAvatar:", v14);

    -[AVTViewUpdater avtView](self, "avtView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "avatar");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v16, "pose");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTViewUpdater avtView](self, "avtView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_msgSend(v18, "enableFaceTracking");

    if ((v16 & 1) == 0 && !v17)
    {
      objc_msgSend(MEMORY[0x1E0D00658], "friendlyPose");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[AVTViewUpdater avtView](self, "avtView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAvatar:", v12);

    -[AVTViewUpdater avtView](self, "avtView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "enableFaceTracking");

    if ((v21 & 1) == 0)
    {
      -[AVTViewUpdater avtView](self, "avtView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "transitionToPose:duration:completionHandler:", v17, 0, 0.0);

    }
  }
  -[AVTViewUpdater addAvatarPresentedOnScreenCallbackWithQueue:forTimestamp:](self, "addAvatarPresentedOnScreenCallbackWithQueue:forTimestamp:", v9, v10);

}

- (BOOL)willUpdateViewForRecord:(id)a3 avatar:(id)a4
{
  void *v4;
  unint64_t v7;
  id v8;
  uint64_t v9;
  char v10;
  int v11;
  void *v12;
  void *v13;

  v7 = (unint64_t)a3;
  v8 = a4;
  -[AVTViewUpdater avatarRecord](self, "avatarRecord");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v7 | v9)
  {
    -[AVTViewUpdater avatarRecord](self, "avatarRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "isEqual:", v7);
    LOBYTE(v11) = v10 ^ 1;
    if (!v8 || (v10 & 1) == 0)
      goto LABEL_7;
  }
  else if (!v8)
  {
    LOBYTE(v11) = 0;
    goto LABEL_9;
  }
  -[AVTViewUpdater currentAvatar](self, "currentAvatar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTViewUpdater currentAvatar](self, "currentAvatar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v13, "isEqual:", v8) ^ 1;

  if (v7 | v9)
LABEL_7:

LABEL_9:
  return v11;
}

- (void)addAvatarPresentedOnScreenCallbackWithQueue:(id)a3 forTimestamp:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a3;
  if (v6)
  {
    objc_initWeak(&location, self);
    -[AVTViewUpdater avtView](self, "avtView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTViewUpdater callbackQueue](self, "callbackQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__AVTViewUpdater_addAvatarPresentedOnScreenCallbackWithQueue_forTimestamp___block_invoke;
    v9[3] = &unk_1EA51D548;
    objc_copyWeak(v11, &location);
    v11[1] = *(id *)&a4;
    v10 = v6;
    objc_msgSend(v7, "addAvatarPresentedOnScreenCallbackWithQueue:block:", v8, v9);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }

}

void __75__AVTViewUpdater_addAvatarPresentedOnScreenCallbackWithQueue_forTimestamp___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained + 2;
    v4 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 2);
    os_unfair_lock_unlock(v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v4;
  }

}

- (AVTView)avtView
{
  return self->_avtView;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTAvatar)currentAvatar
{
  return self->_currentAvatar;
}

- (void)setCurrentAvatar:(id)a3
{
  objc_storeStrong((id *)&self->_currentAvatar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAvatar, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_avtView, 0);
}

@end
