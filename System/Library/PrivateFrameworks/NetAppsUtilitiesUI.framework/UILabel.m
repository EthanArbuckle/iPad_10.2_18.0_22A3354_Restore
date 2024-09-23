@implementation UILabel

void __72__UILabel_NAUIAdditions__naui_reloadDynamicFontWithTextStyleDescriptor___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  NAUITextStyleDescriptor *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(a2, "fontDescriptor");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BEBB588]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v8 = -[NAUITextStyleDescriptor initWithTextStyle:symbolicTraits:allowsAccessibilitySizes:allowsSmallSizes:]([NAUITextStyleDescriptor alloc], "initWithTextStyle:symbolicTraits:allowsAccessibilitySizes:allowsSmallSizes:", v7, objc_msgSend(v12, "symbolicTraits"), objc_msgSend(*(id *)(a1 + 32), "allowsAccessibilitySizes"), objc_msgSend(*(id *)(a1 + 32), "allowsSmallSizes"));
    v9 = *(void **)(a1 + 40);
    v10 = *MEMORY[0x24BEBB360];
    +[NAUITextStyleDescriptor fontWithTextStyleDescriptor:](NAUITextStyleDescriptor, "fontWithTextStyleDescriptor:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAttribute:value:range:", v10, v11, a3, a4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x24BEBB360], *(_QWORD *)(a1 + 48), a3, a4);
  }

}

@end
