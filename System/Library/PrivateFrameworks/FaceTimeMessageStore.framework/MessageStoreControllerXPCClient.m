@implementation MessageStoreControllerXPCClient

- (void)messageStoreDidAddMessages:(id)a3
{
  sub_23B31F514(self, COERCE_DOUBLE(0x8002000010002), (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))type metadata accessor for Message, "MessageStoreControllerXPCClient: Received additions from host with messages: %s");
}

- (void)messageStoreDidUpdateMessages:(id)a3
{
  sub_23B31F514(self, COERCE_DOUBLE(0x8002000010002), (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))type metadata accessor for Message, "MessageStoreControllerXPCClient: Received updates from host with messages: %s");
}

- (void)messageStoreDidDeleteMessages:(id)a3
{
  sub_23B31F514(self, COERCE_DOUBLE(0x8002000010002), (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))type metadata accessor for Message, "MessageStoreControllerXPCClient: Received deletions from host with messages: %s");
}

- (void)messageStoreDidDeleteMessagesWithUUIDs:(id)a3
{
  sub_23B31F514(self, COERCE_DOUBLE(0x8002200010002), (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))MEMORY[0x24BDCEA58], "MessageStoreControllerXPCClient: Received deletions from host with messages: %{public}s");
}

- (void)messageStoreAccountInfoDidChange:(id)a3
{
  id v4;

  v4 = a3;
  self;
  sub_23B31F7E8();
}

- (void)messageStoreRequiresRefetch
{
  self;
  sub_23B31FB2C();
}

@end
