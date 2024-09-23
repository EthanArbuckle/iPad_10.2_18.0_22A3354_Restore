@implementation CKRegistrationFailureHandleDependentValueChanged

void ___CKRegistrationFailureHandleDependentValueChanged_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", *MEMORY[0x1E0D35298], 0);

}

@end
