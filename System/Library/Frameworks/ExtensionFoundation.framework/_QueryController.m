@implementation _QueryController

- (void)dealloc
{
  _TtC19ExtensionFoundationP33_CDD6639443F09112848BD34A3597427C16_QueryController *v2;

  v2 = self;
  sub_190C99718();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ExtensionFoundationP33_CDD6639443F09112848BD34A3597427C16_QueryController_controller));
  swift_release();
}

- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(uint64_t, char *);
  id v11;
  _TtC19ExtensionFoundationP33_CDD6639443F09112848BD34A3597427C16_QueryController *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE20A8B8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_190C7F614();
  sub_190CA8B3C();
  v10 = *(void (**)(uint64_t, char *))((char *)&self->super.isa
                                               + OBJC_IVAR____TtC19ExtensionFoundationP33_CDD6639443F09112848BD34A3597427C16_QueryController_handler);
  v11 = a3;
  v12 = self;
  v13 = objc_msgSend(v11, sel_extensionIdentities);
  v14 = sub_190CA86BC();

  v10(v14, v9);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (NSString)description
{
  void *v2;
  _TtC19ExtensionFoundationP33_CDD6639443F09112848BD34A3597427C16_QueryController *v3;
  id v4;
  id v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19ExtensionFoundationP33_CDD6639443F09112848BD34A3597427C16_QueryController_controller);
  v3 = self;
  v4 = v2;
  v5 = objc_msgSend(v4, sel_description);
  sub_190CA85F0();

  v6 = (void *)sub_190CA85D8();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC19ExtensionFoundationP33_CDD6639443F09112848BD34A3597427C16_QueryController)init
{
  _TtC19ExtensionFoundationP33_CDD6639443F09112848BD34A3597427C16_QueryController *result;

  result = (_TtC19ExtensionFoundationP33_CDD6639443F09112848BD34A3597427C16_QueryController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
