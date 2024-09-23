@implementation MedicationDoseEvent

- (void)medicationDetailDidUpdate:(id)a3 for:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = sub_1BCB6413C();
  v7 = v6;
  v8 = a3;
  swift_retain();
  sub_1BCB17D84(v8, v5, v7);

  swift_release();
  swift_bridgeObjectRelease();
}

@end
