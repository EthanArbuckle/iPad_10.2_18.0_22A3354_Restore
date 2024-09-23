@implementation IMParticipantSubscriptionSwitchChatItem

- (id)_initWithItem:(id)a3 sender:(id)a4 otherHandle:(id)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;
  id *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)IMParticipantSubscriptionSwitchChatItem;
  v11 = -[IMChatItem _initWithItem:](&v16, sel__initWithItem_, v8);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(v11 + 7, a4);
    objc_storeStrong(v12 + 8, a5);
    objc_msgSend(v8, "guid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)sub_1A2132A84();

    objc_msgSend(v12, "_setGUID:", v14);
  }

  return v12;
}

- (IMHandle)sender
{
  return self->_sender;
}

- (IMHandle)otherHandle
{
  return self->_otherHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherHandle, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

@end
