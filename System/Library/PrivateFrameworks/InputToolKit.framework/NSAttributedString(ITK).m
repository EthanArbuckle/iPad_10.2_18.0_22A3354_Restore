@implementation NSAttributedString(ITK)

- (uint64_t)itk_range
{
  objc_msgSend(a1, "length");
  return 0;
}

- (void)itk_enumerateClampedAttribute:()ITK inRange:options:usingBlock:
{
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[6];

  v12 = a3;
  v13 = a7;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3010000000;
  v18[3] = &unk_23F0D9B93;
  v18[4] = a4;
  v18[5] = a5;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __84__NSAttributedString_ITK__itk_enumerateClampedAttribute_inRange_options_usingBlock___block_invoke;
  v15[3] = &unk_250F9E3E8;
  v14 = v13;
  v16 = v14;
  v17 = v18;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v12, a4, a5, a6, v15);

  _Block_object_dispose(v18, 8);
}

- (void)itk_enumerateUnclampedAttribute:()ITK inRange:options:usingBlock:
{
  id v12;
  void (**v13)(id, void *, unint64_t, uint64_t, char *);
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;

  v12 = a3;
  v13 = a7;
  if (a5)
  {
    v14 = a4 + ((a5 - 1) & (a6 << 62 >> 63));
    v21 = 0;
    v15 = objc_msgSend(a1, "length");
    while (1)
    {
      v19 = 0;
      v20 = 0;
      if ((a6 & 0x100000) != 0)
        objc_msgSend(a1, "attribute:atIndex:effectiveRange:", v12, v14, &v19);
      else
        objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", v12, v14, &v19, 0, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, v16, v19, v20, &v21);
      if (v21)
        break;
      if ((a6 & 2) != 0)
      {
        if (v19 <= a4)
          break;
        v14 = v19 - 1;
      }
      else
      {
        v17 = objc_msgSend(a1, "length");
        v18 = a5 - v15 + v17;
        if (v17 == v15)
          v14 = v20 + v19;
        else
          v14 = v17 - v15 + v19 + v20;
        if (v17 != v15)
        {
          v15 = v17;
          a5 = v18;
        }
        if (v14 >= a5 + a4)
          break;
      }

    }
  }

}

- (id)itk_attributedStringByReplacingNewlineCharactersWithWhiteSpace
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itk_attributedStringByReplacingCharactersInSet:withString:", v2, CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)itk_attributedStringByReplacingCharactersInSet:()ITK withString:
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
      v17 = objc_msgSend(v16, "length") - v13;

      objc_msgSend(v11, "string");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v18, "rangeOfCharacterFromSet:options:range:", v6, 2, v13, v17);
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

@end
