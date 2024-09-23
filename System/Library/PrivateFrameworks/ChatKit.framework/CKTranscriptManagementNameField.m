@implementation CKTranscriptManagementNameField

+ (double)preferredHeight
{
  return 44.0;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptManagementNameField;
  -[CKTranscriptManagementNameField dealloc](&v3, sel_dealloc);
}

- (CKTranscriptManagementNameField)initWithFrame:(CGRect)a3
{
  CKTranscriptManagementNameField *v3;
  CKTranscriptManagementNameField *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)CKTranscriptManagementNameField;
  v3 = -[CKTranscriptManagementNameField initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKTranscriptManagementNameField setEnabled:](v3, "setEnabled:", 1);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithPrivateStyle:", 2010);
    -[CKTranscriptManagementNameField setBackdropView:](v4, "setBackdropView:", v5);
    -[CKTranscriptManagementNameField addSubview:](v4, "addSubview:", v5);
    v6 = objc_alloc(MEMORY[0x1E0CEA700]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nameFieldFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v13);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v14);

    objc_msgSend(MEMORY[0x1E0CEA478], "darkGrayColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v15);

    CKFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("GROUP_NAME_LABEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v17);

    -[CKTranscriptManagementNameField addSubview:](v4, "addSubview:", v11);
    -[CKTranscriptManagementNameField setFieldLabel:](v4, "setFieldLabel:", v11);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAAD0]), "initWithFrame:", v7, v8, v9, v10);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "nameFieldFont");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v20);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v21);

    CKFrameworkBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("GROUP_NAME_PLACEHOLDER"), &stru_1E276D870, CFSTR("ChatKit"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPlaceholder:", v23);

    objc_msgSend(v18, "setReturnKeyType:", 9);
    objc_msgSend(v18, "setClearButtonMode:", 1);
    objc_msgSend(v18, "setDelegate:", v4);
    -[CKTranscriptManagementNameField addSubview:](v4, "addSubview:", v18);
    -[CKTranscriptManagementNameField setTextField:](v4, "setTextField:", v18);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v7, v8, v9, v10);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "theme");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "recipientsDividerColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBackgroundColor:", v27);

    -[CKTranscriptManagementNameField setTopSeparator:](v4, "setTopSeparator:", v24);
    -[CKTranscriptManagementNameField topSeparator](v4, "topSeparator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptManagementNameField addSubview:](v4, "addSubview:", v28);

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v7, v8, v9, v10);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "theme");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "recipientsDividerColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBackgroundColor:", v32);

    -[CKTranscriptManagementNameField setBottomSeparator:](v4, "setBottomSeparator:", v29);
    -[CKTranscriptManagementNameField bottomSeparator](v4, "bottomSeparator");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptManagementNameField addSubview:](v4, "addSubview:", v33);

    -[CKTranscriptManagementNameField setBackgroundColor:](v4, "setBackgroundColor:", 0);
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  CGFloat v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  CGFloat v15;
  double MaxX;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  objc_super v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v40.receiver = self;
  v40.super_class = (Class)CKTranscriptManagementNameField;
  -[CKTranscriptManagementNameField layoutSubviews](&v40, sel_layoutSubviews);
  -[CKTranscriptManagementNameField layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  v7 = MEMORY[0x1E0C9D648];
  v8 = *MEMORY[0x1E0C9D648];
  -[CKTranscriptManagementNameField fieldLabel](self, "fieldLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptManagementNameField bounds](self, "bounds");
  objc_msgSend(v9, "sizeThatFits:", v10, 1.79769313e308);
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceLayoutDirection");

  if (v14)
  {
    v15 = *(double *)(v7 + 8);
    -[CKTranscriptManagementNameField bounds](self, "bounds");
    MaxX = CGRectGetMaxX(v41);
    v42.size.height = 44.0;
    v42.origin.x = v8;
    v42.origin.y = v15;
    v42.size.width = v12;
    v17 = MaxX - CGRectGetWidth(v42) - v6;
  }
  else
  {
    v17 = v4;
  }
  v39 = v8;
  -[CKTranscriptManagementNameField bounds](self, "bounds");
  v19 = v18 + -44.0 + -1.0;
  -[CKTranscriptManagementNameField fieldLabel](self, "fieldLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v17, v19, v12, 44.0);

  if (v14)
  {
    -[CKTranscriptManagementNameField bounds](self, "bounds");
    v22 = v21;
    -[CKTranscriptManagementNameField bounds](self, "bounds");
    v23 = v4;
    v25 = v24 - v6;
    v43.origin.x = v17;
    v43.origin.y = v19;
    v43.size.width = v12;
    v43.size.height = 44.0;
    v26 = v25 - CGRectGetWidth(v43) + v23 * -2.0;
    v27 = v6;
  }
  else
  {
    v44.origin.x = v17;
    v44.origin.y = v19;
    v44.size.width = v12;
    v44.size.height = 44.0;
    v27 = CGRectGetMaxX(v44) + 5.0;
    -[CKTranscriptManagementNameField bounds](self, "bounds");
    v22 = v28;
    -[CKTranscriptManagementNameField bounds](self, "bounds");
    v26 = v29 - v27 - v6;
  }
  -[CKTranscriptManagementNameField textField](self, "textField");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", v27, v22 + -44.0, v26, 44.0);

  -[CKTranscriptManagementNameField bounds](self, "bounds");
  v32 = v31;
  if (CKPixelWidth_once_1 != -1)
    dispatch_once(&CKPixelWidth_once_1, &__block_literal_global_21);
  v33 = *(double *)&CKPixelWidth_sPixel_1;
  -[CKTranscriptManagementNameField bounds](self, "bounds");
  v35 = v34;
  if (CKPixelWidth_once_1 != -1)
    dispatch_once(&CKPixelWidth_once_1, &__block_literal_global_21);
  v36 = v35 - *(double *)&CKPixelWidth_sPixel_1;
  -[CKTranscriptManagementNameField bottomSeparator](self, "bottomSeparator");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", v39, v36, v32, v33);

  -[CKTranscriptManagementNameField topSeparator](self, "topSeparator");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", v39, 0.0, v32, v33);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKTranscriptManagementNameField delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "nameField:didCommitGroupName:", self, v5);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    -[CKTranscriptManagementNameField setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
    -[CKTranscriptManagementNameField textField](self, "textField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", v3);

    LODWORD(v5) = -[CKTranscriptManagementNameField isEnabled](self, "isEnabled");
    -[CKTranscriptManagementNameField fieldLabel](self, "fieldLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v5)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "darkGrayColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTextColor:", v7);

      -[CKTranscriptManagementNameField textField](self, "textField");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTextColor:", v8);

      -[CKTranscriptManagementNameField textField](self, "textField");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

  }
}

- (void)setIsOverlay:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  self->_isOverlay = a3;
  if (a3)
  {
    -[CKTranscriptManagementNameField setBackgroundColor:](self, "setBackgroundColor:", 0);
    -[CKTranscriptManagementNameField backdropView](self, "backdropView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 0);

    -[CKTranscriptManagementNameField bottomSeparator](self, "bottomSeparator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);

    -[CKTranscriptManagementNameField topSeparator](self, "topSeparator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    v7 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptManagementNameField setBackgroundColor:](self, "setBackgroundColor:", v8);

    -[CKTranscriptManagementNameField backdropView](self, "backdropView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    -[CKTranscriptManagementNameField bottomSeparator](self, "bottomSeparator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    -[CKTranscriptManagementNameField topSeparator](self, "topSeparator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    v7 = 0;
  }
  objc_msgSend(v6, "setHidden:", v7);

}

- (NSString)groupName
{
  void *v2;
  void *v3;

  -[CKTranscriptManagementNameField textField](self, "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setGroupName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKTranscriptManagementNameField textField](self, "textField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)commitGroupName
{
  id v2;

  -[CKTranscriptManagementNameField textField](self, "textField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (CKTranscriptManagementNameFieldDelegate)delegate
{
  return (CKTranscriptManagementNameFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isOverlay
{
  return self->_isOverlay;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UILabel)fieldLabel
{
  return self->_fieldLabel;
}

- (void)setFieldLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fieldLabel, a3);
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (UIView)topSeparator
{
  return self->_topSeparator;
}

- (void)setTopSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_topSeparator, a3);
}

- (UIView)bottomSeparator
{
  return self->_bottomSeparator;
}

- (void)setBottomSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_bottomSeparator, a3);
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_fieldLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
