@implementation CAFJumpBackwardControl

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFJumpBackwardControl;
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
  v6.super_class = (Class)CAFJumpBackwardControl;
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
  v6.super_class = (Class)CAFJumpBackwardControl;
  -[CAFControl unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (void)jumpBackwardWithJumpInterval:(unsigned __int16)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v4 = a3;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v12 = CFSTR("jumpInterval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__CAFJumpBackwardControl_jumpBackwardWithJumpInterval_completion___block_invoke;
  v10[3] = &unk_2508FD280;
  v11 = v6;
  v9 = v6;
  -[CAFControl requestWithValue:response:](self, "requestWithValue:response:", v8, v10);

}

uint64_t __66__CAFJumpBackwardControl_jumpBackwardWithJumpInterval_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

+ (id)controlIdentifier
{
  return CFSTR("0x000000000F00004A");
}

+ (id)observerProtocol
{
  return &unk_25682FBC8;
}

@end
