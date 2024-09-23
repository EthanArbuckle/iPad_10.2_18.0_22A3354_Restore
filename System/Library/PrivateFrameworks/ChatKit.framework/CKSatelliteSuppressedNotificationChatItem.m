@implementation CKSatelliteSuppressedNotificationChatItem

- (unint64_t)layoutType
{
  return 24;
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
  unint64_t v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  NSObject *v29;
  int v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
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

  if (!v14)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topTranscriptSpace");
    v20 = v26;

    goto LABEL_12;
  }
  v21 = objc_msgSend(v14, "layoutType");
  if (v21 > 0x17)
    goto LABEL_18;
  if (((1 << v21) & 0x7FAC) == 0)
  {
    if (((1 << v21) & 0x12) != 0)
      goto LABEL_12;
    if (v21 == 23)
    {
      IMLogHandleForCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[CKSatelliteSuppressedNotificationChatItem(Layout) layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:].cold.2(v29);
LABEL_20:

      v20 = v17;
      goto LABEL_12;
    }
LABEL_18:
    IMLogHandleForCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[CKSatelliteSuppressedNotificationChatItem(Layout) layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:].cold.1((uint64_t)v14, v29);
    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412290;
      v31 = v24;
      _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Satellite suppressed notification unexpectedly following a %@", (uint8_t *)&v30, 0xCu);

    }
  }
LABEL_12:
  +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v14, v20, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)unloadTranscriptText
{
  NSAttributedString *satelliteNoNotificationTitleLabelAttributedText;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSatelliteSuppressedNotificationChatItem;
  -[CKChatItem unloadTranscriptText](&v4, sel_unloadTranscriptText);
  satelliteNoNotificationTitleLabelAttributedText = self->_satelliteNoNotificationTitleLabelAttributedText;
  self->_satelliteNoNotificationTitleLabelAttributedText = 0;

}

- (id)loadTranscriptText
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  NSAttributedString *v20;
  id v21;
  void *v22;
  NSAttributedString *satelliteNoNotificationTitleLabelAttributedText;
  NSAttributedString *v24;
  void *v25;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (v4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unavailabilityIndicatorDeemphasizedIcon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transcriptSatelliteFontAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKSatelliteSuppressedNotificationChatItem imSatelliteSuppressedNotificationChatItem](self, "imSatelliteSuppressedNotificationChatItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_displayNameWithAbbreviation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("MESSAGE_STATUS_CHECK_VIA_SATELLITE"), &stru_1E276D870, CFSTR("ChatKit-CarrierPigeon"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceLayoutDirection");

    if (v17 == 1)
      v18 = CFSTR("\u200F");
    else
      v18 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v19, 0);
    -[NSAttributedString replaceCharactersInRange:withString:](v20, "replaceCharactersInRange:withString:", 0, 0, CFSTR(" "));
    v21 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    objc_msgSend(v21, "setImage:", v6);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSAttributedString insertAttributedString:atIndex:](v20, "insertAttributedString:atIndex:", v22, 0);

    -[NSAttributedString addAttributes:range:](v20, "addAttributes:range:", v8, 0, -[NSAttributedString length](v20, "length"));
    satelliteNoNotificationTitleLabelAttributedText = self->_satelliteNoNotificationTitleLabelAttributedText;
    self->_satelliteNoNotificationTitleLabelAttributedText = v20;
    v24 = v20;

    v25 = (void *)-[NSAttributedString copy](v24, "copy");
  }
  else
  {
    v25 = 0;
  }
  return v25;
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
  return 0;
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
  +[CKTranscriptSatelliteSuppressedNotificationCell satelliteNoNotificationTitleLabel](CKTranscriptSatelliteSuppressedNotificationCell, "satelliteNoNotificationTitleLabel");
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

- (NSAttributedString)satelliteNoNotificationTitleLabelAttributedText
{
  return self->_satelliteNoNotificationTitleLabelAttributedText;
}

- (void)setSatelliteNoNotificationTitleLabelAttributedText:(id)a3
{
  objc_storeStrong((id *)&self->_satelliteNoNotificationTitleLabelAttributedText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satelliteNoNotificationTitleLabelAttributedText, 0);
}

@end
