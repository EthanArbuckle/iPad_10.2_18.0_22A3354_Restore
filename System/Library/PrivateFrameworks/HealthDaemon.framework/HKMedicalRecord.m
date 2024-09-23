@implementation HKMedicalRecord

BOOL __113__HKMedicalRecord_HDDataEntity__hd_insertRelatedDataWithPersistentID_insertionContext_profile_transaction_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  return +[HDMedicalUserDomainConceptGenerator generateUserDomainConceptForMedicalRecord:entityPersistentID:insertionContext:profile:transaction:error:](HDMedicalUserDomainConceptGenerator, "generateUserDomainConceptForMedicalRecord:entityPersistentID:insertionContext:profile:transaction:error:", a1[4], a1[5], a1[6], a1[7], a1[8], a2);
}

@end
