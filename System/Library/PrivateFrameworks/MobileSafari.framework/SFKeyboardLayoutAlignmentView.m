@implementation SFKeyboardLayoutAlignmentView

- (void)setAutomaticKeyboardFrameTrackingDisabled:(BOOL)a3
{
  void *v5;
  id v6;

  if (self->_automaticKeyboardFrameTrackingDisabled != a3)
  {
    -[SFKeyboardLayoutAlignmentView _stopObservingKeyboardNotifications](self, "_stopObservingKeyboardNotifications");
    self->_automaticKeyboardFrameTrackingDisabled = a3;
    if (!a3)
    {
      -[SFKeyboardLayoutAlignmentView window](self, "window");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "screen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFKeyboardLayoutAlignmentView _startObservingKeyboardNotificationsForScreen:](self, "_startObservingKeyboardNotificationsForScreen:", v5);

    }
  }
}

- (CGRect)_frameInBoundsForKeyboardFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect result;
  CGRect v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SFKeyboardLayoutAlignmentView superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFKeyboardLayoutAlignmentView _window](self, "_window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:fromWindow:", 0, x, y, width, height);
  objc_msgSend(v9, "convertRect:toView:", v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v8, "bounds");
  v33.origin.x = v18;
  v33.origin.y = v19;
  v33.size.width = v20;
  v33.size.height = v21;
  v30.origin.x = v11;
  v30.origin.y = v13;
  v30.size.width = v15;
  v30.size.height = v17;
  v31 = CGRectIntersection(v30, v33);
  v22 = v31.origin.x;
  v23 = v31.origin.y;
  v24 = v31.size.width;
  v25 = v31.size.height;
  if (CGRectIsNull(v31))
  {
    v22 = *MEMORY[0x1E0C9D538];
    v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v25 = 0.0;
    v24 = v15;
  }

  v26 = v22;
  v27 = v23;
  v28 = v24;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)_updateConstraintsToMatchKeyboardFrame:(CGRect)a3
{
  double height;
  void *v5;
  NSLayoutConstraint *disambiguatingLeftConstraint;
  void *v7;
  _QWORD v8[3];

  height = a3.size.height;
  v8[2] = *MEMORY[0x1E0C80C00];
  -[NSLayoutConstraint setConstant:](self->widthConstraint, "setConstant:", a3.size.width, a3.origin.y);
  -[NSLayoutConstraint setConstant:](self->heightConstraint, "setConstant:", height);
  v5 = (void *)MEMORY[0x1E0CB3718];
  disambiguatingLeftConstraint = self->disambiguatingLeftConstraint;
  v8[0] = self->heightConstraint;
  v8[1] = disambiguatingLeftConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateConstraints:", v7);

}

- (void)_updateConstraintsForKeyboardNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  float v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  uint64_t v48;
  void (**v49)(_QWORD);
  void *v50;
  float v51;
  _QWORD v52[5];
  void (**v53)(_QWORD);
  _QWORD aBlock[9];
  _QWORD v55[9];
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", *MEMORY[0x1E0DC4E88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend(v5, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueForKey:", *MEMORY[0x1E0DC4E90]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "CGRectValue");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    objc_msgSend(v5, "userInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "valueForKey:", *MEMORY[0x1E0DC4E48]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatValue");
    v51 = v28;

    objc_msgSend(v5, "userInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "valueForKey:", *MEMORY[0x1E0DC4E40]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "integerValue");

    -[SFKeyboardLayoutAlignmentView _frameInBoundsForKeyboardFrame:](self, "_frameInBoundsForKeyboardFrame:", v9, v11, v13, v15);
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    -[SFKeyboardLayoutAlignmentView _frameInBoundsForKeyboardFrame:](self, "_frameInBoundsForKeyboardFrame:", v19, v21, v23, v25);
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v57.origin.x = v40;
    v57.origin.y = v42;
    v57.size.width = v44;
    v57.size.height = v46;
    if (!CGRectEqualToRect(self->lastKnownKeyboardRect, v57))
    {
      v48 = MEMORY[0x1E0C809B0];
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __75__SFKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke;
      v55[3] = &unk_1E21E2AC0;
      v55[4] = self;
      *(CGFloat *)&v55[5] = v33;
      *(CGFloat *)&v55[6] = v35;
      *(CGFloat *)&v55[7] = v37;
      *(CGFloat *)&v55[8] = v39;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v55);
      aBlock[0] = v48;
      aBlock[1] = 3221225472;
      aBlock[2] = __75__SFKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke_2;
      aBlock[3] = &unk_1E21E2AC0;
      aBlock[4] = self;
      *(CGFloat *)&aBlock[5] = v41;
      *(CGFloat *)&aBlock[6] = v43;
      *(CGFloat *)&aBlock[7] = v45;
      *(CGFloat *)&aBlock[8] = v47;
      v49 = (void (**)(_QWORD))_Block_copy(aBlock);
      v56.origin.x = v33;
      v56.origin.y = v35;
      v56.size.width = v37;
      v56.size.height = v39;
      v58.origin.x = v41;
      v58.origin.y = v43;
      v58.size.width = v45;
      v58.size.height = v47;
      if (CGRectEqualToRect(v56, v58))
      {
        v49[2](v49);
      }
      else
      {
        v50 = (void *)MEMORY[0x1E0DC3F10];
        v52[0] = v48;
        v52[1] = 3221225472;
        v52[2] = __75__SFKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke_3;
        v52[3] = &unk_1E21E2E28;
        v52[4] = self;
        v53 = v49;
        objc_msgSend(v50, "animateWithDuration:delay:options:animations:completion:", v31, v52, 0, v51, 0.0);

      }
    }
  }

}

