@implementation CKAvatarTitleCollectionReusableView

+ (id)reuseIdentifier
{
  return CFSTR("CKAvatarTitleCollectionReusableView_reuseIdentifier");
}

+ (id)supplementaryViewKind
{
  return CFSTR("CKAvatarTitleCollectionReusableView_supplementaryViewKind");
}

- (CKAvatarTitleCollectionReusableView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double x;
  CKAvatarTitleCollectionReusableView *v6;
  CKLabel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)CKAvatarTitleCollectionReusableView;
  v6 = -[CKAvatarTitleCollectionReusableView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  -[CKAvatarTitleCollectionReusableView setFrame:](v6, "setFrame:", x, 54.0, width, height);
  if (v6)
  {
    -[CKAvatarTitleCollectionReusableView setClipsToBounds:](v6, "setClipsToBounds:", 0);
    v7 = -[CKLabel initWithFrame:]([CKLabel alloc], "initWithFrame:", 0.0, 0.0, width, height);
    -[CKAvatarTitleCollectionReusableView setTitleLabel:](v6, "setTitleLabel:", v7);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "avatarStackTitleFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarTitleCollectionReusableView titleLabel](v6, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v9);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "theme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "primaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarTitleCollectionReusableView titleLabel](v6, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v13);

    -[CKAvatarTitleCollectionReusableView titleLabel](v6, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextAlignment:", 1);

    -[CKAvatarTitleCollectionReusableView setClipsToBounds:](v6, "setClipsToBounds:", 0);
    -[CKAvatarTitleCollectionReusableView titleLabel](v6, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarTitleCollectionReusableView addSubview:](v6, "addSubview:", v16);

    -[CKAvatarTitleCollectionReusableView layer](v6, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowsGroupBlending:", 0);

  }
  return v6;
}

- (void)setStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (self->_style != a3)
  {
    self->_style = a3;
    if ((unint64_t)(a3 - 2) < 2)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 5)
      {
        if (a3 == 1)
        {
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "theme");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "entryFieldDarkEffectButtonColor");
        }
        else
        {
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "theme");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "primaryLabelColor");
        }
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTextColor:", v7);

        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (void *)v6;
    -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v4);
LABEL_11:

    -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "titleIconImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_flatImageWithColor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "titleIconImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:", v14);

    if (!-[CKAvatarTitleCollectionReusableView isChevronHidden](self, "isChevronHidden"))
      -[CKAvatarTitleCollectionReusableView configureChevronImageView](self, "configureChevronImageView");
  }
}

- (void)setWantsOpaqueChevron:(BOOL)a3
{
  if (self->_wantsOpaqueChevron != a3)
  {
    self->_wantsOpaqueChevron = a3;
    if (!-[CKAvatarTitleCollectionReusableView isChevronHidden](self, "isChevronHidden"))
      -[CKAvatarTitleCollectionReusableView configureChevronImageView](self, "configureChevronImageView");
  }
}

- (BOOL)isChevronHidden
{
  return self->_chevronHidden;
}

