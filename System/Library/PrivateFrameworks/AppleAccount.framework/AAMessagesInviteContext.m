@implementation AAMessagesInviteContext

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AAMessagesInviteContext title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAMessagesInviteContext subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAMessagesInviteContext action](self, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAMessagesInviteContext inviteURL](self, "inviteURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAMessagesInviteContext recipients](self, "recipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - title: %@ subtitle: %@ action: %@ inviteURL: %@ recipients: %@"), v4, v5, v6, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)messageBody
{
  return self->_messageBody;
}

- (void)setMessageBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)inviteURL
{
  return self->_inviteURL;
}

- (void)setInviteURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (void)setSecondaryTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_inviteURL, 0);
  objc_storeStrong((id *)&self->_messageBody, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
