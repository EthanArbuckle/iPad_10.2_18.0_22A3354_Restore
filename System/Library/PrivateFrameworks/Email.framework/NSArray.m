@implementation NSArray

BOOL __55__NSArray_EMSmartMailbox__em_containsSmartMailboxType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = objc_msgSend(v3, "isSmartMailbox") && objc_msgSend(v3, "smartMailboxType") == *(_QWORD *)(a1 + 32);

  return v4;
}

id __39__NSArray_EMSender__em_senderAddresses__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "addresses");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
