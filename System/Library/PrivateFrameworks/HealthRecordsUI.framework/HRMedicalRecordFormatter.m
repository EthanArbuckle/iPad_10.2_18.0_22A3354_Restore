@implementation HRMedicalRecordFormatter

- (id)structuredItemsFromRecord:(id)a3
{
  id v4;
  HRMedicalRecordFormatter *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1BC543FD4(v4);

  sub_1BC3B9A48();
  v6 = (void *)sub_1BC62C86C();
  swift_bridgeObjectRelease();
  return v6;
}

- (HRMedicalRecordFormatter)initWithConceptStore:(id)a3 context:(int64_t)a4
{
  id v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRMedicalRecordFormatter_store) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRMedicalRecordFormatter_context) = (Class)a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MedicalRecordFormatter();
  v5 = a3;
  return -[HRMedicalRecordFormatter init](&v7, sel_init);
}

- (id)displayItemsFromRecord:(id)a3
{
  id v4;
  HRMedicalRecordFormatter *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1BC54571C(v4);

  sub_1BC34B6A0(0, (unint64_t *)&qword_1EF4299F0);
  v6 = (void *)sub_1BC62C86C();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)attachmentItemsFromRecord:(id)a3
{
  sub_1BC3B9A48();
  return (id)sub_1BC62C86C();
}

- (id)attachmentItemsTitleFromRecord:(id)a3
{
  return 0;
}

- (HRMedicalRecordFormatter)init
{
  HRMedicalRecordFormatter *result;

  result = (HRMedicalRecordFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
