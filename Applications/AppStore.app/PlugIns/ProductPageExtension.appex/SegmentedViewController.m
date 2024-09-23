@implementation SegmentedViewController

- (void)viewDidLoad
{
  _TtC20ProductPageExtension23SegmentedViewController *v2;

  v2 = self;
  sub_1005C29BC();

}

- (void)didReceiveMemoryWarning
{
  _TtC20ProductPageExtension23SegmentedViewController *v2;

  v2 = self;
  sub_1005C2C20();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension23SegmentedViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1005C2E80(a3);

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double width;
  _TtC20ProductPageExtension23SegmentedViewController *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a4.width;
  swift_unknownObjectRetain(a3);
  v6 = self;
  v7 = sub_1005C5780(width);
  v9 = v8;
  swift_unknownObjectRelease();

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)takeSelectedIndexFrom:(id)a3
{
  id v4;
  objc_class *v5;
  uint64_t v6;
  _TtC20ProductPageExtension23SegmentedViewController *v7;

  v4 = a3;
  v7 = self;
  v5 = (objc_class *)objc_msgSend(v4, "selectedSegmentIndex");
  v6 = *(uint64_t *)((char *)&v7->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension23SegmentedViewController_selectedIndex);
  *(Class *)((char *)&v7->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension23SegmentedViewController_selectedIndex) = v5;
  sub_1005C35BC(v6, (unint64_t)v5);

}

- (void)viewWillLayoutSubviews
{
  _TtC20ProductPageExtension23SegmentedViewController *v2;

  v2 = self;
  sub_1005C42E4();

}

- (_TtC20ProductPageExtension23SegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC20ProductPageExtension23SegmentedViewController *)sub_1005C5388(v5, v7, a4);
}

- (_TtC20ProductPageExtension23SegmentedViewController)initWithCoder:(id)a3
{
  return (_TtC20ProductPageExtension23SegmentedViewController *)sub_1005C552C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23SegmentedViewController_headerBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23SegmentedViewController_headerView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension23SegmentedViewController_segments));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC20ProductPageExtension23SegmentedViewController_multipleScrollObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23SegmentedViewController_selectedViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension23SegmentedViewController_columnViewControllers));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23SegmentedViewController_selectorControl));
}

@end
