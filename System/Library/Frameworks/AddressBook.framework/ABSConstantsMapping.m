@implementation ABSConstantsMapping

+ (id)ABToCNPersonKindConstantsMapping
{
  if (ABToCNPersonKindConstantsMapping_onceToken != -1)
    dispatch_once(&ABToCNPersonKindConstantsMapping_onceToken, &__block_literal_global_0);
  return (id)ABToCNPersonKindConstantsMapping_s_mapping;
}

uint64_t __55__ABSConstantsMapping_ABToCNPersonKindConstantsMapping__block_invoke()
{
  ABSConstantsMapping *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v0 = [ABSConstantsMapping alloc];
  v5[0] = kABPersonKindPerson;
  v5[1] = kABPersonKindOrganization;
  v6[0] = &unk_24C2F9E10;
  v6[1] = &unk_24C2F9E28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[ABSConstantsMapping initWithMapping:](v0, "initWithMapping:", v1);
  v3 = (void *)ABToCNPersonKindConstantsMapping_s_mapping;
  ABToCNPersonKindConstantsMapping_s_mapping = v2;

  return objc_msgSend((id)ABToCNPersonKindConstantsMapping_s_mapping, "setDefaultConstant:", &unk_24C2F9E10);
}

+ (id)CNToABPersonKindConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__ABSConstantsMapping_CNToABPersonKindConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonKindConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABPersonKindConstantsMapping_onceToken, block);
  return (id)CNToABPersonKindConstantsMapping_s_mapping;
}

uint64_t __55__ABSConstantsMapping_CNToABPersonKindConstantsMapping__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "ABToCNPersonKindConstantsMapping");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedMapping");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)CNToABPersonKindConstantsMapping_s_mapping;
  CNToABPersonKindConstantsMapping_s_mapping = v2;

  return objc_msgSend((id)CNToABPersonKindConstantsMapping_s_mapping, "setDefaultConstant:", kABPersonKindPerson);
}

+ (id)ABtoCNContactDisplayNameOrderConstantsMapping
{
  if (ABtoCNContactDisplayNameOrderConstantsMapping_onceToken != -1)
    dispatch_once(&ABtoCNContactDisplayNameOrderConstantsMapping_onceToken, &__block_literal_global_4);
  return (id)ABtoCNContactDisplayNameOrderConstantsMapping_s_mapping;
}

uint64_t __68__ABSConstantsMapping_ABtoCNContactDisplayNameOrderConstantsMapping__block_invoke()
{
  ABSConstantsMapping *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v0 = [ABSConstantsMapping alloc];
  v5[0] = &unk_24C2F9E40;
  v5[1] = &unk_24C2F9E58;
  v6[0] = &unk_24C2F9E28;
  v6[1] = &unk_24C2F9E70;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[ABSConstantsMapping initWithMapping:](v0, "initWithMapping:", v1);
  v3 = (void *)ABtoCNContactDisplayNameOrderConstantsMapping_s_mapping;
  ABtoCNContactDisplayNameOrderConstantsMapping_s_mapping = v2;

  return objc_msgSend((id)ABtoCNContactDisplayNameOrderConstantsMapping_s_mapping, "setDefaultConstant:", &unk_24C2F9E10);
}

+ (id)CNToABCompositeNameFormatConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__ABSConstantsMapping_CNToABCompositeNameFormatConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABCompositeNameFormatConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABCompositeNameFormatConstantsMapping_onceToken, block);
  return (id)CNToABCompositeNameFormatConstantsMapping_s_mapping;
}

uint64_t __64__ABSConstantsMapping_CNToABCompositeNameFormatConstantsMapping__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "ABtoCNContactDisplayNameOrderConstantsMapping");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedMapping");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)CNToABCompositeNameFormatConstantsMapping_s_mapping;
  CNToABCompositeNameFormatConstantsMapping_s_mapping = v2;

  return objc_msgSend((id)CNToABCompositeNameFormatConstantsMapping_s_mapping, "setDefaultConstant:", &unk_24C2F9E58);
}

+ (id)ABToCNContactSortOrderConstantsMapping
{
  if (ABToCNContactSortOrderConstantsMapping_onceToken != -1)
    dispatch_once(&ABToCNContactSortOrderConstantsMapping_onceToken, &__block_literal_global_9);
  return (id)ABToCNContactSortOrderConstantsMapping_s_mapping;
}

