@implementation CKClientSetChatContextWithSubscriptionIdentifier

void __CKClientSetChatContextWithSubscriptionIdentifier_block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endBackgroundTask:", *(_QWORD *)(a1 + 32));

}

@end
