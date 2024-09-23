@implementation NSAttributedString(CRKAdditions)

- (uint64_t)crk_familyNameRange
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  const char *v10;
  __int128 v11;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3010000000;
  v10 = "";
  v11 = xmmword_218D502B0;
  v2 = objc_msgSend(a1, "length");
  v3 = *MEMORY[0x24BDD1140];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__NSAttributedString_CRKAdditions__crk_familyNameRange__block_invoke;
  v6[3] = &unk_24D9CA340;
  v6[4] = &v7;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v2, 0, v6);
  v4 = v8[4];
  _Block_object_dispose(&v7, 8);
  return v4;
}

@end
