@implementation AIHeaderViewController

- (_TtC12NewsArticles22AIHeaderViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _QWORD *v8;
  _TtC12NewsArticles22AIHeaderViewController *result;

  v5 = OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_label;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_channelName);
  *v8 = 0;
  v8[1] = 0;
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_headerDelegate) = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC12NewsArticles22AIHeaderViewController *)sub_1BA0BF3B0();
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
  -[AIHeaderViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_addSubview_, *(_QWORD *)&v2[OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_label]);

  }
  else
  {
    __break(1u);
  }
}

- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4
{
  double width;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC12NewsArticles22AIHeaderViewController *v10;
  id v11;
  double result;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double Height;
  CGRect v23;

  width = a3.width;
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_renderer), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_renderer));
  v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_channelName);
  v8 = *(_QWORD *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_channelName);
  swift_bridgeObjectRetain();
  v9 = a4;
  v10 = self;
  sub_1B9E30100((char *)v10, v7, v8, width);
  swift_bridgeObjectRelease();
  v11 = -[AIHeaderViewController view](v10, sel_view);
  if (v11)
  {
    v13 = v11;
    objc_msgSend(v11, sel_frame);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v23.origin.x = v15;
    v23.origin.y = v17;
    v23.size.width = v19;
    v23.size.height = v21;
    Height = CGRectGetHeight(v23);

    return Height;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC12NewsArticles22AIHeaderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles22AIHeaderViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles22AIHeaderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_label));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_renderer);
  swift_bridgeObjectRelease();
  sub_1B9E30DEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_headerDelegate);
}

@end
