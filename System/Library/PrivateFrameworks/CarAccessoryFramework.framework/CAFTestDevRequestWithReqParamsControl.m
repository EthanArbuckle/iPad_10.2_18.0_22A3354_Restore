@implementation CAFTestDevRequestWithReqParamsControl

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestDevRequestWithReqParamsControl;
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
  v6.super_class = (Class)CAFTestDevRequestWithReqParamsControl;
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
  v6.super_class = (Class)CAFTestDevRequestWithReqParamsControl;
  -[CAFControl unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (void)testDevRequestWithReqParamsWithTestInput1:(unsigned __int8)a3 testInput2:(id)a4 completion:(id)a5
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
  v16[0] = CFSTR("testInput1");
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = a4;
  objc_msgSend(v9, "numberWithUnsignedChar:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("testInput2");
  v17[0] = v11;
  v17[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __105__CAFTestDevRequestWithReqParamsControl_testDevRequestWithReqParamsWithTestInput1_testInput2_completion___block_invoke;
  v14[3] = &unk_2508FD280;
  v15 = v8;
  v13 = v8;
  -[CAFControl requestWithValue:response:](self, "requestWithValue:response:", v12, v14);

}

uint64_t __105__CAFTestDevRequestWithReqParamsControl_testDevRequestWithReqParamsWithTestInput1_testInput2_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

+ (id)controlIdentifier
{
  return CFSTR("0x00000000FF000029");
}

+ (id)observerProtocol
{
  return &unk_25682FDF0;
}

@end
