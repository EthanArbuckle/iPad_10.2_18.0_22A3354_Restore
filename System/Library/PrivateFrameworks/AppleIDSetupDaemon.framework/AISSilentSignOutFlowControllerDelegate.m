@implementation AISSilentSignOutFlowControllerDelegate

- (void)signOutFlowController:(AASignOutFlowController *)a3 showAlertWithTitle:(NSString *)a4 message:(NSString *)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  AASignOutFlowController *v19;
  NSString *v20;
  NSString *v21;
  _TtC18AppleIDSetupDaemon38AISSilentSignOutFlowControllerDelegate *v22;
  uint64_t v23;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542A8E20);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = sub_2366974D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_25641FE70;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_25641FE78;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_236686F00((uint64_t)v13, (uint64_t)&unk_25641FE80, (uint64_t)v18);
  swift_release();
}

- (void)signOutFlowController:(AASignOutFlowController *)a3 disableFindMyDeviceForAccount:(ACAccount *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  AASignOutFlowController *v17;
  ACAccount *v18;
  _TtC18AppleIDSetupDaemon38AISSilentSignOutFlowControllerDelegate *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542A8E20);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_2366974D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25641FE48;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_25641FE50;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_236686F00((uint64_t)v11, (uint64_t)&unk_25641FE58, (uint64_t)v16);
  swift_release();
}

- (void)signOutFlowController:(AASignOutFlowController *)a3 performWalrusValidationForAccount:(ACAccount *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  AASignOutFlowController *v17;
  ACAccount *v18;
  _TtC18AppleIDSetupDaemon38AISSilentSignOutFlowControllerDelegate *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542A8E20);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_2366974D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25641FE20;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_25641FE28;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_236686F00((uint64_t)v11, (uint64_t)&unk_25641FE30, (uint64_t)v16);
  swift_release();
}

- (void)signOutFlowController:(AASignOutFlowController *)a3 signOutAccount:(ACAccount *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  AASignOutFlowController *v17;
  ACAccount *v18;
  _TtC18AppleIDSetupDaemon38AISSilentSignOutFlowControllerDelegate *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542A8E20);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_2366974D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25641FDF0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256421B10;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_236686F00((uint64_t)v11, (uint64_t)&unk_25641FE00, (uint64_t)v16);
  swift_release();
}

- (_TtC18AppleIDSetupDaemon38AISSilentSignOutFlowControllerDelegate)init
{
  _TtC18AppleIDSetupDaemon38AISSilentSignOutFlowControllerDelegate *result;

  result = (_TtC18AppleIDSetupDaemon38AISSilentSignOutFlowControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18AppleIDSetupDaemon38AISSilentSignOutFlowControllerDelegate_accountStore);
}

@end
