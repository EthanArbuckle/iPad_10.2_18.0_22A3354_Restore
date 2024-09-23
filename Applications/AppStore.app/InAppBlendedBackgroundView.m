@implementation InAppBlendedBackgroundView

- (_TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView *)sub_1002AACCC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002AB5F8();
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView *v3;

  v3 = self;
  sub_1002AB20C((uint64_t)v3, v2);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView_topLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView_bottomLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_0929855FC914B63BD770DBF68A393ACE26InAppBlendedBackgroundView_shadowView));
}

@end
