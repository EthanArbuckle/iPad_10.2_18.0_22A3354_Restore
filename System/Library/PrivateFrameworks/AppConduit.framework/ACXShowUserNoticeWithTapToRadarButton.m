@implementation ACXShowUserNoticeWithTapToRadarButton

void __ACXShowUserNoticeWithTapToRadarButton_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  CFOptionFlags v20;

  v20 = 0;
  CFUserNotificationDisplayAlert(0.0, 2uLL, 0, 0, 0, *(CFStringRef *)(a1 + 32), *(CFStringRef *)(a1 + 40), CFSTR("File A Bug"), CFSTR("No Thanks"), 0, &v20);
  if (!v20)
  {
    v2 = *(void **)(a1 + 56);
    v3 = *(id *)(a1 + 48);
    v4 = v2;
    v5 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v5, "setScheme:", CFSTR("tap-to-radar"));
    objc_msgSend(v5, "setHost:", CFSTR("new"));
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentName"), CFSTR("AppConduit"));
    objc_msgSend(v6, "addObject:", v7);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentVersion"), CFSTR("all"));
    objc_msgSend(v6, "addObject:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentID"), CFSTR("660691"));
    objc_msgSend(v6, "addObject:", v9);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug"));
    objc_msgSend(v6, "addObject:", v10);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Reproducibility"), CFSTR("I Didn't Try"));
    objc_msgSend(v6, "addObject:", v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("phone,watch"));
    objc_msgSend(v6, "addObject:", v12);

    if (v3 && objc_msgSend(v3, "length"))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Title"), v3);
      objc_msgSend(v6, "addObject:", v13);

    }
    if (v4)
    {
      if (objc_msgSend(v4, "length"))
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Description"), v4);
        objc_msgSend(v6, "addObject:", v14);

      }
    }
    objc_msgSend(v5, "setQueryItems:", v6);
    objc_msgSend(v5, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __ACXShowUserNoticeWithTapToRadarButton_block_invoke_2;
    v18[3] = &unk_1E98832E8;
    v19 = v15;
    v17 = v15;
    objc_msgSend(v16, "openURL:configuration:completionHandler:", v17, 0, v18);

  }
}

void __ACXShowUserNoticeWithTapToRadarButton_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if (v4 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    MOLogWrite();

}

@end
