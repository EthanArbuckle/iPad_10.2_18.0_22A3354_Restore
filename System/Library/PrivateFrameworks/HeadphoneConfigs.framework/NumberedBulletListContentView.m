@implementation NumberedBulletListContentView

- (_TtC16HeadphoneConfigs29NumberedBulletListContentView)initWithCoder:(id)a3
{
  id v4;
  _TtC16HeadphoneConfigs29NumberedBulletListContentView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___stackView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___titleView) = 0;
  v4 = a3;

  result = (_TtC16HeadphoneConfigs29NumberedBulletListContentView *)sub_1DB3BC664();
  __break(1u);
  return result;
}

- (_TtC16HeadphoneConfigs29NumberedBulletListContentView)initWithFrame:(CGRect)a3
{
  sub_1DB3853B8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___titleView));
  swift_bridgeObjectRelease();
}

@end
