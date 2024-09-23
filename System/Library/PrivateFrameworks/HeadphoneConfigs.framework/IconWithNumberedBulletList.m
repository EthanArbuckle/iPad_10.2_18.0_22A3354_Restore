@implementation IconWithNumberedBulletList

- (_TtC16HeadphoneConfigs26IconWithNumberedBulletList)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _TtC16HeadphoneConfigs26IconWithNumberedBulletList *result;

  v5 = OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_containerView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v7 = a3;
  v8 = objc_msgSend(v6, sel_init);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v8;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___numberedBulletedList) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___iconView) = 0;

  result = (_TtC16HeadphoneConfigs26IconWithNumberedBulletList *)sub_1DB3BC664();
  __break(1u);
  return result;
}

- (_TtC16HeadphoneConfigs26IconWithNumberedBulletList)initWithFrame:(CGRect)a3
{
  sub_1DB3853B8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___numberedBulletedList));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___iconView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
