@implementation MedicationsSettingsTableCell

- (_TtC26MedicationsHealthAppPluginP33_680DB3B0CB4F1B86E2A1616F13EBC0FE28MedicationsSettingsTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v6;
  _TtC26MedicationsHealthAppPluginP33_680DB3B0CB4F1B86E2A1616F13EBC0FE28MedicationsSettingsTableCell *v7;
  objc_super v9;

  if (a4)
  {
    sub_2318D55BC();
    v6 = (void *)sub_2318D558C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MedicationsSettingsTableCell();
  v7 = -[MedicationsSettingsTableCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, v6);

  return v7;
}

- (_TtC26MedicationsHealthAppPluginP33_680DB3B0CB4F1B86E2A1616F13EBC0FE28MedicationsSettingsTableCell)initWithCoder:(id)a3
{
  return (_TtC26MedicationsHealthAppPluginP33_680DB3B0CB4F1B86E2A1616F13EBC0FE28MedicationsSettingsTableCell *)sub_2318A00C8(self, (uint64_t)a2, (uint64_t)a3, 0, (uint64_t (*)(uint64_t))type metadata accessor for MedicationsSettingsTableCell);
}

@end
