@implementation CKBlackholeChatItem

- (char)transcriptOrientation
{
  return 1;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (id)loadTranscriptText
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;

  v2 = objc_alloc(MEMORY[0x1E0CB3778]);
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HAWKING_WARNING_NON_CELLULAR"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithString:attributes:", v4, 0);

  objc_msgSend(v5, "replaceCharactersInRange:withString:", 0, 0, CFSTR(" "));
  v6 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hawkingWarningIcon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setImage:", v8);
  objc_msgSend(v6, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transcriptBoldFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pointSize");
  v12 = v11;

  objc_msgSend(v8, "size");
  v14 = v13;
  objc_msgSend(v8, "size");
  v16 = v12 * (v14 / v15);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "transcriptBoldFont");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "capHeight");
  v20 = (v19 - v12) * 0.5;

  objc_msgSend(v6, "setBounds:", 0.0, v20, v16, v12);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertAttributedString:atIndex:", v21, 0);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "transcriptEmphasizedFontAttributes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAttributes:range:", v23, 0, objc_msgSend(v5, "length"));
  return v5;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (a4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transcriptBoldTextAlignmentInsets");
    a4->top = v9;
    a4->left = v10;
    a4->bottom = v11;
    a4->right = v12;

  }
  v13 = (void *)objc_opt_class();
  -[CKChatItem transcriptText](self, "transcriptText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeThatFits:text:", v14, width, height);
  v16 = v15;
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  objc_msgSend(a4, "boundingRectWithSize:options:context:", 1, 0, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  if (CKMainScreenScale_once_70 != -1)
    dispatch_once(&CKMainScreenScale_once_70, &__block_literal_global_174);
  v8 = 1.0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_70 != 0.0)
    v8 = *(double *)&CKMainScreenScale_sMainScreenScale_70;
  v9 = ceil(v5 * v8) / v8;
  v10 = ceil(v7 * v8) / v8 + 16.0;
  result.height = v10;
  result.width = v9;
  return result;
}

@end
