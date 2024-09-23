@implementation CAFPlayControl

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFPlayControl;
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
  v6.super_class = (Class)CAFPlayControl;
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
  v6.super_class = (Class)CAFPlayControl;
  -[CAFControl unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (void)playWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__CAFPlayControl_playWithCompletion___block_invoke;
  v6[3] = &unk_2508FD280;
  v7 = v4;
  v5 = v4;
  -[CAFControl requestWithValue:response:](self, "requestWithValue:response:", 0, v6);

}

uint64_t __37__CAFPlayControl_playWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

+ (id)controlIdentifier
{
  return CFSTR("0x000000000F000032");
}

+ (id)observerProtocol
{
  return &unk_25682C788;
}

@end
