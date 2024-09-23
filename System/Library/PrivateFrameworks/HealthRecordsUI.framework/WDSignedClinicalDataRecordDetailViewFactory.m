@implementation WDSignedClinicalDataRecordDetailViewFactory

+ (id)issuerDetailViewControllerForSignedClinicalDataGroup:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = _s15HealthRecordsUI41SignedClinicalDataRecordDetailViewFactoryC06issuerhI10Controller06signedeF5GroupSo06UIViewL0CSo08HKSignedefN0C_tFZ_0(v3);

  return v4;
}

+ (id)multiRecordViewControllerForMedicalRecords:(id)a3 profile:(id)a4
{
  uint64_t v5;
  objc_class *v6;
  char *v7;
  id v8;
  id result;
  id v10;
  objc_super v11;

  sub_1BC34B6A0(0, &qword_1ED6A52D8);
  v5 = sub_1BC62C878();
  v6 = (objc_class *)type metadata accessor for SignedClinicalDataMultiRecordViewController();
  v7 = (char *)objc_allocWithZone(v6);
  *(_QWORD *)&v7[OBJC_IVAR____TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController_medicalRecords] = v5;
  *(_QWORD *)&v7[OBJC_IVAR____TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController_profile] = a4;
  *(_QWORD *)&v7[OBJC_IVAR____TtC15HealthRecordsUI43SignedClinicalDataMultiRecordViewController_displayGroups] = MEMORY[0x1E0DEE9D8];
  v11.receiver = v7;
  v11.super_class = v6;
  v8 = a4;
  swift_bridgeObjectRetain();
  result = objc_msgSendSuper2(&v11, sel_initWithUsingInsetStyling_, 1);
  if (result)
  {
    v10 = result;

    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (id)QRCodeViewControllerForSignedClinicalDataGroup:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)_s15HealthRecordsUI41SignedClinicalDataRecordDetailViewFactoryC06QRCodeI10Controller06signedeF5GroupSo06UIViewL0CSo08HKSignedefN0C_tFZ_0(v3);

  return v4;
}

- (WDSignedClinicalDataRecordDetailViewFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SignedClinicalDataRecordDetailViewFactory();
  return -[WDSignedClinicalDataRecordDetailViewFactory init](&v3, sel_init);
}

@end
