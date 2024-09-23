@implementation BadgeablePlayerPhotoView

- (_TtC12GameCenterUI24BadgeablePlayerPhotoView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI24BadgeablePlayerPhotoView *)sub_1AB6AC374(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI24BadgeablePlayerPhotoView *v2;

  v2 = self;
  sub_1AB6AC7E4();

}

- (_TtC12GameCenterUI24BadgeablePlayerPhotoView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB6AC89C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI24BadgeablePlayerPhotoView_photoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI24BadgeablePlayerPhotoView_badgeContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI24BadgeablePlayerPhotoView_badgeLabel));
}

@end
