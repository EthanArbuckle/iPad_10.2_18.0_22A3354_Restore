@implementation CKUITheme

- (UIColor)conversationListSummaryColor
{
  int v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)conversationListSummaryColor_sBehavior;
  if (conversationListSummaryColor_sBehavior)
    v5 = conversationListSummaryColor_sIsIncreaseContrastEnabled_conversationListSummaryColor == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme grayTextColor](self, "grayTextColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)conversationListSummaryColor_sBehavior;
    conversationListSummaryColor_sBehavior = v6;

    conversationListSummaryColor_sIsIncreaseContrastEnabled_conversationListSummaryColor = v3;
    v4 = (void *)conversationListSummaryColor_sBehavior;
  }
  return (UIColor *)v4;
}

- (UIColor)meMentionTextColor
{
  if (meMentionTextColor_once != -1)
    dispatch_once(&meMentionTextColor_once, &__block_literal_global_288);
  return (UIColor *)(id)meMentionTextColor_sBehavior;
}

- (UIColor)conversationListSenderColor
{
  if (conversationListSenderColor_once != -1)
    dispatch_once(&conversationListSenderColor_once, &__block_literal_global_68);
  return (UIColor *)(id)conversationListSenderColor_sBehavior;
}

- (UIColor)conversationListChevronColor
{
  if (conversationListChevronColor_once != -1)
    dispatch_once(&conversationListChevronColor_once, &__block_literal_global_67);
  return (UIColor *)(id)conversationListChevronColor_sBehavior;
}

- (id)balloonColorsForColorType:(char)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case -1:
      -[CKUITheme gray_balloonColors](self, "gray_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      -[CKUITheme green_balloonColors](self, "green_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[CKUITheme blue_balloonColors](self, "blue_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[CKUITheme siri_balloonColors](self, "siri_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[CKUITheme red_balloonColors](self, "red_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[CKUITheme white_balloonColors](self, "white_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[CKUITheme black_balloonColors](self, "black_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[CKUITheme business_balloonColors](self, "business_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[CKUITheme multiway_balloonColors](self, "multiway_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[CKUITheme background_balloonColors](self, "background_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[CKUITheme reply_gray_balloonColors](self, "reply_gray_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[CKUITheme reply_blue_balloonColors](self, "reply_blue_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[CKUITheme reply_green_balloonColors](self, "reply_green_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[CKUITheme stewie_balloonColors](self, "stewie_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[CKUITheme message_editing_black_balloonColors](self, "message_editing_black_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[CKUITheme opaque_orb_gray_balloonColors](self, "opaque_orb_gray_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      -[CKUITheme pending_blue_balloonColors](self, "pending_blue_balloonColors", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)gray_balloonColors
{
  if (gray_balloonColors_once != -1)
    dispatch_once(&gray_balloonColors_once, &__block_literal_global_113);
  return (id)gray_balloonColors_sBehavior;
}

- (UIColor)conversationListDateColor
{
  int v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)conversationListDateColor_sBehavior;
  if (conversationListDateColor_sBehavior)
    v5 = conversationListDateColor_sIsIncreaseContrastEnabled_conversationListDateColor == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme grayTextColor](self, "grayTextColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)conversationListDateColor_sBehavior;
    conversationListDateColor_sBehavior = v6;

    conversationListDateColor_sIsIncreaseContrastEnabled_conversationListDateColor = v3;
    v4 = (void *)conversationListDateColor_sBehavior;
  }
  return (UIColor *)v4;
}

- (int64_t)navBarStyle
{
  if (navBarStyle_once != -1)
    dispatch_once(&navBarStyle_once, &__block_literal_global_55);
  return 0;
}

- (int64_t)statusBarStyle
{
  if (statusBarStyle_once != -1)
    dispatch_once(&statusBarStyle_once, &__block_literal_global_57);
  return 0;
}

- (int64_t)scrollIndicatorStyle
{
  if (scrollIndicatorStyle_once != -1)
    dispatch_once(&scrollIndicatorStyle_once, &__block_literal_global_60);
  return 0;
}

- (UIColor)conversationListCollectionViewBackgroundColor
{
  if (conversationListCollectionViewBackgroundColor_once != -1)
    dispatch_once(&conversationListCollectionViewBackgroundColor_once, &__block_literal_global_66);
  return (UIColor *)(id)conversationListCollectionViewBackgroundColor_sBehavior;
}

- (UIColor)conversationListBackgroundColor
{
  if (conversationListBackgroundColor_once != -1)
    dispatch_once(&conversationListBackgroundColor_once, &__block_literal_global_65);
  return 0;
}

- (int64_t)keyboardAppearance
{
  if (keyboardAppearance_once != -1)
    dispatch_once(&keyboardAppearance_once, &__block_literal_global_293);
  return 0;
}

- (UIColor)entryFieldTextColor
{
  if (entryFieldTextColor_once != -1)
    dispatch_once(&entryFieldTextColor_once, &__block_literal_global_348);
  return (UIColor *)(id)entryFieldTextColor_sBehavior;
}

void __31__CKUITheme_meMentionTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemBlueColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)meMentionTextColor_sBehavior;
  meMentionTextColor_sBehavior = v0;

}

void __32__CKUITheme_entryFieldGrayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("EntryFieldGrayColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldGrayColor_sBehavior;
  entryFieldGrayColor_sBehavior = v0;

}

- (int64_t)defaultBarStyle
{
  if (defaultBarStyle_once != -1)
    dispatch_once(&defaultBarStyle_once, &__block_literal_global_56);
  return 0;
}

- (void)setHUDStyle:(int64_t)a3
{
  self->_HUDStyle = a3;
}

void __41__CKUITheme_conversationListChevronColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListChevronColor_sBehavior;
  conversationListChevronColor_sBehavior = v0;

}

void __40__CKUITheme_conversationListSenderColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListSenderColor_sBehavior;
  conversationListSenderColor_sBehavior = v0;

}

void __32__CKUITheme_entryFieldTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldTextColor_sBehavior;
  entryFieldTextColor_sBehavior = v0;

}

void __58__CKUITheme_conversationListCollectionViewBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListCollectionViewBackgroundColor_sBehavior;
  conversationListCollectionViewBackgroundColor_sBehavior = v0;

}

- (UIColor)messagesControllerBackgroundColor
{
  if (messagesControllerBackgroundColor_once != -1)
    dispatch_once(&messagesControllerBackgroundColor_once, &__block_literal_global_51);
  return 0;
}

- (UIColor)grayTextColor
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (void *)grayTextColor_sBehavior;
  if (grayTextColor_sBehavior)
    v4 = grayTextColor_sIsIncreaseContrastEnabled_grayTextColor == v2;
  else
    v4 = 0;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)grayTextColor_sBehavior;
    grayTextColor_sBehavior = v5;

    grayTextColor_sIsIncreaseContrastEnabled_grayTextColor = v2;
    v3 = (void *)grayTextColor_sBehavior;
  }
  return (UIColor *)v3;
}

void __39__CKUITheme__transcriptBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "_ckSystemBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_transcriptBackgroundColor_sBehavior;
  _transcriptBackgroundColor_sBehavior = v0;

}

- (UIColor)entryFieldGrayColor
{
  if (entryFieldGrayColor_once != -1)
    dispatch_once(&entryFieldGrayColor_once, &__block_literal_global_338);
  return (UIColor *)(id)entryFieldGrayColor_sBehavior;
}

- (UIColor)transcriptBackgroundColor
{
  void *v3;
  int v4;

  +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPrinting");

  if (v4)
    +[CKPrintController printBackgroundColor](CKPrintController, "printBackgroundColor");
  else
    -[CKUITheme _transcriptBackgroundColor](self, "_transcriptBackgroundColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_transcriptBackgroundColor
{
  if (_transcriptBackgroundColor_once != -1)
    dispatch_once(&_transcriptBackgroundColor_once, &__block_literal_global_101);
  return (id)_transcriptBackgroundColor_sBehavior;
}

void __31__CKUITheme_gray_balloonColors__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_115);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)gray_balloonColors_sBehavior;
  gray_balloonColors_sBehavior = v1;

}

- (id)secondaryBrandColorForBusinessChat:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isBusinessChat"))
  {
    objc_msgSend(v4, "brand");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKUITheme _secondaryBrandColorForBrand:debugAssociatedObject:](self, "_secondaryBrandColorForBrand:debugAssociatedObject:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)primaryBrandColorForBusinessChat:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isBusinessChat"))
  {
    objc_msgSend(v4, "brand");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKUITheme _primaryBrandColorForBrand:debugAssociatedObject:](self, "_primaryBrandColorForBrand:debugAssociatedObject:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (UIColor)appTintColor
{
  if (appTintColor_once != -1)
    dispatch_once(&appTintColor_once, &__block_literal_global_4);
  return (UIColor *)(id)appTintColor_sBehavior;
}

void __25__CKUITheme_appTintColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemBlueColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)appTintColor_sBehavior;
  appTintColor_sBehavior = v0;

}

- (UIColor)segmentedControlSelectionTintColor
{
  if (segmentedControlSelectionTintColor_once != -1)
    dispatch_once(&segmentedControlSelectionTintColor_once, &__block_literal_global_50);
  return (UIColor *)(id)segmentedControlSelectionTintColor_sBehavior;
}

void __47__CKUITheme_segmentedControlSelectionTintColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)segmentedControlSelectionTintColor_sBehavior;
  segmentedControlSelectionTintColor_sBehavior = v0;

}

- (UIColor)lightGrayColor
{
  if (lightGrayColor_once != -1)
    dispatch_once(&lightGrayColor_once, &__block_literal_global_52);
  return (UIColor *)(id)lightGrayColor_sBehavior;
}

void __27__CKUITheme_lightGrayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.780392157, 0.780392157, 0.8, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)lightGrayColor_sBehavior;
  lightGrayColor_sBehavior = v0;

}

- (UIColor)notificationSubtitleColor
{
  if (notificationSubtitleColor_once != -1)
    dispatch_once(&notificationSubtitleColor_once, &__block_literal_global_53);
  return 0;
}

- (BOOL)shouldOverlayAppBorderImage
{
  if (shouldOverlayAppBorderImage_once != -1)
    dispatch_once(&shouldOverlayAppBorderImage_once, &__block_literal_global_54);
  return 0;
}

- (int64_t)appManagerStatusBarStyle
{
  if (appManagerStatusBarStyle_once != -1)
    dispatch_once(&appManagerStatusBarStyle_once, &__block_literal_global_58);
  return appManagerStatusBarStyle_sBehavior;
}

void __37__CKUITheme_appManagerStatusBarStyle__block_invoke()
{
  appManagerStatusBarStyle_sBehavior = 1;
}

- (UIColor)appManagerSectionHeaderTextColor
{
  if (appManagerSectionHeaderTextColor_once != -1)
    dispatch_once(&appManagerSectionHeaderTextColor_once, &__block_literal_global_59);
  return (UIColor *)(id)appManagerSectionHeaderTextColor_sBehavior;
}

void __45__CKUITheme_appManagerSectionHeaderTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)appManagerSectionHeaderTextColor_sBehavior;
  appManagerSectionHeaderTextColor_sBehavior = v0;

}

- (CNContactStyle)contactStyle
{
  if (contactStyle_once != -1)
    dispatch_once(&contactStyle_once, &__block_literal_global_61);
  return (CNContactStyle *)(id)contactStyle_sBehavior;
}

void __25__CKUITheme_contactStyle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C974D0], "defaultStyle");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)contactStyle_sBehavior;
  contactStyle_sBehavior = v0;

}

- (UIColor)primaryLabelColor
{
  if (primaryLabelColor_once != -1)
    dispatch_once(&primaryLabelColor_once, &__block_literal_global_63);
  return (UIColor *)(id)primaryLabelColor_sBehavior;
}

void __30__CKUITheme_primaryLabelColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)primaryLabelColor_sBehavior;
  primaryLabelColor_sBehavior = v0;

}

- (UIColor)secondaryLabelColor
{
  if (secondaryLabelColor_once != -1)
    dispatch_once(&secondaryLabelColor_once, &__block_literal_global_64);
  return (UIColor *)(id)secondaryLabelColor_sBehavior;
}

void __32__CKUITheme_secondaryLabelColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secondaryLabelColor_sBehavior;
  secondaryLabelColor_sBehavior = v0;

}

- (UIColor)linkColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__CKUITheme_linkColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (linkColor_once != -1)
    dispatch_once(&linkColor_once, block);
  return (UIColor *)(id)linkColor_sBehavior;
}

void __22__CKUITheme_linkColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "appTintColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)linkColor_sBehavior;
  linkColor_sBehavior = v1;

}

- (UIColor)unreadIndicatorColor
{
  if (unreadIndicatorColor_once != -1)
    dispatch_once(&unreadIndicatorColor_once, &__block_literal_global_69);
  return (UIColor *)(id)unreadIndicatorColor_sBehavior;
}

void __33__CKUITheme_unreadIndicatorColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemBlueColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)unreadIndicatorColor_sBehavior;
  unreadIndicatorColor_sBehavior = v0;

}

- (UIColor)readIndicatorColor
{
  if (readIndicatorColor_once != -1)
    dispatch_once(&readIndicatorColor_once, &__block_literal_global_70);
  return (UIColor *)(id)readIndicatorColor_sBehavior;
}

void __31__CKUITheme_readIndicatorColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)readIndicatorColor_sBehavior;
  readIndicatorColor_sBehavior = v0;

}

- (UIColor)readSelectedIndicatorColor
{
  if (readSelectedIndicatorColor_once != -1)
    dispatch_once(&readSelectedIndicatorColor_once, &__block_literal_global_71);
  return 0;
}

- (UIColor)accessoryIndicatorTintColor
{
  if (accessoryIndicatorTintColor_once != -1)
    dispatch_once(&accessoryIndicatorTintColor_once, &__block_literal_global_72);
  return (UIColor *)(id)accessoryIndicatorTintColor_sBehavior;
}

void __40__CKUITheme_accessoryIndicatorTintColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)accessoryIndicatorTintColor_sBehavior;
  accessoryIndicatorTintColor_sBehavior = v0;

}

- (UIColor)accessoryIndicatorHighlightedTintColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CKUITheme_accessoryIndicatorHighlightedTintColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (accessoryIndicatorHighlightedTintColor_once != -1)
    dispatch_once(&accessoryIndicatorHighlightedTintColor_once, block);
  return (UIColor *)(id)accessoryIndicatorHighlightedTintColor_sBehavior;
}

void __51__CKUITheme_accessoryIndicatorHighlightedTintColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "conversationListCellSelectedSummaryColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)accessoryIndicatorHighlightedTintColor_sBehavior;
  accessoryIndicatorHighlightedTintColor_sBehavior = v1;

}

- (UIColor)conversationListFocusFilterBannerTextColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CKUITheme_conversationListFocusFilterBannerTextColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (conversationListFocusFilterBannerTextColor_once != -1)
    dispatch_once(&conversationListFocusFilterBannerTextColor_once, block);
  return (UIColor *)(id)conversationListFocusFilterBannerTextColor_sBehavior;
}

void __55__CKUITheme_conversationListFocusFilterBannerTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "transcriptAvailabilityColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)conversationListFocusFilterBannerTextColor_sBehavior;
  conversationListFocusFilterBannerTextColor_sBehavior = v1;

}

- (UIColor)conversationListCellSelectedTextColor
{
  if (conversationListCellSelectedTextColor_once != -1)
    dispatch_once(&conversationListCellSelectedTextColor_once, &__block_literal_global_73);
  return 0;
}

- (UIColor)conversationListCellSelectedSummaryColor
{
  if (conversationListCellSelectedSummaryColor_once != -1)
    dispatch_once(&conversationListCellSelectedSummaryColor_once, &__block_literal_global_74);
  return 0;
}

- (UIColor)conversationListCellSelectedDateColor
{
  if (conversationListCellSelectedDateColor_once != -1)
    dispatch_once(&conversationListCellSelectedDateColor_once, &__block_literal_global_75);
  return 0;
}

- (UIColor)conversationListCellColor
{
  if (conversationListCellColor_once != -1)
    dispatch_once(&conversationListCellColor_once, &__block_literal_global_76);
  return 0;
}

- (UIColor)conversationListSelectedCellColor
{
  if (conversationListSelectedCellColor_once != -1)
    dispatch_once(&conversationListSelectedCellColor_once, &__block_literal_global_77);
  return (UIColor *)(id)conversationListSelectedCellColor_sBehavior;
}

void __46__CKUITheme_conversationListSelectedCellColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tableCellDefaultSelectionTintColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListSelectedCellColor_sBehavior;
  conversationListSelectedCellColor_sBehavior = v0;

}

- (UIColor)conversationListEditingPinsSummaryColor
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (void *)conversationListEditingPinsSummaryColor_sBehavior;
  if (conversationListEditingPinsSummaryColor_sBehavior)
    v4 = conversationListEditingPinsSummaryColor_sIsIncreaseContrastEnabled_conversationListEditingPinsSummaryColor == v2;
  else
    v4 = 0;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)conversationListEditingPinsSummaryColor_sBehavior;
    conversationListEditingPinsSummaryColor_sBehavior = v5;

    conversationListEditingPinsSummaryColor_sIsIncreaseContrastEnabled_conversationListEditingPinsSummaryColor = v2;
    v3 = (void *)conversationListEditingPinsSummaryColor_sBehavior;
  }
  return (UIColor *)v3;
}

- (UIColor)conversationListLargeTextDateColor
{
  if (conversationListLargeTextDateColor_once != -1)
    dispatch_once(&conversationListLargeTextDateColor_once, &__block_literal_global_78);
  return 0;
}

- (UIColor)conversationListLargeTextSummaryColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CKUITheme_conversationListLargeTextSummaryColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (conversationListLargeTextSummaryColor_once != -1)
    dispatch_once(&conversationListLargeTextSummaryColor_once, block);
  return (UIColor *)(id)conversationListLargeTextSummaryColor_sBehavior;
}

void __50__CKUITheme_conversationListLargeTextSummaryColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "conversationListSummaryColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)conversationListLargeTextSummaryColor_sBehavior;
  conversationListLargeTextSummaryColor_sBehavior = v1;

}

- (UIColor)conversationListGroupCountColor
{
  if (conversationListGroupCountColor_once != -1)
    dispatch_once(&conversationListGroupCountColor_once, &__block_literal_global_79);
  return 0;
}

- (UIColor)conversationListPinnedCellSelectorViewColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CKUITheme_conversationListPinnedCellSelectorViewColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (conversationListPinnedCellSelectorViewColor_once != -1)
    dispatch_once(&conversationListPinnedCellSelectorViewColor_once, block);
  return (UIColor *)(id)conversationListPinnedCellSelectorViewColor_sBehavior;
}

void __56__CKUITheme_conversationListPinnedCellSelectorViewColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "conversationListSelectedCellColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)conversationListPinnedCellSelectorViewColor_sBehavior;
  conversationListPinnedCellSelectorViewColor_sBehavior = v1;

}

- (UIColor)conversationListPinningOnboardingTitleColor
{
  if (conversationListPinningOnboardingTitleColor_once != -1)
    dispatch_once(&conversationListPinningOnboardingTitleColor_once, &__block_literal_global_80);
  return (UIColor *)(id)conversationListPinningOnboardingTitleColor_sBehavior;
}

void __56__CKUITheme_conversationListPinningOnboardingTitleColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListPinningOnboardingTitleColor_sBehavior;
  conversationListPinningOnboardingTitleColor_sBehavior = v0;

}

- (UIColor)conversationListPinningOnboardingSubtitleColor
{
  if (conversationListPinningOnboardingSubtitleColor_once != -1)
    dispatch_once(&conversationListPinningOnboardingSubtitleColor_once, &__block_literal_global_81);
  return (UIColor *)(id)conversationListPinningOnboardingSubtitleColor_sBehavior;
}

void __59__CKUITheme_conversationListPinningOnboardingSubtitleColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListPinningOnboardingSubtitleColor_sBehavior;
  conversationListPinningOnboardingSubtitleColor_sBehavior = v0;

}

- (UIColor)conversationListPinnedConversationNameColor
{
  if (conversationListPinnedConversationNameColor_once != -1)
    dispatch_once(&conversationListPinnedConversationNameColor_once, &__block_literal_global_82);
  return (UIColor *)(id)conversationListPinnedConversationNameColor_sBehavior;
}

void __56__CKUITheme_conversationListPinnedConversationNameColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListPinnedConversationNameColor_sBehavior;
  conversationListPinnedConversationNameColor_sBehavior = v0;

}

- (UIColor)conversationListPinnedConversationNameSelectedColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CKUITheme_conversationListPinnedConversationNameSelectedColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (conversationListPinnedConversationNameSelectedColor_once != -1)
    dispatch_once(&conversationListPinnedConversationNameSelectedColor_once, block);
  return (UIColor *)(id)conversationListPinnedConversationNameSelectedColor_sBehavior;
}

void __64__CKUITheme_conversationListPinnedConversationNameSelectedColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "conversationListPinnedConversationNameColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)conversationListPinnedConversationNameSelectedColor_sBehavior;
  conversationListPinnedConversationNameSelectedColor_sBehavior = v1;

}

- (UIColor)conversationListPinnedAdHocConversationRadiantShadowColor
{
  if (conversationListPinnedAdHocConversationRadiantShadowColor_once != -1)
    dispatch_once(&conversationListPinnedAdHocConversationRadiantShadowColor_once, &__block_literal_global_83);
  return (UIColor *)(id)conversationListPinnedAdHocConversationRadiantShadowColor_sBehavior;
}

void __70__CKUITheme_conversationListPinnedAdHocConversationRadiantShadowColor__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.31372549, 0.333333333, 0.360784314, 0.12);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dynamicColorWithLightColor:darkColor:", v4, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)conversationListPinnedAdHocConversationRadiantShadowColor_sBehavior;
  conversationListPinnedAdHocConversationRadiantShadowColor_sBehavior = v2;

}

- (UIColor)conversationListPinnedConversationFilteredByFocusIndicatorColor
{
  if (conversationListPinnedConversationFilteredByFocusIndicatorColor_once != -1)
    dispatch_once(&conversationListPinnedConversationFilteredByFocusIndicatorColor_once, &__block_literal_global_84);
  return (UIColor *)(id)conversationListPinnedConversationFilteredByFocusIndicatorColor_sBehavior;
}

void __76__CKUITheme_conversationListPinnedConversationFilteredByFocusIndicatorColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListPinnedConversationFilteredByFocusIndicatorColor_sBehavior;
  conversationListPinnedConversationFilteredByFocusIndicatorColor_sBehavior = v0;

}

- (UIColor)conversationListEmergencyColor
{
  if (conversationListEmergencyColor_once != -1)
    dispatch_once(&conversationListEmergencyColor_once, &__block_literal_global_85);
  return (UIColor *)(id)conversationListEmergencyColor_sBehavior;
}

void __43__CKUITheme_conversationListEmergencyColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemRedColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListEmergencyColor_sBehavior;
  conversationListEmergencyColor_sBehavior = v0;

}

- (UIColor)spotlightSearchBackgroundColor
{
  if (spotlightSearchBackgroundColor_once != -1)
    dispatch_once(&spotlightSearchBackgroundColor_once, &__block_literal_global_88);
  return (UIColor *)(id)spotlightSearchBackgroundColor_sBehavior;
}

void __43__CKUITheme_spotlightSearchBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)spotlightSearchBackgroundColor_sBehavior;
  spotlightSearchBackgroundColor_sBehavior = v0;

}

- (UIColor)spotlightSearchCellLabelColor
{
  if (spotlightSearchCellLabelColor_once != -1)
    dispatch_once(&spotlightSearchCellLabelColor_once, &__block_literal_global_89);
  return (UIColor *)(id)spotlightSearchCellLabelColor_sBehavior;
}

void __42__CKUITheme_spotlightSearchCellLabelColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)spotlightSearchCellLabelColor_sBehavior;
  spotlightSearchCellLabelColor_sBehavior = v0;

}

- (UIColor)spotlightSearchTitleLabelColor
{
  if (spotlightSearchTitleLabelColor_once != -1)
    dispatch_once(&spotlightSearchTitleLabelColor_once, &__block_literal_global_90);
  return (UIColor *)(id)spotlightSearchTitleLabelColor_sBehavior;
}

void __43__CKUITheme_spotlightSearchTitleLabelColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)spotlightSearchTitleLabelColor_sBehavior;
  spotlightSearchTitleLabelColor_sBehavior = v0;

}

- (UIColor)spotlightSearchCellHairlineColor
{
  if (spotlightSearchCellHairlineColor_once != -1)
    dispatch_once(&spotlightSearchCellHairlineColor_once, &__block_literal_global_91);
  return (UIColor *)(id)spotlightSearchCellHairlineColor_sBehavior;
}

void __45__CKUITheme_spotlightSearchCellHairlineColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)spotlightSearchCellHairlineColor_sBehavior;
  spotlightSearchCellHairlineColor_sBehavior = v0;

}

- (UIColor)spotlightAttachmentSecondaryColor
{
  if (spotlightAttachmentSecondaryColor_once != -1)
    dispatch_once(&spotlightAttachmentSecondaryColor_once, &__block_literal_global_92);
  return (UIColor *)(id)spotlightAttachmentSecondaryColor_sBehavior;
}

void __46__CKUITheme_spotlightAttachmentSecondaryColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)spotlightAttachmentSecondaryColor_sBehavior;
  spotlightAttachmentSecondaryColor_sBehavior = v0;

}

- (UIColor)spotlightSearchSegmentedControlBackgroundColor
{
  if (spotlightSearchSegmentedControlBackgroundColor_once != -1)
    dispatch_once(&spotlightSearchSegmentedControlBackgroundColor_once, &__block_literal_global_93);
  return (UIColor *)(id)spotlightSearchSegmentedControlBackgroundColor_sBehavior;
}

void __59__CKUITheme_spotlightSearchSegmentedControlBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)spotlightSearchSegmentedControlBackgroundColor_sBehavior;
  spotlightSearchSegmentedControlBackgroundColor_sBehavior = v0;

}

- (UIColor)progressBarTrackTintColor
{
  if (progressBarTrackTintColor_once != -1)
    dispatch_once(&progressBarTrackTintColor_once, &__block_literal_global_94);
  return 0;
}

- (UIColor)iosMacDetailsButtonColor
{
  if (iosMacDetailsButtonColor_once != -1)
    dispatch_once(&iosMacDetailsButtonColor_once, &__block_literal_global_95);
  return (UIColor *)(id)iosMacDetailsButtonColor_sBehavior;
}

void __37__CKUITheme_iosMacDetailsButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemBlueColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)iosMacDetailsButtonColor_sBehavior;
  iosMacDetailsButtonColor_sBehavior = v0;

}

- (UIColor)iosMacDetailsCellColor
{
  if (iosMacDetailsCellColor_once != -1)
    dispatch_once(&iosMacDetailsCellColor_once, &__block_literal_global_96);
  return (UIColor *)(id)iosMacDetailsCellColor_sBehavior;
}

void __35__CKUITheme_iosMacDetailsCellColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)iosMacDetailsCellColor_sBehavior;
  iosMacDetailsCellColor_sBehavior = v0;

}

- (UIColor)navBarGrayColor
{
  if (navBarGrayColor_once != -1)
    dispatch_once(&navBarGrayColor_once, &__block_literal_global_97);
  return (UIColor *)(id)navBarGrayColor_sBehavior;
}

void __28__CKUITheme_navBarGrayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKNavBarGrayColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)navBarGrayColor_sBehavior;
  navBarGrayColor_sBehavior = v0;

}

- (UIColor)transcriptTextColor
{
  void *v3;
  int v4;

  +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPrinting");

  if (v4)
    +[CKPrintController printTranscriptTextColor](CKPrintController, "printTranscriptTextColor");
  else
    -[CKUITheme _transcriptTextColor](self, "_transcriptTextColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIColor)transcriptBreadcrumpTextColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CKUITheme_transcriptBreadcrumpTextColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (transcriptBreadcrumpTextColor_once != -1)
    dispatch_once(&transcriptBreadcrumpTextColor_once, block);
  return (UIColor *)(id)transcriptBreadcrumpTextColor_sBehavior;
}

void __42__CKUITheme_transcriptBreadcrumpTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "transcriptTextColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)transcriptBreadcrumpTextColor_sBehavior;
  transcriptBreadcrumpTextColor_sBehavior = v1;

}

- (UIColor)expanseActivityViewIconTintColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CKUITheme_expanseActivityViewIconTintColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (expanseActivityViewIconTintColor_once != -1)
    dispatch_once(&expanseActivityViewIconTintColor_once, block);
  return (UIColor *)(id)expanseActivityViewIconTintColor_sBehavior;
}

void __45__CKUITheme_expanseActivityViewIconTintColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "primaryLabelColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)expanseActivityViewIconTintColor_sBehavior;
  expanseActivityViewIconTintColor_sBehavior = v1;

}

- (id)_transcriptTextColor
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (void *)_transcriptTextColor_sBehavior;
  if (_transcriptTextColor_sBehavior)
    v4 = _transcriptTextColor_sIsIncreaseContrastEnabled__transcriptTextColor == v2;
  else
    v4 = 0;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)_transcriptTextColor_sBehavior;
    _transcriptTextColor_sBehavior = v5;

    _transcriptTextColor_sIsIncreaseContrastEnabled__transcriptTextColor = v2;
    v3 = (void *)_transcriptTextColor_sBehavior;
  }
  return v3;
}

- (UIColor)transcriptAvailabilityColor
{
  int v2;
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (void *)transcriptAvailabilityColor_sBehavior;
  if (transcriptAvailabilityColor_sBehavior)
    v4 = transcriptAvailabilityColor_sIsIncreaseContrastEnabled_transcriptAvailabilityColor == v2;
  else
    v4 = 0;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemIndigoColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.8);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)transcriptAvailabilityColor_sBehavior;
    transcriptAvailabilityColor_sBehavior = v6;

    transcriptAvailabilityColor_sIsIncreaseContrastEnabled_transcriptAvailabilityColor = v2;
    v3 = (void *)transcriptAvailabilityColor_sBehavior;
  }
  return (UIColor *)v3;
}

- (UIColor)transcriptAvailabilityDeemphasizedColor
{
  int v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)transcriptAvailabilityDeemphasizedColor_sBehavior;
  if (transcriptAvailabilityDeemphasizedColor_sBehavior)
    v5 = transcriptAvailabilityDeemphasizedColor_sIsIncreaseContrastEnabled_transcriptAvailabilityDeemphasizedColor == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme transcriptTextColor](self, "transcriptTextColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)transcriptAvailabilityDeemphasizedColor_sBehavior;
    transcriptAvailabilityDeemphasizedColor_sBehavior = v6;

    transcriptAvailabilityDeemphasizedColor_sIsIncreaseContrastEnabled_transcriptAvailabilityDeemphasizedColor = v3;
    v4 = (void *)transcriptAvailabilityDeemphasizedColor_sBehavior;
  }
  return (UIColor *)v4;
}