uint64_t __75__SFKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateConstraintsToMatchKeyboardFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __75__SFKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateConstraintsToMatchKeyboardFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __75__SFKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke_3(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "superview");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SFKeyboardLayoutAlignmentView _stopObservingKeyboardNotifications](self, "_stopObservingKeyboardNotifications");
  objc_msgSend(v4, "screen");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SFKeyboardLayoutAlignmentView _startObservingKeyboardNotificationsForScreen:](self, "_startObservingKeyboardNotificationsForScreen:", v5);
}

- (void)didMoveToWindow
{
  NSLayoutConstraint *v3;
  NSLayoutConstraint *bottomConstraint;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *widthConstraint;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *heightConstraint;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *disambiguatingLeftConstraint;
  void *v11;
  id v12;

  -[SFKeyboardLayoutAlignmentView superview](self, "superview");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[SFKeyboardLayoutAlignmentView _removeConstraints](self, "_removeConstraints");
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 4, 0, v12, 4, 1.0, 0.0);
  v3 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  bottomConstraint = self->bottomConstraint;
  self->bottomConstraint = v3;

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 7, 0, 0, 7, 1.0, 0.0);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  widthConstraint = self->widthConstraint;
  self->widthConstraint = v5;

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 0, 0, 8, 1.0, 0.0);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->heightConstraint;
  self->heightConstraint = v7;

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 1, 0, v12, 1, 1.0, 0.0);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  disambiguatingLeftConstraint = self->disambiguatingLeftConstraint;
  self->disambiguatingLeftConstraint = v9;

  -[SFKeyboardLayoutAlignmentView _addConstraints](self, "_addConstraints");
  -[SFKeyboardLayoutAlignmentView window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[SFKeyboardLayoutAlignmentView _matchInitialKeyboardFrame](self, "_matchInitialKeyboardFrame");

}

- (void)_matchInitialKeyboardFrame
{
  objc_msgSend(MEMORY[0x1E0DC3AD8], "visiblePeripheralFrame");
  -[SFKeyboardLayoutAlignmentView _frameInBoundsForKeyboardFrame:](self, "_frameInBoundsForKeyboardFrame:");
  -[SFKeyboardLayoutAlignmentView _updateConstraintsToMatchKeyboardFrame:](self, "_updateConstraintsToMatchKeyboardFrame:");
}

- (void)_addConstraints
{
  NSLayoutConstraint *widthConstraint;
  void *v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  widthConstraint = self->widthConstraint;
  v3 = (void *)MEMORY[0x1E0CB3718];
  v5[0] = self->bottomConstraint;
  v5[1] = widthConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateConstraints:", v4);

}

- (void)_removeConstraints
{
  NSLayoutConstraint *bottomConstraint;
  NSLayoutConstraint *widthConstraint;
  NSLayoutConstraint *heightConstraint;
  NSLayoutConstraint *disambiguatingLeftConstraint;

  -[NSLayoutConstraint setActive:](self->bottomConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->widthConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->heightConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->disambiguatingLeftConstraint, "setActive:", 0);
  bottomConstraint = self->bottomConstraint;
  self->bottomConstraint = 0;

  widthConstraint = self->widthConstraint;
  self->widthConstraint = 0;

  heightConstraint = self->heightConstraint;
  self->heightConstraint = 0;

  disambiguatingLeftConstraint = self->disambiguatingLeftConstraint;
  self->disambiguatingLeftConstraint = 0;

}

- (SFKeyboardLayoutAlignmentView)initWithFrame:(CGRect)a3
{
  SFKeyboardLayoutAlignmentView *v3;
  SFKeyboardLayoutAlignmentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFKeyboardLayoutAlignmentView;
  v3 = -[SFKeyboardLayoutAlignmentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFKeyboardLayoutAlignmentView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFKeyboardLayoutAlignmentView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SFKeyboardLayoutAlignmentView _stopObservingKeyboardNotifications](self, "_stopObservingKeyboardNotifications");
  v3.receiver = self;
  v3.super_class = (Class)SFKeyboardLayoutAlignmentView;
  -[SFKeyboardLayoutAlignmentView dealloc](&v3, sel_dealloc);
}

- (void)_stopObservingKeyboardNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FA8], 0);

}

- (void)_startObservingKeyboardNotificationsForScreen:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB37D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__keyboardChanged_, *MEMORY[0x1E0DC4FA8], v5);

  }
}

- (BOOL)automaticKeyboardFrameTrackingDisabled
{
  return self->_automaticKeyboardFrameTrackingDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->disambiguatingLeftConstraint, 0);
  objc_storeStrong((id *)&self->heightConstraint, 0);
  objc_storeStrong((id *)&self->widthConstraint, 0);
  objc_storeStrong((id *)&self->bottomConstraint, 0);
  objc_storeStrong((id *)&self->_keyboardChangeNotificationForUpdateConstraints, 0);
}

@end
