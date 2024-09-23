@implementation AVTViewSessionProvider

+ (id)creatorForAVTView
{
  return (id)objc_msgSend(&__block_literal_global_25, "copy");
}

AVTFixedSizeViewContainer *__43__AVTViewSessionProvider_creatorForAVTView__block_invoke(double a1, double a2, uint64_t a3, _QWORD *a4, AVTFixedSizeViewContainer **a5)
{
  AVTFixedSizeViewContainer *result;

  *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D006A8]), "initWithFrame:", 0.0, 0.0, a1, a2);
  result = -[AVTFixedSizeViewContainer initWithFixedSizeView:]([AVTFixedSizeViewContainer alloc], "initWithFixedSizeView:", *a4);
  *a5 = result;
  return result;
}

+ (id)creatorForAVTRecordView
{
  return (id)objc_msgSend(&__block_literal_global_5, "copy");
}

AVTFixedSizeViewContainer *__49__AVTViewSessionProvider_creatorForAVTRecordView__block_invoke(double a1, double a2, uint64_t a3, _QWORD *a4, AVTFixedSizeViewContainer **a5)
{
  AVTFixedSizeViewContainer *result;

  *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D00680]), "initWithFrame:", 0.0, 0.0, a1, a2);
  result = -[AVTFixedSizeViewContainer initWithFixedSizeView:]([AVTFixedSizeViewContainer alloc], "initWithFixedSizeView:", *a4);
  *a5 = result;
  return result;
}