- (UIColor)transcriptNicknameTextColor
{
  if (transcriptNicknameTextColor_once != -1)
    dispatch_once(&transcriptNicknameTextColor_once, &__block_literal_global_102);
  return (UIColor *)(id)transcriptNicknameTextColor_sBehavior;
}

void __40__CKUITheme_transcriptNicknameTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemBlueColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)transcriptNicknameTextColor_sBehavior;
  transcriptNicknameTextColor_sBehavior = v0;

}

- (id)_transcriptBigEmojiColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dynamicColorWithLightColor:darkColor:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIColor)transcriptBigEmojiColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CKUITheme_transcriptBigEmojiColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (transcriptBigEmojiColor_once != -1)
    dispatch_once(&transcriptBigEmojiColor_once, block);
  return (UIColor *)(id)transcriptBigEmojiColor_sBehavior;
}

void __36__CKUITheme_transcriptBigEmojiColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_transcriptBigEmojiColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)transcriptBigEmojiColor_sBehavior;
  transcriptBigEmojiColor_sBehavior = v1;

}

- (UIColor)transcriptDeemphasizedTextColor
{
  int v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)transcriptDeemphasizedTextColor_sBehavior;
  if (transcriptDeemphasizedTextColor_sBehavior)
    v5 = transcriptDeemphasizedTextColor_sIsIncreaseContrastEnabled_transcriptDeemphasizedTextColor == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme grayTextColor](self, "grayTextColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)transcriptDeemphasizedTextColor_sBehavior;
    transcriptDeemphasizedTextColor_sBehavior = v6;

    transcriptDeemphasizedTextColor_sIsIncreaseContrastEnabled_transcriptDeemphasizedTextColor = v3;
    v4 = (void *)transcriptDeemphasizedTextColor_sBehavior;
  }
  return (UIColor *)v4;
}

- (int64_t)transcriptLoadingIndicatorStyle
{
  if (transcriptLoadingIndicatorStyle_once != -1)
    dispatch_once(&transcriptLoadingIndicatorStyle_once, &__block_literal_global_103);
  if (transcriptLoadingIndicatorStyle_sBehavior)
    return 100;
  else
    return 0;
}

void __44__CKUITheme_transcriptLoadingIndicatorStyle__block_invoke()
{
  transcriptLoadingIndicatorStyle_sBehavior = 1;
}

- (UIColor)replyLineColor
{
  if (replyLineColor_once != -1)
    dispatch_once(&replyLineColor_once, &__block_literal_global_104);
  return (UIColor *)(id)replyLineColor_sBehavior;
}

void __27__CKUITheme_replyLineColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKReplyLineColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)replyLineColor_sBehavior;
  replyLineColor_sBehavior = v0;

}

- (UIColor)statusTextColor
{
  if (statusTextColor_once != -1)
    dispatch_once(&statusTextColor_once, &__block_literal_global_107);
  return (UIColor *)(id)statusTextColor_sBehavior;
}

void __28__CKUITheme_statusTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKStatusTextColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)statusTextColor_sBehavior;
  statusTextColor_sBehavior = v0;

}

- (UIColor)statusFailureTextColor
{
  if (statusFailureTextColor_once != -1)
    dispatch_once(&statusFailureTextColor_once, &__block_literal_global_110);
  return (UIColor *)(id)statusFailureTextColor_sBehavior;
}

void __35__CKUITheme_statusFailureTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKStatusFailureTextColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)statusFailureTextColor_sBehavior;
  statusFailureTextColor_sBehavior = v0;

}

- (UIColor)transcriptReplayTextColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CKUITheme_transcriptReplayTextColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (transcriptReplayTextColor_once != -1)
    dispatch_once(&transcriptReplayTextColor_once, block);
  return (UIColor *)(id)transcriptReplayTextColor_sBehavior;
}

void __38__CKUITheme_transcriptReplayTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "appTintColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)transcriptReplayTextColor_sBehavior;
  transcriptReplayTextColor_sBehavior = v1;

}

- (UIColor)messageStatusChatItemGrayColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CKUITheme_messageStatusChatItemGrayColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (messageStatusChatItemGrayColor_once != -1)
    dispatch_once(&messageStatusChatItemGrayColor_once, block);
  return (UIColor *)(id)messageStatusChatItemGrayColor_sBehavior;
}

void __43__CKUITheme_messageStatusChatItemGrayColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "grayTextColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)messageStatusChatItemGrayColor_sBehavior;
  messageStatusChatItemGrayColor_sBehavior = v1;

}

id __31__CKUITheme_gray_balloonColors__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CEA478];
  v3 = a2;
  objc_msgSend(v2, "secondarySystemFillColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedColorWithTraitCollection:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedColorWithTraitCollection:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "colorByBlendingWithColor:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)opaque_orb_gray_balloonColors
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CKUITheme_opaque_orb_gray_balloonColors__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (opaque_orb_gray_balloonColors_once != -1)
    dispatch_once(&opaque_orb_gray_balloonColors_once, block);
  return (id)opaque_orb_gray_balloonColors_sBehavior;
}

void __42__CKUITheme_opaque_orb_gray_balloonColors__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "gray_balloonColors");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)opaque_orb_gray_balloonColors_sBehavior;
  opaque_orb_gray_balloonColors_sBehavior = v1;

}

- (id)green_balloonColors
{
  int v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (void *)green_balloonColors_sBehavior;
  if (green_balloonColors_sBehavior)
    v4 = green_balloonColors_sIsIncreaseContrastEnabled_green_balloonColors == v2;
  else
    v4 = 0;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKGreenBalloonColor0"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKGreenBalloonColor1"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)green_balloonColors_sBehavior;
    green_balloonColors_sBehavior = v7;

    green_balloonColors_sIsIncreaseContrastEnabled_green_balloonColors = v2;
    v3 = (void *)green_balloonColors_sBehavior;
  }
  return v3;
}

- (id)blue_balloonColors
{
  if (blue_balloonColors_once != -1)
    dispatch_once(&blue_balloonColors_once, &__block_literal_global_121);
  return (id)blue_balloonColors_sBehavior;
}

void __31__CKUITheme_blue_balloonColors__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKBlueBalloonColor0"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKBlueBalloonColor1"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)blue_balloonColors_sBehavior;
  blue_balloonColors_sBehavior = v2;

}

- (id)siri_balloonColors
{
  if (siri_balloonColors_once != -1)
    dispatch_once(&siri_balloonColors_once, &__block_literal_global_126);
  return (id)siri_balloonColors_sBehavior;
}

void __31__CKUITheme_siri_balloonColors__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)siri_balloonColors_sBehavior;
  siri_balloonColors_sBehavior = v1;

}

- (id)red_balloonColors
{
  if (red_balloonColors_once != -1)
    dispatch_once(&red_balloonColors_once, &__block_literal_global_127);
  return (id)red_balloonColors_sBehavior;
}

void __30__CKUITheme_red_balloonColors__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)red_balloonColors_sBehavior;
  red_balloonColors_sBehavior = v1;

}

- (id)white_balloonColors
{
  if (white_balloonColors_once != -1)
    dispatch_once(&white_balloonColors_once, &__block_literal_global_128);
  return (id)white_balloonColors_sBehavior;
}

void __32__CKUITheme_white_balloonColors__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)white_balloonColors_sBehavior;
  white_balloonColors_sBehavior = v1;

}

- (id)black_balloonColors
{
  if (black_balloonColors_once != -1)
    dispatch_once(&black_balloonColors_once, &__block_literal_global_129);
  return (id)black_balloonColors_sBehavior;
}

void __32__CKUITheme_black_balloonColors__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.188235294, 0.188235294, 0.196078431, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)black_balloonColors_sBehavior;
  black_balloonColors_sBehavior = v1;

}

- (id)business_balloonColors
{
  if (business_balloonColors_once != -1)
    dispatch_once(&business_balloonColors_once, &__block_literal_global_130);
  return (id)business_balloonColors_sBehavior;
}

void __35__CKUITheme_business_balloonColors__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKBusinessGrayBalloonColor0"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKBusinessGrayBalloonColor1"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)business_balloonColors_sBehavior;
  business_balloonColors_sBehavior = v2;

}

- (id)multiway_balloonColors
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CKUITheme_multiway_balloonColors__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (multiway_balloonColors_once != -1)
    dispatch_once(&multiway_balloonColors_once, block);
  return (id)multiway_balloonColors_sBehavior;
}

void __35__CKUITheme_multiway_balloonColors__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(*(id *)(a1 + 32), "multiwayBalloonBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "gray_balloonColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dynamicColorWithLightColor:darkColor:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)multiway_balloonColors_sBehavior;
  multiway_balloonColors_sBehavior = v7;

}

- (id)background_balloonColors
{
  if (background_balloonColors_once != -1)
    dispatch_once(&background_balloonColors_once, &__block_literal_global_135);
  return (id)background_balloonColors_sBehavior;
}

void __37__CKUITheme_background_balloonColors__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "_ckSystemBackgroundColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)background_balloonColors_sBehavior;
  background_balloonColors_sBehavior = v1;

}

- (id)reply_gray_balloonColors
{
  if (reply_gray_balloonColors_once != -1)
    dispatch_once(&reply_gray_balloonColors_once, &__block_literal_global_136);
  return (id)reply_gray_balloonColors_sBehavior;
}

void __37__CKUITheme_reply_gray_balloonColors__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKReplyGrayBalloonColor"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)reply_gray_balloonColors_sBehavior;
  reply_gray_balloonColors_sBehavior = v1;

}

- (id)message_editing_black_balloonColors
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CKUITheme_message_editing_black_balloonColors__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (message_editing_black_balloonColors_once != -1)
    dispatch_once(&message_editing_black_balloonColors_once, block);
  return (id)message_editing_black_balloonColors_sBehavior;
}

void __48__CKUITheme_message_editing_black_balloonColors__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "transcriptBackgroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)message_editing_black_balloonColors_sBehavior;
  message_editing_black_balloonColors_sBehavior = v2;

}

- (id)reply_blue_balloonColors
{
  if (reply_blue_balloonColors_once != -1)
    dispatch_once(&reply_blue_balloonColors_once, &__block_literal_global_139);
  return (id)reply_blue_balloonColors_sBehavior;
}

void __37__CKUITheme_reply_blue_balloonColors__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKReplyBlueBalloonColor"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)reply_blue_balloonColors_sBehavior;
  reply_blue_balloonColors_sBehavior = v1;

}

- (id)reply_green_balloonColors
{
  if (reply_green_balloonColors_once != -1)
    dispatch_once(&reply_green_balloonColors_once, &__block_literal_global_142);
  return (id)reply_green_balloonColors_sBehavior;
}

void __38__CKUITheme_reply_green_balloonColors__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKReplyGreenBalloonColor"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)reply_green_balloonColors_sBehavior;
  reply_green_balloonColors_sBehavior = v1;

}

- (id)stewie_balloonColors
{
  if (stewie_balloonColors_once != -1)
    dispatch_once(&stewie_balloonColors_once, &__block_literal_global_145);
  return (id)stewie_balloonColors_sBehavior;
}

void __33__CKUITheme_stewie_balloonColors__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKEmergencyGrayBalloonColor0"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKEmergencyGrayBalloonColor1"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)stewie_balloonColors_sBehavior;
  stewie_balloonColors_sBehavior = v2;

}

- (id)pending_blue_balloonColors
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CKUITheme_pending_blue_balloonColors__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (pending_blue_balloonColors_once != -1)
    dispatch_once(&pending_blue_balloonColors_once, block);
  return (id)pending_blue_balloonColors_sBehavior;
}

void __39__CKUITheme_pending_blue_balloonColors__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "transcriptBackgroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)pending_blue_balloonColors_sBehavior;
  pending_blue_balloonColors_sBehavior = v2;

}

- (UIColor)transcriptTypingIndicatorBubbleColor
{
  if (transcriptTypingIndicatorBubbleColor_once != -1)
    dispatch_once(&transcriptTypingIndicatorBubbleColor_once, &__block_literal_global_150);
  return (UIColor *)(id)transcriptTypingIndicatorBubbleColor_sBehavior;
}

void __49__CKUITheme_transcriptTypingIndicatorBubbleColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_151);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)transcriptTypingIndicatorBubbleColor_sBehavior;
  transcriptTypingIndicatorBubbleColor_sBehavior = v0;

}

id __49__CKUITheme_transcriptTypingIndicatorBubbleColor__block_invoke_2(uint64_t a1, void *a2)
{
  double v2;
  double v3;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.149019608;
    v3 = 0.160784314;
  }
  else
  {
    v2 = 0.898039216;
    v3 = 0.917647059;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v2, v2, v3, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIColor)transcriptTypingIndicatorDotColor
{
  if (transcriptTypingIndicatorDotColor_once != -1)
    dispatch_once(&transcriptTypingIndicatorDotColor_once, &__block_literal_global_152);
  return (UIColor *)(id)transcriptTypingIndicatorDotColor_sBehavior;
}

void __46__CKUITheme_transcriptTypingIndicatorDotColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)transcriptTypingIndicatorDotColor_sBehavior;
  transcriptTypingIndicatorDotColor_sBehavior = v0;

}

- (double)transcriptTypingIndicatorOpacity
{
  if (transcriptTypingIndicatorOpacity_once != -1)
    dispatch_once(&transcriptTypingIndicatorOpacity_once, &__block_literal_global_153);
  return *(double *)&transcriptTypingIndicatorOpacity_sBehavior;
}

void __45__CKUITheme_transcriptTypingIndicatorOpacity__block_invoke()
{
  transcriptTypingIndicatorOpacity_sBehavior = 0x3FF0000000000000;
}

- (UIColor)selectedConversationListTypingIndicatorBubbleColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CKUITheme_selectedConversationListTypingIndicatorBubbleColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (selectedConversationListTypingIndicatorBubbleColor_once != -1)
    dispatch_once(&selectedConversationListTypingIndicatorBubbleColor_once, block);
  return (UIColor *)(id)selectedConversationListTypingIndicatorBubbleColor_sBehavior;
}

void __63__CKUITheme_selectedConversationListTypingIndicatorBubbleColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "unselectedConversationListTypingIndicatorBubbleColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)selectedConversationListTypingIndicatorBubbleColor_sBehavior;
  selectedConversationListTypingIndicatorBubbleColor_sBehavior = v1;

}

- (UIColor)selectedConversationListTypingIndicatorDotColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CKUITheme_selectedConversationListTypingIndicatorDotColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (selectedConversationListTypingIndicatorDotColor_once != -1)
    dispatch_once(&selectedConversationListTypingIndicatorDotColor_once, block);
  return (UIColor *)(id)selectedConversationListTypingIndicatorDotColor_sBehavior;
}

void __60__CKUITheme_selectedConversationListTypingIndicatorDotColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "unselectedConversationListTypingIndicatorDotColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)selectedConversationListTypingIndicatorDotColor_sBehavior;
  selectedConversationListTypingIndicatorDotColor_sBehavior = v1;

}

- (UIColor)unselectedConversationListTypingIndicatorBubbleColor
{
  if (unselectedConversationListTypingIndicatorBubbleColor_once != -1)
    dispatch_once(&unselectedConversationListTypingIndicatorBubbleColor_once, &__block_literal_global_154);
  return (UIColor *)(id)unselectedConversationListTypingIndicatorBubbleColor_sBehavior;
}

void __65__CKUITheme_unselectedConversationListTypingIndicatorBubbleColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_155);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)unselectedConversationListTypingIndicatorBubbleColor_sBehavior;
  unselectedConversationListTypingIndicatorBubbleColor_sBehavior = v0;

}

id __65__CKUITheme_unselectedConversationListTypingIndicatorBubbleColor__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_msgSend(a2, "userInterfaceStyle");
  if ((unint64_t)v2 < 2)
  {
    v3 = (void *)MEMORY[0x1E0CEA478];
    v4 = 0.894117647;
    v5 = 0.901960784;
LABEL_5:
    objc_msgSend(v3, "colorWithRed:green:blue:alpha:", v4, v4, v5, 1.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (v2 == (void *)2)
  {
    v3 = (void *)MEMORY[0x1E0CEA478];
    v4 = 0.168627451;
    v5 = 0.180392157;
    goto LABEL_5;
  }
  return v2;
}

- (UIColor)unselectedConversationListTypingIndicatorDotColor
{
  if (unselectedConversationListTypingIndicatorDotColor_once != -1)
    dispatch_once(&unselectedConversationListTypingIndicatorDotColor_once, &__block_literal_global_156);
  return (UIColor *)(id)unselectedConversationListTypingIndicatorDotColor_sBehavior;
}

void __62__CKUITheme_unselectedConversationListTypingIndicatorDotColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_157);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)unselectedConversationListTypingIndicatorDotColor_sBehavior;
  unselectedConversationListTypingIndicatorDotColor_sBehavior = v0;

}

id __62__CKUITheme_unselectedConversationListTypingIndicatorDotColor__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = (void *)objc_msgSend(a2, "userInterfaceStyle");
  if ((unint64_t)v2 < 2)
  {
    v3 = (void *)MEMORY[0x1E0CEA478];
    v4 = 0.498039216;
    v5 = 0.517647059;
    v6 = 1.0;
    v7 = 0.498039216;
LABEL_5:
    objc_msgSend(v3, "colorWithRed:green:blue:alpha:", v4, v7, v5, v6);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (v2 == (void *)2)
  {
    v3 = (void *)MEMORY[0x1E0CEA478];
    v4 = 0.619607843;
    v6 = 1.0;
    v7 = 0.619607843;
    v5 = 0.619607843;
    goto LABEL_5;
  }
  return v2;
}

- (UIColor)autoloopMuteButtonColor
{
  if (autoloopMuteButtonColor_once != -1)
    dispatch_once(&autoloopMuteButtonColor_once, &__block_literal_global_158);
  return (UIColor *)(id)autoloopMuteButtonColor_sBehavior;
}

void __36__CKUITheme_autoloopMuteButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)autoloopMuteButtonColor_sBehavior;
  autoloopMuteButtonColor_sBehavior = v0;

}

- (UIColor)multiwayBalloonBackgroundColor
{
  if (multiwayBalloonBackgroundColor_once != -1)
    dispatch_once(&multiwayBalloonBackgroundColor_once, &__block_literal_global_159);
  return (UIColor *)(id)multiwayBalloonBackgroundColor_sBehavior;
}

void __43__CKUITheme_multiwayBalloonBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.407843137, 0.435294118, 0.470588235, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)multiwayBalloonBackgroundColor_sBehavior;
  multiwayBalloonBackgroundColor_sBehavior = v0;

}

- (UIColor)multiwayTitleTextColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CKUITheme_multiwayTitleTextColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (multiwayTitleTextColor_once != -1)
    dispatch_once(&multiwayTitleTextColor_once, block);
  return (UIColor *)(id)multiwayTitleTextColor_sBehavior;
}

void __35__CKUITheme_multiwayTitleTextColor__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(*(id *)(a1 + 32), "primaryLabelColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_ckColor:forUserInterfaceStyle:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)multiwayTitleTextColor_sBehavior;
  multiwayTitleTextColor_sBehavior = v2;

}

- (UIColor)multiwayCaptionTextColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CKUITheme_multiwayCaptionTextColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (multiwayCaptionTextColor_once != -1)
    dispatch_once(&multiwayCaptionTextColor_once, block);
  return (UIColor *)(id)multiwayCaptionTextColor_sBehavior;
}

void __37__CKUITheme_multiwayCaptionTextColor__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(*(id *)(a1 + 32), "secondaryLabelColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_ckColor:forUserInterfaceStyle:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)multiwayCaptionTextColor_sBehavior;
  multiwayCaptionTextColor_sBehavior = v2;

}

- (UIColor)sharePlayTitleTextColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CKUITheme_sharePlayTitleTextColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (sharePlayTitleTextColor_once != -1)
    dispatch_once(&sharePlayTitleTextColor_once, block);
  return (UIColor *)(id)sharePlayTitleTextColor_sBehavior;
}

void __36__CKUITheme_sharePlayTitleTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "primaryLabelColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharePlayTitleTextColor_sBehavior;
  sharePlayTitleTextColor_sBehavior = v1;

}

- (UIColor)sharePlayCaptionTextColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CKUITheme_sharePlayCaptionTextColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (sharePlayCaptionTextColor_once != -1)
    dispatch_once(&sharePlayCaptionTextColor_once, block);
  return (UIColor *)(id)sharePlayCaptionTextColor_sBehavior;
}

void __38__CKUITheme_sharePlayCaptionTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "secondaryLabelColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharePlayCaptionTextColor_sBehavior;
  sharePlayCaptionTextColor_sBehavior = v1;

}

- (UIColor)multiwayButtonColor
{
  if (multiwayButtonColor_once != -1)
    dispatch_once(&multiwayButtonColor_once, &__block_literal_global_160);
  return (UIColor *)(id)multiwayButtonColor_sBehavior;
}

void __32__CKUITheme_multiwayButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)multiwayButtonColor_sBehavior;
  multiwayButtonColor_sBehavior = v0;

}

- (UIColor)jellyfishMuteButtonColor
{
  if (jellyfishMuteButtonColor_once != -1)
    dispatch_once(&jellyfishMuteButtonColor_once, &__block_literal_global_161);
  return (UIColor *)(id)jellyfishMuteButtonColor_sBehavior;
}

void __37__CKUITheme_jellyfishMuteButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)jellyfishMuteButtonColor_sBehavior;
  jellyfishMuteButtonColor_sBehavior = v0;

}

- (id)unfilledBalloonColorForColorType:(char)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case -1:
      -[CKUITheme gray_unfilledBalloonColor](self, "gray_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      -[CKUITheme green_unfilledBalloonColor](self, "green_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[CKUITheme blue_unfilledBalloonColor](self, "blue_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[CKUITheme siri_unfilledBalloonColor](self, "siri_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[CKUITheme red_unfilledBalloonColor](self, "red_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[CKUITheme white_unfilledBalloonColor](self, "white_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[CKUITheme black_unfilledBalloonColor](self, "black_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[CKUITheme business_unfilledBalloonColor](self, "business_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[CKUITheme multiway_unfilledBalloonColor](self, "multiway_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[CKUITheme background_unfilledBalloonColor](self, "background_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[CKUITheme reply_gray_unfilledBalloonColor](self, "reply_gray_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[CKUITheme reply_blue_unfilledBalloonColor](self, "reply_blue_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[CKUITheme reply_green_unfilledBalloonColor](self, "reply_green_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[CKUITheme stewie_unfilledBalloonColor](self, "stewie_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[CKUITheme message_editing_black_unfilledBalloonColor](self, "message_editing_black_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[CKUITheme opaque_orb_gray_unfilledBalloonColor](self, "opaque_orb_gray_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      -[CKUITheme pending_blue_unfilledBalloonColor](self, "pending_blue_unfilledBalloonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)gray_unfilledBalloonColor
{
  if (gray_unfilledBalloonColor_once != -1)
    dispatch_once(&gray_unfilledBalloonColor_once, &__block_literal_global_162);
  return (id)gray_unfilledBalloonColor_sBehavior;
}

void __38__CKUITheme_gray_unfilledBalloonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "_ckSecondarySystemBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gray_unfilledBalloonColor_sBehavior;
  gray_unfilledBalloonColor_sBehavior = v0;

}

- (id)opaque_orb_gray_unfilledBalloonColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CKUITheme_opaque_orb_gray_unfilledBalloonColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (opaque_orb_gray_unfilledBalloonColor_once != -1)
    dispatch_once(&opaque_orb_gray_unfilledBalloonColor_once, block);
  return (id)opaque_orb_gray_unfilledBalloonColor_sBehavior;
}

void __49__CKUITheme_opaque_orb_gray_unfilledBalloonColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "gray_unfilledBalloonColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)opaque_orb_gray_unfilledBalloonColor_sBehavior;
  opaque_orb_gray_unfilledBalloonColor_sBehavior = v1;

}

- (id)green_unfilledBalloonColor
{
  int v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)green_unfilledBalloonColor_sBehavior;
  if (green_unfilledBalloonColor_sBehavior)
    v5 = green_unfilledBalloonColor_sIsIncreaseContrastEnabled_green_unfilledBalloonColor == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme green_balloonColors](self, "green_balloonColors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)green_unfilledBalloonColor_sBehavior;
    green_unfilledBalloonColor_sBehavior = v7;

    green_unfilledBalloonColor_sIsIncreaseContrastEnabled_green_unfilledBalloonColor = v3;
    v4 = (void *)green_unfilledBalloonColor_sBehavior;
  }
  return v4;
}

- (id)blue_unfilledBalloonColor
{
  int v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)blue_unfilledBalloonColor_sBehavior;
  if (blue_unfilledBalloonColor_sBehavior)
    v5 = blue_unfilledBalloonColor_sIsIncreaseContrastEnabled_blue_unfilledBalloonColor == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme blue_balloonColors](self, "blue_balloonColors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)blue_unfilledBalloonColor_sBehavior;
    blue_unfilledBalloonColor_sBehavior = v7;

    blue_unfilledBalloonColor_sIsIncreaseContrastEnabled_blue_unfilledBalloonColor = v3;
    v4 = (void *)blue_unfilledBalloonColor_sBehavior;
  }
  return v4;
}

- (id)siri_unfilledBalloonColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CKUITheme_siri_unfilledBalloonColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (siri_unfilledBalloonColor_once != -1)
    dispatch_once(&siri_unfilledBalloonColor_once, block);
  return (id)siri_unfilledBalloonColor_sBehavior;
}

void __38__CKUITheme_siri_unfilledBalloonColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "siri_balloonColors");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)siri_unfilledBalloonColor_sBehavior;
  siri_unfilledBalloonColor_sBehavior = v1;

}

- (id)red_unfilledBalloonColor
{
  if (red_unfilledBalloonColor_once != -1)
    dispatch_once(&red_unfilledBalloonColor_once, &__block_literal_global_163);
  return (id)red_unfilledBalloonColor_sBehavior;
}

void __37__CKUITheme_red_unfilledBalloonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)red_unfilledBalloonColor_sBehavior;
  red_unfilledBalloonColor_sBehavior = v0;

}

- (id)white_unfilledBalloonColor
{
  if (white_unfilledBalloonColor_once != -1)
    dispatch_once(&white_unfilledBalloonColor_once, &__block_literal_global_164);
  return (id)white_unfilledBalloonColor_sBehavior;
}

void __39__CKUITheme_white_unfilledBalloonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)white_unfilledBalloonColor_sBehavior;
  white_unfilledBalloonColor_sBehavior = v0;

}

- (id)black_unfilledBalloonColor
{
  if (black_unfilledBalloonColor_once != -1)
    dispatch_once(&black_unfilledBalloonColor_once, &__block_literal_global_165);
  return (id)black_unfilledBalloonColor_sBehavior;
}

void __39__CKUITheme_black_unfilledBalloonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)black_unfilledBalloonColor_sBehavior;
  black_unfilledBalloonColor_sBehavior = v0;

}

- (id)business_unfilledBalloonColor
{
  if (business_unfilledBalloonColor_once != -1)
    dispatch_once(&business_unfilledBalloonColor_once, &__block_literal_global_166);
  return (id)business_unfilledBalloonColor_sBehavior;
}

void __42__CKUITheme_business_unfilledBalloonColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.300000012);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)business_unfilledBalloonColor_sBehavior;
  business_unfilledBalloonColor_sBehavior = v0;

}

- (id)multiway_unfilledBalloonColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CKUITheme_multiway_unfilledBalloonColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (multiway_unfilledBalloonColor_once != -1)
    dispatch_once(&multiway_unfilledBalloonColor_once, block);
  return (id)multiway_unfilledBalloonColor_sBehavior;
}

void __42__CKUITheme_multiway_unfilledBalloonColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "multiwayBalloonBackgroundColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)multiway_unfilledBalloonColor_sBehavior;
  multiway_unfilledBalloonColor_sBehavior = v1;

}

- (id)background_unfilledBalloonColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CKUITheme_background_unfilledBalloonColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (background_unfilledBalloonColor_once != -1)
    dispatch_once(&background_unfilledBalloonColor_once, block);
  return (id)background_unfilledBalloonColor_sBehavior;
}

void __44__CKUITheme_background_unfilledBalloonColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "background_balloonColors");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)background_unfilledBalloonColor_sBehavior;
  background_unfilledBalloonColor_sBehavior = v1;

}

- (id)message_editing_black_unfilledBalloonColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CKUITheme_message_editing_black_unfilledBalloonColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (message_editing_black_unfilledBalloonColor_once != -1)
    dispatch_once(&message_editing_black_unfilledBalloonColor_once, block);
  return (id)message_editing_black_unfilledBalloonColor_sBehavior;
}

void __55__CKUITheme_message_editing_black_unfilledBalloonColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "entryFieldBorderColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)message_editing_black_unfilledBalloonColor_sBehavior;
  message_editing_black_unfilledBalloonColor_sBehavior = v1;

}

- (id)reply_gray_unfilledBalloonColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CKUITheme_reply_gray_unfilledBalloonColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (reply_gray_unfilledBalloonColor_once != -1)
    dispatch_once(&reply_gray_unfilledBalloonColor_once, block);
  return (id)reply_gray_unfilledBalloonColor_sBehavior;
}

void __44__CKUITheme_reply_gray_unfilledBalloonColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "reply_gray_balloonColors");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)reply_gray_unfilledBalloonColor_sBehavior;
  reply_gray_unfilledBalloonColor_sBehavior = v1;

}

- (id)reply_blue_unfilledBalloonColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CKUITheme_reply_blue_unfilledBalloonColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (reply_blue_unfilledBalloonColor_once != -1)
    dispatch_once(&reply_blue_unfilledBalloonColor_once, block);
  return (id)reply_blue_unfilledBalloonColor_sBehavior;
}

void __44__CKUITheme_reply_blue_unfilledBalloonColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "reply_blue_balloonColors");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)reply_blue_unfilledBalloonColor_sBehavior;
  reply_blue_unfilledBalloonColor_sBehavior = v1;

}

- (id)reply_green_unfilledBalloonColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CKUITheme_reply_green_unfilledBalloonColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (reply_green_unfilledBalloonColor_once != -1)
    dispatch_once(&reply_green_unfilledBalloonColor_once, block);
  return (id)reply_green_unfilledBalloonColor_sBehavior;
}

