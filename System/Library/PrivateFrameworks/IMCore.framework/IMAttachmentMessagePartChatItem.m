@implementation IMAttachmentMessagePartChatItem

- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  IMReplyContextAttachmentMessagePartChatItem *v18;

  v5 = a3;
  v18 = [IMReplyContextAttachmentMessagePartChatItem alloc];
  -[IMChatItem _item](self, "_item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isFromMe");
  -[IMMessagePartChatItem text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IMMessagePartChatItem index](self, "index");
  v11 = -[IMMessagePartChatItem messagePartRange](self, "messagePartRange");
  v13 = v12;
  -[IMAttachmentMessagePartChatItem transferGUID](self, "transferGUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTranscriptChatItem chatContext](self, "chatContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[IMReplyContextAttachmentMessagePartChatItem _initWithItem:parentItem:replyMessageGUID:replyIsFromMe:text:index:messagePartRange:transferGUID:chatContext:](v18, "_initWithItem:parentItem:replyMessageGUID:replyIsFromMe:text:index:messagePartRange:transferGUID:chatContext:", v6, v5, v7, v8, v9, v10, v11, v13, v14, v15);

  return v16;
}

- (BOOL)supportsCommunicationSafety
{
  return 1;
}

- (BOOL)supportsSuggestedActionsMenu
{
  void *v3;
  void *v4;
  void *v5;

  +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAttachmentMessagePartChatItem transferGUID](self, "transferGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferForGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isSticker") ^ 1;
  return (char)v4;
}

- (id)commSafetyMessageGUID
{
  void *v2;
  void *v3;

  -[IMMessageChatItem message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)IMAttachmentMessagePartChatItem;
  -[IMMessagePartChatItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[[%@] transferGUID: %@]"), v4, self->_transferGUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)layoutGroupIdentifier
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMAttachmentMessagePartChatItem;
  -[IMTranscriptChatItem layoutGroupIdentifier](&v3, sel_layoutGroupIdentifier);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)parentChatIsSpam
{
  void *v2;
  char v3;

  -[IMTranscriptChatItem chatContext](self, "chatContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSpam");

  return v3;
}

- (int64_t)syndicationBehavior
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  int64_t v11;

  -[IMChatItem _item](self, "_item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFileAttachment");

  if (!v4)
    return 0;
  +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAttachmentMessagePartChatItem transferGUID](self, "transferGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transferForGUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "filename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IMUTITypeForFilename();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isFromMomentShare") & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  v11 = ((isKindOfClass | IMUTITypeIsSupportedByPhotos()) & 1) == 0;

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *transferGUID;
  void *v12;
  void *v13;
  void *v14;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessagePartChatItem text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IMMessagePartChatItem index](self, "index");
  v8 = -[IMMessagePartChatItem messagePartRange](self, "messagePartRange");
  v10 = v9;
  transferGUID = self->_transferGUID;
  -[IMTranscriptChatItem chatContext](self, "chatContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessagePartChatItem visibleAssociatedMessageChatItems](self, "visibleAssociatedMessageChatItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v4, "_initWithItem:text:index:messagePartRange:transferGUID:chatContext:visibleAssociatedMessageChatItems:", v5, v6, v7, v8, v10, transferGUID, v12, v13);

  return v14;
}

