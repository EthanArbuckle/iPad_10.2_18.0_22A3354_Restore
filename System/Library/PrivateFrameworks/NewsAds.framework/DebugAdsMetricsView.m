@implementation DebugAdsMetricsView

- (_TtC7NewsAds19DebugAdsMetricsView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsAds19DebugAdsMetricsView_privacyMarkerView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7NewsAds19DebugAdsMetricsView_interactionPresentationDelegate) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsAds19DebugAdsMetricsView_readyDelegate) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[DebugAdsMetricsView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7NewsAds19DebugAdsMetricsView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsAds19DebugAdsMetricsView_privacyMarkerView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7NewsAds19DebugAdsMetricsView_interactionPresentationDelegate) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsAds19DebugAdsMetricsView_readyDelegate) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[DebugAdsMetricsView initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds19DebugAdsMetricsView_privacyMarkerView));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