void __45__CKUITheme_reply_green_unfilledBalloonColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "reply_green_balloonColors");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)reply_green_unfilledBalloonColor_sBehavior;
  reply_green_unfilledBalloonColor_sBehavior = v1;

}

- (id)stewie_unfilledBalloonColor
{
  if (stewie_unfilledBalloonColor_once != -1)
    dispatch_once(&stewie_unfilledBalloonColor_once, &__block_literal_global_167);
  return (id)stewie_unfilledBalloonColor_sBehavior;
}

void __40__CKUITheme_stewie_unfilledBalloonColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.300000012);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stewie_unfilledBalloonColor_sBehavior;
  stewie_unfilledBalloonColor_sBehavior = v0;

}

- (id)pending_blue_unfilledBalloonColor
{
  if (pending_blue_unfilledBalloonColor_once != -1)
    dispatch_once(&pending_blue_unfilledBalloonColor_once, &__block_literal_global_168);
  return (id)pending_blue_unfilledBalloonColor_sBehavior;
}

void __46__CKUITheme_pending_blue_unfilledBalloonColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKBlueBalloonColor1"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.400000006);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pending_blue_unfilledBalloonColor_sBehavior;
  pending_blue_unfilledBalloonColor_sBehavior = v0;

}

- (id)balloonTextColorInPrintingPathForColorType:(char)a3
{
  uint64_t v3;
  void *v5;
  int v6;

  v3 = a3;
  +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPrinting");

  if (v6)
    +[CKPrintController printBalloonTextColor](CKPrintController, "printBalloonTextColor");
  else
    -[CKUITheme balloonTextColorForColorType:](self, "balloonTextColorForColorType:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)balloonTextColorForColorType:(char)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case -1:
      -[CKUITheme gray_balloonTextColor](self, "gray_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      -[CKUITheme green_balloonTextColor](self, "green_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[CKUITheme blue_balloonTextColor](self, "blue_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[CKUITheme siri_balloonTextColor](self, "siri_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[CKUITheme red_balloonTextColor](self, "red_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[CKUITheme white_balloonTextColor](self, "white_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[CKUITheme black_balloonTextColor](self, "black_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[CKUITheme business_balloonTextColor](self, "business_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[CKUITheme multiway_balloonTextColor](self, "multiway_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[CKUITheme background_balloonTextColor](self, "background_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[CKUITheme reply_gray_balloonTextColor](self, "reply_gray_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[CKUITheme reply_blue_balloonTextColor](self, "reply_blue_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[CKUITheme reply_green_balloonTextColor](self, "reply_green_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[CKUITheme stewie_balloonTextColor](self, "stewie_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[CKUITheme message_editing_black_balloonTextColor](self, "message_editing_black_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[CKUITheme opaque_orb_gray_balloonTextColor](self, "opaque_orb_gray_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      -[CKUITheme pending_blue_balloonTextColor](self, "pending_blue_balloonTextColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)gray_balloonTextColor
{
  if (gray_balloonTextColor_once != -1)
    dispatch_once(&gray_balloonTextColor_once, &__block_literal_global_169);
  return (id)gray_balloonTextColor_sBehavior;
}

void __34__CKUITheme_gray_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gray_balloonTextColor_sBehavior;
  gray_balloonTextColor_sBehavior = v0;

}

- (id)opaque_orb_gray_balloonTextColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CKUITheme_opaque_orb_gray_balloonTextColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (opaque_orb_gray_balloonTextColor_once != -1)
    dispatch_once(&opaque_orb_gray_balloonTextColor_once, block);
  return (id)opaque_orb_gray_balloonTextColor_sBehavior;
}

void __45__CKUITheme_opaque_orb_gray_balloonTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "gray_balloonTextColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)opaque_orb_gray_balloonTextColor_sBehavior;
  opaque_orb_gray_balloonTextColor_sBehavior = v1;

}

- (id)green_balloonTextColor
{
  if (green_balloonTextColor_once != -1)
    dispatch_once(&green_balloonTextColor_once, &__block_literal_global_170);
  return (id)green_balloonTextColor_sBehavior;
}

void __35__CKUITheme_green_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)green_balloonTextColor_sBehavior;
  green_balloonTextColor_sBehavior = v0;

}

- (id)blue_balloonTextColor
{
  if (blue_balloonTextColor_once != -1)
    dispatch_once(&blue_balloonTextColor_once, &__block_literal_global_171);
  return (id)blue_balloonTextColor_sBehavior;
}

void __34__CKUITheme_blue_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)blue_balloonTextColor_sBehavior;
  blue_balloonTextColor_sBehavior = v0;

}

- (id)siri_balloonTextColor
{
  if (siri_balloonTextColor_once != -1)
    dispatch_once(&siri_balloonTextColor_once, &__block_literal_global_172);
  return (id)siri_balloonTextColor_sBehavior;
}

void __34__CKUITheme_siri_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)siri_balloonTextColor_sBehavior;
  siri_balloonTextColor_sBehavior = v0;

}

- (id)red_balloonTextColor
{
  if (red_balloonTextColor_once != -1)
    dispatch_once(&red_balloonTextColor_once, &__block_literal_global_173);
  return (id)red_balloonTextColor_sBehavior;
}

void __33__CKUITheme_red_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)red_balloonTextColor_sBehavior;
  red_balloonTextColor_sBehavior = v0;

}

- (id)white_balloonTextColor
{
  if (white_balloonTextColor_once != -1)
    dispatch_once(&white_balloonTextColor_once, &__block_literal_global_174);
  return (id)white_balloonTextColor_sBehavior;
}

void __35__CKUITheme_white_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)white_balloonTextColor_sBehavior;
  white_balloonTextColor_sBehavior = v0;

}

- (id)black_balloonTextColor
{
  if (black_balloonTextColor_once != -1)
    dispatch_once(&black_balloonTextColor_once, &__block_literal_global_175);
  return (id)black_balloonTextColor_sBehavior;
}

void __35__CKUITheme_black_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)black_balloonTextColor_sBehavior;
  black_balloonTextColor_sBehavior = v0;

}

- (id)business_balloonTextColor
{
  if (business_balloonTextColor_once != -1)
    dispatch_once(&business_balloonTextColor_once, &__block_literal_global_176);
  return (id)business_balloonTextColor_sBehavior;
}

void __38__CKUITheme_business_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)business_balloonTextColor_sBehavior;
  business_balloonTextColor_sBehavior = v0;

}

- (id)multiway_balloonTextColor
{
  if (multiway_balloonTextColor_once != -1)
    dispatch_once(&multiway_balloonTextColor_once, &__block_literal_global_177);
  return (id)multiway_balloonTextColor_sBehavior;
}

void __38__CKUITheme_multiway_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)multiway_balloonTextColor_sBehavior;
  multiway_balloonTextColor_sBehavior = v0;

}

- (id)background_balloonTextColor
{
  if (background_balloonTextColor_once != -1)
    dispatch_once(&background_balloonTextColor_once, &__block_literal_global_178);
  return (id)background_balloonTextColor_sBehavior;
}

void __40__CKUITheme_background_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)background_balloonTextColor_sBehavior;
  background_balloonTextColor_sBehavior = v0;

}

- (id)message_editing_black_balloonTextColor
{
  if (message_editing_black_balloonTextColor_once != -1)
    dispatch_once(&message_editing_black_balloonTextColor_once, &__block_literal_global_179);
  return (id)message_editing_black_balloonTextColor_sBehavior;
}

void __51__CKUITheme_message_editing_black_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)message_editing_black_balloonTextColor_sBehavior;
  message_editing_black_balloonTextColor_sBehavior = v0;

}

- (id)reply_gray_balloonTextColor
{
  if (reply_gray_balloonTextColor_once != -1)
    dispatch_once(&reply_gray_balloonTextColor_once, &__block_literal_global_180);
  return (id)reply_gray_balloonTextColor_sBehavior;
}

void __40__CKUITheme_reply_gray_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKReplyGrayTextColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_gray_balloonTextColor_sBehavior;
  reply_gray_balloonTextColor_sBehavior = v0;

}

- (id)reply_blue_balloonTextColor
{
  if (reply_blue_balloonTextColor_once != -1)
    dispatch_once(&reply_blue_balloonTextColor_once, &__block_literal_global_183);
  return (id)reply_blue_balloonTextColor_sBehavior;
}

void __40__CKUITheme_reply_blue_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKReplyBlueTextColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_blue_balloonTextColor_sBehavior;
  reply_blue_balloonTextColor_sBehavior = v0;

}

- (id)reply_green_balloonTextColor
{
  if (reply_green_balloonTextColor_once != -1)
    dispatch_once(&reply_green_balloonTextColor_once, &__block_literal_global_186);
  return (id)reply_green_balloonTextColor_sBehavior;
}

void __41__CKUITheme_reply_green_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKReplyGreenTextColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_green_balloonTextColor_sBehavior;
  reply_green_balloonTextColor_sBehavior = v0;

}

- (id)stewie_balloonTextColor
{
  if (stewie_balloonTextColor_once != -1)
    dispatch_once(&stewie_balloonTextColor_once, &__block_literal_global_189);
  return (id)stewie_balloonTextColor_sBehavior;
}

void __36__CKUITheme_stewie_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stewie_balloonTextColor_sBehavior;
  stewie_balloonTextColor_sBehavior = v0;

}

- (id)pending_blue_balloonTextColor
{
  if (pending_blue_balloonTextColor_once != -1)
    dispatch_once(&pending_blue_balloonTextColor_once, &__block_literal_global_190);
  return (id)pending_blue_balloonTextColor_sBehavior;
}

void __42__CKUITheme_pending_blue_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKPendingBlueTextColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pending_blue_balloonTextColor_sBehavior;
  pending_blue_balloonTextColor_sBehavior = v0;

}

- (id)balloonTextLinkColorForColorType:(char)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case -1:
      -[CKUITheme gray_balloonTextLinkColor](self, "gray_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      -[CKUITheme green_balloonTextLinkColor](self, "green_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[CKUITheme blue_balloonTextLinkColor](self, "blue_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[CKUITheme siri_balloonTextLinkColor](self, "siri_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[CKUITheme red_balloonTextLinkColor](self, "red_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[CKUITheme white_balloonTextLinkColor](self, "white_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[CKUITheme black_balloonTextLinkColor](self, "black_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[CKUITheme business_balloonTextLinkColor](self, "business_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[CKUITheme multiway_balloonTextLinkColor](self, "multiway_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[CKUITheme background_balloonTextLinkColor](self, "background_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[CKUITheme reply_gray_balloonTextLinkColor](self, "reply_gray_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[CKUITheme reply_blue_balloonTextLinkColor](self, "reply_blue_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[CKUITheme reply_green_balloonTextLinkColor](self, "reply_green_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[CKUITheme stewie_balloonTextLinkColor](self, "stewie_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[CKUITheme message_editing_black_balloonTextLinkColor](self, "message_editing_black_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[CKUITheme opaque_orb_gray_balloonTextLinkColor](self, "opaque_orb_gray_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      -[CKUITheme pending_blue_balloonTextLinkColor](self, "pending_blue_balloonTextLinkColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)gray_balloonTextLinkColor
{
  if (gray_balloonTextLinkColor_once != -1)
    dispatch_once(&gray_balloonTextLinkColor_once, &__block_literal_global_193);
  return (id)gray_balloonTextLinkColor_sBehavior;
}

void __38__CKUITheme_gray_balloonTextLinkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "linkColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gray_balloonTextLinkColor_sBehavior;
  gray_balloonTextLinkColor_sBehavior = v0;

}

- (id)opaque_orb_gray_balloonTextLinkColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CKUITheme_opaque_orb_gray_balloonTextLinkColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (opaque_orb_gray_balloonTextLinkColor_once != -1)
    dispatch_once(&opaque_orb_gray_balloonTextLinkColor_once, block);
  return (id)opaque_orb_gray_balloonTextLinkColor_sBehavior;
}

void __49__CKUITheme_opaque_orb_gray_balloonTextLinkColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "gray_balloonTextLinkColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)opaque_orb_gray_balloonTextLinkColor_sBehavior;
  opaque_orb_gray_balloonTextLinkColor_sBehavior = v1;

}

- (id)green_balloonTextLinkColor
{
  if (green_balloonTextLinkColor_once != -1)
    dispatch_once(&green_balloonTextLinkColor_once, &__block_literal_global_194);
  return (id)green_balloonTextLinkColor_sBehavior;
}

void __39__CKUITheme_green_balloonTextLinkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)green_balloonTextLinkColor_sBehavior;
  green_balloonTextLinkColor_sBehavior = v0;

}

- (id)blue_balloonTextLinkColor
{
  if (blue_balloonTextLinkColor_once != -1)
    dispatch_once(&blue_balloonTextLinkColor_once, &__block_literal_global_195);
  return (id)blue_balloonTextLinkColor_sBehavior;
}

void __38__CKUITheme_blue_balloonTextLinkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)blue_balloonTextLinkColor_sBehavior;
  blue_balloonTextLinkColor_sBehavior = v0;

}

- (id)siri_balloonTextLinkColor
{
  if (siri_balloonTextLinkColor_once != -1)
    dispatch_once(&siri_balloonTextLinkColor_once, &__block_literal_global_196);
  return (id)siri_balloonTextLinkColor_sBehavior;
}

void __38__CKUITheme_siri_balloonTextLinkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)siri_balloonTextLinkColor_sBehavior;
  siri_balloonTextLinkColor_sBehavior = v0;

}

- (id)red_balloonTextLinkColor
{
  if (red_balloonTextLinkColor_once != -1)
    dispatch_once(&red_balloonTextLinkColor_once, &__block_literal_global_197);
  return (id)red_balloonTextLinkColor_sBehavior;
}

void __37__CKUITheme_red_balloonTextLinkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)red_balloonTextLinkColor_sBehavior;
  red_balloonTextLinkColor_sBehavior = v0;

}

- (id)white_balloonTextLinkColor
{
  if (white_balloonTextLinkColor_once != -1)
    dispatch_once(&white_balloonTextLinkColor_once, &__block_literal_global_198);
  return (id)white_balloonTextLinkColor_sBehavior;
}

void __39__CKUITheme_white_balloonTextLinkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "linkColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)white_balloonTextLinkColor_sBehavior;
  white_balloonTextLinkColor_sBehavior = v0;

}

- (id)black_balloonTextLinkColor
{
  if (black_balloonTextLinkColor_once != -1)
    dispatch_once(&black_balloonTextLinkColor_once, &__block_literal_global_199);
  return (id)black_balloonTextLinkColor_sBehavior;
}

void __39__CKUITheme_black_balloonTextLinkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)black_balloonTextLinkColor_sBehavior;
  black_balloonTextLinkColor_sBehavior = v0;

}

- (id)business_balloonTextLinkColor
{
  if (business_balloonTextLinkColor_once != -1)
    dispatch_once(&business_balloonTextLinkColor_once, &__block_literal_global_200);
  return (id)business_balloonTextLinkColor_sBehavior;
}

void __42__CKUITheme_business_balloonTextLinkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)business_balloonTextLinkColor_sBehavior;
  business_balloonTextLinkColor_sBehavior = v0;

}

- (id)multiway_balloonTextLinkColor
{
  if (multiway_balloonTextLinkColor_once != -1)
    dispatch_once(&multiway_balloonTextLinkColor_once, &__block_literal_global_201);
  return (id)multiway_balloonTextLinkColor_sBehavior;
}

void __42__CKUITheme_multiway_balloonTextLinkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)multiway_balloonTextLinkColor_sBehavior;
  multiway_balloonTextLinkColor_sBehavior = v0;

}

- (id)background_balloonTextLinkColor
{
  if (background_balloonTextLinkColor_once != -1)
    dispatch_once(&background_balloonTextLinkColor_once, &__block_literal_global_202);
  return (id)background_balloonTextLinkColor_sBehavior;
}

void __44__CKUITheme_background_balloonTextLinkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)background_balloonTextLinkColor_sBehavior;
  background_balloonTextLinkColor_sBehavior = v0;

}

- (id)message_editing_black_balloonTextLinkColor
{
  if (message_editing_black_balloonTextLinkColor_once != -1)
    dispatch_once(&message_editing_black_balloonTextLinkColor_once, &__block_literal_global_203);
  return (id)message_editing_black_balloonTextLinkColor_sBehavior;
}

void __55__CKUITheme_message_editing_black_balloonTextLinkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)message_editing_black_balloonTextLinkColor_sBehavior;
  message_editing_black_balloonTextLinkColor_sBehavior = v0;

}

- (id)reply_gray_balloonTextLinkColor
{
  if (reply_gray_balloonTextLinkColor_once != -1)
    dispatch_once(&reply_gray_balloonTextLinkColor_once, &__block_literal_global_204);
  return (id)reply_gray_balloonTextLinkColor_sBehavior;
}

void __44__CKUITheme_reply_gray_balloonTextLinkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_gray_balloonTextLinkColor_sBehavior;
  reply_gray_balloonTextLinkColor_sBehavior = v0;

}

- (id)reply_blue_balloonTextLinkColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CKUITheme_reply_blue_balloonTextLinkColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (reply_blue_balloonTextLinkColor_once != -1)
    dispatch_once(&reply_blue_balloonTextLinkColor_once, block);
  return (id)reply_blue_balloonTextLinkColor_sBehavior;
}

void __44__CKUITheme_reply_blue_balloonTextLinkColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "reply_blue_balloonColors");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)reply_blue_balloonTextLinkColor_sBehavior;
  reply_blue_balloonTextLinkColor_sBehavior = v1;

}

- (id)reply_green_balloonTextLinkColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CKUITheme_reply_green_balloonTextLinkColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (reply_green_balloonTextLinkColor_once != -1)
    dispatch_once(&reply_green_balloonTextLinkColor_once, block);
  return (id)reply_green_balloonTextLinkColor_sBehavior;
}

void __45__CKUITheme_reply_green_balloonTextLinkColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "reply_green_balloonColors");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)reply_green_balloonTextLinkColor_sBehavior;
  reply_green_balloonTextLinkColor_sBehavior = v1;

}

- (id)stewie_balloonTextLinkColor
{
  if (stewie_balloonTextLinkColor_once != -1)
    dispatch_once(&stewie_balloonTextLinkColor_once, &__block_literal_global_205);
  return (id)stewie_balloonTextLinkColor_sBehavior;
}

void __40__CKUITheme_stewie_balloonTextLinkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stewie_balloonTextLinkColor_sBehavior;
  stewie_balloonTextLinkColor_sBehavior = v0;

}

- (id)pending_blue_balloonTextLinkColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CKUITheme_pending_blue_balloonTextLinkColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (pending_blue_balloonTextLinkColor_once != -1)
    dispatch_once(&pending_blue_balloonTextLinkColor_once, block);
  return (id)pending_blue_balloonTextLinkColor_sBehavior;
}

void __46__CKUITheme_pending_blue_balloonTextLinkColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "pending_blue_balloonTextColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)pending_blue_balloonTextLinkColor_sBehavior;
  pending_blue_balloonTextLinkColor_sBehavior = v1;

}

- (id)balloonOverlayColorForColorType:(char)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case -1:
      -[CKUITheme gray_balloonOverlayColor](self, "gray_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      -[CKUITheme green_balloonOverlayColor](self, "green_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[CKUITheme blue_balloonOverlayColor](self, "blue_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[CKUITheme siri_balloonOverlayColor](self, "siri_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[CKUITheme red_balloonOverlayColor](self, "red_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[CKUITheme white_balloonOverlayColor](self, "white_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[CKUITheme black_balloonOverlayColor](self, "black_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[CKUITheme business_balloonOverlayColor](self, "business_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[CKUITheme multiway_balloonOverlayColor](self, "multiway_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[CKUITheme background_balloonOverlayColor](self, "background_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[CKUITheme reply_gray_balloonOverlayColor](self, "reply_gray_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[CKUITheme reply_blue_balloonOverlayColor](self, "reply_blue_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[CKUITheme reply_green_balloonOverlayColor](self, "reply_green_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[CKUITheme stewie_balloonOverlayColor](self, "stewie_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[CKUITheme message_editing_black_balloonOverlayColor](self, "message_editing_black_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[CKUITheme opaque_orb_gray_balloonOverlayColor](self, "opaque_orb_gray_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      -[CKUITheme pending_blue_balloonOverlayColor](self, "pending_blue_balloonOverlayColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)gray_balloonOverlayColor
{
  if (gray_balloonOverlayColor_once != -1)
    dispatch_once(&gray_balloonOverlayColor_once, &__block_literal_global_206);
  return (id)gray_balloonOverlayColor_sBehavior;
}

void __37__CKUITheme_gray_balloonOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_207);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gray_balloonOverlayColor_sBehavior;
  gray_balloonOverlayColor_sBehavior = v0;

}

uint64_t __37__CKUITheme_gray_balloonOverlayColor__block_invoke_2(uint64_t a1, void *a2)
{
  _BOOL4 v2;

  v2 = objc_msgSend(a2, "userInterfaceStyle") == 2;
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", dbl_18E7C8B90[v2], dbl_18E7C8B90[v2], dbl_18E7C8BA0[v2], 1.0);
}

- (id)blue_balloonOverlayColor
{
  if (blue_balloonOverlayColor_once != -1)
    dispatch_once(&blue_balloonOverlayColor_once, &__block_literal_global_208);
  return (id)blue_balloonOverlayColor_sBehavior;
}

void __37__CKUITheme_blue_balloonOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_209);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)blue_balloonOverlayColor_sBehavior;
  blue_balloonOverlayColor_sBehavior = v0;

}

uint64_t __37__CKUITheme_blue_balloonOverlayColor__block_invoke_2(uint64_t a1, void *a2)
{
  _BOOL4 v2;

  v2 = objc_msgSend(a2, "userInterfaceStyle") == 2;
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", dbl_18E7C8BB0[v2], dbl_18E7C8BC0[v2], dbl_18E7C8BD0[v2], 1.0);
}

- (id)opaque_orb_gray_balloonOverlayColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CKUITheme_opaque_orb_gray_balloonOverlayColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (opaque_orb_gray_balloonOverlayColor_once != -1)
    dispatch_once(&opaque_orb_gray_balloonOverlayColor_once, block);
  return (id)opaque_orb_gray_balloonOverlayColor_sBehavior;
}

void __48__CKUITheme_opaque_orb_gray_balloonOverlayColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "gray_balloonOverlayColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)opaque_orb_gray_balloonOverlayColor_sBehavior;
  opaque_orb_gray_balloonOverlayColor_sBehavior = v1;

}

- (id)green_balloonOverlayColor
{
  if (green_balloonOverlayColor_once != -1)
    dispatch_once(&green_balloonOverlayColor_once, &__block_literal_global_210);
  return (id)green_balloonOverlayColor_sBehavior;
}

void __38__CKUITheme_green_balloonOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.0392156863, 0.470588235, 0.2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)green_balloonOverlayColor_sBehavior;
  green_balloonOverlayColor_sBehavior = v0;

}

- (id)siri_balloonOverlayColor
{
  if (siri_balloonOverlayColor_once != -1)
    dispatch_once(&siri_balloonOverlayColor_once, &__block_literal_global_211);
  return (id)siri_balloonOverlayColor_sBehavior;
}

void __37__CKUITheme_siri_balloonOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.0392156863, 0.470588235, 0.1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)siri_balloonOverlayColor_sBehavior;
  siri_balloonOverlayColor_sBehavior = v0;

}

- (id)red_balloonOverlayColor
{
  if (red_balloonOverlayColor_once != -1)
    dispatch_once(&red_balloonOverlayColor_once, &__block_literal_global_212);
  return (id)red_balloonOverlayColor_sBehavior;
}

void __36__CKUITheme_red_balloonOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.0392156863, 0.470588235, 0.1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)red_balloonOverlayColor_sBehavior;
  red_balloonOverlayColor_sBehavior = v0;

}

- (id)white_balloonOverlayColor
{
  if (white_balloonOverlayColor_once != -1)
    dispatch_once(&white_balloonOverlayColor_once, &__block_literal_global_213);
  return (id)white_balloonOverlayColor_sBehavior;
}

void __38__CKUITheme_white_balloonOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.0392156863, 0.470588235, 0.1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)white_balloonOverlayColor_sBehavior;
  white_balloonOverlayColor_sBehavior = v0;

}

- (id)black_balloonOverlayColor
{
  if (black_balloonOverlayColor_once != -1)
    dispatch_once(&black_balloonOverlayColor_once, &__block_literal_global_214);
  return (id)black_balloonOverlayColor_sBehavior;
}

void __38__CKUITheme_black_balloonOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.0392156863, 0.470588235, 0.1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)black_balloonOverlayColor_sBehavior;
  black_balloonOverlayColor_sBehavior = v0;

}

- (id)business_balloonOverlayColor
{
  if (business_balloonOverlayColor_once != -1)
    dispatch_once(&business_balloonOverlayColor_once, &__block_literal_global_215);
  return (id)business_balloonOverlayColor_sBehavior;
}

void __41__CKUITheme_business_balloonOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.0392156863, 0.470588235, 0.1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)business_balloonOverlayColor_sBehavior;
  business_balloonOverlayColor_sBehavior = v0;

}

- (id)multiway_balloonOverlayColor
{
  if (multiway_balloonOverlayColor_once != -1)
    dispatch_once(&multiway_balloonOverlayColor_once, &__block_literal_global_216);
  return (id)multiway_balloonOverlayColor_sBehavior;
}

void __41__CKUITheme_multiway_balloonOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.0392156863, 0.470588235, 0.1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)multiway_balloonOverlayColor_sBehavior;
  multiway_balloonOverlayColor_sBehavior = v0;

}

- (id)background_balloonOverlayColor
{
  if (background_balloonOverlayColor_once != -1)
    dispatch_once(&background_balloonOverlayColor_once, &__block_literal_global_217);
  return (id)background_balloonOverlayColor_sBehavior;
}

void __43__CKUITheme_background_balloonOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.0392156863, 0.470588235, 0.1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)background_balloonOverlayColor_sBehavior;
  background_balloonOverlayColor_sBehavior = v0;

}

- (id)message_editing_black_balloonOverlayColor
{
  if (message_editing_black_balloonOverlayColor_once != -1)
    dispatch_once(&message_editing_black_balloonOverlayColor_once, &__block_literal_global_218);
  return (id)message_editing_black_balloonOverlayColor_sBehavior;
}

void __54__CKUITheme_message_editing_black_balloonOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.0392156863, 0.470588235, 0.1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)message_editing_black_balloonOverlayColor_sBehavior;
  message_editing_black_balloonOverlayColor_sBehavior = v0;

}

- (id)reply_gray_balloonOverlayColor
{
  if (reply_gray_balloonOverlayColor_once != -1)
    dispatch_once(&reply_gray_balloonOverlayColor_once, &__block_literal_global_219);
  return (id)reply_gray_balloonOverlayColor_sBehavior;
}

void __43__CKUITheme_reply_gray_balloonOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.0392156863, 0.470588235, 0.1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_gray_balloonOverlayColor_sBehavior;
  reply_gray_balloonOverlayColor_sBehavior = v0;

}

- (id)reply_blue_balloonOverlayColor
{
  if (reply_blue_balloonOverlayColor_once != -1)
    dispatch_once(&reply_blue_balloonOverlayColor_once, &__block_literal_global_220);
  return (id)reply_blue_balloonOverlayColor_sBehavior;
}

void __43__CKUITheme_reply_blue_balloonOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.0392156863, 0.470588235, 0.2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_blue_balloonOverlayColor_sBehavior;
  reply_blue_balloonOverlayColor_sBehavior = v0;

}

- (id)reply_green_balloonOverlayColor
{
  if (reply_green_balloonOverlayColor_once != -1)
    dispatch_once(&reply_green_balloonOverlayColor_once, &__block_literal_global_221);
  return (id)reply_green_balloonOverlayColor_sBehavior;
}

void __44__CKUITheme_reply_green_balloonOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.0392156863, 0.470588235, 0.2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_green_balloonOverlayColor_sBehavior;
  reply_green_balloonOverlayColor_sBehavior = v0;

}

- (id)stewie_balloonOverlayColor
{
  if (stewie_balloonOverlayColor_once != -1)
    dispatch_once(&stewie_balloonOverlayColor_once, &__block_literal_global_222);
  return (id)stewie_balloonOverlayColor_sBehavior;
}

void __39__CKUITheme_stewie_balloonOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.0392156863, 0.470588235, 0.1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stewie_balloonOverlayColor_sBehavior;
  stewie_balloonOverlayColor_sBehavior = v0;

}

- (id)pending_blue_balloonOverlayColor
{
  if (pending_blue_balloonOverlayColor_once != -1)
    dispatch_once(&pending_blue_balloonOverlayColor_once, &__block_literal_global_223);
  return (id)pending_blue_balloonOverlayColor_sBehavior;
}

void __45__CKUITheme_pending_blue_balloonOverlayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.0392156863, 0.470588235, 0.2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pending_blue_balloonOverlayColor_sBehavior;
  pending_blue_balloonOverlayColor_sBehavior = v0;

}

- (UIColor)whiteSelectionHightlightColor
{
  if (whiteSelectionHightlightColor_once != -1)
    dispatch_once(&whiteSelectionHightlightColor_once, &__block_literal_global_224);
  return (UIColor *)(id)whiteSelectionHightlightColor_sBehavior;
}

void __42__CKUITheme_whiteSelectionHightlightColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.65);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)whiteSelectionHightlightColor_sBehavior;
  whiteSelectionHightlightColor_sBehavior = v0;

}

- (UIColor)blueSelectionHighlightColor
{
  if (blueSelectionHighlightColor_once != -1)
    dispatch_once(&blueSelectionHighlightColor_once, &__block_literal_global_225);
  return (UIColor *)(id)blueSelectionHighlightColor_sBehavior;
}

void __40__CKUITheme_blueSelectionHighlightColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.63, 1.0, 0.35);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)blueSelectionHighlightColor_sBehavior;
  blueSelectionHighlightColor_sBehavior = v0;

}

