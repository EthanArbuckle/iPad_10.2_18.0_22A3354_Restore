@implementation EmailSignupViewController

- (_TtC7NewsUI225EmailSignupViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D60FD728();
}

- (void)viewDidLoad
{
  _TtC7NewsUI225EmailSignupViewController *v2;

  v2 = self;
  sub_1D60FB7CC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC7NewsUI225EmailSignupViewController *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1D5E847C4(0, &qword_1ED5FAB68, (uint64_t (*)(uint64_t))MEMORY[0x1E0DB7898], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v13 - v7;
  v13.receiver = self;
  v13.super_class = ObjectType;
  v9 = self;
  -[EmailSignupViewController viewDidAppear:](&v13, sel_viewDidAppear_, v3);
  v10 = *(_QWORD *)((char *)&v9->super.super._responderFlags
                  + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_eventHandler);
  v11 = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v10 + 64))(v11, v10);
  v12 = sub_1D6E1D2E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v8, 1, 1, v12);
  sub_1D6E2081C();
  sub_1D60FDA88((uint64_t)v8);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  uint64_t ObjectType;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  -[EmailSignupViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_eventHandler + 8];
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v5 + 72))(ObjectType, v5);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  uint64_t ObjectType;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  -[EmailSignupViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  if (objc_msgSend(v4, sel_isBeingDismissed, v7.receiver, v7.super_class))
  {
    v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_eventHandler + 8];
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v5 + 56))(ObjectType, v5);
  }

}

- (void)signup
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _TtC7NewsUI225EmailSignupViewController *v6;

  v3 = *(_QWORD *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_eventHandler);
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 40);
  v6 = self;
  v5(ObjectType, v3);

}

- (void)notNow
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _TtC7NewsUI225EmailSignupViewController *v6;

  v3 = *(_QWORD *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_eventHandler);
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 48);
  v6 = self;
  v5(ObjectType, v3);

}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI225EmailSignupViewController *v2;

  v2 = self;
  sub_1D60FC430();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  char *v5;
  id v6;
  char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = (char *)v8.receiver;
  -[EmailSignupViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_obController], sel_headerView, v8.receiver, v8.super_class);
  v7 = v5;
  sub_1D60FD8A0(v6, (uint64_t)v7, v7);

}

- (_TtC7NewsUI225EmailSignupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI225EmailSignupViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI225EmailSignupViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5E8D20C((uint64_t)self + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_model, type metadata accessor for EmailSignupViewModel);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_obController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_micaView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_contentViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_signupButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_notNowButton));
}

@end
