@implementation CKPhoneTranscriptMessageCell

- (void)dealloc
{
  objc_super v3;

  -[CNAvatarView setDelegate:](self->_avatarView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CKPhoneTranscriptMessageCell;
  -[CKPhoneTranscriptMessageCell dealloc](&v3, sel_dealloc);
}

- (id)contactImageView
{
  void *v3;
  int v4;

  +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPrinting");

  if (v4)
    -[CKPhoneTranscriptMessageCell printableAvatarView](self, "printableAvatarView");
  else
    -[CKPhoneTranscriptMessageCell avatarView](self, "avatarView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)layoutSubviewsForContents
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKPhoneTranscriptMessageCell;
  -[CKTranscriptMessageCell layoutSubviewsForContents](&v9, sel_layoutSubviewsForContents);
  -[CKPhoneTranscriptMessageCell contactImageView](self, "contactImageView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[CKPhoneTranscriptMessageCell contactImageView](self, "contactImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[CKEditableCollectionViewCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKPhoneTranscriptMessageCell contactImageView](self, "contactImageView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v8);

    }
  }
}

- (void)setShowAvatarView:(BOOL)a3 withContact:(id)a4 preferredHandle:(id)a5 avatarViewDelegate:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  int v13;
  CKAvatarView *v14;
  void *v15;
  double v16;
  double v17;
  CKAvatarView *v18;
  uint64_t v19;
  CKAvatarView *v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;

  v8 = a3;
  v30 = a4;
  v10 = a5;
  v11 = a6;
  +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isPrinting");

  if (v13)
  {
    -[CKPhoneTranscriptMessageCell printableAvatarView](self, "printableAvatarView");
    v14 = (CKAvatarView *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transcriptContactImageDiameter");
    v17 = v16;

    if (v8)
    {
      if (!v14)
      {
        v14 = (CKAvatarView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
        -[CKAvatarView setFrame:](v14, "setFrame:", 0.0, 0.0, v17, v17);
        -[CKPhoneTranscriptMessageCell setPrintableAvatarView:](self, "setPrintableAvatarView:", v14);
      }
      v18 = v14;
      v19 = 0;
    }
    else
    {
      v18 = v14;
      v19 = 1;
    }
    -[CKAvatarView setHidden:](v18, "setHidden:", v19);
    +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "avatarImageForContact:diameter:", v30, v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKAvatarView setImage:](v14, "setImage:", v26);
  }
  else
  {
    -[CKPhoneTranscriptMessageCell avatarView](self, "avatarView");
    v20 = (CKAvatarView *)objc_claimAutoreleasedReturnValue();
    v14 = v20;
    if (v8)
    {
      if (!v20)
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "transcriptContactImageDiameter");
        v23 = v22;

        v14 = -[CKAvatarView initWithFrame:]([CKAvatarView alloc], "initWithFrame:", 0.0, 0.0, v23, v23);
        -[CNAvatarView setShowsContactOnTap:](v14, "setShowsContactOnTap:", 0);
        -[CKAvatarView setPreferredHandle:](v14, "setPreferredHandle:", v10);
        -[CNAvatarView setForcePressView:](v14, "setForcePressView:", v14);
        -[CKPhoneTranscriptMessageCell setAvatarView:](self, "setAvatarView:", v14);
        -[CKPhoneTranscriptMessageCell setNeedsLayout](self, "setNeedsLayout");
      }
      v20 = v14;
      v24 = 0;
    }
    else
    {
      v24 = 1;
    }
    -[CKAvatarView setHidden:](v20, "setHidden:", v24);
    -[CNAvatarView contact](v14, "contact");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      if (!v26
        || (objc_msgSend(v30, "identifier"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v26, "identifier"),
            v28 = (void *)objc_claimAutoreleasedReturnValue(),
            v29 = objc_msgSend(v27, "isEqualToString:", v28),
            v28,
            v27,
            (v29 & 1) == 0))
      {
        -[CNAvatarView setContact:](v14, "setContact:", v30);
      }
    }
    -[CNAvatarView setDelegate:](v14, "setDelegate:", v11);
  }

}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (UIImageView)printableAvatarView
{
  return self->_printableAvatarView;
}

- (void)setPrintableAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_printableAvatarView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printableAvatarView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
