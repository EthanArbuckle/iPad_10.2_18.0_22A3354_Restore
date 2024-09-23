@implementation AccountUpgradeCell

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC15HealthRecordsUI18AccountUpgradeCell *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1BC62BC18();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1BC472E6C();

  v8 = (void *)sub_1BC62BC00();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (UICellConfigurationState *)v8;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC15HealthRecordsUI18AccountUpgradeCell *v8;
  uint64_t v9;

  v4 = sub_1BC62BC18();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62BC0C();
  v8 = self;
  sub_1BC472FF0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC15HealthRecordsUI18AccountUpgradeCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_disableAction) = 1;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_hideDismiss) = 1;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_hasSetUpViews) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AccountUpgradeCell();
  return -[AccountUpgradeCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15HealthRecordsUI18AccountUpgradeCell)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_disableAction) = 1;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_hideDismiss) = 1;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_hasSetUpViews) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AccountUpgradeCell();
  return -[AccountUpgradeCell initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1BC384EB4((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_item, (unint64_t *)&qword_1EF43AE70, (void (*)(uint64_t))sub_1BC37AE0C);
}

@end