uint64_t __61__ABSConstantsMapping_ABToCNContactSortOrderConstantsMapping__block_invoke()
{
  ABSConstantsMapping *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v0 = [ABSConstantsMapping alloc];
  v5[0] = &unk_24C2F9E40;
  v5[1] = &unk_24C2F9E58;
  v6[0] = &unk_24C2F9E70;
  v6[1] = &unk_24C2F9E88;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[ABSConstantsMapping initWithMapping:](v0, "initWithMapping:", v1);
  v3 = (void *)ABToCNContactSortOrderConstantsMapping_s_mapping;
  ABToCNContactSortOrderConstantsMapping_s_mapping = v2;

  return objc_msgSend((id)ABToCNContactSortOrderConstantsMapping_s_mapping, "setDefaultConstant:", &unk_24C2F9E28);
}

+ (id)CNToABPersonSortOrderingConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__ABSConstantsMapping_CNToABPersonSortOrderingConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonSortOrderingConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABPersonSortOrderingConstantsMapping_onceToken, block);
  return (id)CNToABPersonSortOrderingConstantsMapping_s_mapping;
}

uint64_t __63__ABSConstantsMapping_CNToABPersonSortOrderingConstantsMapping__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "ABToCNContactSortOrderConstantsMapping");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedMapping");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)CNToABPersonSortOrderingConstantsMapping_s_mapping;
  CNToABPersonSortOrderingConstantsMapping_s_mapping = v2;

  return objc_msgSend((id)CNToABPersonSortOrderingConstantsMapping_s_mapping, "setDefaultConstant:", &unk_24C2F9E58);
}

+ (id)ABToCNPersonAddressConstantsMapping
{
  if (ABToCNPersonAddressConstantsMapping_onceToken != -1)
    dispatch_once(&ABToCNPersonAddressConstantsMapping_onceToken, &__block_literal_global_11);
  return (id)ABToCNPersonAddressConstantsMapping_s_mapping;
}

void __58__ABSConstantsMapping_ABToCNPersonAddressConstantsMapping__block_invoke()
{
  ABSConstantsMapping *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v0 = [ABSConstantsMapping alloc];
  v1 = *MEMORY[0x24BDBABF8];
  v9[0] = CFSTR("Street");
  v9[1] = CFSTR("City");
  v2 = *MEMORY[0x24BDBABC0];
  v10[0] = v1;
  v10[1] = v2;
  v3 = *MEMORY[0x24BDBABF0];
  v9[2] = CFSTR("State");
  v9[3] = CFSTR("ZIP");
  v4 = *MEMORY[0x24BDBABE0];
  v10[2] = v3;
  v10[3] = v4;
  v9[4] = CFSTR("Country");
  v9[5] = CFSTR("CountryCode");
  v5 = *MEMORY[0x24BDBABD0];
  v10[4] = *MEMORY[0x24BDBABC8];
  v10[5] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ABSConstantsMapping initWithMapping:](v0, "initWithMapping:", v6);
  v8 = (void *)ABToCNPersonAddressConstantsMapping_s_mapping;
  ABToCNPersonAddressConstantsMapping_s_mapping = v7;

}

+ (id)CNToABPersonAddressConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__ABSConstantsMapping_CNToABPersonAddressConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonAddressConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABPersonAddressConstantsMapping_onceToken, block);
  return (id)CNToABPersonAddressConstantsMapping_s_mapping;
}

void __58__ABSConstantsMapping_CNToABPersonAddressConstantsMapping__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ABToCNPersonAddressConstantsMapping");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedMapping");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CNToABPersonAddressConstantsMapping_s_mapping;
  CNToABPersonAddressConstantsMapping_s_mapping = v1;

}

+ (id)ABToCNPersonInstantMessageConstantsMapping
{
  if (ABToCNPersonInstantMessageConstantsMapping_onceToken != -1)
    dispatch_once(&ABToCNPersonInstantMessageConstantsMapping_onceToken, &__block_literal_global_12_0);
  return (id)ABToCNPersonInstantMessageConstantsMapping_s_mapping;
}

