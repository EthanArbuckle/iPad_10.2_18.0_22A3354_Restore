@implementation CKAvocetTranscriptResumeButtonCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  uint64_t v14;
  objc_super v15;

  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKAvocetTranscriptResumeButtonCell;
  v12 = a3;
  -[CKTranscriptStampCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v15, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  objc_msgSend(v12, "chatIdentifier", v15.receiver, v15.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvocetTranscriptResumeButtonCell setChatIdentifier:](self, "setChatIdentifier:", v13);

  v14 = objc_msgSend(v12, "shouldShowStewieTextButton");
  -[CKAvocetTranscriptResumeButtonCell setShowStewieTextButton:](self, "setShowStewieTextButton:", v14);
  -[CKAvocetTranscriptResumeButtonCell setNeedsLayout](self, "setNeedsLayout");
}

+ (double)heightForChatItem:(id)a3 fittingSize:(CGSize)a4
{
  double width;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  width = a4.width;
  objc_msgSend(a1, "createStampLabelView", a3, a4.width, a4.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_configureLabel:", v6);
  objc_msgSend((id)objc_opt_class(), "_makeTextViaStewieButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transcriptBoldTextAlignmentInsets");
  v10 = v9;
  v12 = v11;

  v13 = width - (v10 + v12);
  objc_msgSend(v6, "attributedText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "boundingRectWithSize:options:context:", 1, 0, v13, 1.79769313e308);
  v16 = v15;

  v17 = v13 + -32.0;
  if (v13 + -32.0 > 400.0)
    v17 = 400.0;
  objc_msgSend(v7, "sizeThatFits:", v17, 1.79769313e308);
  v19 = v16 + 24.0 + v18 + 32.0;

  return v19;
}

- (void)setChatIdentifier:(id)a3
{
  NSString *v5;
  NSString **p_chatIdentifier;
  NSObject *v7;
  int v8;
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (NSString *)a3;
  p_chatIdentifier = &self->_chatIdentifier;
  if (*p_chatIdentifier != v5 && !-[NSString isEqualToString:](*p_chatIdentifier, "isEqualToString:", v5))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v5;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "chatIdentifier: %@", (uint8_t *)&v8, 0xCu);
      }

    }
    objc_storeStrong((id *)p_chatIdentifier, a3);
  }

}

+ (void)_configureLabel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transcriptEmphasizedFontAttributes");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SATELLITE_CONNECTION_ENDED"), &stru_1E276D870, CFSTR("ChatKit-Avocet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithString:attributes:", v7, v9);
  objc_msgSend(v3, "setAttributedText:", v8);

  objc_msgSend(v3, "setNumberOfLines:", 0);
}

+ (id)_makeTextViaStewieButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_class();
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TEXT_ROADSIDE_SERVICES"), &stru_1E276D870, CFSTR("ChatKit-Avocet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_buttonWithSystemImageName:titleString:", CFSTR("satellite.fill"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createButtonConfigurationWithSystemImageName:(id)a3 titleString:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CEA3A8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "grayButtonConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setButtonSize:", 3);
  objc_msgSend(v8, "setCornerStyle:", 4);
  objc_msgSend(v8, "setTitle:", v6);

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v11);

  objc_msgSend(v8, "setImagePadding:", 5.0);
  objc_msgSend(v8, "contentInsets");
  objc_msgSend(v8, "setContentInsets:");
  return v8;
}