- (void)setChevronHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  self->_chevronHidden = a3;
  -[CKAvatarTitleCollectionReusableView chevronImageView](self, "chevronImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && !v3)
    -[CKAvatarTitleCollectionReusableView setAvatarPickerActive:](self, "setAvatarPickerActive:", self->_avatarPickerActive);
  -[CKAvatarTitleCollectionReusableView chevronImageView](self, "chevronImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v3)
    {
      -[CKAvatarTitleCollectionReusableView chevronImageView](self, "chevronImageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

      -[CKAvatarTitleCollectionReusableView setChevronImageView:](self, "setChevronImageView:", 0);
      -[CKAvatarTitleCollectionReusableView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
}

- (void)setLocationLabel:(id)a3
{
  id *p_locationLabel;
  UILabel *locationLabel;
  id v7;
  id v8;

  v8 = a3;
  p_locationLabel = (id *)&self->_locationLabel;
  locationLabel = self->_locationLabel;
  if (locationLabel)
  {
    -[UILabel removeFromSuperview](locationLabel, "removeFromSuperview");
    v7 = *p_locationLabel;
    *p_locationLabel = 0;

  }
  if (v8)
  {
    objc_storeStrong((id *)&self->_locationLabel, a3);
    objc_msgSend(*p_locationLabel, "sizeToFit");
    -[CKAvatarTitleCollectionReusableView addSubview:](self, "addSubview:", *p_locationLabel);
  }
  -[CKAvatarTitleCollectionReusableView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setAvatarTitleAccessoryImageType:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;

  self->_avatarTitleAccessoryImageType = a3;
  switch(a3)
  {
    case 0:
      -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = 0;
      break;
    case 1:
      -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = 1;
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isKeyTransparencyEnabled");

      if (!v8)
        goto LABEL_9;
      -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = 4;
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isKeyTransparencyEnabled");

      if (!v10)
        goto LABEL_9;
      -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = 5;
      break;
    default:
      goto LABEL_9;
  }
  objc_msgSend(v4, "setTitleIconImageType:", v6);

LABEL_9:
  -[CKAvatarTitleCollectionReusableView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setAvatarPickerActive:(BOOL)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  _QWORD v9[5];

  if (self->_avatarPickerActive != a3
    || (-[CKAvatarTitleCollectionReusableView chevronImageView](self, "chevronImageView"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_avatarPickerActive = a3;
    if (!self->_chevronHidden)
    {
      if (!self->_chevronImageView)
        -[CKAvatarTitleCollectionReusableView configureChevronImageView](self, "configureChevronImageView");
      -[CKAvatarTitleCollectionReusableView layoutIfNeeded](self, "layoutIfNeeded");
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "transcriptHeaderChevronRotationAnimationSpeed");
      v8 = v7;

      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __61__CKAvatarTitleCollectionReusableView_setAvatarPickerActive___block_invoke;
      v9[3] = &unk_1E274A208;
      v9[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0x20000, v9, 0, v8, 0.0);
    }
  }
}

uint64_t __61__CKAvatarTitleCollectionReusableView_setAvatarPickerActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rotateChevronImageView");
}

- (void)configureChevronImageView
{
  UIImageView *v3;
  UIImageView *chevronImageView;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  if (!self->_chevronImageView)
  {
    v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    chevronImageView = self->_chevronImageView;
    self->_chevronImageView = v3;

    -[CKAvatarTitleCollectionReusableView addSubview:](self, "addSubview:", self->_chevronImageView);
  }
  v5 = -[CKAvatarTitleCollectionReusableView wantsOpaqueChevron](self, "wantsOpaqueChevron");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "navBarHeaderOpaqueChevronImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_chevronImageView, "setImage:", v8);

    if ((self->_style & 0xFFFFFFFFFFFFFFFELL) == 2)
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarTitleCollectionReusableView chevronImageView](self, "chevronImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v7);
  }
  else
  {
    objc_msgSend(v6, "navBarHeaderChevronImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_chevronImageView, "setImage:", v9);
  }

  -[UIImageView sizeToFit](self->_chevronImageView, "sizeToFit");
  -[CKAvatarTitleCollectionReusableView chevronImageView](self, "chevronImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  -[CKAvatarTitleCollectionReusableView chevronImageView](self, "chevronImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContentMode:", 4);

  -[CKAvatarTitleCollectionReusableView chevronImageView](self, "chevronImageView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBounds:", 0.0, 0.0, v12, v14);

}

- (void)_rotateChevronImageView
{
  _BOOL4 v3;
  __int128 v4;
  CGFloat v5;
  __int128 v6;
  void *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  memset(&v11, 0, sizeof(v11));
  if (-[CKAvatarTitleCollectionReusableView isAvatarPickerActive](self, "isAvatarPickerActive"))
  {
    v3 = -[CKAvatarTitleCollectionReusableView isLTR](self, "isLTR");
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v10.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v10.c = v4;
    *(_OWORD *)&v10.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    if (v3)
      v5 = 1.57079633;
    else
      v5 = -1.57079633;
    CGAffineTransformRotate(&v11, &v10, v5);
  }
  else
  {
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v11.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v11.c = v6;
    *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  v9 = v11;
  -[CKAvatarTitleCollectionReusableView chevronImageView](self, "chevronImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  objc_msgSend(v7, "setTransform:", &v8);

}

- (void)setTitle:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;

  v6 = a3;
  if (v6)
  {
    if (a4)
    {
      -[CKAvatarTitleCollectionReusableView pendingTitles](self, "pendingTitles");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[CKAvatarTitleCollectionReusableView setPendingTitles:](self, "setPendingTitles:", v8);

      }
      -[CKAvatarTitleCollectionReusableView pendingTitles](self, "pendingTitles");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v6);

      if ((v11 & 1) == 0)
      {
        -[CKAvatarTitleCollectionReusableView pendingTitles](self, "pendingTitles");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v6);

      }
      -[CKAvatarTitleCollectionReusableView pendingTitles](self, "pendingTitles");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14 == 1)
        -[CKAvatarTitleCollectionReusableView _animateFromQueue](self, "_animateFromQueue");
    }
    else
    {
      -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", v6);

      -[CKAvatarTitleCollectionReusableView setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CKAvatarTitleCollectionReusableView setTitle:animated:].cold.1(v15);

  }
}

- (void)_animateFromQueue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;

  -[CKAvatarTitleCollectionReusableView pendingTitles](self, "pendingTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[CKAvatarTitleCollectionReusableView pendingTitles](self, "pendingTitles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKAvatarTitleCollectionReusableView pendingTitles](self, "pendingTitles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFirstObject");

    v8 = (void *)MEMORY[0x1E0CEABB0];
    -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__CKAvatarTitleCollectionReusableView__animateFromQueue__block_invoke;
    v12[3] = &unk_1E274A108;
    v12[4] = self;
    v13 = v6;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__CKAvatarTitleCollectionReusableView__animateFromQueue__block_invoke_2;
    v11[3] = &unk_1E274A1B8;
    v10 = v6;
    objc_msgSend(v8, "transitionWithView:duration:options:animations:completion:", v9, 5242880, v12, v11, 0.35);

  }
}

void __56__CKAvatarTitleCollectionReusableView__animateFromQueue__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v1);

}

uint64_t __56__CKAvatarTitleCollectionReusableView__animateFromQueue__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_animateFromQueue");
}

