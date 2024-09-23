@implementation IMAssistantRelevantChatMatchingRecipients

- (IMAssistantRelevantChatMatchingRecipients)initWithChat:(id)a3 resolvedPersons:(id)a4
{
  id v7;
  id v8;
  IMAssistantRelevantChatMatchingRecipients *v9;
  IMAssistantRelevantChatMatchingRecipients *v10;
  uint64_t v11;
  NSArray *resolvedPersons;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMAssistantRelevantChatMatchingRecipients;
  v9 = -[IMAssistantRelevantChatMatchingRecipients init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_chat, a3);
    v11 = objc_msgSend(v8, "copy");
    resolvedPersons = v10->_resolvedPersons;
    v10->_resolvedPersons = (NSArray *)v11;

  }
  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<IMAssistantRelevantChatMatchingRecipients %p> {Chat: %@, ResolvedPersons: %@}"), self, self->_chat, self->_resolvedPersons);
}

- (IMChat)chat
{
  return self->_chat;
}

- (void)setChat:(id)a3
{
  objc_storeStrong((id *)&self->_chat, a3);
}

- (NSArray)resolvedPersons
{
  return self->_resolvedPersons;
}

- (void)setResolvedPersons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedPersons, 0);
  objc_storeStrong((id *)&self->_chat, 0);
}

@end
