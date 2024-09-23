@implementation CNContactProperty

void __55__CNContactProperty_UIAdditions__phoneticPropertiesMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C967D8];
  v1 = *MEMORY[0x1E0C96780];
  v7[0] = *MEMORY[0x1E0C966D0];
  v7[1] = v1;
  v2 = *MEMORY[0x1E0C967E0];
  v8[0] = v0;
  v8[1] = v2;
  v3 = *MEMORY[0x1E0C967B8];
  v7[2] = *MEMORY[0x1E0C966C0];
  v7[3] = v3;
  v4 = *MEMORY[0x1E0C967E8];
  v8[2] = *MEMORY[0x1E0C967D0];
  v8[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)phoneticPropertiesMap_properties;
  phoneticPropertiesMap_properties = v5;

}

@end
