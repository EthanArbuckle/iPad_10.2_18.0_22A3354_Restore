@implementation SFAccountTableViewCell

- (SFAccountTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFAccountTableViewCell *v4;
  SFAccountIconSharingBadgeImageCoordinator *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  SFAccountIconSharingBadgeImageCoordinator *badgeImageCoordinator;
  SFAccountTableViewCell *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFAccountTableViewCell;
  v4 = -[SFAccountTableViewCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = [SFAccountIconSharingBadgeImageCoordinator alloc];
    -[SFAccountTableViewCell imageView](v4, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C92670], "tableViewIconSize");
    v8 = v7;
    -[SFAccountTableViewCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SFAccountIconSharingBadgeImageCoordinator initWithIconImageView:iconDiameter:parentView:](v5, "initWithIconImageView:iconDiameter:parentView:", v6, v9, v8);
    badgeImageCoordinator = v4->_badgeImageCoordinator;
    v4->_badgeImageCoordinator = (SFAccountIconSharingBadgeImageCoordinator *)v10;

    v12 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFAccountTableViewCell;
  -[SFAccountTableViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[SFAccountIconSharingBadgeImageCoordinator containerDidLayoutSubviews](self->_badgeImageCoordinator, "containerDidLayoutSubviews");
}

- (void)setIcon:(id)a3
{
  UILabel *monogramLabel;
  id v5;
  void *v6;
  id v7;

  monogramLabel = self->_monogramLabel;
  v5 = a3;
  -[UILabel setHidden:](monogramLabel, "setHidden:", 1);
  -[UIView setHidden:](self->_monogramBackgroundView, "setHidden:", 1);
  -[SFAccountTableViewCell imageView](self, "imageView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMasksToBounds:", 1);

  objc_msgSend(v7, "_setContinuousCornerRadius:", 7.0);
  objc_msgSend(v7, "setImage:", v5);

  -[SFAccountTableViewCell _updateAccessibilityIdentifiers](self, "_updateAccessibilityIdentifiers");
  -[SFAccountTableViewCell _updateSharedAccountBadgeImageViewIfNecessary](self, "_updateSharedAccountBadgeImageViewIfNecessary");

}

- (void)showPlaceholderImageForDomain:(id)a3 backgroundColor:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *v13;
  UIView *monogramBackgroundView;
  void *v15;
  UILabel *v16;
  UILabel *monogramLabel;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v5 = a4;
  -[SFAccountTableViewCell imageView](self, "imageView");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_setContinuousCornerRadius:", 0.0);
  objc_msgSend(v25, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMasksToBounds:", 0);

  if (!self->_monogramLabel)
  {
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    objc_msgSend(MEMORY[0x1E0C92670], "tableViewIconSize");
    v10 = v9;
    v12 = v11;
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    monogramBackgroundView = self->_monogramBackgroundView;
    self->_monogramBackgroundView = v13;

    -[UIView setFrame:](self->_monogramBackgroundView, "setFrame:", v7, v8, v10, v12);
    -[UIView layer](self->_monogramBackgroundView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMasksToBounds:", 1);

    -[UIView _setContinuousCornerRadius:](self->_monogramBackgroundView, "_setContinuousCornerRadius:", 7.0);
    -[UIView _setAllowsHighContrastForBackgroundColor:](self->_monogramBackgroundView, "_setAllowsHighContrastForBackgroundColor:", 1);
    objc_msgSend(v25, "addSubview:", self->_monogramBackgroundView);
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    monogramLabel = self->_monogramLabel;
    self->_monogramLabel = v16;

    -[UILabel setAdjustsFontSizeToFitWidth:](self->_monogramLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setTextAlignment:](self->_monogramLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_monogramLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_monogramLabel, "setTextColor:", v18);

    -[UILabel setFrame:](self->_monogramLabel, "setFrame:", v7, v8, v10, v12);
    objc_msgSend(MEMORY[0x1E0DC37E8], "_sf_roundedSystemFontOfSize:weight:", 23, *MEMORY[0x1E0DC4B90]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_monogramLabel, "setFont:", v19);

    -[UILabel setIsAccessibilityElement:](self->_monogramLabel, "setIsAccessibilityElement:", 0);
    objc_msgSend(v25, "addSubview:", self->_monogramLabel);
  }
  if (blankImage_onceToken != -1)
    dispatch_once(&blankImage_onceToken, &__block_literal_global_34);
  objc_msgSend(v25, "setImage:", blankImage_image);
  -[UIView setBackgroundColor:](self->_monogramBackgroundView, "setBackgroundColor:", v5);

  -[UIView setHidden:](self->_monogramBackgroundView, "setHidden:", 0);
  -[UILabel setHidden:](self->_monogramLabel, "setHidden:", 0);
  v20 = (void *)MEMORY[0x1E0D8AD28];
  -[WBSSavedAccount customTitle](self->_savedAccount, "customTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount highLevelDomain](self->_savedAccount, "highLevelDomain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safari_bestURLForUserTypedString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "monogramStringForTitle:url:shouldRemoveGrammaticalArticles:", v21, v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_monogramLabel, "setText:", v24);

  -[SFAccountTableViewCell _updateSharedAccountBadgeImageViewIfNecessary](self, "_updateSharedAccountBadgeImageViewIfNecessary");
}

- (void)setSavedAccount:(id)a3 searchPattern:(id)a4 emphasizeUserName:(BOOL)a5
{
  _BOOL8 v5;
  WBSSavedAccount *v8;
  NSString *v9;
  WBSSavedAccount *savedAccount;
  WBSSavedAccount *v11;
  NSString *searchPattern;
  NSString *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v5 = a5;
  v8 = (WBSSavedAccount *)a3;
  v9 = (NSString *)a4;
  savedAccount = self->_savedAccount;
  self->_savedAccount = v8;
  v11 = v8;

  searchPattern = self->_searchPattern;
  self->_searchPattern = v9;
  v13 = v9;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountTableViewCell detailTextLabel](self, "detailTextLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v14);

  v21 = 0;
  v22 = 0;
  -[WBSSavedAccount safari_getTitle:detail:forTableViewCell:withSearchPattern:emphasizeUserName:](v11, "safari_getTitle:detail:forTableViewCell:withSearchPattern:emphasizeUserName:", &v22, &v21, self, v13, v5);
  v16 = v22;
  v17 = v21;
  -[SFAccountTableViewCell textLabel](self, "textLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAttributedText:", v16);

  -[SFAccountTableViewCell detailTextLabel](self, "detailTextLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAttributedText:", v17);

  -[SFAccountTableViewCell detailTextLabel](self, "detailTextLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLineBreakMode:", 4);

  -[SFAccountTableViewCell _updateAccessibilityIdentifiers](self, "_updateAccessibilityIdentifiers");
  -[SFAccountTableViewCell _updateSharedAccountBadgeImageViewIfNecessary](self, "_updateSharedAccountBadgeImageViewIfNecessary");

}

- (void)setSavedAccount:(id)a3 withWarnings:(id)a4 savedAccountIsOnlySavedAccountForHighLevelDomain:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
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
  id v22;

  v5 = a5;
  v22 = a3;
  objc_storeStrong((id *)&self->_savedAccount, a3);
  v9 = a4;
  +[_SFAccountManagerAppearanceValues titleFontForNarrowCell](_SFAccountManagerAppearanceValues, "titleFontForNarrowCell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountTableViewCell textLabel](self, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  if (v5)
  {
    objc_msgSend(v22, "effectiveTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAccountTableViewCell textLabel](self, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v22, "effectiveTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "user");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ — %@"), v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAccountTableViewCell textLabel](self, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v15);

  }
  +[_SFAccountManagerAppearanceValues subtitleFontForNarrowCellWithText:](_SFAccountManagerAppearanceValues, "subtitleFontForNarrowCellWithText:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountTableViewCell detailTextLabel](self, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v17);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountTableViewCell detailTextLabel](self, "detailTextLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextColor:", v19);

  -[SFAccountTableViewCell detailTextLabel](self, "detailTextLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v9);

  -[SFAccountTableViewCell _updateAccessibilityIdentifiers](self, "_updateAccessibilityIdentifiers");
}

- (void)setSavedAccount:(id)a3 searchPattern:(id)a4 emphasizeUserName:(BOOL)a5 shouldDifferentiateWithGroupName:(BOOL)a6
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a6;
  v14 = a3;
  -[SFAccountTableViewCell setSavedAccount:searchPattern:emphasizeUserName:](self, "setSavedAccount:searchPattern:emphasizeUserName:");
  if (v6)
  {
    objc_msgSend(v14, "sharedGroupName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v14, "user");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sharedGroupName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ — %@"), v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountTableViewCell detailTextLabel](self, "detailTextLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v12);

    }
  }

}

- (void)setSavedAccount:(id)a3 searchPattern:(id)a4 emphasizeUserName:(BOOL)a5 isReusedPassword:(BOOL)a6
{
  _BOOL4 v6;

  v6 = a6;
  -[SFAccountTableViewCell setSavedAccount:searchPattern:emphasizeUserName:](self, "setSavedAccount:searchPattern:emphasizeUserName:", a3, a4, a5);
  if (v6)
    -[SFAccountTableViewCell _layoutReusedPasswordWarningImageViewIfNecessary](self, "_layoutReusedPasswordWarningImageViewIfNecessary");
  -[UIImageView setHidden:](self->_reusedPasswordWarningImageView, "setHidden:", !v6);
}

- (void)_layoutReusedPasswordWarningImageViewIfNecessary
{
  id v3;
  void *v4;
  UIImageView *v5;
  void *v6;
  UIImageView *reusedPasswordWarningImageView;
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
  UIImageView *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (!self->_reusedPasswordWarningImageView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v5, "setTintColor:", v6);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    reusedPasswordWarningImageView = self->_reusedPasswordWarningImageView;
    self->_reusedPasswordWarningImageView = v5;
    v19 = v5;

    -[SFAccountTableViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_reusedPasswordWarningImageView);

    v9 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView centerYAnchor](self->_reusedPasswordWarningImageView, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAccountTableViewCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v13;
    -[UIImageView trailingAnchor](self->_reusedPasswordWarningImageView, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAccountTableViewCell contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, -10.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateConstraints:", v18);

  }
}

- (void)safari_copyUserName
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount user](self->_savedAccount, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_setSensitiveString:", v3);

}

- (void)safari_copyPassword
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount password](self->_savedAccount, "password");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_setSensitiveString:", v3);

}

