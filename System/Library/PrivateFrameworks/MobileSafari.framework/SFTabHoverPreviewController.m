@implementation SFTabHoverPreviewController

- (void)setHoverRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_hoverRecognizer, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SFTabHoverPreviewController)init
{
  SFTabHoverPreviewController *v2;
  SFTabHoverPreviewController *v3;
  uint64_t v4;
  BSAbsoluteMachTimer *tabHoverPreviewShowTimer;
  uint64_t v6;
  BSAbsoluteMachTimer *disableHoverTimer;
  SFTabHoverPreviewController *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFTabHoverPreviewController;
  v2 = -[SFTabHoverPreviewController init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("com.apple.mobilesafari.tabHoverPreviewShowTimer"));
    tabHoverPreviewShowTimer = v3->_tabHoverPreviewShowTimer;
    v3->_tabHoverPreviewShowTimer = (BSAbsoluteMachTimer *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("com.apple.mobilesafari.disableHoverTimer"));
    disableHoverTimer = v3->_disableHoverTimer;
    v3->_disableHoverTimer = (BSAbsoluteMachTimer *)v6;

    v8 = v3;
  }

  return v3;
}

- (void)setNeedsSnapshotUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabHoverPreviewControllerNeedsSnapshotUpdate:", self);

}

- (void)dealloc
{
  objc_super v3;

  -[BSAbsoluteMachTimer invalidate](self->_tabHoverPreviewShowTimer, "invalidate");
  -[BSAbsoluteMachTimer invalidate](self->_disableHoverTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SFTabHoverPreviewController;
  -[SFTabHoverPreviewController dealloc](&v3, sel_dealloc);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  if (!a3)
    -[SFTabHoverPreviewController cancel](self, "cancel");
}

- (void)updateWithItem:(id)a3 atLocation:(CGPoint)a4
{
  double y;
  double x;
  SFTabHoverPreviewItem *v8;
  SFTabHoverPreviewItem *v9;
  double Current;
  BSAbsoluteMachTimer *tabHoverPreviewShowTimer;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  SFTabHoverPreviewItem *v15;
  id v16;
  id location;

  y = a4.y;
  x = a4.x;
  v8 = (SFTabHoverPreviewItem *)a3;
  v9 = v8;
  if (self->_enabled)
  {
    if (v8)
    {
      if (self->_itemShowingPreview != v8
        && (self->_itemPendingPreview != v8
         || sqrt((x - self->_pendingHoverLocation.x) * (x - self->_pendingHoverLocation.x)+ (y - self->_pendingHoverLocation.y) * (y - self->_pendingHoverLocation.y)) >= 10.0))
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (self->_itemShowingPreview || (Current = Current - self->_lastTimeHoverPreviewWasDismissed, Current < 0.5))
        {
          -[SFTabHoverPreviewController _showHoverPreviewForItem:](self, "_showHoverPreviewForItem:", v9, Current);
        }
        else
        {
          objc_storeStrong((id *)&self->_itemPendingPreview, a3);
          self->_pendingHoverLocation.x = x;
          self->_pendingHoverLocation.y = y;
          -[BSAbsoluteMachTimer cancel](self->_tabHoverPreviewShowTimer, "cancel");
          objc_initWeak(&location, self);
          tabHoverPreviewShowTimer = self->_tabHoverPreviewShowTimer;
          v12 = MEMORY[0x1E0C80D38];
          v13 = MEMORY[0x1E0C80D38];
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __57__SFTabHoverPreviewController_updateWithItem_atLocation___block_invoke;
          v14[3] = &unk_1E21E5B80;
          objc_copyWeak(&v16, &location);
          v15 = v9;
          -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](tabHoverPreviewShowTimer, "scheduleWithFireInterval:leewayInterval:queue:handler:", v12, v14, 0.6, 0.06);

          objc_destroyWeak(&v16);
          objc_destroyWeak(&location);
        }
      }
    }
    else
    {
      -[SFTabHoverPreviewController _cancelOrCloseHoverPreviewWithGracePeriod:](self, "_cancelOrCloseHoverPreviewWithGracePeriod:", 1);
    }
  }

}

