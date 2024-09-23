@implementation MFMailComposeToField

- (void)dealloc
{
  objc_super v3;

  -[MFMailComposeToField setToFieldDelegate:](self, "setToFieldDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeToField;
  -[MFMailComposeRecipientTextView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  void *v4;
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  void *v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  v10.receiver = self;
  v10.super_class = (Class)MFMailComposeToField;
  -[CNComposeRecipientTextView layoutSubviews](&v10, sel_layoutSubviews);
  if (self->_smimeButton)
  {
    v3 = -[CNComposeRecipientTextView _useRightToLeftLayout](self, "_useRightToLeftLayout");
    -[CNComposeRecipientTextView addButton](self, "addButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "center");
    v6 = v5;
    if (v3)
      *(double *)&v7 = 40.0;
    else
      *(double *)&v7 = -40.0;
    v8 = *(double *)&v7;

    -[CNComposeRecipientTextView addButton](self, "addButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "center");
    -[MFComposeSMIMELockButton setCenter:](self->_smimeButton, "setCenter:", v6 + v8);

    -[MFComposeSMIMELockButton frame](self->_smimeButton, "frame");
    v12 = CGRectIntegral(v11);
    -[MFComposeSMIMELockButton setFrame:](self->_smimeButton, "setFrame:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  }
}

- (MFComposeSMIMELockButton)SMIMEButton
{
  MFComposeSMIMELockButton *smimeButton;
  MFComposeSMIMELockButton *v4;
  void *v5;
  MFComposeSMIMELockButton *v6;
  MFComposeSMIMELockButton *v7;

  smimeButton = self->_smimeButton;
  if (!smimeButton)
  {
    v4 = [MFComposeSMIMELockButton alloc];
    -[CNComposeRecipientTextView addButton](self, "addButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v6 = -[MFComposeSMIMELockButton initWithFrame:](v4, "initWithFrame:");
    v7 = self->_smimeButton;
    self->_smimeButton = v6;

    -[MFComposeSMIMELockButton setAlpha:](self->_smimeButton, "setAlpha:", 0.0);
    -[MFComposeSMIMELockButton setEnabled:](self->_smimeButton, "setEnabled:", -[MFMailComposeToField smimeButtonEnabled](self, "smimeButtonEnabled"));
    -[MFComposeSMIMELockButton setWantsEncryption:canEncrypt:animated:](self->_smimeButton, "setWantsEncryption:canEncrypt:animated:", self->_wantsEncryption, self->_canEncrypt, 0);
    -[MFMailComposeToField addSubview:](self, "addSubview:", self->_smimeButton);
    -[MFComposeSMIMELockButton addTarget:action:forControlEvents:](self->_smimeButton, "addTarget:action:forControlEvents:", self, sel__tappedSMIMEButton_, 64);
    smimeButton = self->_smimeButton;
  }
  return smimeButton;
}

- (void)_tappedSMIMEButton:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_toFieldDelegate);
  objc_msgSend(WeakRetained, "tappedSMIMEButton");

}

- (void)setExpanded:(BOOL)a3
{
  id WeakRetained;
  _BOOL4 v4;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFMailComposeToField;
  -[CNComposeRecipientTextView setExpanded:](&v7, sel_setExpanded_);
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_toFieldDelegate);
    v6 = objc_msgSend(WeakRetained, "shouldShowSMIMEButton");
  }
  else
  {
    v6 = 0;
  }
  -[MFMailComposeToField _setSMIMEButtonVisible:animated:](self, "_setSMIMEButtonVisible:animated:", v6, -[MFMailComposeToField smimeButtonVisible](self, "smimeButtonVisible") ^ v4);
  if (v4)

}

- (void)setWantsEncryption:(BOOL)a3 canEncrypt:(BOOL)a4 animated:(BOOL)a5
{
  self->_wantsEncryption = a3;
  self->_canEncrypt = a4;
  -[MFComposeSMIMELockButton setWantsEncryption:canEncrypt:animated:](self->_smimeButton, "setWantsEncryption:canEncrypt:animated:");
}

- (void)setSmimeButtonEnabled:(BOOL)a3
{
  self->_smimeButtonEnabled = a3;
  -[MFComposeSMIMELockButton setEnabled:animated:](self->_smimeButton, "setEnabled:animated:");
}

- (void)_setSMIMEButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  double v13;
  __int128 v14;
  void *v15;
  void *v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  _QWORD aBlock[5];
  BOOL v20;

  v4 = a4;
  v5 = a3;
  if (-[MFMailComposeToField smimeButtonVisible](self, "smimeButtonVisible") != a3)
  {
    -[MFMailComposeToField setSmimeButtonVisible:](self, "setSmimeButtonVisible:", v5);
    if (v5 || self->_smimeButton)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__MFMailComposeToField__setSMIMEButtonVisible_animated___block_invoke;
      aBlock[3] = &unk_1E5A65D00;
      aBlock[4] = self;
      v20 = v5;
      v7 = _Block_copy(aBlock);
      v8 = v7;
      if (v4)
      {
        -[MFMailComposeToField SMIMEButton](self, "SMIMEButton");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = 1.0;
        if (v5)
          v11 = 0.0;
        objc_msgSend(v9, "setAlpha:", v11);

        v12 = -[CNComposeRecipientTextView _useRightToLeftLayout](self, "_useRightToLeftLayout");
        if (v5)
        {
          v13 = 2.0;
          if (v12)
            v13 = -2.0;
          CGAffineTransformMakeTranslation(&v18, v13, 0.0);
        }
        else
        {
          v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          *(_OWORD *)&v18.a = *MEMORY[0x1E0C9BAA8];
          *(_OWORD *)&v18.c = v14;
          *(_OWORD *)&v18.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        }
        -[MFMailComposeToField SMIMEButton](self, "SMIMEButton");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v18;
        objc_msgSend(v15, "setTransform:", &v17);

        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v8, 0.25);
      }
      else
      {
        (*((void (**)(void *))v7 + 2))(v7);
      }
      -[MFMailComposeToField SMIMEButton](self, "SMIMEButton");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailComposeToField bringSubviewToFront:](self, "bringSubviewToFront:", v16);

      -[CNComposeRecipientTextView _invalidateTextContainerExclusionPaths](self, "_invalidateTextContainerExclusionPaths");
    }
  }
}

