@implementation InteractionSummaryContentView

- (_TtC19HealthMedicationsUI29InteractionSummaryContentView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC19HealthMedicationsUI29InteractionSummaryContentView *v7;
  id v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI29InteractionSummaryContentView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI29InteractionSummaryContentView_viewModel) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for InteractionSummaryContentView();
  v7 = -[InteractionSummaryContentView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  -[InteractionSummaryContentView setTranslatesAutoresizingMaskIntoConstraints:](v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v8 = sub_1BC27AD68();
  -[InteractionSummaryContentView addSubview:](v7, sel_addSubview_, v8);

  sub_1BC27B244();
  return v7;
}

- (_TtC19HealthMedicationsUI29InteractionSummaryContentView)initWithCoder:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI29InteractionSummaryContentView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI29InteractionSummaryContentView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI29InteractionSummaryContentView_viewModel) = 0;
  v4 = a3;

  result = (_TtC19HealthMedicationsUI29InteractionSummaryContentView *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI29InteractionSummaryContentView____lazy_storage___titleLabel));
  swift_release();
}

@end
