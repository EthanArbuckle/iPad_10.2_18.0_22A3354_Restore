@implementation HKMedicalRecord(HDDataEntity)

- (uint64_t)hd_insertRelatedDataWithPersistentID:()HDDataEntity insertionContext:profile:transaction:error:
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v20;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v24.receiver = a1;
  v24.super_class = (Class)&off_1EF218310;
  v16 = (uint64_t)objc_msgSendSuper2(&v24, sel_hd_insertRelatedDataWithPersistentID_insertionContext_profile_transaction_error_, v12, v13, v14, v15, a7);
  objc_msgSend(v14, "daemon");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "behavior");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "supportsOntology"))
  {
    v20 = v12;
    v21 = v13;
    v22 = v14;
    v23 = v15;
    v16 = HKWithAutoreleasePool();

  }
  return v16;
}

@end
