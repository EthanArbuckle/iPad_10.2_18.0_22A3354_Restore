@implementation NSAttributedString(IC)

- (uint64_t)ic_range
{
  objc_msgSend(a1, "length");
  return 0;
}

- (void)ic_enumerateUnclampedAttribute:()IC inRange:options:usingBlock:
{
  id v12;
  void (**v13)(id, uint64_t, NSUInteger, uint64_t, char *);
  NSUInteger v14;
  NSRange v15;
  NSUInteger length;
  uint64_t v17;
  NSUInteger v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  BOOL v24;
  NSUInteger v25;
  uint64_t v26;
  char v27;
  NSRange v28;
  NSRange v29;

  v12 = a3;
  v13 = a7;
  v29.location = objc_msgSend(a1, "ic_range");
  v29.length = v14;
  v28.location = a4;
  v28.length = a5;
  v15 = NSIntersectionRange(v28, v29);
  length = v15.length;
  if (v15.length)
  {
    v27 = 0;
    v17 = objc_msgSend(a1, "length");
    v18 = v15.location + ((v15.length - 1) & (a6 << 62 >> 63));
    if ((a6 & 0x100000) != 0)
      goto LABEL_4;
LABEL_3:
    objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", v12, v18, &v25, 0, v17);
    for (i = objc_claimAutoreleasedReturnValue(); ; i = objc_claimAutoreleasedReturnValue())
    {
      v20 = (void *)i;
      v13[2](v13, i, v25, v26, &v27);
      if (v27)
        break;
      if ((a6 & 2) != 0)
      {
        if (v25 <= v15.location)
          break;
        v18 = v25 - 1;
      }
      else
      {
        v21 = objc_msgSend(a1, "length");
        v22 = v21 - v17 + v25 + v26;
        v23 = length - v17 + v21;
        v24 = v21 == v17;
        if (v21 == v17)
        {
          v18 = v26 + v25;
        }
        else
        {
          v17 = v21;
          v18 = v22;
        }
        if (!v24)
          length = v23;
        if (v18 >= length + v15.location)
          break;
      }

      if ((a6 & 0x100000) == 0)
        goto LABEL_3;
LABEL_4:
      objc_msgSend(a1, "attribute:atIndex:effectiveRange:", v12, v18, &v25);
    }

  }
}

- (void)ic_enumerateClampedAttribute:()IC inRange:options:usingBlock:
{
  id v12;
  id v13;
  NSUInteger v14;
  NSRange v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[6];
  NSRange v20;
  NSRange v21;
  NSRange v22;

  v12 = a3;
  v13 = a7;
  v22.location = objc_msgSend(a1, "ic_range");
  v22.length = v14;
  v21.location = a4;
  v21.length = a5;
  v15 = NSIntersectionRange(v21, v22);
  if (v15.length)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x4012000000;
    v19[3] = __Block_byref_object_copy__7;
    v19[4] = __Block_byref_object_dispose__7;
    v19[5] = &unk_1DDAFB48B;
    v20 = v15;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82__NSAttributedString_IC__ic_enumerateClampedAttribute_inRange_options_usingBlock___block_invoke;
    v16[3] = &unk_1EA824DE0;
    v17 = v13;
    v18 = v19;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v12, v15.location, v15.length, a6, v16);

    _Block_object_dispose(v19, 8);
  }

}

- (uint64_t)ic_enclosingRangeContainingCharactersInSet:()IC forRange:
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = a3;
  objc_msgSend(a1, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a4 + a5;
  while (1)
  {
    v11 = a4;
    if (!a4)
      break;
    v12 = a5;
    --a4;
    if (v11 - 1 < (unint64_t)objc_msgSend(v9, "length"))
    {
      ++a5;
      if ((objc_msgSend(v8, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v11 - 1)) & 1) != 0)
        continue;
    }
    goto LABEL_7;
  }
  v12 = v10;
  do
  {
LABEL_7:
    if (v11 + v12 >= (unint64_t)objc_msgSend(v9, "length"))
      break;
    ++v12;
  }
  while ((objc_msgSend(v8, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:")) & 1) != 0);

  return v11;
}

- (id)ic_componentRangesSeparatedByPredicate:()IC inRange:
{
  uint64_t (**v8)(id, _QWORD, uint64_t);
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v8 = a3;
  objc_msgSend(a1, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = a4 + a5;
  if (a4 < a4 + a5)
  {
    v12 = 0;
    v13 = a4;
    do
    {
      if ((v8[2](v8, v13, objc_msgSend(v9, "characterAtIndex:", v13)) & 1) != 0)
      {
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a4, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v14);

        }
        v12 = 0;
        a4 = ++v13;
      }
      else
      {
        ++v12;
        ++v13;
      }
    }
    while (v13 != v11);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a4, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v15);

    }
  }

  return v10;
}

