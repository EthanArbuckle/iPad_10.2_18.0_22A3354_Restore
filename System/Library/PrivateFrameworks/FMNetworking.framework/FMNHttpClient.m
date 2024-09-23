@implementation FMNHttpClient

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC12FMNetworking13FMNHttpClient *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1B69A12DC(v10, (uint64_t)v11, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)dealloc
{
  _TtC12FMNetworking13FMNHttpClient *v2;
  objc_super v3;

  v2 = self;
  swift_retain();
  sub_1B69CA128();
  swift_release();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for FMNHttpClient();
  -[FMNHttpClient dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_1B6996708(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler));
  swift_bridgeObjectRelease();
  sub_1B6999FB0((uint64_t)self + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential, &qword_1ED52FCD8);
  swift_release();
  swift_bridgeObjectRelease();

  sub_1B6999FB0((uint64_t)self + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_session, &qword_1ED52FC28);
  swift_release();
}

- (_TtC12FMNetworking13FMNHttpClient)init
{
  _TtC12FMNetworking13FMNHttpClient *result;

  result = (_TtC12FMNetworking13FMNHttpClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
