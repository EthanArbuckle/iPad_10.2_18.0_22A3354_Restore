@implementation IDSManager

- (_TtC10DropInCore10IDSManager)init
{
  _TtC10DropInCore10IDSManager *result;

  sub_23A7D3F54();
  return result;
}

- (void)dealloc
{
  _TtC10DropInCore10IDSManager *v2;

  v2 = self;
  sub_23A7D4348();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10DropInCore10IDSManager_logger;
  v4 = sub_23A7F1E0C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A77EF5C((uint64_t)self + OBJC_IVAR____TtC10DropInCore10IDSManager_delegate);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  _TtC10DropInCore10IDSManager *v15;

  if (!a5)
  {
    if (!a6)
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23A7F2058();
  if (a6)
LABEL_3:
    sub_23A7F20E8();
LABEL_5:
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = self;
  sub_23A7D5934();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  _TtC10DropInCore10IDSManager *v14;

  if (a5)
    sub_23A7F20E8();
  v11 = a3;
  v12 = a4;
  v13 = a7;
  v14 = self;
  sub_23A7D7C24();

  swift_bridgeObjectRelease();
}

@end
