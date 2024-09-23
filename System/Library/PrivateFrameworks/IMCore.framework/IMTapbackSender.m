@implementation IMTapbackSender

- (IMTapbackSender)initWithTapback:(id)a3 chat:(id)a4 messageGUID:(id)a5 messagePartRange:(_NSRange)a6 messageSummaryInfo:(id)a7 threadIdentifier:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  id v17;
  IMTapbackSender *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *messageSummaryInfo;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSString *backwardCompatibilityString;
  uint64_t v27;
  NSAttributedString *attributedContentString;
  IMTapbackSender *v29;
  NSObject *v30;
  NSObject *v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  _QWORD aBlock[4];
  id v38;
  objc_super v39;

  length = a6.length;
  location = a6.location;
  v15 = a3;
  v16 = a4;
  v36 = a5;
  v17 = a7;
  v35 = a8;
  v39.receiver = self;
  v39.super_class = (Class)IMTapbackSender;
  v18 = -[IMTapbackSender init](&v39, sel_init);
  if (!v18)
    goto LABEL_10;
  if (!v15)
  {
    IMLogHandleForCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_1A21974C0();
    goto LABEL_19;
  }
  if (!v16)
  {
    IMLogHandleForCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_1A21974EC();
    goto LABEL_19;
  }
  if (!v36)
  {
    IMLogHandleForCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_1A2197518();
    goto LABEL_19;
  }
  if (!v17)
  {
    IMLogHandleForCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_1A2197544();
LABEL_19:

    goto LABEL_20;
  }
  v34 = v16;
  objc_msgSend(v17, "__im_associatedMessageContentType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_storeStrong((id *)&v18->_chat, a4);
    objc_storeStrong((id *)&v18->_tapback, a3);
    objc_storeStrong((id *)&v18->_messageGUID, a5);
    v18->_messagePartRange.location = location;
    v18->_messagePartRange.length = length;
    objc_storeStrong((id *)&v18->_threadIdentifier, a8);
    objc_msgSend(v15, "adjustMessageSummaryInfoForSending:", v17);
    v20 = objc_claimAutoreleasedReturnValue();
    messageSummaryInfo = v18->_messageSummaryInfo;
    v18->_messageSummaryInfo = (NSDictionary *)v20;

    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A20B3A40;
    aBlock[3] = &unk_1E471F948;
    v23 = v22;
    v38 = v23;
    v24 = _Block_copy(aBlock);
    objc_msgSend(v15, "backwardCompatibilityStringWithMessageSummaryInfo:isAdaptiveImageGlyphProvider:", v18->_messageSummaryInfo, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    backwardCompatibilityString = v18->_backwardCompatibilityString;
    v18->_backwardCompatibilityString = (NSString *)v25;

    if (v18->_backwardCompatibilityString)
    {
      v27 = IMCreateSuperFormatStringFromPlainTextString();
      attributedContentString = v18->_attributedContentString;
      v18->_attributedContentString = (NSAttributedString *)v27;

      if (v18->_attributedContentString)
      {

        v16 = v34;
LABEL_10:
        v29 = v18;
        goto LABEL_21;
      }
      IMLogHandleForCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      v16 = v34;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        sub_1A21975C8();
    }
    else
    {
      IMLogHandleForCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        sub_1A219759C();
      v16 = v34;
    }

LABEL_20:
    v29 = 0;
    goto LABEL_21;
  }
  IMLogHandleForCategory();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    sub_1A2197570();

  v29 = 0;
  v16 = v34;
LABEL_21:

  return v29;
}

- (IMTapbackSender)initWithTapback:(id)a3 chat:(id)a4 messagePartChatItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  IMTapbackSender *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v8, "originalMessagePartRange");
  v13 = v12;
  objc_msgSend(v8, "guid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageSummaryInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "threadIdentifierForTapback");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[IMTapbackSender initWithTapback:chat:messageGUID:messagePartRange:messageSummaryInfo:threadIdentifier:](self, "initWithTapback:chat:messageGUID:messagePartRange:messageSummaryInfo:threadIdentifier:", v10, v9, v14, v11, v13, v15, v16);
  return v17;
}

