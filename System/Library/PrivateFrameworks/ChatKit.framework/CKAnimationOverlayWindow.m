@implementation CKAnimationOverlayWindow

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)showInWindowScene:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CEA478];
  v5 = a3;
  objc_msgSend(v4, "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAnimationOverlayWindow setBackgroundColor:](self, "setBackgroundColor:", v6);

  -[CKAnimationOverlayWindow setWindowLevel:](self, "setWindowLevel:", *MEMORY[0x1E0CEBB18] + 1000.0);
  -[CKAnimationOverlayWindow setWindowScene:](self, "setWindowScene:", v5);

  -[CKAnimationOverlayWindow setHidden:](self, "setHidden:", 0);
  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI"))
  {
    objc_msgSend(MEMORY[0x1E0CEA6C8], "snapshotViewForOptions:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAnimationOverlayWindow setKeyboardSnapshotView:](self, "setKeyboardSnapshotView:", v7);

    -[CKAnimationOverlayWindow keyboardSnapshotView](self, "keyboardSnapshotView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CEA6C8], "setKeyboardAlpha:", 0.0);
      -[CKAnimationOverlayWindow keyboardSnapshotView](self, "keyboardSnapshotView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[CKAnimationOverlayWindow insertSubview:atIndex:](self, "insertSubview:atIndex:", v9, 0);

    }
  }
}

- (void)dismiss
{
  void *v3;

  -[CKAnimationOverlayWindow setHidden:](self, "setHidden:", 1);
  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI"))
  {
    objc_msgSend(MEMORY[0x1E0CEA6C8], "setKeyboardAlpha:", 1.0);
    -[CKAnimationOverlayWindow keyboardSnapshotView](self, "keyboardSnapshotView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    -[CKAnimationOverlayWindow setKeyboardSnapshotView:](self, "setKeyboardSnapshotView:", 0);
  }
}

- (UIView)keyboardSnapshotView
{
  return self->_keyboardSnapshotView;
}

- (void)setKeyboardSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardSnapshotView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardSnapshotView, 0);
}

@end
