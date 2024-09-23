@implementation ProductRatingsHistogramView

- (_TtC8AppStore27ProductRatingsHistogramView)init
{
  return (_TtC8AppStore27ProductRatingsHistogramView *)sub_1003A9D50();
}

- (_TtC8AppStore27ProductRatingsHistogramView)initWithCoder:(id)a3
{
  _TtC8AppStore27ProductRatingsHistogramView *result;

  result = (_TtC8AppStore27ProductRatingsHistogramView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ProductRatingsHistogramView.swift", 42, 2, 65, 0);
  __break(1u);
  return result;
}

- (NSArray)accessibilityStarViews
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8AppStore27ProductRatingsHistogramView_starViews);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore27ProductRatingsHistogramView_starViews, v6, 0, 0);
  v3 = *v2;
  type metadata accessor for RatingView();
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (NSArray)accessibilityProgressBarViews
{
  _TtC8AppStore27ProductRatingsHistogramView *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_1003AAC60();

  sub_100008FE4(0, (unint64_t *)&qword_10082B220, UIView_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (_TtC8AppStore27ProductRatingsHistogramView)initWithFrame:(CGRect)a3
{
  sub_1003278C4((uint64_t)self, (uint64_t)a2, (uint64_t)"AppStore.ProductRatingsHistogramView", 36);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore27ProductRatingsHistogramView_starViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore27ProductRatingsHistogramView_barViews));
}

@end
