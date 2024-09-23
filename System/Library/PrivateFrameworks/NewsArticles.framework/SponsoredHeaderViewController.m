@implementation SponsoredHeaderViewController

- (_TtC12NewsArticles29SponsoredHeaderViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC12NewsArticles29SponsoredHeaderViewController *result;

  v5 = OBJC_IVAR____TtC12NewsArticles29SponsoredHeaderViewController_label;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12NewsArticles29SponsoredHeaderViewController_headerDelegate) = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC12NewsArticles29SponsoredHeaderViewController *)sub_1BA0BF3B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  char *v2;
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[SponsoredHeaderViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_addSubview_, *(_QWORD *)&v2[OBJC_IVAR____TtC12NewsArticles29SponsoredHeaderViewController_label]);

  }
  else
  {
    __break(1u);
  }
}

- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4
{
  double width;
  id v7;
  _TtC12NewsArticles29SponsoredHeaderViewController *v8;
  id v9;
  double result;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double Height;
  CGRect v21;

  width = a3.width;
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles29SponsoredHeaderViewController_renderer), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC12NewsArticles29SponsoredHeaderViewController_renderer));
  v7 = a4;
  v8 = self;
  sub_1B9E634A0((char *)v8, width);
  v9 = -[SponsoredHeaderViewController view](v8, sel_view);
  if (v9)
  {
    v11 = v9;
    objc_msgSend(v9, sel_frame);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v21.origin.x = v13;
    v21.origin.y = v15;
    v21.size.width = v17;
    v21.size.height = v19;
    Height = CGRectGetHeight(v21);

    return Height;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC12NewsArticles29SponsoredHeaderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles29SponsoredHeaderViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles29SponsoredHeaderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29SponsoredHeaderViewController_renderer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29SponsoredHeaderViewController_label));
  sub_1B9E30DEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29SponsoredHeaderViewController_headerDelegate);
}

@end
