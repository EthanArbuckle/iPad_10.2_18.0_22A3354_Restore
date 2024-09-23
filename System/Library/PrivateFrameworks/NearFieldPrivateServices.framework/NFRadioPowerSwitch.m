@implementation NFRadioPowerSwitch

- (BOOL)canRun
{
  return 1;
}

- (id)serviceName
{
  return CFSTR("com.apple.stockholm.services.NFRadioPowerSwitch");
}

- (void)requestUserSettingsNotificationWithCompletion:(id)a3 popupInterval:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v13 = CFSTR("PopupInterval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = 3221225472;
  v11[2] = __82__NFRadioPowerSwitch_requestUserSettingsNotificationWithCompletion_popupInterval___block_invoke;
  v11[3] = &unk_25136D5D0;
  v12 = v6;
  v10.receiver = self;
  v10.super_class = (Class)NFRadioPowerSwitch;
  v11[0] = MEMORY[0x24BDAC760];
  v9 = v6;
  -[NFPrivateService runService:withCompletion:](&v10, sel_runService_withCompletion_, v8, v11);

}

void __82__NFRadioPowerSwitch_requestUserSettingsNotificationWithCompletion_popupInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "valueForKey:", CFSTR("Error"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("UserResponse"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "integerValue");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
