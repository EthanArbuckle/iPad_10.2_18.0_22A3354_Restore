@implementation CAFTestDevRequestWithReqAndResParamsControl

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestDevRequestWithReqAndResParamsControl;
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
  v6.super_class = (Class)CAFTestDevRequestWithReqAndResParamsControl;
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
  v6.super_class = (Class)CAFTestDevRequestWithReqAndResParamsControl;
  -[CAFControl unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (void)testDevRequestWithReqAndResParamsWithTestInput5:(unsigned __int8)a3 testInput6:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v6 = a3;
  v17[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v16[0] = CFSTR("testInput5");
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = a4;
  objc_msgSend(v9, "numberWithUnsignedChar:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("testInput6");
  v17[0] = v11;
  v17[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __117__CAFTestDevRequestWithReqAndResParamsControl_testDevRequestWithReqAndResParamsWithTestInput5_testInput6_completion___block_invoke;
  v14[3] = &unk_2508FD280;
  v15 = v8;
  v13 = v8;
  -[CAFControl requestWithValue:response:](self, "requestWithValue:response:", v12, v14);

}

void __117__CAFTestDevRequestWithReqAndResParamsControl_testDevRequestWithReqAndResParamsWithTestInput5_testInput6_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("testOutput7"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8 && (objc_opt_isKindOfClass() & 1) != 0)
        v9 = (unint64_t)v8;
      else
        v9 = 0;

      objc_opt_class();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("testOutput8"));
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
  return CFSTR("0x00000000FF00002B");
}

+ (id)observerProtocol
{
  return &unk_2568306A8;
}

@end
