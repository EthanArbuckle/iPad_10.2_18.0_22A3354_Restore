@implementation CKSMSSpamChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
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
  -[CKSMSSpamChatItem loadTranscriptText](self, "loadTranscriptText");
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

- (id)loadTranscriptText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptEmphasizedFontAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKSMSSpamChatItem getTranscriptTextForExtensionName:](self, "getTranscriptTextForExtensionName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v4);

  return v8;
}

- (id)getTranscriptTextForExtensionName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FILTERED_BY_APP_NAME"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

    if (v10 == 1)
      v11 = CFSTR("\u200F");
    else
      v11 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v8);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = &stru_1E276D870;
  }

  return v12;
}

@end
