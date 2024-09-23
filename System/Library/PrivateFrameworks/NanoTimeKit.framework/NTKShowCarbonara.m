@implementation NTKShowCarbonara

void __NTKShowCarbonara_block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  char v10;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", CFSTR("E7B1CD81-445C-4840-9F24-3A32B510B6A1"));
  v5 = objc_msgSend(v3, "supportsCapability:", v4);

  v6 = objc_msgSend(v3, "collectionType");
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("US"));

  if (v6 == 1)
    v10 = v5;
  else
    v10 = 0;
  NTKShowCarbonara___showCarbonara = v10 & v9;
}

@end
