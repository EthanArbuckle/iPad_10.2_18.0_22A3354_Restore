@implementation MessagingDelegateTrampoline

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  void *v9;
  id v12;
  id v13;
  id v14;
  id v15;
  _TtC15FindMyMessaging27MessagingDelegateTrampoline *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _TtC15FindMyMessaging27MessagingDelegateTrampoline *v27;

  v9 = a5;
  if (!a5)
  {
    v23 = a3;
    v24 = a4;
    v25 = a6;
    v26 = a7;
    v27 = self;
    v19 = 0xF000000000000000;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v20 = 0;
    v22 = 0;
    goto LABEL_6;
  }
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = self;
  v17 = v9;
  v9 = (void *)sub_23B958280();
  v19 = v18;

  if (!a6)
    goto LABEL_5;
LABEL_3:
  v20 = sub_23B9583DC();
  v22 = v21;

LABEL_6:
  sub_23B94CC34(a3, a4, (uint64_t)v9, v19, v20, v22, a7);
  swift_bridgeObjectRelease();
  sub_23B9568BC((uint64_t)v9, v19);

}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _TtC15FindMyMessaging27MessagingDelegateTrampoline *v24;
  id v25;
  _TtC15FindMyMessaging27MessagingDelegateTrampoline *v26;
  uint64_t v27;
  _TtC15FindMyMessaging27MessagingDelegateTrampoline *v28;

  v28 = self;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A55BF8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_23B958250();
    v17 = sub_23B95825C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 0, 1, v17);
  }
  else
  {
    v18 = sub_23B95825C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v16, 1, 1, v18);
  }
  if (a6)
    a6 = (id)sub_23B95834C();
  if (a7)
  {
    v19 = sub_23B9583DC();
    a7 = v20;
  }
  else
  {
    v19 = 0;
  }
  v21 = a3;
  v22 = a4;
  v23 = a8;
  v24 = v28;
  v25 = a8;
  v26 = v24;
  sub_23B94DD34(a3, a4, (uint64_t)v16, (uint64_t)a6, v19, (uint64_t)a7, v25);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B930790((uint64_t)v16, &qword_256A55BF8);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  char *v8;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  _TtC15FindMyMessaging27MessagingDelegateTrampoline *v18;

  v8 = (char *)a6;
  if (!a5)
  {
    v12 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = sub_23B95834C();
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v13 = sub_23B9583DC();
  v8 = v14;
LABEL_6:
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = self;
  sub_23B94EFFC(a3, a4, v12, v13, v8, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  id v17;
  _TtC15FindMyMessaging27MessagingDelegateTrampoline *v18;

  v8 = a6;
  if (a5)
  {
    v12 = sub_23B9583DC();
    v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = self;
  sub_23B94FE74(a3, a4, v12, v14, v8, a7);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  id v8;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _TtC15FindMyMessaging27MessagingDelegateTrampoline *v19;
  id v20;
  id v21;
  _TtC15FindMyMessaging27MessagingDelegateTrampoline *v22;
  _OWORD v23[2];

  v8 = a6;
  if (a5)
  {
    v12 = (void *)sub_23B9583DC();
    v14 = v13;
    if (v8)
      goto LABEL_3;
LABEL_6:
    v15 = 0;
    if (a7)
      goto LABEL_4;
LABEL_7:
    memset(v23, 0, sizeof(v23));
    v20 = a3;
    v21 = a4;
    v22 = self;
    goto LABEL_8;
  }
  v12 = 0;
  v14 = 0;
  if (!a6)
    goto LABEL_6;
LABEL_3:
  v15 = sub_23B9583DC();
  v8 = v16;
  if (!a7)
    goto LABEL_7;
LABEL_4:
  v17 = a3;
  v18 = a4;
  v19 = self;
  swift_unknownObjectRetain();
  sub_23B9585C8();
  swift_unknownObjectRelease();
LABEL_8:
  sub_23B950B54(a3, a4, v12, v14, v15, (unint64_t)v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B930790((uint64_t)v23, &qword_256A55700);
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC15FindMyMessaging27MessagingDelegateTrampoline *v8;

  if (a4)
    v6 = sub_23B958508();
  else
    v6 = 0;
  v7 = a3;
  v8 = self;
  sub_23B951A18(a3, v6);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  sub_23B952ED0(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)&unk_250CA2E48, (uint64_t)&unk_256A55C40);
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  sub_23B952ED0(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)&unk_250CA2D08, (uint64_t)&unk_256A55B68);
}

- (_TtC15FindMyMessaging27MessagingDelegateTrampoline)init
{
  _TtC15FindMyMessaging27MessagingDelegateTrampoline *result;

  result = (_TtC15FindMyMessaging27MessagingDelegateTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23B956AEC((uint64_t)self + OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate);
}

@end
