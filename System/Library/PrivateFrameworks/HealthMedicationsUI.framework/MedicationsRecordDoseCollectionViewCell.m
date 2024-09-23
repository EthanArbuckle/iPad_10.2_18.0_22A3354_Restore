@implementation MedicationsRecordDoseCollectionViewCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell *v8;
  uint64_t v9;

  v4 = sub_1BC2B3B00();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC2B3AF4();
  v8 = self;
  sub_1BC1672D8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)didTapAccessory
{
  _TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell *v2;

  v2 = self;
  sub_1BC16912C();

}

- (_TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  _TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell_logButton;
  v9 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8) = (Class)sub_1BC166760();
  v10 = (char *)v9
      + OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell____lazy_storage___plusAccessory;
  v11 = sub_1BC2B3AD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = (char *)v9 + OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell_item;
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((_QWORD *)v12 + 4) = 0;

  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for MedicationsRecordDoseCollectionViewCell(0);
  return -[MedicationsRecordDoseCollectionViewCell initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  _TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell *v10;
  objc_super v12;

  v4 = OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell_logButton;
  v5 = a3;
  v6 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v4) = (Class)sub_1BC166760();
  v7 = (char *)v6
     + OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell____lazy_storage___plusAccessory;
  v8 = sub_1BC2B3AD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (char *)v6 + OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell_item;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_QWORD *)v9 + 4) = 0;

  v12.receiver = v6;
  v12.super_class = (Class)type metadata accessor for MedicationsRecordDoseCollectionViewCell(0);
  v10 = -[MedicationsRecordDoseCollectionViewCell initWithCoder:](&v12, sel_initWithCoder_, v5);

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell_logButton));
  sub_1BC0F2444((uint64_t)self+ OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell____lazy_storage___plusAccessory, &qword_1EDA0FAE8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DC1D38]);
  sub_1BC0E8594((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI39MedicationsRecordDoseCollectionViewCell_item, (uint64_t (*)(_QWORD))sub_1BC0E84E8);
}

@end