- (void)configureWithTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[CKAvatarTitleCollectionReusableView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  _BOOL4 v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  double MaxX;
  double v48;
  double MinX;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  _BOOL4 v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  double v65;
  CGFloat v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  CGFloat rect;
  CGFloat v86;
  CGFloat v87;
  _QWORD v88[9];
  _QWORD v89[7];
  __int128 v90;
  _QWORD v91[9];
  objc_super v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;

  v92.receiver = self;
  v92.super_class = (Class)CKAvatarTitleCollectionReusableView;
  -[CKAvatarTitleCollectionReusableView layoutSubviews](&v92, sel_layoutSubviews);
  -[CKAvatarTitleCollectionReusableView chevronImageView](self, "chevronImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CKAvatarTitleCollectionReusableView chevronImageView](self, "chevronImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  -[CKAvatarTitleCollectionReusableView statusIndicatorImageView](self, "statusIndicatorImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[CKAvatarTitleCollectionReusableView statusIndicatorImageView](self, "statusIndicatorImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v86 = v15;
    v87 = v16;

  }
  else
  {
    v86 = *MEMORY[0x1E0C9D648];
    v87 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  }

  -[CKAvatarTitleCollectionReusableView bounds](self, "bounds");
  v18 = v17;
  v20 = v19;
  -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sizeToFit");

  -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_firstLineBaseline");
  v24 = v23;

  -[CKAvatarTitleCollectionReusableView chevronImageView](self, "chevronImageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  rect = v8;
  v26 = v6;
  if (v25)
  {
    v93.origin.x = v6;
    v93.origin.y = v8;
    v93.size.width = v10;
    v93.size.height = v12;
    v27 = CGRectGetWidth(v93) + 1.5;
  }
  else
  {
    v27 = 0.0;
  }

  -[CKAvatarTitleCollectionReusableView bounds](self, "bounds");
  v29 = v28 - v27;
  -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sizeThatFits:", v18 - v27, v20);
  v32 = v31;
  v34 = v33;

  if (v32 >= v29)
    v32 = v29;
  -[CKAvatarTitleCollectionReusableView bounds](self, "bounds");
  v36 = (v35 - (v27 + v32)) * 0.5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "avatarTitleOffset");
  *(float *)&v38 = v38 - v24;
  v39 = fmaxf(*(float *)&v38, 0.0);

  -[CKAvatarTitleCollectionReusableView chevronImageView](self, "chevronImageView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = MEMORY[0x1E0C809B0];
  if (v40)
  {
    v42 = -[CKAvatarTitleCollectionReusableView isLTR](self, "isLTR");
    v43 = v36;
    v44 = v39;
    v45 = v32;
    v46 = v34;
    if (v42)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v43);
      v48 = 1.5;
    }
    else
    {
      MinX = CGRectGetMinX(*(CGRect *)&v43);
      v94.origin.x = v26;
      v94.origin.y = rect;
      v94.size.width = v10;
      v94.size.height = v12;
      MaxX = MinX - CGRectGetWidth(v94);
      v48 = -1.5;
    }
    v50 = MaxX + v48;
    -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "font");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "ascender");
    v54 = v53 + v39 - v12;
    -[CKAvatarTitleCollectionReusableView chevronImageView](self, "chevronImageView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "image");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "baselineOffsetFromBottom");
    v58 = v54 + v57;

    v91[0] = v41;
    v91[1] = 3221225472;
    v91[2] = __53__CKAvatarTitleCollectionReusableView_layoutSubviews__block_invoke;
    v91[3] = &unk_1E274B8B8;
    v91[4] = self;
    *(double *)&v91[5] = v50;
    *(double *)&v91[6] = v58;
    *(CGFloat *)&v91[7] = v10;
    *(double *)&v91[8] = v12;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v91);
  }
  -[CKAvatarTitleCollectionReusableView statusIndicatorImageView](self, "statusIndicatorImageView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    v60 = -[CKAvatarTitleCollectionReusableView isLTR](self, "isLTR");
    v61 = v36;
    v62 = v39;
    v63 = v32;
    v64 = v34;
    if (v60)
    {
      v65 = CGRectGetMinX(*(CGRect *)&v61);
      v95.size.width = 16.0;
      v95.size.height = 9.0;
      v95.origin.x = v86;
      v66 = v87;
      v95.origin.y = v87;
      v67 = v65 - CGRectGetWidth(v95) + -1.5;
    }
    else
    {
      v67 = CGRectGetMaxX(*(CGRect *)&v61) + 1.5;
      v66 = v87;
    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "avatarTitleOffset");
    v70 = v69 + 1.0;
    v96.size.width = 16.0;
    v96.size.height = 9.0;
    v96.origin.x = v67;
    v96.origin.y = v66;
    v71 = v70 - CGRectGetHeight(v96);

    v89[0] = v41;
    v89[1] = 3221225472;
    v89[2] = __53__CKAvatarTitleCollectionReusableView_layoutSubviews__block_invoke_2;
    v89[3] = &unk_1E274B8B8;
    v89[4] = self;
    *(double *)&v89[5] = v67;
    *(double *)&v89[6] = v71;
    v90 = xmmword_18E7CB030;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v89);
  }
  v88[0] = v41;
  v88[1] = 3221225472;
  v88[2] = __53__CKAvatarTitleCollectionReusableView_layoutSubviews__block_invoke_3;
  v88[3] = &unk_1E274B8B8;
  v88[4] = self;
  *(double *)&v88[5] = v36;
  *(double *)&v88[6] = v39;
  *(double *)&v88[7] = v32;
  v88[8] = v34;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v88);
  -[CKAvatarTitleCollectionReusableView locationLabel](self, "locationLabel");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    -[CKAvatarTitleCollectionReusableView locationLabel](self, "locationLabel");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "sizeToFit");

    -[CKAvatarTitleCollectionReusableView locationLabel](self, "locationLabel");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarTitleCollectionReusableView bounds](self, "bounds");
    v76 = v75;
    -[CKAvatarTitleCollectionReusableView locationLabel](self, "locationLabel");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "frame");
    v79 = (v76 - v78) * 0.5;
    -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "origin");
    v82 = v81;
    -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "bounds");
    objc_msgSend(v74, "setOrigin:", v79, v82 + v84);

  }
}

