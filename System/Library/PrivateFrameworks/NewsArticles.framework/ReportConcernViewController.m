@implementation ReportConcernViewController

- (_TtC12NewsArticles27ReportConcernViewController)initWithCoder:(id)a3
{
  _TtC12NewsArticles27ReportConcernViewController *result;

  result = (_TtC12NewsArticles27ReportConcernViewController *)sub_1BA0BF3B0();
  __break(1u);
  return result;
}

- (_TtC12NewsArticles27ReportConcernViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles27ReportConcernViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles27ReportConcernViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ReportConcernViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles27ReportConcernViewController_blueprintViewController));
}

- (void)viewDidLoad
{
  _TtC12NewsArticles27ReportConcernViewController *v2;

  v2 = self;
  sub_1B9EE4DD0();

}

- (void)viewWillLayoutSubviews
{
  _TtC12NewsArticles27ReportConcernViewController *v2;

  v2 = self;
  sub_1B9EE5128();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v7.receiver;
  -[ReportConcernViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1B9EE58E0();

}

- (void)dismissVC
{
  _QWORD *v3;
  uint64_t v4;
  _TtC12NewsArticles27ReportConcernViewController *v5;
  id v6;

  v3 = __swift_project_boxed_opaque_existential_1(*(_QWORD **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles27ReportConcernViewController_eventHandler)+ 6, (*(_QWORD **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles27ReportConcernViewController_eventHandler))[9]);
  v4 = MEMORY[0x1BCCD5CF8](*v3 + 16);
  if (v4)
  {
    v6 = (id)v4;
    v5 = self;
    objc_msgSend(v6, sel_dismissViewControllerAnimated_completion_, 1, 0);

  }
}

@end
