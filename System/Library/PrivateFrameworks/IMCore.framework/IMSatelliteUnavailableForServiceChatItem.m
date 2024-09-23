@implementation IMSatelliteUnavailableForServiceChatItem

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

- (id)_initWithItem:(id)a3 service:(id)a4 recipientID:(id)a5 isGroupChat:(BOOL)a6
{
  id v11;
  id v12;
  id *v13;
  id *v14;
  objc_super v16;

  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)IMSatelliteUnavailableForServiceChatItem;
  v13 = -[IMChatItem _initWithItem:](&v16, sel__initWithItem_, a3);
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "_setGUID:", CFSTR("ug:"));
    objc_storeStrong(v14 + 8, a4);
    objc_storeStrong(v14 + 9, a5);
    *((_BYTE *)v14 + 56) = a6;
  }

  return v14;
}

- (IMServiceImpl)service
{
  return self->_service;
}

- (NSString)recipientID
{
  return self->_recipientID;
}

- (BOOL)isGroupChat
{
  return self->_isGroupChat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientID, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
