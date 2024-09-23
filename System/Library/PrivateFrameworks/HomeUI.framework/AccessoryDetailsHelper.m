@implementation AccessoryDetailsHelper

- (void)editRoomViewControllerDidFinish:(id)a3 withNewRoom:(id)a4
{
  void (*v4)(id);
  id v7;
  id v8;
  _TtC6HomeUI22AccessoryDetailsHelper *v9;

  v4 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtC6HomeUI22AccessoryDetailsHelper_roomEditorDidFinish);
  if (v4)
  {
    v7 = a3;
    v8 = a4;
    v9 = self;
    sub_1B8ED4C10((uint64_t)v4);
    v4(a4);
    sub_1B8E6FE50((uint64_t)v4);

  }
}

- (_TtC6HomeUI22AccessoryDetailsHelper)init
{
  _TtC6HomeUI22AccessoryDetailsHelper *result;

  result = (_TtC6HomeUI22AccessoryDetailsHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);

  swift_bridgeObjectRelease();
  sub_1B8E6FE50(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC6HomeUI22AccessoryDetailsHelper_roomEditorDidFinish));

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC6HomeUI22AccessoryDetailsHelper_suggestedAutomationsViewCoordinator);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6HomeUI22AccessoryDetailsHelper_suggestedAutomationsViewController));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC6HomeUI22AccessoryDetailsHelper_suggestedAutomationsViewRepresentable);

  swift_unknownObjectRelease();
  v4 = (char *)self + OBJC_IVAR____TtC6HomeUI22AccessoryDetailsHelper__canAddKeyToWallet;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF20EBE8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = (char *)self + OBJC_IVAR____TtC6HomeUI22AccessoryDetailsHelper__existingSceneCount;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF20EBF0);
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR____TtC6HomeUI22AccessoryDetailsHelper__suggestedSceneCount, v7);
}

@end