- (BOOL)isAttachmentContiguousWithChatItem:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  BOOL v11;
  char IsSupportedByPhotos;

  v4 = a3;
  if (-[IMTranscriptChatItem isContiguousWithChatItem:](self, "isContiguousWithChatItem:", v4))
  {
    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAttachmentMessagePartChatItem transferGUID](self, "transferGUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transferForGUID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "filename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IMUTITypeForFilename();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "isFromMomentShare") & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    IsSupportedByPhotos = IMUTITypeIsSupportedByPhotos();
    v11 = 0;
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.pkpass")) & 1) == 0
      && (IsSupportedByPhotos & 1) == 0
      && (isKindOfClass & 1) == 0)
    {
      v11 = self->_wantsAttachmentContiguous && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && v4[168] != 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 transferGUID:(id)a7 chatContext:(id)a8
{
  return -[IMAttachmentMessagePartChatItem _initWithItem:text:index:messagePartRange:transferGUID:chatContext:visibleAssociatedMessageChatItems:](self, "_initWithItem:text:index:messagePartRange:transferGUID:chatContext:visibleAssociatedMessageChatItems:", a3, a4, a5, a6.location, a6.length, a7, a8, 0);
}

- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 transferGUID:(id)a7 chatContext:(id)a8 visibleAssociatedMessageChatItems:(id)a9
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  objc_super v27;

  length = a6.length;
  location = a6.location;
  v15 = a7;
  v16 = a8;
  v27.receiver = self;
  v27.super_class = (Class)IMAttachmentMessagePartChatItem;
  v17 = -[IMMessagePartChatItem _initWithItem:text:index:messagePartRange:visibleAssociatedMessageChatItems:](&v27, sel__initWithItem_text_index_messagePartRange_visibleAssociatedMessageChatItems_, a3, a4, a5, location, length, a9);
  if (v17)
  {
    v18 = objc_msgSend(v15, "copy");
    v19 = (void *)v17[22];
    v17[22] = v18;

    v20 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v17, "setChatContext:", v20);

    +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "transferForGUID:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "type");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lowercaseString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    *((_BYTE *)v17 + 168) = objc_msgSend(v17, "_wantsAttachmentContiguousForType:", v24);
    if (!v17[22])
    {
      IMLogHandleForCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        sub_1A2196B0C(v17, v25);

    }
  }

  return v17;
}

- (BOOL)_wantsAttachmentContiguousForType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasSuffix:", CFSTR(".gif")) & 1) != 0)
    LOBYTE(v4) = 0;
  else
    v4 = objc_msgSend(v3, "hasSuffix:", CFSTR(".apng")) ^ 1;

  return v4;
}

- (NSString)transferGUID
{
  return self->_transferGUID;
}

- (unint64_t)numberOfMomentShareSavedAssets
{
  return self->_numberOfMomentShareSavedAssets;
}

- (void)setNumberOfMomentShareSavedAssets:(unint64_t)a3
{
  self->_numberOfMomentShareSavedAssets = a3;
}

- (unint64_t)numberOfMomentSharePhotos
{
  return self->_numberOfMomentSharePhotos;
}

- (void)setNumberOfMomentSharePhotos:(unint64_t)a3
{
  self->_numberOfMomentSharePhotos = a3;
}

- (unint64_t)numberOfMomentShareVideos
{
  return self->_numberOfMomentShareVideos;
}

- (void)setNumberOfMomentShareVideos:(unint64_t)a3
{
  self->_numberOfMomentShareVideos = a3;
}

- (BOOL)wantsAttachmentContiguous
{
  return self->_wantsAttachmentContiguous;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferGUID, 0);
}

- (unsigned)contentType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAttachmentMessagePartChatItem transferGUID](self, "transferGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferForGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((IMUTTypeIsImage() & 1) != 0 || (IMUTTypeIsSupportedAnimatedImage() & 1) != 0)
  {
    v7 = 3;
  }
  else if ((IMUTTypeIsMovie() & 1) != 0)
  {
    v7 = 7;
  }
  else if ((IMUTTypeIsVCard() & 1) != 0)
  {
    v7 = 4;
  }
  else if ((IMUTTypeIsAudio() & 1) != 0)
  {
    v7 = 2;
  }
  else if ((IMUTTypeIsMap() & 1) != 0)
  {
    v7 = 6;
  }
  else if ((IMUTTypeIsCalendar() & 1) != 0)
  {
    v7 = 5;
  }
  else if ((IMUTTypeIsPass() & 1) != 0)
  {
    v7 = 8;
  }
  else if (IMUTTypeIsWalletOrder())
  {
    v7 = 10;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)messageSummaryInfo
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  void *v9;

  if (-[IMAttachmentMessagePartChatItem contentType](self, "contentType"))
  {
    -[IMChatItem balloonBundleID](self, "balloonBundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)*MEMORY[0x1E0D375E8];
    IMBalloonExtensionIDWithSuffix();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "isEqualToString:", v5);

    if (v6)
      v7 = v4;
    else
      v7 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithAssociatedMessageSummary:contentType:associatedMessagePartText:pluginBundleID:pluginDisplayName:", 0, -[IMAttachmentMessagePartChatItem contentType](self, "contentType"), 0, v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1A2198030();

    v9 = 0;
  }
  return v9;
}

@end
