@implementation NSString(CKUtilities)

- (BOOL)__ck_shouldUseBigEmoji
{
  void *v1;
  _BOOL8 v2;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", a1);
  v2 = (unint64_t)(objc_msgSend(v1, "__ck_bigEmojiStyle") - 1) < 3;

  return v2;
}

- (BOOL)__ck_containsOnlyCharactersFromSet:()CKUtilities
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  v6 = objc_msgSend(a1, "__ck_rangeOfSequenceOfCharactersFromSet:options:range:", v4, 0, 0, v5);
  v8 = v7;

  return !v6 && v5 == v8;
}

- (uint64_t)__ck_rangeOfSequenceOfCharactersFromSet:()CKUtilities options:range:
{
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;

  v10 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3010000000;
  v22 = &unk_18E8EEE6F;
  v23 = xmmword_18E7C9230;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__NSString_CKUtilities____ck_rangeOfSequenceOfCharactersFromSet_options_range___block_invoke;
  v14[3] = &unk_1E274E368;
  v14[4] = a1;
  v11 = v10;
  v16 = &v19;
  v17 = a4;
  v15 = v11;
  v18 = (a4 & 4) != 0;
  CKEnumerateSearchRange(a5, a6, (a4 & 4) >> 1, (uint64_t)v14);
  v12 = v20[4];

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (id)__ck_stringByRedactingQuotedSubstrings
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  int v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "length");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = objc_msgSend(a1, "characterAtIndex:", v5);
      if (v7 << 24 == 570425344)
      {
        if ((v6 & 1) != 0)
          goto LABEL_9;
        objc_msgSend(v2, "appendString:", CFSTR("\"<redacted>\"));
      }
      else if ((v6 & 1) == 0)
      {
        objc_msgSend(v2, "appendFormat:", CFSTR("%c"), (char)v7);
LABEL_9:
        v6 = 0;
        goto LABEL_10;
      }
      v6 = 1;
LABEL_10:
      ++v5;
    }
    while (v4 != v5);
  }
  v8 = (void *)objc_msgSend(v2, "copy");

  return v8;
}

@end
