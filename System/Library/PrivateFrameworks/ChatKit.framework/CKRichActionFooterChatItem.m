@implementation CKRichActionFooterChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (char)transcriptOrientation
{
  void *v2;
  int v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromMe");

  if (v3)
    return 2;
  else
    return 0;
}

- (UIEdgeInsets)contentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -12.0;
  v3 = 0.0;
  v4 = 12.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)transcriptText
{
  int v3;
  void *v4;
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;

  v3 = -[CKRichActionFooterChatItem transcriptOrientation](self, "transcriptOrientation");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "rightStatusTranscriptTextAttributes");
  else
    objc_msgSend(v4, "leftStatusTranscriptTextAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "brand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
  {
    objc_msgSend(v12, "brand");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v12, "displayID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v16 = objc_alloc(MEMORY[0x1E0CB3778]);
  v17 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SELECTED_ACTIONS_FOOTER_TEXT"), &stru_1E276D870, CFSTR("ChatKit"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", v19, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceLayoutDirection");

  if (v22 == 1)
    v23 = CFSTR("\u200F");
  else
    v23 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_msgSend(v16, "initWithString:attributes:", v24, v6);
  return v25;
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
  -[objc_class createStampLabelView](-[CKRichActionFooterChatItem cellClass](self, "cellClass"), "createStampLabelView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRichActionFooterChatItem transcriptText](self, "transcriptText");
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

@end
