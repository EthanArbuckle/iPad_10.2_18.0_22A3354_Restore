@implementation SearchActionContentView

- (_TtC22SubscribePageExtension23SearchActionContentView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension23SearchActionContentView *result;

  sub_100532AD8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC22SubscribePageExtension23SearchActionContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005360E0();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension23SearchActionContentView *v2;

  v2 = self;
  sub_1005331D0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23SearchActionContentView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23SearchActionContentView_linkLabel));
  sub_10002F0D4((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension23SearchActionContentView_metrics, type metadata accessor for SearchActionContentView.Layout.Metrics);
}

@end
