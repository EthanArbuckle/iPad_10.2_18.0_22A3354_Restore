@implementation SegmentedViewController

- (void)viewDidLoad
{
  _TtC22SubscribePageExtension23SegmentedViewController *v2;

  v2 = self;
  sub_100503430();

}

- (void)didReceiveMemoryWarning
{
  _TtC22SubscribePageExtension23SegmentedViewController *v2;

  v2 = self;
  sub_100503694();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension23SegmentedViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1005038F4(a3);

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double width;
  _TtC22SubscribePageExtension23SegmentedViewController *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a4.width;
  swift_unknownObjectRetain(a3);
  v7 = self;
  v8 = sub_1005061F4(width);
  v10 = v9;
  swift_unknownObjectRelease(a3);

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)takeSelectedIndexFrom:(id)a3
{
  id v4;
  objc_class *v5;
  uint64_t v6;
  _TtC22SubscribePageExtension23SegmentedViewController *v7;

  v4 = a3;
  v7 = self;
  v5 = (objc_class *)objc_msgSend(v4, "selectedSegmentIndex");
  v6 = *(uint64_t *)((char *)&v7->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension23SegmentedViewController_selectedIndex);
  *(Class *)((char *)&v7->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension23SegmentedViewController_selectedIndex) = v5;
  sub_100504030(v6, (unint64_t)v5);

}

- (void)viewWillLayoutSubviews
{
  _TtC22SubscribePageExtension23SegmentedViewController *v2;

  v2 = self;
  sub_100504D58();

}

- (_TtC22SubscribePageExtension23SegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC22SubscribePageExtension23SegmentedViewController *)sub_100505DFC(v5, v7, a4);
}

- (_TtC22SubscribePageExtension23SegmentedViewController)initWithCoder:(id)a3
{
  return (_TtC22SubscribePageExtension23SegmentedViewController *)sub_100505FA0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23SegmentedViewController_headerBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23SegmentedViewController_headerView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension23SegmentedViewController_segments));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension23SegmentedViewController_multipleScrollObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23SegmentedViewController_selectedViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension23SegmentedViewController_columnViewControllers));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23SegmentedViewController_selectorControl));
}

@end
