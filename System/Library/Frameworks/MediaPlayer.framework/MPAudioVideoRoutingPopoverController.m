@implementation MPAudioVideoRoutingPopoverController

- (MPAudioVideoRoutingPopoverController)initWithType:(int64_t)a3
{
  return -[MPAudioVideoRoutingPopoverController initWithType:includeMirroring:](self, "initWithType:includeMirroring:", a3, 0);
}

- (MPAudioVideoRoutingPopoverController)initWithType:(int64_t)a3 includeMirroring:(BOOL)a4
{
  MPAVRoutingViewController *v7;
  void *v8;
  void *v9;
  MPAudioVideoRoutingPopoverController *v10;
  MPAudioVideoRoutingPopoverController *v11;
  void *v14;
  objc_super v15;

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAudioVideoRoutingPopoverController.m"), 46, CFSTR("Mirroring is no longer supported by MPAudioVideoRoutingPopoverController"));

  }
  v7 = -[MPAVRoutingViewController initWithStyle:]([MPAVRoutingViewController alloc], "initWithStyle:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoutingViewController _setTableCellsBackgroundColor:](v7, "_setTableCellsBackgroundColor:", v8);

  -[MPAVRoutingViewController setAVItemType:](v7, "setAVItemType:", a3);
  -[MPAVRoutingViewController setMirroringStyle:](v7, "setMirroringStyle:", 0);
  -[MPAVRoutingViewController setDelegate:](v7, "setDelegate:", self);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
  v15.receiver = self;
  v15.super_class = (Class)MPAudioVideoRoutingPopoverController;
  v10 = -[MPAudioVideoRoutingPopoverController initWithContentViewController:](&v15, sel_initWithContentViewController_, v9);
  v11 = v10;
  if (v10)
  {
    v10->_mirroringIncluded = a4;
    objc_storeStrong((id *)&v10->_routingViewController, v7);
  }

  return v11;
}

- (MPAudioVideoRoutingPopoverController)initWithContentViewController:(id)a3
{
  id v4;
  MPAudioVideoRoutingPopoverController *v5;
  NSObject *v6;
  id v7;
  uint32_t v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPAudioVideoRoutingPopoverController;
  v5 = -[MPAudioVideoRoutingPopoverController initWithContentViewController:](&v13, sel_initWithContentViewController_, v4);
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = MEMORY[0x1E0C80D38];
    v7 = MEMORY[0x1E0C80D38];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__MPAudioVideoRoutingPopoverController_initWithContentViewController___block_invoke;
    v10[3] = &unk_1E315E6B0;
    objc_copyWeak(&v11, &location);
    v8 = notify_register_dispatch("com.apple.mediaplayer.airPlayPasswordAlertWillAppear", &v5->_airPlayPasswordAlertDidAppearToken, v6, v10);

    v5->_airPlayPasswordAlertDidAppearTokenIsValid = v8 == 0;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_airPlayPasswordAlertDidAppearTokenIsValid)
    notify_cancel(self->_airPlayPasswordAlertDidAppearToken);
  v3.receiver = self;
  v3.super_class = (Class)MPAudioVideoRoutingPopoverController;
  -[MPAudioVideoRoutingPopoverController dealloc](&v3, sel_dealloc);
}

- (void)setMirroringOnly:(BOOL)a3
{
  void *v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAudioVideoRoutingPopoverController.m"), 101, CFSTR("Mirroring is no longer supported by MPAudioVideoRoutingPopoverController"));

  }
  self->_mirroringOnly = a3;
}

- (id)routingController
{
  return -[MPAVRoutingViewController _routingController](self->_routingViewController, "_routingController");
}

- (void)routingViewController:(id)a3 didPickRoute:(id)a4
{
  id v5;

  if (!self->_mirroringIncluded)
  {
    -[MPAudioVideoRoutingPopoverController dismissPopoverAnimated:](self, "dismissPopoverAnimated:", 1, a4);
    -[MPAudioVideoRoutingPopoverController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "popoverControllerDidDismissPopover:", self);

  }
}

- (void)routingViewControllerDidUpdateContents:(id)a3
{
  id v4;

  -[MPAudioVideoRoutingPopoverController contentViewController](self, "contentViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSize");
  -[MPAudioVideoRoutingPopoverController setPopoverContentSize:animated:](self, "setPopoverContentSize:animated:", 1);

}

- (BOOL)mirroringOnly
{
  return self->_mirroringOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingViewController, 0);
}

void __70__MPAudioVideoRoutingPopoverController_initWithContentViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "dismissPopoverAnimated:", 1);
    objc_msgSend(v3, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "popoverControllerDidDismissPopover:", v3);

    WeakRetained = v3;
  }

}

@end