+ (id)_buttonWithSystemImageName:(id)a3 titleString:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CEA3A0];
  +[CKAvocetTranscriptResumeButtonCell _createButtonConfigurationWithSystemImageName:titleString:](CKAvocetTranscriptResumeButtonCell, "_createButtonConfigurationWithSystemImageName:titleString:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonWithConfiguration:primaryAction:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKAvocetTranscriptResumeButtonCell)initWithFrame:(CGRect)a3
{
  CKAvocetTranscriptResumeButtonCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKAvocetTranscriptResumeButtonCell;
  v3 = -[CKTranscriptLabelCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_opt_class();
    -[CKTranscriptLabelCell label](v3, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_configureLabel:", v5);

    -[CKEditableCollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvocetTranscriptResumeButtonCell textViaStewieButton](v3, "textViaStewieButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

  }
  return v3;
}

- (void)layoutSubviewsForAlignmentContents
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MidX;
  void *v19;
  double v20;
  double v21;
  void *v22;
  CGFloat v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;

  v24.receiver = self;
  v24.super_class = (Class)CKAvocetTranscriptResumeButtonCell;
  -[CKTranscriptStampCell layoutSubviewsForAlignmentContents](&v24, sel_layoutSubviewsForAlignmentContents);
  -[CKTranscriptStampCell contentAlignmentRect](self, "contentAlignmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKAvocetTranscriptResumeButtonCell _layoutLabelInAlignmentContentRect:](self, "_layoutLabelInAlignmentContentRect:");
  -[CKAvocetTranscriptResumeButtonCell textViaStewieButton](self, "textViaStewieButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v8 + -32.0;
  if (v8 + -32.0 > 400.0)
    v13 = 400.0;
  objc_msgSend(v11, "sizeThatFits:", v13, 1.79769313e308);
  v15 = v14;
  v17 = fmax(v16, 200.0);
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  MidX = CGRectGetMidX(v25);
  -[CKAvocetTranscriptResumeButtonCell traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayScale");
  v21 = MidX - round(v17 * 0.5 * v20) / v20;

  -[CKTranscriptLabelCell label](self, "label");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  v23 = CGRectGetMaxY(v26) + 24.0;

  objc_msgSend(v12, "setFrame:", v21, v23, v17, v15);
  objc_msgSend(v12, "setHidden:", -[CKAvocetTranscriptResumeButtonCell isShowingStewieTextButton](self, "isShowingStewieTextButton") ^ 1);

}

- (void)_layoutLabelInAlignmentContentRect:(CGRect)a3
{
  double width;
  double x;
  void *v5;
  double v6;
  double v7;
  id v8;

  width = a3.size.width;
  x = a3.origin.x;
  -[CKTranscriptLabelCell label](self, "label", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingRectWithSize:options:context:", 1, 0, width, 1.79769313e308);
  v7 = v6;

  objc_msgSend(v8, "setFrame:", x, 8.0, width, v7);
}

- (void)setShowStewieTextButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  -[CKAvocetTranscriptResumeButtonCell textViaStewieButton](self, "textViaStewieButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if (self->_showStewieTextButton != v3 || ((v6 ^ v3) & 1) == 0)
  {
    -[CKAvocetTranscriptResumeButtonCell textViaStewieButton](self, "textViaStewieButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", !v3);

    -[CKAvocetTranscriptResumeButtonCell setNeedsLayout](self, "setNeedsLayout");
    -[CKAvocetTranscriptResumeButtonCell layoutIfNeeded](self, "layoutIfNeeded");
  }
  self->_showStewieTextButton = v3;
}

- (id)attributedButtonText
{
  void *v2;
  void *v3;

  -[CKAvocetTranscriptResumeButtonCell textViaStewieButton](self, "textViaStewieButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedTitleForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKAvocetTranscriptResumeButtonCell;
  -[CKTranscriptStampCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKAvocetTranscriptResumeButtonCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)touchUpInsideTextViaStewieButton:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *chatIdentifier;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      chatIdentifier = self->_chatIdentifier;
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = chatIdentifier;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "called touchUpInsideTextViaStewieButton: %@, chatIdentifier: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openStewieAppForChatIdentifier:completion:", self->_chatIdentifier, 0);

}

- (UIButton)textViaStewieButton
{
  UIButton *textViaStewieButton;
  UIButton *v4;
  UIButton *v5;

  textViaStewieButton = self->_textViaStewieButton;
  if (!textViaStewieButton)
  {
    objc_msgSend((id)objc_opt_class(), "_makeTextViaStewieButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_textViaStewieButton;
    self->_textViaStewieButton = v4;

    -[UIButton addTarget:action:forEvents:](self->_textViaStewieButton, "addTarget:action:forEvents:", self, sel_touchUpInsideTextViaStewieButton_, 64);
    textViaStewieButton = self->_textViaStewieButton;
  }
  return textViaStewieButton;
}

- (BOOL)isShowingStewieTextButton
{
  return self->_showStewieTextButton;
}

- (void)setTextViaStewieButton:(id)a3
{
  objc_storeStrong((id *)&self->_textViaStewieButton, a3);
}

- (NSString)chatIdentifier
{
  return self->_chatIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatIdentifier, 0);
  objc_storeStrong((id *)&self->_textViaStewieButton, 0);
}

@end
