@implementation VisionPrescriptionPreviewTableViewCell

- (_TtC21VisionHealthAppPlugin38VisionPrescriptionPreviewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v6;
  _TtC21VisionHealthAppPlugin38VisionPrescriptionPreviewTableViewCell *v7;
  objc_super v9;

  if (a4)
  {
    sub_2322B8E1C();
    v6 = (void *)sub_2322B8DEC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for VisionPrescriptionPreviewTableViewCell();
  v7 = -[HKObjectPickerTableViewCell initWithStyle:reuseIdentifier:presentationOptions:](&v9, sel_initWithStyle_reuseIdentifier_presentationOptions_, a3, v6, 0);

  return v7;
}

- (_TtC21VisionHealthAppPlugin38VisionPrescriptionPreviewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 presentationOptions:(int64_t)a5
{
  _TtC21VisionHealthAppPlugin38VisionPrescriptionPreviewTableViewCell *result;

  result = (_TtC21VisionHealthAppPlugin38VisionPrescriptionPreviewTableViewCell *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
