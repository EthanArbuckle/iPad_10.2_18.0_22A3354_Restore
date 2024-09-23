@implementation GKAvatarContainerView

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)GKAvatarContainerView;
  -[GKAvatarContainerView awakeFromNib](&v23, sel_awakeFromNib);
  -[GKAvatarContainerView playerAvatarView](self, "playerAvatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[GKAvatarContainerView playerAvatarView](self, "playerAvatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("UIA.GameCenter.GKAvatarContainerView.playerAvatarView"));

  objc_initWeak(&location, self);
  -[GKAvatarContainerView playerAvatarView](self, "playerAvatarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __37__GKAvatarContainerView_awakeFromNib__block_invoke;
  v20[3] = &unk_1E59C48A0;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v5, "setPlayer:completionHandler:", v6, v20);

  -[GKAvatarContainerView updateAvatarEditingAvailability](self, "updateAvatarEditingAvailability");
  -[GKAvatarContainerView editLabel](self, "editLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorWithAlphaComponent:", 0.4);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24[0] = objc_msgSend(v10, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "colorWithAlphaComponent:", 0.7);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24[1] = objc_msgSend(v12, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColors:", v13);

  -[GKAvatarContainerView imageContainer](self, "imageContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", 1);

  -[GKAvatarContainerView editImage](self, "editImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", 1);

  -[GKAvatarContainerView editLabel](self, "editLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("UIA.GameCenter.GKAvatarContainerView.editLabel"));

  -[GKAvatarContainerView editLabel](self, "editLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setIsAccessibilityElement:", 0);

  -[GKAvatarContainerView setupEditImageBackground](self, "setupEditImageBackground");
  -[GKAvatarContainerView imageContainer](self, "imageContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3868], "automaticStyle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHoverStyle:", v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __37__GKAvatarContainerView_awakeFromNib__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateAvatarEditingAvailability");

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)GKAvatarContainerView;
  -[GKAvatarContainerView layoutSubviews](&v20, sel_layoutSubviews);
  -[GKAvatarContainerView imageContainer](self, "imageContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4 * 0.5;
  -[GKAvatarContainerView imageContainer](self, "imageContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithAlphaComponent:", 0.08);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "CGColor");
  -[GKAvatarContainerView imageContainer](self, "imageContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBorderColor:", v10);

  -[GKAvatarContainerView imageContainer](self, "imageContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14 / 280.0;
  -[GKAvatarContainerView imageContainer](self, "imageContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBorderWidth:", v15);

  -[GKAvatarContainerView imageContainer](self, "imageContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setMasksToBounds:", 1);

}

- (void)setupEditImageBackground
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  -[GKAvatarContainerView editImageBackground](self, "editImageBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowOffset:", 0.0, 0.0);

  -[GKAvatarContainerView editImageBackground](self, "editImageBackground");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowRadius:", 2.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "CGColor");
  -[GKAvatarContainerView editImageBackground](self, "editImageBackground");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShadowColor:", v8);

  -[GKAvatarContainerView editImageBackground](self, "editImageBackground");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1050253722;
  objc_msgSend(v12, "setShadowOpacity:", v13);

  -[GKAvatarContainerView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceStyle");

  if (v15 == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[GKAvatarContainerView editImageBackground](self, "editImageBackground");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTintColor:", v17);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKAvatarContainerView;
  -[GKAvatarContainerView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[GKAvatarContainerView setupEditImageBackground](self, "setupEditImageBackground");
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[GKAvatarContainerView widthAnchor](self, "widthAnchor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[GKAvatarContainerView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 1);

}

- (void)didSetPlayerAvatarImage:(id)a3
{
  id v3;

  -[GKAvatarContainerView imageContainer](self, "imageContainer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

}

- (void)didSelectPlayerAvatarView:(id)a3
{
  id v4;

  -[GKAvatarContainerView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatarView:didSelectImageWithEditingEnabled:", self, GKIsAvatarEditingSupported());

}

- (void)refreshViewForLocalPlayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alias");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAvatarContainerView nicknameLabel](self, "nicknameLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAvatarContainerView emailLabel](self, "emailLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[GKAvatarContainerView refreshHeaderViewProfileImage](self, "refreshHeaderViewProfileImage");
}

- (void)refreshHeaderViewProfileImage
{
  void *v3;
  _QWORD v4[5];

  -[GKAvatarContainerView playerAvatarView](self, "playerAvatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__GKAvatarContainerView_refreshHeaderViewProfileImage__block_invoke;
  v4[3] = &unk_1E59C4148;
  v4[4] = self;
  objc_msgSend(v3, "refreshImageWithCompletionHandler:", v4);

}

uint64_t __54__GKAvatarContainerView_refreshHeaderViewProfileImage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAvatarEditingAvailability");
}

- (void)updateAvatarEditingAvailability
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;

  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAvatarEditingRestricted");

  if (v4)
  {
    -[GKAvatarContainerView playerAvatarView](self, "playerAvatarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
LABEL_9:
    objc_msgSend(v5, "setUserInteractionEnabled:", 0);

    v30 = *MEMORY[0x1E0DC4678];
    -[GKAvatarContainerView playerAvatarView](self, "playerAvatarView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAccessibilityTraits:", v30);

    -[GKAvatarContainerView editLabel](self, "editLabel");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setHidden:", 1);
    goto LABEL_10;
  }
  if (GKIsAvatarEditingSupported())
  {
    GKGameCenterUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKAvatarContainerView editLabel](self, "editLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[GKAvatarContainerView editLabel](self, "editLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12 >= 6)
    {
      -[GKAvatarContainerView editLabel](self, "editLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 1);

      -[GKAvatarContainerView editImage](self, "editImage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHidden:", 0);

    }
    v15 = *MEMORY[0x1E0DC4660] | *MEMORY[0x1E0DC4678];
    -[GKAvatarContainerView playerAvatarView](self, "playerAvatarView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAccessibilityTraits:", v15);

    GKGameCenterUIFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKAvatarContainerView playerAvatarView](self, "playerAvatarView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAccessibilityHint:", v18);

    -[GKAvatarContainerView playerAvatarView](self, "playerAvatarView");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setUserInteractionEnabled:", 1);
  }
  else
  {
    -[GKAvatarContainerView playerAvatarView](self, "playerAvatarView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasImage");

    -[GKAvatarContainerView playerAvatarView](self, "playerAvatarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v21)
      goto LABEL_9;
    objc_msgSend(v5, "setUserInteractionEnabled:", 1);

    v22 = *MEMORY[0x1E0DC4660] | *MEMORY[0x1E0DC4678];
    -[GKAvatarContainerView playerAvatarView](self, "playerAvatarView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAccessibilityTraits:", v22);

    GKGameCenterUIFrameworkBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKAvatarContainerView playerAvatarView](self, "playerAvatarView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAccessibilityHint:", v25);

    -[GKAvatarContainerView editLabel](self, "editLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setHidden:", 0);

    GKGameCenterUIFrameworkBundle();
    v32 = (id)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKAvatarContainerView editLabel](self, "editLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v28);

  }
LABEL_10:

}

- (void)prepareForDefaultNicknameViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  void *v20;

  -[GKAvatarContainerView emailLabel](self, "emailLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[GKAvatarContainerView nicknameLabel](self, "nicknameLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[GKAvatarContainerView imageContainerTopConstraint](self, "imageContainerTopConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", 0.0);

  v6 = (void *)MEMORY[0x1E0DC1350];
  -[GKAvatarContainerView editLabel](self, "editLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fontDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fontDescriptorWithSymbolicTraits:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAvatarContainerView editLabel](self, "editLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pointSize");
  objc_msgSend(v6, "fontWithDescriptor:size:", v10, v13 + 2.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAvatarContainerView editLabel](self, "editLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  if (v17 == 1)
  {
    if (*MEMORY[0x1E0D253F8])
      v18 = *MEMORY[0x1E0D25B68] == 0;
    else
      v18 = 0;
    v19 = v18;
  }
  else
  {
    v19 = 1;
  }
  -[GKAvatarContainerView playerAvatarView](self, "playerAvatarView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAvatarSize:", v19);

  -[GKAvatarContainerView refreshHeaderViewProfileImage](self, "refreshHeaderViewProfileImage");
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  float v5;
  void *v6;
  void *v7;
  double v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKAvatarContainerView;
  -[GKAvatarContainerView setUserInteractionEnabled:](&v9, sel_setUserInteractionEnabled_);
  if (v3)
    v5 = 1.0;
  else
    v5 = 0.0;
  -[GKAvatarContainerView editLabel](self, "editLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = v5;
  objc_msgSend(v7, "setOpacity:", v8);

}

- (GKAvatarContainerViewDelegate)delegate
{
  return (GKAvatarContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (GKDashboardPlayerPhotoView)playerAvatarView
{
  return self->_playerAvatarView;
}

- (void)setPlayerAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_playerAvatarView, a3);
}

- (UILabel)nicknameLabel
{
  return self->_nicknameLabel;
}

- (void)setNicknameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nicknameLabel, a3);
}

- (UILabel)emailLabel
{
  return self->_emailLabel;
}

- (void)setEmailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_emailLabel, a3);
}

- (UIView)imageContainer
{
  return self->_imageContainer;
}

- (void)setImageContainer:(id)a3
{
  objc_storeStrong((id *)&self->_imageContainer, a3);
}

- (GKGradientLabel)editLabel
{
  return self->_editLabel;
}

- (void)setEditLabel:(id)a3
{
  objc_storeStrong((id *)&self->_editLabel, a3);
}

- (UIView)editImage
{
  return self->_editImage;
}

- (void)setEditImage:(id)a3
{
  objc_storeStrong((id *)&self->_editImage, a3);
}

- (UIImageView)editImageBackground
{
  return self->_editImageBackground;
}

- (void)setEditImageBackground:(id)a3
{
  objc_storeStrong((id *)&self->_editImageBackground, a3);
}

- (NSLayoutConstraint)imageContainerTopConstraint
{
  return self->_imageContainerTopConstraint;
}

- (void)setImageContainerTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageContainerTopConstraint, a3);
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
  objc_storeStrong((id *)&self->_tapGesture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_imageContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_editImageBackground, 0);
  objc_storeStrong((id *)&self->_editImage, 0);
  objc_storeStrong((id *)&self->_editLabel, 0);
  objc_storeStrong((id *)&self->_imageContainer, 0);
  objc_storeStrong((id *)&self->_emailLabel, 0);
  objc_storeStrong((id *)&self->_nicknameLabel, 0);
  objc_storeStrong((id *)&self->_playerAvatarView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
