@implementation OBKStyleBulletListItemView

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for OBKStyleBulletListItemView();
  v4 = a3;
  v5 = v6.receiver;
  -[OBKStyleBulletListItemView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v5, sel_setNeedsUpdateConstraints, v6.receiver, v6.super_class);

}

- (_TtC18HealthExperienceUI26OBKStyleBulletListItemView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s18HealthExperienceUI26OBKStyleBulletListItemViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)updateConstraints
{
  _TtC18HealthExperienceUI26OBKStyleBulletListItemView *v2;

  v2 = self;
  sub_1A9A5C55C();

}

- (void)buttonWasTapped
{
  _TtC18HealthExperienceUI26OBKStyleBulletListItemView *v2;

  v2 = self;
  sub_1A9A5C960();

}

- (_TtC18HealthExperienceUI26OBKStyleBulletListItemView)initWithFrame:(CGRect)a3
{
  _TtC18HealthExperienceUI26OBKStyleBulletListItemView *result;

  result = (_TtC18HealthExperienceUI26OBKStyleBulletListItemView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI26OBKStyleBulletListItemView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI26OBKStyleBulletListItemView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI26OBKStyleBulletListItemView_descriptionLabel));
  sub_1A97F2724(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI26OBKStyleBulletListItemView_buttonConfiguration), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI26OBKStyleBulletListItemView_buttonConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI26OBKStyleBulletListItemView_button));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
