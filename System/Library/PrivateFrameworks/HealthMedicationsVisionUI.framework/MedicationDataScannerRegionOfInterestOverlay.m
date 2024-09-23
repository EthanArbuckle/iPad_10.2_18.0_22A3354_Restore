@implementation MedicationDataScannerRegionOfInterestOverlay

- (_TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay)initWithFrame:(CGRect)a3
{
  return (_TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay *)sub_21C2A6158(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21C2A7578();
}

- (void)layoutSubviews
{
  _TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay *v2;

  v2 = self;
  sub_21C2A65D0();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay__title;
  sub_21C2A6F1C(0, &qword_255255C48, MEMORY[0x24BDB9EF0]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC25HealthMedicationsVisionUI44MedicationDataScannerRegionOfInterestOverlay____lazy_storage___reticle));
}

@end
