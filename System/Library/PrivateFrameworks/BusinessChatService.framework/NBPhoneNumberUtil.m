@implementation NBPhoneNumberUtil

void __36___NBPhoneNumberUtil_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_40;
  _MergedGlobals_40 = (uint64_t)v1;

}

void __46___NBPhoneNumberUtil_initRegularExpressionSet__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("^[%@]+"), 0x24C39F248);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_253EC0AB0;
  qword_253EC0AB0 = v0;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@%@]"), 0x24C39F248, 0x24C39F268);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_253EC0AB8;
  qword_253EC0AB8 = v2;

  v4 = (void *)qword_253EC0AC0;
  qword_253EC0AC0 = (uint64_t)CFSTR("[\\\\\\/] *x");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[^%@%@#]+$"), 0x24C39F268, CFSTR("A-Za-z"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_253EC0AC8;
  qword_253EC0AC8 = v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(?:%@)$"), CFSTR("(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  \\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘX#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)$"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_253EC0AD0;
  qword_253EC0AD0 = v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]+"), CFSTR("-x‐-―−ー－-／ ­​⁠　()（）［］.\\[\\]/~⁓∼～"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)qword_253EC0AD8;
  qword_253EC0AD8 = v9;

  v11 = (void *)qword_253EC0AE0;
  qword_253EC0AE0 = (uint64_t)CFSTR("^[0-9０-９٠-٩۰-۹]{2}$|^[+＋]*(?:[-x‐-―−ー－-／  ­​⁠　()（）［］.\\[\\]/~⁓∼～*]*[0-9０-９٠-٩۰-۹]){3,}[-x‐-―−ー－-／  ­​⁠　()（）［］.\\[\\]/~⁓∼～*A-Za-z0-9０-９٠-٩۰-۹]*(?:;ext=([0-9０-９٠-٩۰-۹]{1,7})|[  \\t,]*(?:e?xt(?:ensi(?:ó?|ó))?n?|ｅ?ｘｔｎ?|[,xｘ#＃~～]|int|anexo|ｉｎｔ)[:\\.．]?[  \\t,-]*([0-9０-９٠-٩۰-۹]{1,7})#?|[- ]+([0-9０-９٠-٩۰-۹]{1,5})#)?$");

}

void __36___NBPhoneNumberUtil_DIGIT_MAPPINGS__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("0"), CFSTR("1"), CFSTR("1"), CFSTR("2"), CFSTR("2"), CFSTR("3"), CFSTR("3"), CFSTR("4"), CFSTR("4"), CFSTR("5"), CFSTR("5"), CFSTR("6"), CFSTR("6"), CFSTR("7"), CFSTR("7"), CFSTR("8"), CFSTR("8"),
    CFSTR("9"),
    CFSTR("9"),
    CFSTR("0"),
    CFSTR("０"),
    CFSTR("1"),
    CFSTR("１"),
    CFSTR("2"),
    CFSTR("２"),
    CFSTR("3"),
    CFSTR("３"),
    CFSTR("4"),
    CFSTR("４"),
    CFSTR("5"),
    CFSTR("５"),
    CFSTR("6"),
    CFSTR("６"),
    CFSTR("7"),
    CFSTR("７"),
    CFSTR("8"),
    CFSTR("８"),
    CFSTR("9"),
    CFSTR("９"),
    CFSTR("0"),
    CFSTR("٠"),
    CFSTR("1"),
    CFSTR("١"),
    CFSTR("2"),
    CFSTR("٢"),
    CFSTR("3"),
    CFSTR("٣"),
    CFSTR("4"),
    CFSTR("٤"),
    CFSTR("5"),
    CFSTR("٥"),
    CFSTR("6"),
    CFSTR("٦"),
    CFSTR("7"),
    CFSTR("٧"),
    CFSTR("8"),
    CFSTR("٨"),
    CFSTR("9"),
    CFSTR("٩"),
    CFSTR("0"),
    CFSTR("۰"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_253EC0AF0;
  qword_253EC0AF0 = v0;

}

