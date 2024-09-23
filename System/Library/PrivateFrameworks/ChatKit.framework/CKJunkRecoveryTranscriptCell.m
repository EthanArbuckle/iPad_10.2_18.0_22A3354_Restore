@implementation CKJunkRecoveryTranscriptCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  uint64_t v9;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v9 = a5;
  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKJunkRecoveryTranscriptCell;
  -[CKTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v16, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  objc_msgSend(v12, "IMChatItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v9) = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v12, "IMChatItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "earliestMessageDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKJunkRecoveryTranscriptCell updateRecoverConversationTextViewContentForDate:](self, "updateRecoverConversationTextViewContentForDate:", v15);

  }
  -[CKJunkRecoveryTranscriptCell setNeedsLayout](self, "setNeedsLayout");

}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)generateDeleteConversationButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptButtonContentEdgeInsets");
  objc_msgSend(v2, "setContentEdgeInsets:");

  if (CKIsRunningInMacCatalyst())
  {
    v4 = 0;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerTranscriptButtonTextAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = objc_alloc(MEMORY[0x1E0CB3498]);
  v7 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DELETE_CONVERSATION"), &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceLayoutDirection");

  if (v12 == 1)
    v13 = CFSTR("\u200F");
  else
    v13 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(v6, "initWithString:attributes:", v14, v4);
  objc_msgSend(v2, "setAttributedTitle:forState:", v15, 0);

  return v2;
}

+ (id)generateRecoverJunkButton
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

  if (CKIsRunningInMacCatalyst())
  {
    v4 = 0;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerTranscriptButtonTextAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = objc_alloc(MEMORY[0x1E0CB3498]);
  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOT_JUNK"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithString:attributes:", v8, v4);

  objc_msgSend(v2, "setAttributedTitle:forState:", v9, 0);
  return v2;
}

+ (id)generateRecoverConversationTextView
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CEAB18]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(a1, "_attributedRecoverConversationStringWithDeletionDate:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", v5);

  return v4;
}

+ (id)_attributedRecoverConversationStringWithDeletionDate:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  if (v3)
    v4 = +[CKUtilities daysUntilJunkFilterDeletionForDate:](CKUtilities, "daysUntilJunkFilterDeletionForDate:", v3);
  else
    v4 = 90;
  v5 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("JUNK_CONVERSATION_WILL_BE_DELETED_IN_DAYS"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

  if (v10 == 1)
    v11 = CFSTR("\u200F");
  else
    v11 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transcriptEmphasizedFontAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v12, v14);
  return v15;
}