+ (CGSize)backingSizeForEnvironment:(id)a3
{
  int v3;
  double v4;
  double v5;
  CGSize result;

  v3 = objc_msgSend(a3, "deviceIsPad");
  v4 = 380.0;
  if (v3)
    v4 = 512.0;
  v5 = 285.0;
  if (v3)
    v5 = 384.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (AVTViewSessionProvider)initWithAVTViewBackingSize:(CGSize)a3 viewCreator:(id)a4 environment:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  AVTViewSessionProvider *v11;
  AVTViewSessionProvider *v12;
  uint64_t v13;
  id viewCreator;
  uint64_t v15;
  NSNotificationCenter *notificationCenter;
  objc_super v18;

  height = a3.height;
  width = a3.width;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AVTViewSessionProvider;
  v11 = -[AVTViewSessionProvider init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_avtViewBackingSize.width = width;
    v11->_avtViewBackingSize.height = height;
    v13 = objc_msgSend(v9, "copy");
    viewCreator = v12->_viewCreator;
    v12->_viewCreator = (id)v13;

    objc_storeStrong((id *)&v12->_environment, a5);
    objc_msgSend(v10, "notificationCenter");
    v15 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v12->_notificationCenter;
    v12->_notificationCenter = (NSNotificationCenter *)v15;

    -[NSNotificationCenter addObserver:selector:name:object:](v12->_notificationCenter, "addObserver:selector:name:object:", v12, sel_handleProviderTakesPrimaryStatusNotification_, CFSTR("AVTViewSessionProviderTakePrimaryStatusNotification"), 0);
    -[NSNotificationCenter addObserver:selector:name:object:](v12->_notificationCenter, "addObserver:selector:name:object:", v12, sel_handleProviderReleasesPrimaryStatusNotification_, CFSTR("AVTViewSessionProviderReleasePrimaryStatusNotification"), 0);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[NSNotificationCenter removeObserver:](self->_notificationCenter, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)AVTViewSessionProvider;
  -[AVTViewSessionProvider dealloc](&v3, sel_dealloc);
}

- (id)sessionWithDidBecomeActiveHandler:(id)a3 tearDownHandler:(id)a4
{
  id v6;
  id v7;
  AVTViewSession *v8;
  AVTViewSession *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  v8 = [AVTViewSession alloc];
  -[AVTViewSessionProvider avtViewBackingSize](self, "avtViewBackingSize");
  v9 = -[AVTViewSession initWithBecomeActiveHandler:tearDownHandler:aspectRatio:](v8, "initWithBecomeActiveHandler:tearDownHandler:aspectRatio:", v7, v6);

  -[AVTViewSession setDelegate:](v9, "setDelegate:", self);
  -[AVTViewSessionProvider setPendingSession:](self, "setPendingSession:", v9);
  -[AVTViewSessionProvider activeSession](self, "activeSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v10, "isActive");

  -[AVTViewSessionProvider activeSession](self, "activeSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((_DWORD)v6)
  {
    objc_msgSend(v11, "tearDownWithCompletionHandler:", 0);

  }
  else
  {

    if (!v12)
    {
      -[AVTViewSessionProvider delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
      {
        -[AVTViewSessionProvider delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sessionProviderWillStartCameraSession:", self);

      }
      -[AVTViewSessionProvider activateNextSession](self, "activateNextSession");
    }
  }
  return v9;
}

- (void)activateNextSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  -[AVTViewSessionProvider pendingSession](self, "pendingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTViewSessionProvider notificationCenter](self, "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("AVTViewSessionProviderTakePrimaryStatusNotification"), self);

    -[AVTViewSessionProvider createContainerAndViewIfNeeded](self, "createContainerAndViewIfNeeded");
    -[AVTViewSessionProvider pendingSession](self, "pendingSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTViewSessionProvider setActiveSession:](self, "setActiveSession:", v6);

    -[AVTViewSessionProvider setPendingSession:](self, "setPendingSession:", 0);
    -[AVTViewSessionProvider activeSession](self, "activeSession");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTViewSessionProvider avtView](self, "avtView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTViewSessionProvider avtViewContainer](self, "avtViewContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTViewSessionProvider avtViewUpdater](self, "avtViewUpdater");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activateWithAVTView:container:updater:", v7, v8, v9);

  }
  else
  {
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("AVTViewSessionProviderReleasePrimaryStatusNotification"), self);

    -[AVTViewSessionProvider delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
      return;
    -[AVTViewSessionProvider delegate](self, "delegate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sessionProviderDidEndCameraSession:", self);
  }

}

- (void)createContainerAndViewIfNeeded
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;
  id v6;
  AVTViewUpdater *v7;
  void *v8;
  void *v9;
  void *v10;
  AVTViewUpdater *v11;
  AVTFaceTrackingManager *v12;
  void *v13;
  AVTFaceTrackingManager *v14;
  id v15;
  id v16;

  -[AVTViewSessionProvider avtViewContainer](self, "avtViewContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[AVTViewSessionProvider viewCreator](self, "viewCreator");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[AVTViewSessionProvider avtViewBackingSize](self, "avtViewBackingSize");
    v15 = 0;
    v16 = 0;
    ((void (**)(_QWORD, id *, id *))v4)[2](v4, &v16, &v15);
    v5 = v16;
    v6 = v15;

    -[AVTViewSessionProvider setAvtViewContainer:](self, "setAvtViewContainer:", v6);
    -[AVTViewSessionProvider setAvtView:](self, "setAvtView:", v5);
    v7 = [AVTViewUpdater alloc];
    -[AVTViewSessionProvider avtView](self, "avtView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTViewSessionProvider environment](self, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AVTViewUpdater initWithAVTView:logger:](v7, "initWithAVTView:logger:", v8, v10);
    -[AVTViewSessionProvider setAvtViewUpdater:](self, "setAvtViewUpdater:", v11);

    v12 = [AVTFaceTrackingManager alloc];
    -[AVTViewSessionProvider environment](self, "environment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[AVTFaceTrackingManager initWithAvatarView:environment:](v12, "initWithAvatarView:environment:", v5, v13);

    -[AVTViewSessionProvider setFaceTrackingManager:](self, "setFaceTrackingManager:", v14);
  }
}

- (void)handleProviderTakesPrimaryStatusNotification:(id)a3
{
  AVTViewSessionProvider *v4;
  id v5;

  objc_msgSend(a3, "object");
  v4 = (AVTViewSessionProvider *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
  {
    -[AVTViewSessionProvider activeSession](self, "activeSession");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTViewSessionProvider didLosePrimaryStatusWithSessionToPause:](self, "didLosePrimaryStatusWithSessionToPause:", v5);

  }
}

- (void)didLosePrimaryStatusWithSessionToPause:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "avtView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enableFaceTracking");

  if (v5)
  {
    objc_msgSend(v7, "avtView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnableFaceTracking:", 0);

    -[AVTViewSessionProvider setPausedTrackingSession:](self, "setPausedTrackingSession:", v7);
  }

}

- (void)handleProviderReleasesPrimaryStatusNotification:(id)a3
{
  AVTViewSessionProvider *v4;
  void *v5;

  objc_msgSend(a3, "object");
  v4 = (AVTViewSessionProvider *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
  {
    -[AVTViewSessionProvider pausedTrackingSession](self, "pausedTrackingSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[AVTViewSessionProvider recoverPrimaryStatus](self, "recoverPrimaryStatus");
  }
}

- (void)recoverPrimaryStatus
{
  void *v3;
  void *v4;

  -[AVTViewSessionProvider pausedTrackingSession](self, "pausedTrackingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avtView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnableFaceTracking:", 1);

  -[AVTViewSessionProvider setPausedTrackingSession:](self, "setPausedTrackingSession:", 0);
}

- (void)sessionDidTearDown:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  -[AVTViewSessionProvider pendingSession](self, "pendingSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
  {
    -[AVTViewSessionProvider setPendingSession:](self, "setPendingSession:", 0);
  }
  else
  {
    -[AVTViewSessionProvider activeSession](self, "activeSession");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 != v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This method can only be called if the session was known to the provider"));
    -[AVTViewSessionProvider setActiveSession:](self, "setActiveSession:", 0);
    -[AVTViewSessionProvider activateNextSession](self, "activateNextSession");
  }

}

- (CGSize)avtViewBackingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_avtViewBackingSize.width;
  height = self->_avtViewBackingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (AVTViewSessionProviderDelegate)delegate
{
  return (AVTViewSessionProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTFaceTrackingManager)faceTrackingManager
{
  return self->_faceTrackingManager;
}

- (void)setFaceTrackingManager:(id)a3
{
  objc_storeStrong((id *)&self->_faceTrackingManager, a3);
}

- (id)viewCreator
{
  return self->_viewCreator;
}

- (UIView)avtViewContainer
{
  return self->_avtViewContainer;
}

- (void)setAvtViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_avtViewContainer, a3);
}

- (AVTView)avtView
{
  return self->_avtView;
}

- (void)setAvtView:(id)a3
{
  objc_storeStrong((id *)&self->_avtView, a3);
}

- (AVTViewUpdater)avtViewUpdater
{
  return self->_avtViewUpdater;
}

- (void)setAvtViewUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_avtViewUpdater, a3);
}

- (AVTViewSession)activeSession
{
  return self->_activeSession;
}

- (void)setActiveSession:(id)a3
{
  objc_storeStrong((id *)&self->_activeSession, a3);
}

- (AVTViewSession)pendingSession
{
  return self->_pendingSession;
}

- (void)setPendingSession:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSession, a3);
}

- (AVTViewSession)pausedTrackingSession
{
  return self->_pausedTrackingSession;
}

- (void)setPausedTrackingSession:(id)a3
{
  objc_storeStrong((id *)&self->_pausedTrackingSession, a3);
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_pausedTrackingSession, 0);
  objc_storeStrong((id *)&self->_pendingSession, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong((id *)&self->_avtViewUpdater, 0);
  objc_storeStrong((id *)&self->_avtView, 0);
  objc_storeStrong((id *)&self->_avtViewContainer, 0);
  objc_storeStrong(&self->_viewCreator, 0);
  objc_storeStrong((id *)&self->_faceTrackingManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