void __65__ABSConstantsMapping_ABToCNPersonInstantMessageConstantsMapping__block_invoke()
{
  ABSConstantsMapping *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[12];
  _QWORD v16[13];

  v16[12] = *MEMORY[0x24BDAC8D0];
  v0 = [ABSConstantsMapping alloc];
  v1 = *MEMORY[0x24BDBA468];
  v15[0] = CFSTR("service");
  v15[1] = CFSTR("username");
  v2 = *MEMORY[0x24BDBA470];
  v16[0] = v1;
  v16[1] = v2;
  v3 = *MEMORY[0x24BDBA4C0];
  v15[2] = CFSTR("Yahoo");
  v15[3] = CFSTR("Jabber");
  v4 = *MEMORY[0x24BDBA4A0];
  v16[2] = v3;
  v16[3] = v4;
  v5 = *MEMORY[0x24BDBA4A8];
  v15[4] = CFSTR("MSN");
  v15[5] = CFSTR("ICQ");
  v6 = *MEMORY[0x24BDBA498];
  v16[4] = v5;
  v16[5] = v6;
  v7 = *MEMORY[0x24BDBA478];
  v15[6] = CFSTR("AIM");
  v15[7] = CFSTR("QQ");
  v8 = *MEMORY[0x24BDBA4B0];
  v16[6] = v7;
  v16[7] = v8;
  v9 = *MEMORY[0x24BDBA490];
  v15[8] = CFSTR("GoogleTalk");
  v15[9] = CFSTR("Skype");
  v10 = *MEMORY[0x24BDBA4B8];
  v16[8] = v9;
  v16[9] = v10;
  v15[10] = CFSTR("Facebook");
  v15[11] = CFSTR("GaduGadu");
  v11 = *MEMORY[0x24BDBA488];
  v16[10] = *MEMORY[0x24BDBA480];
  v16[11] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 12);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ABSConstantsMapping initWithMapping:](v0, "initWithMapping:", v12);
  v14 = (void *)ABToCNPersonInstantMessageConstantsMapping_s_mapping;
  ABToCNPersonInstantMessageConstantsMapping_s_mapping = v13;

}

+ (id)CNToABPersonInstantMessageConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__ABSConstantsMapping_CNToABPersonInstantMessageConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonInstantMessageConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABPersonInstantMessageConstantsMapping_onceToken, block);
  return (id)CNToABPersonInstantMessageConstantsMapping_s_mapping;
}

void __65__ABSConstantsMapping_CNToABPersonInstantMessageConstantsMapping__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ABToCNPersonInstantMessageConstantsMapping");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedMapping");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CNToABPersonInstantMessageConstantsMapping_s_mapping;
  CNToABPersonInstantMessageConstantsMapping_s_mapping = v1;

}

+ (id)ABToCNPersonSocialProfileConstantsMapping
{
  if (ABToCNPersonSocialProfileConstantsMapping_onceToken != -1)
    dispatch_once(&ABToCNPersonSocialProfileConstantsMapping_onceToken, &__block_literal_global_13);
  return (id)ABToCNPersonSocialProfileConstantsMapping_s_mapping;
}

void __64__ABSConstantsMapping_ABToCNPersonSocialProfileConstantsMapping__block_invoke()
{
  ABSConstantsMapping *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[11];
  _QWORD v15[12];

  v15[11] = *MEMORY[0x24BDAC8D0];
  v0 = [ABSConstantsMapping alloc];
  v1 = *MEMORY[0x24BDBAC58];
  v14[0] = CFSTR("url");
  v14[1] = CFSTR("username");
  v2 = *MEMORY[0x24BDBAC68];
  v15[0] = v1;
  v15[1] = v2;
  v3 = *MEMORY[0x24BDBAC60];
  v14[2] = CFSTR("identifier");
  v14[3] = CFSTR("service");
  v4 = *MEMORY[0x24BDBAC20];
  v15[2] = v3;
  v15[3] = v4;
  v5 = *MEMORY[0x24BE19210];
  v14[4] = CFSTR("twitter");
  v14[5] = CFSTR("sinaweibo");
  v6 = *MEMORY[0x24BE19208];
  v15[4] = v5;
  v15[5] = v6;
  v7 = *MEMORY[0x24BDBAC18];
  v14[6] = CFSTR("gamecenter");
  v14[7] = CFSTR("facebook");
  v8 = *MEMORY[0x24BE191E8];
  v15[6] = v7;
  v15[7] = v8;
  v9 = *MEMORY[0x24BE19200];
  v14[8] = CFSTR("myspace");
  v14[9] = CFSTR("linkedin");
  v10 = *MEMORY[0x24BE191F8];
  v15[8] = v9;
  v15[9] = v10;
  v14[10] = CFSTR("flickr");
  v15[10] = *MEMORY[0x24BE191F0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ABSConstantsMapping initWithMapping:](v0, "initWithMapping:", v11);
  v13 = (void *)ABToCNPersonSocialProfileConstantsMapping_s_mapping;
  ABToCNPersonSocialProfileConstantsMapping_s_mapping = v12;

}

+ (id)CNToABPersonSocialProfileConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__ABSConstantsMapping_CNToABPersonSocialProfileConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonSocialProfileConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABPersonSocialProfileConstantsMapping_onceToken, block);
  return (id)CNToABPersonSocialProfileConstantsMapping_s_mapping;
}

void __64__ABSConstantsMapping_CNToABPersonSocialProfileConstantsMapping__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ABToCNPersonSocialProfileConstantsMapping");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedMapping");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CNToABPersonSocialProfileConstantsMapping_s_mapping;
  CNToABPersonSocialProfileConstantsMapping_s_mapping = v1;

}

+ (id)ABToCNLabelConstantsMapping
{
  if (ABToCNLabelConstantsMapping_onceToken != -1)
    dispatch_once(&ABToCNLabelConstantsMapping_onceToken, &__block_literal_global_14);
  return (id)ABToCNLabelConstantsMapping_s_mapping;
}

void __50__ABSConstantsMapping_ABToCNLabelConstantsMapping__block_invoke()
{
  ABSConstantsMapping *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[23];
  _QWORD v27[24];

  v27[23] = *MEMORY[0x24BDAC8D0];
  v0 = [ABSConstantsMapping alloc];
  v1 = *MEMORY[0x24BDBABB0];
  v26[0] = CFSTR("_$!<Work>!$_");
  v26[1] = CFSTR("_$!<Home>!$_");
  v2 = *MEMORY[0x24BDBAB58];
  v27[0] = v1;
  v27[1] = v2;
  v3 = *MEMORY[0x24BDBAB60];
  v26[2] = CFSTR("_$!<Other>!$_");
  v26[3] = CFSTR("_$!<Anniversary>!$_");
  v4 = *MEMORY[0x24BDBAB48];
  v27[2] = v3;
  v27[3] = v4;
  v5 = *MEMORY[0x24BDBAB98];
  v26[4] = CFSTR("iPhone");
  v26[5] = CFSTR("_$!<Main>!$_");
  v6 = *MEMORY[0x24BDBAB70];
  v27[4] = v5;
  v27[5] = v6;
  v7 = *MEMORY[0x24BDBAB68];
  v26[6] = CFSTR("_$!<HomeFAX>!$_");
  v26[7] = CFSTR("_$!<WorkFAX>!$_");
  v8 = *MEMORY[0x24BDBAB90];
  v27[6] = v7;
  v27[7] = v8;
  v9 = *MEMORY[0x24BDBAB80];
  v26[8] = CFSTR("_$!<OtherFAX>!$_");
  v26[9] = CFSTR("_$!<Pager>!$_");
  v10 = *MEMORY[0x24BDBAB88];
  v27[8] = v9;
  v27[9] = v10;
  v11 = *MEMORY[0x24BDBAB78];
  v26[10] = CFSTR("_$!<Mobile>!$_");
  v26[11] = CFSTR("_$!<HomePage>!$_");
  v12 = *MEMORY[0x24BDBABA8];
  v27[10] = v11;
  v27[11] = v12;
  v13 = *MEMORY[0x24BDBA720];
  v26[12] = CFSTR("_$!<Father>!$_");
  v26[13] = CFSTR("_$!<Mother>!$_");
  v14 = *MEMORY[0x24BDBA868];
  v27[12] = v13;
  v27[13] = v14;
  v15 = *MEMORY[0x24BDBA8F0];
  v26[14] = CFSTR("_$!<Parent>!$_");
  v26[15] = CFSTR("_$!<Brother>!$_");
  v16 = *MEMORY[0x24BDBA548];
  v27[14] = v15;
  v27[15] = v16;
  v17 = *MEMORY[0x24BDBA968];
  v26[16] = CFSTR("_$!<Sister>!$_");
  v26[17] = CFSTR("_$!<Child>!$_");
  v18 = *MEMORY[0x24BDBA598];
  v27[16] = v17;
  v27[17] = v18;
  v19 = *MEMORY[0x24BDBA760];
  v26[18] = CFSTR("_$!<Friend>!$_");
  v26[19] = CFSTR("_$!<Spouse>!$_");
  v20 = *MEMORY[0x24BDBA9D8];
  v27[18] = v19;
  v27[19] = v20;
  v21 = *MEMORY[0x24BDBA948];
  v26[20] = CFSTR("_$!<Partner>!$_");
  v26[21] = CFSTR("_$!<Assistant>!$_");
  v22 = *MEMORY[0x24BDBA4C8];
  v27[20] = v21;
  v27[21] = v22;
  v26[22] = CFSTR("_$!<Manager>!$_");
  v27[22] = *MEMORY[0x24BDBA860];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 23);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[ABSConstantsMapping initWithMapping:](v0, "initWithMapping:", v23);
  v25 = (void *)ABToCNLabelConstantsMapping_s_mapping;
  ABToCNLabelConstantsMapping_s_mapping = v24;

}