- (BOOL)safari_hasOneTimeCodeGenerator
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WBSSavedAccount totpGenerators](self->_savedAccount, "totpGenerators");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)safari_copyOneTimeCode
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount currentOneTimeCode](self->_savedAccount, "currentOneTimeCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_setSensitiveString:", v3);

}

- (BOOL)isIconMonogram
{
  return -[UILabel isHidden](self->_monogramLabel, "isHidden") ^ 1;
}

- (void)_updateAccessibilityIdentifiers
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "updateAccessibilityIdentifierForAccountCell:", self);

}

- (BOOL)safari_hasWebsite
{
  void *v2;
  BOOL v3;

  -[WBSSavedAccount userVisibleDomain](self->_savedAccount, "userVisibleDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)safari_copyWebsite
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSSavedAccount userVisibleDomain](self->_savedAccount, "userVisibleDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setString:", v3);

}

- (void)_updateSharedAccountBadgeImageViewIfNecessary
{
  -[SFAccountIconSharingBadgeImageCoordinator setShowsBadge:](self->_badgeImageCoordinator, "setShowsBadge:", -[WBSSavedAccount isSavedInPersonalKeychain](self->_savedAccount, "isSavedInPersonalKeychain") ^ 1);
}

- (WBSSavedAccount)savedAccount
{
  return self->_savedAccount;
}

- (NSString)searchPattern
{
  return self->_searchPattern;
}

- (SFAccountTableViewCellDelegate)delegate
{
  return (SFAccountTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchPattern, 0);
  objc_storeStrong((id *)&self->_savedAccount, 0);
  objc_storeStrong((id *)&self->_reusedPasswordWarningImageView, 0);
  objc_storeStrong((id *)&self->_badgeImageCoordinator, 0);
  objc_storeStrong((id *)&self->_monogramBackgroundView, 0);
  objc_storeStrong((id *)&self->_monogramLabel, 0);
}

@end
