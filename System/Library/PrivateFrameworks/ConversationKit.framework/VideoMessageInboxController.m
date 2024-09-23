@implementation VideoMessageInboxController

- (void)messageStoreDidAddMessages:(id)a3
{
  @objc VideoMessageInboxController.messageStoreDidAddMessages(_:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x1E0D20D18], (void (*)(uint64_t))VideoMessageInboxController.messageStoreDidAddMessages(_:));
}

- (void)messageStoreDidUpdateMessages:(id)a3
{
  @objc VideoMessageInboxController.messageStoreDidAddMessages(_:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x1E0D20D18], (void (*)(uint64_t))VideoMessageInboxController.messageStoreDidUpdateMessages(_:));
}

- (void)messageStoreDidDeleteMessages:(id)a3
{
  @objc VideoMessageInboxController.messageStoreDidAddMessages(_:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x1E0D20D18], (void (*)(uint64_t))VideoMessageInboxController.messageStoreDidDeleteMessages(_:));
}

- (void)messageStoreDidDeleteMessagesWithUUIDs:(id)a3
{
  @objc VideoMessageInboxController.messageStoreDidAddMessages(_:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))MEMORY[0x1E0CB0998], (void (*)(uint64_t))VideoMessageInboxController.messageStoreDidDeleteMessagesWithUUIDs(_:));
}

@end
