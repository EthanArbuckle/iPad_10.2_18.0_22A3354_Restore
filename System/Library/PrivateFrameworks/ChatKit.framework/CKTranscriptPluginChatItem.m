@implementation CKTranscriptPluginChatItem

- (unint64_t)layoutType
{
  if (-[CKChatItem itemIsReply](self, "itemIsReply"))
    return 12;
  else
    return 1;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v20;

  height = a7.height;
  width = a7.width;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  if (-[CKTranscriptPluginChatItem isAppearing](self, "isAppearing"))
  {
    if (a4 >= 1 && (objc_msgSend(v14, "objectAtIndex:", a4 - 1), (v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v17 = (void *)v16;
      +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v16, 0.0, 0.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CKTranscriptPluginChatItem;
    -[CKChatItem layoutItemSpacingWithEnvironment:datasourceItemIndex:allDatasourceItems:supplementryItems:sizeOverride:](&v20, sel_layoutItemSpacingWithEnvironment_datasourceItemIndex_allDatasourceItems_supplementryItems_sizeOverride_, v13, a4, v14, v15, width, height);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)compositionWithContext:(id)a3
{
  void *v3;
  void *v4;

  -[CKTranscriptPluginChatItem pluginDisplayContainerForContext:](self, "pluginDisplayContainerForContext:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKComposition compositionWithPluginDisplayContainer:subject:](CKComposition, "compositionWithPluginDisplayContainer:subject:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CKTranscriptPluginChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  id v6;
  CKTranscriptPluginChatItem *v7;
  CKTranscriptPluginChatItem *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKTranscriptPluginChatItem;
  v7 = -[CKMessagePartChatItem initWithIMChatItem:maxWidth:](&v11, sel_initWithIMChatItem_maxWidth_, v6, a4);
  v8 = v7;
  if (v7)
  {
    -[CKTranscriptPluginChatItem setImTranscriptPluginChatItem:](v7, "setImTranscriptPluginChatItem:", v6);
    objc_msgSend(v6, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_isHandwriting = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D375C0]);

  }
  return v8;
}

- (id)extensibleViewForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  if (v4)
  {
    -[CKTranscriptPluginChatItem balloonControllerForContext:](self, "balloonControllerForContext:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pluginContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Context identifier is nil, unable to get plugin view", v9, 2u);
      }

    }
    v6 = 0;
  }

  return v6;
}

- (id)extensibleViewControllerForContext:(id)a3
{
  void *v3;
  void *v4;

  -[CKTranscriptPluginChatItem balloonControllerForContext:](self, "balloonControllerForContext:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "pluginContentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)contentViewControllerForContext:(id)a3
{
  void *v3;
  void *v4;

  -[CKTranscriptPluginChatItem balloonControllerForContext:](self, "balloonControllerForContext:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "contentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)balloonControllerForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptPluginChatItem imTranscriptPluginChatItem](self, "imTranscriptPluginChatItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "balloonControllerForIMChatItem:contextIdentifier:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CKTranscriptPluginChatItem conversationID](self, "conversationID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKTranscriptPluginChatItem recipients](self, "recipients");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKTranscriptPluginChatItem _configureBalloonController:conversationID:recipients:isBusiness:](self, "_configureBalloonController:conversationID:recipients:isBusiness:", v7, v8, v9, -[CKTranscriptPluginChatItem isBusiness](self, "isBusiness"));

      v10 = v7;
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Failed to get balloon plugin controller from balloon plugin manager", v14, 2u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Context identifier is nil, unable to get plugin controller!", buf, 2u);
      }

    }
    v7 = 0;
  }

  return v7;
}

- (void)configureWithConversationID:(id)a3 recipients:(id)a4 isBusiness:(BOOL)a5 context:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[CKTranscriptPluginChatItem _cacheConversationID:recipients:isBusiness:](self, "_cacheConversationID:recipients:isBusiness:", v12, v11, v6);
  -[CKTranscriptPluginChatItem balloonControllerForContext:](self, "balloonControllerForContext:", v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[CKTranscriptPluginChatItem _configureBalloonController:conversationID:recipients:isBusiness:](self, "_configureBalloonController:conversationID:recipients:isBusiness:", v13, v12, v11, v6);
}

