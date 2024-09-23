@implementation TitleValueTableViewCell

- (_TtC16HealthMobilityUI23TitleValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  char *v5;
  void *v6;
  char *v7;
  _TtC16HealthMobilityUI23TitleValueTableViewCell *v8;
  objc_super v10;

  if (a4)
  {
    sub_1D77F4AE8();
    v5 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item;
    *(_OWORD *)v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    *((_QWORD *)v5 + 4) = 0;
    v6 = (void *)sub_1D77F4ADC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
    v7 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item;
    *(_OWORD *)v7 = 0u;
    *((_OWORD *)v7 + 1) = 0u;
    *((_QWORD *)v7 + 4) = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TitleValueTableViewCell();
  v8 = -[TitleValueTableViewCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, 1, v6);

  return v8;
}

- (_TtC16HealthMobilityUI23TitleValueTableViewCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC16HealthMobilityUI23TitleValueTableViewCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC16HealthMobilityUI23TitleValueTableViewCell *)sub_1D77F4DA0();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TitleValueTableViewCell();
  v2 = v3.receiver;
  -[TitleValueTableViewCell tintColorDidChange](&v3, sel_tintColorDidChange);
  sub_1D77DD70C();

}

- (void).cxx_destruct
{
  sub_1D77DDC5C((uint64_t)self + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
}

@end
