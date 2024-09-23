@implementation SharedWithYouHeaderViewController

- (_TtC12NewsArticles33SharedWithYouHeaderViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC12NewsArticles33SharedWithYouHeaderViewController *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_headerDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC12NewsArticles33SharedWithYouHeaderViewController *)sub_1BA0BF3B0();
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
  -[SharedWithYouHeaderViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_addSubview_, *(_QWORD *)&v2[OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_attributionView]);

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
  _TtC12NewsArticles33SharedWithYouHeaderViewController *v8;
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
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_renderer), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_renderer));
  v7 = a4;
  v8 = self;
  sub_1BA080904((char *)v8, width);
  v9 = -[SharedWithYouHeaderViewController view](v8, sel_view);
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

- (_TtC12NewsArticles33SharedWithYouHeaderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles33SharedWithYouHeaderViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles33SharedWithYouHeaderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_attributionView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_renderer);
  v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_sharedItem;
  v4 = sub_1BA0BDBD4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_sharedItemManager);
  sub_1B9E30DEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_headerDelegate);
}

@end
