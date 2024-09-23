@implementation CNUIStringUtilities

+ (int64_t)composedCharacterCountForString:(id)a3
{
  return objc_msgSend(a1, "composedCharacterCountForString:containsEmoji:", a3, 0);
}

+ (int64_t)composedCharacterCountForString:(id)a3 containsEmoji:(BOOL *)a4
{
  id v5;
  unint64_t v6;
  char v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    v8 = 0;
    v7 = 0;
    if (!a4)
      goto LABEL_8;
    goto LABEL_7;
  }
  v6 = 0;
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = objc_msgSend(v5, "rangeOfComposedCharacterSequenceAtIndex:", v6);
    v11 = v10;
    if (a4)
    {
      objc_msgSend(v5, "substringWithRange:", v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 |= CEMStringContainsEmoji() != 0;

    }
    v6 += v11;
    ++v8;
  }
  while (v6 < objc_msgSend(v5, "length"));
  if (a4)
LABEL_7:
    *a4 = v7 & 1;
LABEL_8:

  return v8;
}

+ (BOOL)stringContainsEmoji:(id)a3
{
  return CEMStringContainsEmoji() != 0;
}

+ (BOOL)stringIsSingleEmoji:(id)a3
{
  return CEMStringIsSingleEmoji() != 0;
}

@end
