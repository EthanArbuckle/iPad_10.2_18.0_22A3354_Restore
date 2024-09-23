@implementation PrivacyAuthenticatorWrapper

- (void)dealloc
{
  void *v2;
  objc_class *ObjectType;
  _TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper *v5;
  objc_super v6;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper_authenticator);
  if (v2)
  {
    ObjectType = (objc_class *)swift_getObjectType();
    v5 = self;
    objc_msgSend(v2, sel_invalidate);
    objc_msgSend(v2, sel_setDelegate_, 0);
    v6.receiver = v5;
    v6.super_class = ObjectType;
    -[PrivacyAuthenticatorWrapper dealloc](&v6, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper_authenticator));
  sub_22F8847A8((uint64_t)self + OBJC_IVAR____TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper_delegate);
}

- (_TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper)init
{
  _TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper *result;

  result = (_TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  _TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper *v8;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  v8 = self;
  sub_22F9741E8(var0, var1);

}

- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4
{
  id v6;
  _TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper *v7;

  v6 = a3;
  v7 = self;
  sub_22F9751EC(a4);

}

- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  uint64_t (*v8)(uint64_t);
  uint64_t (*v9)();
  uint64_t (*v10)();
  uint64_t v11;
  id v12;
  _TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper *v13;

  v8 = (uint64_t (*)(uint64_t))_Block_copy(a4);
  v9 = (uint64_t (*)())_Block_copy(a5);
  v10 = v9;
  if (!v8)
  {
    v11 = 0;
    if (!v9)
      goto LABEL_5;
    goto LABEL_3;
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  v8 = (uint64_t (*)(uint64_t))sub_22F9757B8;
  if (v10)
  {
LABEL_3:
    *(_QWORD *)(swift_allocObject() + 16) = v10;
    v10 = sub_22F9757A8;
  }
LABEL_5:
  v12 = a3;
  v13 = self;
  sub_22F9753AC(a3, v8, v11);
  sub_22F87A9B8((uint64_t)v10);
  sub_22F87A9B8((uint64_t)v8);

}

- (void)presentPassphraseViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void (*v13)(uint64_t, unint64_t);
  void (*v14)(uint64_t, unint64_t);
  uint64_t v15;
  id v16;
  _TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255E206E0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = (void (*)(uint64_t, unint64_t))_Block_copy(a5);
  v14 = v13;
  if (v12)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v12;
    v12 = sub_22F9741D4;
    if (!v14)
      goto LABEL_5;
    goto LABEL_3;
  }
  if (v13)
  {
LABEL_3:
    *(_QWORD *)(swift_allocObject() + 16) = v14;
    v14 = sub_22F9741CC;
  }
LABEL_5:
  v15 = qword_255E1DB28;
  v16 = a3;
  v17 = self;
  if (v15 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v9, (uint64_t)qword_255E29628);
  sub_22F87ABDC(v18, (uint64_t)v11, (uint64_t *)&unk_255E206E0);
  v19 = sub_22F98DAA4();
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v11, 1, v19) == 1)
  {
    sub_22F87BC50((uint64_t)v11);
  }
  else
  {
    sub_22F863858((uint64_t)v17, 0xD00000000000003BLL, 0x800000022F9A3B50, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v11, v19);
  }
  sub_22F87A9B8((uint64_t)v14);
  sub_22F87A9B8((uint64_t)v12);

}

- (void)dismissPasscodeViewController
{
  _TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper *v2;

  v2 = self;
  sub_22F973648();

}

- (void)dismissPassphraseViewController
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC19ContactlessReaderUI27PrivacyAuthenticatorWrapper *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255E206E0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = qword_255E1DB28;
  v7 = self;
  if (v6 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v3, (uint64_t)qword_255E29628);
  sub_22F87ABDC(v8, (uint64_t)v5, (uint64_t *)&unk_255E206E0);
  v9 = sub_22F98DAA4();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v5, 1, v9) == 1)
  {
    sub_22F87BC50((uint64_t)v5);
  }
  else
  {
    sub_22F863858((uint64_t)v7, 0xD000000000000021, 0x800000022F9A3B00, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v9);
  }

}

@end
