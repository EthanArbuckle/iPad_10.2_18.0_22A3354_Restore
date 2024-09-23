@implementation NSString(TWStringAdditions)

- (uint64_t)TWTwitterCharacterCountWithShortenedURLLength:()TWStringAdditions
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  uint64_t v19;

  v19 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14E8]), "initWithTypes:error:", 32, &v19);
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v17 = v4;
  v6 = (void *)objc_msgSend(v4, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  v7 = objc_msgSend(v6, "count");
  if (v7 >= 1)
  {
    v8 = 0;
    v9 = 0;
    v10 = v7 + 1;
    while (1)
    {
      v11 = (void *)objc_msgSend(v6, "objectAtIndex:", (v10 - 2));
      if (objc_msgSend(v11, "resultType") == 32)
      {
        v12 = (void *)objc_msgSend((id)objc_msgSend(v11, "URL"), "scheme");
        if (!objc_msgSend(v12, "compare:options:", CFSTR("https"), 1))
        {
          ++v9;
          goto LABEL_8;
        }
        if (!objc_msgSend(v12, "compare:options:", CFSTR("http"), 1))
        {
          ++v8;
LABEL_8:
          v13 = objc_msgSend(v11, "range");
          objc_msgSend(v5, "replaceCharactersInRange:withString:", v13, v14, &stru_24E6EB548);
        }
      }
      if ((unint64_t)--v10 <= 1)
        goto LABEL_12;
    }
  }
  v9 = 0;
  v8 = 0;
LABEL_12:
  v15 = v9
      + v9 * a3
      + v8 * a3
      + objc_msgSend((id)objc_msgSend(v5, "precomposedStringWithCanonicalMapping"), "length");

  return v15;
}

@end
