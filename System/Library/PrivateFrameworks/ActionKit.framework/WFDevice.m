@implementation WFDevice

void __56__WFDevice_SystemSettings__getBrightnessWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  if (a2)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __56__WFDevice_SystemSettings__getBrightnessWithCompletion___block_invoke_2;
    v3[3] = &unk_24F8B23E0;
    v4 = *(id *)(a1 + 32);
    objc_msgSend(a2, "getValueWithCompletionHandler:", v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __56__WFDevice_SystemSettings__getBrightnessWithCompletion___block_invoke_2(uint64_t a1, void *a2, float a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  double v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a2;
  *(float *)&v7 = a3;
  objc_msgSend(v5, "numberWithFloat:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v8, v6);

}

void __56__WFDevice_SystemSettings__getAppearanceWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(uint64_t, _QWORD);
  WFAppearanceSettingValue *v8;

  if (a2)
  {
    v5 = a3;
    v8 = -[WFAppearanceSettingValue initWithSetting:]([WFAppearanceSettingValue alloc], "initWithSetting:", objc_msgSend(a2, "currentAppearance"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void (**)(uint64_t, _QWORD))(v6 + 16);
    v8 = a3;
    v7(v6, 0);
  }

}

@end
