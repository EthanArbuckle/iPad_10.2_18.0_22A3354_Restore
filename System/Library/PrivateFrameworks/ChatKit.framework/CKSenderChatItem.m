@implementation CKSenderChatItem

- (unint64_t)layoutType
{
  return 6;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  id v11;
  id v12;
  int64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  _BOOL4 v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  double v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  double v36;
  void *v37;
  NSObject *v39;
  id v40;
  id v41;
  void *v42;
  double v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[32];
  __int128 v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4 - 1;
  if (a4 < 1)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", a4 - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a4 + 1 >= (unint64_t)objc_msgSend(v11, "count"))
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", a4 + 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = +[CKChatItemLayoutUtilities nextItemIsOriginatorWithRepliesForIndex:allDatasourceItems:](CKChatItemLayoutUtilities, "nextItemIsOriginatorWithRepliesForIndex:allDatasourceItems:", a4, v11);
  v17 = objc_msgSend(v14, "layoutType");
  if (v16)
  {
    v18 = v17 == 7;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
      objc_msgSend(v19, "mediumTranscriptSpace");
    else
      objc_msgSend(v19, "extraLargeTranscriptSpace");
    v22 = v21;

  }
  else
  {
    switch(v17)
    {
      case 1:
      case 2:
      case 3:
      case 7:
      case 8:
      case 10:
      case 11:
      case 13:
      case 14:
      case 17:
      case 23:
      case 24:
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 4:
      case 5:
        v23 = +[CKChatItemLayoutUtilities prevMessageIsReplyForIndex:allDatasourceItems:](CKChatItemLayoutUtilities, "prevMessageIsReplyForIndex:allDatasourceItems:", v13, v11);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          goto LABEL_41;
        goto LABEL_18;
      case 12:
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_41:
        objc_msgSend(v24, "extraLargeTranscriptSpace");
        goto LABEL_19;
      case 15:
        v25 = -[CKChatItem itemIsFromMe](self, "itemIsFromMe");
        v26 = objc_msgSend(v14, "itemIsFromMe");
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v27;
        if (v25 != v26)
          objc_msgSend(v27, "minTranscriptSpace");
        else
LABEL_18:
          objc_msgSend(v24, "mediumTranscriptSpace");
        goto LABEL_19;
      case 18:
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "smallTranscriptSpace");
LABEL_19:
        v22 = v28;

        break;
      default:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v40 = (id)objc_opt_class();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v40;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = objc_opt_class();
            v41 = *(id *)&buf[14];
            _os_log_impl(&dword_18DFCD000, v39, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %@ shouldn't follow %@", buf, 0x16u);

          }
        }
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "smallTranscriptSpace");
        v22 = v43;

        break;
    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEmojiTapbacksEnabled");

    if (v30)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v15, "visibleAssociatedMessageChatItems");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v46;
        while (2)
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v46 != v33)
              objc_enumerationMutation(v31);
            v35 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            v51 = 0;
            v50 = 0u;
            memset(buf, 0, sizeof(buf));
            if (v35)
            {
              objc_msgSend(v35, "geometryDescriptor");
              if (*(_QWORD *)buf == 10)
              {
                +[CKChatItemLayoutUtilities transcriptTapbackMinSpacingForSenderChatItem:withNextChatItem:previousItem:associatedChatItem:](CKChatItemLayoutUtilities, "transcriptTapbackMinSpacingForSenderChatItem:withNextChatItem:previousItem:associatedChatItem:", self, v15, v14, v35);
                if (v36 >= v22)
                  v22 = v36;
                goto LABEL_33;
              }
            }
          }
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
          if (v32)
            continue;
          break;
        }
      }
LABEL_33:

    }
  }
  +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v14, v22, 0.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
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
  objc_msgSend(v2, "senderTranscriptInsets");
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
  return 0;
}

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

- (id)cellIdentifier
{
  void *v2;
  void *v3;

  -[CKChatItem transcriptText](self, "transcriptText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)wantsDrawerLayout
{
  void *v2;
  int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKSenderChatItem;
  if (-[CKChatItem wantsDrawerLayout](&v5, sel_wantsDrawerLayout))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "timestampsPushBalloons") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)getAttributeTextForMessagesFromEmergencyUser:(id)a3 transcriptSharingMessageType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v5 = a3;
  if (a4)
  {
    if (_IMWillLog())
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAlwaysLog();

    }
    if (a4 == 2)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TS_EMERGENCY_USER_ATTRIBUTE_INFORMATION"), &stru_1E276D870, CFSTR("TranscriptSharing-SYDROB_FEATURES"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringWithFormat:", v8, v12);
      goto LABEL_9;
    }
    if (a4 == 1)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TS_EMERGENCY_USER_ATTRIBUTE_MESSAGE"), &stru_1E276D870, CFSTR("TranscriptSharing-SYDROB_FEATURES"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringWithFormat:", v8, v5);
LABEL_9:
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (id)loadTranscriptText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;

  -[CKChatItem notification](self, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKChatItem notification](self, "notification");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = 0;
LABEL_3:

    v6 = (void *)v8;
    goto LABEL_11;
  }
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v7 = v10;
  }
  else
  {
    CKFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Unknown"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "senderTranscriptTextAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isTranscriptSharingEnabled");

  if (v15 && objc_msgSend(v4, "transcriptSharingMessageType"))
  {
    objc_msgSend(v4, "displayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      CKFrameworkBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Unknown"), &stru_1E276D870, CFSTR("ChatKit"));
      v18 = (id)objc_claimAutoreleasedReturnValue();

      v7 = v21;
    }

    objc_msgSend(v4, "handle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isStewieEmergencyServices");

    if (v23)
    {
      v24 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("TS_EMERGENCY_SERVICE_ATTRIBUTE_TEXT"), &stru_1E276D870, CFSTR("TranscriptSharing-SYDROB_FEATURES"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringWithFormat:", v26);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stewieTranscriptEmergencyServiceAttributes");
    }
    else
    {
      -[CKSenderChatItem getAttributeTextForMessagesFromEmergencyUser:transcriptSharingMessageType:](self, "getAttributeTextForMessagesFromEmergencyUser:transcriptSharingMessageType:", v18, objc_msgSend(v4, "transcriptSharingMessageType"));
      v7 = (id)objc_claimAutoreleasedReturnValue();

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stewieTranscriptEmergencyUserAttributes");
    }
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
LABEL_11:

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v6);
  return v19;
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
  int v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
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
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isAccessibilityPreferredContentSizeCategory");

  if (v14)
  {
    -[objc_class createStampLabelView](-[CKSenderChatItem cellClass](self, "cellClass"), "createStampLabelView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatItem transcriptText](self, "transcriptText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAttributedText:", v16);

    objc_msgSend(v15, "sizeThatFits:", width, height);
    v18 = v17;
    v20 = v19;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "balloonTranscriptInsets");
    v23 = v22;
    v25 = v24;

    -[CKChatItem transcriptText](self, "transcriptText");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "boundingRectWithSize:options:context:", 3, 0, width, height);
    v28 = v27;

    v18 = v28 - (v23 + v25);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transcriptBoldTextHeight");
    v20 = v29;
  }

  v30 = v18;
  v31 = v20;
  result.height = v31;
  result.width = v30;
  return result;
}

@end