- (uint64_t)ic_rangeByTrimmingCharactersInSet:()IC inRange:
{
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v8 = a3;
  objc_msgSend(a1, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a4 + a5;
  if (a4 < a4 + a5 && a5)
  {
    v11 = a4;
    while ((objc_msgSend(v8, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v11)) & 1) != 0)
    {
      v12 = 0;
      if (++v11 < v10)
      {
        if (--a5)
          continue;
      }
      goto LABEL_11;
    }
    v12 = a5;
LABEL_11:
    v10 = v12 + v11;
    a5 = v12;
    if (!v12)
      goto LABEL_18;
  }
  else
  {
    v11 = a4;
    if (!a5)
    {
LABEL_18:
      if (!a5)
        v11 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_20;
    }
  }
  if (v10 <= a4)
    goto LABEL_18;
  v13 = a5 - 1;
  while ((objc_msgSend(v8, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v10 - 1)) & 1) != 0)
  {
    v14 = v13 - 1;
    if (v13)
    {
      v10 = --a5 + v11;
      v15 = v11 + v13--;
      if (v15 > a4)
        continue;
    }
    a5 = v14 + 1;
    goto LABEL_18;
  }
LABEL_20:

  return v11;
}

- (id)ic_attributedSubstringFromRange:()IC
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "rangeOfComposedCharacterSequencesForRange:", a3, a4);
  objc_msgSend(a1, "attributedSubstringFromRange:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)ic_enumerateAttributesInClampedRange:()IC options:usingBlock:
{
  id v10;
  NSUInteger v11;
  NSRange v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[6];
  NSRange v17;
  NSRange v18;
  NSRange v19;

  v10 = a6;
  v19.location = objc_msgSend(a1, "ic_range");
  v19.length = v11;
  v18.location = a3;
  v18.length = a4;
  v12 = NSIntersectionRange(v18, v19);
  if (v12.length)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x4012000000;
    v16[3] = __Block_byref_object_copy__7;
    v16[4] = __Block_byref_object_dispose__7;
    v16[5] = &unk_1DDAFB48B;
    v17 = v12;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __82__NSAttributedString_IC__ic_enumerateAttributesInClampedRange_options_usingBlock___block_invoke;
    v13[3] = &unk_1EA824DB8;
    v14 = v10;
    v15 = v16;
    objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", v12.location, v12.length, a5, v13);

    _Block_object_dispose(v16, 8);
  }

}

- (id)ic_attributedStringByReplacingNewlineCharactersWithWhiteSpace
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_attributedStringByReplacingCharactersInSet:withString:", v2, CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ic_attributedStringByReplacingCharactersInSet:()IC withString:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v6);

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "rangeOfCharacterFromSet:", v6);
    v15 = v14;

    while (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "replaceCharactersInRange:withString:", v13, v15, v7);
      objc_msgSend(v11, "string");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");

      objc_msgSend(v11, "string");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v18, "rangeOfCharacterFromSet:options:range:", v6, 2, v13, v17 - v13);
      v15 = v19;

    }
    if (v11)
    {
      v20 = objc_msgSend(v11, "copy");

      v8 = (id)v20;
    }
  }

  return v8;
}

- (uint64_t)ic_containsAttribute:()IC inRange:
{
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__NSAttributedString_IC__ic_containsAttribute_inRange___block_invoke;
  v7[3] = &unk_1EA824E08;
  v7[4] = &v8;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", a3, a4, a5, 0x100000, v7);
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

+ (id)ic_emptyAttributedString
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1EA825738);
}

@end
