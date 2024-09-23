@implementation IMLocationShareOfferChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithItem:sender:", v5, self->_sender);

  objc_msgSend(v6, "_setActionableEclipsed:", self->_actionableEclipsed);
  return v6;
}

- (BOOL)isFromMe
{
  return 0;
}

- (BOOL)failed
{
  return 0;
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

- (IMHandle)sender
{
  return self->_sender;
}

- (int64_t)offerState
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int64_t v7;
  int v8;

  -[IMChatItem _item](self, "_item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "restrictLocationSharing") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    +[IMFMFSession sharedInstance](IMFMFSession, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "disableLocationSharing");

  }
  if ((objc_msgSend(v3, "expired") & 1) != 0)
  {
    v7 = 2;
  }
  else
  {
    v7 = 1;
    if (objc_msgSend(v3, "actionable"))
    {
      v8 = self->_actionableEclipsed ? 1 : v5;
      if (v8 != 1)
        v7 = 0;
    }
  }

  return v7;
}

- (id)_initWithItem:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMLocationShareOfferChatItem;
  v8 = -[IMChatItem _initWithItem:](&v13, sel__initWithItem_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 8, a4);
    objc_msgSend(v6, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)sub_1A2132A84();

    objc_msgSend(v9, "_setGUID:", v11);
  }

  return v9;
}

- (BOOL)_isActionableEclipsed
{
  return self->_actionableEclipsed;
}

- (void)_setActionableEclipsed:(BOOL)a3
{
  self->_actionableEclipsed = a3;
}

- (BOOL)actionableEclipsed
{
  return self->_actionableEclipsed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
}

@end
