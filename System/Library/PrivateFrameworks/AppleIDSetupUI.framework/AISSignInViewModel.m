@implementation AISSignInViewModel

- (UIImage)headerImage
{
  return (UIImage *)(id)sub_2366DEE28();
}

- (_TtC14AppleIDSetupUI18AISSignInViewModel)init
{
  _TtC14AppleIDSetupUI18AISSignInViewModel *result;

  result = (_TtC14AppleIDSetupUI18AISSignInViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14AppleIDSetupUI18AISSignInViewModel_contextProvider);
  swift_unknownObjectRelease();

}

- (void)signInViewControllerDidCancel:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC14AppleIDSetupUI18AISSignInViewModel *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  v5 = sub_236736790();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  sub_23673670C();
  v11 = sub_236736784();
  v12 = sub_236737474();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2366B5000, v11, v12, "AISSignInViewModel: signInViewControllerDidCancel", v13, 2u);
    MEMORY[0x23B7F8CC0](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4 completionHandler:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC14AppleIDSetupUI18AISSignInViewModel *v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564278A0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = sub_236737288();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v11;
  v14 = sub_236737438();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v10, 1, 1, v14);
  sub_236737414();
  v15 = self;
  v16 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  v17 = sub_236737408();
  v18 = (_QWORD *)swift_allocObject();
  v19 = MEMORY[0x24BEE6930];
  v18[2] = v17;
  v18[3] = v19;
  v18[4] = v12;
  v18[5] = v15;
  v18[6] = sub_2366DF194;
  v18[7] = v13;
  sub_2366D1900((uint64_t)v10, (uint64_t)&unk_256427E48, (uint64_t)v18);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)willAuthenticateWithContext:(id)a3
{
  id v4;
  _TtC14AppleIDSetupUI18AISSignInViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_2366DEF84(v4);

}

- (id)authenticationContext
{
  _TtC14AppleIDSetupUI18AISSignInViewModel *v2;
  id v3;

  v2 = self;
  v3 = sub_2366DEAC0();

  return v3;
}

@end