- (id)selectionHighlightColorOverrideForColorType:(char)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case -1:
      -[CKUITheme gray_selectionHighlightColorOverride](self, "gray_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      -[CKUITheme green_selectionHighlightColorOverride](self, "green_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[CKUITheme blue_selectionHighlightColorOverride](self, "blue_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[CKUITheme siri_selectionHighlightColorOverride](self, "siri_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[CKUITheme red_selectionHighlightColorOverride](self, "red_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[CKUITheme white_selectionHighlightColorOverride](self, "white_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[CKUITheme black_selectionHighlightColorOverride](self, "black_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[CKUITheme business_selectionHighlightColorOverride](self, "business_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[CKUITheme multiway_selectionHighlightColorOverride](self, "multiway_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[CKUITheme background_selectionHighlightColorOverride](self, "background_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[CKUITheme reply_gray_selectionHighlightColorOverride](self, "reply_gray_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[CKUITheme reply_blue_selectionHighlightColorOverride](self, "reply_blue_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[CKUITheme reply_green_selectionHighlightColorOverride](self, "reply_green_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[CKUITheme stewie_selectionHighlightColorOverride](self, "stewie_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[CKUITheme message_editing_black_selectionHighlightColorOverride](self, "message_editing_black_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[CKUITheme opaque_orb_gray_selectionHighlightColorOverride](self, "opaque_orb_gray_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      -[CKUITheme pending_blue_selectionHighlightColorOverride](self, "pending_blue_selectionHighlightColorOverride", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)gray_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CKUITheme_gray_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (gray_selectionHighlightColorOverride_once != -1)
    dispatch_once(&gray_selectionHighlightColorOverride_once, block);
  return (id)gray_selectionHighlightColorOverride_sBehavior;
}

void __49__CKUITheme_gray_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "blueSelectionHighlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)gray_selectionHighlightColorOverride_sBehavior;
  gray_selectionHighlightColorOverride_sBehavior = v1;

}

- (id)opaque_orb_gray_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CKUITheme_opaque_orb_gray_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (opaque_orb_gray_selectionHighlightColorOverride_once != -1)
    dispatch_once(&opaque_orb_gray_selectionHighlightColorOverride_once, block);
  return (id)opaque_orb_gray_selectionHighlightColorOverride_sBehavior;
}

void __60__CKUITheme_opaque_orb_gray_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "blueSelectionHighlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)opaque_orb_gray_selectionHighlightColorOverride_sBehavior;
  opaque_orb_gray_selectionHighlightColorOverride_sBehavior = v1;

}

- (id)green_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CKUITheme_green_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (green_selectionHighlightColorOverride_once != -1)
    dispatch_once(&green_selectionHighlightColorOverride_once, block);
  return (id)green_selectionHighlightColorOverride_sBehavior;
}

void __50__CKUITheme_green_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "whiteSelectionHightlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)green_selectionHighlightColorOverride_sBehavior;
  green_selectionHighlightColorOverride_sBehavior = v1;

}

- (id)blue_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CKUITheme_blue_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (blue_selectionHighlightColorOverride_once != -1)
    dispatch_once(&blue_selectionHighlightColorOverride_once, block);
  return (id)blue_selectionHighlightColorOverride_sBehavior;
}

void __49__CKUITheme_blue_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "whiteSelectionHightlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)blue_selectionHighlightColorOverride_sBehavior;
  blue_selectionHighlightColorOverride_sBehavior = v1;

}

- (id)siri_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CKUITheme_siri_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (siri_selectionHighlightColorOverride_once != -1)
    dispatch_once(&siri_selectionHighlightColorOverride_once, block);
  return (id)siri_selectionHighlightColorOverride_sBehavior;
}

void __49__CKUITheme_siri_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "whiteSelectionHightlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)siri_selectionHighlightColorOverride_sBehavior;
  siri_selectionHighlightColorOverride_sBehavior = v1;

}

- (id)red_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CKUITheme_red_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (red_selectionHighlightColorOverride_once != -1)
    dispatch_once(&red_selectionHighlightColorOverride_once, block);
  return (id)red_selectionHighlightColorOverride_sBehavior;
}

void __48__CKUITheme_red_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "whiteSelectionHightlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)red_selectionHighlightColorOverride_sBehavior;
  red_selectionHighlightColorOverride_sBehavior = v1;

}

- (id)white_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CKUITheme_white_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (white_selectionHighlightColorOverride_once != -1)
    dispatch_once(&white_selectionHighlightColorOverride_once, block);
  return (id)white_selectionHighlightColorOverride_sBehavior;
}

void __50__CKUITheme_white_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "blueSelectionHighlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)white_selectionHighlightColorOverride_sBehavior;
  white_selectionHighlightColorOverride_sBehavior = v1;

}

- (id)black_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CKUITheme_black_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (black_selectionHighlightColorOverride_once != -1)
    dispatch_once(&black_selectionHighlightColorOverride_once, block);
  return (id)black_selectionHighlightColorOverride_sBehavior;
}

void __50__CKUITheme_black_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "whiteSelectionHightlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)black_selectionHighlightColorOverride_sBehavior;
  black_selectionHighlightColorOverride_sBehavior = v1;

}

- (id)business_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CKUITheme_business_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (business_selectionHighlightColorOverride_once != -1)
    dispatch_once(&business_selectionHighlightColorOverride_once, block);
  return (id)business_selectionHighlightColorOverride_sBehavior;
}

void __53__CKUITheme_business_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "whiteSelectionHightlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)business_selectionHighlightColorOverride_sBehavior;
  business_selectionHighlightColorOverride_sBehavior = v1;

}

- (id)multiway_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CKUITheme_multiway_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (multiway_selectionHighlightColorOverride_once != -1)
    dispatch_once(&multiway_selectionHighlightColorOverride_once, block);
  return (id)multiway_selectionHighlightColorOverride_sBehavior;
}

void __53__CKUITheme_multiway_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "whiteSelectionHightlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)multiway_selectionHighlightColorOverride_sBehavior;
  multiway_selectionHighlightColorOverride_sBehavior = v1;

}

- (id)background_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CKUITheme_background_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (background_selectionHighlightColorOverride_once != -1)
    dispatch_once(&background_selectionHighlightColorOverride_once, block);
  return (id)background_selectionHighlightColorOverride_sBehavior;
}

void __55__CKUITheme_background_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "blueSelectionHighlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)background_selectionHighlightColorOverride_sBehavior;
  background_selectionHighlightColorOverride_sBehavior = v1;

}

- (id)message_editing_black_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CKUITheme_message_editing_black_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (message_editing_black_selectionHighlightColorOverride_once != -1)
    dispatch_once(&message_editing_black_selectionHighlightColorOverride_once, block);
  return (id)message_editing_black_selectionHighlightColorOverride_sBehavior;
}

void __66__CKUITheme_message_editing_black_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "blueSelectionHighlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)message_editing_black_selectionHighlightColorOverride_sBehavior;
  message_editing_black_selectionHighlightColorOverride_sBehavior = v1;

}

- (id)reply_gray_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CKUITheme_reply_gray_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (reply_gray_selectionHighlightColorOverride_once != -1)
    dispatch_once(&reply_gray_selectionHighlightColorOverride_once, block);
  return (id)reply_gray_selectionHighlightColorOverride_sBehavior;
}

void __55__CKUITheme_reply_gray_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "blueSelectionHighlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)reply_gray_selectionHighlightColorOverride_sBehavior;
  reply_gray_selectionHighlightColorOverride_sBehavior = v1;

}

- (id)reply_blue_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CKUITheme_reply_blue_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (reply_blue_selectionHighlightColorOverride_once != -1)
    dispatch_once(&reply_blue_selectionHighlightColorOverride_once, block);
  return (id)reply_blue_selectionHighlightColorOverride_sBehavior;
}

void __55__CKUITheme_reply_blue_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "whiteSelectionHightlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)reply_blue_selectionHighlightColorOverride_sBehavior;
  reply_blue_selectionHighlightColorOverride_sBehavior = v1;

}

- (id)reply_green_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CKUITheme_reply_green_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (reply_green_selectionHighlightColorOverride_once != -1)
    dispatch_once(&reply_green_selectionHighlightColorOverride_once, block);
  return (id)reply_green_selectionHighlightColorOverride_sBehavior;
}

void __56__CKUITheme_reply_green_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "whiteSelectionHightlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)reply_green_selectionHighlightColorOverride_sBehavior;
  reply_green_selectionHighlightColorOverride_sBehavior = v1;

}

- (id)stewie_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CKUITheme_stewie_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (stewie_selectionHighlightColorOverride_once != -1)
    dispatch_once(&stewie_selectionHighlightColorOverride_once, block);
  return (id)stewie_selectionHighlightColorOverride_sBehavior;
}

void __51__CKUITheme_stewie_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "whiteSelectionHightlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)stewie_selectionHighlightColorOverride_sBehavior;
  stewie_selectionHighlightColorOverride_sBehavior = v1;

}

- (id)pending_blue_selectionHighlightColorOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CKUITheme_pending_blue_selectionHighlightColorOverride__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (pending_blue_selectionHighlightColorOverride_once != -1)
    dispatch_once(&pending_blue_selectionHighlightColorOverride_once, block);
  return (id)pending_blue_selectionHighlightColorOverride_sBehavior;
}

void __57__CKUITheme_pending_blue_selectionHighlightColorOverride__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "whiteSelectionHightlightColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)pending_blue_selectionHighlightColorOverride_sBehavior;
  pending_blue_selectionHighlightColorOverride_sBehavior = v1;

}

- (UIColor)messageEditingTranscriptOverlayBackgroundColor
{
  if (messageEditingTranscriptOverlayBackgroundColor_once != -1)
    dispatch_once(&messageEditingTranscriptOverlayBackgroundColor_once, &__block_literal_global_226);
  return (UIColor *)(id)messageEditingTranscriptOverlayBackgroundColor_sBehavior;
}

void __59__CKUITheme_messageEditingTranscriptOverlayBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKMessageEditingTranscriptOverlayBackgroundColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)messageEditingTranscriptOverlayBackgroundColor_sBehavior;
  messageEditingTranscriptOverlayBackgroundColor_sBehavior = v0;

}

- (NSArray)messageEditingTranscriptOverlayBackgroundEffects
{
  if (messageEditingTranscriptOverlayBackgroundEffects_once != -1)
    dispatch_once(&messageEditingTranscriptOverlayBackgroundEffects_once, &__block_literal_global_229);
  return (NSArray *)(id)messageEditingTranscriptOverlayBackgroundEffects_sBehavior;
}

void __61__CKUITheme_messageEditingTranscriptOverlayBackgroundEffects__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)objc_opt_new();
  v1 = (void *)MEMORY[0x1E0CEABE0];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "effectCompositingColor:withMode:alpha:", v2, 1, 0.088);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v3);

  v4 = objc_msgSend(v0, "copy");
  v5 = (void *)messageEditingTranscriptOverlayBackgroundEffects_sBehavior;
  messageEditingTranscriptOverlayBackgroundEffects_sBehavior = v4;

}

- (UIColor)replyTranscriptBlurBackgroundColor
{
  if (replyTranscriptBlurBackgroundColor_once != -1)
    dispatch_once(&replyTranscriptBlurBackgroundColor_once, &__block_literal_global_232);
  return (UIColor *)(id)replyTranscriptBlurBackgroundColor_sBehavior;
}

void __47__CKUITheme_replyTranscriptBlurBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKInlineReplyTranscriptBackgroundColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)replyTranscriptBlurBackgroundColor_sBehavior;
  replyTranscriptBlurBackgroundColor_sBehavior = v0;

}

- (double)replyTranscriptBlurBackgroundBlurRadius
{
  if (replyTranscriptBlurBackgroundBlurRadius_once != -1)
    dispatch_once(&replyTranscriptBlurBackgroundBlurRadius_once, &__block_literal_global_235);
  return *(double *)&replyTranscriptBlurBackgroundBlurRadius_sBehavior;
}

void __52__CKUITheme_replyTranscriptBlurBackgroundBlurRadius__block_invoke()
{
  replyTranscriptBlurBackgroundBlurRadius_sBehavior = 0x4024000000000000;
}

- (NSArray)replyTranscriptBlurBackgroundEffects
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CKUITheme_replyTranscriptBlurBackgroundEffects__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (replyTranscriptBlurBackgroundEffects_once != -1)
    dispatch_once(&replyTranscriptBlurBackgroundEffects_once, block);
  return (NSArray *)(id)replyTranscriptBlurBackgroundEffects_sBehavior;
}

void __49__CKUITheme_replyTranscriptBlurBackgroundEffects__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)objc_opt_new();
  v3 = (void *)MEMORY[0x1E0CEA398];
  objc_msgSend(*(id *)(a1 + 32), "replyTranscriptBlurBackgroundBlurRadius");
  objc_msgSend(v3, "effectWithBlurRadius:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CEABE0];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectCompositingColor:withMode:alpha:", v6, 1, 0.088);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

  v8 = objc_msgSend(v2, "copy");
  v9 = (void *)replyTranscriptBlurBackgroundEffects_sBehavior;
  replyTranscriptBlurBackgroundEffects_sBehavior = v8;

}

- (double)transcriptOverlayBackingCollectionViewOpacity
{
  if (transcriptOverlayBackingCollectionViewOpacity_once != -1)
    dispatch_once(&transcriptOverlayBackingCollectionViewOpacity_once, &__block_literal_global_237);
  return *(double *)&transcriptOverlayBackingCollectionViewOpacity_sBehavior;
}

void __58__CKUITheme_transcriptOverlayBackingCollectionViewOpacity__block_invoke()
{
  transcriptOverlayBackingCollectionViewOpacity_sBehavior = 0x3FF0000000000000;
}

- (UIColor)replyButtonTextColor
{
  if (replyButtonTextColor_once != -1)
    dispatch_once(&replyButtonTextColor_once, &__block_literal_global_238);
  return (UIColor *)(id)replyButtonTextColor_sBehavior;
}

void __33__CKUITheme_replyButtonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)replyButtonTextColor_sBehavior;
  replyButtonTextColor_sBehavior = v0;

}

- (UIColor)replyButtonColor
{
  if (replyButtonColor_once != -1)
    dispatch_once(&replyButtonColor_once, &__block_literal_global_239);
  return (UIColor *)(id)replyButtonColor_sBehavior;
}

void __29__CKUITheme_replyButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKInlineReplyButtonColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)replyButtonColor_sBehavior;
  replyButtonColor_sBehavior = v0;

}

- (UIColor)replyButtonBorderColor
{
  if (replyButtonBorderColor_once != -1)
    dispatch_once(&replyButtonBorderColor_once, &__block_literal_global_242);
  return (UIColor *)(id)replyButtonBorderColor_sBehavior;
}

void __35__CKUITheme_replyButtonBorderColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKInlineReplyButtonBorderColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)replyButtonBorderColor_sBehavior;
  replyButtonBorderColor_sBehavior = v0;

}

- (UIColor)replyButtonShadowColor
{
  if (replyButtonShadowColor_once != -1)
    dispatch_once(&replyButtonShadowColor_once, &__block_literal_global_245);
  return (UIColor *)(id)replyButtonShadowColor_sBehavior;
}

void __35__CKUITheme_replyButtonShadowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKInlineReplyButtonShadowColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)replyButtonShadowColor_sBehavior;
  replyButtonShadowColor_sBehavior = v0;

}

- (BOOL)shouldBlendReplyBalloons
{
  if (shouldBlendReplyBalloons_once != -1)
    dispatch_once(&shouldBlendReplyBalloons_once, &__block_literal_global_248);
  return shouldBlendReplyBalloons_sBehavior;
}

void __37__CKUITheme_shouldBlendReplyBalloons__block_invoke()
{
  shouldBlendReplyBalloons_sBehavior = 1;
}

- (int64_t)effectPreviewBackgroundBlurEffectStyle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CKUITheme_effectPreviewBackgroundBlurEffectStyle__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (effectPreviewBackgroundBlurEffectStyle_once != -1)
    dispatch_once(&effectPreviewBackgroundBlurEffectStyle_once, block);
  return effectPreviewBackgroundBlurEffectStyle_sBehavior;
}

uint64_t __51__CKUITheme_effectPreviewBackgroundBlurEffectStyle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_effectPreviewBackgroundBlurEffectStyle");
  effectPreviewBackgroundBlurEffectStyle_sBehavior = result;
  return result;
}

- (int64_t)_effectPreviewBackgroundBlurEffectStyle
{
  return 9;
}

- (UIColor)quickActionButtonBurstColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CKUITheme_quickActionButtonBurstColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (quickActionButtonBurstColor_once != -1)
    dispatch_once(&quickActionButtonBurstColor_once, block);
  return (UIColor *)(id)quickActionButtonBurstColor_sBehavior;
}

void __40__CKUITheme_quickActionButtonBurstColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "appTintColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)quickActionButtonBurstColor_sBehavior;
  quickActionButtonBurstColor_sBehavior = v1;

}

- (UIColor)quickActionButtonGlyphColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CKUITheme_quickActionButtonGlyphColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (quickActionButtonGlyphColor_once != -1)
    dispatch_once(&quickActionButtonGlyphColor_once, block);
  return (UIColor *)(id)quickActionButtonGlyphColor_sBehavior;
}

void __40__CKUITheme_quickActionButtonGlyphColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "appTintColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)quickActionButtonGlyphColor_sBehavior;
  quickActionButtonGlyphColor_sBehavior = v1;

}

- (UIColor)quickActionButtonStrokeColor
{
  if (quickActionButtonStrokeColor_once != -1)
    dispatch_once(&quickActionButtonStrokeColor_once, &__block_literal_global_249);
  return (UIColor *)(id)quickActionButtonStrokeColor_sBehavior;
}

void __41__CKUITheme_quickActionButtonStrokeColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dynamicColorWithLightColor:darkColor:", v1, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)quickActionButtonStrokeColor_sBehavior;
  quickActionButtonStrokeColor_sBehavior = v3;

}

- (UIColor)attachmentBalloonActionColor
{
  if (attachmentBalloonActionColor_once != -1)
    dispatch_once(&attachmentBalloonActionColor_once, &__block_literal_global_250);
  return (UIColor *)(id)attachmentBalloonActionColor_sBehavior;
}

void __41__CKUITheme_attachmentBalloonActionColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemBlueColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)attachmentBalloonActionColor_sBehavior;
  attachmentBalloonActionColor_sBehavior = v0;

}

- (UIColor)attachmentBalloonTitleTextColor
{
  int v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)attachmentBalloonTitleTextColor_sBehavior;
  if (attachmentBalloonTitleTextColor_sBehavior)
    v5 = attachmentBalloonTitleTextColor_sIsIncreaseContrastEnabled_attachmentBalloonTitleTextColor == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme transcriptTextColor](self, "transcriptTextColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)attachmentBalloonTitleTextColor_sBehavior;
    attachmentBalloonTitleTextColor_sBehavior = v6;

    attachmentBalloonTitleTextColor_sIsIncreaseContrastEnabled_attachmentBalloonTitleTextColor = v3;
    v4 = (void *)attachmentBalloonTitleTextColor_sBehavior;
  }
  return (UIColor *)v4;
}

- (UIColor)attachmentBalloonSubtitleTextColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CKUITheme_attachmentBalloonSubtitleTextColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (attachmentBalloonSubtitleTextColor_once != -1)
    dispatch_once(&attachmentBalloonSubtitleTextColor_once, block);
  return (UIColor *)(id)attachmentBalloonSubtitleTextColor_sBehavior;
}

void __47__CKUITheme_attachmentBalloonSubtitleTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "attachmentBalloonTitleTextColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)attachmentBalloonSubtitleTextColor_sBehavior;
  attachmentBalloonSubtitleTextColor_sBehavior = v1;

}

- (UIColor)attachmentBalloonRichIconOutlineColor
{
  if (attachmentBalloonRichIconOutlineColor_once != -1)
    dispatch_once(&attachmentBalloonRichIconOutlineColor_once, &__block_literal_global_251);
  return (UIColor *)(id)attachmentBalloonRichIconOutlineColor_sBehavior;
}

void __50__CKUITheme_attachmentBalloonRichIconOutlineColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.878431373, 0.878431373, 0.878431373, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)attachmentBalloonRichIconOutlineColor_sBehavior;
  attachmentBalloonRichIconOutlineColor_sBehavior = v0;

}

- (id)waveformColorForColorType:(char)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case -1:
      -[CKUITheme gray_waveformColor](self, "gray_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      -[CKUITheme green_waveformColor](self, "green_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[CKUITheme blue_waveformColor](self, "blue_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[CKUITheme siri_waveformColor](self, "siri_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[CKUITheme red_waveformColor](self, "red_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[CKUITheme white_waveformColor](self, "white_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[CKUITheme black_waveformColor](self, "black_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[CKUITheme business_waveformColor](self, "business_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[CKUITheme multiway_waveformColor](self, "multiway_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[CKUITheme background_waveformColor](self, "background_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[CKUITheme reply_gray_waveformColor](self, "reply_gray_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[CKUITheme reply_blue_waveformColor](self, "reply_blue_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[CKUITheme reply_green_waveformColor](self, "reply_green_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[CKUITheme stewie_waveformColor](self, "stewie_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[CKUITheme message_editing_black_waveformColor](self, "message_editing_black_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[CKUITheme opaque_orb_gray_waveformColor](self, "opaque_orb_gray_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      -[CKUITheme pending_blue_waveformColor](self, "pending_blue_waveformColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)gray_waveformColor
{
  if (gray_waveformColor_once != -1)
    dispatch_once(&gray_waveformColor_once, &__block_literal_global_252);
  return (id)gray_waveformColor_sBehavior;
}

void __31__CKUITheme_gray_waveformColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.364705882, 0.364705882, 0.380392157, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gray_waveformColor_sBehavior;
  gray_waveformColor_sBehavior = v0;

}

- (id)opaque_orb_gray_waveformColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CKUITheme_opaque_orb_gray_waveformColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (opaque_orb_gray_waveformColor_once != -1)
    dispatch_once(&opaque_orb_gray_waveformColor_once, block);
  return (id)opaque_orb_gray_waveformColor_sBehavior;
}

void __42__CKUITheme_opaque_orb_gray_waveformColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "gray_waveformColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)opaque_orb_gray_waveformColor_sBehavior;
  opaque_orb_gray_waveformColor_sBehavior = v1;

}

- (id)green_waveformColor
{
  if (green_waveformColor_once != -1)
    dispatch_once(&green_waveformColor_once, &__block_literal_global_253);
  return (id)green_waveformColor_sBehavior;
}

void __32__CKUITheme_green_waveformColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)green_waveformColor_sBehavior;
  green_waveformColor_sBehavior = v0;

}

- (id)blue_waveformColor
{
  if (blue_waveformColor_once != -1)
    dispatch_once(&blue_waveformColor_once, &__block_literal_global_254);
  return (id)blue_waveformColor_sBehavior;
}

void __31__CKUITheme_blue_waveformColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)blue_waveformColor_sBehavior;
  blue_waveformColor_sBehavior = v0;

}

- (id)siri_waveformColor
{
  if (siri_waveformColor_once != -1)
    dispatch_once(&siri_waveformColor_once, &__block_literal_global_255);
  return (id)siri_waveformColor_sBehavior;
}

void __31__CKUITheme_siri_waveformColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)siri_waveformColor_sBehavior;
  siri_waveformColor_sBehavior = v0;

}

- (id)red_waveformColor
{
  if (red_waveformColor_once != -1)
    dispatch_once(&red_waveformColor_once, &__block_literal_global_256);
  return (id)red_waveformColor_sBehavior;
}

void __30__CKUITheme_red_waveformColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)red_waveformColor_sBehavior;
  red_waveformColor_sBehavior = v0;

}

- (id)white_waveformColor
{
  if (white_waveformColor_once != -1)
    dispatch_once(&white_waveformColor_once, &__block_literal_global_257);
  return (id)white_waveformColor_sBehavior;
}

void __32__CKUITheme_white_waveformColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)white_waveformColor_sBehavior;
  white_waveformColor_sBehavior = v0;

}

- (id)black_waveformColor
{
  if (black_waveformColor_once != -1)
    dispatch_once(&black_waveformColor_once, &__block_literal_global_258);
  return (id)black_waveformColor_sBehavior;
}

void __32__CKUITheme_black_waveformColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)black_waveformColor_sBehavior;
  black_waveformColor_sBehavior = v0;

}

- (id)business_waveformColor
{
  if (business_waveformColor_once != -1)
    dispatch_once(&business_waveformColor_once, &__block_literal_global_259);
  return (id)business_waveformColor_sBehavior;
}

void __35__CKUITheme_business_waveformColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)business_waveformColor_sBehavior;
  business_waveformColor_sBehavior = v0;

}

- (id)multiway_waveformColor
{
  if (multiway_waveformColor_once != -1)
    dispatch_once(&multiway_waveformColor_once, &__block_literal_global_260);
  return (id)multiway_waveformColor_sBehavior;
}

void __35__CKUITheme_multiway_waveformColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)multiway_waveformColor_sBehavior;
  multiway_waveformColor_sBehavior = v0;

}

- (id)background_waveformColor
{
  if (background_waveformColor_once != -1)
    dispatch_once(&background_waveformColor_once, &__block_literal_global_261);
  return (id)background_waveformColor_sBehavior;
}

void __37__CKUITheme_background_waveformColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)background_waveformColor_sBehavior;
  background_waveformColor_sBehavior = v0;

}

- (id)message_editing_black_waveformColor
{
  if (message_editing_black_waveformColor_once != -1)
    dispatch_once(&message_editing_black_waveformColor_once, &__block_literal_global_262);
  return (id)message_editing_black_waveformColor_sBehavior;
}

void __48__CKUITheme_message_editing_black_waveformColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)message_editing_black_waveformColor_sBehavior;
  message_editing_black_waveformColor_sBehavior = v0;

}

- (id)reply_gray_waveformColor
{
  if (reply_gray_waveformColor_once != -1)
    dispatch_once(&reply_gray_waveformColor_once, &__block_literal_global_263);
  return (id)reply_gray_waveformColor_sBehavior;
}

void __37__CKUITheme_reply_gray_waveformColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKReplyGrayTextColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_gray_waveformColor_sBehavior;
  reply_gray_waveformColor_sBehavior = v0;

}

- (id)reply_blue_waveformColor
{
  if (reply_blue_waveformColor_once != -1)
    dispatch_once(&reply_blue_waveformColor_once, &__block_literal_global_264);
  return (id)reply_blue_waveformColor_sBehavior;
}

void __37__CKUITheme_reply_blue_waveformColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKReplyBlueTextColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_blue_waveformColor_sBehavior;
  reply_blue_waveformColor_sBehavior = v0;

}

- (id)reply_green_waveformColor
{
  if (reply_green_waveformColor_once != -1)
    dispatch_once(&reply_green_waveformColor_once, &__block_literal_global_265);
  return (id)reply_green_waveformColor_sBehavior;
}

void __38__CKUITheme_reply_green_waveformColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKReplyGreenTextColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_green_waveformColor_sBehavior;
  reply_green_waveformColor_sBehavior = v0;

}

- (id)stewie_waveformColor
{
  if (stewie_waveformColor_once != -1)
    dispatch_once(&stewie_waveformColor_once, &__block_literal_global_266);
  return (id)stewie_waveformColor_sBehavior;
}

void __33__CKUITheme_stewie_waveformColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stewie_waveformColor_sBehavior;
  stewie_waveformColor_sBehavior = v0;

}

- (id)pending_blue_waveformColor
{
  if (pending_blue_waveformColor_once != -1)
    dispatch_once(&pending_blue_waveformColor_once, &__block_literal_global_267);
  return (id)pending_blue_waveformColor_sBehavior;
}

void __39__CKUITheme_pending_blue_waveformColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pending_blue_waveformColor_sBehavior;
  pending_blue_waveformColor_sBehavior = v0;

}

- (id)progressViewColorForColorType:(char)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case -1:
      -[CKUITheme gray_progressViewColor](self, "gray_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      -[CKUITheme green_progressViewColor](self, "green_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[CKUITheme blue_progressViewColor](self, "blue_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[CKUITheme siri_progressViewColor](self, "siri_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[CKUITheme red_progressViewColor](self, "red_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[CKUITheme white_progressViewColor](self, "white_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[CKUITheme black_progressViewColor](self, "black_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[CKUITheme business_progressViewColor](self, "business_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[CKUITheme multiway_progressViewColor](self, "multiway_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[CKUITheme background_progressViewColor](self, "background_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[CKUITheme reply_gray_progressViewColor](self, "reply_gray_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[CKUITheme reply_blue_progressViewColor](self, "reply_blue_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[CKUITheme reply_green_progressViewColor](self, "reply_green_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[CKUITheme stewie_progressViewColor](self, "stewie_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[CKUITheme message_editing_black_progressViewColor](self, "message_editing_black_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[CKUITheme opaque_orb_gray_progressViewColor](self, "opaque_orb_gray_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      -[CKUITheme pending_blue_progressViewColor](self, "pending_blue_progressViewColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)gray_progressViewColor
{
  if (gray_progressViewColor_once != -1)
    dispatch_once(&gray_progressViewColor_once, &__block_literal_global_268);
  return (id)gray_progressViewColor_sBehavior;
}

void __35__CKUITheme_gray_progressViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemBlueColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gray_progressViewColor_sBehavior;
  gray_progressViewColor_sBehavior = v0;

}

- (id)opaque_orb_gray_progressViewColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CKUITheme_opaque_orb_gray_progressViewColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (opaque_orb_gray_progressViewColor_once != -1)
    dispatch_once(&opaque_orb_gray_progressViewColor_once, block);
  return (id)opaque_orb_gray_progressViewColor_sBehavior;
}

void __46__CKUITheme_opaque_orb_gray_progressViewColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "gray_progressViewColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)opaque_orb_gray_progressViewColor_sBehavior;
  opaque_orb_gray_progressViewColor_sBehavior = v1;

}

- (id)green_progressViewColor
{
  if (green_progressViewColor_once != -1)
    dispatch_once(&green_progressViewColor_once, &__block_literal_global_269);
  return (id)green_progressViewColor_sBehavior;
}

void __36__CKUITheme_green_progressViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)green_progressViewColor_sBehavior;
  green_progressViewColor_sBehavior = v0;

}

- (id)blue_progressViewColor
{
  if (blue_progressViewColor_once != -1)
    dispatch_once(&blue_progressViewColor_once, &__block_literal_global_270);
  return (id)blue_progressViewColor_sBehavior;
}

void __35__CKUITheme_blue_progressViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)blue_progressViewColor_sBehavior;
  blue_progressViewColor_sBehavior = v0;

}

- (id)siri_progressViewColor
{
  if (siri_progressViewColor_once != -1)
    dispatch_once(&siri_progressViewColor_once, &__block_literal_global_271);
  return (id)siri_progressViewColor_sBehavior;
}

void __35__CKUITheme_siri_progressViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)siri_progressViewColor_sBehavior;
  siri_progressViewColor_sBehavior = v0;

}

- (id)red_progressViewColor
{
  if (red_progressViewColor_once != -1)
    dispatch_once(&red_progressViewColor_once, &__block_literal_global_272);
  return (id)red_progressViewColor_sBehavior;
}

void __34__CKUITheme_red_progressViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)red_progressViewColor_sBehavior;
  red_progressViewColor_sBehavior = v0;

}

- (id)white_progressViewColor
{
  if (white_progressViewColor_once != -1)
    dispatch_once(&white_progressViewColor_once, &__block_literal_global_273);
  return (id)white_progressViewColor_sBehavior;
}