void __53__CKAvatarTitleCollectionReusableView_layoutSubviews__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  if (CKMainScreenScale_once_46 != -1)
    dispatch_once(&CKMainScreenScale_once_46, &__block_literal_global_114);
  v6 = *(double *)&CKMainScreenScale_sMainScreenScale_46;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_46 == 0.0)
    v6 = 1.0;
  v7 = round(v2 * v6) / v6;
  v8 = round(v3 * v6) / v6;
  v9 = round(v4 * v6) / v6;
  v10 = round(v5 * v6) / v6;
  objc_msgSend(*(id *)(a1 + 32), "chevronImageView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);

}

void __53__CKAvatarTitleCollectionReusableView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  if (CKMainScreenScale_once_46 != -1)
    dispatch_once(&CKMainScreenScale_once_46, &__block_literal_global_114);
  v6 = *(double *)&CKMainScreenScale_sMainScreenScale_46;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_46 == 0.0)
    v6 = 1.0;
  v7 = round(v2 * v6) / v6;
  v8 = round(v3 * v6) / v6;
  v9 = round(v4 * v6) / v6;
  v10 = round(v5 * v6) / v6;
  objc_msgSend(*(id *)(a1 + 32), "statusIndicatorImageView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);

}

void __53__CKAvatarTitleCollectionReusableView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  double v2;
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
  id v13;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  if (CKMainScreenScale_once_46 != -1)
    dispatch_once(&CKMainScreenScale_once_46, &__block_literal_global_114);
  v6 = *(double *)&CKMainScreenScale_sMainScreenScale_46;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_46 == 0.0)
    v6 = 1.0;
  v7 = round(v2 * v6) / v6;
  v8 = round(v3 * v6) / v6;
  v9 = round(v4 * v6) / v6;
  v10 = round(v5 * v6) / v6;
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
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
  double v17;
  double v18;
  CGSize result;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a3.height;
  width = a3.width;
  -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  -[CKAvatarTitleCollectionReusableView chevronImageView](self, "chevronImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CKAvatarTitleCollectionReusableView chevronImageView](self, "chevronImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v8 = v8 + CGRectGetWidth(v20) + 1.5;

  }
  -[CKAvatarTitleCollectionReusableView statusIndicatorImageView](self, "statusIndicatorImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CKAvatarTitleCollectionReusableView statusIndicatorImageView](self, "statusIndicatorImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v8 = v8 + CGRectGetWidth(v21) + 1.5;

  }
  -[CKAvatarTitleCollectionReusableView locationLabel](self, "locationLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CKAvatarTitleCollectionReusableView locationLabel](self, "locationLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v10 = v10 + CGRectGetHeight(v22);

  }
  v17 = v8;
  v18 = v10;
  result.height = v18;
  result.width = v17;
  return result;
}

