@implementation InterludeViewController

- (_TtC7NewsUI223InterludeViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC7NewsUI223InterludeViewController *result;

  v5 = OBJC_IVAR____TtC7NewsUI223InterludeViewController_contentView;
  v6 = objc_allocWithZone((Class)type metadata accessor for InterludeContentView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC7NewsUI223InterludeViewController_animationContainer;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsUI223InterludeViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC7NewsUI223InterludeViewController *v2;

  v2 = self;
  sub_1D6C7D830();

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  -[InterludeViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_1D6302E64(*(char **)&v2[OBJC_IVAR____TtC7NewsUI223InterludeViewController_contentView]);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v4 = (char *)v10.receiver;
  -[InterludeViewController viewDidAppear:](&v10, sel_viewDidAppear_, v3);
  v5 = __swift_project_boxed_opaque_existential_1(&v4[OBJC_IVAR____TtC7NewsUI223InterludeViewController_animator], *(_QWORD *)&v4[OBJC_IVAR____TtC7NewsUI223InterludeViewController_animator + 24]);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  v7 = *v5;
  v8 = v4;
  if ((sub_1D626C814(v8) & 1) != 0)
  {
    v9 = *(_QWORD *)(v7 + 56);
    *(_QWORD *)(v7 + 56) = sub_1D6C7DC4C;
    *(_QWORD *)(v7 + 64) = v6;
    sub_1D5FAE038(v9);
    swift_retain();
    sub_1D626B8FC(v8);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)&v8[OBJC_IVAR____TtC7NewsUI223InterludeViewController_eventHandler] + 16), *(_QWORD *)(*(_QWORD *)&v8[OBJC_IVAR____TtC7NewsUI223InterludeViewController_eventHandler] + 40));
    sub_1D69679B0();
  }

  swift_release();
}

- (_TtC7NewsUI223InterludeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI223InterludeViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI223InterludeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223InterludeViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223InterludeViewController_animationContainer));
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223InterludeViewController_renderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223InterludeViewController_animator);
}

@end
