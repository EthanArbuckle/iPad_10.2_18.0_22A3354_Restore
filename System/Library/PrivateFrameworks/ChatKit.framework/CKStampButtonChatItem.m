@implementation CKStampButtonChatItem

- (CKStampButtonChatItem)init
{
  CKStampButtonChatItem *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKStampButtonChatItem;
  result = -[CKStampButtonChatItem init](&v3, sel_init);
  if (result)
    result->_hasSelectableText = 1;
  return result;
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

- (Class)cellClass
{
  return (Class)objc_opt_class();
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
    -[CKStampButtonChatItem contentInsets](self, "contentInsets");
    v18 = width - (v16 + v17);
    v21 = height - (v19 + v20);
    -[CKChatItem transcriptText](self, "transcriptText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "boundingRectWithSize:options:context:", 1, 0, v18, v21);
    v24 = v23;
    v26 = v25;
    if (CKMainScreenScale_once_68 != -1)
      dispatch_once(&CKMainScreenScale_once_68, &__block_literal_global_172);
    v27 = *(double *)&CKMainScreenScale_sMainScreenScale_68;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_68 == 0.0)
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

- (BOOL)hasSelectableText
{
  return self->_hasSelectableText;
}

- (unint64_t)layoutType
{
  return 3;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  id v11;
  id v12;
  id v13;
  int64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  _BOOL4 v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  void *v30;
  double v31;
  _BYTE v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a4 - 1;
  if (a4 < 1
    || (objc_msgSend(v12, "objectAtIndex:", v14), v15 = (void *)objc_claimAutoreleasedReturnValue(), (v16 = v15) == 0))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "topTranscriptSpace");
    v20 = v22;

    v16 = 0;
    goto LABEL_9;
  }
  v17 = objc_msgSend(v15, "layoutType");
  if (v17 <= 0x18)
  {
    if (((1 << v17) & 0x1864DBE) != 0)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (v17 == 9)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "balloonBalloonTranscriptSpace:", objc_msgSend(v16, "contiguousType"));
      goto LABEL_7;
    }
    if (v17 == 12)
    {
      v25 = +[CKChatItemLayoutUtilities prevMessageIsReplyForIndex:allDatasourceItems:](CKChatItemLayoutUtilities, "prevMessageIsReplyForIndex:allDatasourceItems:", a4, v12);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v26;
      if (v25)
      {
        objc_msgSend(v26, "extraLargeTranscriptSpace");
        goto LABEL_7;
      }
LABEL_6:
      objc_msgSend(v18, "mediumTranscriptSpace");
LABEL_7:
      v20 = v19;

      goto LABEL_9;
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = (id)objc_opt_class();
      *(_DWORD *)v32 = 138412546;
      *(_QWORD *)&v32[4] = v28;
      *(_WORD *)&v32[12] = 2112;
      *(_QWORD *)&v32[14] = objc_opt_class();
      v29 = *(id *)&v32[14];
      _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %@ shouldn't follow %@", v32, 0x16u);

    }
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", *(_OWORD *)v32, *(_QWORD *)&v32[16], v33);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "smallTranscriptSpace");
  v20 = v31;

LABEL_9:
  +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v16, v20, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

@end