void __57__SFTabHoverPreviewController_updateWithItem_atLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_showHoverPreviewForItem:", *(_QWORD *)(a1 + 32));

}

- (void)dismiss
{
  -[SFTabHoverPreviewController _cancelOrCloseHoverPreviewWithGracePeriod:](self, "_cancelOrCloseHoverPreviewWithGracePeriod:", 0);
  -[SFTabHoverPreviewController _temporarilyDisableHover](self, "_temporarilyDisableHover");
}

- (void)cancel
{
  -[SFTabHoverPreviewController _cancelOrCloseHoverPreviewWithGracePeriod:](self, "_cancelOrCloseHoverPreviewWithGracePeriod:", 0);
}

- (void)_showHoverPreviewForItem:(id)a3
{
  SFTabHoverPreviewItem *v4;
  SFTabHoverPreviewItem *itemPendingPreview;
  SFTabHoverPreviewItem *itemShowingPreview;
  SFTabHoverPreviewItem *v7;
  id WeakRetained;

  v4 = (SFTabHoverPreviewItem *)a3;
  -[BSAbsoluteMachTimer cancel](self->_tabHoverPreviewShowTimer, "cancel");
  itemPendingPreview = self->_itemPendingPreview;
  self->_itemPendingPreview = 0;

  itemShowingPreview = self->_itemShowingPreview;
  self->_itemShowingPreview = v4;
  v7 = v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabHoverPreviewController:showPreviewForItem:", self, v7);

}

- (void)_cancelOrCloseHoverPreviewWithGracePeriod:(BOOL)a3
{
  _BOOL4 v3;
  CFAbsoluteTime Current;
  SFTabHoverPreviewItem *itemPendingPreview;
  SFTabHoverPreviewItem *itemShowingPreview;
  id WeakRetained;

  v3 = a3;
  -[BSAbsoluteMachTimer cancel](self->_tabHoverPreviewShowTimer, "cancel");
  Current = 0.0;
  if (v3 && self->_itemShowingPreview)
    Current = CFAbsoluteTimeGetCurrent();
  self->_lastTimeHoverPreviewWasDismissed = Current;
  itemPendingPreview = self->_itemPendingPreview;
  self->_itemPendingPreview = 0;

  itemShowingPreview = self->_itemShowingPreview;
  self->_itemShowingPreview = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabHoverPreviewControllerDismissPreview:", self);

}

- (void)_temporarilyDisableHover
{
  BSAbsoluteMachTimer *disableHoverTimer;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (-[BSAbsoluteMachTimer isScheduled](self->_disableHoverTimer, "isScheduled"))
    -[BSAbsoluteMachTimer cancel](self->_disableHoverTimer, "cancel");
  -[UIHoverGestureRecognizer setEnabled:](self->_hoverRecognizer, "setEnabled:", 0);
  objc_initWeak(&location, self);
  disableHoverTimer = self->_disableHoverTimer;
  v4 = MEMORY[0x1E0C80D38];
  v5 = MEMORY[0x1E0C80D38];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SFTabHoverPreviewController__temporarilyDisableHover__block_invoke;
  v6[3] = &unk_1E21E5BA8;
  objc_copyWeak(&v7, &location);
  -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](disableHoverTimer, "scheduleWithFireInterval:leewayInterval:queue:handler:", v4, v6, 0.5, 0.05);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __55__SFTabHoverPreviewController__temporarilyDisableHover__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[10], "setEnabled:", 1);
    WeakRetained = v2;
  }

}

- (SFTabHoverPreviewControllerDelegate)delegate
{
  return (SFTabHoverPreviewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIHoverGestureRecognizer)hoverRecognizer
{
  return self->_hoverRecognizer;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_disableHoverTimer, 0);
  objc_storeStrong((id *)&self->_tabHoverPreviewShowTimer, 0);
  objc_storeStrong((id *)&self->_itemPendingPreview, 0);
  objc_storeStrong((id *)&self->_itemShowingPreview, 0);
}

@end
