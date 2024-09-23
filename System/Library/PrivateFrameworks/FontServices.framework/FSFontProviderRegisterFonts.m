@implementation FSFontProviderRegisterFonts

void __FSFontProviderRegisterFonts_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  GSFontProcessRegistrationInfoForFontProvider();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

@end
