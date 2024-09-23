@implementation CKDetonatedAttachmentView

+ (id)attachmentIcon
{
  if (attachmentIcon_onceToken != -1)
    dispatch_once(&attachmentIcon_onceToken, &__block_literal_global_81);
  return (id)attachmentIcon_sIcon;
}

void __43__CKDetonatedAttachmentView_attachmentIcon__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D3A820], "genericDocumentIcon");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A860]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareImageForDescriptor:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "CGImage");

  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)attachmentIcon_sIcon;
  attachmentIcon_sIcon = v3;

}

- (CKDetonatedAttachmentView)initWithFrame:(CGRect)a3
{
  CKDetonatedAttachmentView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIImageView *iconImageView;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  UILabel *titleLabel;
  UILabel *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  void *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CKDetonatedAttachmentView;
  v3 = -[CKDetonatedAttachmentView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = (UIImageView *)v9;

    objc_msgSend((id)objc_opt_class(), "attachmentIcon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v3->_iconImageView, "setImage:", v11);

    -[UIImageView image](v3->_iconImageView, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      IMLogHandleForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CKDetonatedAttachmentView initWithFrame:].cold.1(v13);

    }
    -[UIImageView layer](v3->_iconImageView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBorderColor:", 0);
    objc_msgSend(v14, "setBorderWidth:", 0.0);
    objc_msgSend(v14, "setCornerRadius:", 0.0);
    -[CKDetonatedAttachmentView addSubview:](v3, "addSubview:", v3->_iconImageView);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v5, v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v15;

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setOpaque:](v3->_titleLabel, "setOpaque:", 0);
    v17 = v3->_titleLabel;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "attachmentTextFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v19);

    v20 = v3->_titleLabel;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "theme");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "attachmentBalloonTitleTextColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v20, "setTextColor:", v23);

    v24 = v3->_titleLabel;
    IMSharedUtilitiesFrameworkBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("LOCKDOWN_ATTACHMENT_BALLOON_ONE_ATTACHMENT"), &stru_1E276D870, CFSTR("IMSharedUtilities-Offramp"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v24, "setText:", v26);

    -[CKDetonatedAttachmentView addSubview:](v3, "addSubview:", v3->_titleLabel);
    -[CKDetonatedAttachmentView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[CKDetonatedAttachmentView setOpaque:](v3, "setOpaque:", 0);

  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detonatedItemBalloonViewSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  objc_super v35;
  CGRect v36;

  v35.receiver = self;
  v35.super_class = (Class)CKDetonatedAttachmentView;
  -[CKDetonatedAttachmentView layoutSubviews](&v35, sel_layoutSubviews);
  -[CKDetonatedAttachmentView bounds](self, "bounds");
  v4 = v3;
  v34 = v5;
  v7 = v6;
  v9 = v8;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v6, v8);
  v11 = v10;
  v13 = v12;
  if (CKMainScreenScale_once_35 != -1)
    dispatch_once(&CKMainScreenScale_once_35, &__block_literal_global_50_0);
  v14 = *(double *)&CKMainScreenScale_sMainScreenScale_35;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "detonatedItemDocumentIconSize");
  v17 = v16;
  v19 = v18;

  if (CKMainScreenScale_once_35 != -1)
    dispatch_once(&CKMainScreenScale_once_35, &__block_literal_global_50_0);
  if (v14 == 0.0)
    v20 = 1.0;
  else
    v20 = v14;
  v32 = v13 * v20 * (1.0 / v20);
  v21 = v11 * v20;
  v22 = v11 * v20 * (1.0 / v20);
  v23 = 1.0 / v20 * (v4 * v20 + floor((v7 * v20 - v21) * 0.5));
  v24 = *(double *)&CKMainScreenScale_sMainScreenScale_35;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_35 == 0.0)
    v24 = 1.0;
  v25 = v17 * v24;
  v26 = 1.0 / v24 * (v4 * v24 + floor((v7 * v24 - v17 * v24) * 0.5));
  v27 = 1.0 / v24 * (v34 * v24 + floor((v9 * v24 - v19 * v24) * 0.5));
  v28 = v25 * (1.0 / v24);
  v29 = v19 * v24 * (1.0 / v24);
  -[UILabel frame](self->_titleLabel, "frame", *(_QWORD *)&v32);
  v31 = v27 - v30 * 0.5;
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:", v26, v31, v28, v29);
  v36.origin.x = v26;
  v36.origin.y = v31;
  v36.size.width = v28;
  v36.size.height = v29;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v23, CGRectGetMaxY(v36), v22, v33);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

- (void)initWithFrame:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "genericDocumentIcon is Nil", v1, 2u);
}

@end
