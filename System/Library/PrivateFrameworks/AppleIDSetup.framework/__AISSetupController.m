@implementation __AISSetupController

- (__AISSetupController)initWithQueue:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  objc_class *v10;
  char *v11;
  __AISSetupController *v12;
  objc_super v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563E9A18);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2365AFCC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  type metadata accessor for SetupController();
  v8 = swift_allocObject();
  v9 = a3;
  SetupController.init(queue:endpoint:inactiveSession:)(a3, (uint64_t)v6, 0);
  v10 = (objc_class *)type metadata accessor for __SetupController();
  v11 = (char *)objc_allocWithZone(v10);
  *(_QWORD *)&v11[OBJC_IVAR_____AISSetupController_setupController] = v8;
  v14.receiver = v11;
  v14.super_class = v10;
  v12 = -[__AISSetupController init](&v14, sel_init);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v12;
}

- (void)setupWithContext:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  __AISSetupController *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_23650CF34;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_23650A2C0(v8, (uint64_t)v6, v7);
  sub_236450690((uint64_t)v6);

}

- (__AISSetupController)init
{
  __AISSetupController *result;

  result = (__AISSetupController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
