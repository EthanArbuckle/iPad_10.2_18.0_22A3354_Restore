@implementation CAFTestDevRequestWithResParamsControl

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestDevRequestWithResParamsControl;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256824918))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFTestDevRequestWithResParamsControl;
  -[CAFControl registerObserver:](&v6, sel_registerObserver_, v5);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256824918))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFTestDevRequestWithResParamsControl;
  -[CAFControl unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (void)testDevRequestWithResParamsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __83__CAFTestDevRequestWithResParamsControl_testDevRequestWithResParamsWithCompletion___block_invoke;
  v6[3] = &unk_2508FD280;
  v7 = v4;
  v5 = v4;
  -[CAFControl requestWithValue:response:](self, "requestWithValue:response:", 0, v6);

}

void __83__CAFTestDevRequestWithResParamsControl_testDevRequestWithResParamsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    if (v5)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD, id))(v7 + 16))(*(_QWORD *)(a1 + 32), 0, MEMORY[0x24BDBD1A8], v5);
    }
    else if (v15)
    {
      objc_opt_class();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("testOutput3"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8 && (objc_opt_isKindOfClass() & 1) != 0)
        v9 = (unint64_t)v8;
      else
        v9 = 0;

      objc_opt_class();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("testOutput4"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
        v11 = (unint64_t)v10;
      else
        v11 = 0;

      if (!(v9 | v11))
      {
        v12 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 8, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v12 + 16))(v12, 0, MEMORY[0x24BDBD1A8], v13);

      }
      (*(void (**)(_QWORD, uint64_t, unint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend((id)v9, "unsignedCharValue"), v11, 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 7, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v7 + 16))(v7, 0, MEMORY[0x24BDBD1A8], v14);

    }
  }

}

+ (id)controlIdentifier
{
  return CFSTR("0x00000000FF00002A");
}

+ (id)observerProtocol
{
  return &unk_25682DC70;
}

@end
