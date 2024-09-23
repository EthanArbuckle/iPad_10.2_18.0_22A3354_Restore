@implementation ProductRatingsHistogramView

- (_TtC20ProductPageExtension27ProductRatingsHistogramView)init
{
  return (_TtC20ProductPageExtension27ProductRatingsHistogramView *)sub_100083BF0();
}

- (_TtC20ProductPageExtension27ProductRatingsHistogramView)initWithCoder:(id)a3
{
  _TtC20ProductPageExtension27ProductRatingsHistogramView *result;

  result = (_TtC20ProductPageExtension27ProductRatingsHistogramView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ProductRatingsHistogramView.swift", 54, 2, 65, 0);
  __break(1u);
  return result;
}

- (NSArray)accessibilityStarViews
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC20ProductPageExtension27ProductRatingsHistogramView_starViews);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC20ProductPageExtension27ProductRatingsHistogramView_starViews, v6, 0, 0);
  v3 = *v2;
  type metadata accessor for RatingView();
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (NSArray)accessibilityProgressBarViews
{
  _TtC20ProductPageExtension27ProductRatingsHistogramView *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_100084B00();

  sub_100018B6C(0, (unint64_t *)&qword_10080B7F0, UIView_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (_TtC20ProductPageExtension27ProductRatingsHistogramView)initWithFrame:(CGRect)a3
{
  sub_100068FF4((uint64_t)self, (uint64_t)a2, (uint64_t)"ProductPageExtension.ProductRatingsHistogramView", 48);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension27ProductRatingsHistogramView_starViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension27ProductRatingsHistogramView_barViews));
}

@end
