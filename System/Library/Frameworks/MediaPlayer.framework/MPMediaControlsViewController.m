@implementation MPMediaControlsViewController

- (MPMediaControlsViewController)init
{
  return -[MPMediaControlsViewController initWithConfiguration:](self, "initWithConfiguration:", 0);
}

- (MPMediaControlsViewController)initWithConfiguration:(id)a3
{
  id v5;
  MPMediaControlsViewController *v6;
  MPMediaControlsViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMediaControlsViewController;
  v6 = -[MPMediaControlsViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    -[MPMediaControlsViewController setTransitioningDelegate:](v7, "setTransitioningDelegate:", v7);
    -[MPMediaControlsViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 4);
  }

  return v7;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPMediaControlsViewController;
  -[MPMediaControlsViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[MPMediaControlsViewController _createMediaControlsIfNeeded](self, "_createMediaControlsIfNeeded");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPMediaControlsViewController;
  -[MPMediaControlsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MPMediaControlsViewController _present](self, "_present");
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (MPMediaControlsConfiguration)configuration
{
  -[MPMediaControlsViewController _createMediaControlsIfNeeded](self, "_createMediaControlsIfNeeded");
  return -[MPMediaControls configuration](self->_mediaControls, "configuration");
}

- (void)setMediaControls:(id)a3
{
  id v5;
  MPMediaControlsConfiguration *configuration;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v5 = a3;
  objc_storeStrong((id *)&self->_mediaControls, a3);
  configuration = self->_configuration;
  if (configuration)
  {
    v7 = -[MPMediaControlsConfiguration sortByIsVideoRoute](configuration, "sortByIsVideoRoute");
    objc_msgSend(v5, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSortByIsVideoRoute:", v7);

  }
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__MPMediaControlsViewController_setMediaControls___block_invoke;
  v9[3] = &unk_1E315E5D0;
  objc_copyWeak(&v10, &location);
  -[MPMediaControls setDismissHandler:](self->_mediaControls, "setDismissHandler:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_createMediaControlsIfNeeded
{
  MPMediaControls *v3;
  MPMediaControls *v4;
  MPMediaControls *v5;

  if (!self->_mediaControls)
  {
    if (self->_configuration)
    {
      v3 = [MPMediaControls alloc];
      -[MPMediaControlsViewController configuration](self, "configuration");
      v5 = (MPMediaControls *)objc_claimAutoreleasedReturnValue();
      v4 = -[MPMediaControls initWithConfiguration:](v3, "initWithConfiguration:");
      -[MPMediaControlsViewController setMediaControls:](self, "setMediaControls:", v4);

    }
    else
    {
      v5 = objc_alloc_init(MPMediaControls);
      -[MPMediaControlsViewController setMediaControls:](self, "setMediaControls:");
    }

  }
}

- (void)_present
{
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = (id)objc_opt_class();
    v4 = v7;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_INFO, "Attempting to present media controls using a deprecated class: %@", (uint8_t *)&v6, 0xCu);

  }
  -[MPMediaControlsViewController mediaControls](self, "mediaControls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "present");

}

- (void)startPrewarming
{
  -[MPMediaControls startPrewarming](self->_mediaControls, "startPrewarming");
}

- (void)stopPrewarming
{
  -[MPMediaControls stopPrewarming](self->_mediaControls, "stopPrewarming");
}

- (void)dismiss
{
  -[MPMediaControls dismiss](self->_mediaControls, "dismiss");
}

- (void)setOverrideRouteSharingPolicy:(unint64_t)a3 routingContextUID:(id)a4
{
  id v6;
  NSObject *v7;
  MPMediaControls *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134349314;
    v10 = a3;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "Creating override MediaControls configuration with routeSharingPolicy=%{public}lu routingContextUID=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = -[MPMediaControls initWithRouteSharingPolicy:routingContextUID:]([MPMediaControls alloc], "initWithRouteSharingPolicy:routingContextUID:", a3, v6);
  -[MPMediaControlsViewController setMediaControls:](self, "setMediaControls:", v8);

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  _MPMediaControlsPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_MPMediaControlsPresentationController initWithPresentedViewController:presentingViewController:]([_MPMediaControlsPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  return v8;
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)animateTransition:(id)a3
{
  objc_msgSend(a3, "completeTransition:", 1);
}

- (id)didDismissHandler
{
  return self->_didDismissHandler;
}

- (void)setDidDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (MPMediaControlsViewControllerDelegate)delegate
{
  return (MPMediaControlsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MPMediaControls)mediaControls
{
  return self->_mediaControls;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_didDismissHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __50__MPMediaControlsViewController_setMediaControls___block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 0, 0);
  objc_msgSend(WeakRetained, "didDismissHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "didDismissHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

  }
}

@end
