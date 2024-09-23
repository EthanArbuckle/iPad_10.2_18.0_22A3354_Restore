@implementation CKReplySenderChatItem

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
  objc_msgSend(v2, "replySenderTranscriptInsets");
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

- (id)loadTranscriptText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "senderTranscriptTextAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Unknown"), &stru_1E276D870, CFSTR("ChatKit"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v9, v4);

  return v11;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  double v25;
  void *v26;
  NSObject *v28;
  id v29;
  id v30;
  void *v31;
  double v32;
  int v33;
  BOOL v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[32];
  __int128 v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v11 = a5;
  v38 = a6;
  if (a4 < 1)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", a4 - 1, v36, v38);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = a4 + 1;
  if (v13 >= objc_msgSend(v11, "count", v36))
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  switch(objc_msgSend(v12, "layoutType"))
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 12:
    case 14:
    case 17:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 13:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "largeTranscriptSpace");
      goto LABEL_10;
    case 15:
      v33 = -[CKChatItem itemIsFromMe](self, "itemIsFromMe");
      if (v33 == objc_msgSend(v12, "itemIsFromMe"))
      {
        v34 = objc_msgSend(v12, "replyCount") == 1;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v35;
        if (v34)
          objc_msgSend(v35, "xsTranscriptSpace");
        else
LABEL_9:
          objc_msgSend(v15, "mediumTranscriptSpace");
      }
      else
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "minTranscriptSpace");
      }
      goto LABEL_10;
    case 18:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "smallTranscriptSpace");
LABEL_10:
      v17 = v16;

      break;
    default:
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = (id)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v29;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = objc_opt_class();
          v30 = *(id *)&buf[14];
          _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %@ shouldn't follow %@", buf, 0x16u);

        }
      }
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "smallTranscriptSpace");
      v17 = v32;

      break;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEmojiTapbacksEnabled");

  if (v19)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v14, "visibleAssociatedMessageChatItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v45 = 0;
          v44 = 0u;
          memset(buf, 0, sizeof(buf));
          if (v24)
          {
            objc_msgSend(v24, "geometryDescriptor");
            if (*(_QWORD *)buf == 10)
            {
              +[CKChatItemLayoutUtilities transcriptTapbackMinSpacingForSenderChatItem:withNextChatItem:previousItem:associatedChatItem:](CKChatItemLayoutUtilities, "transcriptTapbackMinSpacingForSenderChatItem:withNextChatItem:previousItem:associatedChatItem:", self, v14, v12, v24);
              if (v25 >= v17)
                v17 = v25;
              goto LABEL_24;
            }
          }
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
        if (v21)
          continue;
        break;
      }
    }
LABEL_24:

  }
  +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v12, v17, 0.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (double)_calculateAdditionalOffsetForTapbackWithNextItem:(id)a3 previousItem:(id)a4 associatedChatItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int isKindOfClass;
  unsigned int v21;
  int v22;
  void *v23;
  int v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v11, "messageAcknowledgmentTranscriptBalloonRelativePosition");
  v13 = v12;
  v15 = v14;

  -[CKChatItem size](self, "size");
  v17 = v16;
  objc_msgSend(v10, "size");
  v19 = v18 - v13;
  objc_opt_class();
  LOBYTE(v11) = objc_opt_isKindOfClass();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  LODWORD(v10) = objc_msgSend(v9, "itemIsFromMe");
  v21 = isKindOfClass & (v10 ^ 1);
  if ((v11 & 1) == 0)
    v21 = 0;
  if (v17 < v19)
    v22 = v21;
  else
    v22 = 0;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEmojiTapbacksEnabled");

  v25 = (v17 < v19) & isKindOfClass;
  if (!v24)
    v25 = v22;
  v26 = 0.0;
  if (v25 == 1)
  {
    objc_msgSend(v8, "size");
    v28 = v15 + v27;
    -[CKChatItem size](self, "size");
    v30 = v28 - v29;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "smallTranscriptSpace");
    v26 = v30 + v32;

  }
  return v26;
}

@end
