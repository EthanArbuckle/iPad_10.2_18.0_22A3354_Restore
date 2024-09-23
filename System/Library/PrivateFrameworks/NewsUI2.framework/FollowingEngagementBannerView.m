@implementation FollowingEngagementBannerView

- (_TtC7NewsUI229FollowingEngagementBannerView)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7NewsUI229FollowingEngagementBannerView_engagementView) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[FollowingEngagementBannerView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7NewsUI229FollowingEngagementBannerView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7NewsUI229FollowingEngagementBannerView_engagementView) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[FollowingEngagementBannerView initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI229FollowingEngagementBannerView_engagementView));
}

@end
