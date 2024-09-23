@implementation SignInOptionChildSetupController

- (_TtC14AppleIDSetupUI32SignInOptionChildSetupController)init
{
  _TtC14AppleIDSetupUI32SignInOptionChildSetupController *result;

  result = (_TtC14AppleIDSetupUI32SignInOptionChildSetupController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI32SignInOptionChildSetupController_childFlowPresenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI32SignInOptionChildSetupController_aidaOwnersManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI32SignInOptionChildSetupController_aidaSignInController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI32SignInOptionChildSetupController_cdpUIController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI32SignInOptionChildSetupController_navController));
}

- (void)setupPerformAIDASignInWith:(NSDictionary *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSDictionary *v15;
  _TtC14AppleIDSetupUI32SignInOptionChildSetupController *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564278A0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_236737438();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25642A1A0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25642A1A8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_236723C18((uint64_t)v9, (uint64_t)&unk_25642A1B0, (uint64_t)v14);
  swift_release();
}

- (void)setupPasscodeForAccount:(ACAccount *)a3 nextTaskInfo:(AISFlowTaskInfoProtocol *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  ACAccount *v17;
  _TtC14AppleIDSetupUI32SignInOptionChildSetupController *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564278A0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_236737438();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25642A180;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_25642A188;
  v16[5] = v15;
  v17 = a3;
  swift_unknownObjectRetain();
  v18 = self;
  sub_236723C18((uint64_t)v11, (uint64_t)&unk_25642A190, (uint64_t)v16);
  swift_release();
}

- (void)setupLocationServicesWithNextTaskInfo:(AISFlowTaskInfoProtocol *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC14AppleIDSetupUI32SignInOptionChildSetupController *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564278A0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_236737438();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25642A140;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2564295B0;
  v14[5] = v13;
  swift_unknownObjectRetain();
  v15 = self;
  sub_236723C18((uint64_t)v9, (uint64_t)&unk_25642A160, (uint64_t)v14);
  swift_release();
}

- (void)childSetupPresenter:(id)a3 didCompleteWithResult:(id)a4
{
  id v6;
  id v7;
  _TtC14AppleIDSetupUI32SignInOptionChildSetupController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_236723EB4();

}

- (void)childSetupPresenter:(id)a3 didFail:(id)a4
{
  id v6;
  _TtC14AppleIDSetupUI32SignInOptionChildSetupController *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_23672423C(v8);

}

@end
