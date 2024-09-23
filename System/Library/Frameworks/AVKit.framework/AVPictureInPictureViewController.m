@implementation AVPictureInPictureViewController

- (void)setPlayerController:(id)a3
{
  objc_storeStrong((id *)&self->_playerController, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVPictureInPictureViewController)initWithPictureInPicturePlayerLayerView:(id)a3
{
  AVPictureInPicturePlayerLayerView *v4;
  NSObject *v5;
  AVPictureInPictureViewController *v6;
  AVPictureInPicturePlayerLayerView *v7;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AVPictureInPictureViewController *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (AVPictureInPicturePlayerLayerView *)a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[AVPictureInPictureViewController initWithPictureInPicturePlayerLayerView:]";
    v12 = 1024;
    v13 = 35;
    v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v9.receiver = self;
  v9.super_class = (Class)AVPictureInPictureViewController;
  v6 = -[AVPictureInPictureViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v6)
  {
    v7 = v4;
    if (!v4)
      v7 = objc_alloc_init(AVPictureInPicturePlayerLayerView);
    objc_storeStrong((id *)&v6->_pictureInPicturePlayerLayerView, v7);
    if (!v4)

  }
  return v6;
}

- (AVPictureInPictureViewController)init
{
  return -[AVPictureInPictureViewController initWithPictureInPicturePlayerLayerView:](self, "initWithPictureInPicturePlayerLayerView:", 0);
}

- (AVPictureInPictureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[AVPictureInPictureViewController initWithPictureInPicturePlayerLayerView:](self, "initWithPictureInPicturePlayerLayerView:", 0, a4);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  AVPictureInPictureViewController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v6 = "-[AVPictureInPictureViewController dealloc]";
    v7 = 1024;
    v8 = 49;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVPictureInPictureViewController;
  -[AVPictureInPictureViewController dealloc](&v4, sel_dealloc);
}

- (AVPictureInPictureViewController)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ does not support unarchiving from a nib."), v7);

  return -[AVPictureInPictureViewController initWithPictureInPicturePlayerLayerView:](self, "initWithPictureInPicturePlayerLayerView:", 0);
}

- (void)loadView
{
  -[AVPictureInPictureViewController setView:](self, "setView:", self->_pictureInPicturePlayerLayerView);
}

- (AVPictureInPicturePlayerLayerView)pictureInPicturePlayerLayerView
{
  void *v3;
  void *pictureInPicturePlayerLayerView;
  void *v5;
  AVPictureInPicturePlayerLayerView *v6;

  -[AVPictureInPictureViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pictureInPicturePlayerLayerView");
  pictureInPicturePlayerLayerView = (void *)objc_claimAutoreleasedReturnValue();
  v5 = pictureInPicturePlayerLayerView;
  if (!pictureInPicturePlayerLayerView)
    pictureInPicturePlayerLayerView = self->_pictureInPicturePlayerLayerView;
  v6 = pictureInPicturePlayerLayerView;

  return v6;
}

- (void)setContentViewController:(id)a3
{
  AVPictureInPictureViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AVPictureInPictureViewController *v13;

  v13 = (AVPictureInPictureViewController *)a3;
  v5 = self->_contentViewController;
  if (v5 != v13)
  {
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (v13)
    {
      -[AVPictureInPictureViewController addChildViewController:](self, "addChildViewController:", v13);
      -[AVPictureInPictureViewController view](v13, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

      -[AVPictureInPictureViewController view](v13, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAutoresizingMask:", 18);

      -[AVPictureInPictureViewController view](v13, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPictureInPictureViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      objc_msgSend(v8, "setFrame:");

      -[AVPictureInPictureViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPictureInPictureViewController view](v13, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v11);

      -[AVPictureInPictureViewController didMoveToParentViewController:](v13, "didMoveToParentViewController:", self);
    }
    if (v5)
    {
      -[AVPictureInPictureViewController willMoveToParentViewController:](v5, "willMoveToParentViewController:", 0);
      -[AVPictureInPictureViewController view](v5, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeFromSuperview");

      -[AVPictureInPictureViewController removeFromParentViewController](v5, "removeFromParentViewController");
    }
  }

}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (BOOL)shouldShowAlternateActionButtonImage
{
  return self->_shouldShowAlternateActionButtonImage;
}

- (void)setShouldShowAlternateActionButtonImage:(BOOL)a3
{
  self->_shouldShowAlternateActionButtonImage = a3;
}

- (AVPictureInPictureViewControllerDelegate)delegate
{
  return (AVPictureInPictureViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (AVPictureInPictureViewController)contentViewController
{
  return self->_contentViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_pictureInPicturePlayerLayerView, 0);
}

- (void)willAnimatePictureInPictureStart
{
  id v3;

  -[AVPictureInPictureViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pictureInPictureViewControllerViewDidAppear:", self);

}

- (void)didAnimatePictureInPictureStop
{
  id v3;

  -[AVPictureInPictureViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pictureInPictureViewControllerViewWillDisappear:", self);

}

@end
