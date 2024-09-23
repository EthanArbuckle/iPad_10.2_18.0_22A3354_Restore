@implementation KSTextReplacementManager

void __60___KSTextReplacementManager_pushAllLocalRecordsOnceIfNeeded__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v2 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithSuiteName:", v3);

  if ((objc_msgSend(v4, "BOOLForKey:", CFSTR("KSDidPushMigrationStatusOnce-2")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "ckStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushMigrationStatusToCloud:", 1);

    objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("KSDidPushMigrationStatusOnce-2"));
  }
  if ((objc_msgSend(v4, "BOOLForKey:", CFSTR("KSDidPushAllLocalRecordsOnce-2")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "ckStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pushAllLocalData");

    objc_msgSend(*(id *)(a1 + 32), "ckStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60___KSTextReplacementManager_pushAllLocalRecordsOnceIfNeeded__block_invoke_2;
    v8[3] = &unk_24E204978;
    v9 = v4;
    objc_msgSend(v7, "requestSync:withCompletionBlock:", 4, v8);

  }
}

uint64_t __60___KSTextReplacementManager_pushAllLocalRecordsOnceIfNeeded__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setBool:forKey:", 1, CFSTR("KSDidPushAllLocalRecordsOnce-2"));
  return result;
}

@end
