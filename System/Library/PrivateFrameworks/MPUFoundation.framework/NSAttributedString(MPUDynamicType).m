@implementation NSAttributedString(MPUDynamicType)

- (id)MPU_attributedStringByUpdatingTextStyleFontsToPreferredTextStyleFonts
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  v3 = *MEMORY[0x24BDF65F8];
  v4 = objc_msgSend(a1, "length");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __107__NSAttributedString_MPUDynamicType__MPU_attributedStringByUpdatingTextStyleFontsToPreferredTextStyleFonts__block_invoke;
  v7[3] = &unk_24DD6E258;
  v5 = v2;
  v8 = v5;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v4, 0, v7);

  return v5;
}

- (BOOL)MPU_hasUniformFont
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  __int128 v7;

  v2 = objc_msgSend(a1, "length");
  if (!v2)
    return 1;
  v3 = v2;
  v7 = xmmword_21A9CEF30;
  v4 = (id)objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x24BDF65F8], 0, &v7, 0, v2);
  return !(_QWORD)v7 && *((_QWORD *)&v7 + 1) == v3;
}

- (id)MPU_tallestFontFromAttributes
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  _QWORD v6[6];
  _QWORD v7[4];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  v2 = objc_msgSend(a1, "length");
  if (v2)
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x2020000000;
    v7[3] = 0x10000000000000;
    v3 = *MEMORY[0x24BDF65F8];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __67__NSAttributedString_MPUDynamicType__MPU_tallestFontFromAttributes__block_invoke;
    v6[3] = &unk_24DD6E280;
    v6[4] = v7;
    v6[5] = &v8;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v2, 0, v6);
    _Block_object_dispose(v7, 8);
  }
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

@end
