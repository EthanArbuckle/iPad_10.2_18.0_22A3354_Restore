@implementation CNAUILocalizedAddressSeparator

void __CNAUILocalizedAddressSeparator_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ADDRESS_SEPARATOR"), &stru_1E62C0368, CFSTR("Localized"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)CNAUILocalizedAddressSeparator_cn_once_object_1;
  CNAUILocalizedAddressSeparator_cn_once_object_1 = v1;

}

@end
