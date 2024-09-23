@implementation SignedClinicalDataPreviewTableViewCell

- (_TtC15HealthRecordsUI38SignedClinicalDataPreviewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v6;
  _TtC15HealthRecordsUI38SignedClinicalDataPreviewTableViewCell *v7;
  objc_super v9;

  if (a4)
  {
    sub_1BC62C680();
    v6 = (void *)sub_1BC62C650();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SignedClinicalDataPreviewTableViewCell();
  v7 = -[HKObjectPickerTableViewCell initWithStyle:reuseIdentifier:presentationOptions:](&v9, sel_initWithStyle_reuseIdentifier_presentationOptions_, a3, v6, 0);

  return v7;
}

- (_TtC15HealthRecordsUI38SignedClinicalDataPreviewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 presentationOptions:(int64_t)a5
{
  _TtC15HealthRecordsUI38SignedClinicalDataPreviewTableViewCell *result;

  result = (_TtC15HealthRecordsUI38SignedClinicalDataPreviewTableViewCell *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
