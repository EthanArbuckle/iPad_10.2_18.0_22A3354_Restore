@implementation CDPRecoveryKeyCreateHeaderView

- (CDPRecoveryKeyCreateHeaderView)initWithSpecifier:(id)a3
{
  id v4;
  CDPRecoveryKeyCreateHeaderView *v5;
  CDPRecoveryKeyCreateHeaderView *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CDPRecoveryKeyCreateHeaderView;
  v5 = -[PSKeychainSyncHeaderView initWithSpecifier:](&v26, sel_initWithSpecifier_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = (int)*MEMORY[0x24BE756B0];
    v8 = *(Class *)((char *)&v5->super.super.super.super.isa + v7);
    objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v9);

    v10 = (int)*MEMORY[0x24BE756A8];
    v11 = *(Class *)((char *)&v6->super.super.super.super.isa + v10);
    objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v12);

    v13 = *(Class *)((char *)&v6->super.super.super.super.isa + v7);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v14 = (void *)getBFFStyleClass_softClass_0;
    v31 = getBFFStyleClass_softClass_0;
    if (!getBFFStyleClass_softClass_0)
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __getBFFStyleClass_block_invoke_0;
      v27[3] = &unk_24C854C48;
      v27[4] = &v28;
      __getBFFStyleClass_block_invoke_0((uint64_t)v27);
      v14 = (void *)v29[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v28, 8);
    objc_msgSend(v15, "sharedStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "headerTitleFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v17);

    v18 = *(Class *)((char *)&v6->super.super.super.super.isa + v10);
    v19 = (void *)MEMORY[0x24BEBB520];
    v20 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "preferredFontForTextStyle:compatibleWithTraitCollection:", v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v23);

    objc_msgSend(*(id *)((char *)&v6->super.super.super.super.isa + v7), "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "_systemBackgroundColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRecoveryKeyCreateHeaderView setBackgroundColor:](v6, "setBackgroundColor:", v24);

  }
  return v6;
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  double result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDPRecoveryKeyCreateHeaderView;
  -[PSKeychainSyncHeaderView preferredHeightForWidth:inTableView:](&v5, sel_preferredHeightForWidth_inTableView_, a4, a3);
  if (result < 150.0)
    return 150.0;
  return result;
}

@end
