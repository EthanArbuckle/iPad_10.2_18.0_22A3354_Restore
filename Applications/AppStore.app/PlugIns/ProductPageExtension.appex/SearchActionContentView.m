@implementation SearchActionContentView

- (_TtC20ProductPageExtension23SearchActionContentView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension23SearchActionContentView *result;

  sub_10049BD64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC20ProductPageExtension23SearchActionContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10049F38C();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension23SearchActionContentView *v2;

  v2 = self;
  sub_10049C45C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23SearchActionContentView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23SearchActionContentView_linkLabel));
  sub_1000340D8((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension23SearchActionContentView_metrics, type metadata accessor for SearchActionContentView.Layout.Metrics);
}

@end
