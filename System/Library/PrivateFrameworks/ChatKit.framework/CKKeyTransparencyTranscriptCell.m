@implementation CKKeyTransparencyTranscriptCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;

  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKKeyTransparencyTranscriptCell;
  v12 = a3;
  -[CKTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v15, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  objc_msgSend(v12, "transcriptText", v15.receiver, v15.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKeyTransparencyTranscriptCell setAttributedText:](self, "setAttributedText:", v13);

  objc_msgSend(v12, "IMChatItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CKKeyTransparencyTranscriptCell setIsGroupChat:](self, "setIsGroupChat:", objc_msgSend(v14, "isGroupChat"));
    -[CKKeyTransparencyTranscriptCell setKeyTransparencyStatus:](self, "setKeyTransparencyStatus:", objc_msgSend(v14, "status"));
  }

}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)generateWarningImageView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageByApplyingSymbolConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v4);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "theme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transcriptTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v8);

  return v5;
}

+ (id)generateActionButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptButtonContentEdgeInsets");
  objc_msgSend(v2, "setContentEdgeInsets:");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerTranscriptButtonTextAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0CB3498]);
  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("KT_MORE_TRANSCRIPT_LINK"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithString:attributes:", v8, v5);

  objc_msgSend(v2, "setAttributedTitle:forState:", v9, 0);
  return v2;
}

+ (id)generateLabel
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0CEA700]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setNumberOfLines:", 0);
  return v3;
}

+ (double)heightForChatItem:(id)a3 fittingSize:(CGSize)a4
{
  double width;
  id v5;
  void *v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;

  width = a4.width;
  v5 = a3;
  +[CKKeyTransparencyTranscriptCell generateLabel](CKKeyTransparencyTranscriptCell, "generateLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    objc_msgSend(v7, "IMChatItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "IMChatItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "affectedHandles");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKKeyTransparencyTranscriptUtilities transcriptStringFromHandles:status:](CKKeyTransparencyTranscriptUtilities, "transcriptStringFromHandles:status:", v11, objc_msgSend(v10, "status"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setAttributedText:", v12);
    }

  }
  v13 = width + -64.0;
  objc_msgSend(v6, "sizeThatFits:", v13, 1.79769313e308);
  v15 = v14;
  +[CKKeyTransparencyTranscriptCell generateActionButton](CKKeyTransparencyTranscriptCell, "generateActionButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sizeThatFits:", v13, 1.79769313e308);
  v18 = v17 + -2.0;
  +[CKKeyTransparencyTranscriptCell generateWarningImageView](CKKeyTransparencyTranscriptCell, "generateWarningImageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v21 = v15 + 16.0 + v18 + v20 + 8.0;

  return v21;
}

- (CKKeyTransparencyTranscriptCell)initWithFrame:(CGRect)a3
{
  CKKeyTransparencyTranscriptCell *v3;
  CKKeyTransparencyTranscriptCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKKeyTransparencyTranscriptCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKEditableCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKKeyTransparencyTranscriptCell warningImageView](v4, "warningImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    -[CKEditableCollectionViewCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKKeyTransparencyTranscriptCell label](v4, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[CKEditableCollectionViewCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKKeyTransparencyTranscriptCell actionButton](v4, "actionButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

  }
  return v4;
}

- (void)layoutSubviewsForAlignmentContents
{
  double y;
  double width;
  double height;
  double MidX;
  double v7;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)CKKeyTransparencyTranscriptCell;
  -[CKEditableCollectionViewCell layoutSubviewsForAlignmentContents](&v8, sel_layoutSubviewsForAlignmentContents);
  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  MidX = CGRectGetMidX(v9);
  if (width > 420.0)
    width = 420.0;
  v7 = MidX + width * -0.5;
  -[CKKeyTransparencyTranscriptCell _layoutWarningImageInAlignmentContentRect:](self, "_layoutWarningImageInAlignmentContentRect:", v7, y, width, height);
  -[CKKeyTransparencyTranscriptCell _layoutLabelInAlignmentContentRect:](self, "_layoutLabelInAlignmentContentRect:", v7, y, width, height);
  -[CKKeyTransparencyTranscriptCell _layoutButtonInAlignmentContentRect:](self, "_layoutButtonInAlignmentContentRect:", v7, y, width, height);
}

