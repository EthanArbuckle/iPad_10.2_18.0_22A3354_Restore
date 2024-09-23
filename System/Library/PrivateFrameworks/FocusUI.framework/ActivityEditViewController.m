@implementation ActivityEditViewController

- (_TtC7FocusUI26ActivityEditViewController)initWithActivityDescription:(id)a3
{
  _QWORD *v3;
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_visibleHeight) = (Class)0x4084000000000000;
  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock);
  *v3 = 0;
  v3[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_activityDescription) = (Class)a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivityEditViewController();
  swift_unknownObjectRetain();
  return -[ActivityEditViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, 0, 0);
}

- (_TtC7FocusUI26ActivityEditViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC7FocusUI26ActivityEditViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_visibleHeight) = (Class)0x4084000000000000;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC7FocusUI26ActivityEditViewController *)sub_214794858();
  __break(1u);
  return result;
}

- (double)visibleHeight
{
  return *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_visibleHeight);
}

- (id)willDisappearBlock
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21479282C;
  aBlock[3] = &block_descriptor_13;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setWillDisappearBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_214794004;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_214792030(v7);
}

- (void)viewDidLoad
{
  _TtC7FocusUI26ActivityEditViewController *v2;

  v2 = self;
  ActivityEditViewController.viewDidLoad()();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v4;
  id v5;
  void (*v6)(_QWORD *);
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ActivityEditViewController();
  v4 = v8.receiver;
  v5 = -[ActivityEditViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
  v6 = (void (*)(_QWORD *))(*(uint64_t (**)(id))((*MEMORY[0x24BEE4EA0] & *v4) + 0x70))(v5);
  if (v6)
  {
    v7 = (uint64_t)v6;
    v6(v4);
    sub_214792030(v7);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7FocusUI26ActivityEditViewController *v4;

  v4 = self;
  ActivityEditViewController.viewWillAppear(_:)(a3);

}

- (void)handleTap:(id)a3
{
  -[ActivityEditViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC7FocusUI26ActivityEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7FocusUI26ActivityEditViewController *result;

  v4 = a4;
  result = (_TtC7FocusUI26ActivityEditViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_214792030(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock));
}

@end
