@implementation MSVDeviceSupportsVocalAttenuation

void __MSVDeviceSupportsVocalAttenuation_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  BOOL v8;
  char v9;
  id v10;

  MSVGetDeviceProductType();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR(","));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (MSVDeviceIsiPhone___once != -1)
    dispatch_once(&MSVDeviceIsiPhone___once, &__block_literal_global_69);
  if (MSVDeviceIsiPhone___deviceIsPhone)
  {
    objc_msgSend(v2, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    v8 = v4 == 12 && v6 == 8 || v4 <= 11;
    goto LABEL_14;
  }
  if (MSVDeviceIsiPad___once != -1)
    dispatch_once(&MSVDeviceIsiPad___once, &__block_literal_global_2127);
  if (MSVDeviceIsiPad___deviceIsiPad)
  {
    v8 = v4 <= 11;
LABEL_14:
    v9 = !v8;
    MSVDeviceSupportsVocalAttenuation_supportsVocalAttenuation = v9;
  }

}

@end
