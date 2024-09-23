@implementation EMMessageConversationFlagChangeAction

- (EMMessageConversationFlagChangeAction)initWithConversationIDs:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 conversationNotificationLevel:(int64_t)a6
{
  id v10;
  EMMessageConversationFlagChangeAction *v11;
  uint64_t v12;
  NSArray *conversationIDs;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EMMessageConversationFlagChangeAction;
  v11 = -[EMMessageChangeAction initWithMessageListItems:origin:actor:](&v15, sel_initWithMessageListItems_origin_actor_, 0, a4, a5);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    conversationIDs = v11->_conversationIDs;
    v11->_conversationIDs = (NSArray *)v12;

    v11->_conversationNotificationLevel = a6;
  }

  return v11;
}

- (int64_t)signpostType
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageConversationFlagChangeAction)initWithCoder:(id)a3
{
  id v4;
  EMMessageConversationFlagChangeAction *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *conversationIDs;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EMMessageConversationFlagChangeAction;
  v5 = -[EMMessageChangeAction initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("EFPropertyKey_conversationIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    conversationIDs = v5->_conversationIDs;
    v5->_conversationIDs = (NSArray *)v9;

    v5->_conversationNotificationLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_conversationNotificationLevel"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EMMessageConversationFlagChangeAction;
  -[EMMessageChangeAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[EMMessageConversationFlagChangeAction conversationIDs](self, "conversationIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_conversationIDs"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[EMMessageConversationFlagChangeAction conversationNotificationLevel](self, "conversationNotificationLevel"), CFSTR("EFPropertyKey_conversationNotificationLevel"));
}

- (int64_t)conversationNotificationLevel
{
  return self->_conversationNotificationLevel;
}

- (NSArray)conversationIDs
{
  return self->_conversationIDs;
}

- (void)setConversationIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationIDs, 0);
}

@end
