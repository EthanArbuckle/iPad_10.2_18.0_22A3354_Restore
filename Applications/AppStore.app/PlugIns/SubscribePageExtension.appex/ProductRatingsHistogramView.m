@implementation ProductRatingsHistogramView

- (_TtC22SubscribePageExtension27ProductRatingsHistogramView)init
{
  return (_TtC22SubscribePageExtension27ProductRatingsHistogramView *)sub_100077CB0();
}

- (_TtC22SubscribePageExtension27ProductRatingsHistogramView)initWithCoder:(id)a3
{
  _TtC22SubscribePageExtension27ProductRatingsHistogramView *result;

  result = (_TtC22SubscribePageExtension27ProductRatingsHistogramView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ProductRatingsHistogramView.swift", 56, 2, 65, 0);
  __break(1u);
  return result;
}

- (NSArray)accessibilityStarViews
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC22SubscribePageExtension27ProductRatingsHistogramView_starViews);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC22SubscribePageExtension27ProductRatingsHistogramView_starViews, v6, 0, 0);
  v3 = *v2;
  type metadata accessor for RatingView();
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (NSArray)accessibilityProgressBarViews
{
  _TtC22SubscribePageExtension27ProductRatingsHistogramView *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_100078BC0();

  sub_100019574(0, (unint64_t *)&qword_1007F3AB0, UIView_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (_TtC22SubscribePageExtension27ProductRatingsHistogramView)initWithFrame:(CGRect)a3
{
  sub_100079114((uint64_t)self, (uint64_t)a2, (uint64_t)"SubscribePageExtension.ProductRatingsHistogramView", 50);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension27ProductRatingsHistogramView_starViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension27ProductRatingsHistogramView_barViews));
}

@end
