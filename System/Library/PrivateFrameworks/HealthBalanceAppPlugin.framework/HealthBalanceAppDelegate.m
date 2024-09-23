@implementation HealthBalanceAppDelegate

- (_TtC22HealthBalanceAppPlugin24HealthBalanceAppDelegate)init
{
  objc_super v4;

  sub_23DC70224();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HealthBalanceAppDelegate();
  return -[HealthBalanceAppDelegate init](&v4, sel_init);
}

- (void)open:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = sub_23DC70164();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC7014C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin24HealthBalanceAppDelegate_urlBuilder;
  v3 = sub_23DC70230();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)a3 didReceiveNotificationResponse:(UNNotificationResponse *)a4 withCompletionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  UNUserNotificationCenter *v18;
  UNNotificationResponse *v19;
  _TtC22HealthBalanceAppPlugin24HealthBalanceAppDelegate *v20;
  uint64_t v21;

  sub_23DC4A608(0, &qword_256CF4A68, (void (*)(uint64_t))MEMORY[0x24BEE6990]);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v21 - v11;
  v13 = _Block_copy(a5);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v13;
  v14[5] = self;
  v15 = sub_23DC71058();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256CF4EE8;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_256CF4EF8;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  v20 = self;
  sub_23DC5F310((uint64_t)v12, (uint64_t)&unk_256CF4F08, (uint64_t)v17);
  swift_release();
}

@end
