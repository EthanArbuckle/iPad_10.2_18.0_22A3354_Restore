@implementation MessageStoreController

- (void)messageStoreDidAddMessages:(id)a3
{
  sub_23B363C28((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))type metadata accessor for Message, (void (*)(uint64_t))MessageStoreController.messageStoreDidAddMessages(_:));
}

- (void)messageStoreDidUpdateMessages:(id)a3
{
  sub_23B363C28((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))type metadata accessor for Message, (void (*)(uint64_t))MessageStoreController.messageStoreDidUpdateMessages(_:));
}

- (void)messageStoreDidDeleteMessages:(id)a3
{
  sub_23B363C28((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))type metadata accessor for Message, (void (*)(uint64_t))MessageStoreController.messageStoreDidDeleteMessages(_:));
}

- (void)messageStoreDidDeleteMessagesWithUUIDs:(id)a3
{
  sub_23B363C28((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))MEMORY[0x24BDCEA58], (void (*)(uint64_t))MessageStoreController.messageStoreDidDeleteMessagesWithUUIDs(_:));
}

- (void)messageStoreAccountInfoDidChange:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  MessageStoreController.messageStoreAccountInfoDidChange(_:)(v3);

  swift_release();
}

- (void)messageStoreDidReconnect
{
  sub_23B3644F4((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))MessageStoreController.messageStoreDidReconnect());
}

- (void)messageStoreRequiresRefetch
{
  sub_23B3644F4((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))MessageStoreController.messageStoreRequiresRefetch());
}

@end
