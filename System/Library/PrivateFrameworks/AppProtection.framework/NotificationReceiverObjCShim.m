@implementation NotificationReceiverObjCShim

- (void)receivedNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC13AppProtection28NotificationReceiverObjCShim *v9;
  uint64_t v10;

  v4 = sub_2362CB218();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2362CB1E8();
  v9 = self;
  sub_236279C58((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC13AppProtection28NotificationReceiverObjCShim)init
{
  _TtC13AppProtection28NotificationReceiverObjCShim *result;

  result = (_TtC13AppProtection28NotificationReceiverObjCShim *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