void __56__MFMailComposeToField__setSMIMEButtonVisible_animated___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  __int128 v5;
  _OWORD v6[3];

  if (*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "SMIMEButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  objc_msgSend(*(id *)(a1 + 32), "SMIMEButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v5;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v4, "setTransform:", v6);

}

- (id)_textContainerExclusionPathsWithAddButton:(BOOL)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  MFComposeSMIMELockButton *smimeButton;
  double MaxX;
  double MinX;
  double v10;
  double MaxY;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  objc_super v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v23.receiver = self;
  v23.super_class = (Class)MFMailComposeToField;
  -[CNComposeRecipientTextView _textContainerExclusionPathsWithAddButton:](&v23, sel__textContainerExclusionPathsWithAddButton_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MFMailComposeToField smimeButtonVisible](self, "smimeButtonVisible"))
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    v6 = -[CNComposeRecipientTextView _useRightToLeftLayout](self, "_useRightToLeftLayout");
    smimeButton = self->_smimeButton;
    if (v6)
    {
      -[MFComposeSMIMELockButton frame](smimeButton, "frame");
      MaxX = CGRectGetMaxX(v24);
      MinX = 0.0;
    }
    else
    {
      -[MFComposeSMIMELockButton frame](smimeButton, "frame");
      MinX = CGRectGetMinX(v25);
      -[MFMailComposeToField frame](self, "frame");
      MaxX = v10 - MinX;
    }
    -[MFComposeSMIMELockButton frame](self->_smimeButton, "frame");
    MaxY = CGRectGetMaxY(v26);
    -[CNComposeRecipientTextView textView](self, "textView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeToField convertRect:toView:](self, "convertRect:toView:", v12, MinX, 0.0, MaxX, MaxY);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v14, v16, v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v21);

  }
  else
  {
    v5 = v4;
  }
  return v5;
}

- (MFMailComposeToFieldDelegate)toFieldDelegate
{
  return (MFMailComposeToFieldDelegate *)objc_loadWeakRetained((id *)&self->_toFieldDelegate);
}

- (void)setToFieldDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_toFieldDelegate, a3);
}

- (BOOL)smimeButtonVisible
{
  return self->_smimeButtonVisible;
}

- (void)setSmimeButtonVisible:(BOOL)a3
{
  self->_smimeButtonVisible = a3;
}

- (BOOL)smimeButtonEnabled
{
  return self->_smimeButtonEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_toFieldDelegate);
  objc_storeStrong((id *)&self->_smimeButton, 0);
}

@end
