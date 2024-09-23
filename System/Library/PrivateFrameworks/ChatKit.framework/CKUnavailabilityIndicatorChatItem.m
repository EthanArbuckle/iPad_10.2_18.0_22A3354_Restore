@implementation CKUnavailabilityIndicatorChatItem

- (BOOL)displayNotifyAnywayButton
{
  void *v2;
  char v3;

  -[CKUnavailabilityIndicatorChatItem imUnavailabilityIndicatorChatItem](self, "imUnavailabilityIndicatorChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayNotifyAnywayButton");

  return v3;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (id)loadTranscriptText
{
  -[CKUnavailabilityIndicatorChatItem _loadUnavailableTitleLabelTextVariants](self, "_loadUnavailableTitleLabelTextVariants");
  return self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
}

- (void)unloadTranscriptText
{
  NSAttributedString *unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
  NSAttributedString *unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKUnavailabilityIndicatorChatItem;
  -[CKChatItem unloadTranscriptText](&v5, sel_unloadTranscriptText);
  unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
  self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton = 0;

  unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
  self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton = 0;

}

- (NSAttributedString)unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton
{
  NSAttributedString *unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;

  unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
  if (!unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton)
  {
    -[CKUnavailabilityIndicatorChatItem _loadUnavailableTitleLabelTextVariants](self, "_loadUnavailableTitleLabelTextVariants");
    unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
  }
  return unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
}

- (NSAttributedString)unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton
{
  NSAttributedString *unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;

  unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
  if (!unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton)
  {
    -[CKUnavailabilityIndicatorChatItem _loadUnavailableTitleLabelTextVariants](self, "_loadUnavailableTitleLabelTextVariants");
    unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
  }
  return unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
}

- (void)_loadUnavailableTitleLabelTextVariants
{
  NSAttributedString *v3;
  NSAttributedString *unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
  NSAttributedString *v5;
  NSAttributedString *unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;

  -[CKUnavailabilityIndicatorChatItem _unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:](self, "_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:", 1);
  v3 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
  self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton = v3;

  -[CKUnavailabilityIndicatorChatItem _unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:](self, "_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:", 0);
  v5 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton = self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
  self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton = v5;

}

- (id)_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
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
  void *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;

  v3 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "transcriptAvailabilityDeemphasizedFontAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unavailabilityIndicatorDeemphasizedIcon");
  }
  else
  {
    objc_msgSend(v5, "transcriptAvailabilityFontAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unavailabilityIndicatorIcon");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKUnavailabilityIndicatorChatItem imUnavailabilityIndicatorChatItem](self, "imUnavailabilityIndicatorChatItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_displayNameWithAbbreviation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("UNAVAILABILITY_INDICATOR_TITLE_FORMAT"), &stru_1E276D870, CFSTR("ChatKit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceLayoutDirection");

  if (v18 == 1)
    v19 = CFSTR("\u200F");
  else
    v19 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v20, 0);
  objc_msgSend(v21, "replaceCharactersInRange:withString:", 0, 0, CFSTR(" "));
  v22 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(v22, "setImage:", v9);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "insertAttributedString:atIndex:", v23, 0);

  objc_msgSend(v21, "addAttributes:range:", v7, 0, objc_msgSend(v21, "length"));
  return v21;
}

- (UIEdgeInsets)contentInsets
{
  void *v2;
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
  UIEdgeInsets result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stampTranscriptInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (char)transcriptOrientation
{
  return 1;
}

- (BOOL)displayDuringSend
{
  return 1;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a4)
  {
    objc_msgSend(v8, "transcriptBoldTextAlignmentInsets");
    a4->top = v10;
    a4->left = v11;
    a4->bottom = v12;
    a4->right = v13;
  }
  +[CKTranscriptUnavailabilityIndicatorCell unavailableTitleLabel](CKTranscriptUnavailabilityIndicatorCell, "unavailableTitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatItem transcriptText](self, "transcriptText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAttributedText:", v15);

  objc_msgSend(v14, "sizeThatFits:", width, height);
  v17 = v16;

  v18 = 0.0;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)setUnavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:(id)a3
{
  objc_storeStrong((id *)&self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton, a3);
}

- (void)setUnavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton:(id)a3
{
  objc_storeStrong((id *)&self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton, 0);
  objc_storeStrong((id *)&self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton, 0);
}

- (unint64_t)layoutType
{
  return 10;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  double v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  int v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (a4 < 1)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v12, "objectAtIndex:", a4 - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "smallTranscriptSpace");
  v17 = v16;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "largeTranscriptSpace");
  v20 = v19;

  if (v14)
  {
    switch(objc_msgSend(v14, "layoutType"))
    {
      case 1:
      case 4:
        break;
      case 2:
      case 3:
      case 5:
      case 7:
      case 8:
      case 9:
      case 12:
      case 13:
      case 14:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = 138412290;
            v44 = v23;
            _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Unavailability indicator unexpectedly following a %@", (uint8_t *)&v43, 0xCu);

          }
        }
        break;
      case 10:
        IMLogHandleForCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[CKUnavailabilityIndicatorChatItem(Layout) layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:].cold.2(v26, v27, v28, v29, v30, v31, v32, v33);
        goto LABEL_19;
      case 11:
        IMLogHandleForCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[CKUnavailabilityIndicatorChatItem(Layout) layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:].cold.3(v26, v34, v35, v36, v37, v38, v39, v40);
        goto LABEL_19;
      default:
        IMLogHandleForCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[CKUnavailabilityIndicatorChatItem(Layout) layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:].cold.1((uint64_t)v14, v26);
LABEL_19:

        v20 = v17;
        break;
    }
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topTranscriptSpace");
    v20 = v25;

  }
  +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v14, v20, 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

@end
