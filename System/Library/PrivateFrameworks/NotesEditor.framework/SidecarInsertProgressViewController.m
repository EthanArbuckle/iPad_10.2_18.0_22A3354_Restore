@implementation SidecarInsertProgressViewController

- (_TtC11NotesEditor35SidecarInsertProgressViewController)initWithCoder:(id)a3
{
  sub_1DD90A2FC(a3);
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[SidecarInsertProgressViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_1DD90A3CC();

}

- (void)viewDidLayoutSubviews
{
  _TtC11NotesEditor35SidecarInsertProgressViewController *v2;

  v2 = self;
  sub_1DD90AA1C();

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return 7;
}

- (void)cancelButtonDidTouchUpInsideButton:(void *)a3
{
  void (*v3)(uint64_t);
  id v5;
  uint64_t v6;
  char *v7;

  v3 = *(void (**)(uint64_t))&a1[OBJC_IVAR____TtC11NotesEditor35SidecarInsertProgressViewController_didTapCancel];
  if (v3)
  {
    v5 = a3;
    v7 = a1;
    v6 = sub_1DD907DC8((uint64_t)v3);
    v3(v6);
    sub_1DD8FE450((uint64_t)v3);

  }
}

- (_TtC11NotesEditor35SidecarInsertProgressViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11NotesEditor35SidecarInsertProgressViewController *result;

  v4 = a4;
  result = (_TtC11NotesEditor35SidecarInsertProgressViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC11NotesEditor35SidecarInsertProgressViewController_device);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor35SidecarInsertProgressViewController____lazy_storage___deviceImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor35SidecarInsertProgressViewController____lazy_storage___progressTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor35SidecarInsertProgressViewController____lazy_storage___dividerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor35SidecarInsertProgressViewController____lazy_storage___cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor35SidecarInsertProgressViewController____lazy_storage___stackView));
  sub_1DD8FE450(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11NotesEditor35SidecarInsertProgressViewController_didTapCancel));
}

@end
