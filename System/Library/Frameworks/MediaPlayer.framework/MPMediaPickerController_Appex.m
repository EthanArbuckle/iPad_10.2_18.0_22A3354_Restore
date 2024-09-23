@implementation MPMediaPickerController_Appex

- (void)requestRemoteViewController
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *, void *);
  void *v13;
  MPMediaPickerController_Appex *v14;
  id v15;
  uint64_t *v16;
  SEL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaPickerController);
  objc_msgSend(WeakRetained, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_14408, 3.0);
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", CFSTR("com.apple.Music.MediaPicker"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__14411;
  v22 = __Block_byref_object_dispose__14412;
  v23 = 0;
  v6 = (void *)MEMORY[0x1E0DC42F0];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __60__MPMediaPickerController_Appex_requestRemoteViewController__block_invoke_183;
  v13 = &unk_1E3156468;
  v17 = a2;
  v14 = self;
  v7 = WeakRetained;
  v15 = v7;
  v16 = &v18;
  objc_msgSend(v6, "instantiateWithExtension:completion:", v5, &v10);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v19[5];
  v19[5] = v8;

  objc_msgSend((id)v19[5], "delayDisplayOfRemoteController", v10, v11, v12, v13, v14);
  objc_storeStrong((id *)&self->_remoteViewContainerViewController, (id)v19[5]);
  _Block_object_dispose(&v18, 8);

}

- (UIViewController)remoteViewController
{
  return (UIViewController *)self->_remoteViewContainerViewController;
}

- (void)synchronizeSettings
{
  id WeakRetained;
  void *v4;
  id v5;

  -[MPMediaPickerController_Appex serviceController](self, "serviceController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaPickerController);
  objc_msgSend(WeakRetained, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithConfiguration:", v4);

}

- (void)dealloc
{
  _UIResilientRemoteViewContainerViewController *remoteViewContainerViewController;
  void *v4;
  void *v5;
  objc_super v6;

  remoteViewContainerViewController = self->_remoteViewContainerViewController;
  if (remoteViewContainerViewController)
  {
    -[_UIResilientRemoteViewContainerViewController remoteViewController](remoteViewContainerViewController, "remoteViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMediaPickerController:", 0);

    -[_UIResilientRemoteViewContainerViewController willMoveToParentViewController:](self->_remoteViewContainerViewController, "willMoveToParentViewController:", 0);
    if (-[_UIResilientRemoteViewContainerViewController isViewLoaded](self->_remoteViewContainerViewController, "isViewLoaded"))
    {
      -[_UIResilientRemoteViewContainerViewController view](self->_remoteViewContainerViewController, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

    }
    -[_UIResilientRemoteViewContainerViewController removeFromParentViewController](self->_remoteViewContainerViewController, "removeFromParentViewController");
  }
  v6.receiver = self;
  v6.super_class = (Class)MPMediaPickerController_Appex;
  -[MPMediaPickerController_Appex dealloc](&v6, sel_dealloc);
}

- (id)serviceController
{
  return -[_UIRemoteViewController serviceViewControllerProxy](self->_musicRemoteViewController, "serviceViewControllerProxy");
}

- (MPMediaPickerController)mediaPickerController
{
  return (MPMediaPickerController *)objc_loadWeakRetained((id *)&self->_mediaPickerController);
}

- (void)setMediaPickerController:(id)a3
{
  objc_storeWeak((id *)&self->_mediaPickerController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mediaPickerController);
  objc_storeStrong((id *)&self->_musicRemoteViewController, 0);
  objc_storeStrong((id *)&self->_remoteViewContainerViewController, 0);
}

@end
