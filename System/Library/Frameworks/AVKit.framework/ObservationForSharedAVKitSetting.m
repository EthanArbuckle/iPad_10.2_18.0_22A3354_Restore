@implementation ObservationForSharedAVKitSetting

void ___ObservationForSharedAVKitSetting_block_invoke(id *a1)
{
  _QWORD v2[4];
  id v3;
  id v4;
  id v5;
  id v6;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = ___ObservationForSharedAVKitSetting_block_invoke_2;
  v2[3] = &unk_1E5BB07B8;
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

void ___ObservationForSharedAVKitSetting_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  AVKitUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", *(_QWORD *)(a1 + 48));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 != (void *)v4)
  {
    v6 = !v3 || v4 == 0;
    if (v6 || (objc_msgSend(v3, "isEqualToString:", v4) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v3, *(_QWORD *)(a1 + 48));
      _AVLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v10 = 138543618;
        v11 = v8;
        v12 = 2114;
        v13 = v3;
        _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "Observation: shared value of '%{public}@' changed to '%{public}@", (uint8_t *)&v10, 0x16u);
      }

      if (objc_msgSend(*(id *)(a1 + 56), "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 56), v3, 0);

      }
    }
  }

}

@end
