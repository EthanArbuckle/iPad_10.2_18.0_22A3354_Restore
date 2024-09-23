@implementation GKUnifiedRecipient

- (void)setContact:(id)a3
{
  void *v5;
  void *v6;
  CNContact *v7;

  v7 = (CNContact *)a3;
  if (self->_contact != v7)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v7, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKUnifiedRecipient setFullName:](self, "setFullName:", v5);

    -[CNContact nickname](v7, "nickname");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKUnifiedRecipient setNickName:](self, "setNickName:", v6);

  }
}

- (id)displayName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[GKUnifiedRecipient fullName](self, "fullName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[GKUnifiedRecipient handle](self, "handle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)recipientForHandle:(id)a3
{
  id v3;
  GKUnifiedRecipient *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc_init(GKUnifiedRecipient);
    -[GKUnifiedRecipient setHandle:](v4, "setHandle:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)recipientForContact:(id)a3
{
  id v3;
  GKUnifiedRecipient *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(GKUnifiedRecipient);
  -[GKUnifiedRecipient setContact:](v4, "setContact:", v3);
  +[GKMessageUtilities messagesRecipientHandleForContact:](GKMessageUtilities, "messagesRecipientHandleForContact:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKUnifiedRecipient setHandle:](v4, "setHandle:", v5);
  return v4;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
  objc_storeStrong((id *)&self->_fullName, a3);
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (NSString)nickName
{
  return self->_nickName;
}

- (void)setNickName:(id)a3
{
  objc_storeStrong((id *)&self->_nickName, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_nickName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
}

@end
