@implementation RegisterUserInstalledFonts

void __RegisterUserInstalledFonts_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const __CFURL *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    }
    else
    {
      UnregisterURLAndCopyFaces(v6, 0, (const __CFDictionary *)__UserRegisteredFonts, 0, 0, 1);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
      objc_msgSend((id)gFontFileHandleForPath, "removeObjectForKey:", v7);
    }
  }

}

@end
