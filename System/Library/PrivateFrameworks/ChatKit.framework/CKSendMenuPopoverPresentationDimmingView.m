@implementation CKSendMenuPopoverPresentationDimmingView

- (CKSendMenuPopoverPresentationDimmingView)init
{
  CKSendMenuPopoverPresentationDimmingView *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKSendMenuPopoverPresentationDimmingView;
  v2 = -[CKSendMenuPopoverPresentationDimmingView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSendMenuPopoverPresentationDimmingView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[CKSendMenuPopoverPresentationDimmingView setOpaque:](v2, "setOpaque:", 0);
    -[CKSendMenuPopoverPresentationDimmingView layer](v2, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHitTestsAsOpaque:", 1);

    -[CKSendMenuPopoverPresentationDimmingView setUserInteractionEnabled:](v2, "setUserInteractionEnabled:", 1);
    v2->_active = 0;
  }
  return v2;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  void *v4;
  void *v5;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *dismissGestureRecognizer;
  id v9;

  if (self->_active != a3)
  {
    self->_active = a3;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4;
    if (self->_active)
      objc_msgSend(v4, "sendMenuPopoverDimmingViewActiveBackgroundColor");
    else
      objc_msgSend(v4, "sendMenuPopoverDimmingViewInactiveBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSendMenuPopoverPresentationDimmingView setBackgroundColor:](self, "setBackgroundColor:", v5);

    if (!self->_active
      || !self->_dismissGestureRecognizer
      && (v6 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleTap_), v7 = self->_dismissGestureRecognizer, self->_dismissGestureRecognizer = v6, v7, -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_dismissGestureRecognizer, "setNumberOfTapsRequired:", 1), -[CKSendMenuPopoverPresentationDimmingView addGestureRecognizer:](self, "addGestureRecognizer:", self->_dismissGestureRecognizer), !self->_active))
    {
      if (self->_dismissGestureRecognizer)
      {
        -[CKSendMenuPopoverPresentationDimmingView removeGestureRecognizer:](self, "removeGestureRecognizer:");
        dismissGestureRecognizer = self->_dismissGestureRecognizer;
        self->_dismissGestureRecognizer = 0;

      }
    }

  }
}

- (void)_handleTap:(id)a3
{
  id WeakRetained;

  if (self->_dismissGestureRecognizer == a3 && objc_msgSend(a3, "state") == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sendMenuPopoverPresentationDimmingViewDidReceiveTap:", self);

  }
}

- (CKSendMenuPopoverPresentationDimmingViewDelegate)delegate
{
  return (CKSendMenuPopoverPresentationDimmingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITapGestureRecognizer)dismissGestureRecognizer
{
  return self->_dismissGestureRecognizer;
}

- (void)setDismissGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
