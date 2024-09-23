@implementation SharePlaySessionDetour

- (_TtC10Blackbeard22SharePlaySessionDetour)init
{
  _TtC10Blackbeard22SharePlaySessionDetour *result;

  result = (_TtC10Blackbeard22SharePlaySessionDetour *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10Blackbeard22SharePlaySessionDetour_dynamicOfferCoordinator));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10Blackbeard22SharePlaySessionDetour_webUserInterfaceCoordinator));
  sub_236E8520C((uint64_t)self + OBJC_IVAR____TtC10Blackbeard22SharePlaySessionDetour_state, type metadata accessor for SharePlaySessionDetour.State);
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  id v15;
  _TtC10Blackbeard22SharePlaySessionDetour *v16;
  id v17;
  _TtC10Blackbeard22SharePlaySessionDetour *v18;
  id v19;
  id v20;
  uint64_t v21;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256792790);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_237320264();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = a5;
  v13[5] = self;
  v13[6] = a3;
  v13[7] = a4;
  v14 = a3;
  v15 = a4;
  v16 = self;
  v17 = a5;
  v18 = v16;
  v19 = v14;
  v20 = v15;
  sub_23700D0E8((uint64_t)v11, (uint64_t)&unk_256792838, (uint64_t)v13);

  swift_release();
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  sub_236EA3B50(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *, void *))sub_236EA33AC);
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  sub_236EA3DBC(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_236EAA830);
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  void *v5;

  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  sub_236EA3DBC(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_236EAAB50);
}

@end