+ (double)heightForChatItem:(id)a3 fittingSize:(CGSize)a4
{
  double width;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  width = a4.width;
  objc_msgSend(a1, "generateRecoverConversationTextView", a3, a4.width, a4.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKJunkRecoveryTranscriptCell generateDeleteConversationButton](CKJunkRecoveryTranscriptCell, "generateDeleteConversationButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKJunkRecoveryTranscriptCell generateRecoverJunkButton](CKJunkRecoveryTranscriptCell, "generateRecoverJunkButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = width + -48.0;
  objc_msgSend(v5, "sizeThatFits:", v8, 1.79769313e308);
  v10 = v9;
  objc_msgSend(v6, "sizeThatFits:", v8, 1.79769313e308);
  v12 = v11;
  objc_msgSend(v7, "sizeThatFits:", v8, 1.79769313e308);
  v14 = v13 + v12 + v10 + 8.0 + 10.0 + 10.0 + 32.0;

  return v14;
}

- (CKJunkRecoveryTranscriptCell)initWithFrame:(CGRect)a3
{
  CKJunkRecoveryTranscriptCell *v3;
  CKJunkRecoveryTranscriptCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKJunkRecoveryTranscriptCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKEditableCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKJunkRecoveryTranscriptCell recoverConversationTextView](v4, "recoverConversationTextView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    -[CKEditableCollectionViewCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKJunkRecoveryTranscriptCell deleteConversationButton](v4, "deleteConversationButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[CKEditableCollectionViewCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKJunkRecoveryTranscriptCell recoverJunkButton](v4, "recoverJunkButton");
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
  void *v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double MaxY;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  CGFloat v32;
  void *v33;
  double v34;
  objc_super v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v35.receiver = self;
  v35.super_class = (Class)CKJunkRecoveryTranscriptCell;
  -[CKEditableCollectionViewCell layoutSubviewsForAlignmentContents](&v35, sel_layoutSubviewsForAlignmentContents);
  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  MidX = CGRectGetMidX(v36);
  if (width + -48.0 <= 420.0)
    v7 = width + -48.0;
  else
    v7 = 420.0;
  -[CKJunkRecoveryTranscriptCell traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  v10 = MidX - round(v9 * (v7 * 0.5)) / v9;

  -[CKEditableCollectionViewCell setContentAlignmentRect:](self, "setContentAlignmentRect:", v10, y, v7, height);
  -[CKJunkRecoveryTranscriptCell _layoutLabelInAlignmentContentRect:](self, "_layoutLabelInAlignmentContentRect:", v10, y, v7, height);
  -[CKJunkRecoveryTranscriptCell deleteConversationButton](self, "deleteConversationButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", v7, 1.79769313e308);
  v13 = v12;
  v34 = v14;

  v37.origin.x = v10;
  v37.origin.y = y;
  v37.size.width = v7;
  v37.size.height = height;
  v15 = CGRectGetMidX(v37);
  -[CKJunkRecoveryTranscriptCell traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displayScale");
  v18 = v15 - round(v13 * 0.5 * v17) / v17;

  -[CKJunkRecoveryTranscriptCell recoverConversationTextView](self, "recoverConversationTextView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  MaxY = CGRectGetMaxY(v38);

  -[CKJunkRecoveryTranscriptCell deleteConversationButton](self, "deleteConversationButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v18, MaxY, v13, v34);

  -[CKJunkRecoveryTranscriptCell recoverJunkButton](self, "recoverJunkButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sizeThatFits:", v7, 1.79769313e308);
  v24 = v23;
  v26 = v25;

  v39.origin.x = v10;
  v39.origin.y = y;
  v39.size.width = v7;
  v39.size.height = height;
  v27 = CGRectGetMidX(v39);
  -[CKJunkRecoveryTranscriptCell traitCollection](self, "traitCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "displayScale");
  v30 = v27 - round(v24 * 0.5 * v29) / v29;

  -[CKJunkRecoveryTranscriptCell deleteConversationButton](self, "deleteConversationButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  v32 = CGRectGetMaxY(v40) + 10.0;

  -[CKJunkRecoveryTranscriptCell recoverJunkButton](self, "recoverJunkButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v30, v32, v24, v26);

}

- (void)_layoutLabelInAlignmentContentRect:(CGRect)a3
{
  double width;
  double x;
  double v5;
  double v6;
  id v7;

  width = a3.size.width;
  x = a3.origin.x;
  -[CKJunkRecoveryTranscriptCell recoverConversationTextView](self, "recoverConversationTextView", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", width, 1.79769313e308);
  objc_msgSend(v7, "setFrame:", x, 8.0, v6, v5 + 10.0);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKJunkRecoveryTranscriptCell;
  -[CKTranscriptCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKJunkRecoveryTranscriptCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  void *v7;

  -[CKJunkRecoveryTranscriptCell delegate](self, "delegate", a3, a4, a5.location, a5.length, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recoverJunkPressedInTranscriptCell:", self);

  return 0;
}

- (void)recoverJunkButtonPressed:(id)a3
{
  id v4;

  -[CKJunkRecoveryTranscriptCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recoverJunkPressedInTranscriptCell:", self);

}

- (void)deleteConversationButtonPressed:(id)a3
{
  id v4;

  -[CKJunkRecoveryTranscriptCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteConversationPressedInTranscriptCell:", self);

}

- (UITextView)recoverConversationTextView
{
  UITextView *recoverConversationTextView;
  UITextView *v4;
  UITextView *v5;

  recoverConversationTextView = self->_recoverConversationTextView;
  if (!recoverConversationTextView)
  {
    +[CKJunkRecoveryTranscriptCell generateRecoverConversationTextView](CKJunkRecoveryTranscriptCell, "generateRecoverConversationTextView");
    v4 = (UITextView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_recoverConversationTextView;
    self->_recoverConversationTextView = v4;

    -[CKJunkRecoveryTranscriptCell _configureRecoverConversationTextView:](self, "_configureRecoverConversationTextView:", self->_recoverConversationTextView);
    recoverConversationTextView = self->_recoverConversationTextView;
  }
  return recoverConversationTextView;
}

- (void)_configureRecoverConversationTextView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "_setInteractiveTextSelectionDisabled:", 1);
  objc_msgSend(v6, "setScrollEnabled:", 0);
  objc_msgSend(v6, "setEditable:", 0);
  objc_msgSend(v6, "setSelectable:", 1);
  objc_msgSend(v6, "setUserInteractionEnabled:", 1);
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "textDragInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  objc_msgSend(v6, "setClipsToBounds:", 0);
  objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", 1);

}

- (void)updateRecoverConversationTextViewContentForDate:(id)a3
{
  void *v4;
  id v5;

  +[CKJunkRecoveryTranscriptCell _attributedRecoverConversationStringWithDeletionDate:](CKJunkRecoveryTranscriptCell, "_attributedRecoverConversationStringWithDeletionDate:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKJunkRecoveryTranscriptCell recoverConversationTextView](self, "recoverConversationTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", v5);

}

- (UIButton)deleteConversationButton
{
  UIButton *deleteConversationButton;
  UIButton *v4;
  UIButton *v5;

  deleteConversationButton = self->_deleteConversationButton;
  if (!deleteConversationButton)
  {
    +[CKJunkRecoveryTranscriptCell generateDeleteConversationButton](CKJunkRecoveryTranscriptCell, "generateDeleteConversationButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_deleteConversationButton;
    self->_deleteConversationButton = v4;

    -[UIButton addTarget:action:forEvents:](self->_deleteConversationButton, "addTarget:action:forEvents:", self, sel_deleteConversationButtonPressed_, 64);
    deleteConversationButton = self->_deleteConversationButton;
  }
  return deleteConversationButton;
}

- (UIButton)recoverJunkButton
{
  UIButton *recoverJunkButton;
  UIButton *v4;
  UIButton *v5;

  recoverJunkButton = self->_recoverJunkButton;
  if (!recoverJunkButton)
  {
    +[CKJunkRecoveryTranscriptCell generateRecoverJunkButton](CKJunkRecoveryTranscriptCell, "generateRecoverJunkButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_recoverJunkButton;
    self->_recoverJunkButton = v4;

    -[UIButton addTarget:action:forEvents:](self->_recoverJunkButton, "addTarget:action:forEvents:", self, sel_recoverJunkButtonPressed_, 64);
    recoverJunkButton = self->_recoverJunkButton;
  }
  return recoverJunkButton;
}

- (CKJunkRecoveryTranscriptCellDelegate)delegate
{
  return (CKJunkRecoveryTranscriptCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setRecoverConversationTextView:(id)a3
{
  objc_storeStrong((id *)&self->_recoverConversationTextView, a3);
}

- (void)setDeleteConversationButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteConversationButton, a3);
}

- (void)setRecoverJunkButton:(id)a3
{
  objc_storeStrong((id *)&self->_recoverJunkButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoverJunkButton, 0);
  objc_storeStrong((id *)&self->_deleteConversationButton, 0);
  objc_storeStrong((id *)&self->_recoverConversationTextView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