+ (id)CNToABLabelConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ABSConstantsMapping_CNToABLabelConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABLabelConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABLabelConstantsMapping_onceToken, block);
  return (id)CNToABLabelConstantsMapping_s_mapping;
}

void __50__ABSConstantsMapping_CNToABLabelConstantsMapping__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ABToCNLabelConstantsMapping");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedMapping");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CNToABLabelConstantsMapping_s_mapping;
  CNToABLabelConstantsMapping_s_mapping = v1;

}

+ (id)ABToCNContainerTypeConstantsMapping
{
  if (ABToCNContainerTypeConstantsMapping_onceToken != -1)
    dispatch_once(&ABToCNContainerTypeConstantsMapping_onceToken, &__block_literal_global_15);
  return (id)ABToCNContainerTypeConstantsMapping_s_mapping;
}

uint64_t __58__ABSConstantsMapping_ABToCNContainerTypeConstantsMapping__block_invoke()
{
  ABSConstantsMapping *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v0 = [ABSConstantsMapping alloc];
  v5[0] = &unk_24C2F9E40;
  v5[1] = &unk_24C2F9E58;
  v6[0] = &unk_24C2F9E28;
  v6[1] = &unk_24C2F9E70;
  v5[2] = &unk_24C2F9EA0;
  v6[2] = &unk_24C2F9E88;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[ABSConstantsMapping initWithMapping:](v0, "initWithMapping:", v1);
  v3 = (void *)ABToCNContainerTypeConstantsMapping_s_mapping;
  ABToCNContainerTypeConstantsMapping_s_mapping = v2;

  return objc_msgSend((id)ABToCNContainerTypeConstantsMapping_s_mapping, "setDefaultConstant:", &unk_24C2F9E28);
}

+ (id)CNToABSourceTypeConstantsMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__ABSConstantsMapping_CNToABSourceTypeConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABSourceTypeConstantsMapping_onceToken != -1)
    dispatch_once(&CNToABSourceTypeConstantsMapping_onceToken, block);
  return (id)CNToABSourceTypeConstantsMapping_s_mapping;
}

void __55__ABSConstantsMapping_CNToABSourceTypeConstantsMapping__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "ABToCNContainerTypeConstantsMapping");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedMapping");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)CNToABSourceTypeConstantsMapping_s_mapping;
  CNToABSourceTypeConstantsMapping_s_mapping = v2;

  v4 = (void *)CNToABSourceTypeConstantsMapping_s_mapping;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultConstant:", v5);

}

- (ABSConstantsMapping)initWithMapping:(id)a3
{
  id v4;
  ABSConstantsMapping *v5;
  uint64_t v6;
  NSDictionary *mapping;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ABSConstantsMapping;
  v5 = -[ABSConstantsMapping init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    mapping = v5->_mapping;
    v5->_mapping = (NSDictionary *)v6;

  }
  return v5;
}

- (id)invertedMapping
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ABSConstantsMapping mapping](self, "mapping", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[ABSConstantsMapping mapping](self, "mapping");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v11);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMapping:", v3);
  return v12;
}

- (id)mappedConstant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[ABSConstantsMapping mapping](self, "mapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[ABSConstantsMapping defaultConstant](self, "defaultConstant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[ABSConstantsMapping defaultConstant](self, "defaultConstant");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v4;
    }
  }
  v9 = v7;

  return v9;
}

- (NSDictionary)mapping
{
  return self->_mapping;
}

- (void)setMapping:(id)a3
{
  objc_storeStrong((id *)&self->_mapping, a3);
}

- (id)defaultConstant
{
  return self->_defaultConstant;
}

- (void)setDefaultConstant:(id)a3
{
  objc_storeStrong(&self->_defaultConstant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultConstant, 0);
  objc_storeStrong((id *)&self->_mapping, 0);
}

@end
