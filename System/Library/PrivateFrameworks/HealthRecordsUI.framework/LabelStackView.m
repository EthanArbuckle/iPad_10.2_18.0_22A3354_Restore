@implementation LabelStackView

- (_TtC15HealthRecordsUI14LabelStackView)initWithCoder:(id)a3
{
  id v4;
  _TtC15HealthRecordsUI14LabelStackView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI14LabelStackView_labels) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI14LabelStackView_interItemSpacing) = (Class)0x4010000000000000;
  v4 = a3;

  result = (_TtC15HealthRecordsUI14LabelStackView *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC15HealthRecordsUI14LabelStackView *v2;

  v2 = self;
  sub_1BC4D2CEC();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC15HealthRecordsUI14LabelStackView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1BC4D30A8();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC15HealthRecordsUI14LabelStackView)initWithFrame:(CGRect)a3
{
  _TtC15HealthRecordsUI14LabelStackView *result;

  result = (_TtC15HealthRecordsUI14LabelStackView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
