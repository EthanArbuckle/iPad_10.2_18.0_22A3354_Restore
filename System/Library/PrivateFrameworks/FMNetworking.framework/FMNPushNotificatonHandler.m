@implementation FMNPushNotificatonHandler

- (void)dealloc
{
  _TtC12FMNetworking25FMNPushNotificatonHandler *v2;

  v2 = self;
  FMNPushNotificatonHandler.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler__apsConnection));
  sub_1B69C61A8(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler____lazy_storage___apsConnection));
}

- (_TtC12FMNetworking25FMNPushNotificatonHandler)init
{
  _TtC12FMNetworking25FMNPushNotificatonHandler *result;

  result = (_TtC12FMNetworking25FMNPushNotificatonHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  _TtC12FMNetworking25FMNPushNotificatonHandler *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC12FMNetworking25FMNPushNotificatonHandler *v13;

  if (a4)
  {
    v6 = a3;
    v7 = self;
    v8 = a4;
    v9 = sub_1B69CA0B0();
    v11 = v10;

  }
  else
  {
    v12 = a3;
    v13 = self;
    v9 = 0;
    v11 = 0xF000000000000000;
  }
  sub_1B69C5AA4(v9, v11);
  sub_1B699FF80(v9, v11);

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  void *v8;
  id v10;
  id v11;
  id v12;
  _TtC12FMNetworking25FMNPushNotificatonHandler *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  id v19;
  _TtC12FMNetworking25FMNPushNotificatonHandler *v20;

  v8 = a4;
  if (a4)
  {
    v10 = a3;
    v11 = a5;
    v12 = a6;
    v13 = self;
    v14 = v8;
    v8 = (void *)sub_1B69CA0B0();
    v16 = v15;

    if (a5)
      goto LABEL_3;
LABEL_6:
    if (!a6)
      goto LABEL_7;
    goto LABEL_4;
  }
  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = self;
  v16 = 0xF000000000000000;
  if (!a5)
    goto LABEL_6;
LABEL_3:
  sub_1B69CA248();

  if (a6)
  {
LABEL_4:
    sub_1B69CA248();

  }
LABEL_7:
  sub_1B69C5D5C((uint64_t)v8, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B699FF80((uint64_t)v8, v16);

}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC12FMNetworking25FMNPushNotificatonHandler *v12;
  id v13;

  if (!a4)
  {
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  sub_1B69CA248();
  if (a5)
LABEL_3:
    sub_1B69CA20C();
LABEL_4:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52FF20);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1B69CADE0;
  v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic);
  v9 = *(_QWORD *)&self->topic[OBJC_IVAR____TtC12FMNetworking25FMNPushNotificatonHandler_topic];
  *(_QWORD *)(v8 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v8 + 64) = sub_1B699F398();
  *(_QWORD *)(v8 + 32) = v10;
  *(_QWORD *)(v8 + 40) = v9;
  sub_1B6997068(0, (unint64_t *)&qword_1ED530470);
  v11 = a3;
  v12 = self;
  swift_bridgeObjectRetain();
  v13 = (id)sub_1B69CA3E0();
  sub_1B69CA374();
  sub_1B69CA110();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
