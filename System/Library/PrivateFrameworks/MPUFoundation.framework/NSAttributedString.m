@implementation NSAttributedString

void __107__NSAttributedString_MPUDynamicType__MPU_attributedStringByUpdatingTextStyleFontsToPreferredTextStyleFonts__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(a2, "fontDescriptor");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDF7768]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v13, "symbolicTraits"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 32);
    v11 = *MEMORY[0x24BDF65F8];
    objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v9, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAttribute:value:range:", v11, v12, a3, a4);

  }
}

void __67__NSAttributedString_MPUDynamicType__MPU_tallestFontFromAttributes__block_invoke(uint64_t a1, void *a2)
{
  double v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    objc_msgSend(v6, "_bodyLeading");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v4 > *(double *)(v5 + 24))
    {
      *(double *)(v5 + 24) = v4;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    }
  }

}

@end
