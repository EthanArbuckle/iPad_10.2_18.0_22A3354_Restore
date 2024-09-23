@implementation CampaignLandingPageViewController

- (_TtC12NewsArticles33CampaignLandingPageViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC12NewsArticles33CampaignLandingPageViewController *result;

  v5 = OBJC_IVAR____TtC12NewsArticles33CampaignLandingPageViewController_isImpressionable;
  sub_1B9FC74EC();
  swift_allocObject();
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1BA0BA238();
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12NewsArticles33CampaignLandingPageViewController_pageDelegate) = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC12NewsArticles33CampaignLandingPageViewController *)sub_1BA0BF3B0();
  __break(1u);
  return result;
}

- (_TtC12NewsArticles33CampaignLandingPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles33CampaignLandingPageViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles33CampaignLandingPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1B9E30DEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles33CampaignLandingPageViewController_pageDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles33CampaignLandingPageViewController_articleViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles33CampaignLandingPageViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles33CampaignLandingPageViewController_urlHandler));
}

- (void)viewDidLoad
{
  _TtC12NewsArticles33CampaignLandingPageViewController *v2;

  v2 = self;
  CampaignLandingPageViewController.viewDidLoad()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v4 = v10.receiver;
  v5 = a3;
  -[CampaignLandingPageViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v5);
  v6 = objc_msgSend(v4, sel_traitCollection, v10.receiver, v10.super_class);
  v7 = objc_msgSend(v4, sel_view);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    objc_msgSend(v8, sel_setBackgroundColor_, v9);

  }
  else
  {
    __break(1u);
  }
}

@end
