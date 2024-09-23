@implementation IMTUConversationChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithItem:conversationInitiator:", v5, self->_conversationInitiator);

  return v6;
}

- (id)_initWithItem:(id)a3 conversationInitiator:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMTUConversationChatItem;
  v8 = -[IMChatItem _initWithItem:](&v14, sel__initWithItem_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 7, a4);
    objc_msgSend(v6, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)sub_1A2132A84();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v11;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Creating new IMTranscriptChatItem with GUID %@ from IMTUConversationItem %@", buf, 0x16u);
      }

    }
    objc_msgSend(v9, "_setGUID:", v11);

  }
  return v9;
}

- (id)activeCall
{
  void *v3;
  void *v4;
  void *v5;

  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTUConversationChatItem tuConversationUUID](self, "tuConversationUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeCallForConversationUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSUUID)tuConversationUUID
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[IMChatItem _item](self, "_item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithUUIDString:", v5);

  return (NSUUID *)v6;
}

- (TUConversation)tuConversation
{
  void *v3;
  void *v4;
  void *v5;

  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTUConversationChatItem tuConversationUUID](self, "tuConversationUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "existingConversationForFaceTimeConversationUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUConversation *)v5;
}

- (BOOL)isFromMe
{
  void *v2;
  char v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromMe");

  return v3;
}

- (NSDate)time
{
  void *v2;
  void *v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (BOOL)canDelete
{
  return 1;
}

- (unint64_t)conversationAVMode
{
  void *v2;
  unint64_t v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "avMode");

  return v3;
}

- (IMHandle)conversationInitiator
{
  return self->_conversationInitiator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationInitiator, 0);
}

@end
