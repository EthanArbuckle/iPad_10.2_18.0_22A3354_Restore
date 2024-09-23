@implementation NSProcessInfo(MIMEAdditions)

- (id)mf_thermalStateObservable
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB37C0]);
  v3 = *MEMORY[0x1E0CB3050];
  v4 = (void *)objc_msgSend(v2, "initWithName:object:userInfo:", *MEMORY[0x1E0CB3050], a1, 0);
  objc_msgSend(MEMORY[0x1E0D1EF28], "observableOnDefaultNotificationCenterWithName:object:", v3, a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startWith:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__NSProcessInfo_MIMEAdditions__mf_thermalStateObservable__block_invoke;
  v10[3] = &unk_1E5AA1FA8;
  v10[4] = a1;
  objc_msgSend(v7, "map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
