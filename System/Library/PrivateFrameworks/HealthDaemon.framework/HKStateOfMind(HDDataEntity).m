@implementation HKStateOfMind(HDDataEntity)

- (BOOL)hd_insertRelatedDataWithPersistentID:()HDDataEntity insertionContext:profile:transaction:error:
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BOOL8 v23;
  objc_super v25;

  v12 = a3;
  v13 = a6;
  v25.receiver = a1;
  v25.super_class = (Class)&off_1EF226F68;
  if (!objc_msgSendSuper2(&v25, sel_hd_insertRelatedDataWithPersistentID_insertionContext_profile_transaction_error_, v12, a4, a5, v13, a7))goto LABEL_7;
  objc_msgSend(a1, "labels");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15
    || (v16 = objc_msgSend(v12, "longLongValue"),
        objc_msgSend(a1, "labels"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = +[HDStateOfMindLabelEntity insertLabelsForObjectID:labels:transaction:error:](HDStateOfMindLabelEntity, "insertLabelsForObjectID:labels:transaction:error:", v16, v17, v13, a7), v17, v18))
  {
    objc_msgSend(a1, "domains");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (!v20
      || (v21 = objc_msgSend(v12, "longLongValue"),
          objc_msgSend(a1, "domains"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = +[HDStateOfMindDomainEntity insertDomainsForObjectID:domains:transaction:error:](HDStateOfMindDomainEntity, "insertDomainsForObjectID:domains:transaction:error:", v21, v22, v13, a7), v22, v23))
    {
      v23 = 1;
    }
  }
  else
  {
LABEL_7:
    v23 = 0;
  }

  return v23;
}

@end