void __36__CKUITheme_white_progressViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)white_progressViewColor_sBehavior;
  white_progressViewColor_sBehavior = v0;

}

- (id)black_progressViewColor
{
  if (black_progressViewColor_once != -1)
    dispatch_once(&black_progressViewColor_once, &__block_literal_global_274);
  return (id)black_progressViewColor_sBehavior;
}

void __36__CKUITheme_black_progressViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)black_progressViewColor_sBehavior;
  black_progressViewColor_sBehavior = v0;

}

- (id)business_progressViewColor
{
  if (business_progressViewColor_once != -1)
    dispatch_once(&business_progressViewColor_once, &__block_literal_global_275);
  return (id)business_progressViewColor_sBehavior;
}

void __39__CKUITheme_business_progressViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)business_progressViewColor_sBehavior;
  business_progressViewColor_sBehavior = v0;

}

- (id)multiway_progressViewColor
{
  if (multiway_progressViewColor_once != -1)
    dispatch_once(&multiway_progressViewColor_once, &__block_literal_global_276);
  return (id)multiway_progressViewColor_sBehavior;
}

void __39__CKUITheme_multiway_progressViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)multiway_progressViewColor_sBehavior;
  multiway_progressViewColor_sBehavior = v0;

}

- (id)background_progressViewColor
{
  if (background_progressViewColor_once != -1)
    dispatch_once(&background_progressViewColor_once, &__block_literal_global_277);
  return (id)background_progressViewColor_sBehavior;
}

void __41__CKUITheme_background_progressViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)background_progressViewColor_sBehavior;
  background_progressViewColor_sBehavior = v0;

}

- (id)message_editing_black_progressViewColor
{
  if (message_editing_black_progressViewColor_once != -1)
    dispatch_once(&message_editing_black_progressViewColor_once, &__block_literal_global_278);
  return (id)message_editing_black_progressViewColor_sBehavior;
}

void __52__CKUITheme_message_editing_black_progressViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)message_editing_black_progressViewColor_sBehavior;
  message_editing_black_progressViewColor_sBehavior = v0;

}

- (id)reply_gray_progressViewColor
{
  if (reply_gray_progressViewColor_once != -1)
    dispatch_once(&reply_gray_progressViewColor_once, &__block_literal_global_279);
  return (id)reply_gray_progressViewColor_sBehavior;
}

void __41__CKUITheme_reply_gray_progressViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemBlueColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_gray_progressViewColor_sBehavior;
  reply_gray_progressViewColor_sBehavior = v0;

}

- (id)reply_blue_progressViewColor
{
  if (reply_blue_progressViewColor_once != -1)
    dispatch_once(&reply_blue_progressViewColor_once, &__block_literal_global_280);
  return (id)reply_blue_progressViewColor_sBehavior;
}

void __41__CKUITheme_reply_blue_progressViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemBlueColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_blue_progressViewColor_sBehavior;
  reply_blue_progressViewColor_sBehavior = v0;

}

- (id)reply_green_progressViewColor
{
  if (reply_green_progressViewColor_once != -1)
    dispatch_once(&reply_green_progressViewColor_once, &__block_literal_global_281);
  return (id)reply_green_progressViewColor_sBehavior;
}

void __42__CKUITheme_reply_green_progressViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemGreenColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_green_progressViewColor_sBehavior;
  reply_green_progressViewColor_sBehavior = v0;

}

- (id)stewie_progressViewColor
{
  if (stewie_progressViewColor_once != -1)
    dispatch_once(&stewie_progressViewColor_once, &__block_literal_global_284);
  return (id)stewie_progressViewColor_sBehavior;
}

void __37__CKUITheme_stewie_progressViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stewie_progressViewColor_sBehavior;
  stewie_progressViewColor_sBehavior = v0;

}

- (id)pending_blue_progressViewColor
{
  if (pending_blue_progressViewColor_once != -1)
    dispatch_once(&pending_blue_progressViewColor_once, &__block_literal_global_285);
  return (id)pending_blue_progressViewColor_sBehavior;
}

void __43__CKUITheme_pending_blue_progressViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pending_blue_progressViewColor_sBehavior;
  pending_blue_progressViewColor_sBehavior = v0;

}

- (UIColor)waveformUnplayedColor
{
  if (waveformUnplayedColor_once != -1)
    dispatch_once(&waveformUnplayedColor_once, &__block_literal_global_286);
  return (UIColor *)(id)waveformUnplayedColor_sBehavior;
}

void __34__CKUITheme_waveformUnplayedColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemBlueColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)waveformUnplayedColor_sBehavior;
  waveformUnplayedColor_sBehavior = v0;

}

- (UIColor)waveformUnplayedColorNewAudioMessagesFlow
{
  if (waveformUnplayedColorNewAudioMessagesFlow_once != -1)
    dispatch_once(&waveformUnplayedColorNewAudioMessagesFlow_once, &__block_literal_global_287);
  return (UIColor *)(id)waveformUnplayedColorNewAudioMessagesFlow_sBehavior;
}

void __54__CKUITheme_waveformUnplayedColorNewAudioMessagesFlow__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)waveformUnplayedColorNewAudioMessagesFlow_sBehavior;
  waveformUnplayedColorNewAudioMessagesFlow_sBehavior = v0;

}

- (UIColor)waveformDisabledColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CKUITheme_waveformDisabledColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (waveformDisabledColor_once != -1)
    dispatch_once(&waveformDisabledColor_once, block);
  return (UIColor *)(id)waveformDisabledColor_sBehavior;
}

void __34__CKUITheme_waveformDisabledColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "lightGrayColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)waveformDisabledColor_sBehavior;
  waveformDisabledColor_sBehavior = v1;

}

- (id)recipientTextColorForColorType:(char)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  switch(a3)
  {
    case -1:
    case 14:
      objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 0:
    case 11:
      -[CKUITheme green_balloonColors](self, "green_balloonColors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
    case 10:
    case 15:
      -[CKUITheme blue_balloonColors](self, "blue_balloonColors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      -[CKUITheme siri_balloonColors](self, "siri_balloonColors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v5 = v3;
      objc_msgSend(v3, "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    case 3:
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 4:
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 5:
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 6:
    case 7:
    case 12:
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 9:
      objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 13:
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    default:
      objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v6 = (void *)v4;
      return v6;
  }
}

- (int64_t)toFieldBackdropStyle
{
  if (toFieldBackdropStyle_once != -1)
    dispatch_once(&toFieldBackdropStyle_once, &__block_literal_global_289);
  if (toFieldBackdropStyle_sBehavior)
    return 2010;
  else
    return 0;
}

void __33__CKUITheme_toFieldBackdropStyle__block_invoke()
{
  toFieldBackdropStyle_sBehavior = 1;
}

- (UIColor)searchResultsBackgroundColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CKUITheme_searchResultsBackgroundColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (searchResultsBackgroundColor_once != -1)
    dispatch_once(&searchResultsBackgroundColor_once, block);
  return (UIColor *)(id)searchResultsBackgroundColor_sBehavior;
}

void __41__CKUITheme_searchResultsBackgroundColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "transcriptBackgroundColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)searchResultsBackgroundColor_sBehavior;
  searchResultsBackgroundColor_sBehavior = v1;

}

- (UIColor)recipientSelectionBackgroundPlatterColor
{
  if (recipientSelectionBackgroundPlatterColor_once != -1)
    dispatch_once(&recipientSelectionBackgroundPlatterColor_once, &__block_literal_global_290);
  return (UIColor *)(id)recipientSelectionBackgroundPlatterColor_sBehavior;
}

void __53__CKUITheme_recipientSelectionBackgroundPlatterColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)recipientSelectionBackgroundPlatterColor_sBehavior;
  recipientSelectionBackgroundPlatterColor_sBehavior = v0;

}

- (int64_t)entryViewStyle
{
  if (entryViewStyle_once != -1)
    dispatch_once(&entryViewStyle_once, &__block_literal_global_291);
  if (entryViewStyle_sBehavior)
    return 4;
  else
    return 0;
}

void __27__CKUITheme_entryViewStyle__block_invoke()
{
  entryViewStyle_sBehavior = 1;
}

- (int64_t)entryViewDarkStyle
{
  if (entryViewDarkStyle_once != -1)
    dispatch_once(&entryViewDarkStyle_once, &__block_literal_global_292);
  if (entryViewDarkStyle_sBehavior)
    return 2;
  else
    return 0;
}

void __31__CKUITheme_entryViewDarkStyle__block_invoke()
{
  entryViewDarkStyle_sBehavior = 1;
}

- (int64_t)keyboardDarkAppearance
{
  if (keyboardDarkAppearance_once != -1)
    dispatch_once(&keyboardDarkAppearance_once, &__block_literal_global_294);
  return keyboardDarkAppearance_sBehavior;
}

void __35__CKUITheme_keyboardDarkAppearance__block_invoke()
{
  keyboardDarkAppearance_sBehavior = 1;
}

- (id)entryViewBackdropSettings
{
  if (entryViewBackdropSettings_once != -1)
    dispatch_once(&entryViewBackdropSettings_once, &__block_literal_global_295);
  return (id)entryViewBackdropSettings_sBehavior;
}

void __38__CKUITheme_entryViewBackdropSettings__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:", 2010);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setGrayscaleTintLevel:", 1.0);
  v1 = (void *)entryViewBackdropSettings_sBehavior;
  entryViewBackdropSettings_sBehavior = (uint64_t)v0;

}

- (id)entryViewDarkBackdropSettings
{
  if (entryViewDarkBackdropSettings_once != -1)
    dispatch_once(&entryViewDarkBackdropSettings_once, &__block_literal_global_297);
  return (id)entryViewDarkBackdropSettings_sBehavior;
}

void __42__CKUITheme_entryViewDarkBackdropSettings__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:", 2030);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryViewDarkBackdropSettings_sBehavior;
  entryViewDarkBackdropSettings_sBehavior = v0;

}

- (id)entryViewTransparentBackdropSettings
{
  if (entryViewTransparentBackdropSettings_once != -1)
    dispatch_once(&entryViewTransparentBackdropSettings_once, &__block_literal_global_298);
  return (id)entryViewTransparentBackdropSettings_sBehavior;
}

void __49__CKUITheme_entryViewTransparentBackdropSettings__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:", 2010);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setGrayscaleTintLevel:", 1.0);
  objc_msgSend(v0, "setGrayscaleTintAlpha:", 0.0);
  v1 = (void *)entryViewTransparentBackdropSettings_sBehavior;
  entryViewTransparentBackdropSettings_sBehavior = (uint64_t)v0;

}

- (id)sendButtonColorForColorType:(char)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case -1:
      -[CKUITheme gray_sendButtonColor](self, "gray_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      -[CKUITheme green_sendButtonColor](self, "green_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[CKUITheme blue_sendButtonColor](self, "blue_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[CKUITheme siri_sendButtonColor](self, "siri_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[CKUITheme red_sendButtonColor](self, "red_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[CKUITheme white_sendButtonColor](self, "white_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[CKUITheme black_sendButtonColor](self, "black_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[CKUITheme business_sendButtonColor](self, "business_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[CKUITheme multiway_sendButtonColor](self, "multiway_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[CKUITheme background_sendButtonColor](self, "background_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[CKUITheme reply_gray_sendButtonColor](self, "reply_gray_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[CKUITheme reply_blue_sendButtonColor](self, "reply_blue_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[CKUITheme reply_green_sendButtonColor](self, "reply_green_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[CKUITheme stewie_sendButtonColor](self, "stewie_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[CKUITheme message_editing_black_sendButtonColor](self, "message_editing_black_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[CKUITheme opaque_orb_gray_sendButtonColor](self, "opaque_orb_gray_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      -[CKUITheme pending_blue_sendButtonColor](self, "pending_blue_sendButtonColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)gray_sendButtonColor
{
  int v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)gray_sendButtonColor_sBehavior;
  if (gray_sendButtonColor_sBehavior)
    v5 = gray_sendButtonColor_sIsIncreaseContrastEnabled_gray_sendButtonColor == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme grayTextColor](self, "grayTextColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)gray_sendButtonColor_sBehavior;
    gray_sendButtonColor_sBehavior = v6;

    gray_sendButtonColor_sIsIncreaseContrastEnabled_gray_sendButtonColor = v3;
    v4 = (void *)gray_sendButtonColor_sBehavior;
  }
  return v4;
}

- (id)opaque_orb_gray_sendButtonColor
{
  int v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)opaque_orb_gray_sendButtonColor_sBehavior;
  if (opaque_orb_gray_sendButtonColor_sBehavior)
    v5 = opaque_orb_gray_sendButtonColor_sIsIncreaseContrastEnabled_opaque_orb_gray_sendButtonColor == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme gray_sendButtonColor](self, "gray_sendButtonColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)opaque_orb_gray_sendButtonColor_sBehavior;
    opaque_orb_gray_sendButtonColor_sBehavior = v6;

    opaque_orb_gray_sendButtonColor_sIsIncreaseContrastEnabled_opaque_orb_gray_sendButtonColor = v3;
    v4 = (void *)opaque_orb_gray_sendButtonColor_sBehavior;
  }
  return v4;
}

- (id)green_sendButtonColor
{
  int v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)green_sendButtonColor_sBehavior;
  if (green_sendButtonColor_sBehavior)
    v5 = green_sendButtonColor_sIsIncreaseContrastEnabled_green_sendButtonColor == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme balloonColorsForColorType:](self, "balloonColorsForColorType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)green_sendButtonColor_sBehavior;
    green_sendButtonColor_sBehavior = v7;

    green_sendButtonColor_sIsIncreaseContrastEnabled_green_sendButtonColor = v3;
    v4 = (void *)green_sendButtonColor_sBehavior;
  }
  return v4;
}

- (id)blue_sendButtonColor
{
  int v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)blue_sendButtonColor_sBehavior;
  if (blue_sendButtonColor_sBehavior)
    v5 = blue_sendButtonColor_sIsIncreaseContrastEnabled_blue_sendButtonColor == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme balloonColorsForColorType:](self, "balloonColorsForColorType:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)blue_sendButtonColor_sBehavior;
    blue_sendButtonColor_sBehavior = v7;

    blue_sendButtonColor_sIsIncreaseContrastEnabled_blue_sendButtonColor = v3;
    v4 = (void *)blue_sendButtonColor_sBehavior;
  }
  return v4;
}

- (id)siri_sendButtonColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CKUITheme_siri_sendButtonColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (siri_sendButtonColor_once != -1)
    dispatch_once(&siri_sendButtonColor_once, block);
  return (id)siri_sendButtonColor_sBehavior;
}

void __33__CKUITheme_siri_sendButtonColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "balloonColorsForColorType:", 2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)siri_sendButtonColor_sBehavior;
  siri_sendButtonColor_sBehavior = v1;

}

- (id)red_sendButtonColor
{
  if (red_sendButtonColor_once != -1)
    dispatch_once(&red_sendButtonColor_once, &__block_literal_global_299);
  return (id)red_sendButtonColor_sBehavior;
}

void __32__CKUITheme_red_sendButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)red_sendButtonColor_sBehavior;
  red_sendButtonColor_sBehavior = v0;

}

- (id)white_sendButtonColor
{
  if (white_sendButtonColor_once != -1)
    dispatch_once(&white_sendButtonColor_once, &__block_literal_global_300);
  return (id)white_sendButtonColor_sBehavior;
}

void __34__CKUITheme_white_sendButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)white_sendButtonColor_sBehavior;
  white_sendButtonColor_sBehavior = v0;

}

- (id)black_sendButtonColor
{
  if (black_sendButtonColor_once != -1)
    dispatch_once(&black_sendButtonColor_once, &__block_literal_global_301);
  return (id)black_sendButtonColor_sBehavior;
}

void __34__CKUITheme_black_sendButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)black_sendButtonColor_sBehavior;
  black_sendButtonColor_sBehavior = v0;

}

- (id)business_sendButtonColor
{
  if (business_sendButtonColor_once != -1)
    dispatch_once(&business_sendButtonColor_once, &__block_literal_global_302);
  return (id)business_sendButtonColor_sBehavior;
}

void __37__CKUITheme_business_sendButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("Business_SendButtonColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)business_sendButtonColor_sBehavior;
  business_sendButtonColor_sBehavior = v0;

}

- (id)multiway_sendButtonColor
{
  int v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)multiway_sendButtonColor_sBehavior;
  if (multiway_sendButtonColor_sBehavior)
    v5 = multiway_sendButtonColor_sIsIncreaseContrastEnabled_multiway_sendButtonColor == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme grayTextColor](self, "grayTextColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)multiway_sendButtonColor_sBehavior;
    multiway_sendButtonColor_sBehavior = v6;

    multiway_sendButtonColor_sIsIncreaseContrastEnabled_multiway_sendButtonColor = v3;
    v4 = (void *)multiway_sendButtonColor_sBehavior;
  }
  return v4;
}

- (id)background_sendButtonColor
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (void *)background_sendButtonColor_sBehavior;
  if (background_sendButtonColor_sBehavior)
    v4 = background_sendButtonColor_sIsIncreaseContrastEnabled_background_sendButtonColor == v2;
  else
    v4 = 0;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)background_sendButtonColor_sBehavior;
    background_sendButtonColor_sBehavior = v5;

    background_sendButtonColor_sIsIncreaseContrastEnabled_background_sendButtonColor = v2;
    v3 = (void *)background_sendButtonColor_sBehavior;
  }
  return v3;
}

- (id)message_editing_black_sendButtonColor
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (void *)message_editing_black_sendButtonColor_sBehavior;
  if (message_editing_black_sendButtonColor_sBehavior)
    v4 = message_editing_black_sendButtonColor_sIsIncreaseContrastEnabled_message_editing_black_sendButtonColor == v2;
  else
    v4 = 0;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)message_editing_black_sendButtonColor_sBehavior;
    message_editing_black_sendButtonColor_sBehavior = v5;

    message_editing_black_sendButtonColor_sIsIncreaseContrastEnabled_message_editing_black_sendButtonColor = v2;
    v3 = (void *)message_editing_black_sendButtonColor_sBehavior;
  }
  return v3;
}

- (id)reply_gray_sendButtonColor
{
  int v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)reply_gray_sendButtonColor_sBehavior;
  if (reply_gray_sendButtonColor_sBehavior)
    v5 = reply_gray_sendButtonColor_sIsIncreaseContrastEnabled_reply_gray_sendButtonColor == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme grayTextColor](self, "grayTextColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)reply_gray_sendButtonColor_sBehavior;
    reply_gray_sendButtonColor_sBehavior = v6;

    reply_gray_sendButtonColor_sIsIncreaseContrastEnabled_reply_gray_sendButtonColor = v3;
    v4 = (void *)reply_gray_sendButtonColor_sBehavior;
  }
  return v4;
}

- (id)reply_blue_sendButtonColor
{
  int v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)reply_blue_sendButtonColor_sBehavior;
  if (reply_blue_sendButtonColor_sBehavior)
    v5 = reply_blue_sendButtonColor_sIsIncreaseContrastEnabled_reply_blue_sendButtonColor == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme balloonColorsForColorType:](self, "balloonColorsForColorType:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)reply_blue_sendButtonColor_sBehavior;
    reply_blue_sendButtonColor_sBehavior = v7;

    reply_blue_sendButtonColor_sIsIncreaseContrastEnabled_reply_blue_sendButtonColor = v3;
    v4 = (void *)reply_blue_sendButtonColor_sBehavior;
  }
  return v4;
}

- (id)reply_green_sendButtonColor
{
  int v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)reply_green_sendButtonColor_sBehavior;
  if (reply_green_sendButtonColor_sBehavior)
    v5 = reply_green_sendButtonColor_sIsIncreaseContrastEnabled_reply_green_sendButtonColor == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme balloonColorsForColorType:](self, "balloonColorsForColorType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)reply_green_sendButtonColor_sBehavior;
    reply_green_sendButtonColor_sBehavior = v7;

    reply_green_sendButtonColor_sIsIncreaseContrastEnabled_reply_green_sendButtonColor = v3;
    v4 = (void *)reply_green_sendButtonColor_sBehavior;
  }
  return v4;
}

- (id)stewie_sendButtonColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CKUITheme_stewie_sendButtonColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (stewie_sendButtonColor_once != -1)
    dispatch_once(&stewie_sendButtonColor_once, block);
  return (id)stewie_sendButtonColor_sBehavior;
}

void __35__CKUITheme_stewie_sendButtonColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "grayTextColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)stewie_sendButtonColor_sBehavior;
  stewie_sendButtonColor_sBehavior = v1;

}

- (id)pending_blue_sendButtonColor
{
  if (pending_blue_sendButtonColor_once != -1)
    dispatch_once(&pending_blue_sendButtonColor_once, &__block_literal_global_305);
  return (id)pending_blue_sendButtonColor_sBehavior;
}

void __41__CKUITheme_pending_blue_sendButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("SendLater_SendButtonColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pending_blue_sendButtonColor_sBehavior;
  pending_blue_sendButtonColor_sBehavior = v0;

}

- (char)applyPayCashSendButtonColorForEntryViewStyle:(int64_t)a3
{
  if (CKMessageEntryViewStyleIsForDarkAppearance(a3))
    return 4;
  else
    return 5;
}

- (id)sendButtonArrowColorForColorType:(char)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case -1:
      -[CKUITheme gray_sendButtonArrowColor](self, "gray_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      -[CKUITheme green_sendButtonArrowColor](self, "green_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[CKUITheme blue_sendButtonArrowColor](self, "blue_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[CKUITheme siri_sendButtonArrowColor](self, "siri_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[CKUITheme red_sendButtonArrowColor](self, "red_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[CKUITheme white_sendButtonArrowColor](self, "white_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[CKUITheme black_sendButtonArrowColor](self, "black_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[CKUITheme business_sendButtonArrowColor](self, "business_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[CKUITheme multiway_sendButtonArrowColor](self, "multiway_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[CKUITheme background_sendButtonArrowColor](self, "background_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[CKUITheme reply_gray_sendButtonArrowColor](self, "reply_gray_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[CKUITheme reply_blue_sendButtonArrowColor](self, "reply_blue_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[CKUITheme reply_green_sendButtonArrowColor](self, "reply_green_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[CKUITheme stewie_sendButtonArrowColor](self, "stewie_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[CKUITheme message_editing_black_sendButtonArrowColor](self, "message_editing_black_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[CKUITheme opaque_orb_gray_sendButtonArrowColor](self, "opaque_orb_gray_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      -[CKUITheme pending_blue_sendButtonArrowColor](self, "pending_blue_sendButtonArrowColor", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)gray_sendButtonArrowColor
{
  if (gray_sendButtonArrowColor_once != -1)
    dispatch_once(&gray_sendButtonArrowColor_once, &__block_literal_global_308);
  return (id)gray_sendButtonArrowColor_sBehavior;
}

void __38__CKUITheme_gray_sendButtonArrowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gray_sendButtonArrowColor_sBehavior;
  gray_sendButtonArrowColor_sBehavior = v0;

}

- (id)opaque_orb_gray_sendButtonArrowColor
{
  if (opaque_orb_gray_sendButtonArrowColor_once != -1)
    dispatch_once(&opaque_orb_gray_sendButtonArrowColor_once, &__block_literal_global_309);
  return (id)opaque_orb_gray_sendButtonArrowColor_sBehavior;
}

void __49__CKUITheme_opaque_orb_gray_sendButtonArrowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)opaque_orb_gray_sendButtonArrowColor_sBehavior;
  opaque_orb_gray_sendButtonArrowColor_sBehavior = v0;

}

- (id)green_sendButtonArrowColor
{
  if (green_sendButtonArrowColor_once != -1)
    dispatch_once(&green_sendButtonArrowColor_once, &__block_literal_global_310);
  return (id)green_sendButtonArrowColor_sBehavior;
}

void __39__CKUITheme_green_sendButtonArrowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)green_sendButtonArrowColor_sBehavior;
  green_sendButtonArrowColor_sBehavior = v0;

}

- (id)blue_sendButtonArrowColor
{
  if (blue_sendButtonArrowColor_once != -1)
    dispatch_once(&blue_sendButtonArrowColor_once, &__block_literal_global_311);
  return (id)blue_sendButtonArrowColor_sBehavior;
}

void __38__CKUITheme_blue_sendButtonArrowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)blue_sendButtonArrowColor_sBehavior;
  blue_sendButtonArrowColor_sBehavior = v0;

}

- (id)siri_sendButtonArrowColor
{
  if (siri_sendButtonArrowColor_once != -1)
    dispatch_once(&siri_sendButtonArrowColor_once, &__block_literal_global_312);
  return (id)siri_sendButtonArrowColor_sBehavior;
}

void __38__CKUITheme_siri_sendButtonArrowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)siri_sendButtonArrowColor_sBehavior;
  siri_sendButtonArrowColor_sBehavior = v0;

}

- (id)red_sendButtonArrowColor
{
  if (red_sendButtonArrowColor_once != -1)
    dispatch_once(&red_sendButtonArrowColor_once, &__block_literal_global_313);
  return (id)red_sendButtonArrowColor_sBehavior;
}

void __37__CKUITheme_red_sendButtonArrowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)red_sendButtonArrowColor_sBehavior;
  red_sendButtonArrowColor_sBehavior = v0;

}

- (id)white_sendButtonArrowColor
{
  if (white_sendButtonArrowColor_once != -1)
    dispatch_once(&white_sendButtonArrowColor_once, &__block_literal_global_314);
  return (id)white_sendButtonArrowColor_sBehavior;
}

void __39__CKUITheme_white_sendButtonArrowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)white_sendButtonArrowColor_sBehavior;
  white_sendButtonArrowColor_sBehavior = v0;

}

- (id)black_sendButtonArrowColor
{
  if (black_sendButtonArrowColor_once != -1)
    dispatch_once(&black_sendButtonArrowColor_once, &__block_literal_global_315);
  return (id)black_sendButtonArrowColor_sBehavior;
}

void __39__CKUITheme_black_sendButtonArrowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)black_sendButtonArrowColor_sBehavior;
  black_sendButtonArrowColor_sBehavior = v0;

}

- (id)business_sendButtonArrowColor
{
  if (business_sendButtonArrowColor_once != -1)
    dispatch_once(&business_sendButtonArrowColor_once, &__block_literal_global_316);
  return (id)business_sendButtonArrowColor_sBehavior;
}

void __42__CKUITheme_business_sendButtonArrowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)business_sendButtonArrowColor_sBehavior;
  business_sendButtonArrowColor_sBehavior = v0;

}

- (id)multiway_sendButtonArrowColor
{
  if (multiway_sendButtonArrowColor_once != -1)
    dispatch_once(&multiway_sendButtonArrowColor_once, &__block_literal_global_317);
  return (id)multiway_sendButtonArrowColor_sBehavior;
}

void __42__CKUITheme_multiway_sendButtonArrowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)multiway_sendButtonArrowColor_sBehavior;
  multiway_sendButtonArrowColor_sBehavior = v0;

}

- (id)background_sendButtonArrowColor
{
  if (background_sendButtonArrowColor_once != -1)
    dispatch_once(&background_sendButtonArrowColor_once, &__block_literal_global_318);
  return (id)background_sendButtonArrowColor_sBehavior;
}

void __44__CKUITheme_background_sendButtonArrowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)background_sendButtonArrowColor_sBehavior;
  background_sendButtonArrowColor_sBehavior = v0;

}

- (id)message_editing_black_sendButtonArrowColor
{
  if (message_editing_black_sendButtonArrowColor_once != -1)
    dispatch_once(&message_editing_black_sendButtonArrowColor_once, &__block_literal_global_319);
  return (id)message_editing_black_sendButtonArrowColor_sBehavior;
}

void __55__CKUITheme_message_editing_black_sendButtonArrowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)message_editing_black_sendButtonArrowColor_sBehavior;
  message_editing_black_sendButtonArrowColor_sBehavior = v0;

}

- (id)reply_gray_sendButtonArrowColor
{
  if (reply_gray_sendButtonArrowColor_once != -1)
    dispatch_once(&reply_gray_sendButtonArrowColor_once, &__block_literal_global_320);
  return (id)reply_gray_sendButtonArrowColor_sBehavior;
}

void __44__CKUITheme_reply_gray_sendButtonArrowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_gray_sendButtonArrowColor_sBehavior;
  reply_gray_sendButtonArrowColor_sBehavior = v0;

}

- (id)reply_blue_sendButtonArrowColor
{
  if (reply_blue_sendButtonArrowColor_once != -1)
    dispatch_once(&reply_blue_sendButtonArrowColor_once, &__block_literal_global_321);
  return (id)reply_blue_sendButtonArrowColor_sBehavior;
}

void __44__CKUITheme_reply_blue_sendButtonArrowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_blue_sendButtonArrowColor_sBehavior;
  reply_blue_sendButtonArrowColor_sBehavior = v0;

}

- (id)reply_green_sendButtonArrowColor
{
  if (reply_green_sendButtonArrowColor_once != -1)
    dispatch_once(&reply_green_sendButtonArrowColor_once, &__block_literal_global_322);
  return (id)reply_green_sendButtonArrowColor_sBehavior;
}

void __45__CKUITheme_reply_green_sendButtonArrowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_green_sendButtonArrowColor_sBehavior;
  reply_green_sendButtonArrowColor_sBehavior = v0;

}

- (id)stewie_sendButtonArrowColor
{
  if (stewie_sendButtonArrowColor_once != -1)
    dispatch_once(&stewie_sendButtonArrowColor_once, &__block_literal_global_323);
  return (id)stewie_sendButtonArrowColor_sBehavior;
}

void __40__CKUITheme_stewie_sendButtonArrowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stewie_sendButtonArrowColor_sBehavior;
  stewie_sendButtonArrowColor_sBehavior = v0;

}

- (id)pending_blue_sendButtonArrowColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CKUITheme_pending_blue_sendButtonArrowColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (pending_blue_sendButtonArrowColor_once != -1)
    dispatch_once(&pending_blue_sendButtonArrowColor_once, block);
  return (id)pending_blue_sendButtonArrowColor_sBehavior;
}

void __46__CKUITheme_pending_blue_sendButtonArrowColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "balloonTextColorForColorType:", 15);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)pending_blue_sendButtonArrowColor_sBehavior;
  pending_blue_sendButtonArrowColor_sBehavior = v1;

}

- (UIColor)entryFieldButtonColor
{
  if (entryFieldButtonColor_once != -1)
    dispatch_once(&entryFieldButtonColor_once, &__block_literal_global_324);
  return (UIColor *)(id)entryFieldButtonColor_sBehavior;
}

void __34__CKUITheme_entryFieldButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("EntryFieldButtonColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldButtonColor_sBehavior;
  entryFieldButtonColor_sBehavior = v0;

}

- (UIColor)entryFieldHighlightedButtonColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CKUITheme_entryFieldHighlightedButtonColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (entryFieldHighlightedButtonColor_once != -1)
    dispatch_once(&entryFieldHighlightedButtonColor_once, block);
  return (UIColor *)(id)entryFieldHighlightedButtonColor_sBehavior;
}

void __45__CKUITheme_entryFieldHighlightedButtonColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "appTintColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)entryFieldHighlightedButtonColor_sBehavior;
  entryFieldHighlightedButtonColor_sBehavior = v1;

}

- (UIColor)entryFieldDarkEffectButtonColor
{
  if (entryFieldDarkEffectButtonColor_once != -1)
    dispatch_once(&entryFieldDarkEffectButtonColor_once, &__block_literal_global_327);
  return (UIColor *)(id)entryFieldDarkEffectButtonColor_sBehavior;
}

void __44__CKUITheme_entryFieldDarkEffectButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("EntryFieldDarkEffectButtonColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldDarkEffectButtonColor_sBehavior;
  entryFieldDarkEffectButtonColor_sBehavior = v0;

}

- (UIColor)entryFieldDarkStyleHighlightedButtonColor
{
  if (entryFieldDarkStyleHighlightedButtonColor_once != -1)
    dispatch_once(&entryFieldDarkStyleHighlightedButtonColor_once, &__block_literal_global_330);
  return (UIColor *)(id)entryFieldDarkStyleHighlightedButtonColor_sBehavior;
}

void __54__CKUITheme_entryFieldDarkStyleHighlightedButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldDarkStyleHighlightedButtonColor_sBehavior;
  entryFieldDarkStyleHighlightedButtonColor_sBehavior = v0;

}

- (UIColor)dashedEntryFieldBorderColor
{
  if (dashedEntryFieldBorderColor_once != -1)
    dispatch_once(&dashedEntryFieldBorderColor_once, &__block_literal_global_331);
  return (UIColor *)(id)dashedEntryFieldBorderColor_sBehavior;
}

void __40__CKUITheme_dashedEntryFieldBorderColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("DashedEntryFieldBorderColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dashedEntryFieldBorderColor_sBehavior;
  dashedEntryFieldBorderColor_sBehavior = v0;

}

- (UIColor)entryFieldBorderColor
{
  if (entryFieldBorderColor_once != -1)
    dispatch_once(&entryFieldBorderColor_once, &__block_literal_global_334);
  return (UIColor *)(id)entryFieldBorderColor_sBehavior;
}

void __34__CKUITheme_entryFieldBorderColor__block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isSendMenuEnabled");

  v2 = (void *)MEMORY[0x1E0CEA478];
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.11372549, 0.117647059, 0.121568627, 0.14);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.941176471, 0.97254902, 1.0, 0.14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dynamicColorWithLightColor:darkColor:", v3, v4);
    v5 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)entryFieldBorderColor_sBehavior;
  entryFieldBorderColor_sBehavior = v5;

}

- (UIColor)messageEntryViewTextFieldBackgroundColor
{
  if (messageEntryViewTextFieldBackgroundColor_once != -1)
    dispatch_once(&messageEntryViewTextFieldBackgroundColor_once, &__block_literal_global_336);
  return (UIColor *)(id)messageEntryViewTextFieldBackgroundColor_sBehavior;
}

void __53__CKUITheme_messageEntryViewTextFieldBackgroundColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dynamicColorWithLightColor:darkColor:", v1, v2);
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)messageEntryViewTextFieldBackgroundColor_sBehavior;
  messageEntryViewTextFieldBackgroundColor_sBehavior = v3;

}

- (NSArray)messageEntryViewTextFieldBackgroundEffects
{
  if (messageEntryViewTextFieldBackgroundEffects_once != -1)
    dispatch_once(&messageEntryViewTextFieldBackgroundEffects_once, &__block_literal_global_337);
  return (NSArray *)(id)messageEntryViewTextFieldBackgroundEffects_sBehavior;
}

void __55__CKUITheme_messageEntryViewTextFieldBackgroundEffects__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 24.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v1);

  v2 = objc_msgSend(v0, "copy");
  v3 = (void *)messageEntryViewTextFieldBackgroundEffects_sBehavior;
  messageEntryViewTextFieldBackgroundEffects_sBehavior = v2;

}

- (UIColor)entryFieldCoverFillColor
{
  if (entryFieldCoverFillColor_once != -1)
    dispatch_once(&entryFieldCoverFillColor_once, &__block_literal_global_341);
  return (UIColor *)(id)entryFieldCoverFillColor_sBehavior;
}

void __37__CKUITheme_entryFieldCoverFillColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "_ckSystemBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldCoverFillColor_sBehavior;
  entryFieldCoverFillColor_sBehavior = v0;

}

- (UIColor)entryFieldCoverBorderColor
{
  if (entryFieldCoverBorderColor_once != -1)
    dispatch_once(&entryFieldCoverBorderColor_once, &__block_literal_global_342);
  return (UIColor *)(id)entryFieldCoverBorderColor_sBehavior;
}

void __39__CKUITheme_entryFieldCoverBorderColor__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("EntryFieldGrayColor"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dynamicColorWithLightColor:darkColor:", v4, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)entryFieldCoverBorderColor_sBehavior;
  entryFieldCoverBorderColor_sBehavior = v2;

}

- (UIColor)entryFieldCoverFillDarkColor
{
  if (entryFieldCoverFillDarkColor_once != -1)
    dispatch_once(&entryFieldCoverFillDarkColor_once, &__block_literal_global_343);
  return (UIColor *)(id)entryFieldCoverFillDarkColor_sBehavior;
}

void __41__CKUITheme_entryFieldCoverFillDarkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldCoverFillDarkColor_sBehavior;
  entryFieldCoverFillDarkColor_sBehavior = v0;

}

- (UIColor)entryFieldDividerColor
{
  if (entryFieldDividerColor_once != -1)
    dispatch_once(&entryFieldDividerColor_once, &__block_literal_global_344);
  return (UIColor *)(id)entryFieldDividerColor_sBehavior;
}

void __35__CKUITheme_entryFieldDividerColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("EntryFieldDividerColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldDividerColor_sBehavior;
  entryFieldDividerColor_sBehavior = v0;

}

- (UIColor)entryFieldPlaceholderColor
{
  if (entryFieldPlaceholderColor_once != -1)
    dispatch_once(&entryFieldPlaceholderColor_once, &__block_literal_global_347);
  return (UIColor *)(id)entryFieldPlaceholderColor_sBehavior;
}

void __39__CKUITheme_entryFieldPlaceholderColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldPlaceholderColor_sBehavior;
  entryFieldPlaceholderColor_sBehavior = v0;

}

- (UIColor)entryFieldPlaceholderTextColor
{
  if (entryFieldPlaceholderTextColor_once != -1)
    dispatch_once(&entryFieldPlaceholderTextColor_once, &__block_literal_global_349);
  return (UIColor *)(id)entryFieldPlaceholderTextColor_sBehavior;
}

void __43__CKUITheme_entryFieldPlaceholderTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldPlaceholderTextColor_sBehavior;
  entryFieldPlaceholderTextColor_sBehavior = v0;

}

- (UIColor)entryFieldDarkTextColor
{
  if (entryFieldDarkTextColor_once != -1)
    dispatch_once(&entryFieldDarkTextColor_once, &__block_literal_global_350);
  return (UIColor *)(id)entryFieldDarkTextColor_sBehavior;
}

void __36__CKUITheme_entryFieldDarkTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldDarkTextColor_sBehavior;
  entryFieldDarkTextColor_sBehavior = v0;

}

- (UIColor)entryFieldLinkColor
{
  if (entryFieldLinkColor_once != -1)
    dispatch_once(&entryFieldLinkColor_once, &__block_literal_global_351);
  return (UIColor *)(id)entryFieldLinkColor_sBehavior;
}

void __32__CKUITheme_entryFieldLinkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldLinkColor_sBehavior;
  entryFieldLinkColor_sBehavior = v0;

}

- (UIColor)entryFieldAudioRecordingBalloonColor
{
  if (entryFieldAudioRecordingBalloonColor_once != -1)
    dispatch_once(&entryFieldAudioRecordingBalloonColor_once, &__block_literal_global_352);
  return (UIColor *)(id)entryFieldAudioRecordingBalloonColor_sBehavior;
}

void __49__CKUITheme_entryFieldAudioRecordingBalloonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("EntryFieldAudioRecordingBalloonColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldAudioRecordingBalloonColor_sBehavior;
  entryFieldAudioRecordingBalloonColor_sBehavior = v0;

}

- (UIColor)entryFieldSendLaterBalloonColor
{
  if (entryFieldSendLaterBalloonColor_once != -1)
    dispatch_once(&entryFieldSendLaterBalloonColor_once, &__block_literal_global_355);
  return (UIColor *)(id)entryFieldSendLaterBalloonColor_sBehavior;
}

void __44__CKUITheme_entryFieldSendLaterBalloonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("EntryFieldSendLaterBalloonColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldSendLaterBalloonColor_sBehavior;
  entryFieldSendLaterBalloonColor_sBehavior = v0;

}

- (UIColor)entryFieldSendLaterPressedBalloonColor
{
  if (entryFieldSendLaterPressedBalloonColor_once != -1)
    dispatch_once(&entryFieldSendLaterPressedBalloonColor_once, &__block_literal_global_358);
  return (UIColor *)(id)entryFieldSendLaterPressedBalloonColor_sBehavior;
}

void __51__CKUITheme_entryFieldSendLaterPressedBalloonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("EntryFieldSendLaterPressedBalloonColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldSendLaterPressedBalloonColor_sBehavior;
  entryFieldSendLaterPressedBalloonColor_sBehavior = v0;

}

- (UIColor)entryFieldConfirmedMentionColor
{
  if (entryFieldConfirmedMentionColor_once != -1)
    dispatch_once(&entryFieldConfirmedMentionColor_once, &__block_literal_global_361);
  return (UIColor *)(id)entryFieldConfirmedMentionColor_sBehavior;
}

void __44__CKUITheme_entryFieldConfirmedMentionColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldConfirmedMentionColor_sBehavior;
  entryFieldConfirmedMentionColor_sBehavior = v0;

}

- (UIColor)entryFieldUnconfirmedMentionColor
{
  if (entryFieldUnconfirmedMentionColor_once != -1)
    dispatch_once(&entryFieldUnconfirmedMentionColor_once, &__block_literal_global_362);
  return (UIColor *)(id)entryFieldUnconfirmedMentionColor_sBehavior;
}

void __46__CKUITheme_entryFieldUnconfirmedMentionColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldUnconfirmedMentionColor_sBehavior;
  entryFieldUnconfirmedMentionColor_sBehavior = v0;

}

- (UIColor)appStripCoverFillColor
{
  if (appStripCoverFillColor_once != -1)
    dispatch_once(&appStripCoverFillColor_once, &__block_literal_global_363);
  return (UIColor *)(id)appStripCoverFillColor_sBehavior;
}

void __35__CKUITheme_appStripCoverFillColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("AppStripCoverFillColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)appStripCoverFillColor_sBehavior;
  appStripCoverFillColor_sBehavior = v0;

}

- (UIColor)entryViewContentBackgroundColor
{
  if (entryViewContentBackgroundColor_once != -1)
    dispatch_once(&entryViewContentBackgroundColor_once, &__block_literal_global_366);
  return (UIColor *)(id)entryViewContentBackgroundColor_sBehavior;
}

void __44__CKUITheme_entryViewContentBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryViewContentBackgroundColor_sBehavior;
  entryViewContentBackgroundColor_sBehavior = v0;

}

- (UIColor)entryViewBackgroundColor
{
  if (entryViewBackgroundColor_once != -1)
    dispatch_once(&entryViewBackgroundColor_once, &__block_literal_global_367);
  return (UIColor *)(id)entryViewBackgroundColor_sBehavior;
}

void __37__CKUITheme_entryViewBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryViewBackgroundColor_sBehavior;
  entryViewBackgroundColor_sBehavior = v0;

}

- (UIColor)detailsBackgroundColor
{
  if (detailsBackgroundColor_once != -1)
    dispatch_once(&detailsBackgroundColor_once, &__block_literal_global_368);
  return (UIColor *)(id)detailsBackgroundColor_sBehavior;
}

void __35__CKUITheme_detailsBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)detailsBackgroundColor_sBehavior;
  detailsBackgroundColor_sBehavior = v0;

}

- (int64_t)detailsBackgroundBlurEffectStyle
{
  if (detailsBackgroundBlurEffectStyle_once != -1)
    dispatch_once(&detailsBackgroundBlurEffectStyle_once, &__block_literal_global_369);
  if (detailsBackgroundBlurEffectStyle_sBehavior)
    return 5;
  else
    return 0;
}

void __45__CKUITheme_detailsBackgroundBlurEffectStyle__block_invoke()
{
  detailsBackgroundBlurEffectStyle_sBehavior = 1;
}

- (UIColor)recipientsDividerColor
{
  if (recipientsDividerColor_once != -1)
    dispatch_once(&recipientsDividerColor_once, &__block_literal_global_370);
  return (UIColor *)(id)recipientsDividerColor_sBehavior;
}

void __35__CKUITheme_recipientsDividerColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.737254918, 0.729411781, 0.75686276, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)recipientsDividerColor_sBehavior;
  recipientsDividerColor_sBehavior = v0;

}

- (UIColor)contactCellTextColor
{
  if (contactCellTextColor_once != -1)
    dispatch_once(&contactCellTextColor_once, &__block_literal_global_371);
  return (UIColor *)(id)contactCellTextColor_sBehavior;
}

void __33__CKUITheme_contactCellTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)contactCellTextColor_sBehavior;
  contactCellTextColor_sBehavior = v0;

}

- (UIColor)detailsSelectedCellColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CKUITheme_detailsSelectedCellColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (detailsSelectedCellColor_once != -1)
    dispatch_once(&detailsSelectedCellColor_once, block);
  return (UIColor *)(id)detailsSelectedCellColor_sBehavior;
}

void __37__CKUITheme_detailsSelectedCellColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "conversationListSelectedCellColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)detailsSelectedCellColor_sBehavior;
  detailsSelectedCellColor_sBehavior = v1;

}

- (UIColor)detailsTextColor
{
  if (detailsTextColor_once != -1)
    dispatch_once(&detailsTextColor_once, &__block_literal_global_372);
  return (UIColor *)(id)detailsTextColor_sBehavior;
}

void __29__CKUITheme_detailsTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemBlueColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)detailsTextColor_sBehavior;
  detailsTextColor_sBehavior = v0;

}

- (UIColor)sharedContentsCellTextColor
{
  if (sharedContentsCellTextColor_once != -1)
    dispatch_once(&sharedContentsCellTextColor_once, &__block_literal_global_373);
  return (UIColor *)(id)sharedContentsCellTextColor_sBehavior;
}

void __40__CKUITheme_sharedContentsCellTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedContentsCellTextColor_sBehavior;
  sharedContentsCellTextColor_sBehavior = v0;

}

- (UIColor)sharedContentsCellBackgroundColor
{
  if (sharedContentsCellBackgroundColor_once != -1)
    dispatch_once(&sharedContentsCellBackgroundColor_once, &__block_literal_global_374);
  return (UIColor *)(id)sharedContentsCellBackgroundColor_sBehavior;
}

void __46__CKUITheme_sharedContentsCellBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedContentsCellBackgroundColor_sBehavior;
  sharedContentsCellBackgroundColor_sBehavior = v0;

}

- (UIColor)detailsSegmentedControlBackgroundColor
{
  if (detailsSegmentedControlBackgroundColor_once != -1)
    dispatch_once(&detailsSegmentedControlBackgroundColor_once, &__block_literal_global_375);
  return 0;
}

- (UIColor)contactsTableViewBackgroundColor
{
  if (contactsTableViewBackgroundColor_once != -1)
    dispatch_once(&contactsTableViewBackgroundColor_once, &__block_literal_global_376);
  return 0;
}

- (UIColor)contactTableViewCellBackgroundColor
{
  if (contactTableViewCellBackgroundColor_once != -1)
    dispatch_once(&contactTableViewCellBackgroundColor_once, &__block_literal_global_377);
  return (UIColor *)(id)contactTableViewCellBackgroundColor_sBehavior;
}

void __48__CKUITheme_contactTableViewCellBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)contactTableViewCellBackgroundColor_sBehavior;
  contactTableViewCellBackgroundColor_sBehavior = v0;

}

- (UIColor)contactTableViewHeaderBackgroundColor
{
  if (contactTableViewHeaderBackgroundColor_once != -1)
    dispatch_once(&contactTableViewHeaderBackgroundColor_once, &__block_literal_global_378);
  return (UIColor *)(id)contactTableViewHeaderBackgroundColor_sBehavior;
}

void __50__CKUITheme_contactTableViewHeaderBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)contactTableViewHeaderBackgroundColor_sBehavior;
  contactTableViewHeaderBackgroundColor_sBehavior = v0;

}

- (UIColor)contactTableViewCellContentTextColor
{
  if (contactTableViewCellContentTextColor_once != -1)
    dispatch_once(&contactTableViewCellContentTextColor_once, &__block_literal_global_379);
  return (UIColor *)(id)contactTableViewCellContentTextColor_sBehavior;
}

void __49__CKUITheme_contactTableViewCellContentTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)contactTableViewCellContentTextColor_sBehavior;
  contactTableViewCellContentTextColor_sBehavior = v0;

}

- (UIColor)contactsActionButtonColor
{
  if (contactsActionButtonColor_once != -1)
    dispatch_once(&contactsActionButtonColor_once, &__block_literal_global_380);
  return (UIColor *)(id)contactsActionButtonColor_sBehavior;
}

void __38__CKUITheme_contactsActionButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemBlueColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)contactsActionButtonColor_sBehavior;
  contactsActionButtonColor_sBehavior = v0;

}

- (UIColor)contactsActionButtonBackgroundColor
{
  if (contactsActionButtonBackgroundColor_once != -1)
    dispatch_once(&contactsActionButtonBackgroundColor_once, &__block_literal_global_381);
  return (UIColor *)(id)contactsActionButtonBackgroundColor_sBehavior;
}

void __48__CKUITheme_contactsActionButtonBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemGroupedBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)contactsActionButtonBackgroundColor_sBehavior;
  contactsActionButtonBackgroundColor_sBehavior = v0;

}

- (double)contactTableViewContactBackgroundAlpha
{
  if (contactTableViewContactBackgroundAlpha_once != -1)
    dispatch_once(&contactTableViewContactBackgroundAlpha_once, &__block_literal_global_382);
  return *(double *)&contactTableViewContactBackgroundAlpha_sBehavior;
}

void __51__CKUITheme_contactTableViewContactBackgroundAlpha__block_invoke()
{
  contactTableViewContactBackgroundAlpha_sBehavior = 0x3FE6666666666666;
}

- (UIColor)detailsGroupPhotoBackgroundColor
{
  if (detailsGroupPhotoBackgroundColor_once != -1)
    dispatch_once(&detailsGroupPhotoBackgroundColor_once, &__block_literal_global_383);
  return (UIColor *)(id)detailsGroupPhotoBackgroundColor_sBehavior;
}

void __45__CKUITheme_detailsGroupPhotoBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)detailsGroupPhotoBackgroundColor_sBehavior;
  detailsGroupPhotoBackgroundColor_sBehavior = v0;

}

- (UIColor)detailsCollectionViewBackgroundColor
{
  if (detailsCollectionViewBackgroundColor_once != -1)
    dispatch_once(&detailsCollectionViewBackgroundColor_once, &__block_literal_global_384);
  return (UIColor *)(id)detailsCollectionViewBackgroundColor_sBehavior;
}

void __49__CKUITheme_detailsCollectionViewBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)detailsCollectionViewBackgroundColor_sBehavior;
  detailsCollectionViewBackgroundColor_sBehavior = v0;

}

- (UIColor)detailsHeaderFooterContentViewBackgroundColor
{
  if (detailsHeaderFooterContentViewBackgroundColor_once != -1)
    dispatch_once(&detailsHeaderFooterContentViewBackgroundColor_once, &__block_literal_global_385);
  return (UIColor *)(id)detailsHeaderFooterContentViewBackgroundColor_sBehavior;
}

void __58__CKUITheme_detailsHeaderFooterContentViewBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)detailsHeaderFooterContentViewBackgroundColor_sBehavior;
  detailsHeaderFooterContentViewBackgroundColor_sBehavior = v0;

}

- (UIColor)detailsAttachmentsDecorationViewBackgroundColor
{
  if (detailsAttachmentsDecorationViewBackgroundColor_once != -1)
    dispatch_once(&detailsAttachmentsDecorationViewBackgroundColor_once, &__block_literal_global_386);
  return (UIColor *)(id)detailsAttachmentsDecorationViewBackgroundColor_sBehavior;
}

void __60__CKUITheme_detailsAttachmentsDecorationViewBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)detailsAttachmentsDecorationViewBackgroundColor_sBehavior;
  detailsAttachmentsDecorationViewBackgroundColor_sBehavior = v0;

}

- (UIColor)searchAttachmentsTitleTextColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CKUITheme_searchAttachmentsTitleTextColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (searchAttachmentsTitleTextColor_once != -1)
    dispatch_once(&searchAttachmentsTitleTextColor_once, block);
  return (UIColor *)(id)searchAttachmentsTitleTextColor_sBehavior;
}

void __44__CKUITheme_searchAttachmentsTitleTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "conversationListSummaryColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)searchAttachmentsTitleTextColor_sBehavior;
  searchAttachmentsTitleTextColor_sBehavior = v1;

}

- (UIColor)detailsAddButtonBackgroundColor
{
  if (detailsAddButtonBackgroundColor_once != -1)
    dispatch_once(&detailsAddButtonBackgroundColor_once, &__block_literal_global_387);
  return (UIColor *)(id)detailsAddButtonBackgroundColor_sBehavior;
}

void __44__CKUITheme_detailsAddButtonBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemFillColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)detailsAddButtonBackgroundColor_sBehavior;
  detailsAddButtonBackgroundColor_sBehavior = v0;

}

- (UIColor)detailsContactCellTitleColor
{
  if (detailsContactCellTitleColor_once != -1)
    dispatch_once(&detailsContactCellTitleColor_once, &__block_literal_global_388);
  return (UIColor *)(id)detailsContactCellTitleColor_sBehavior;
}

void __41__CKUITheme_detailsContactCellTitleColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)detailsContactCellTitleColor_sBehavior;
  detailsContactCellTitleColor_sBehavior = v0;

}

- (UIColor)detailsContactCellSubTitleColor
{
  if (detailsContactCellSubTitleColor_once != -1)
    dispatch_once(&detailsContactCellSubTitleColor_once, &__block_literal_global_389);
  return (UIColor *)(id)detailsContactCellSubTitleColor_sBehavior;
}

void __44__CKUITheme_detailsContactCellSubTitleColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)detailsContactCellSubTitleColor_sBehavior;
  detailsContactCellSubTitleColor_sBehavior = v0;

}

- (UIColor)detailsContactCellChevronColor
{
  if (detailsContactCellChevronColor_once != -1)
    dispatch_once(&detailsContactCellChevronColor_once, &__block_literal_global_390);
  return (UIColor *)(id)detailsContactCellChevronColor_sBehavior;
}

void __43__CKUITheme_detailsContactCellChevronColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)detailsContactCellChevronColor_sBehavior;
  detailsContactCellChevronColor_sBehavior = v0;

}

- (UIColor)detailsGroupHeaderCellChevronColor
{
  if (detailsGroupHeaderCellChevronColor_once != -1)
    dispatch_once(&detailsGroupHeaderCellChevronColor_once, &__block_literal_global_391);
  return (UIColor *)(id)detailsGroupHeaderCellChevronColor_sBehavior;
}

void __47__CKUITheme_detailsGroupHeaderCellChevronColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)detailsGroupHeaderCellChevronColor_sBehavior;
  detailsGroupHeaderCellChevronColor_sBehavior = v0;

}

- (UIColor)detailsSeeAllButtonBackgroundColor
{
  if (detailsSeeAllButtonBackgroundColor_once != -1)
    dispatch_once(&detailsSeeAllButtonBackgroundColor_once, &__block_literal_global_392);
  return 0;
}

- (UIColor)detailsSeeAllButtonTextColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CKUITheme_detailsSeeAllButtonTextColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (detailsSeeAllButtonTextColor_once != -1)
    dispatch_once(&detailsSeeAllButtonTextColor_once, block);
  return (UIColor *)(id)detailsSeeAllButtonTextColor_sBehavior;
}

void __41__CKUITheme_detailsSeeAllButtonTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "appTintColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)detailsSeeAllButtonTextColor_sBehavior;
  detailsSeeAllButtonTextColor_sBehavior = v1;

}

- (UIColor)activeRecordingDotColor
{
  if (activeRecordingDotColor_once != -1)
    dispatch_once(&activeRecordingDotColor_once, &__block_literal_global_393);
  return (UIColor *)(id)activeRecordingDotColor_sBehavior;
}

void __36__CKUITheme_activeRecordingDotColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.960784314, 0.2, 0.2, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)activeRecordingDotColor_sBehavior;
  activeRecordingDotColor_sBehavior = v0;

}

- (UIColor)messageAcknowledgmentPickerBackgroundColor
{
  if (messageAcknowledgmentPickerBackgroundColor_once != -1)
    dispatch_once(&messageAcknowledgmentPickerBackgroundColor_once, &__block_literal_global_394);
  return (UIColor *)(id)messageAcknowledgmentPickerBackgroundColor_sBehavior;
}

void __55__CKUITheme_messageAcknowledgmentPickerBackgroundColor__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKMessageAcknowledgmentPickerBackgroundColor"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "_ckTertiarySystemBackgroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dynamicColorWithLightColor:darkColor:", v4, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)messageAcknowledgmentPickerBackgroundColor_sBehavior;
  messageAcknowledgmentPickerBackgroundColor_sBehavior = v2;

}

- (UIColor)messageAcknowledgmentBalloonBorderColor
{
  if (messageAcknowledgmentBalloonBorderColor_once != -1)
    dispatch_once(&messageAcknowledgmentBalloonBorderColor_once, &__block_literal_global_397);
  return (UIColor *)(id)messageAcknowledgmentBalloonBorderColor_sBehavior;
}

void __52__CKUITheme_messageAcknowledgmentBalloonBorderColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)messageAcknowledgmentBalloonBorderColor_sBehavior;
  messageAcknowledgmentBalloonBorderColor_sBehavior = v0;

}

- (UIColor)messageAcknowledgmentRedColor
{
  if (messageAcknowledgmentRedColor_once != -1)
    dispatch_once(&messageAcknowledgmentRedColor_once, &__block_literal_global_398);
  return (UIColor *)(id)messageAcknowledgmentRedColor_sBehavior;
}

void __42__CKUITheme_messageAcknowledgmentRedColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKMessageAcknowledgmentRedColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)messageAcknowledgmentRedColor_sBehavior;
  messageAcknowledgmentRedColor_sBehavior = v0;

}

- (UIColor)messageAcknowledgmentGrayColor
{
  if (messageAcknowledgmentGrayColor_once != -1)
    dispatch_once(&messageAcknowledgmentGrayColor_once, &__block_literal_global_401);
  return (UIColor *)(id)messageAcknowledgmentGrayColor_sBehavior;
}

void __43__CKUITheme_messageAcknowledgmentGrayColor__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKMessageAcknowledgmentGrayColor"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dynamicColorWithLightColor:darkColor:", v4, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)messageAcknowledgmentGrayColor_sBehavior;
  messageAcknowledgmentGrayColor_sBehavior = v2;

}

- (UIColor)messageAcknowledgmentWhiteColor
{
  if (messageAcknowledgmentWhiteColor_once != -1)
    dispatch_once(&messageAcknowledgmentWhiteColor_once, &__block_literal_global_404);
  return (UIColor *)(id)messageAcknowledgmentWhiteColor_sBehavior;
}

void __44__CKUITheme_messageAcknowledgmentWhiteColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)messageAcknowledgmentWhiteColor_sBehavior;
  messageAcknowledgmentWhiteColor_sBehavior = v0;

}

- (UIColor)messageAcknowledgmentVotingTextColor
{
  if (messageAcknowledgmentVotingTextColor_once != -1)
    dispatch_once(&messageAcknowledgmentVotingTextColor_once, &__block_literal_global_405);
  return (UIColor *)(id)messageAcknowledgmentVotingTextColor_sBehavior;
}

void __49__CKUITheme_messageAcknowledgmentVotingTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)messageAcknowledgmentVotingTextColor_sBehavior;
  messageAcknowledgmentVotingTextColor_sBehavior = v0;

}

- (UIColor)messageAcknowledgmentPinnedColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CKUITheme_messageAcknowledgmentPinnedColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (messageAcknowledgmentPinnedColor_once != -1)
    dispatch_once(&messageAcknowledgmentPinnedColor_once, block);
  return (UIColor *)(id)messageAcknowledgmentPinnedColor_sBehavior;
}

void __45__CKUITheme_messageAcknowledgmentPinnedColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "messageAcknowledgmentGrayColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)messageAcknowledgmentPinnedColor_sBehavior;
  messageAcknowledgmentPinnedColor_sBehavior = v1;

}

- (char)ckAcknowledgementColorTypeForColor:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  int v11;

  v4 = a3;
  -[CKUITheme messageAcknowledgmentWhiteColor](self, "messageAcknowledgmentWhiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 4;
  }
  else
  {
    -[CKUITheme messageAcknowledgmentGrayColor](self, "messageAcknowledgmentGrayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqual:", v8);

    if ((v9 & 1) != 0)
    {
      v7 = -1;
    }
    else
    {
      -[CKUITheme messageAcknowledgmentRedColor](self, "messageAcknowledgmentRedColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v4, "isEqual:", v10);

      if (v11)
        v7 = 3;
      else
        v7 = -2;
    }
  }

  return v7;
}

