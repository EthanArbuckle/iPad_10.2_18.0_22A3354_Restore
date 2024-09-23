@implementation CNMutableContact(ConversationKit)

- (uint64_t)initWithConversationMember:()ConversationKit
{
  objc_class *v4;
  id v5;
  uint64_t v6;

  v4 = (objc_class *)MEMORY[0x1E0C97360];
  v5 = a3;
  v6 = objc_msgSend([v4 alloc], "_initWithConversationMember:", v5);

  return v6;
}

- (uint64_t)initWithHandle:()ConversationKit
{
  objc_class *v4;
  id v5;
  uint64_t v6;

  v4 = (objc_class *)MEMORY[0x1E0C97360];
  v5 = a3;
  v6 = objc_msgSend([v4 alloc], "_initWithHandle:", v5);

  return v6;
}

@end
