@implementation CKSatelliteSMSFallbackStatusChatItem

- (unint64_t)layoutType
{
  return 25;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  unint64_t v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  NSObject *v28;
  int v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (a4 < 1)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v11, "objectAtIndex:", a4 - 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "smallTranscriptSpace");
  v16 = v15;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "largeTranscriptSpace");
  v19 = v18;

  if (!v13)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topTranscriptSpace");
    v19 = v25;

    goto LABEL_12;
  }
  v20 = objc_msgSend(v13, "layoutType");
  if (v20 <= 0x18)
  {
    if (((1 << v20) & 0x1807FAC) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138412290;
          v30 = v23;
          _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Satellite SMS fallback indicator  unexpectedly following a %@", (uint8_t *)&v29, 0xCu);

        }
      }
      goto LABEL_12;
    }
    if (((1 << v20) & 0x12) != 0)
      goto LABEL_12;
  }
  IMLogHandleForCategory();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    -[CKSatelliteSMSFallbackStatusChatItem(Layout) layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:].cold.1((uint64_t)v13, v28);

  v19 = v16;
LABEL_12:
  +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v13, v19, 0.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)unloadTranscriptText
{
  NSAttributedString *smsFallbackStatusTitleLabelAttributedText;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSatelliteSMSFallbackStatusChatItem;
  -[CKChatItem unloadTranscriptText](&v4, sel_unloadTranscriptText);
  smsFallbackStatusTitleLabelAttributedText = self->_smsFallbackStatusTitleLabelAttributedText;
  self->_smsFallbackStatusTitleLabelAttributedText = 0;

}

- (id)loadTranscriptText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSAttributedString *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  NSAttributedString *smsFallbackStatusTitleLabelAttributedText;
  NSAttributedString *v27;
  void *v28;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptEmphasizedFontAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transcriptRegularFontAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PLACEHOLDER_TEXT_VIEW_SATELLITE_MESSAGE_SMS"), &stru_1E276D870, CFSTR("ChatKit-CarrierPigeon"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v8, v4);
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_displayNameWithAbbreviation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v10, "canSMSReply");
  v14 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13)
    v17 = CFSTR("SMS_FALLBACK_STATUS_MESSAGE");
  else
    v17 = CFSTR("SMS_FALLBACK_STATUS_MESSAGE_NO_REPLY");
  objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E276D870, CFSTR("ChatKit-CarrierPigeon"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringWithFormat:", v18, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

  if (v21 == 1)
    v22 = CFSTR("\u200F");
  else
    v22 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v23, v6);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
  -[NSAttributedString appendLocalizedFormat:](v9, "appendLocalizedFormat:", v25);
  -[NSAttributedString appendLocalizedFormat:](v9, "appendLocalizedFormat:", v24);
  smsFallbackStatusTitleLabelAttributedText = self->_smsFallbackStatusTitleLabelAttributedText;
  self->_smsFallbackStatusTitleLabelAttributedText = v9;
  v27 = v9;

  v28 = (void *)-[NSAttributedString copy](v27, "copy");
  return v28;
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
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSatelliteSMSFallbackStatusChatItem loadTranscriptText](self, "loadTranscriptText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "boundingRectWithSize:options:context:", 1, 0, width, height);
  v11 = v10;

  objc_msgSend(v8, "smallTranscriptSpace");
  v13 = v12;
  objc_msgSend(v8, "transcriptBoldTextAlignmentInsets");
  if (a4)
  {
    a4->top = v14;
    a4->left = v15;
    a4->bottom = v16;
    a4->right = v17;
  }
  v18 = v11 - v14 + v13 + v11 - v16;

  v19 = 0.0;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (NSAttributedString)smsFallbackStatusTitleLabelAttributedText
{
  return self->_smsFallbackStatusTitleLabelAttributedText;
}

- (void)setSmsFallbackStatusTitleLabelAttributedText:(id)a3
{
  objc_storeStrong((id *)&self->_smsFallbackStatusTitleLabelAttributedText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smsFallbackStatusTitleLabelAttributedText, 0);
}

@end
