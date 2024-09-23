@implementation CAMViewfinderTransitionController

- (void)closeWithBlur:(BOOL)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  CAMViewfinderOpenAndCloseTransition *v8;
  CAMViewfinderOpenAndCloseTransition *v9;
  void *v10;
  void (**v11)(void);

  v5 = a4;
  v6 = a3;
  v11 = (void (**)(void))a5;
  -[CAMViewfinderTransitionController _openAndCloseTransition](self, "_openAndCloseTransition");
  v8 = (CAMViewfinderOpenAndCloseTransition *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = [CAMViewfinderOpenAndCloseTransition alloc];
    -[CAMViewfinderTransitionController target](self, "target");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CAMViewfinderOpenAndCloseTransition initWithTransitionableViewfinder:](v9, "initWithTransitionableViewfinder:", v10);

    -[CAMViewfinderTransitionController _setOpenAndCloseTransition:](self, "_setOpenAndCloseTransition:", v8);
  }
  if (v6)
  {
    -[CAMViewfinderOpenAndCloseTransition closeAnimated:withCompletionHandler:](v8, "closeAnimated:withCompletionHandler:", v5, v11);
  }
  else
  {
    -[CAMViewfinderOpenAndCloseTransition closeWithoutBlurring](v8, "closeWithoutBlurring");
    if (v11)
      v11[2]();
  }

}

- (void)closeAndRotateWithDirection:(unint64_t)a3 withCompletionHandler:(id)a4
{
  CAMViewfinderFlipTransition *v6;
  CAMViewfinderFlipTransition *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[CAMViewfinderTransitionController _flipTransition](self, "_flipTransition");
  v6 = (CAMViewfinderFlipTransition *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = [CAMViewfinderFlipTransition alloc];
    -[CAMViewfinderTransitionController target](self, "target");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CAMViewfinderFlipTransition initWithTransitionableViewfinder:](v7, "initWithTransitionableViewfinder:", v8);

    -[CAMViewfinderTransitionController _setFlipTransition:](self, "_setFlipTransition:", v6);
  }
  -[CAMViewfinderFlipTransition performFlipTransitionWithDirection:completionHandler:](v6, "performFlipTransitionWithDirection:completionHandler:", a3, v9);

}

- (void)openForReason:(int64_t)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  __int16 v14;
  uint8_t buf[2];

  v5 = a4;
  v7 = a5;
  -[CAMViewfinderTransitionController _openAndCloseTransition](self, "_openAndCloseTransition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderTransitionController _flipTransition](self, "_flipTransition");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
  {
    -[CAMViewfinderTransitionController _setOpenAndCloseTransition:](self, "_setOpenAndCloseTransition:", 0);
    objc_msgSend(v8, "openAnimated:withCompletionHandler:", v5, v7);
    if (!v10)
      goto LABEL_12;
  }
  else if (!v9)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Attempting to open the viewfinder with a missing transition! Maybe the viewfinder is already open?";
      v13 = buf;
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  -[CAMViewfinderTransitionController _setFlipTransition:](self, "_setFlipTransition:", 0);
  objc_msgSend(v10, "completeTransitionToLivePreviewWithCompletionHandler:", v7);
  if (v8)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v12 = "Opened the viewfinder removing both an open/close and a flip transtion.";
      v13 = (uint8_t *)&v14;
LABEL_10:
      _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
LABEL_12:

}

- (void)handleApplicationDidEnterBackground
{
  id v2;

  -[CAMViewfinderTransitionController _openAndCloseTransition](self, "_openAndCloseTransition");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDidEnterBackground:", 1);

}

- (CAMViewfinderTransitionable)target
{
  return (CAMViewfinderTransitionable *)objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (CAMViewfinderOpenAndCloseTransition)_openAndCloseTransition
{
  return self->__openAndCloseTransition;
}

- (void)_setOpenAndCloseTransition:(id)a3
{
  objc_storeStrong((id *)&self->__openAndCloseTransition, a3);
}

- (CAMViewfinderFlipTransition)_flipTransition
{
  return self->__flipTransition;
}

- (void)_setFlipTransition:(id)a3
{
  objc_storeStrong((id *)&self->__flipTransition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__flipTransition, 0);
  objc_storeStrong((id *)&self->__openAndCloseTransition, 0);
  objc_destroyWeak((id *)&self->_target);
}

@end
