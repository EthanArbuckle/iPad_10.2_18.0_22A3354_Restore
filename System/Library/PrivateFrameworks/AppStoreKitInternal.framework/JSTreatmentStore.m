@implementation JSTreatmentStore

- (id)treatmentForArea:(id)a3
{
  _TtC19AppStoreKitInternal16JSTreatmentStore *v4;
  void *v5;
  void *v6;

  sub_1D892ADB4();
  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v4 = self;
  v5 = (void *)sub_1D892B870();
  v6 = (void *)sub_1D892B87C();

  swift_bridgeObjectRelease();
  return v6;
}

- (id)treatmentsForAreas:(id)a3
{
  _TtC19AppStoreKitInternal16JSTreatmentStore *v4;
  void *v5;
  void *v6;

  sub_1D892B060();
  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v4 = self;
  v5 = (void *)sub_1D892B870();
  v6 = (void *)sub_1D892B87C();

  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC19AppStoreKitInternal16JSTreatmentStore)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[JSTreatmentStore init](&v3, sel_init);
}

@end