- (BOOL)isLTR
{
  return -[CKAvatarTitleCollectionReusableView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") ^ 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKAvatarTitleCollectionReusableView;
  -[CKAvatarTitleCollectionReusableView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, a3);
  if (!-[CKAvatarTitleCollectionReusableView isChevronHidden](self, "isChevronHidden"))
    -[CKAvatarTitleCollectionReusableView configureChevronImageView](self, "configureChevronImageView");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatarStackTitleFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvatarTitleCollectionReusableView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[CKAvatarTitleCollectionReusableView setNeedsLayout](self, "setNeedsLayout");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v4;

  -[CKAvatarTitleCollectionReusableView delegate](self, "delegate", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beganTouchingTitleLabel");

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v4;

  -[CKAvatarTitleCollectionReusableView delegate](self, "delegate", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endedTouchingTitleLabel");

}

- (CKAvatarTitleCollectionReusableViewDelegate)delegate
{
  return (CKAvatarTitleCollectionReusableViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)avatarTitleAccessoryImageType
{
  return self->_avatarTitleAccessoryImageType;
}

- (BOOL)isAvatarPickerActive
{
  return self->_avatarPickerActive;
}

- (int64_t)statusIndicatorType
{
  return self->_statusIndicatorType;
}

- (void)setStatusIndicatorType:(int64_t)a3
{
  self->_statusIndicatorType = a3;
}

- (BOOL)wantsOpaqueChevron
{
  return self->_wantsOpaqueChevron;
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronImageView, a3);
}

- (UIImageView)statusIndicatorImageView
{
  return self->_statusIndicatorImageView;
}

- (void)setStatusIndicatorImageView:(id)a3
{
  objc_storeStrong((id *)&self->_statusIndicatorImageView, a3);
}

- (NSMutableArray)pendingTitles
{
  return self->_pendingTitles;
}

- (void)setPendingTitles:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTitles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTitles, 0);
  objc_storeStrong((id *)&self->_statusIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setTitle:(os_log_t)log animated:.cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Tried to set nil title: %@", (uint8_t *)&v1, 0xCu);
}

@end
