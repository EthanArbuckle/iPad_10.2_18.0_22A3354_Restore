@implementation NotificationBadgeView

- (_TtC7MusicUIP33_046287148865313ED514022F8F54C1CE21NotificationBadgeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21CF70034();
}

- (void)layoutSubviews
{
  _TtC7MusicUIP33_046287148865313ED514022F8F54C1CE21NotificationBadgeView *v2;

  v2 = self;
  sub_21CF7017C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC7MusicUIP33_046287148865313ED514022F8F54C1CE21NotificationBadgeView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_21CF702B8();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC7MusicUIP33_046287148865313ED514022F8F54C1CE21NotificationBadgeView)initWithFrame:(CGRect)a3
{
  sub_21CF70418();
}

- (void).cxx_destruct
{
  sub_21CF70998(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC7MusicUIP33_046287148865313ED514022F8F54C1CE21NotificationBadgeView_style));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7MusicUIP33_046287148865313ED514022F8F54C1CE21NotificationBadgeView_valueLabel));
}

@end
