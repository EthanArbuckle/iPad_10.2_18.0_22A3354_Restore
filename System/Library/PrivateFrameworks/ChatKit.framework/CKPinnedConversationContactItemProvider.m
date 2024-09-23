@implementation CKPinnedConversationContactItemProvider

+ (id)contactItemFromEntity:(id)a3
{
  id v3;
  CKPinnedConversationContactItemFromHandle *v4;

  v3 = a3;
  v4 = -[CKPinnedConversationContactItemFromHandle initWithEntity:]([CKPinnedConversationContactItemFromHandle alloc], "initWithEntity:", v3);

  return v4;
}

@end