- (void)_configureBalloonController:(id)a3 conversationID:(id)a4 recipients:(id)a5 isBusiness:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  int v13;
  id v14;

  v6 = a6;
  v14 = a3;
  v10 = a4;
  v11 = a5;
  if (v6)
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isAllowlistedRichLinkSender");

    if (v13)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v14, "setAllowsOpeningSensitiveURLs:", 1);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "configureWithConversationID:recipients:", v10, v11);

}

- (void)_cacheConversationID:(id)a3 recipients:(id)a4 isBusiness:(BOOL)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a5;
  v8 = a4;
  -[CKTranscriptPluginChatItem setConversationID:](self, "setConversationID:", a3);
  -[CKTranscriptPluginChatItem setRecipients:](self, "setRecipients:", v8);

  -[CKTranscriptPluginChatItem setIsBusiness:](self, "setIsBusiness:", v5);
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pluginPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pluginBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)canPerformQuickAction
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  unsigned int v10;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "swyBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "showPinningStatusTextForBundleID:", v7);

      v10 = v9 & ~-[CKChatItem isHighlighted](self, "isHighlighted");
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (BOOL)canCopy
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsString:", *MEMORY[0x1E0D375D0]);

  if ((v5 & 1) != 0)
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptPluginChatItem;
  return -[CKMessagePartChatItem canCopy](&v7, sel_canCopy);
}

- (BOOL)canForward
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsString:", *MEMORY[0x1E0D375D0]);

  if ((v5 & 1) != 0)
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptPluginChatItem;
  return -[CKMessagePartChatItem canForward](&v7, sel_canForward);
}

- (BOOL)canInlineReply
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "canReply"))
  {
    if (-[CKMessagePartChatItem isReply](self, "isReply"))
    {
      v4 = 1;
    }
    else
    {
      -[CKChatItem IMChatItem](self, "IMChatItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "type");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "containsString:", *MEMORY[0x1E0D375F8]);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)menuTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pluginPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (objc_msgSend(v4, "pluginBundleID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D375F8]),
        v5,
        v6))
  {
    objc_msgSend(v4, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_lp_userVisibleString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)message
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pluginDisplayContainerForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  const __CFString *v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  double v28;
  CGFloat v29;
  void *v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  __int128 v40;
  char v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint8_t buf[4];
  const __CFString *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;
  CGSize v52;
  CGSize v53;
  CGSize v54;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pluginPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "cleansedCopy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKTranscriptPluginChatItem snapshotGUIDForPluginPayload:](self, "snapshotGUIDForPluginPayload:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9
        && (+[CKSnapshotUtilities snapshotForGUID:](CKSnapshotUtilities, "snapshotForGUID:", v9),
            (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

      }
      else
      {
        -[CKTranscriptPluginChatItem extensibleViewForContext:](self, "extensibleViewForContext:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (!v12
          || (objc_msgSend(v12, "bounds"), v15 == *MEMORY[0x1E0C9D820]) && v14 == *(double *)(MEMORY[0x1E0C9D820] + 8))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              if (v13)
                v17 = CFSTR("NO");
              else
                v17 = CFSTR("YES");
              objc_msgSend(v13, "bounds");
              v52.width = v18;
              v52.height = v19;
              NSStringFromCGSize(v52);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v48 = v17;
              v49 = 2112;
              v50 = v20;
              _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Error with pluginView, was nil %@, size %@", buf, 0x16u);

            }
          }

          v21 = 0;
          goto LABEL_28;
        }
        objc_msgSend(v13, "bounds");
        v24 = v23;
        v26 = v25;
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "scale");
        v29 = v28;
        v53.width = v24;
        v53.height = v26;
        UIGraphicsBeginImageContextWithOptions(v53, 0, v29);

        objc_msgSend(v13, "bounds");
        objc_msgSend(v13, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
        UIGraphicsGetImageFromCurrentImageContext();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();

        if (!v10)
        {
          v21 = 0;
          goto LABEL_29;
        }
      }
      -[CKChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "userInterfaceStyle");
      -[CKChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v40) = 0x1000000;
      v42 = CKColorZero;
      *((_QWORD *)&v40 + 1) = -1;
      v41 = -2;
      v43 = *(_OWORD *)&qword_18E7CB368;
      v44 = v31;
      v45 = CKBackgroundLevelForTraitCollection(v32);
      v46 = 0;
      CKResizableBalloonMask(&v40);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "size");
      UIGraphicsBeginImageContextWithOptions(v54, 0, 0.0);
      objc_msgSend(v10, "size");
      v34 = v33;
      objc_msgSend(v10, "size");
      objc_msgSend(v9, "drawInRect:", 0.0, 0.0, v34, v35);
      objc_msgSend(v10, "size");
      v37 = v36;
      objc_msgSend(v10, "size");
      objc_msgSend(v10, "drawInRect:blendMode:alpha:", 18, 0.0, 0.0, v37, v38, 1.0);
      UIGraphicsGetImageFromCurrentImageContext();
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      UIGraphicsEndImageContext();
LABEL_28:

