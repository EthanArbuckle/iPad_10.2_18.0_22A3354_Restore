@implementation HKSignedClinicalDataItem(HealthRecordServices)

- (uint64_t)copyWithMedicalRecordSampleID:()HealthRecordServices
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)MEMORY[0x24BDD3F68];
  v5 = a3;
  objc_msgSend(a1, "primaryConceptCodingCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "relevantDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemWithPrimaryConceptCodingCollection:relevantDate:medicalRecordSampleID:", v6, v7, v5);
  v8 = objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