- (id)messageAcknowledgment:(int64_t)a3 acknowledgmentImageColor:(int64_t)a4
{
  void *v4;

  if (a4 == 1)
  {
    -[CKUITheme messageAcknowledgmentRedColor](self, "messageAcknowledgmentRedColor", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (!a3 || a3 == 2)
  {
    -[CKUITheme messageAcknowledgmentGrayColor](self, "messageAcknowledgmentGrayColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)messageAcknowledgment:(int64_t)a3 selectedAcknowledgmentImageColor:(int64_t)a4
{
  void *v4;

  if (a4 == 1)
  {
    -[CKUITheme messageAcknowledgmentRedColor](self, "messageAcknowledgmentRedColor", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (char)messageAcknowledgmentBalloonColorTypeForStyle:(int64_t)a3
{
  unsigned int v3;

  v3 = 0x401FFu >> (8 * a3);
  if ((unint64_t)a3 >= 3)
    LOBYTE(v3) = 0;
  return v3;
}

- (id)messageAcknowledgmentBalloonColorForStyle:(int64_t)a3
{
  void *v3;
  void *v4;

  -[CKUITheme balloonColorsForColorType:](self, "balloonColorsForColorType:", -[CKUITheme messageAcknowledgmentBalloonColorTypeForStyle:](self, "messageAcknowledgmentBalloonColorTypeForStyle:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)messageAcknowledgmentSelectedBalloonColorForStyle:(int64_t)a3
{
  return -[CKUITheme messageAcknowledgmentSelectedBalloonColorForStyle:serviceName:](self, "messageAcknowledgmentSelectedBalloonColorForStyle:serviceName:", a3, *MEMORY[0x1E0D38F68]);
}

- (id)messageAcknowledgmentSelectedBalloonColorForStyle:(int64_t)a3 serviceName:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0D35910], "serviceWithName:", a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "__ck_displayColor");

    -[CKUITheme balloonColorsForColorType:](self, "balloonColorsForColorType:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (UIColor)attributionViewBackgroundColor
{
  if (attributionViewBackgroundColor_once != -1)
    dispatch_once(&attributionViewBackgroundColor_once, &__block_literal_global_407);
  return (UIColor *)(id)attributionViewBackgroundColor_sBehavior;
}

void __43__CKUITheme_attributionViewBackgroundColor__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKMessageAcknowledgmentPickerBackgroundColor"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "_ckTertiarySystemBackgroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dynamicColorWithLightColor:darkColor:", v4, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)attributionViewBackgroundColor_sBehavior;
  attributionViewBackgroundColor_sBehavior = v2;

}

- (UIColor)attributionCountViewFontColor
{
  if (attributionCountViewFontColor_once != -1)
    dispatch_once(&attributionCountViewFontColor_once, &__block_literal_global_408);
  return (UIColor *)(id)attributionCountViewFontColor_sBehavior;
}

void __42__CKUITheme_attributionCountViewFontColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)attributionCountViewFontColor_sBehavior;
  attributionCountViewFontColor_sBehavior = v0;

}

- (UIColor)attributionStickerDetailsViewButtonBackgroundColor
{
  if (attributionStickerDetailsViewButtonBackgroundColor_once != -1)
    dispatch_once(&attributionStickerDetailsViewButtonBackgroundColor_once, &__block_literal_global_409);
  return (UIColor *)(id)attributionStickerDetailsViewButtonBackgroundColor_sBehavior;
}

void __63__CKUITheme_attributionStickerDetailsViewButtonBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.882352941, 0.882352941, 0.882352941, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)attributionStickerDetailsViewButtonBackgroundColor_sBehavior;
  attributionStickerDetailsViewButtonBackgroundColor_sBehavior = v0;

}

- (UIColor)attributionStickerDetailsViewSenderNameColor
{
  if (attributionStickerDetailsViewSenderNameColor_once != -1)
    dispatch_once(&attributionStickerDetailsViewSenderNameColor_once, &__block_literal_global_410);
  return (UIColor *)(id)attributionStickerDetailsViewSenderNameColor_sBehavior;
}

void __57__CKUITheme_attributionStickerDetailsViewSenderNameColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)attributionStickerDetailsViewSenderNameColor_sBehavior;
  attributionStickerDetailsViewSenderNameColor_sBehavior = v0;

}

- (UIColor)attributionStickerDetailsViewStickerPackNameColor
{
  if (attributionStickerDetailsViewStickerPackNameColor_once != -1)
    dispatch_once(&attributionStickerDetailsViewStickerPackNameColor_once, &__block_literal_global_411);
  return (UIColor *)(id)attributionStickerDetailsViewStickerPackNameColor_sBehavior;
}

void __62__CKUITheme_attributionStickerDetailsViewStickerPackNameColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)attributionStickerDetailsViewStickerPackNameColor_sBehavior;
  attributionStickerDetailsViewStickerPackNameColor_sBehavior = v0;

}

- (UIColor)browserBackgroundColor
{
  if (browserBackgroundColor_once != -1)
    dispatch_once(&browserBackgroundColor_once, &__block_literal_global_412);
  return (UIColor *)(id)browserBackgroundColor_sBehavior;
}

void __35__CKUITheme_browserBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)browserBackgroundColor_sBehavior;
  browserBackgroundColor_sBehavior = v0;

}

- (UIColor)browserSwitcherGutterColor
{
  if (browserSwitcherGutterColor_once != -1)
    dispatch_once(&browserSwitcherGutterColor_once, &__block_literal_global_413);
  return (UIColor *)(id)browserSwitcherGutterColor_sBehavior;
}

void __39__CKUITheme_browserSwitcherGutterColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.870588235, 0.874509804, 0.890196078, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)browserSwitcherGutterColor_sBehavior;
  browserSwitcherGutterColor_sBehavior = v0;

}

- (UIColor)browserSwitcherGutterDividerColor
{
  if (browserSwitcherGutterDividerColor_once != -1)
    dispatch_once(&browserSwitcherGutterDividerColor_once, &__block_literal_global_414);
  return (UIColor *)(id)browserSwitcherGutterDividerColor_sBehavior;
}

void __46__CKUITheme_browserSwitcherGutterDividerColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.780392157, 0.784313725, 0.8, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)browserSwitcherGutterDividerColor_sBehavior;
  browserSwitcherGutterDividerColor_sBehavior = v0;

}

- (UIColor)browserSwitcherBorderColor
{
  if (browserSwitcherBorderColor_once != -1)
    dispatch_once(&browserSwitcherBorderColor_once, &__block_literal_global_415);
  return (UIColor *)(id)browserSwitcherBorderColor_sBehavior;
}

void __39__CKUITheme_browserSwitcherBorderColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("SwitcherBorderColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)browserSwitcherBorderColor_sBehavior;
  browserSwitcherBorderColor_sBehavior = v0;

}

- (UIColor)browserCloseButtonColor
{
  if (browserCloseButtonColor_once != -1)
    dispatch_once(&browserCloseButtonColor_once, &__block_literal_global_418);
  return (UIColor *)(id)browserCloseButtonColor_sBehavior;
}

void __36__CKUITheme_browserCloseButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("BrowserCloseButtonColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)browserCloseButtonColor_sBehavior;
  browserCloseButtonColor_sBehavior = v0;

}

- (UIColor)browserAppStripSeperatorBackgroundColor
{
  if (browserAppStripSeperatorBackgroundColor_once != -1)
    dispatch_once(&browserAppStripSeperatorBackgroundColor_once, &__block_literal_global_421);
  return (UIColor *)(id)browserAppStripSeperatorBackgroundColor_sBehavior;
}

void __52__CKUITheme_browserAppStripSeperatorBackgroundColor__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.15);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dynamicColorWithLightColor:darkColor:", v4, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)browserAppStripSeperatorBackgroundColor_sBehavior;
  browserAppStripSeperatorBackgroundColor_sBehavior = v2;

}

- (UIColor)browserCardBackgroundColor
{
  if (browserCardBackgroundColor_once != -1)
    dispatch_once(&browserCardBackgroundColor_once, &__block_literal_global_422);
  return (UIColor *)(id)browserCardBackgroundColor_sBehavior;
}

void __39__CKUITheme_browserCardBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)browserCardBackgroundColor_sBehavior;
  browserCardBackgroundColor_sBehavior = v0;

}

- (double)browserAppStripDimmedPluginCellOpacity
{
  if (browserAppStripDimmedPluginCellOpacity_once != -1)
    dispatch_once(&browserAppStripDimmedPluginCellOpacity_once, &__block_literal_global_423);
  return *(double *)&browserAppStripDimmedPluginCellOpacity_sBehavior;
}

void __51__CKUITheme_browserAppStripDimmedPluginCellOpacity__block_invoke()
{
  browserAppStripDimmedPluginCellOpacity_sBehavior = 0x3FD3333333333333;
}

- (double)browserAppStripLightPluginCellOpacity
{
  if (browserAppStripLightPluginCellOpacity_once != -1)
    dispatch_once(&browserAppStripLightPluginCellOpacity_once, &__block_literal_global_424);
  return *(double *)&browserAppStripLightPluginCellOpacity_sBehavior;
}

void __50__CKUITheme_browserAppStripLightPluginCellOpacity__block_invoke()
{
  browserAppStripLightPluginCellOpacity_sBehavior = 0x3FF0000000000000;
}

- (UIColor)appGrabberBackgroundColor
{
  if (appGrabberBackgroundColor_once != -1)
    dispatch_once(&appGrabberBackgroundColor_once, &__block_literal_global_425);
  return (UIColor *)(id)appGrabberBackgroundColor_sBehavior;
}

void __38__CKUITheme_appGrabberBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)appGrabberBackgroundColor_sBehavior;
  appGrabberBackgroundColor_sBehavior = v0;

}

- (UIColor)appGrabberTitleColor
{
  if (appGrabberTitleColor_once != -1)
    dispatch_once(&appGrabberTitleColor_once, &__block_literal_global_426);
  return (UIColor *)(id)appGrabberTitleColor_sBehavior;
}

void __33__CKUITheme_appGrabberTitleColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)appGrabberTitleColor_sBehavior;
  appGrabberTitleColor_sBehavior = v0;

}

- (UIColor)appGrabberPillColor
{
  if (appGrabberPillColor_once != -1)
    dispatch_once(&appGrabberPillColor_once, &__block_literal_global_427);
  return (UIColor *)(id)appGrabberPillColor_sBehavior;
}

void __32__CKUITheme_appGrabberPillColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("BrowserGrabberPillColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)appGrabberPillColor_sBehavior;
  appGrabberPillColor_sBehavior = v0;

}

- (UIColor)appSelectionOutlineColor
{
  if (appSelectionOutlineColor_once != -1)
    dispatch_once(&appSelectionOutlineColor_once, &__block_literal_global_430);
  return (UIColor *)(id)appSelectionOutlineColor_sBehavior;
}

void __37__CKUITheme_appSelectionOutlineColor__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dynamicColorWithLightColor:darkColor:", v4, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)appSelectionOutlineColor_sBehavior;
  appSelectionOutlineColor_sBehavior = v2;

}

- (UIColor)fullscreenAppDismissViewColor
{
  if (fullscreenAppDismissViewColor_once != -1)
    dispatch_once(&fullscreenAppDismissViewColor_once, &__block_literal_global_431);
  return (UIColor *)(id)fullscreenAppDismissViewColor_sBehavior;
}

void __42__CKUITheme_fullscreenAppDismissViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "_dimmingViewColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fullscreenAppDismissViewColor_sBehavior;
  fullscreenAppDismissViewColor_sBehavior = v0;

}

- (UIImage)appGrabberCloseImage
{
  if (appGrabberCloseImage_once != -1)
    dispatch_once(&appGrabberCloseImage_once, &__block_literal_global_432);
  return (UIImage *)(id)appGrabberCloseImage_sBehavior;
}

void __33__CKUITheme_appGrabberCloseImage__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("BrowserClose-Light"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)appGrabberCloseImage_sBehavior;
  appGrabberCloseImage_sBehavior = v0;

}

- (UIImage)appSelectionOutline
{
  if (appSelectionOutline_once != -1)
    dispatch_once(&appSelectionOutline_once, &__block_literal_global_436);
  return (UIImage *)(id)appSelectionOutline_sBehavior;
}

void __32__CKUITheme_appSelectionOutline__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("AppSelectionBorder"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)appSelectionOutline_sBehavior;
  appSelectionOutline_sBehavior = v0;

}

- (UIColor)paddleNameColor
{
  if (paddleNameColor_once != -1)
    dispatch_once(&paddleNameColor_once, &__block_literal_global_439);
  return (UIColor *)(id)paddleNameColor_sBehavior;
}

void __28__CKUITheme_paddleNameColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)paddleNameColor_sBehavior;
  paddleNameColor_sBehavior = v0;

}

- (UIColor)paddleSelectionColor
{
  if (paddleSelectionColor_once != -1)
    dispatch_once(&paddleSelectionColor_once, &__block_literal_global_440);
  return (UIColor *)(id)paddleSelectionColor_sBehavior;
}

void __33__CKUITheme_paddleSelectionColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)paddleSelectionColor_sBehavior;
  paddleSelectionColor_sBehavior = v0;

}

- (UIColor)paddleSeparatorColor
{
  if (paddleSeparatorColor_once != -1)
    dispatch_once(&paddleSeparatorColor_once, &__block_literal_global_441);
  return (UIColor *)(id)paddleSeparatorColor_sBehavior;
}

void __33__CKUITheme_paddleSeparatorColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)paddleSeparatorColor_sBehavior;
  paddleSeparatorColor_sBehavior = v0;

}

- (UIColor)paddleShadowColor
{
  if (paddleShadowColor_once != -1)
    dispatch_once(&paddleShadowColor_once, &__block_literal_global_442);
  return (UIColor *)(id)paddleShadowColor_sBehavior;
}

void __30__CKUITheme_paddleShadowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)paddleShadowColor_sBehavior;
  paddleShadowColor_sBehavior = v0;

}

- (UIColor)paddleOuterGlow
{
  if (paddleOuterGlow_once != -1)
    dispatch_once(&paddleOuterGlow_once, &__block_literal_global_443);
  return (UIColor *)(id)paddleOuterGlow_sBehavior;
}

void __28__CKUITheme_paddleOuterGlow__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("MentionsPaddleOuterGlow"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)paddleOuterGlow_sBehavior;
  paddleOuterGlow_sBehavior = v0;

}

- (UIColor)paddleInnerGlow
{
  if (paddleInnerGlow_once != -1)
    dispatch_once(&paddleInnerGlow_once, &__block_literal_global_446);
  return (UIColor *)(id)paddleInnerGlow_sBehavior;
}

void __28__CKUITheme_paddleInnerGlow__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("MentionsPaddleInnerGlow"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)paddleInnerGlow_sBehavior;
  paddleInnerGlow_sBehavior = v0;

}

- (UIColor)paddleShadow
{
  if (paddleShadow_once != -1)
    dispatch_once(&paddleShadow_once, &__block_literal_global_449);
  return (UIColor *)(id)paddleShadow_sBehavior;
}

void __25__CKUITheme_paddleShadow__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("MentionsPaddleShadow"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)paddleShadow_sBehavior;
  paddleShadow_sBehavior = v0;

}

- (UIColor)stickerDetailsCellTitleTextColor
{
  if (stickerDetailsCellTitleTextColor_once != -1)
    dispatch_once(&stickerDetailsCellTitleTextColor_once, &__block_literal_global_452);
  return (UIColor *)(id)stickerDetailsCellTitleTextColor_sBehavior;
}

void __45__CKUITheme_stickerDetailsCellTitleTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stickerDetailsCellTitleTextColor_sBehavior;
  stickerDetailsCellTitleTextColor_sBehavior = v0;

}

- (UIColor)stickerDetailsCellSubtitleTextColor
{
  if (stickerDetailsCellSubtitleTextColor_once != -1)
    dispatch_once(&stickerDetailsCellSubtitleTextColor_once, &__block_literal_global_453);
  return (UIColor *)(id)stickerDetailsCellSubtitleTextColor_sBehavior;
}

void __48__CKUITheme_stickerDetailsCellSubtitleTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stickerDetailsCellSubtitleTextColor_sBehavior;
  stickerDetailsCellSubtitleTextColor_sBehavior = v0;

}

- (UIColor)stickerDetailsCellTimestampTextColor
{
  if (stickerDetailsCellTimestampTextColor_once != -1)
    dispatch_once(&stickerDetailsCellTimestampTextColor_once, &__block_literal_global_454);
  return (UIColor *)(id)stickerDetailsCellTimestampTextColor_sBehavior;
}

void __49__CKUITheme_stickerDetailsCellTimestampTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stickerDetailsCellTimestampTextColor_sBehavior;
  stickerDetailsCellTimestampTextColor_sBehavior = v0;

}

- (UIColor)stickerPeelBackgroundColor
{
  if (stickerPeelBackgroundColor_once != -1)
    dispatch_once(&stickerPeelBackgroundColor_once, &__block_literal_global_455);
  return (UIColor *)(id)stickerPeelBackgroundColor_sBehavior;
}

void __39__CKUITheme_stickerPeelBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stickerPeelBackgroundColor_sBehavior;
  stickerPeelBackgroundColor_sBehavior = v0;

}

- (UIColor)fsmPickerPrimaryColor
{
  int v2;
  int IsReduceTransparencyEnabled;
  char v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;

  if (fsmPickerPrimaryColor_onceToken != -1)
    dispatch_once(&fsmPickerPrimaryColor_onceToken, &__block_literal_global_456);
  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (fsmPickerPrimaryColor_sIsIncreaseContrastEnabled_fsmPickerPrimaryColor != v2
    || fsmPickerPrimaryColor_sIsReduceTransparencyEnabled_fsmPickerPrimaryColor != IsReduceTransparencyEnabled)
  {
    v5 = IsReduceTransparencyEnabled;
    v6 = CFSTR("CKFSMPickerPrimaryColor2");
    if (IsReduceTransparencyEnabled)
      v6 = CFSTR("CKFSMPickerPrimaryColor1");
    if (v2)
      v7 = CFSTR("CKFSMPickerPrimaryColor0");
    else
      v7 = v6;
    objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)fsmPickerPrimaryColor_sBehavior;
    fsmPickerPrimaryColor_sBehavior = v8;

    fsmPickerPrimaryColor_sIsIncreaseContrastEnabled_fsmPickerPrimaryColor = v2;
    fsmPickerPrimaryColor_sIsReduceTransparencyEnabled_fsmPickerPrimaryColor = v5;
  }
  return (UIColor *)(id)fsmPickerPrimaryColor_sBehavior;
}

void __34__CKUITheme_fsmPickerPrimaryColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKFSMPickerPrimaryColor2"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fsmPickerPrimaryColor_sBehavior;
  fsmPickerPrimaryColor_sBehavior = v0;

}

- (UIColor)fsmPickerPrimaryColorDarkEffect
{
  int v2;
  int IsReduceTransparencyEnabled;
  char v5;
  uint64_t v6;
  void *v7;

  if (fsmPickerPrimaryColorDarkEffect_onceToken != -1)
    dispatch_once(&fsmPickerPrimaryColorDarkEffect_onceToken, &__block_literal_global_463);
  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (fsmPickerPrimaryColorDarkEffect_sIsIncreaseContrastEnabled_fsmPickerPrimaryColorDarkEffect != v2
    || fsmPickerPrimaryColorDarkEffect_sIsReduceTransparencyEnabled_fsmPickerPrimaryColorDarkEffect != IsReduceTransparencyEnabled)
  {
    v5 = IsReduceTransparencyEnabled;
    if (v2 || IsReduceTransparencyEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemExtraLightGrayColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.352941176, 0.352941176, 0.352941176, 1.0);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)fsmPickerPrimaryColorDarkEffect_sBehavior;
    fsmPickerPrimaryColorDarkEffect_sBehavior = v6;

    fsmPickerPrimaryColorDarkEffect_sIsIncreaseContrastEnabled_fsmPickerPrimaryColorDarkEffect = v2;
    fsmPickerPrimaryColorDarkEffect_sIsReduceTransparencyEnabled_fsmPickerPrimaryColorDarkEffect = v5;
  }
  return (UIColor *)(id)fsmPickerPrimaryColorDarkEffect_sBehavior;
}

void __44__CKUITheme_fsmPickerPrimaryColorDarkEffect__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.352941176, 0.352941176, 0.352941176, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fsmPickerPrimaryColorDarkEffect_sBehavior;
  fsmPickerPrimaryColorDarkEffect_sBehavior = v0;

}

- (UIColor)fsmPickerPrimaryTintColor
{
  int v2;
  int IsReduceTransparencyEnabled;
  char v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;

  if (fsmPickerPrimaryTintColor_onceToken != -1)
    dispatch_once(&fsmPickerPrimaryTintColor_onceToken, &__block_literal_global_464);
  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (fsmPickerPrimaryTintColor_sIsIncreaseContrastEnabled_fsmPickerPrimaryTintColor != v2
    || fsmPickerPrimaryTintColor_sIsReduceTransparencyEnabled_fsmPickerPrimaryTintColor != IsReduceTransparencyEnabled)
  {
    v5 = IsReduceTransparencyEnabled;
    v6 = CFSTR("CKFSMPickerPrimaryTintColor2");
    if (IsReduceTransparencyEnabled)
      v6 = CFSTR("CKFSMPickerPrimaryTintColor1");
    if (v2)
      v7 = CFSTR("CKFSMPickerPrimaryTintColor0");
    else
      v7 = v6;
    objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)fsmPickerPrimaryTintColor_sBehavior;
    fsmPickerPrimaryTintColor_sBehavior = v8;

    fsmPickerPrimaryTintColor_sIsIncreaseContrastEnabled_fsmPickerPrimaryTintColor = v2;
    fsmPickerPrimaryTintColor_sIsReduceTransparencyEnabled_fsmPickerPrimaryTintColor = v5;
  }
  return (UIColor *)(id)fsmPickerPrimaryTintColor_sBehavior;
}

void __38__CKUITheme_fsmPickerPrimaryTintColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKFSMPickerPrimaryTintColor2"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fsmPickerPrimaryTintColor_sBehavior;
  fsmPickerPrimaryTintColor_sBehavior = v0;

}

- (UIColor)fsmPickerPrimaryTintColorDarkEffect
{
  int v2;
  int IsReduceTransparencyEnabled;
  char v5;
  uint64_t v6;
  void *v7;

  if (fsmPickerPrimaryTintColorDarkEffect_onceToken != -1)
    dispatch_once(&fsmPickerPrimaryTintColorDarkEffect_onceToken, &__block_literal_global_471);
  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (fsmPickerPrimaryTintColorDarkEffect_sIsIncreaseContrastEnabled_fsmPickerPrimaryTintColorDarkEffect != v2
    || fsmPickerPrimaryTintColorDarkEffect_sIsReduceTransparencyEnabled_fsmPickerPrimaryTintColorDarkEffect != IsReduceTransparencyEnabled)
  {
    v5 = IsReduceTransparencyEnabled;
    if (v2 || IsReduceTransparencyEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemExtraLightGrayColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.352941176, 0.352941176, 0.352941176, 1.0);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)fsmPickerPrimaryTintColorDarkEffect_sBehavior;
    fsmPickerPrimaryTintColorDarkEffect_sBehavior = v6;

    fsmPickerPrimaryTintColorDarkEffect_sIsIncreaseContrastEnabled_fsmPickerPrimaryTintColorDarkEffect = v2;
    fsmPickerPrimaryTintColorDarkEffect_sIsReduceTransparencyEnabled_fsmPickerPrimaryTintColorDarkEffect = v5;
  }
  return (UIColor *)(id)fsmPickerPrimaryTintColorDarkEffect_sBehavior;
}

void __48__CKUITheme_fsmPickerPrimaryTintColorDarkEffect__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.352941176, 0.352941176, 0.352941176, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fsmPickerPrimaryTintColorDarkEffect_sBehavior;
  fsmPickerPrimaryTintColorDarkEffect_sBehavior = v0;

}

- (UIColor)fsmPickerSecondaryColor
{
  int v2;
  int IsReduceTransparencyEnabled;
  char v5;
  uint64_t v6;
  void *v7;

  if (fsmPickerSecondaryColor_onceToken != -1)
    dispatch_once(&fsmPickerSecondaryColor_onceToken, &__block_literal_global_472);
  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (fsmPickerSecondaryColor_sIsIncreaseContrastEnabled_fsmPickerSecondaryColor != v2
    || fsmPickerSecondaryColor_sIsReduceTransparencyEnabled_fsmPickerSecondaryColor != IsReduceTransparencyEnabled)
  {
    v5 = IsReduceTransparencyEnabled;
    if (v2 || IsReduceTransparencyEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemExtraLightGrayColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)fsmPickerSecondaryColor_sBehavior;
    fsmPickerSecondaryColor_sBehavior = v6;

    fsmPickerSecondaryColor_sIsIncreaseContrastEnabled_fsmPickerSecondaryColor = v2;
    fsmPickerSecondaryColor_sIsReduceTransparencyEnabled_fsmPickerSecondaryColor = v5;
  }
  return (UIColor *)(id)fsmPickerSecondaryColor_sBehavior;
}

void __36__CKUITheme_fsmPickerSecondaryColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fsmPickerSecondaryColor_sBehavior;
  fsmPickerSecondaryColor_sBehavior = v0;

}

- (UIColor)fsmPickerSecondaryColorDarkEffect
{
  int v2;
  int IsReduceTransparencyEnabled;
  char v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;

  if (fsmPickerSecondaryColorDarkEffect_onceToken != -1)
    dispatch_once(&fsmPickerSecondaryColorDarkEffect_onceToken, &__block_literal_global_473);
  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (fsmPickerSecondaryColorDarkEffect_sIsIncreaseContrastEnabled_fsmPickerSecondaryColorDarkEffect != v2
    || fsmPickerSecondaryColorDarkEffect_sIsReduceTransparencyEnabled_fsmPickerSecondaryColorDarkEffect != IsReduceTransparencyEnabled)
  {
    v5 = IsReduceTransparencyEnabled;
    if (v2)
    {
      v6 = 0.290196078;
      v7 = 0.309803922;
    }
    else
    {
      if (!IsReduceTransparencyEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      v6 = 0.42745098;
      v7 = 0.447058824;
    }
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v6, v6, v7, 1.0);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v9 = (void *)fsmPickerSecondaryColorDarkEffect_sBehavior;
    fsmPickerSecondaryColorDarkEffect_sBehavior = v8;

    fsmPickerSecondaryColorDarkEffect_sIsIncreaseContrastEnabled_fsmPickerSecondaryColorDarkEffect = v2;
    fsmPickerSecondaryColorDarkEffect_sIsReduceTransparencyEnabled_fsmPickerSecondaryColorDarkEffect = v5;
  }
  return (UIColor *)(id)fsmPickerSecondaryColorDarkEffect_sBehavior;
}

void __46__CKUITheme_fsmPickerSecondaryColorDarkEffect__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fsmPickerSecondaryColorDarkEffect_sBehavior;
  fsmPickerSecondaryColorDarkEffect_sBehavior = v0;

}

- (UIColor)fsmPickerPageIndicatorColor
{
  int v2;
  int IsReduceTransparencyEnabled;
  char v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;

  if (fsmPickerPageIndicatorColor_onceToken != -1)
    dispatch_once(&fsmPickerPageIndicatorColor_onceToken, &__block_literal_global_474);
  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (fsmPickerPageIndicatorColor_sIsIncreaseContrastEnabled_fsmPickerPageIndicatorColor != v2
    || fsmPickerPageIndicatorColor_sIsReduceTransparencyEnabled_fsmPickerPageIndicatorColor != IsReduceTransparencyEnabled)
  {
    v5 = IsReduceTransparencyEnabled;
    v6 = CFSTR("CKFSMPickerPageIndicatorColor2");
    if (IsReduceTransparencyEnabled)
      v6 = CFSTR("CKFSMPickerPageIndicatorColor1");
    if (v2)
      v7 = CFSTR("CKFSMPickerPageIndicatorColor0");
    else
      v7 = v6;
    objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)fsmPickerPageIndicatorColor_sBehavior;
    fsmPickerPageIndicatorColor_sBehavior = v8;

    fsmPickerPageIndicatorColor_sIsIncreaseContrastEnabled_fsmPickerPageIndicatorColor = v2;
    fsmPickerPageIndicatorColor_sIsReduceTransparencyEnabled_fsmPickerPageIndicatorColor = v5;
  }
  return (UIColor *)(id)fsmPickerPageIndicatorColor_sBehavior;
}

void __40__CKUITheme_fsmPickerPageIndicatorColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKFSMPickerPageIndicatorColor2"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fsmPickerPageIndicatorColor_sBehavior;
  fsmPickerPageIndicatorColor_sBehavior = v0;

}

- (UIColor)fsmPickerPageIndicatorColorDarkEffect
{
  int v2;
  int IsReduceTransparencyEnabled;
  char v5;
  uint64_t v6;
  void *v7;

  if (fsmPickerPageIndicatorColorDarkEffect_onceToken != -1)
    dispatch_once(&fsmPickerPageIndicatorColorDarkEffect_onceToken, &__block_literal_global_481);
  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (fsmPickerPageIndicatorColorDarkEffect_sIsIncreaseContrastEnabled_fsmPickerPageIndicatorColorDarkEffect != v2
    || fsmPickerPageIndicatorColorDarkEffect_sIsReduceTransparencyEnabled_fsmPickerPageIndicatorColorDarkEffect != IsReduceTransparencyEnabled)
  {
    v5 = IsReduceTransparencyEnabled;
    if (v2 || IsReduceTransparencyEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemExtraLightGrayColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.352941176, 0.352941176, 0.352941176, 1.0);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)fsmPickerPageIndicatorColorDarkEffect_sBehavior;
    fsmPickerPageIndicatorColorDarkEffect_sBehavior = v6;

    fsmPickerPageIndicatorColorDarkEffect_sIsIncreaseContrastEnabled_fsmPickerPageIndicatorColorDarkEffect = v2;
    fsmPickerPageIndicatorColorDarkEffect_sIsReduceTransparencyEnabled_fsmPickerPageIndicatorColorDarkEffect = v5;
  }
  return (UIColor *)(id)fsmPickerPageIndicatorColorDarkEffect_sBehavior;
}

void __50__CKUITheme_fsmPickerPageIndicatorColorDarkEffect__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.352941176, 0.352941176, 0.352941176, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fsmPickerPageIndicatorColorDarkEffect_sBehavior;
  fsmPickerPageIndicatorColorDarkEffect_sBehavior = v0;

}

- (UIColor)fsmPickerCurrentPageIndicatorColor
{
  int v2;
  int IsReduceTransparencyEnabled;
  char v5;
  uint64_t v6;
  void *v7;

  if (fsmPickerCurrentPageIndicatorColor_onceToken != -1)
    dispatch_once(&fsmPickerCurrentPageIndicatorColor_onceToken, &__block_literal_global_482);
  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (fsmPickerCurrentPageIndicatorColor_sIsIncreaseContrastEnabled_fsmPickerCurrentPageIndicatorColor != v2
    || fsmPickerCurrentPageIndicatorColor_sIsReduceTransparencyEnabled_fsmPickerCurrentPageIndicatorColor != IsReduceTransparencyEnabled)
  {
    v5 = IsReduceTransparencyEnabled;
    if (v2 || IsReduceTransparencyEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKFSMPickerCurrentPageIndicatorColor2"));
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)fsmPickerCurrentPageIndicatorColor_sBehavior;
    fsmPickerCurrentPageIndicatorColor_sBehavior = v6;

    fsmPickerCurrentPageIndicatorColor_sIsIncreaseContrastEnabled_fsmPickerCurrentPageIndicatorColor = v2;
    fsmPickerCurrentPageIndicatorColor_sIsReduceTransparencyEnabled_fsmPickerCurrentPageIndicatorColor = v5;
  }
  return (UIColor *)(id)fsmPickerCurrentPageIndicatorColor_sBehavior;
}

