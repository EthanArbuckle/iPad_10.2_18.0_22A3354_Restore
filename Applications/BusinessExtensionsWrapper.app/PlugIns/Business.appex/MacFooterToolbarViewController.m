@implementation MacFooterToolbarViewController

- (_TtC8Business30MacFooterToolbarViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000A7E24();
}

- (void)viewDidLoad
{
  _TtC8Business30MacFooterToolbarViewController *v2;

  v2 = self;
  sub_1000A6774();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MacFooterToolbarViewController();
  v4 = v5.receiver;
  -[MacFooterToolbarViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  objc_msgSend(v4, "becomeFirstResponder", v5.receiver, v5.super_class);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSArray)keyCommands
{
  _TtC8Business30MacFooterToolbarViewController *v2;
  unint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1000A70D4();

  if (v3)
  {
    sub_1000090C8(0, &qword_1000F0C48, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)leftButtonTapped
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  _TtC8Business30MacFooterToolbarViewController *v8;

  v3 = (char *)self + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate);
  if (Strong)
  {
    v5 = Strong;
    v6 = *((_QWORD *)v3 + 1);
    swift_getObjectType(Strong);
    v7 = *(void (**)(void))(v6 + 8);
    v8 = self;
    v7();

    swift_unknownObjectRelease(v5);
  }
}

- (void)rightButtonTapped
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  _TtC8Business30MacFooterToolbarViewController *v8;

  v3 = (char *)self + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate);
  if (Strong)
  {
    v5 = Strong;
    v6 = *((_QWORD *)v3 + 1);
    swift_getObjectType(Strong);
    v7 = *(void (**)(void))(v6 + 16);
    v8 = self;
    v7();

    swift_unknownObjectRelease(v5);
  }
}

- (void)dismissButtonTapped
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  _TtC8Business30MacFooterToolbarViewController *v8;

  v3 = (char *)self + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate);
  if (Strong)
  {
    v5 = Strong;
    v6 = *((_QWORD *)v3 + 1);
    swift_getObjectType(Strong);
    v7 = *(void (**)(void))(v6 + 24);
    v8 = self;
    v7();

    swift_unknownObjectRelease(v5);
  }
}

- (_TtC8Business30MacFooterToolbarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Business30MacFooterToolbarViewController *result;

  v4 = a4;
  result = (_TtC8Business30MacFooterToolbarViewController *)_swift_stdlib_reportUnimplementedInitializer("Business.MacFooterToolbarViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_footerToolbarModel));
  sub_100011A64((uint64_t)self + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macFooterToolbarStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macLeftButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macRightButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macDismissButton));
}

@end