LABEL_29:
      +[CKPluginDisplayContainer pluginDisplayContainerWithPluginPayload:composeImage:](CKPluginDisplayContainer, "pluginDisplayContainerWithPluginPayload:composeImage:", v8, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_30;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Unable to get plugin payload from data source!", buf, 2u);
      }
LABEL_24:

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Context identifier is nil, unable to get plugin container", buf, 2u);
    }
    goto LABEL_24;
  }
  v22 = 0;
LABEL_30:

  return v22;
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[CKChatItem transcriptIdentifier](self, "transcriptIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptPluginChatItem pluginDisplayContainerForContext:](self, "pluginDisplayContainerForContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "rtfDocumentItemsWithFormatString:selectedTextRange:", v7, location, length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)sender
{
  void *v2;
  void *v3;

  -[CKTranscriptPluginChatItem message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contact
{
  void *v2;
  CKEntity *v3;
  void *v4;

  -[CKTranscriptPluginChatItem sender](self, "sender");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[CKEntity initWithIMHandle:]([CKEntity alloc], "initWithIMHandle:", v2);
  -[CKEntity cnContact](v3, "cnContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cellIdentifier
{
  return NSStringFromClass(-[CKTranscriptPluginChatItem balloonViewClass](self, "balloonViewClass"));
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (Class)balloonViewClass
{
  if (!-[CKTranscriptPluginChatItem isHandwriting](self, "isHandwriting"))
    -[CKTranscriptPluginChatItem shouldSnapshot](self, "shouldSnapshot");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  void *v10;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKTranscriptPluginChatItem imTranscriptPluginChatItem](self, "imTranscriptPluginChatItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsDynamicSize");

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    -[CKTranscriptPluginChatItem snapshotGUIDForPluginPayload:](self, "snapshotGUIDForPluginPayload:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[CKSnapshotUtilities snapshotExistsForGUID:](CKSnapshotUtilities, "snapshotExistsForGUID:", v10);

  }
  return v9;
}

- (UIEdgeInsets)textAlignmentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)snapshotGUIDForPluginPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  char v13;
  uint64_t v14;

  v3 = a3;
  objc_msgSend(v3, "messageGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pluginBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "balloonPluginForBundleID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v9 = objc_msgSend(v8, "isEnabled");
    if (CKShouldShowSURF())
    {
      if ((v9 & 1) != 0)
      {
LABEL_10:
        v11 = CFSTR("-enabled");
        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(v8, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "hasSuffix:", *MEMORY[0x1E0D37620]))
      {
        objc_msgSend(v8, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "hasSuffix:", *MEMORY[0x1E0D37628]);

        v11 = CFSTR("-disabled");
        if ((v13 & 1) != 0 || ((v9 ^ 1) & 1) != 0)
          goto LABEL_11;
        goto LABEL_10;
      }

    }
    v11 = CFSTR("-disabled");
LABEL_11:
    objc_msgSend(v4, "stringByAppendingString:", v11);
    v14 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v14;
  }

  return v4;
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

- (BOOL)wantsPendingMessageStyle
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (v4)
  {
    -[CKMessagePartChatItem messageItem](self, "messageItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPendingSatelliteSend");

    if ((v6 & 1) != 0)
      return 1;
  }
  -[CKMessagePartChatItem messageItem](self, "messageItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "scheduleType");

  if (v9 != 2)
    return 0;
  -[CKMessagePartChatItem messageItem](self, "messageItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "scheduleState");

  if (v11 <= 5)
    return (0x36u >> v11) & 1;
  else
    return 0;
}

- (UIEdgeInsets)pluginInsets
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

  if (-[CKTranscriptPluginChatItem wantsPendingMessageStyle](self, "wantsPendingMessageStyle"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "linkPreviewSendLaterInsets");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;

  }
  else
  {
    v4 = *MEMORY[0x1E0CEB4B0];
    v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v8 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v10 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
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

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  __int128 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  const __CFString *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  double *v25;
  int v26;
  NSObject *v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  void *v36;
  _BOOL4 v37;
  CKChatBotActionButton *v38;
  void *v39;
  CKChatBotActionButton *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  uint64_t v46;
  double v47;
  int v48;
  NSObject *v49;
  double v50;
  double v51;
  NSObject *v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[5];
  id v57;
  _BYTE *v58;
  uint64_t v59;
  __int128 v60;
  uint8_t v61[4];
  void *v62;
  _BYTE buf[24];
  void *v64;
  __int128 v65;
  uint64_t v66;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v66 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E0CEB4B0];
    *(_OWORD *)&a4->bottom = v7;
  }
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  v10 = objc_msgSend(v9, "chatInScrutinyMode");
  if (v10)
  {
    objc_msgSend(v9, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "guid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "substringWithRange:", 3, objc_msgSend(v12, "length") - 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D35780], "storeGUIDInAttemptingListInScrutinyMode:", v13);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v13;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Plugin: Storing attempt guid %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject isInternalInstall](v15, "isInternalInstall")
    || !IMGetCachedDomainBoolForKey())
  {
    goto LABEL_25;
  }

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = objc_msgSend(v9, "isCorrupt");
        v18 = CFSTR("NO");
        if (v17)
          v18 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v18;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "DEBUG: Plugin:  message %@ isCorrupt %@", buf, 0x16u);
      }

    }
    v19 = objc_msgSend(v9, "isCorrupt");
    v20 = IMOSLoggingEnabled();
    if (!v19)
    {
      if (v20)
      {
        OSLogHandleForIMFoundationCategory();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v52, OS_LOG_TYPE_INFO, "Plugin: INTERNAL POISON PILL PLUGIN TEST DETECTED - Crashing", buf, 2u);
        }

      }
      abort();
    }
    if (v20)
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Plugin: We are corrupt already, not crashing", buf, 2u);
      }
