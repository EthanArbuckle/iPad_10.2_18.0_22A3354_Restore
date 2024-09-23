@implementation CRMockAsyncCard

- (BOOL)asynchronous
{
  return 1;
}

- (void)loadCardWithCompletion:(id)a3
{
  CRBasicCard *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  CRBasicCard *v25;
  id v26;
  id v28;
  _QWORD block[4];
  CRBasicCard *v30;
  id v31;
  _QWORD v32[4];
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  v3 = objc_alloc_init(CRBasicCard);
  v4 = objc_alloc_init(MEMORY[0x24BE85020]);
  objc_msgSend(v4, "setTitle:", CFSTR("Title"));
  v5 = objc_alloc_init(MEMORY[0x24BE84F88]);
  objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", CFSTR("Text1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeadingText:", v6);

  objc_msgSend(v5, "leadingText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaxLines:", 1);

  v8 = objc_alloc_init(MEMORY[0x24BE84F88]);
  objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", CFSTR("Text2"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeadingText:", v9);

  objc_msgSend(v8, "leadingText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaxLines:", 1);

  v11 = objc_alloc_init(MEMORY[0x24BE84F88]);
  objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", CFSTR("More Info..."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLeadingText:", v12);

  v13 = (void *)MEMORY[0x24BE84F38];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://en.wikipedia.org/wiki/Main_Page"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "punchoutWithURL:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPunchoutOptions:", v16);

  +[CRBasicCardSection basicCardSectionWithBackingCardSection:](CRBasicCardSection, "basicCardSectionWithBackingCardSection:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v17;
  +[CRBasicCardSection basicCardSectionWithBackingCardSection:](CRBasicCardSection, "basicCardSectionWithBackingCardSection:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v18;
  +[CRBasicCardSection basicCardSectionWithBackingCardSection:](CRBasicCardSection, "basicCardSectionWithBackingCardSection:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v19;
  +[CRBasicCardSection basicCardSectionWithBackingCardSection:](CRBasicCardSection, "basicCardSectionWithBackingCardSection:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRBasicCard setCardSections:](v3, "setCardSections:", v21);

  -[CRBasicCard interactions](self, "interactions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRBasicCard setInteractions:](v3, "setInteractions:", v22);

  -[CRBasicCard dismissalCommands](self, "dismissalCommands");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRBasicCard setDismissalCommands:](v3, "setDismissalCommands:", v23);

  v24 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__CRMockAsyncCard_loadCardWithCompletion___block_invoke;
  block[3] = &unk_24DDD92B8;
  v30 = v3;
  v31 = v28;
  v25 = v3;
  v26 = v28;
  dispatch_after(v24, MEMORY[0x24BDAC9B8], block);

}

uint64_t __42__CRMockAsyncCard_loadCardWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
