@implementation CAMViewfinderOpenAndCloseTransition

- (void)closeAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  -[CAMViewfinderOpenAndCloseTransition _closeViewfinder:animated:withCompletionHandler:](self, "_closeViewfinder:animated:withCompletionHandler:", 1, a3, a4);
}

- (void)_closeViewfinder:(BOOL)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  BOOL v22;
  id location;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  CAMSignpostWithIDAndArgs(5, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  -[CAMViewfinderOpenAndCloseTransition _existingSnapshotViewCreateIfNecessary:removedOnCompletion:](self, "_existingSnapshotViewCreateIfNecessary:removedOnCompletion:", v6, v6 ^ 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderOpenAndCloseTransition _transitionableViewfinder](self, "_transitionableViewfinder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "previewView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", v6);

  objc_initWeak(&location, v9);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __87__CAMViewfinderOpenAndCloseTransition__closeViewfinder_animated_withCompletionHandler___block_invoke;
  v19 = &unk_1EA32BC60;
  v22 = !v6;
  objc_copyWeak(&v21, &location);
  v12 = v8;
  v20 = v12;
  v13 = _Block_copy(&v16);
  v14 = -[CAMViewfinderOpenAndCloseTransition didEnterBackground](self, "didEnterBackground", v16, v17, v18, v19);
  if (v14)
    v15 = 2;
  else
    v15 = 0;
  if (!v14 && !v6)
  {
    if ((objc_msgSend(v9, "blurred") & 1) == 0)
    {
      objc_msgSend(v9, "fadeOutAnimatedWithStyle:completion:", 0, v13);
      goto LABEL_9;
    }
    v15 = 0;
  }
  objc_msgSend(v9, "setBlurred:animated:style:withCompletionBlock:", v6, v5, v15, v13);
LABEL_9:

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (id)_existingSnapshotViewCreateIfNecessary:(BOOL)a3 removedOnCompletion:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  CAMSnapshotView *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  -[CAMViewfinderOpenAndCloseTransition _snapshotView](self, "_snapshotView");
  v7 = (CAMSnapshotView *)objc_claimAutoreleasedReturnValue();
  if (!v7 && v5)
  {
    -[CAMViewfinderOpenAndCloseTransition _transitionableViewfinder](self, "_transitionableViewfinder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "previewView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CAMSnapshotView initWithView:desiredAspectRatio:]([CAMSnapshotView alloc], "initWithView:desiredAspectRatio:", v9, objc_msgSend(v8, "desiredAspectRatio"));
    objc_msgSend(v10, "insertSubview:aboveSubview:", v7, v9);
    -[CAMViewfinderOpenAndCloseTransition _setSnapshotView:](self, "_setSnapshotView:", v7);

  }
  if (v7 && v4)
    -[CAMViewfinderOpenAndCloseTransition _setSnapshotView:](self, "_setSnapshotView:", 0);
  return v7;
}

- (CAMSnapshotView)_snapshotView
{
  return self->__snapshotView;
}

- (void)_setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->__snapshotView, a3);
}

- (BOOL)didEnterBackground
{
  return self->_didEnterBackground;
}

uint64_t __87__CAMViewfinderOpenAndCloseTransition__closeViewfinder_animated_withCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  CAMSignpostWithIDAndArgs(6, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  if (*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "removeFromSuperview");

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setDidEnterBackground:(BOOL)a3
{
  self->_didEnterBackground = a3;
}

- (CAMViewfinderOpenAndCloseTransition)initWithTransitionableViewfinder:(id)a3
{
  id v4;
  CAMViewfinderOpenAndCloseTransition *v5;
  CAMViewfinderOpenAndCloseTransition *v6;
  CAMViewfinderOpenAndCloseTransition *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMViewfinderOpenAndCloseTransition;
  v5 = -[CAMViewfinderOpenAndCloseTransition init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->__transitionableViewfinder, v4);
    v6->_didEnterBackground = 0;
    v7 = v6;
  }

  return v6;
}

- (void)openAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  -[CAMViewfinderOpenAndCloseTransition _closeViewfinder:animated:withCompletionHandler:](self, "_closeViewfinder:animated:withCompletionHandler:", 0, a3, a4);
}

- (void)closeWithoutBlurring
{
  id v3;
  void *v4;
  id v5;

  v3 = -[CAMViewfinderOpenAndCloseTransition _existingSnapshotViewCreateIfNecessary:removedOnCompletion:](self, "_existingSnapshotViewCreateIfNecessary:removedOnCompletion:", 1, 0);
  -[CAMViewfinderOpenAndCloseTransition _transitionableViewfinder](self, "_transitionableViewfinder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (CAMViewfinderTransitionable)_transitionableViewfinder
{
  return (CAMViewfinderTransitionable *)objc_loadWeakRetained((id *)&self->__transitionableViewfinder);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__snapshotView, 0);
  objc_destroyWeak((id *)&self->__transitionableViewfinder);
}

@end