void __47__CKUITheme_fsmPickerCurrentPageIndicatorColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKFSMPickerCurrentPageIndicatorColor2"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fsmPickerCurrentPageIndicatorColor_sBehavior;
  fsmPickerCurrentPageIndicatorColor_sBehavior = v0;

}

- (UIColor)fsmPickerCurrentPageIndicatorColorDarkEffect
{
  int v2;
  int IsReduceTransparencyEnabled;
  char v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;

  if (fsmPickerCurrentPageIndicatorColorDarkEffect_onceToken != -1)
    dispatch_once(&fsmPickerCurrentPageIndicatorColorDarkEffect_onceToken, &__block_literal_global_485);
  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (fsmPickerCurrentPageIndicatorColorDarkEffect_sIsIncreaseContrastEnabled_fsmPickerCurrentPageIndicatorColorDarkEffect != v2
    || fsmPickerCurrentPageIndicatorColorDarkEffect_sIsReduceTransparencyEnabled_fsmPickerCurrentPageIndicatorColorDarkEffect != IsReduceTransparencyEnabled)
  {
    v5 = IsReduceTransparencyEnabled;
    if (v2)
    {
      v6 = 0.290196078;
      v7 = 0.309803922;
    }
    else
    {
      if (!IsReduceTransparencyEnabled)
      {
        v6 = 0.215686275;
        v8 = 1.0;
        v9 = 0.215686275;
        v7 = 0.215686275;
        goto LABEL_13;
      }
      v6 = 0.42745098;
      v7 = 0.447058824;
    }
    v8 = 1.0;
    v9 = v6;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v6, v9, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)fsmPickerCurrentPageIndicatorColorDarkEffect_sBehavior;
    fsmPickerCurrentPageIndicatorColorDarkEffect_sBehavior = v10;

    fsmPickerCurrentPageIndicatorColorDarkEffect_sIsIncreaseContrastEnabled_fsmPickerCurrentPageIndicatorColorDarkEffect = v2;
    fsmPickerCurrentPageIndicatorColorDarkEffect_sIsReduceTransparencyEnabled_fsmPickerCurrentPageIndicatorColorDarkEffect = v5;
  }
  return (UIColor *)(id)fsmPickerCurrentPageIndicatorColorDarkEffect_sBehavior;
}

void __57__CKUITheme_fsmPickerCurrentPageIndicatorColorDarkEffect__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.215686275, 0.215686275, 0.215686275, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fsmPickerCurrentPageIndicatorColorDarkEffect_sBehavior;
  fsmPickerCurrentPageIndicatorColorDarkEffect_sBehavior = v0;

}

- (UIColor)fsmPickerCloseButtonColor
{
  int v2;
  int IsReduceTransparencyEnabled;
  char v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;

  if (fsmPickerCloseButtonColor_onceToken != -1)
    dispatch_once(&fsmPickerCloseButtonColor_onceToken, &__block_literal_global_486);
  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (fsmPickerCloseButtonColor_sIsIncreaseContrastEnabled_fsmPickerCloseButtonColor != v2
    || fsmPickerCloseButtonColor_sIsReduceTransparencyEnabled_fsmPickerCloseButtonColor != IsReduceTransparencyEnabled)
  {
    v5 = IsReduceTransparencyEnabled;
    v6 = CFSTR("CKFSMPickerCloseButtonColor2");
    if (IsReduceTransparencyEnabled)
      v6 = CFSTR("CKFSMPickerCloseButtonColor1");
    if (v2)
      v7 = CFSTR("CKFSMPickerCloseButtonColor0");
    else
      v7 = v6;
    objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)fsmPickerCloseButtonColor_sBehavior;
    fsmPickerCloseButtonColor_sBehavior = v8;

    fsmPickerCloseButtonColor_sIsIncreaseContrastEnabled_fsmPickerCloseButtonColor = v2;
    fsmPickerCloseButtonColor_sIsReduceTransparencyEnabled_fsmPickerCloseButtonColor = v5;
  }
  return (UIColor *)(id)fsmPickerCloseButtonColor_sBehavior;
}

void __38__CKUITheme_fsmPickerCloseButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKFSMPickerCloseButtonColor2"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fsmPickerCloseButtonColor_sBehavior;
  fsmPickerCloseButtonColor_sBehavior = v0;

}

- (UIColor)fsmPickerCloseButtonColorDarkEffect
{
  int v2;
  int IsReduceTransparencyEnabled;
  char v5;
  uint64_t v6;
  void *v7;

  if (fsmPickerCloseButtonColorDarkEffect_onceToken != -1)
    dispatch_once(&fsmPickerCloseButtonColorDarkEffect_onceToken, &__block_literal_global_493);
  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (fsmPickerCloseButtonColorDarkEffect_sIsIncreaseContrastEnabled_fsmPickerCloseButtonColorDarkEffect != v2
    || fsmPickerCloseButtonColorDarkEffect_sIsReduceTransparencyEnabled_fsmPickerCloseButtonColorDarkEffect != IsReduceTransparencyEnabled)
  {
    v5 = IsReduceTransparencyEnabled;
    if (v2 || IsReduceTransparencyEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemExtraLightGrayColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.352941176, 0.352941176, 0.352941176, 1.0);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)fsmPickerCloseButtonColorDarkEffect_sBehavior;
    fsmPickerCloseButtonColorDarkEffect_sBehavior = v6;

    fsmPickerCloseButtonColorDarkEffect_sIsIncreaseContrastEnabled_fsmPickerCloseButtonColorDarkEffect = v2;
    fsmPickerCloseButtonColorDarkEffect_sIsReduceTransparencyEnabled_fsmPickerCloseButtonColorDarkEffect = v5;
  }
  return (UIColor *)(id)fsmPickerCloseButtonColorDarkEffect_sBehavior;
}

void __48__CKUITheme_fsmPickerCloseButtonColorDarkEffect__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.352941176, 0.352941176, 0.352941176, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fsmPickerCloseButtonColorDarkEffect_sBehavior;
  fsmPickerCloseButtonColorDarkEffect_sBehavior = v0;

}

- (UIColor)fsmPickerSendButtonColor
{
  int v3;
  int IsReduceTransparencyEnabled;
  char v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CKUITheme_fsmPickerSendButtonColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (fsmPickerSendButtonColor_onceToken != -1)
    dispatch_once(&fsmPickerSendButtonColor_onceToken, block);
  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  v5 = IsReduceTransparencyEnabled;
  if (fsmPickerSendButtonColor_sIsIncreaseContrastEnabled_fsmPickerSendButtonColor != v3
    || fsmPickerSendButtonColor_sIsReduceTransparencyEnabled_fsmPickerSendButtonColor != IsReduceTransparencyEnabled)
  {
    if (v3)
    {
      v6 = (void *)MEMORY[0x1E0CEA478];
      v7 = CFSTR("CKFSMPickerSendButtonColor0");
    }
    else
    {
      if (!IsReduceTransparencyEnabled)
      {
        -[CKUITheme sendButtonColorForColorType:](self, "sendButtonColorForColorType:", 0xFFFFFFFFLL);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      v6 = (void *)MEMORY[0x1E0CEA478];
      v7 = CFSTR("CKFSMPickerSendButtonColor1");
    }
    objc_msgSend(v6, "ckColorNamed:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v9 = (void *)fsmPickerSendButtonColor_sBehavior;
    fsmPickerSendButtonColor_sBehavior = v8;

    fsmPickerSendButtonColor_sIsIncreaseContrastEnabled_fsmPickerSendButtonColor = v3;
    fsmPickerSendButtonColor_sIsReduceTransparencyEnabled_fsmPickerSendButtonColor = v5;
  }
  return (UIColor *)(id)fsmPickerSendButtonColor_sBehavior;
}

void __37__CKUITheme_fsmPickerSendButtonColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "sendButtonColorForColorType:", 0xFFFFFFFFLL);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)fsmPickerSendButtonColor_sBehavior;
  fsmPickerSendButtonColor_sBehavior = v1;

}

- (UIColor)fsmPickerBackgroundColor
{
  int v2;
  int IsReduceTransparencyEnabled;
  char v5;
  uint64_t v6;
  void *v7;

  if (fsmPickerBackgroundColor_onceToken != -1)
    dispatch_once(&fsmPickerBackgroundColor_onceToken, &__block_literal_global_498);
  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (fsmPickerBackgroundColor_sIsIncreaseContrastEnabled_fsmPickerBackgroundColor != v2
    || fsmPickerBackgroundColor_sIsReduceTransparencyEnabled_fsmPickerBackgroundColor != IsReduceTransparencyEnabled)
  {
    v5 = IsReduceTransparencyEnabled;
    if ((v2 & 1) != 0 || IsReduceTransparencyEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemExtraLightGrayColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v7 = (void *)fsmPickerBackgroundColor_sBehavior;
    fsmPickerBackgroundColor_sBehavior = v6;

    fsmPickerBackgroundColor_sIsIncreaseContrastEnabled_fsmPickerBackgroundColor = v2;
    fsmPickerBackgroundColor_sIsReduceTransparencyEnabled_fsmPickerBackgroundColor = v5;
  }
  return (UIColor *)(id)fsmPickerBackgroundColor_sBehavior;
}

void __37__CKUITheme_fsmPickerBackgroundColor__block_invoke()
{
  void *v0;

  v0 = (void *)fsmPickerBackgroundColor_sBehavior;
  fsmPickerBackgroundColor_sBehavior = 0;

}

- (UIColor)fsmPickerRoundedViewColor
{
  int v2;
  int IsReduceTransparencyEnabled;
  char v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;

  if (fsmPickerRoundedViewColor_onceToken != -1)
    dispatch_once(&fsmPickerRoundedViewColor_onceToken, &__block_literal_global_499);
  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (fsmPickerRoundedViewColor_sIsIncreaseContrastEnabled_fsmPickerRoundedViewColor != v2
    || fsmPickerRoundedViewColor_sIsReduceTransparencyEnabled_fsmPickerRoundedViewColor != IsReduceTransparencyEnabled)
  {
    v5 = IsReduceTransparencyEnabled;
    v6 = CFSTR("CKFSMPickerRoundedViewColor2");
    if (IsReduceTransparencyEnabled)
      v6 = CFSTR("CKFSMPickerRoundedViewColor1");
    if (v2)
      v7 = CFSTR("CKFSMPickerRoundedViewColor0");
    else
      v7 = v6;
    objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)fsmPickerRoundedViewColor_sBehavior;
    fsmPickerRoundedViewColor_sBehavior = v8;

    fsmPickerRoundedViewColor_sIsIncreaseContrastEnabled_fsmPickerRoundedViewColor = v2;
    fsmPickerRoundedViewColor_sIsReduceTransparencyEnabled_fsmPickerRoundedViewColor = v5;
  }
  return (UIColor *)(id)fsmPickerRoundedViewColor_sBehavior;
}

void __38__CKUITheme_fsmPickerRoundedViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKFSMPickerRoundedViewColor2"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fsmPickerRoundedViewColor_sBehavior;
  fsmPickerRoundedViewColor_sBehavior = v0;

}

- (UIColor)macEffectPickerCloseButtonTintColor
{
  if (macEffectPickerCloseButtonTintColor_once != -1)
    dispatch_once(&macEffectPickerCloseButtonTintColor_once, &__block_literal_global_506);
  return (UIColor *)(id)macEffectPickerCloseButtonTintColor_sBehavior;
}

void __48__CKUITheme_macEffectPickerCloseButtonTintColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)macEffectPickerCloseButtonTintColor_sBehavior;
  macEffectPickerCloseButtonTintColor_sBehavior = v0;

}

- (UIColor)fsmPickerBlueLayerBackgroundColor
{
  if (fsmPickerBlueLayerBackgroundColor_once != -1)
    dispatch_once(&fsmPickerBlueLayerBackgroundColor_once, &__block_literal_global_507);
  return (UIColor *)(id)fsmPickerBlueLayerBackgroundColor_sBehavior;
}

void __46__CKUITheme_fsmPickerBlueLayerBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKFSMPickerBlueLayerBackgroundColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fsmPickerBlueLayerBackgroundColor_sBehavior;
  fsmPickerBlueLayerBackgroundColor_sBehavior = v0;

}

- (UIColor)fsmPickerBackgroundViewColor
{
  if (fsmPickerBackgroundViewColor_once != -1)
    dispatch_once(&fsmPickerBackgroundViewColor_once, &__block_literal_global_510);
  return (UIColor *)(id)fsmPickerBackgroundViewColor_sBehavior;
}

void __41__CKUITheme_fsmPickerBackgroundViewColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKFSMPickerBackgroundViewColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fsmPickerBackgroundViewColor_sBehavior;
  fsmPickerBackgroundViewColor_sBehavior = v0;

}

- (UIColor)fsmPickerDotColor
{
  if (fsmPickerDotColor_once != -1)
    dispatch_once(&fsmPickerDotColor_once, &__block_literal_global_513);
  return (UIColor *)(id)fsmPickerDotColor_sBehavior;
}

void __30__CKUITheme_fsmPickerDotColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKFSMPickerDotColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fsmPickerDotColor_sBehavior;
  fsmPickerDotColor_sBehavior = v0;

}

- (UIColor)businessDescriptionViewControllerBackgroundColor
{
  if (businessDescriptionViewControllerBackgroundColor_once != -1)
    dispatch_once(&businessDescriptionViewControllerBackgroundColor_once, &__block_literal_global_516);
  return (UIColor *)(id)businessDescriptionViewControllerBackgroundColor_sBehavior;
}

void __61__CKUITheme_businessDescriptionViewControllerBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)businessDescriptionViewControllerBackgroundColor_sBehavior;
  businessDescriptionViewControllerBackgroundColor_sBehavior = v0;

}

- (UIColor)businessInfoViewGreetingTextColor
{
  if (businessInfoViewGreetingTextColor_once != -1)
    dispatch_once(&businessInfoViewGreetingTextColor_once, &__block_literal_global_517);
  return (UIColor *)(id)businessInfoViewGreetingTextColor_sBehavior;
}

void __46__CKUITheme_businessInfoViewGreetingTextColor__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.4, 1.0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.6, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dynamicColorWithLightColor:darkColor:", v4, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)businessInfoViewGreetingTextColor_sBehavior;
  businessInfoViewGreetingTextColor_sBehavior = v2;

}

- (UIColor)businessInfoViewDescriptionTextColor
{
  if (businessInfoViewDescriptionTextColor_once != -1)
    dispatch_once(&businessInfoViewDescriptionTextColor_once, &__block_literal_global_518);
  return (UIColor *)(id)businessInfoViewDescriptionTextColor_sBehavior;
}

void __49__CKUITheme_businessInfoViewDescriptionTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)businessInfoViewDescriptionTextColor_sBehavior;
  businessInfoViewDescriptionTextColor_sBehavior = v0;

}

- (int64_t)statusBarStyleForBusinessChat:(id)a3
{
  if (-[CKUITheme navBarTextStyleForBusinessChat:](self, "navBarTextStyleForBusinessChat:", a3) == 3)
    return 1;
  else
    return 3;
}

- (int64_t)statusBarStyleForBusinessHandle:(id)a3
{
  return -[CKUITheme _businessStatusBarStyleForNavStyle:](self, "_businessStatusBarStyleForNavStyle:", -[CKUITheme navBarTextStyleForBusinessHandle:](self, "navBarTextStyleForBusinessHandle:", a3));
}

- (int64_t)_businessStatusBarStyleForNavStyle:(int64_t)a3
{
  if (a3 == 3)
    return 1;
  else
    return 3;
}

- (int64_t)navBarTextStyleForBusinessChat:(id)a3
{
  void *v4;
  int64_t v5;

  -[CKUITheme primaryBrandColorForBusinessChat:](self, "primaryBrandColorForBusinessChat:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CKUITheme _businessNavBarTextStyleForColor:](self, "_businessNavBarTextStyleForColor:", v4);

  return v5;
}

- (int64_t)navBarTextStyleForBusinessHandle:(id)a3
{
  void *v4;
  int64_t v5;

  -[CKUITheme primaryBrandColorForBusinessHandle:](self, "primaryBrandColorForBusinessHandle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CKUITheme _businessNavBarTextStyleForColor:](self, "_businessNavBarTextStyleForColor:", v4);

  return v5;
}

- (int64_t)_businessNavBarTextStyleForColor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  double v10;
  double v11;

  v3 = a3;
  if (v3
    || (objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "traitCollection"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v5,
        v4,
        v6 != 2))
  {
    v10 = 0.0;
    v11 = 0.0;
    objc_msgSend(v3, "getWhite:alpha:", &v11, &v10);
    if (v10 > 0.0 && v11 < 0.55)
      v7 = 3;
    else
      v7 = 5;
  }
  else
  {
    v7 = 3;
  }

  return v7;
}

- (id)_primaryBrandColorForBrand:(id)a3 debugAssociatedObject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "primaryBrandColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = IMOSLoggingEnabled();
  if (v7)
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 138412546;
        v12 = v5;
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "primaryBrandColorForBrand: Successfully fetched primary business color for brand %@ associated with %@", (uint8_t *)&v11, 0x16u);
      }
LABEL_9:

    }
  }
  else if (v8)
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 138412546;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "primaryBrandColorForBrand: Got nil color for brand %@ associated with %@", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_9;
  }

  return v7;
}

- (id)_secondaryBrandColorForBrand:(id)a3 debugAssociatedObject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "secondaryBrandColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = IMOSLoggingEnabled();
  if (v7)
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 138412546;
        v12 = v5;
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "secondaryBrandColorForBrand: Successfully fetched secondary business color for brand %@ associated with %@", (uint8_t *)&v11, 0x16u);
      }
LABEL_9:

    }
  }
  else if (v8)
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 138412546;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "secondaryBrandColorForBrand: Got nil color for brand %@ associated with %@", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_9;
  }

  return v7;
}

- (id)primaryBrandColorForBusinessHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "brand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKUITheme _primaryBrandColorForBrand:debugAssociatedObject:](self, "_primaryBrandColorForBrand:debugAssociatedObject:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)secondaryBrandColorForBusinessHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "brand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKUITheme _secondaryBrandColorForBrand:debugAssociatedObject:](self, "_secondaryBrandColorForBrand:debugAssociatedObject:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIColor)nicknameViewBackgroundColor
{
  if (nicknameViewBackgroundColor_once != -1)
    dispatch_once(&nicknameViewBackgroundColor_once, &__block_literal_global_522);
  return (UIColor *)(id)nicknameViewBackgroundColor_sBehavior;
}

void __40__CKUITheme_nicknameViewBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)nicknameViewBackgroundColor_sBehavior;
  nicknameViewBackgroundColor_sBehavior = v0;

}

- (UIColor)dividerViewBackgroundColor
{
  if (dividerViewBackgroundColor_once != -1)
    dispatch_once(&dividerViewBackgroundColor_once, &__block_literal_global_523);
  return (UIColor *)(id)dividerViewBackgroundColor_sBehavior;
}

void __39__CKUITheme_dividerViewBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dividerViewBackgroundColor_sBehavior;
  dividerViewBackgroundColor_sBehavior = v0;

}

- (UIColor)callButtonBackgroundColor
{
  if (callButtonBackgroundColor_once != -1)
    dispatch_once(&callButtonBackgroundColor_once, &__block_literal_global_524);
  return (UIColor *)(id)callButtonBackgroundColor_sBehavior;
}

void __38__CKUITheme_callButtonBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.9, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)callButtonBackgroundColor_sBehavior;
  callButtonBackgroundColor_sBehavior = v0;

}

- (UIColor)syncProgressLabelColor
{
  if (syncProgressLabelColor_once != -1)
    dispatch_once(&syncProgressLabelColor_once, &__block_literal_global_525);
  return (UIColor *)(id)syncProgressLabelColor_sBehavior;
}

void __35__CKUITheme_syncProgressLabelColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)syncProgressLabelColor_sBehavior;
  syncProgressLabelColor_sBehavior = v0;

}

- (UIColor)syncProgressUserMessageColor
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (void *)syncProgressUserMessageColor_sBehavior;
  if (syncProgressUserMessageColor_sBehavior)
    v4 = syncProgressUserMessageColor_sIsIncreaseContrastEnabled_syncProgressUserMessageColor == v2;
  else
    v4 = 0;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)syncProgressUserMessageColor_sBehavior;
    syncProgressUserMessageColor_sBehavior = v5;

    syncProgressUserMessageColor_sIsIncreaseContrastEnabled_syncProgressUserMessageColor = v2;
    v3 = (void *)syncProgressUserMessageColor_sBehavior;
  }
  return (UIColor *)v3;
}

- (UIColor)syncProgressUserActionButtonTextColor
{
  int v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)syncProgressUserActionButtonTextColor_sBehavior;
  if (syncProgressUserActionButtonTextColor_sBehavior)
    v5 = syncProgressUserActionButtonTextColor_sIsIncreaseContrastEnabled_syncProgressUserActionButtonTextColor == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme balloonColorsForColorType:](self, "balloonColorsForColorType:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)syncProgressUserActionButtonTextColor_sBehavior;
    syncProgressUserActionButtonTextColor_sBehavior = v7;

    syncProgressUserActionButtonTextColor_sIsIncreaseContrastEnabled_syncProgressUserActionButtonTextColor = v3;
    v4 = (void *)syncProgressUserActionButtonTextColor_sBehavior;
  }
  return (UIColor *)v4;
}

- (UIColor)syncProgressIndeterminateProgressBarTintColor
{
  if (syncProgressIndeterminateProgressBarTintColor_once != -1)
    dispatch_once(&syncProgressIndeterminateProgressBarTintColor_once, &__block_literal_global_526);
  return (UIColor *)(id)syncProgressIndeterminateProgressBarTintColor_sBehavior;
}

void __58__CKUITheme_syncProgressIndeterminateProgressBarTintColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)syncProgressIndeterminateProgressBarTintColor_sBehavior;
  syncProgressIndeterminateProgressBarTintColor_sBehavior = v0;

}

- (UIColor)syncProgressActionButtonDisabledColor
{
  if (syncProgressActionButtonDisabledColor_once != -1)
    dispatch_once(&syncProgressActionButtonDisabledColor_once, &__block_literal_global_527);
  return (UIColor *)(id)syncProgressActionButtonDisabledColor_sBehavior;
}

void __50__CKUITheme_syncProgressActionButtonDisabledColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)syncProgressActionButtonDisabledColor_sBehavior;
  syncProgressActionButtonDisabledColor_sBehavior = v0;

}

- (UIColor)carplayNavBarComposeButtonColor
{
  if (carplayNavBarComposeButtonColor_once != -1)
    dispatch_once(&carplayNavBarComposeButtonColor_once, &__block_literal_global_528);
  return (UIColor *)(id)carplayNavBarComposeButtonColor_sBehavior;
}

void __44__CKUITheme_carplayNavBarComposeButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "_carSystemFocusColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)carplayNavBarComposeButtonColor_sBehavior;
  carplayNavBarComposeButtonColor_sBehavior = v0;

}

- (UIColor)carplayNavBarComposeButtonFocusColor
{
  if (carplayNavBarComposeButtonFocusColor_once != -1)
    dispatch_once(&carplayNavBarComposeButtonFocusColor_once, &__block_literal_global_529);
  return (UIColor *)(id)carplayNavBarComposeButtonFocusColor_sBehavior;
}

void __49__CKUITheme_carplayNavBarComposeButtonFocusColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)carplayNavBarComposeButtonFocusColor_sBehavior;
  carplayNavBarComposeButtonFocusColor_sBehavior = v0;

}

- (UIColor)carplayNavBarComposeButtonColor_Highlight
{
  if (carplayNavBarComposeButtonColor_Highlight_once != -1)
    dispatch_once(&carplayNavBarComposeButtonColor_Highlight_once, &__block_literal_global_530);
  return (UIColor *)(id)carplayNavBarComposeButtonColor_Highlight_sBehavior;
}

void __54__CKUITheme_carplayNavBarComposeButtonColor_Highlight__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemFillColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)carplayNavBarComposeButtonColor_Highlight_sBehavior;
  carplayNavBarComposeButtonColor_Highlight_sBehavior = v0;

}

- (UIColor)carplayNavBarComposeButtonFocusColor_Highlight
{
  if (carplayNavBarComposeButtonFocusColor_Highlight_once != -1)
    dispatch_once(&carplayNavBarComposeButtonFocusColor_Highlight_once, &__block_literal_global_531);
  return (UIColor *)(id)carplayNavBarComposeButtonFocusColor_Highlight_sBehavior;
}

void __59__CKUITheme_carplayNavBarComposeButtonFocusColor_Highlight__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "_carSystemFocusColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)carplayNavBarComposeButtonFocusColor_Highlight_sBehavior;
  carplayNavBarComposeButtonFocusColor_Highlight_sBehavior = v0;

}

- (UIColor)carplayUnreadImageColor_Light
{
  if (carplayUnreadImageColor_Light_once != -1)
    dispatch_once(&carplayUnreadImageColor_Light_once, &__block_literal_global_532);
  return (UIColor *)(id)carplayUnreadImageColor_Light_sBehavior;
}

void __42__CKUITheme_carplayUnreadImageColor_Light__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "_carSystemFocusColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)carplayUnreadImageColor_Light_sBehavior;
  carplayUnreadImageColor_Light_sBehavior = v0;

}

- (UIColor)carplayUnreadImageColor_Highlighted_Light
{
  if (carplayUnreadImageColor_Highlighted_Light_once != -1)
    dispatch_once(&carplayUnreadImageColor_Highlighted_Light_once, &__block_literal_global_533);
  return (UIColor *)(id)carplayUnreadImageColor_Highlighted_Light_sBehavior;
}

void __54__CKUITheme_carplayUnreadImageColor_Highlighted_Light__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "_carSystemFocusLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)carplayUnreadImageColor_Highlighted_Light_sBehavior;
  carplayUnreadImageColor_Highlighted_Light_sBehavior = v0;

}

- (UIColor)carplayUnreadImageColor_Dark
{
  if (carplayUnreadImageColor_Dark_once != -1)
    dispatch_once(&carplayUnreadImageColor_Dark_once, &__block_literal_global_534);
  return (UIColor *)(id)carplayUnreadImageColor_Dark_sBehavior;
}

void __41__CKUITheme_carplayUnreadImageColor_Dark__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "_carSystemFocusColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)carplayUnreadImageColor_Dark_sBehavior;
  carplayUnreadImageColor_Dark_sBehavior = v0;

}

- (UIColor)carplayUnreadImageColor_Highlighted_Dark
{
  if (carplayUnreadImageColor_Highlighted_Dark_once != -1)
    dispatch_once(&carplayUnreadImageColor_Highlighted_Dark_once, &__block_literal_global_535);
  return (UIColor *)(id)carplayUnreadImageColor_Highlighted_Dark_sBehavior;
}

void __53__CKUITheme_carplayUnreadImageColor_Highlighted_Dark__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "_carSystemFocusLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)carplayUnreadImageColor_Highlighted_Dark_sBehavior;
  carplayUnreadImageColor_Highlighted_Dark_sBehavior = v0;

}

- (UIColor)carplayRecipientLabelColor
{
  if (carplayRecipientLabelColor_once != -1)
    dispatch_once(&carplayRecipientLabelColor_once, &__block_literal_global_536);
  return (UIColor *)(id)carplayRecipientLabelColor_sBehavior;
}

void __39__CKUITheme_carplayRecipientLabelColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)carplayRecipientLabelColor_sBehavior;
  carplayRecipientLabelColor_sBehavior = v0;

}

- (UIColor)carplayRecipientLabelFocusColor
{
  if (carplayRecipientLabelFocusColor_once != -1)
    dispatch_once(&carplayRecipientLabelFocusColor_once, &__block_literal_global_537);
  return (UIColor *)(id)carplayRecipientLabelFocusColor_sBehavior;
}

void __44__CKUITheme_carplayRecipientLabelFocusColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "_carSystemFocusLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)carplayRecipientLabelFocusColor_sBehavior;
  carplayRecipientLabelFocusColor_sBehavior = v0;

}

- (UIColor)carplayDateLabelColor
{
  if (carplayDateLabelColor_once != -1)
    dispatch_once(&carplayDateLabelColor_once, &__block_literal_global_538);
  return (UIColor *)(id)carplayDateLabelColor_sBehavior;
}

void __34__CKUITheme_carplayDateLabelColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "_carSystemPrimaryColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)carplayDateLabelColor_sBehavior;
  carplayDateLabelColor_sBehavior = v0;

}

- (UIColor)carplayDateLabelFocusColor
{
  if (carplayDateLabelFocusColor_once != -1)
    dispatch_once(&carplayDateLabelFocusColor_once, &__block_literal_global_539);
  return (UIColor *)(id)carplayDateLabelFocusColor_sBehavior;
}

void __39__CKUITheme_carplayDateLabelFocusColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "_carSystemFocusPrimaryColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)carplayDateLabelFocusColor_sBehavior;
  carplayDateLabelFocusColor_sBehavior = v0;

}

- (int64_t)HUDStyle
{
  return self->_HUDStyle;
}

- (UIColor)darkAppTintColor
{
  return self->_darkAppTintColor;
}

- (int64_t)businessStatusBarStyle
{
  return self->_businessStatusBarStyle;
}

- (UIColor)conversationListCellPreviewBackgroundColor
{
  return self->_conversationListCellPreviewBackgroundColor;
}

- (UIColor)spotlightSearchBarBackgroundColor
{
  return self->_spotlightSearchBarBackgroundColor;
}

- (UIColor)transcriptNavBarTextColor
{
  return self->_transcriptNavBarTextColor;
}

- (UIColor)editableViewUncheckedSymbol
{
  return self->_editableViewUncheckedSymbol;
}

- (UIColor)searchResultsSeperatorColor
{
  return self->_searchResultsSeperatorColor;
}

- (UIColor)detailsCellStaticTextColor
{
  return self->_detailsCellStaticTextColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsCellStaticTextColor, 0);
  objc_storeStrong((id *)&self->_searchResultsSeperatorColor, 0);
  objc_storeStrong((id *)&self->_editableViewUncheckedSymbol, 0);
  objc_storeStrong((id *)&self->_transcriptNavBarTextColor, 0);
  objc_storeStrong((id *)&self->_spotlightSearchBarBackgroundColor, 0);
  objc_storeStrong((id *)&self->_conversationListCellPreviewBackgroundColor, 0);
  objc_storeStrong((id *)&self->_darkAppTintColor, 0);
}

@end
