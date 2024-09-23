@implementation LargeModularLayoutConstants

void ___LargeModularLayoutConstants_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  char v4;
  int IsTallScript;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(CFSTR("ar"), "isEqualToString:", v3);

  IsTallScript = CLKLanguageIsTallScript();
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v11, "valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:", 15.0, 18.0, 15.0, 18.0, 18.0, 20.0, 20.0, 18.0, 0x4034000000000000);
    v7 = v6;
    if (!IsTallScript)
      goto LABEL_8;
  }
  else
  {
    if (!IsTallScript)
    {
      objc_msgSend(v11, "valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:", 18.0, 20.5, 18.0, 20.5, 20.5, 23.0, 23.0, 20.5, 0x4037000000000000);
      v7 = v10;
LABEL_8:
      objc_msgSend(v11, "valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:", 17.0, 19.0, 17.0, 19.0, 19.0, 22.0, 22.0, 20.0, 0x4036000000000000);
      goto LABEL_9;
    }
    objc_msgSend(v11, "valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:", 18.0, 20.0, 18.0, 20.0, 20.0, 22.0, 22.0, 20.0, 0x4036000000000000);
    v7 = v8;
  }
  objc_msgSend(v11, "valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:", 18.0, 20.0, 18.0, 20.0, 20.0, 22.0, 22.0, 20.0, 0x4036000000000000);
LABEL_9:
  _LargeModularLayoutConstants___constants_0 = v7;
  _LargeModularLayoutConstants___constants_1 = v9;
  _LargeModularLayoutConstants___constants_2 = v9;

}

@end
