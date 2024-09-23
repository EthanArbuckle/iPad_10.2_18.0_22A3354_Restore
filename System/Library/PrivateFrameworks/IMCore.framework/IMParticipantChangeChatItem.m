@implementation IMParticipantChangeChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithItem:sender:otherHandle:", v5, self->_sender, self->_otherHandle);

  return v6;
}

- (int64_t)changeType
{
  void *v2;
  int64_t v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "changeType");

  return v3;
}

- (BOOL)unattributed
{
  void *v2;
  char v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unattributed");

  return v3;
}

- (id)_initWithItem:(id)a3 sender:(id)a4 otherHandle:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[IMParticipantChangeChatItem _initWithItem:sender:otherHandle:context:]([IMParticipantChangeChatItem alloc], "_initWithItem:sender:otherHandle:context:", v10, v9, v8, 0);

  return v11;
}

- (id)_initWithItem:(id)a3 sender:(id)a4 otherHandle:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  id *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)IMParticipantChangeChatItem;
  v14 = -[IMChatItem _initWithItem:](&v20, sel__initWithItem_, v10);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(v14 + 8, a4);
    objc_storeStrong(v15 + 9, a5);
    *((_BYTE *)v15 + 56) = objc_msgSend(v10, "errorCode") != 0;
    objc_msgSend(v10, "guid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)sub_1A2132A84();

    objc_msgSend(v15, "_setGUID:", v17);
    objc_msgSend(v13, "activeTelephonyConversationUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActiveTelephonyConversationUUID:", v18);

  }
  return v15;
}

- (IMHandle)sender
{
  return self->_sender;
}

- (IMHandle)otherHandle
{
  return self->_otherHandle;
}

- (NSUUID)activeTelephonyConversationUUID
{
  return self->_activeTelephonyConversationUUID;
}

- (void)setActiveTelephonyConversationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_activeTelephonyConversationUUID, a3);
}

- (BOOL)failed
{
  return self->_failed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTelephonyConversationUUID, 0);
  objc_storeStrong((id *)&self->_otherHandle, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

@end
