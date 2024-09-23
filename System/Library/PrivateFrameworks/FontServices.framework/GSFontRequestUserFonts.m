@implementation GSFontRequestUserFonts

void __GSFontRequestUserFonts_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  ConsumeSandboxExtensions(v6);
  v3 = v6;
  if (v6)
  {
    v4 = objc_msgSend(v6, "count");
    v3 = v6;
    if (v4)
    {
      RegisterUserInstalledFonts(v6, 1, 1, 0);
      v3 = v6;
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

@end
