@implementation CNContactKeyVectorPropertyKeysToIndicesByPointer

void __CNContactKeyVectorPropertyKeysToIndicesByPointer_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  __CFDictionary *v4;
  id v5;
  id v6;

  v4 = *(__CFDictionary **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "key");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(v4, v6, (const void *)(a3 + 1));

}

void __CNContactKeyVectorPropertyKeysToIndicesByPointer_block_invoke()
{
  const __CFDictionary *Mutable;
  id v1;
  _QWORD v2[5];

  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  +[CN allContactProperties](CN, "allContactProperties");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __CNContactKeyVectorPropertyKeysToIndicesByPointer_block_invoke_2;
  v2[3] = &__block_descriptor_40_e38_v32__0__CNPropertyDescription_8Q16_B24l;
  v2[4] = Mutable;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);
  CNContactKeyVectorPropertyKeysToIndicesByPointer_map = (uint64_t)CFDictionaryCreateCopy(0, Mutable);
  CFRelease(Mutable);

}

@end
