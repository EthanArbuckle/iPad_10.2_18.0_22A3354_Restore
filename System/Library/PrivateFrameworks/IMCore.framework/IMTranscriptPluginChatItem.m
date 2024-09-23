@implementation IMTranscriptPluginChatItem

- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v18;
  IMReplyContextTranscriptPluginChatItem *v19;

  v6 = a4;
  v7 = a3;
  v19 = [IMReplyContextTranscriptPluginChatItem alloc];
  -[IMChatItem _item](self, "_item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isFromMe");
  -[IMTranscriptPluginChatItem initialPayload](self, "initialPayload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IMMessagePartChatItem index](self, "index");
  v13 = -[IMMessagePartChatItem messagePartRange](self, "messagePartRange");
  v15 = v14;
  LOBYTE(v18) = -[IMTranscriptPluginChatItem parentChatHasKnownParticipants](self, "parentChatHasKnownParticipants");
  v16 = -[IMReplyContextTranscriptPluginChatItem _initWithItem:parentItem:replyMessageGUID:replyIsFromMe:initialPayload:index:messagePartRange:parentChatHasKnownParticipants:chatContext:](v19, "_initWithItem:parentItem:replyMessageGUID:replyIsFromMe:initialPayload:index:messagePartRange:parentChatHasKnownParticipants:chatContext:", v8, v7, v9, v10, v11, v12, v13, v15, v18, v6);

  return v16;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)IMTranscriptPluginChatItem;
  -[IMMessagePartChatItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTranscriptPluginChatItem type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[{%@] type:%@ payload"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTranscriptPluginChatItem initialPayload](self, "initialPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IMMessagePartChatItem index](self, "index");
  v8 = -[IMMessagePartChatItem messagePartRange](self, "messagePartRange");
  v10 = (void *)objc_msgSend(v4, "_initWithItem:initialPayload:index:messagePartRange:parentChatHasKnownParticipants:", v5, v6, v7, v8, v9, -[IMTranscriptPluginChatItem parentChatHasKnownParticipants](self, "parentChatHasKnownParticipants"));

  return v10;
}

- (BOOL)supportsSuggestedActionsMenu
{
  return 1;
}

- (id)_initWithItem:(id)a3 initialPayload:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 parentChatHasKnownParticipants:(BOOL)a7
{
  void *v7;
  uint64_t v8;
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  void *v16;
  int v17;
  uint64_t v18;
  _BYTE *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  char v27;

  v8 = a7;
  length = a6.length;
  location = a6.location;
  v14 = a3;
  v15 = a4;
  objc_msgSend(v15, "pluginBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D375F8]);
  v27 = v8;
  if (v17)
  {
    objc_msgSend(v14, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subject");
    v8 = objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend((id)v8, "isBusiness") ^ 1;
  }
  else
  {
    v18 = 0;
  }
  v19 = -[IMMessagePartChatItem _initWithItem:index:messagePartRange:syndicationBehavior:](self, "_initWithItem:index:messagePartRange:syndicationBehavior:", v14, a5, location, length, v18);
  if (v17)
  {

  }
  if (v19)
  {
    objc_msgSend(v14, "guid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)sub_1A2132A84();

    objc_msgSend(v19, "_setGUID:", v21);
    objc_msgSend(v19, "setInitialPayload:", v15);
    objc_msgSend(v15, "pluginBundleID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBundleIdentifier:", v22);

    v19[170] = v27;
    objc_msgSend(v19, "_item");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isBreadcrumb");

    if (v24)
      v25 = (id)objc_msgSend(v19, "dataSource");

  }
  return v19;
}

- (BOOL)isDataSourceInitialized
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTranscriptPluginChatItem initialPayload](self, "initialPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginSessionGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTranscriptPluginChatItem bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "existingDataSourceForMessageGUID:bundleID:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 != 0;
}

- (void)setLastChatItemOfPluginType:(BOOL)a3
{
  self->_hasSetIsLastChatItemOfPluginType = 1;
  self->_isLastChatItemOfPluginType = a3;
}

- (NSString)pluginSessionGUID
{
  void *v2;
  void *v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pluginSessionGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)playbackType
{
  void *v3;
  char v4;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  -[IMTranscriptPluginChatItem type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D37588]);

  if ((v4 & 1) != 0)
    return 1;
  -[IMTranscriptPluginChatItem type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D375C0]) & 1) != 0)
  {
    -[IMMessageChatItem message](self, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "expressiveSendStyleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D380A0]);

    if (v9)
      return 0;
    else
      return 2;
  }
  else
  {

    return 0;
  }
}