- (void)_layoutWarningImageInAlignmentContentRect:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double MidX;
  void *v15;
  double v16;
  double v17;
  id v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKKeyTransparencyTranscriptCell warningImageView](self, "warningImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  v9 = width + -64.0;
  if (width + -64.0 > 420.0)
    v9 = 420.0;
  objc_msgSend(v8, "sizeThatFits:", v9, 1.79769313e308);
  v11 = v10;
  v13 = v12;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MidX = CGRectGetMidX(v19);
  -[CKKeyTransparencyTranscriptCell traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayScale");
  v17 = MidX - round(v11 * 0.5 * v16) / v16;

  objc_msgSend(v18, "setFrame:", v17, 8.0, v11, v13);
}

- (void)_layoutLabelInAlignmentContentRect:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double MidX;
  void *v13;
  double v14;
  double v15;
  void *v16;
  CGFloat v17;
  id v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKKeyTransparencyTranscriptCell label](self, "label");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeThatFits:", width, 1.79769313e308);
  v9 = v8;
  v11 = v10;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MidX = CGRectGetMidX(v19);
  -[CKKeyTransparencyTranscriptCell traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayScale");
  v15 = MidX - round(v9 * 0.5 * v14) / v14;

  -[CKKeyTransparencyTranscriptCell warningImageView](self, "warningImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v17 = CGRectGetMaxY(v20) + 8.0;

  objc_msgSend(v18, "setFrame:", v15, v17, v9, v11);
}

- (void)_layoutButtonInAlignmentContentRect:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double MidX;
  void *v15;
  double v16;
  double v17;
  void *v18;
  CGFloat v19;
  id v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKKeyTransparencyTranscriptCell actionButton](self, "actionButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v8;
  v9 = width + -64.0;
  if (width + -64.0 > 420.0)
    v9 = 420.0;
  objc_msgSend(v8, "sizeThatFits:", v9, 1.79769313e308);
  v11 = v10;
  v13 = v12;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MidX = CGRectGetMidX(v21);
  -[CKKeyTransparencyTranscriptCell traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayScale");
  v17 = MidX - round(v11 * 0.5 * v16) / v16;

  -[CKKeyTransparencyTranscriptCell label](self, "label");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v19 = CGRectGetMaxY(v22) + -2.0;

  objc_msgSend(v20, "setFrame:", v17, v19, v11, v13);
}

- (void)setAttributedText:(id)a3
{
  NSAttributedString *v5;

  v5 = (NSAttributedString *)a3;
  if (self->_attributedText != v5)
  {
    objc_storeStrong((id *)&self->_attributedText, a3);
    -[UILabel setAttributedText:](self->_label, "setAttributedText:", v5);
  }

}

- (void)setIsGroupChat:(BOOL)a3
{
  if (self->_isGroupChat != a3)
    self->_isGroupChat = a3;
}

- (void)setKeyTransparencyStatus:(unint64_t)a3
{
  if (self->_keyTransparencyStatus != a3)
  {
    self->_keyTransparencyStatus = a3;
    -[CKKeyTransparencyTranscriptCell setupKeyTransparencyMenu](self, "setupKeyTransparencyMenu");
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKKeyTransparencyTranscriptCell;
  -[CKTranscriptCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKKeyTransparencyTranscriptCell setNeedsLayout](self, "setNeedsLayout");
}

- (UILabel)label
{
  UILabel *label;
  UILabel *v4;
  UILabel *v5;

  label = self->_label;
  if (!label)
  {
    +[CKKeyTransparencyTranscriptCell generateLabel](CKKeyTransparencyTranscriptCell, "generateLabel");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_label;
    self->_label = v4;

    label = self->_label;
  }
  return label;
}

- (UIButton)actionButton
{
  UIButton *actionButton;
  UIButton *v4;
  UIButton *v5;

  actionButton = self->_actionButton;
  if (!actionButton)
  {
    +[CKKeyTransparencyTranscriptCell generateActionButton](CKKeyTransparencyTranscriptCell, "generateActionButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_actionButton;
    self->_actionButton = v4;

    actionButton = self->_actionButton;
  }
  return actionButton;
}

- (UIImageView)warningImageView
{
  UIImageView *warningImageView;
  UIImageView *v4;
  UIImageView *v5;

  warningImageView = self->_warningImageView;
  if (!warningImageView)
  {
    +[CKKeyTransparencyTranscriptCell generateWarningImageView](CKKeyTransparencyTranscriptCell, "generateWarningImageView");
    v4 = (UIImageView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_warningImageView;
    self->_warningImageView = v4;

    warningImageView = self->_warningImageView;
  }
  return warningImageView;
}

- (void)setupKeyTransparencyMenu
{
  unint64_t keyTransparencyStatus;
  UIButton *actionButton;
  uint64_t v5;
  id v6;

  -[UIButton setShowsMenuAsPrimaryAction:](self->_actionButton, "setShowsMenuAsPrimaryAction:", 1);
  keyTransparencyStatus = self->_keyTransparencyStatus;
  if (keyTransparencyStatus - 5 < 2)
  {
    actionButton = self->_actionButton;
    -[CKKeyTransparencyTranscriptCell menuForKTStatusError](self, "menuForKTStatusError");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (keyTransparencyStatus == 9)
  {
    actionButton = self->_actionButton;
    -[CKKeyTransparencyTranscriptCell menuForKTStatusTurnedOff](self, "menuForKTStatusTurnedOff");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (keyTransparencyStatus != 11)
      return;
    actionButton = self->_actionButton;
    -[CKKeyTransparencyTranscriptCell menuForKTStatusUnavailable](self, "menuForKTStatusUnavailable");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (id)v5;
  -[UIButton setMenu:](actionButton, "setMenu:");

}

- (id)menuForKTStatusError
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
  char v13;
  void *v14;
  _QWORD v16[4];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKeyTransparencyTranscriptCell learnMoreAction](self, "learnMoreAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKeyTransparencyTranscriptCell reportToAppleAction](self, "reportToAppleAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKeyTransparencyTranscriptCell verifyConversationAction](self, "verifyConversationAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKeyTransparencyTranscriptCell clearWarningAction](self, "clearWarningAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CEA740];
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v10;
  v16[1] = v6;
  v16[2] = v5;
  v16[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isKeyTransparencyReportToAppleEnabled");

  if ((v13 & 1) == 0)
    objc_msgSend(v3, "removeObject:", v5);
  if (self->_isGroupChat)
    objc_msgSend(v3, "removeObject:", v6);
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E276D870, v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)menuForKTStatusUnavailable
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
  char v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKeyTransparencyTranscriptCell learnMoreAction](self, "learnMoreAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKeyTransparencyTranscriptCell reportToAppleAction](self, "reportToAppleAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKeyTransparencyTranscriptCell clearWarningAction](self, "clearWarningAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CEA740];
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v9;
  v15[1] = v5;
  v15[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v10);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isKeyTransparencyReportToAppleEnabled");

  if ((v12 & 1) == 0)
    objc_msgSend(v3, "removeObject:", v5);
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E276D870, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)menuForKTStatusTurnedOff
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKeyTransparencyTranscriptCell learnMoreAction](self, "learnMoreAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKeyTransparencyTranscriptCell clearWarningAction](self, "clearWarningAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEA740];
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  v12[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E276D870, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)learnMoreAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("KT_LEARN_MORE_ELLIPSES"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("info.circle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__CKKeyTransparencyTranscriptCell_learnMoreAction__block_invoke;
  v8[3] = &unk_1E274A4C0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __50__CKKeyTransparencyTranscriptCell_learnMoreAction__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "keyTransparencyTranscriptCellDidSelectLearnMore:", v3);

}

- (id)reportToAppleAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("KT_REPORT_TO_APPLE_ELLIPSES"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("exclamationmark.bubble"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CKKeyTransparencyTranscriptCell_reportToAppleAction__block_invoke;
  v8[3] = &unk_1E274A4C0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __54__CKKeyTransparencyTranscriptCell_reportToAppleAction__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "keyTransparencyTranscriptCellDidRequestReportToApple:", v3);

}

- (id)verifyConversationAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("KT_VERIFY_CONVERSATION_ELLIPSES"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("person.crop.circle.badge.checkmark"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__CKKeyTransparencyTranscriptCell_verifyConversationAction__block_invoke;
  v8[3] = &unk_1E274A4C0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __59__CKKeyTransparencyTranscriptCell_verifyConversationAction__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "keyTransparencyTranscriptCellDidRequestVerification:", v3);

}

- (id)clearWarningAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("KT_CLEAR_WARNING"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("xmark"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __53__CKKeyTransparencyTranscriptCell_clearWarningAction__block_invoke;
  v11 = &unk_1E274A4C0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAttributes:", 2, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

void __53__CKKeyTransparencyTranscriptCell_clearWarningAction__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "keyTransparencyTranscriptCellDidSelectIgnoreFailures:", v3);

}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (unint64_t)keyTransparencyStatus
{
  return self->_keyTransparencyStatus;
}

- (BOOL)isGroupChat
{
  return self->_isGroupChat;
}

- (CKKeyTransparencyTranscriptCellDelegate)delegate
{
  return (CKKeyTransparencyTranscriptCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void)setWarningImageView:(id)a3
{
  objc_storeStrong((id *)&self->_warningImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warningImageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end