LABEL_25:

    }
  }
  else
  {
    v9 = 0;
  }
  -[CKTranscriptPluginChatItem imTranscriptPluginChatItem](self, "imTranscriptPluginChatItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v22, "supportsDynamicSize") & 1) != 0)
    v23 = 0;
  else
    v23 = objc_msgSend(v22, "parentChatHasAllUnknownRecipients") ^ 1;
  +[CKChatItemSizeCache sharedInstance](CKChatItemSizeCache, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (double *)MEMORY[0x1E0C9D820];
  v53 = *MEMORY[0x1E0C9D820];
  v60 = *MEMORY[0x1E0C9D820];
  if ((v23 & objc_msgSend(v24, "cachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, &v60, 0, width, height)) == 1)
  {
    if (v13)
      v26 = v10;
    else
      v26 = 0;
    if (v26 == 1)
    {
      objc_msgSend(MEMORY[0x1E0D35780], "removeGUIDInAttemptingListInScrutinyMode:", v13);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v13;
          _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "Plugin: Marked %@ as safe", buf, 0xCu);
        }

      }
    }
    v29 = *((double *)&v60 + 1);
    v28 = *(double *)&v60;
  }
  else
  {
    -[CKChatItem maxWidth](self, "maxWidth");
    v31 = v30;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3010000000;
    v64 = &unk_18E8EEE6F;
    v65 = v53;
    if (v22)
    {
      v32 = (void *)objc_opt_class();
      v33 = MEMORY[0x1E0C809B0];
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __67__CKTranscriptPluginChatItem_loadSizeThatFits_textAlignmentInsets___block_invoke;
      v56[3] = &unk_1E275AF00;
      v56[4] = self;
      v59 = v31;
      v57 = v22;
      v58 = buf;
      v54[0] = v33;
      v54[1] = 3221225472;
      v54[2] = __67__CKTranscriptPluginChatItem_loadSizeThatFits_textAlignmentInsets___block_invoke_2;
      v54[3] = &unk_1E275AF28;
      v55 = v57;
      CKEnforceAveragePerformanceOfBlock(20, v32, v56, v54, 2.0);

    }
    -[CKMessagePartChatItem suggestedActionsList](self, "suggestedActionsList");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = *(double *)(*(_QWORD *)&buf[8] + 40) == v25[1] && *(double *)(*(_QWORD *)&buf[8] + 32) == *v25;

      if (!v35)
      {
        -[CKTranscriptPluginChatItem cachedChatBotActionButton](self, "cachedChatBotActionButton");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36 == 0;

        if (v37)
        {
          v38 = [CKChatBotActionButton alloc];
          -[CKMessagePartChatItem suggestedActionsList](self, "suggestedActionsList");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[CKChatBotActionButton initWithActions:delegate:backgroundStyle:showTitle:](v38, "initWithActions:delegate:backgroundStyle:showTitle:", v39, self, 1, 1);
          -[CKTranscriptPluginChatItem setCachedChatBotActionButton:](self, "setCachedChatBotActionButton:", v40);

        }
        -[CKTranscriptPluginChatItem cachedChatBotActionButton](self, "cachedChatBotActionButton");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setBounds:", 0.0, 0.0, width, height);

        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKTranscriptPluginChatItem cachedChatBotActionButton](self, "cachedChatBotActionButton");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "suggestedActionsMenuAdditionalHeightWithChatBotActionButton:", v43);
        v45 = v44;

        v46 = *(_QWORD *)&buf[8];
        v47 = v45 + *(double *)(*(_QWORD *)&buf[8] + 40);
        *(double *)(*(_QWORD *)&buf[8] + 32) = *(double *)(*(_QWORD *)&buf[8] + 32) + 0.0;
        *(double *)(v46 + 40) = v47;
      }
    }
    if (v23 && (*(double *)(*(_QWORD *)&buf[8] + 32) != *v25 || *(double *)(*(_QWORD *)&buf[8] + 40) != v25[1]))
      objc_msgSend(v24, "setCachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self);
    if (v13)
      v48 = v10;
    else
      v48 = 0;
    if (v48 == 1)
    {
      objc_msgSend(MEMORY[0x1E0D35780], "removeGUIDInAttemptingListInScrutinyMode:", v13);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v61 = 138412290;
          v62 = v13;
          _os_log_impl(&dword_18DFCD000, v49, OS_LOG_TYPE_INFO, "Plugin: Marked %@ as safe", v61, 0xCu);
        }

      }
    }
    v28 = *(double *)(*(_QWORD *)&buf[8] + 32);
    v29 = *(double *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }

  v50 = v28;
  v51 = v29;
  result.height = v51;
  result.width = v50;
  return result;
}