- (IMBalloonPluginDataSource)dataSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  IMPluginPayload *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  -[IMChatItem _item](self, "_item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTranscriptPluginChatItem initialPayload](self, "initialPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceForPluginPayload:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[IMTranscriptPluginChatItem hasSetIsLastChatItemOfPluginType](self, "hasSetIsLastChatItemOfPluginType"))
    objc_msgSend(v6, "setLast:", -[IMTranscriptPluginChatItem isLastChatItemOfPluginType](self, "isLastChatItemOfPluginType"));
  v7 = objc_msgSend(v3, "isUpdatingDataSourcePayload");
  objc_msgSend(v3, "payloadData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = v7 ^ 1;
  else
    v9 = 0;

  if (objc_msgSend(v3, "associatedMessageType") != 2)
  {
    objc_msgSend(v3, "setUpdatingDataSourcePayload:", 1);
    if ((v9 & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(v3, "balloonBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D37588]);

  if (!v11)
  {
    objc_msgSend(v3, "setUpdatingDataSourcePayload:", 1);
    if (!v9)
      goto LABEL_15;
LABEL_14:
    v14 = -[IMPluginPayload initWithMessageItem:]([IMPluginPayload alloc], "initWithMessageItem:", v3);
    v15 = objc_msgSend(v3, "messageID");
    objc_msgSend(v3, "guid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_updatePayload:messageID:messageGUID:", v14, v15, v16);

    objc_msgSend(v6, "setInitialMessageIsFromMe:", objc_msgSend(v3, "isFromMe"));
    goto LABEL_15;
  }
  objc_msgSend(v3, "consumedSessionPayloads");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = v9;
  else
    v13 = 0;

  objc_msgSend(v3, "setUpdatingDataSourcePayload:", 1);
  if ((v13 & 1) != 0)
    goto LABEL_14;
LABEL_15:
  objc_msgSend(v3, "setUpdatingDataSourcePayload:", v7);
  if (-[IMTranscriptPluginChatItem parentChatHasKnownParticipants](self, "parentChatHasKnownParticipants"))
    v17 = 0;
  else
    v17 = -[IMMessageChatItem isFromMe](self, "isFromMe") ^ 1;
  objc_msgSend(v6, "setParentChatHasAllUnknownRecipients:", v17);

  return (IMBalloonPluginDataSource *)v6;
}

- (BOOL)isPlayed
{
  void *v2;
  char v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlayed");

  return v3;
}

- (BOOL)isSaved
{
  void *v2;
  BOOL v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "expireState") == 3;

  return v3;
}

- (BOOL)wantsAutoPlayback
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;

  -[IMMessageChatItem message](self, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSenderUnknown");

  if ((v4 & 1) != 0)
    return 0;
  -[IMTranscriptPluginChatItem dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "playbackType");
  objc_msgSend(v6, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D37588]);

  v10 = -[IMTranscriptPluginChatItem isPlayed](self, "isPlayed") & (v9 ^ 1);
  v5 = v7 == 1 && !v10 || v7 == 2 && (objc_msgSend(v6, "isLast") ^ 1 | v10) != 1;

  return v5;
}

- (IMPluginPayload)initialPayload
{
  return self->_initialPayload;
}

- (void)setInitialPayload:(id)a3
{
  objc_storeStrong((id *)&self->_initialPayload, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (BOOL)isLastChatItemOfPluginType
{
  return self->_isLastChatItemOfPluginType;
}

- (BOOL)hasSetIsLastChatItemOfPluginType
{
  return self->_hasSetIsLastChatItemOfPluginType;
}

- (void)setHasSetIsLastChatItemOfPluginType:(BOOL)a3
{
  self->_hasSetIsLastChatItemOfPluginType = a3;
}

- (BOOL)parentChatHasKnownParticipants
{
  return self->_parentChatHasKnownParticipants;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_initialPayload, 0);
}

- (unsigned)contentType
{
  void *v2;
  int v3;

  -[IMTranscriptPluginChatItem type](self, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D375F8]);

  if (v3)
    return 1;
  else
    return 9;
}

- (id)messageSummaryInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v33;

  -[IMTranscriptPluginChatItem dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IMTranscriptPluginChatItem type](self, "type");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D375F8]))
    {
      objc_msgSend(v3, "url");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "previewSummaryForPluginBundle:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v4;
    v9 = objc_alloc(MEMORY[0x1E0CB3710]);
    objc_msgSend(v3, "pluginPayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v12 = (void *)objc_msgSend(v9, "initForReadingFromData:error:", v11, &v33);
    v13 = v33;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "_enableStrictSecureDecodingMode");
      IMLogHandleForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_1A2198194();

    }
    IMExtensionPayloadUnarchivingClasses();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "decodeObjectOfClasses:forKey:", v15, *MEMORY[0x1E0CB2CD0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0D37E20]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      IMLogHandleForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1A21980C0((uint64_t)v13, v17, v18, v19, v20, v21, v22, v23);

      v8 = 0;
      if (v6)
        goto LABEL_19;
    }
    IMLogHandleForCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_1A219805C((uint64_t)v7, v24, v25, v26, v27, v28, v29, v30);

    goto LABEL_19;
  }
  v6 = 0;
  v7 = 0;
  v8 = 0;
LABEL_20:
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithAssociatedMessageSummary:contentType:associatedMessagePartText:pluginBundleID:pluginDisplayName:", v6, -[IMTranscriptPluginChatItem contentType](self, "contentType"), 0, v7, v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

@end
