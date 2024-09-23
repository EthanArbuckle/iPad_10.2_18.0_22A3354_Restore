@implementation SearchActionContentView

- (_TtC8AppStore23SearchActionContentView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore23SearchActionContentView *result;

  sub_100399350(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC8AppStore23SearchActionContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10039CD8C();
}

- (void)layoutSubviews
{
  _TtC8AppStore23SearchActionContentView *v2;

  v2 = self;
  sub_100399A48();

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23SearchActionContentView_linkLabel));
  sub_10005C8DC((uint64_t)self + OBJC_IVAR____TtC8AppStore23SearchActionContentView_metrics, type metadata accessor for SearchActionContentView.Layout.Metrics);
}

@end
