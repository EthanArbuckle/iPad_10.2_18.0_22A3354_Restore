@implementation EncoreService

+ (EncoreService)service
{
  EncoreService *result;
  id v3;
  void *v4;

  result = (EncoreService *)qword_2542D8688;
  if (qword_2542D8688)
    return result;
  v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for EncoreService(0)), sel_init);
  v4 = (void *)qword_2542D8688;
  qword_2542D8688 = (uint64_t)v3;

  result = (EncoreService *)qword_2542D8688;
  if (qword_2542D8688)
    return result;
  __break(1u);
  return result;
}

- (EncoreService)init
{
  return (EncoreService *)sub_23A8A1670();
}

- (void)broadcastWithEvent:(id)a3
{
  id v4;
  EncoreService *v5;

  v4 = a3;
  v5 = self;
  sub_23A8A1C24(v4);

}

- (void)echoWithEvent:(id)a3
{
  id v4;
  EncoreService *v5;

  v4 = a3;
  v5 = self;
  sub_23A8A2370(v4);

}

- (void)handleEventWithEvent:(id)a3
{
  id v4;
  EncoreService *v5;

  v4 = a3;
  v5 = self;
  sub_23A8A23D0(v4);

}

- (void)subscribeWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  EncoreService *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_23A8A27D8((uint64_t)sub_23A8A5B30, v5);

  swift_release();
}

- (void)publishWithEvent:(id)a3
{
  id v4;
  EncoreService *v5;

  v4 = a3;
  v5 = self;
  sub_23A8A2948(v4);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v7;
  id v8;
  id v9;
  EncoreService *v10;
  id v11;

  v7 = (void *)objc_opt_self();
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_2569C8AB8);
  objc_msgSend(v9, sel_setExportedInterface_, v11);

  objc_msgSend(v9, sel_setExportedObject_, v10);
  objc_msgSend(v9, sel_resume);

  return 1;
}

- (void)registerWithClient:(id)a3 name:(id)a4 with:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  EncoreService *v12;

  v7 = _Block_copy(a5);
  v8 = sub_23A8A93F0();
  v10 = v9;
  _Block_copy(v7);
  v11 = a3;
  v12 = self;
  sub_23A8A5408((uint64_t)v11, v8, v10, v12, (void (**)(_QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{

  sub_23A8A3CB8(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___EncoreService_eventHandler));
}

@end
