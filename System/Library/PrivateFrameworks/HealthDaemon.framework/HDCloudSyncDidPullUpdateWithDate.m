@implementation HDCloudSyncDidPullUpdateWithDate

uint64_t __HDCloudSyncDidPullUpdateWithDate_block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v12;

  HDCloudSyncKeyValueDomainWithProfile(*(void **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "dateForKey:error:", CFSTR("HDCloudSyncLastPulledUpdateDate"), &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = v7;
  if (v6)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (v9)
  {
    if (v6 && !objc_msgSend(v6, "hk_isBeforeDate:", *(_QWORD *)(a1 + 40)))
      v10 = 1;
    else
      v10 = objc_msgSend(v5, "setDate:forKey:error:", *(_QWORD *)(a1 + 40), CFSTR("HDCloudSyncLastPulledUpdateDate"), a3);
  }
  else if (a3)
  {
    v10 = 0;
    *a3 = objc_retainAutorelease(v7);
  }
  else
  {
    _HKLogDroppedError();
    v10 = 0;
  }

  return v10;
}

@end
