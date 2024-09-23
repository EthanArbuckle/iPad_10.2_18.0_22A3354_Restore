@implementation DiscoveryArticleViewController

- (void)dealloc
{
  _TtC15ProximityReader30DiscoveryArticleViewController *v2;

  v2 = self;
  sub_21C308580();
}

- (void).cxx_destruct
{
  sub_21C2D775C((uint64_t)self + OBJC_IVAR____TtC15ProximityReader30DiscoveryArticleViewController_isDismissed, &qword_25525C7A8);
  sub_21C2F7984(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC15ProximityReader30DiscoveryArticleViewController_disappearHandler));
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC15ProximityReader30DiscoveryArticleViewController *v4;

  v3 = a3;
  v4 = self;
  sub_21C3088B8(v3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC15ProximityReader30DiscoveryArticleViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_21C308B90((uint64_t)a4, width, height);
  swift_unknownObjectRelease();

}

- (void)setArticleLayout:(id)a3 animated:(BOOL)a4
{
  id v6;
  _TtC15ProximityReader30DiscoveryArticleViewController *v7;

  v6 = a3;
  v7 = self;
  sub_21C305B0C((uint64_t)v6, a4);

}

- (_TtC15ProximityReader30DiscoveryArticleViewController)initWithItemIdentifier:(id)a3 referrerIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a3)
  {
    v5 = 0;
    v7 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    v10 = 0;
    return (_TtC15ProximityReader30DiscoveryArticleViewController *)sub_21C309CC4(v5, v7, v8, v10);
  }
  v5 = sub_21C3A7ED8();
  v7 = v6;
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v8 = sub_21C3A7ED8();
  v10 = v9;
  return (_TtC15ProximityReader30DiscoveryArticleViewController *)sub_21C309CC4(v5, v7, v8, v10);
}

- (_TtC15ProximityReader30DiscoveryArticleViewController)initWithArticleLayout:(id)a3 referrerIdentifier:(id)a4 cardTemplateInformation:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  if (a4)
  {
    v7 = sub_21C3A7ED8();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = a3;
  v11 = a5;
  return (_TtC15ProximityReader30DiscoveryArticleViewController *)sub_21C309E80(a3, v7, v9, a5);
}

- (_TtC15ProximityReader30DiscoveryArticleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_21C3A7ED8();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC15ProximityReader30DiscoveryArticleViewController *)sub_21C30A020(v5, v7, a4);
}

- (_TtC15ProximityReader30DiscoveryArticleViewController)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader30DiscoveryArticleViewController *)sub_21C30A184(a3);
}

@end
