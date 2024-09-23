@implementation ShardSpinnerDownloadCell

- (_TtC19HealthMedicationsUI24ShardSpinnerDownloadCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC19HealthMedicationsUI24ShardSpinnerDownloadCell *v10;
  void *v11;
  _TtC19HealthMedicationsUI24ShardSpinnerDownloadCell *v12;
  id v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI24ShardSpinnerDownloadCell_item;
  v9 = (objc_class *)type metadata accessor for ShardSpinnerDownloadCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v15.receiver = self;
  v15.super_class = v9;
  v10 = -[ShardSpinnerDownloadCell initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  -[ShardSpinnerDownloadCell setUserInteractionEnabled:](v10, sel_setUserInteractionEnabled_, 0);
  v11 = (void *)objc_opt_self();
  v12 = v10;
  v13 = objc_msgSend(v11, sel_secondarySystemGroupedBackgroundColor);
  -[ShardSpinnerDownloadCell setBackgroundColor:](v12, sel_setBackgroundColor_, v13);

  sub_1BC27D4D4();
  return v12;
}

- (_TtC19HealthMedicationsUI24ShardSpinnerDownloadCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC19HealthMedicationsUI24ShardSpinnerDownloadCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI24ShardSpinnerDownloadCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC19HealthMedicationsUI24ShardSpinnerDownloadCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI24ShardSpinnerDownloadCell_item);
}

@end