uint64_t __67__CKTranscriptPluginChatItem_loadSizeThatFits_textAlignmentInsets___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t result;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionBalloonMaximumHeight");
  v4 = v3;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "shouldAllowExtraTallHeightForBundleID:", v6);

  if ((_DWORD)v5)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extraTallExtensionBalloonMaximumHeight");
    v4 = v8;

  }
  v9 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "pluginInsets");
  objc_msgSend(*(id *)(a1 + 40), "sizeThatFits:", v9 - (v10 + v11), v4 - (v12 + v13));
  v15 = v14;
  v17 = v16;
  result = objc_msgSend(*(id *)(a1 + 32), "pluginInsets");
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(double *)(v23 + 32) = v15 + v19 + v20;
  *(double *)(v23 + 40) = v17 + v21 + v22;
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v25 = *(double *)(v24 + 32);
  if (v25 >= *(double *)(a1 + 56))
    v25 = *(double *)(a1 + 56);
  *(double *)(v24 + 32) = v25;
  return result;
}

void __67__CKTranscriptPluginChatItem_loadSizeThatFits_textAlignmentInsets___block_invoke_2(float a1)
{
  uint64_t v2;

  v2 = objc_opt_class();
  NSLog(CFSTR("Data source %@ took %f milliseconds on average to size %ld cells.  That's way too long!  Please file a radar."), v2, a1, 20);
}

- (BOOL)shouldAllowExtraTallHeightForBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0D374C8];
  v3 = a3;
  IMBalloonExtensionIDWithSuffix();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  IMBalloonExtensionIDWithSuffix();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  IMBalloonExtensionIDWithSuffix();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v7, "containsObject:", v3);
  return (char)v4;
}

- (id)loadTranscriptDrawerText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timestampDateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessagePartChatItem time](self, "time");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "drawerTranscriptTextAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[CKMessagePartChatItem time](self, "time");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        -[CKChatItem IMChatItem](self, "IMChatItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "guid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v11;
        v17 = 2112;
        v18 = v13;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "loadTranscriptDrawerText: nil timestamp for time: %@, IMChatItem guid: %@", (uint8_t *)&v15, 0x16u);

      }
    }
    v9 = 0;
  }

  return v9;
}

