@implementation CNPostalAddressDonationValue

uint64_t __41___CNPostalAddressDonationValue_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BE19270], "isInteger:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "style"), objc_msgSend(*(id *)(a1 + 40), "style"));
}

uint64_t __41___CNPostalAddressDonationValue_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BE19270];
  objc_msgSend(*(id *)(a1 + 32), "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __41___CNPostalAddressDonationValue_isEqual___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BE19270];
  objc_msgSend(*(id *)(a1 + 32), "postalAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "postalAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __41___CNPostalAddressDonationValue_isEqual___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BE19270];
  objc_msgSend(*(id *)(a1 + 32), "origin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __37___CNPostalAddressDonationValue_hash__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BE19288], "integerHash:", objc_msgSend(*(id *)(a1 + 32), "style"));
}

uint64_t __37___CNPostalAddressDonationValue_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x24BE19288];
  objc_msgSend(*(id *)(a1 + 32), "postalAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __37___CNPostalAddressDonationValue_hash__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x24BE19288];
  objc_msgSend(*(id *)(a1 + 32), "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __37___CNPostalAddressDonationValue_hash__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x24BE19288];
  objc_msgSend(*(id *)(a1 + 32), "origin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

@end
