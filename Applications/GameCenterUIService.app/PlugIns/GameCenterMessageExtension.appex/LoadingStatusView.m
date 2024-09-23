@implementation LoadingStatusView

- (UIActivityIndicatorView)activityIndicator
{
  return (UIActivityIndicatorView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC26GameCenterMessageExtension17LoadingStatusView_activityIndicator, a2);
}

- (void)setActivityIndicator:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension17LoadingStatusView_activityIndicator, a3);
}

- (_TtC26GameCenterMessageExtension17LoadingStatusView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension17LoadingStatusView_activityIndicator, 0);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for LoadingStatusView();
  return -[LoadingStatusView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC26GameCenterMessageExtension17LoadingStatusView)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension17LoadingStatusView_activityIndicator, 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for LoadingStatusView();
  return -[LoadingStatusView initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension17LoadingStatusView_activityIndicator, a2);
}

@end
