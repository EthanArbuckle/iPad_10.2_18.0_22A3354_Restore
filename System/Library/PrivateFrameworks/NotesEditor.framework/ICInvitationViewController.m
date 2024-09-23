@implementation ICInvitationViewController

- (ICInvitationViewController)init
{
  void *v3;
  ICInvitationViewController *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICInvitationViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, v3);

  return v4;
}

- (void)viewDidLoad
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
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
  objc_super v28;
  CGRect v29;

  v28.receiver = self;
  v28.super_class = (Class)ICInvitationViewController;
  -[ICInvitationViewController viewDidLoad](&v28, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "ICBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInvitationViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInvitationViewController backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = (void *)MEMORY[0x1E0DC3888];
  -[ICInvitationViewController invitationImageView](self, "invitationImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v8, "configurationWithPointSize:", CGRectGetHeight(v29));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("arrow.down.message"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInvitationViewController invitationImageView](self, "invitationImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v11);

  v13 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
  v14 = v13;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  }
  else
  {
    -[ICInvitationViewController invitationImageView](self, "invitationImageView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "tintColor");
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInvitationViewController invitationImageView](self, "invitationImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTintColor:", v15);

  if ((v14 & 1) == 0)
  {

    v15 = v2;
  }

  -[ICInvitationViewController titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", &stru_1EA7E9860);

  objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorLabelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInvitationViewController titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTextColor:", v18);

  -[ICInvitationViewController subtitleLabel](self, "subtitleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", &stru_1EA7E9860);

  objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorSecondaryLabelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInvitationViewController subtitleLabel](self, "subtitleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTextColor:", v21);

  -[ICInvitationViewController viewButton](self, "viewButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_accessibilitySetIsSpeakThisElement:", 1);

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
  {
    -[ICInvitationViewController viewButton](self, "viewButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTitleColor:forState:", 0, 0);

    objc_msgSend(MEMORY[0x1E0DC3520], "ic_filledTintedButtonConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInvitationViewController viewButton](self, "viewButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setConfiguration:", v25);

  }
  -[ICInvitationViewController largeViewButton](self, "largeViewButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setIsAccessibilityElement:", 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICInvitationViewController;
  -[ICNAViewController dealloc](&v4, sel_dealloc);
}

- (void)setInvitation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_storeStrong((id *)&self->_invitation, a3);
  v5 = a3;
  objc_msgSend(v5, "participantsInfoDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInvitationViewController titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v5, "joinDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInvitationViewController subtitleLabel](self, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v5, "removeActionTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICInvitationViewController attributionView](self, "attributionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMenuTitleForHideAction:", v10);

  -[ICInvitationViewController updateButtonConfiguration](self, "updateButtonConfiguration");
}

- (void)setHighlight:(id)a3
{
  id v5;
  void *v6;
  id v7;
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
  id v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[ICInvitationViewController attributionView](self, "attributionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  objc_storeStrong((id *)&self->_highlight, a3);
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CD7380]);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    {
      objc_msgSend(v7, "traitOverrides");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUserInterfaceStyle:", 1);

    }
    objc_msgSend(v7, "setHighlight:", v5);
    objc_msgSend(v7, "setDisplayContext:", 1);
    objc_msgSend(v7, "setHorizontalAlignment:", 2);
    -[ICInvitationViewController invitation](self, "invitation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeActionTitle");
    v28 = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMenuTitleForHideAction:", v10);

    -[ICInvitationViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v7);

    -[ICInvitationViewController setAttributionView:](self, "setAttributionView:", v7);
    v22 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v7, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInvitationViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "safeAreaLayoutGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v23;
    objc_msgSend(v7, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInvitationViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeAreaLayoutGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v15;
    objc_msgSend(v7, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInvitationViewController invitationImageView](self, "invitationImageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 12.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v20);

    v5 = v28;
  }

}

- (void)setShowsActivityIndicator:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  self->_showsActivityIndicator = a3;
  -[ICInvitationViewController viewButton](self, "viewButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "copy");

  objc_msgSend(v9, "setShowsActivityIndicator:", v3);
  -[ICInvitationViewController viewButton](self, "viewButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConfiguration:", v9);

  -[ICInvitationViewController viewButton](self, "viewButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3 ^ 1);

}

- (void)updateButtonConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3520], "ic_filledTintedButtonConfiguration");
  else
    objc_msgSend(MEMORY[0x1E0DC3520], "ic_plainButtonConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImagePadding:", 8.0);
  -[ICInvitationViewController invitation](self, "invitation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "joinActionTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v4);

  -[ICInvitationViewController viewButton](self, "viewButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfiguration:", v6);

}

- (void)viewButtonDidTap:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[ICInvitationViewController didTapViewButton](self, "didTapViewButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICInvitationViewController didTapViewButton](self, "didTapViewButton");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (ICInvitation)invitation
{
  return self->_invitation;
}

- (SWHighlight)highlight
{
  return self->_highlight;
}

- (BOOL)showsActivityIndicator
{
  return self->_showsActivityIndicator;
}

- (NSDirectionalEdgeInsets)backgroundInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_backgroundInsets.top;
  leading = self->_backgroundInsets.leading;
  bottom = self->_backgroundInsets.bottom;
  trailing = self->_backgroundInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setBackgroundInsets:(NSDirectionalEdgeInsets)a3
{
  self->_backgroundInsets = a3;
}

- (id)didTapViewButton
{
  return self->_didTapViewButton;
}

- (void)setDidTapViewButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (ICTextBackgroundView)backgroundView
{
  return (ICTextBackgroundView *)objc_loadWeakRetained((id *)&self->_backgroundView);
}

- (void)setBackgroundView:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundView, a3);
}

- (UIImageView)invitationImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_invitationImageView);
}

- (void)setInvitationImageView:(id)a3
{
  objc_storeWeak((id *)&self->_invitationImageView, a3);
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_subtitleLabel);
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_subtitleLabel, a3);
}

- (UIButton)viewButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_viewButton);
}

- (void)setViewButton:(id)a3
{
  objc_storeWeak((id *)&self->_viewButton, a3);
}

- (UIButton)largeViewButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_largeViewButton);
}

- (void)setLargeViewButton:(id)a3
{
  objc_storeWeak((id *)&self->_largeViewButton, a3);
}

- (SWAttributionView)attributionView
{
  return (SWAttributionView *)objc_loadWeakRetained((id *)&self->_attributionView);
}

- (void)setAttributionView:(id)a3
{
  objc_storeWeak((id *)&self->_attributionView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attributionView);
  objc_destroyWeak((id *)&self->_largeViewButton);
  objc_destroyWeak((id *)&self->_viewButton);
  objc_destroyWeak((id *)&self->_subtitleLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_destroyWeak((id *)&self->_invitationImageView);
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_storeStrong(&self->_didTapViewButton, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
}

@end
