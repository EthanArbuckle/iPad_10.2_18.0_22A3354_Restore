@implementation SubscriptionPurchaseViewModel

- (_TtC7MusicUI29SubscriptionPurchaseViewModel)init
{
  sub_21D3E6BE8();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255341578);
  OUTLINED_FUNCTION_1_21(v3);

  swift_unknownObjectRelease();
  swift_release();
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F67510);
  OUTLINED_FUNCTION_1_21(v4);

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7MusicUI29SubscriptionPurchaseViewModel_presentingViewController));
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC7MusicUI29SubscriptionPurchaseViewModel *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_21D3E70A8((uint64_t)v12, v11, (void (*)(_QWORD, id))sub_21D3E7B74, v9, (void (*)(uint64_t, id, id, void (*)(_QWORD, _QWORD), uint64_t, uint64_t))sub_21D57F42C);

  swift_release();
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC7MusicUI29SubscriptionPurchaseViewModel *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_21D3E70A8((uint64_t)v12, v11, (void (*)(_QWORD, id))sub_21D3E7A24, v9, (void (*)(uint64_t, id, id, void (*)(_QWORD, _QWORD), uint64_t, uint64_t))sub_21D57F5B4);

  swift_release();
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC7MusicUI29SubscriptionPurchaseViewModel *v11;

  v8 = _Block_copy(a5);
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_21D3E7470((uint64_t)v11, v10, (void (*)(_QWORD, id))sub_21D3E7B74);

  swift_release();
}

@end
