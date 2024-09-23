@implementation PasscodeEmbeddedParentViewController

- (_TtC10CoreAuthUI36PasscodeEmbeddedParentViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _TtC10CoreAuthUI36PasscodeEmbeddedParentViewController *result;

  v5 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView;
  v6 = type metadata accessor for PasscodeEmbeddedView(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_verifyPasscode);
  *v7 = 0;
  v7[1] = 0;
  v8 = a3;

  result = (_TtC10CoreAuthUI36PasscodeEmbeddedParentViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010006DE50, "CoreAuthUI/PasscodeEmbeddedView.swift", 37, 2, 60, 0);
  __break(1u);
  return result;
}

- (void)loadView
{
  _TtC10CoreAuthUI36PasscodeEmbeddedParentViewController *v2;

  v2 = self;
  sub_10003ACF0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC10CoreAuthUI36PasscodeEmbeddedParentViewController *v9;
  uint64_t v10;
  _TtC10CoreAuthUI36PasscodeEmbeddedParentViewController *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  objc_super v15;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = sub_100025D1C(&qword_100091FC0);
  __chkstk_darwin(v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15.receiver = self;
  v15.super_class = ObjectType;
  v9 = self;
  -[PasscodeEmbeddedParentViewController viewWillAppear:](&v15, "viewWillAppear:", v3);
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  type metadata accessor for MainActor(0);
  v11 = v9;
  v12 = static MainActor.shared.getter();
  v13 = (_QWORD *)swift_allocObject(&unk_10007B5F0, 40, 7);
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v11;
  v14 = sub_10003B510((uint64_t)v8, (uint64_t)&unk_100091708, (uint64_t)v13);
  swift_release(v14);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC10CoreAuthUI36PasscodeEmbeddedParentViewController *v9;
  uint64_t v10;
  _TtC10CoreAuthUI36PasscodeEmbeddedParentViewController *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  objc_super v15;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = sub_100025D1C(&qword_100091FC0);
  __chkstk_darwin(v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15.receiver = self;
  v15.super_class = ObjectType;
  v9 = self;
  -[PasscodeEmbeddedParentViewController viewWillDisappear:](&v15, "viewWillDisappear:", v3);
  if (*((_BYTE *)&v9->super.super.super.isa
       + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_dismissKeyboardOnDissappear) == 1)
  {
    v10 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
    type metadata accessor for MainActor(0);
    v11 = v9;
    v12 = static MainActor.shared.getter();
    v13 = (_QWORD *)swift_allocObject(&unk_10007B5C8, 40, 7);
    v13[2] = v12;
    v13[3] = &protocol witness table for MainActor;
    v13[4] = v11;
    v14 = sub_10003B510((uint64_t)v8, (uint64_t)&unk_100091700, (uint64_t)v13);
    swift_release(v14);
  }

}

- (void)verifyPasscode:(id)a3 reply:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t (*)(char), uint64_t);
  uint64_t v11;
  _TtC10CoreAuthUI36PasscodeEmbeddedParentViewController *v12;
  _TtC10CoreAuthUI36PasscodeEmbeddedParentViewController *v13;

  v5 = _Block_copy(a4);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = swift_allocObject(&unk_10007B5A0, 24, 7);
  *(_QWORD *)(v9 + 16) = v5;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t (*)(char), uint64_t))((char *)&self->super.super.super.isa
                                                                                       + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_verifyPasscode);
  if (v10)
  {
    v11 = *(_QWORD *)&self->passcodeViewController[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_verifyPasscode];
    v12 = self;
    sub_100027180((uint64_t)v10, v11);
    v10(v6, v8, sub_10002BFB8, v9);
    sub_100027EB8((uint64_t)v10, v11);
  }
  else
  {
    v13 = self;
  }
  swift_bridgeObjectRelease(v8);
  swift_release(v9);

}

- (_TtC10CoreAuthUI36PasscodeEmbeddedParentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10CoreAuthUI36PasscodeEmbeddedParentViewController *result;

  v4 = a4;
  result = (_TtC10CoreAuthUI36PasscodeEmbeddedParentViewController *)_swift_stdlib_reportUnimplementedInitializer("CoreAuthUI.PasscodeEmbeddedParentViewController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeViewController));
  sub_10002BD8C((uint64_t)self + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView, &qword_100091608);
  sub_100027EB8(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_verifyPasscode), *(_QWORD *)&self->passcodeViewController[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_verifyPasscode]);
}

@end
