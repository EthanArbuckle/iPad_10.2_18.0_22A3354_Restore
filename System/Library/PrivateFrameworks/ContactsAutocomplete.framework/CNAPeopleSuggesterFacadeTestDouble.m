@implementation CNAPeopleSuggesterFacadeTestDouble

uint64_t __73___CNAPeopleSuggesterFacadeTestDouble_makeContactWithDisplayName_handle___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", *MEMORY[0x1E0C96FF8], a2);
}

id __73___CNAPeopleSuggesterFacadeTestDouble_makeContactWithDisplayName_handle___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C97338];
  v3 = *MEMORY[0x1E0C96FF8];
  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labeledValueWithLabel:value:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
