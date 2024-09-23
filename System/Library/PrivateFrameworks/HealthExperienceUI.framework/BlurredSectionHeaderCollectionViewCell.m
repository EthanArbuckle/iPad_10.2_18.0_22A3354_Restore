@implementation BlurredSectionHeaderCollectionViewCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18HealthExperienceUI38BlurredSectionHeaderCollectionViewCell *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _TtC18HealthExperienceUI38BlurredSectionHeaderCollectionViewCell *v14;
  _QWORD aBlock[6];
  objc_super v16;

  v4 = sub_1A9A93DB4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A93D9C();
  v8 = self;
  v9 = (void *)sub_1A9A93D90();
  v10 = (objc_class *)type metadata accessor for BlurredSectionHeaderCollectionViewCell();
  v16.receiver = v8;
  v16.super_class = v10;
  -[BlurredSectionHeaderCollectionViewCell _bridgedUpdateConfigurationUsingState:](&v16, sel__bridgedUpdateConfigurationUsingState_, v9);

  v11 = (void *)objc_opt_self();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v8;
  aBlock[4] = sub_1A97B4740;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A9664670;
  aBlock[3] = &block_descriptor_9;
  v13 = _Block_copy(aBlock);
  v14 = v8;
  swift_release();
  objc_msgSend(v11, sel_animateWithDuration_animations_, v13, 0.25);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC18HealthExperienceUI38BlurredSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI38BlurredSectionHeaderCollectionViewCell____lazy_storage___visualEffectView) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for BlurredSectionHeaderCollectionViewCell();
  return -[SectionHeaderCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI38BlurredSectionHeaderCollectionViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI38BlurredSectionHeaderCollectionViewCell____lazy_storage___visualEffectView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BlurredSectionHeaderCollectionViewCell();
  return -[SectionHeaderCollectionViewCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38BlurredSectionHeaderCollectionViewCell____lazy_storage___visualEffectView));
}

@end
