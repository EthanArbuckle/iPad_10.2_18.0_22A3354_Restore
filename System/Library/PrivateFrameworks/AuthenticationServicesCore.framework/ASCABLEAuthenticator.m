@implementation ASCABLEAuthenticator

- (_TtC26AuthenticationServicesCore20ASCABLEAuthenticator)initWithCaBLEURL:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  id v11;
  id v12;
  _TtC26AuthenticationServicesCore20ASCABLEAuthenticator *v13;
  _TtC26AuthenticationServicesCore20ASCABLEAuthenticator *v14;
  _BYTE v16[16];

  v4 = sub_20E6E9BC0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v16[-v9];
  sub_20E6E9B78();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 16))(v8, v10, v4);
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBB218]), sel_init);
  v12 = objc_allocWithZone((Class)type metadata accessor for ASCABLEAuthenticator());
  sub_20E6705C4((uint64_t)v8, v11);
  v14 = v13;
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v10, v4);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v14;
}

- (void)startWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  void (**v6)(uint64_t, uint64_t);
  uint64_t v7;
  _TtC26AuthenticationServicesCore20ASCABLEAuthenticator *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (void (**)(uint64_t, uint64_t))((char *)self
                                              + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_completionHandler);
  v7 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_completionHandler);
  *v6 = sub_20E67BB78;
  v6[1] = (void (*)(uint64_t, uint64_t))v5;
  v8 = self;
  swift_retain();
  sub_20E67BADC(v7);
  sub_20E670F00(0);
  objc_msgSend(*(id *)((char *)&v8->super.isa + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_powerLogger), sel_logAuthenticationStartedEventIfNeeded);

  swift_release();
}

- (void)sendExcludedCredentialMatchError
{
  _TtC26AuthenticationServicesCore20ASCABLEAuthenticator *v2;

  v2 = self;
  sub_20E66F170();

}

- (void)finishTransactionWithCredential:(id)a3 error:(id)a4
{
  _TtC26AuthenticationServicesCore20ASCABLEAuthenticator *v7;
  id v8;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = a4;
  sub_20E66F610((uint64_t)a3, a4);
  swift_unknownObjectRelease();

}

- (void)dealloc
{
  void *v2;
  _TtC26AuthenticationServicesCore20ASCABLEAuthenticator *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_bluetoothAdvertiser);
  v3 = self;
  objc_msgSend(v2, sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for ASCABLEAuthenticator();
  -[ASCABLEAuthenticator dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  _BYTE v3[224];

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_bluetoothAdvertiser));
  sub_20E67BD44((uint64_t)self + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_advertisement, &qword_254A2E330);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_webSocket));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_apsConnection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_apsWrapper));
  sub_20E67BADC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_completionHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_powerLogger));
  sub_20E67B910((uint64_t)self + OBJC_IVAR____TtC26AuthenticationServicesCore20ASCABLEAuthenticator_currentCTAPCommand, (uint64_t)v3, &qword_254A2DFC0);
  sub_20E67800C((uint64_t)v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_20E678088);
  swift_release();
}

- (_TtC26AuthenticationServicesCore20ASCABLEAuthenticator)init
{
  _TtC26AuthenticationServicesCore20ASCABLEAuthenticator *result;

  result = (_TtC26AuthenticationServicesCore20ASCABLEAuthenticator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
