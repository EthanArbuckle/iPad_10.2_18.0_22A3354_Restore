@implementation AISAppleIDAuthContextProvider

- (_TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider)init
{
  _TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider *result;

  result = (_TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider_presentingViewController));
  sub_2366BDBF0((uint64_t)self + OBJC_IVAR____TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider_delegate);
}

- (void)contextDidPresentLoginAlertController:(id)a3
{
  id v4;
  _TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider *v5;

  v4 = a3;
  v5 = self;
  sub_23670C0C0();

}

- (void)contextWillDismissLoginAlertController:(id)a3
{
  id v4;
  _TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider *v5;

  v4 = a3;
  v5 = self;
  sub_23670C1EC();

}

- (void)contextDidDismissLoginAlertController:(id)a3
{
  id v4;
  _TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider *v5;

  v4 = a3;
  v5 = self;
  sub_23670C318();

}

- (void)contextWillBeginPresentingSecondaryUI:(id)a3
{
  id v4;
  _TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider *v5;

  v4 = a3;
  v5 = self;
  sub_23670C444();

}

- (void)contextDidEndPresentingSecondaryUI:(id)a3
{
  id v4;
  _TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider *v5;

  v4 = a3;
  v5 = self;
  sub_23670C570();

}

- (id)remoteUIStyle
{
  return (id)sub_23670C69C();
}

- (void)willPresentModalNavigationController:(id)a3
{
  id v4;
  _TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider *v5;

  v4 = a3;
  v5 = self;
  sub_23670C788();

}

- (void)signAdditionalHeadersWithRequest:(NSMutableURLRequest *)a3 withCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSMutableURLRequest *v15;
  _TtC14AppleIDSetupUI29AISAppleIDAuthContextProvider *v16;
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
  v13[4] = &unk_2564295A8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2564295B0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_236723C18((uint64_t)v9, (uint64_t)&unk_25642A160, (uint64_t)v14);
  swift_release();
}

@end
