@implementation MessageStoreServer

- (void)pingWithCompletion:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  swift_retain();
  sub_23B313838((uint64_t)sub_23B37E420, v4);
  swift_release();
  swift_release();
}

- (_FTMSMessageStoreControllerClientDelegate)delegate
{
  void *v2;

  swift_retain();
  v2 = (void *)sub_23B37C1C8();
  swift_release();
  return (_FTMSMessageStoreControllerClientDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  swift_retain();
  sub_23B37C284();
  swift_release();
}

- (void)addMessage:(id)a3 completion:(id)a4
{
  sub_23B37C984((int)self, (int)a2, a3, a4, (uint64_t)&unk_250C47498, (uint64_t)sub_23B37E310);
}

- (void)getMessagesWithFetchRequest:(id)a3 completion:(id)a4
{
  sub_23B37C984((int)self, (int)a2, a3, a4, (uint64_t)&unk_250C47448, (uint64_t)sub_23B310C70);
}

- (void)deleteMessagesWithQuery:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = a3;
  swift_retain();
  sub_23B37CA28(v7, (uint64_t)sub_23B37E420, v6);

  swift_release();
  swift_release();
}

- (void)getMessageCountFor:(id)a3 completion:(id)a4
{
  sub_23B37C984((int)self, (int)a2, a3, a4, (uint64_t)&unk_250C473A8, (uint64_t)sub_23B37E418);
}

- (void)updateMessages:(id)a3 completion:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = _Block_copy(a4);
  type metadata accessor for MessageUpdate();
  v5 = sub_23B3D53D8();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  swift_retain();
  sub_23B37D1D0(v5, (uint64_t)sub_23B37E420, v6);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)saveMessageToPhotoLibraryWithMessageUUID:(id)a3 completion:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = sub_23B3D4D54();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  sub_23B3D4D3C();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  swift_retain();
  sub_23B37D49C((uint64_t)v8, (uint64_t)sub_23B310C1C, v10);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)isTranscriptionEnabledWithCompletion:(id)a3
{
  sub_23B37DBA4((int)self, (int)a2, a3, (uint64_t)&unk_250C472B8, (uint64_t)sub_23B37E418);
}

- (void)getAccountInfoWithCompletion:(id)a3
{
  sub_23B37DBA4((int)self, (int)a2, a3, (uint64_t)&unk_250C47268, (uint64_t)sub_23B37E418);
}

@end
