@implementation IMTranscriptChatItem

- (NSString)serviceName
{
  void *v2;
  void *v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)layoutGroupIdentifier
{
  return self->_guid;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)IMTranscriptChatItem;
  -[IMChatItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, self->_guid);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_guid, "hash");
}

- (BOOL)isEqual:(id)a3
{
  return IMTranscriptChatItemEqual(self, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithItem:", v5);

  return v6;
}

- (BOOL)isContiguousWithChatItem:(id)a3
{
  id v4;
  char **v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  IMTranscriptChatItem *v17;
  id v18;
  int v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  double v25;
  double v26;

  v4 = a3;
  v5 = &selRef__serviceDidDisconnect_;
  if (!-[IMTranscriptChatItem conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE6724E0))
    goto LABEL_36;
  if (-[IMChatItem isEditedMessageHistory](self, "isEditedMessageHistory"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_4;
  }
  if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (-[IMTranscriptChatItem messageHighlightChatItem](self, "messageHighlightChatItem"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7)
    || !objc_msgSend(v4, "conformsToProtocol:", &unk_1EE6724E0)
    || -[IMChatItem isReplyContextPreview](self, "isReplyContextPreview")
    || (objc_msgSend(v4, "isReplyContextPreview") & 1) != 0
    || -[IMChatItem itemIsThreadOriginator](self, "itemIsThreadOriginator")
    || (objc_msgSend(v4, "itemIsThreadOriginator") & 1) != 0)
  {
LABEL_36:
    v6 = 0;
    goto LABEL_37;
  }
  -[IMChatItem _item](self, "_item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isReply");
  v10 = v9;
  if (v9
    && (objc_msgSend(v4, "_item"),
        v5 = (char **)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "isReply")))
  {

  }
  else
  {
    -[IMChatItem _item](self, "_item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isReply") & 1) != 0)
    {

      if ((v10 & 1) != 0)
      goto LABEL_36;
    }
    objc_msgSend(v4, "_item");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isReply");

    if ((v10 & 1) != 0)
    if ((v13 & 1) != 0)
      goto LABEL_36;
  }
  -[IMChatItem _item](self, "_item");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_item");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 != v15)
  {
    v16 = -[IMChatItem isEditedMessageHistory](self, "isEditedMessageHistory");
    if (v16 == objc_msgSend(v4, "isEditedMessageHistory"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = self;
          v18 = v4;
          v19 = -[IMTranscriptChatItem requiresSiriAttribution](v17, "requiresSiriAttribution");
          v20 = v19 ^ objc_msgSend(v18, "requiresSiriAttribution");
          if ((v20 & 1) != 0
            || -[IMTranscriptChatItem requiresFaceTimeAttribution](v17, "requiresFaceTimeAttribution")
            && objc_msgSend(v18, "requiresFaceTimeAttribution")
            && (v21 = -[IMTranscriptChatItem isFromMe](v17, "isFromMe"),
                v21 == objc_msgSend(v18, "isFromMe")))
          {
            v6 = v20 ^ 1;

            goto LABEL_37;
          }

        }
      }
      v22 = -[IMTranscriptChatItem isFromMe](self, "isFromMe");
      if (v22 == objc_msgSend(v4, "isFromMe"))
      {
        objc_msgSend(v4, "time");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMTranscriptChatItem time](self, "time");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSinceDate:", v24);
        v26 = fabs(v25);

        if (v26 <= 60.0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            v6 = objc_opt_isKindOfClass() ^ 1;
            goto LABEL_37;
          }
        }
      }
    }
    goto LABEL_36;
  }
LABEL_4:
  v6 = 1;
LABEL_37:

  return v6 & 1;
}

- (BOOL)isAttachmentContiguousWithChatItem:(id)a3
{
  return 0;
}

- (unsigned)contiguousType
{
  return self->_contiguousType;
}

- (unsigned)attachmentContiguousType
{
  return self->_attachmentContiguousType;
}

- (BOOL)isContiguous
{
  return self->_contiguousType - 1 < 2;
}

- (BOOL)isFromMe
{
  return 0;
}

- (BOOL)wantsTail
{
  int v2;

  v2 = -[IMTranscriptChatItem contiguousType](self, "contiguousType");
  return v2 == 3 || v2 == 0;
}

- (NSAttributedString)transcriptText
{
  return 0;
}

- (NSDate)transcriptDate
{
  return 0;
}

- (IMServiceImpl)service
{
  return 0;
}

- (IMHandle)handle
{
  return 0;
}

- (BOOL)_isContiguousLoaded
{
  return self->_contiguousLoaded;
}

- (void)_setContiguousLoaded:(BOOL)a3
{
  self->_contiguousLoaded = a3;
}

- (void)_setContiguousType:(unsigned __int8)a3
{
  self->_contiguousType = a3;
}

- (void)_setAttachmentContiguousType:(unsigned __int8)a3
{
  self->_attachmentContiguousType = a3;
}

- (void)_setGUID:(id)a3
{
  NSString *v4;
  NSString **p_guid;
  void *v6;
  NSString *v7;

  v4 = (NSString *)a3;
  p_guid = &self->_guid;
  if (*p_guid != v4)
  {
    v7 = v4;
    v6 = (void *)-[NSString copy](v4, "copy");

    objc_storeStrong((id *)p_guid, v6);
    v4 = (NSString *)v6;
  }

}

- (NSString)guid
{
  return self->_guid;
}

- (BOOL)contiguousLoaded
{
  return self->_contiguousLoaded;
}

- (IMChatContext)chatContext
{
  return self->_chatContext;
}

- (void)setChatContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatContext, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