- (UIEdgeInsets)contentInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  if (-[CKTranscriptPluginChatItem isHandwriting](self, "isHandwriting"))
  {
    v3 = *MEMORY[0x1E0CEB4B0];
    v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKTranscriptPluginChatItem;
    -[CKBalloonChatItem contentInsets](&v7, sel_contentInsets);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)dragItemProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "pluginPayload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "pluginBundleID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D375F8]);

      objc_msgSend(v6, "pluginBundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D37588]);

      objc_msgSend(v6, "pluginBundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D375C0]);

      if (((v8 | v7) & 1) != 0 || v11)
      {
        -[CKChatItem transcriptIdentifier](self, "transcriptIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKTranscriptPluginChatItem pluginDisplayContainerForContext:](self, "pluginDisplayContainerForContext:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            -[CKChatItem transcriptIdentifier](self, "transcriptIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = 138412546;
            v22 = (const char *)v4;
            v23 = 2112;
            v24 = v15;
            _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Got nil displayContainer for datasource %@ identifier %@", (uint8_t *)&v21, 0x16u);

          }
        }
        objc_msgSend(v13, "pasteboardItemProvider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v21 = 136315650;
            v22 = "-[CKTranscriptPluginChatItem dragItemProvider]";
            v23 = 2112;
            v24 = v16;
            v25 = 2112;
            v26 = v4;
            _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "%s generated itemProvider %@ for %@", (uint8_t *)&v21, 0x20u);
          }

        }
        if (v16)
          goto LABEL_29;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v21 = 138412290;
          v22 = (const char *)v4;
          _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Got nil item provider from %@", (uint8_t *)&v21, 0xCu);
        }
LABEL_27:

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Plugin chat item datasource payload is nil", (uint8_t *)&v21, 2u);
      }
      goto LABEL_27;
    }
    v16 = 0;
LABEL_29:

    goto LABEL_30;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Plugin Chat item data source is nil!", (uint8_t *)&v21, 2u);
    }

  }
  v16 = 0;
LABEL_30:

  return v16;
}

- (BOOL)wantsBalloonGradient
{
  return 0;
}

- (BOOL)isPlayed
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlayed");

  return v3;
}

- (BOOL)isSaved
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSaved");

  return v3;
}

- (void)relinquishBalloonControllerForContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonPluginForBundleID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageGUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "existingBalloonControllerWithMessageGUID:contextIdentifier:", v10, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if ((objc_msgSend(v7, "supportsControllerReuse") & 1) != 0)
    {
      objc_msgSend(v4, "pluginChatItem:didRelinquishReusableController:contextIdentifier:", v5, v11, v12);
    }
    else if (CKIsRunningInMessagesTranscriptExtension())
    {
      objc_msgSend(v4, "pluginChatItem:didRelenquishNonResuableController:contextIdentifier:", v5, v11, v12);
    }
  }

}

- (void)releaseBalloonControllerIfNeededForContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonPluginForBundleID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageGUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "existingBalloonControllerWithMessageGUID:contextIdentifier:", v10, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && (objc_msgSend(v7, "supportsControllerReuse") & 1) == 0)
    objc_msgSend(v4, "pluginChatItem:didRelenquishNonResuableController:contextIdentifier:", v5, v11, v12);

}

- (void)performHostAppResumeWithContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0D35770];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "balloonPluginForBundleID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "existingBalloonControllerWithMessageGUID:contextIdentifier:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "performHostAppResume");

}

- (BOOL)wantsTranscriptGroupMonograms
{
  return self->_wantsTranscriptGroupMonograms;
}

- (BOOL)wantsOutline
{
  return self->_wantsOutline;
}

- (BOOL)isAppearing
{
  return self->_isAppearing;
}

- (void)setIsAppearing:(BOOL)a3
{
  self->_isAppearing = a3;
}

- (IMTranscriptPluginChatItem)imTranscriptPluginChatItem
{
  return self->_imTranscriptPluginChatItem;
}

- (void)setImTranscriptPluginChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_imTranscriptPluginChatItem, a3);
}

- (BOOL)isHandwriting
{
  return self->_isHandwriting;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
  objc_storeStrong((id *)&self->_conversationID, a3);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (BOOL)isBusiness
{
  return self->_isBusiness;
}

- (void)setIsBusiness:(BOOL)a3
{
  self->_isBusiness = a3;
}

- (CKChatBotActionButton)cachedChatBotActionButton
{
  return self->_cachedChatBotActionButton;
}

- (void)setCachedChatBotActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_cachedChatBotActionButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedChatBotActionButton, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_imTranscriptPluginChatItem, 0);
}

@end
