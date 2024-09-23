@implementation HACCPMEToggle

- (HACCPMEToggle)initWithFrame:(CGRect)a3
{
  HACCPMEToggle *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HACCPMEToggle;
  v3 = -[HUICCCapsuleButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    paLocString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton setTitleText:](v3, "setTitleText:", v4);

    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", 3, 23.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("headphones"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HUICCImageViewWithImage(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton setIconView:](v3, "setIconView:", v7);

    objc_initWeak(&location, v3);
    objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __31__HACCPMEToggle_initWithFrame___block_invoke;
    v10[3] = &unk_24DD60E18;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v8, "registerUpdateBlock:forRetrieveSelector:withListener:", v10, sel_personalMediaEnabled, v3);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __31__HACCPMEToggle_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateValue");

}

- (void)updateValue
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HACCPMEToggle;
  -[HUICCCapsuleButton updateValue](&v6, sel_updateValue);
  -[HUICCCapsuleButton delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundUpdateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__HACCPMEToggle_updateValue__block_invoke;
  block[3] = &unk_24DD60E68;
  block[4] = self;
  dispatch_async(v4, block);

}

void __28__HACCPMEToggle_updateValue__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  id v23;

  paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accommodationTypesForRouteUID:", v3);

  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "transparencyCustomizedForAddress:", v3);

  paLocString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "personalMediaEnabled");

  if ((v9 & 1) == 0)
    goto LABEL_4;
  v10 = compoundAttributeContainsAttribute();
  if (!v6)
  {
    if (v10)
    {
LABEL_9:
      v12 = (void *)MEMORY[0x24BDD17C8];
      paLocString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      paLocString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      paLocString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v13, v14, v15);
      v11 = objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
LABEL_6:
    if (!compoundAttributeContainsAttribute()
      && !compoundAttributeContainsAttribute()
      && !v6)
    {
      v11 = 0;
      goto LABEL_10;
    }
    goto LABEL_4;
  }
  if (!v10)
  {
    if ((compoundAttributeContainsAttribute() & 1) != 0
      || compoundAttributeContainsAttribute()
      || compoundAttributeContainsAttribute())
    {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
LABEL_4:
  paLocString();
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "subtitleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "text");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17 | v11;

  objc_msgSend(*(id *)(a1 + 32), "subtitleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "text");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", v11);

  v22 = v7;
  v23 = (id)v11;
  AXPerformBlockOnMainThread();
  if (v18 && (v21 & 1) == 0)
    AXPerformBlockOnMainThreadAfterDelay();

}

uint64_t __28__HACCPMEToggle_updateValue__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTitleText:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setSubtitleText:", *(_QWORD *)(a1 + 48));
}

void __28__HACCPMEToggle_updateValue__block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateHeight");

}

- (BOOL)enabled
{
  return 1;
}

- (id)contentValue
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "personalMediaEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
