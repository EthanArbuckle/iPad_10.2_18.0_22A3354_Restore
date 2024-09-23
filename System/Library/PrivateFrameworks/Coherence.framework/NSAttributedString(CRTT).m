@implementation NSAttributedString(CRTT)

- (id)cr_attributedSubstringFromRange:()CRTT
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

- (void)cr_enumerateClampedAttribute:()CRTT inRange:options:usingBlock:
{
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[8];

  v12 = a7;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x4012000000;
  v17[3] = __Block_byref_object_copy__0;
  v17[4] = __Block_byref_object_dispose__0;
  v17[5] = &unk_1BE20E2A2;
  v17[6] = a4;
  v17[7] = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__NSAttributedString_CRTT__cr_enumerateClampedAttribute_inRange_options_usingBlock___block_invoke;
  v14[3] = &unk_1E775E328;
  v15 = v12;
  v16 = v17;
  v13 = v12;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", a3, a4, a5, a6, v14);

  _Block_object_dispose(v17, 8);
}

- (void)cr_enumerateUnclampedAttribute:()CRTT inRange:options:usingBlock:
{
  id v12;
  void (**v13)(id, uint64_t, unint64_t, uint64_t, char *);
  uint64_t v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  char v24;

  v12 = a3;
  v13 = a7;
  if (a5)
  {
    v24 = 0;
    v14 = objc_msgSend(a1, "length");
    v15 = a4 + ((a5 - 1) & (a6 << 62 >> 63));
    if ((a6 & 0x100000) != 0)
      goto LABEL_4;
LABEL_3:
    objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", v12, v15, &v22, 0, v14);
    for (i = objc_claimAutoreleasedReturnValue(); ; i = objc_claimAutoreleasedReturnValue())
    {
      v17 = (void *)i;
      v13[2](v13, i, v22, v23, &v24);
      if (v24)
        break;
      if ((a6 & 2) != 0)
      {
        if (v22 <= a4)
          break;
        v15 = v22 - 1;
      }
      else
      {
        v18 = objc_msgSend(a1, "length");
        v19 = v18 - v14 + v22 + v23;
        v20 = a5 - v14 + v18;
        v21 = v18 == v14;
        if (v18 == v14)
        {
          v15 = v23 + v22;
        }
        else
        {
          v14 = v18;
          v15 = v19;
        }
        if (!v21)
          a5 = v20;
        if (v15 >= a5 + a4)
          break;
      }

      if ((a6 & 0x100000) == 0)
        goto LABEL_3;
LABEL_4:
      objc_msgSend(a1, "attribute:atIndex:effectiveRange:", v12, v15, &v22);
    }

  }
}

@end
