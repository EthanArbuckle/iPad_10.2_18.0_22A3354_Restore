@implementation ABGetProcessDistributedNotificationIdentifier

id __ABGetProcessDistributedNotificationIdentifier_block_invoke()
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  ABGetProcessDistributedNotificationIdentifier_processNotificationIdentifier = (uint64_t)result;
  return result;
}

@end
