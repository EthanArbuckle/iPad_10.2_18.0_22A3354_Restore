@implementation CKTranscriptPluginBreadcrumbChatItem

- (char)transcriptOrientation
{
  char v3;
  void *v4;

  if (-[CKTranscriptPluginBreadcrumbChatItem _wantsCenteredOrientation](self, "_wantsCenteredOrientation"))
    return 1;
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFromMe"))
    v3 = 2;
  else
    v3 = 0;

  return v3;
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
  objc_msgSend(v3, "breadcrumbTranscriptTextAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (objc_msgSend(v5, "dataSource"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "statusString"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  objc_super v25;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKTranscriptPluginBreadcrumbChatItem iconSizePlusHorizontalPadding](self, "iconSizePlusHorizontalPadding");
  v9 = v8;
  v25.receiver = self;
  v25.super_class = (Class)CKTranscriptPluginBreadcrumbChatItem;
  -[CKMultilineStampLabelChatItem loadSizeThatFits:textAlignmentInsets:](&v25, sel_loadSizeThatFits_textAlignmentInsets_, a4, width - v8, height);
  v11 = v10;
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  UIRoundToScale();
  v16 = v15;

  if (a4)
  {
    if (v16 < 0.0)
      v16 = 0.0;
    v17 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v18 = a4->bottom - v16;
    if (v17)
      v19 = 0.0;
    else
      v19 = v9;
    v20 = v19 + a4->left;
    if (v17)
      v21 = v9;
    else
      v21 = 0.0;
    v22 = a4->right + v21;
    a4->top = a4->top - v16;
    a4->left = v20;
    a4->bottom = v18;
    a4->right = v22;
  }
  v23 = v9 + v11;
  v24 = v13;
  result.height = v24;
  result.width = v23;
  return result;
}

- (BOOL)canBeSelectedInEditMode
{
  return IMGetDomainBoolForKey();
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (UIImage)iconImage
{
  UIImage *iconImage;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImage *v9;
  UIImage *v10;
  void *v11;
  void *v12;
  UIImage *v13;
  UIImage *v14;
  _QWORD v16[5];

  if (!-[CKTranscriptPluginBreadcrumbChatItem _wantsIconImage](self, "_wantsIconImage"))
    return (UIImage *)0;
  iconImage = self->_iconImage;
  if (!iconImage)
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "balloonPluginForBundleID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "__ck_breadcrumbImage");
    v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v10 = self->_iconImage;
    self->_iconImage = v9;

    if (!self->_iconImage)
    {
      objc_msgSend(v5, "pluginPayload");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "payloadDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __49__CKTranscriptPluginBreadcrumbChatItem_iconImage__block_invoke;
      v16[3] = &unk_1E27504B8;
      v16[4] = self;
      objc_msgSend(MEMORY[0x1E0D35760], "__ck_appIconFromPayloadDictionary:withCompletionBlock:", v12, v16);
      v13 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v14 = self->_iconImage;
      self->_iconImage = v13;

    }
    iconImage = self->_iconImage;
  }
  return iconImage;
}

void __49__CKTranscriptPluginBreadcrumbChatItem_iconImage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__CKTranscriptPluginBreadcrumbChatItem_iconImage__block_invoke_2;
    v5[3] = &unk_1E274A108;
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

void __49__CKTranscriptPluginBreadcrumbChatItem_iconImage__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 40));
}

- (CGSize)iconSizePlusHorizontalPadding
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  if (-[CKTranscriptPluginBreadcrumbChatItem _wantsIconImage](self, "_wantsIconImage"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "transcriptCustomStatusImageDefaultSize");
    v5 = v4;
    v7 = v6;

    -[CKTranscriptPluginBreadcrumbChatItem iconImage](self, "iconImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "size");
      v5 = v10;
      v7 = v11;
    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transcriptCustomStatusImagePadding");
    v14 = v5 + v13;

  }
  else
  {
    v14 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v15 = v14;
  v16 = v7;
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)_wantsCenteredOrientation
{
  return -[CKTranscriptPluginBreadcrumbChatItem _breadcrumbOptionFlags](self, "_breadcrumbOptionFlags") & 1;
}

- (BOOL)_wantsIconImage
{
  return (-[CKTranscriptPluginBreadcrumbChatItem _breadcrumbOptionFlags](self, "_breadcrumbOptionFlags") & 2) == 0;
}

- (unint64_t)_breadcrumbOptionFlags
{
  void *v2;
  unint64_t v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "optionFlags");

  return v3;
}

- (CKTranscriptPluginChatItem)previousPluginChatItem
{
  return self->_previousPluginChatItem;
}

- (void)setPreviousPluginChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_previousPluginChatItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousPluginChatItem, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
}

- (unint64_t)layoutType
{
  if (-[CKChatItem itemIsReply](self, "itemIsReply"))
    return 12;
  else
    return 8;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  id v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  double v30;
  NSObject *v31;
  id v32;
  id v33;
  double v34;
  void *v35;
  id v37;
  id v38;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v10 = a5;
  v38 = a6;
  if (a4 < 1)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v10, "objectAtIndex:", a4 - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "smallTranscriptSpace");
  v15 = v14;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mediumTranscriptSpace");
  v18 = v17;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "largeTranscriptSpace");
  v21 = v20;

  switch(objc_msgSend(v11, "layoutType"))
  {
    case 1:
    case 12:
    case 13:
    case 14:
      if ((isKindOfClass & 1) != 0)
      {
        -[CKChatItem IMChatItem](self, "IMChatItem");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dataSource");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "messageGUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "IMChatItem");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "dataSource");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "messageGUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v24, "isEqualToString:", v27);

        if (v28)
        {
          v21 = v15;
          if (objc_msgSend(v11, "hasTail"))
          {
            +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "balloonMaskTailSizeForTailShape:", 1);
            v21 = v15 + v30;
            goto LABEL_22;
          }
        }
      }
      break;
    case 2:
    case 3:
    case 7:
    case 10:
    case 11:
    case 23:
    case 24:
      break;
    case 4:
    case 5:
      if (-[CKTranscriptPluginBreadcrumbChatItem transcriptOrientation](self, "transcriptOrientation") != 1)
        v21 = v15;
      break;
    case 6:
      v21 = v18;
      break;
    case 9:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "balloonBalloonTranscriptSpace:", objc_msgSend(v11, "contiguousType"));
      goto LABEL_21;
    case 17:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "mediumTranscriptSpace");
      goto LABEL_21;
    case 18:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "smallTranscriptSpace");
LABEL_21:
      v21 = v34;
LABEL_22:

      break;
    default:
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = (id)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v41 = v32;
          v42 = 2112;
          v43 = (id)objc_opt_class();
          v33 = v43;
          _os_log_impl(&dword_18DFCD000, v31, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %@ shouldn't follow %@", buf, 0x16u);

        }
      }
      v21 = v15;
      break;
  }
  +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v11, v21, 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

@end