- (void)send
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[IMTapbackSender tapback](self, "tapback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTapbackSender chat](self, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTapbackSender messageGUID](self, "messageGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IMTapbackSender messagePartRange](self, "messagePartRange");
  v8 = v7;
  -[IMTapbackSender messageSummaryInfo](self, "messageSummaryInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTapbackSender threadIdentifier](self, "threadIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageForChat:messageGUID:messagePartRange:messageSummaryInfo:threadIdentifier:", v4, v5, v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMTapbackSender chat](self, "chat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v11, "fileTransferGUIDs", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v18);
        +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "assignTransfer:toMessage:account:", v19, v11, v13);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  -[IMTapbackSender chat](self, "chat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sendMessage:", v11);

  -[NSDictionary __im_associatedMessageContentType](self->_messageSummaryInfo, "__im_associatedMessageContentType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "integerValue");

  objc_msgSend(v13, "serviceName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTapbackSender _trackSentTapbackWithContentType:serviceName:](self, "_trackSentTapbackWithContentType:serviceName:", v23, v24);

}

- (void)_trackSentTapbackWithContentType:(unsigned __int8)a3 serviceName:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D39958];
  v6 = a4;
  objc_msgSend(v5, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D38918];
  v13[0] = *MEMORY[0x1E0D38908];
  objc_msgSend((id)objc_opt_class(), "_metricIdentifierForTapback:", self->_tapback);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v13[1] = *MEMORY[0x1E0D38910];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMTapback isRemoved](self->_tapback, "isRemoved"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  v13[2] = *MEMORY[0x1E0D38900];
  IMMetricsValueForAssociatedMessageContentType();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = *MEMORY[0x1E0D38920];
  v14[2] = v11;
  v14[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "trackEvent:withDictionary:", v8, v12);
}

+ (id)_metricIdentifierForTapback:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "visibleTapbackCounterpart");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "associatedMessageType");

    if ((unint64_t)(v5 - 2000) < 6)
    {
      v6 = off_1E4720AF0[v5 - 2000];
      goto LABEL_21;
    }
LABEL_11:
    v6 = CFSTR("unknown");
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = CFSTR("emoji");
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  objc_msgSend(v3, "transferGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transferForGUID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (objc_msgSend(v9, "isSticker"))
    {
      objc_msgSend(v9, "stickerUserInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D39310]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      IMBalloonBundleIDFromExtensionID();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D374D0]) & 1) != 0)
      {
        v6 = CFSTR("sticker-user-generated");
      }
      else if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D37560]) & 1) != 0)
      {
        v6 = CFSTR("sticker-animoji");
      }
      else if (objc_msgSend(v9, "isAdaptiveImageGlyph"))
      {
        v6 = CFSTR("sticker-adaptive-glyph");
      }
      else
      {
        v6 = CFSTR("sticker-other");
      }

    }
    else
    {
      v6 = CFSTR("file-transfer-other");
    }
  }
  else
  {
    v6 = CFSTR("file-transfer-missing");
  }

LABEL_21:
  return (id)v6;
}

- (IMTapback)tapback
{
  return self->_tapback;
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (_NSRange)messagePartRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_messagePartRange.length;
  location = self->_messagePartRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSDictionary)messageSummaryInfo
{
  return self->_messageSummaryInfo;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (NSAttributedString)messageContent
{
  return self->_messageContent;
}

- (NSString)backwardCompatibilityString
{
  return self->_backwardCompatibilityString;
}

- (NSAttributedString)attributedContentString
{
  return self->_attributedContentString;
}

- (IMChat)chat
{
  return self->_chat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_attributedContentString, 0);
  objc_storeStrong((id *)&self->_backwardCompatibilityString, 0);
  objc_storeStrong((id *)&self->_messageContent, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_messageSummaryInfo, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);
  objc_storeStrong((id *)&self->_tapback, 0);
}

@end
