@implementation SessionClient.ReverseServer

- (void)sendWithMessageData:(id)a3 with:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v6 = _Block_copy(a4);
  v7 = a3;
  swift_retain();
  v8 = sub_23F267D18();
  v10 = v9;

  _Block_copy(v6);
  sub_23F255168(v8, v10, (uint64_t)self, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  sub_23F1311B4(v8, v10);
  swift_release();
}

- (void)connectionClosedWith:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  _Block_copy(v3);
  v4 = swift_retain();
  sub_23F2558C4(v4, (void (**)(_QWORD, _QWORD, _QWORD))v3);
  _Block_release(v3);
  swift_release();
}

- (void)runTransactionHookWithSessionId:(id)a3 transaction:(id)a4 with:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;

  v6 = sub_23F267D84();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a5);
  sub_23F267D54();
  sub_23F26827C();
  *(_QWORD *)(swift_allocObject() + 16) = v10;
  swift_retain();
  sub_23F255C1C();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
