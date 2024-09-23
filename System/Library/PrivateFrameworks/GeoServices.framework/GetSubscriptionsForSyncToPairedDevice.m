@implementation GetSubscriptionsForSyncToPairedDevice

uint64_t __GetSubscriptionsForSyncToPairedDevice_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v14;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindUUIDParameter:toValue:inStatement:error:", "@paired_device_subscription_sync_device_id", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if ((_DWORD)v7)
  {
    v8 = sqlite3_step(a2);
    while ((_DWORD)v8 == 100)
    {
      objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 0, a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 1;
      objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 1, a2);
      if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
        goto LABEL_9;
      v8 = sqlite3_step(a2);

    }
    if ((_DWORD)v8 == 101)
      return 1;
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(id *)(v11 + 40);
    objc_msgSend(v10, "reportSQLiteErrorCode:method:error:", v8, CFSTR("step"), &v14);
    v12 = v14;
    v7 = 0;
    v9 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v12;
LABEL_9:

  }
  return v7;
}

@end
