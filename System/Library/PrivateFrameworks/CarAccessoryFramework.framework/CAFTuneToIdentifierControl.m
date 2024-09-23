@implementation CAFTuneToIdentifierControl

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTuneToIdentifierControl;
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
  v6.super_class = (Class)CAFTuneToIdentifierControl;
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
  v6.super_class = (Class)CAFTuneToIdentifierControl;
  -[CAFControl unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (void)tuneToIdentifier:(id)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v16[0] = CFSTR("identifier");
  v16[1] = CFSTR("sourceIdentifier");
  v17[0] = a3;
  v17[1] = a4;
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __75__CAFTuneToIdentifierControl_tuneToIdentifier_sourceIdentifier_completion___block_invoke;
  v14[3] = &unk_2508FD280;
  v15 = v8;
  v13 = v8;
  -[CAFControl requestWithValue:response:](self, "requestWithValue:response:", v12, v14);

}

uint64_t __75__CAFTuneToIdentifierControl_tuneToIdentifier_sourceIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

+ (id)controlIdentifier
{
  return CFSTR("0x000000000F00004B");
}

+ (id)observerProtocol
{
  return &unk_25682BEB0;
}

@end