void __47___NBPhoneNumberUtil_initNormalizationMappings__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[4];

  v9[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("0"), CFSTR("1"), CFSTR("1"), CFSTR("2"), CFSTR("2"), CFSTR("3"), CFSTR("3"), CFSTR("4"), CFSTR("4"), CFSTR("5"), CFSTR("5"), CFSTR("6"), CFSTR("6"), CFSTR("7"), CFSTR("7"), CFSTR("8"), CFSTR("8"),
    CFSTR("9"),
    CFSTR("9"),
    CFSTR("+"),
    CFSTR("+"),
    CFSTR("*"),
    CFSTR("*"),
    CFSTR("#"),
    CFSTR("#"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_253EC0AF8;
  qword_253EC0AF8 = v0;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("0"), CFSTR("0"), CFSTR("1"), CFSTR("1"), CFSTR("2"), CFSTR("2"), CFSTR("3"), CFSTR("3"), CFSTR("4"), CFSTR("4"), CFSTR("5"), CFSTR("5"), CFSTR("6"), CFSTR("6"), CFSTR("7"), CFSTR("7"), CFSTR("8"),
    CFSTR("8"),
    CFSTR("9"),
    CFSTR("9"),
    CFSTR("0"),
    CFSTR("０"),
    CFSTR("1"),
    CFSTR("１"),
    CFSTR("2"),
    CFSTR("２"),
    CFSTR("3"),
    CFSTR("３"),
    CFSTR("4"),
    CFSTR("４"),
    CFSTR("5"),
    CFSTR("５"),
    CFSTR("6"),
    CFSTR("６"),
    CFSTR("7"),
    CFSTR("７"),
    CFSTR("8"),
    CFSTR("８"),
    CFSTR("9"),
    CFSTR("９"),
    CFSTR("0"),
    CFSTR("٠"),
    CFSTR("1"),
    CFSTR("١"),
    CFSTR("2"),
    CFSTR("٢"),
    CFSTR("3"),
    CFSTR("٣"),
    CFSTR("4"),
    CFSTR("٤"),
    CFSTR("5"),
    CFSTR("٥"),
    CFSTR("6"),
    CFSTR("٦"),
    CFSTR("7"),
    CFSTR("٧"),
    CFSTR("8"),
    CFSTR("٨"),
    CFSTR("9"),
    CFSTR("٩"),
    CFSTR("0"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_253EC0B00;
  qword_253EC0B00 = v2;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("0"), CFSTR("0"), CFSTR("1"), CFSTR("1"), CFSTR("2"), CFSTR("2"), CFSTR("3"), CFSTR("3"), CFSTR("4"), CFSTR("4"), CFSTR("5"), CFSTR("5"), CFSTR("6"), CFSTR("6"), CFSTR("7"), CFSTR("7"), CFSTR("8"),
    CFSTR("8"),
    CFSTR("9"),
    CFSTR("9"),
    CFSTR("A"),
    CFSTR("A"),
    CFSTR("B"),
    CFSTR("B"),
    CFSTR("C"),
    CFSTR("C"),
    CFSTR("D"),
    CFSTR("D"),
    CFSTR("E"),
    CFSTR("E"),
    CFSTR("F"),
    CFSTR("F"),
    CFSTR("G"),
    CFSTR("G"),
    CFSTR("H"),
    CFSTR("H"),
    CFSTR("I"),
    CFSTR("I"),
    CFSTR("J"),
    CFSTR("J"),
    CFSTR("K"),
    CFSTR("K"),
    CFSTR("L"),
    CFSTR("L"),
    CFSTR("M"),
    CFSTR("M"),
    CFSTR("N"),
    CFSTR("N"),
    CFSTR("O"),
    CFSTR("O"),
    CFSTR("P"),
    CFSTR("P"),
    CFSTR("Q"),
    CFSTR("Q"),
    CFSTR("R"),
    CFSTR("R"),
    CFSTR("S"),
    CFSTR("S"),
    CFSTR("T"),
    CFSTR("T"),
    CFSTR("U"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_253EC0B08;
  qword_253EC0B08 = v4;

  v8[0] = &unk_24C3B84C0;
  v8[1] = &unk_24C3B84D8;
  v9[0] = CFSTR("1");
  v9[1] = CFSTR("9");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_253EC0B10;
  qword_253EC0B10 = v6;

}

BOOL __41___NBPhoneNumberUtil_getSupportedRegions__block_invoke(uint64_t a1, void *a2)
{
  return isNan(a2);
}

void __42___NBPhoneNumberUtil_telephonyNetworkInfo__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDC27F8]);
  v1 = (void *)qword_253EC0B20;
  qword_253EC0B20 = (uint64_t)v0;

}

@end
