@implementation ButtonCollectionViewCell

- (_TtC18HealthExperienceUI24ButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI24ButtonCollectionViewCell *)sub_1A974C054(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI24ButtonCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s18HealthExperienceUI24ButtonCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)didTapButton:(id)a3
{
  _TtC18HealthExperienceUI24ButtonCollectionViewCell *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A974D51C();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1A9643C10((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24ButtonCollectionViewCell_item, (unint64_t *)&qword_1ED27B9E0, (void (*)(uint64_t))sub_1A96184A8);
  sub_1A9642C9C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUI24ButtonCollectionViewCell_didTapAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24ButtonCollectionViewCell____lazy_storage___button));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
