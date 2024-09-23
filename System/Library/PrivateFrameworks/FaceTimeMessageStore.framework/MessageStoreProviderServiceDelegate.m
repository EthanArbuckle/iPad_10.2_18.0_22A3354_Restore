@implementation MessageStoreProviderServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC20FaceTimeMessageStore35MessageStoreProviderServiceDelegate *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_23B31752C();

  return v9 & 1;
}

- (_TtC20FaceTimeMessageStore35MessageStoreProviderServiceDelegate)init
{
  MessageStoreProviderServiceDelegate.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FaceTimeMessageStore35MessageStoreProviderServiceDelegate_listener));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FaceTimeMessageStore35MessageStoreProviderServiceDelegate_connectionsQueue));
  OUTLINED_FUNCTION_26_7();
}

- (void)messageStoreDidAddMessages:(id)a3
{
  sub_23B37FF98(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))type metadata accessor for Message, (void (*)(uint64_t))MessageStoreProviderServiceDelegate.messageStoreDidAddMessages(_:));
}

- (void)messageStoreDidUpdateMessages:(id)a3
{
  sub_23B37FF98(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))type metadata accessor for Message, (void (*)(uint64_t))MessageStoreProviderServiceDelegate.messageStoreDidUpdateMessages(_:));
}

- (void)messageStoreDidDeleteMessages:(id)a3
{
  sub_23B37FF98(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))type metadata accessor for Message, (void (*)(uint64_t))MessageStoreProviderServiceDelegate.messageStoreDidDeleteMessages(_:));
}

- (void)messageStoreDidDeleteMessagesWithUUIDs:(id)a3
{
  sub_23B37FF98(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))MEMORY[0x24BDCEA58], (void (*)(uint64_t))MessageStoreProviderServiceDelegate.messageStoreDidDeleteMessagesWithUUIDs(_:));
}

- (void)messageStoreAccountInfoDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC20FaceTimeMessageStore35MessageStoreProviderServiceDelegate *v11;

  v4 = a3;
  v11 = self;
  MessageStoreProviderServiceDelegate.messageStoreAccountInfoDidChange(_:)((uint64_t)v4, (uint64_t)v11, v5, v6, v7, v8, v9, v10);

}

- (void)messageStoreRequiresRefetch
{
  _TtC20FaceTimeMessageStore35MessageStoreProviderServiceDelegate *v2;

  v2 = self;
  MessageStoreProviderServiceDelegate.messageStoreRequiresRefetch()();

}

@end
