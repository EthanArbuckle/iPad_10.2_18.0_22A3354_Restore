@implementation ICSMessageStoreClient

- (ICSMessageStoreClient)init
{
  return (ICSMessageStoreClient *)sub_10010A1CC();
}

- (void)urlForVideoMessageWithUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  ICSMessageStoreClient *v14;
  uint64_t v15;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = swift_allocObject(&unk_100288BF8, 24, 7);
  *(_QWORD *)(v13 + 16) = v12;
  v14 = self;
  sub_10010A258((uint64_t)v11, (uint64_t)sub_10010AE2C, v13);

  swift_release(v13);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSMessageStoreClient_messageStoreController));
}

@end
