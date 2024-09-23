@implementation BrowseTileViewController

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI24BrowseTileViewController *v2;

  v2 = self;
  sub_1A980A6F8();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BrowseTileViewController();
  v2 = v3.receiver;
  -[BrowseTileViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_1A980AA4C();

}

- (_TtC18HealthExperienceUI24BrowseTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC18HealthExperienceUI24BrowseTileViewController *)BrowseTileViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18HealthExperienceUI24BrowseTileViewController)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI24BrowseTileViewController *)BrowseTileViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1A980D878((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_context, (unint64_t *)&qword_1ED27C440, (uint64_t)&qword_1ED27C430, (uint64_t)&protocol descriptor for FeedItemViewControllerContext);
  sub_1A980D550((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_sectionContext);
  sub_1A980D6D0(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), (int)*(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), *(void **)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), *(void **)((char *)&self->super._view + OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), *(void **)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), *(unint64_t *)((char *)&self->super._tab+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), *(unint64_t *)((char *)&self->super._tabElement+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), *(void **)((char *)&self->super._navigationItem+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle), *(uint64_t *)((char *)&self->super._toolbarItems+ OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle),
    *(uint64_t *)((char *)&self->super._title
               + OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_currentStyle));
  sub_1A980D878((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_contentProvider, &qword_1ED27C228, (uint64_t)&unk_1ED27C220, (uint64_t)&protocol descriptor for BrowseTileContentProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24BrowseTileViewController_contentView));
}

@end
