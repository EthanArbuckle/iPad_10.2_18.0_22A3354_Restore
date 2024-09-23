@implementation MobileSafariWindow

- (void)setSafariWindowDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_safariWindowDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_safariWindowDelegate, obj);
    self->_safariWindowDelegateRespondsToStatusBarChangedFromHeightToHeight = objc_opt_respondsToSelector() & 1;
    self->_safariWindowDelegateRespondsToDidEndAllTouchesAtPoint = objc_opt_respondsToSelector() & 1;
  }

}

- (MobileSafariWindow)initWithWindowScene:(id)a3
{
  MobileSafariWindow *v3;
  void *v4;
  MobileSafariWindow *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MobileSafariWindow;
  v3 = -[MobileSafariWindow initWithWindowScene:](&v7, sel_initWithWindowScene_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__willBeginSystemSnapshot, *MEMORY[0x1E0DC59A8], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__didCompleteSystemSnapshot, *MEMORY[0x1E0DC5998], 0);
    v5 = v3;

  }
  return v3;
}

- (void)handleStatusBarChangeFromHeight:(double)a3 toHeight:(double)a4
{
  id WeakRetained;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MobileSafariWindow;
  -[MobileSafariWindow handleStatusBarChangeFromHeight:toHeight:](&v8, sel_handleStatusBarChangeFromHeight_toHeight_);
  if (self->_safariWindowDelegateRespondsToStatusBarChangedFromHeightToHeight)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_safariWindowDelegate);
    objc_msgSend(WeakRetained, "safariWindow:statusBarChangedFromHeight:toHeight:", self, a3, a4);

  }
}

- (void)sendEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *WeakRetained;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MobileSafariWindow;
  -[MobileSafariWindow sendEvent:](&v9, sel_sendEvent_, v4);
  if (self->_safariWindowDelegateRespondsToDidEndAllTouchesAtPoint && !objc_msgSend(v4, "type"))
  {
    objc_msgSend(v4, "allTouches");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "allTouches");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(WeakRetained, "count") == 1)
    {
      v8 = objc_msgSend(v6, "phase");

      if (v8 != 3)
      {
LABEL_7:

        goto LABEL_8;
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_safariWindowDelegate);
      objc_msgSend(v6, "locationInView:", self);
      objc_msgSend(WeakRetained, "safariWindow:didEndAllTouchesAtPoint:", self);
    }

    goto LABEL_7;
  }
LABEL_8:

}

- (void)_willBeginSystemSnapshot
{
  self->_shouldBecomeKeyWindowAfterSnapshot = -[MobileSafariWindow isKeyWindow](self, "isKeyWindow");
}

- (void)_didCompleteSystemSnapshot
{
  if (self->_shouldBecomeKeyWindowAfterSnapshot)
    -[MobileSafariWindow makeKeyWindow](self, "makeKeyWindow");
}

- (MobileSafariWindowDelegate)safariWindowDelegate
{
  return (MobileSafariWindowDelegate *)objc_loadWeakRetained((id *)&self->_safariWindowDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_safariWindowDelegate);
}

@end
