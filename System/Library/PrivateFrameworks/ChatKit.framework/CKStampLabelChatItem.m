@implementation CKStampLabelChatItem

- (Class)cellClass
{
  void *v2;
  id v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isAccessibilityPreferredContentSizeCategory");
  v3 = (id)objc_opt_class();

  return (Class)v3;
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
  double v20;
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
  if (objc_msgSend(v9, "isAccessibilityPreferredContentSizeCategory"))
  {
    -[objc_class createStampLabelView](-[CKStampLabelChatItem cellClass](self, "cellClass"), "createStampLabelView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatItem transcriptText](self, "transcriptText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAttributedText:", v15);

    objc_msgSend(v14, "sizeThatFits:", width, height);
    v17 = v16;

  }
  else
  {
    objc_msgSend(v9, "transcriptBoldTextHeight");
    v17 = v18;
  }

  v19 = 0.0;
  v20 = v17;
  result.height = v20;
  result.width = v19;
  return result;
}

@end
