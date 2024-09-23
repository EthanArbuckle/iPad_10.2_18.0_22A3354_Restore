@implementation CKMultilineStampLabelChatItem

- (Class)cellClass
{
  return (Class)objc_opt_class();
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
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
  +[CKChatItemSizeCache sharedInstance](CKChatItemSizeCache, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *MEMORY[0x1E0C9D820];
  if (objc_msgSend(v13, "cachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, &v30, 0, width, height))
  {
    v15 = *((double *)&v30 + 1);
    v14 = *(double *)&v30;
  }
  else
  {
    -[CKStampChatItem contentInsets](self, "contentInsets");
    v18 = width - (v16 + v17);
    v21 = height - (v19 + v20);
    -[CKChatItem transcriptText](self, "transcriptText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "boundingRectWithSize:options:context:", 1, 0, v18, v21);
    v24 = v23;
    v26 = v25;
    if (CKMainScreenScale_once_91 != -1)
      dispatch_once(&CKMainScreenScale_once_91, &__block_literal_global_222);
    v27 = *(double *)&CKMainScreenScale_sMainScreenScale_91;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_91 == 0.0)
      v27 = 1.0;
    v14 = ceil(v24 * v27) / v27;
    v15 = ceil(v26 * v27) / v27;

    objc_msgSend(v13, "setCachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, v14, v15, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24), width, height);
  }

  v28 = v14;
  v29 = v15;
  result.height = v29;
  result.width = v28;
  return result;
}

@end
