@implementation TitleWithSubtitleView

- (_TtC19HealthMedicationsUI21TitleWithSubtitleView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC19HealthMedicationsUI21TitleWithSubtitleView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView_customConstraints) = (Class)MEMORY[0x1E0DEE9D8];
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView_item;
  v9 = (objc_class *)type metadata accessor for TitleWithSubtitleView();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[TitleWithSubtitleView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1BC18F404();

  return v10;
}

- (_TtC19HealthMedicationsUI21TitleWithSubtitleView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC19HealthMedicationsUI21TitleWithSubtitleView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView____lazy_storage___subtitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView_customConstraints) = (Class)MEMORY[0x1E0DEE9D8];
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC19HealthMedicationsUI21TitleWithSubtitleView *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView____lazy_storage___subtitleLabel));
  swift_bridgeObjectRelease();
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI21TitleWithSubtitleView_item);
}

@end
