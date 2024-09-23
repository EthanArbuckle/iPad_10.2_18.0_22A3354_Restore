@implementation LNMessageConversation

- (LNMessageConversation)initWithMessageConversationIdentifier:(id)a3 groupName:(id)a4 recipients:(id)a5
{
  id v9;
  id v10;
  id v11;
  LNMessageConversation *v12;
  uint64_t v13;
  NSString *messageConversationIdentifier;
  uint64_t v15;
  NSString *groupName;
  uint64_t v17;
  NSArray *recipients;
  LNMessageConversation *v19;
  void *v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNMessageConversation.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageConversationIdentifier"));

  }
  v22.receiver = self;
  v22.super_class = (Class)LNMessageConversation;
  v12 = -[LNMessageConversation init](&v22, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    messageConversationIdentifier = v12->_messageConversationIdentifier;
    v12->_messageConversationIdentifier = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    groupName = v12->_groupName;
    v12->_groupName = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    recipients = v12->_recipients;
    v12->_recipients = (NSArray *)v17;

    v19 = v12;
  }

  return v12;
}

- (LNMessageConversation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  LNMessageConversation *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageConversationIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("recipients"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNMessageConversation initWithMessageConversationIdentifier:groupName:recipients:](self, "initWithMessageConversationIdentifier:groupName:recipients:", v5, v6, v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LNMessageConversation messageConversationIdentifier](self, "messageConversationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("messageConversationIdentifier"));

  -[LNMessageConversation groupName](self, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("groupName"));

  -[LNMessageConversation recipients](self, "recipients");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("recipients"));

}

- (NSString)messageConversationIdentifier
{
  return self->_messageConversationIdentifier;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_messageConversationIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
