@implementation CKComposeRecipientView

- (CKComposeRecipientView)initWithFrame:(CGRect)a3
{
  CKComposeRecipientView *v3;
  CKComposeRecipientView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKComposeRecipientView;
  v3 = -[CNComposeRecipientTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CNComposeRecipientTextView setExpandRecipientsInNamedGroups:](v3, "setExpandRecipientsInNamedGroups:", 0);
  return v4;
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKComposeRecipientView;
  -[CNComposeRecipientTextView layoutSubviews](&v2, sel_layoutSubviews);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKComposeRecipientView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  v10 = round(x * v9) / v9;
  v11 = round(y * v9) / v9;
  v12 = round(width * v9) / v9;
  v13 = round(height * v9) / v9;

  v14.receiver = self;
  v14.super_class = (Class)CKComposeRecipientView;
  -[CNComposeRecipientTextView setFrame:](&v14, sel_setFrame_, v10, v11, v12, v13);
}

- (void)reset
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView setRecipients:](self, "setRecipients:", v3);

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView setAddresses:](self, "setAddresses:", v4);

  -[CNComposeRecipientTextView clearText](self, "clearText");
}

- (void)atomTextViewDidBecomeFirstResponder:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKComposeRecipientView;
  -[CNComposeRecipientTextView atomTextViewDidBecomeFirstResponder:](&v5, sel_atomTextViewDidBecomeFirstResponder_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("com.apple.ChatKit.CKComposeRecipientView.BecameFirstResponder"), self);

}

- (UIEdgeInsets)safeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  UIEdgeInsets result;

  v22.receiver = self;
  v22.super_class = (Class)CKComposeRecipientView;
  -[CKComposeRecipientView safeAreaInsets](&v22, sel_safeAreaInsets);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = v3;
  if (v6 > 0.0 || v3 > 0.0)
  {
    -[CKComposeRecipientView window](self, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && (unint64_t)(objc_msgSend(v12, "interfaceOrientation") - 3) <= 1)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "landscapeKeyboardInsets");
      v15 = v14;
      v17 = v16;

      if (v7 > 0.0)
        v7 = v15;
      if (v10 > 0.0)
        v10 = v17;
    }

  }
  v18 = v5;
  v19 = v7;
  v20 = v9;
  v21 = v10;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (UIEdgeInsets)layoutMargins
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UIEdgeInsets result;

  -[CKComposeRecipientView safeAreaInsets](self, "safeAreaInsets");
  -[CKComposeRecipientView layoutDelegate](self, "layoutDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMarginsForComposeRecipientView:", self);

  UIEdgeInsetsAdd();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CKComposeRecipientView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");
  if (v13 == 0.0)
  {
    if (CKMainScreenScale_once_53 != -1)
      dispatch_once(&CKMainScreenScale_once_53, &__block_literal_global_130);
    v14 = *(double *)&CKMainScreenScale_sMainScreenScale_53;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_53 == 0.0)
      v14 = 1.0;
    v15 = floor(v5 * v14) / v14;
    v16 = *(double *)&CKMainScreenScale_sMainScreenScale_53;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_53 == 0.0)
      v16 = 1.0;
    v17 = floor(v7 * v16) / v16;
    v18 = *(double *)&CKMainScreenScale_sMainScreenScale_53;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_53 == 0.0)
      v18 = 1.0;
    v19 = floor(v9 * v18) / v18;
    v13 = *(double *)&CKMainScreenScale_sMainScreenScale_53;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_53 == 0.0)
      v13 = 1.0;
  }
  else
  {
    v15 = floor(v5 * v13) / v13;
    v17 = floor(v7 * v13) / v13;
    v19 = floor(v9 * v13) / v13;
  }
  v20 = floor(v11 * v13) / v13;

  v21 = v15;
  v22 = v17;
  v23 = v19;
  v24 = v20;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (CKComposeRecipientViewDelegate)layoutDelegate
{
  return (CKComposeRecipientViewDelegate *)objc_loadWeakRetained((id *)&self->layoutDelegate);
}

- (void)setLayoutDelegate:(id)a3
{
  objc_storeWeak((id *)&self->layoutDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->layoutDelegate);
}

@end
