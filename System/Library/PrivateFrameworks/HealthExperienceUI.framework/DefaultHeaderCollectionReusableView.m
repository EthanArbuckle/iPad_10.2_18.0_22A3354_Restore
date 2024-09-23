@implementation DefaultHeaderCollectionReusableView

- (_TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView____lazy_storage___detailButton) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView_customConstraints) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView____lazy_storage___detailButtonHeightConstraint) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView_item;
  v9 = (objc_class *)type metadata accessor for DefaultHeaderCollectionReusableView();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[DefaultHeaderCollectionReusableView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1A9953414();

  return v10;
}

- (_TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9954598();
}

- (void)preferredContentSizeCategoryDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  void (*v6)(void);
  id v7;
  _TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView *v8;

  v6 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.super.isa) + 0x108);
  swift_unknownObjectRetain();
  v7 = a4;
  v8 = self;
  v6();
  sub_1A99537B0();
  swift_unknownObjectRelease();

}

- (void)detailButtonTapped:(id)a3
{
  _TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView *v4;
  void (*v5)(_TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView *);
  uint64_t v6;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  v5 = *(void (**)(_TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView *))(sub_1A9952B9C() + 72);
  sub_1A9649378((uint64_t)v5);
  swift_release();
  if (v5)
  {
    v5(v4);
    sub_1A9642C9C((uint64_t)v5);
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView____lazy_storage___detailButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView____lazy_storage___titleLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView____lazy_storage___detailButtonHeightConstraint));
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView_item);
}

@end
