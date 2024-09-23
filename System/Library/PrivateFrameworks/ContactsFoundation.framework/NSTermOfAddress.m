@implementation NSTermOfAddress

void __45__NSTermOfAddress_ContactsFoundation__os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "NSTermOfAddress+ContactsFoundation");
  v1 = (void *)os_log_cn_once_object_1_4;
  os_log_cn_once_object_1_4 = (uint64_t)v0;

}

uint64_t __58__NSTermOfAddress_ContactsFoundation__pronounDescriptions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pronoun");
}

id __91__NSTermOfAddress_ContactsFoundation__pronounDescriptionsForAddressingGrammars_uppercased___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "pronouns");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CNIsArrayEmpty_block_invoke((uint64_t)&__block_literal_global_5, v4);

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "pronouns");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pronoun");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 32))
    {
      objc_msgSend(v3, "locale");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uppercaseStringWithLocale:", v10);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = v9;
    }

  }
  return v6;
}

@end
