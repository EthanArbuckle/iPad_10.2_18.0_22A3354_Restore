@implementation NSArray(GKRecipientListStrings)

- (uint64_t)_gkCommaSeparatedRecipientListWithWidth:()GKRecipientListStrings forTextStyle:
{
  return objc_msgSend(a1, "_gkCommaSeparatedRecipientListWithWidth:forTextStyle:usingSelector:", a3, sel_description);
}

- (__CFString)_gkCommaSeparatedRecipientListWithWidth:()GKRecipientListStrings forTextStyle:usingSelector:
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  double v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  int v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v40;
  id v41;

  v41 = a4;
  v8 = objc_msgSend(a1, "count");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = 0;
    v12 = a2;
    v13 = &stru_1E59EB978;
    do
    {
      objc_msgSend(a1, "objectAtIndex:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_gkInvokeSelector:", a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 < 1)
      {
        v18 = v13;
      }
      else
      {
        GKGameCenterUIFrameworkBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v17);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "_gkAttributedStringByApplyingStyle:", v41);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "size");
      v22 = v21;

      if (v22 <= v12)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFString length](v13, "length"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v23);

        v24 = v19;
        ++v11;
        v13 = v24;
      }

      if (v22 > v12)
        break;
      v10 = v11;
    }
    while (v9 > v11);
    if (v22 > v12)
    {
      v25 = (v11 - 1);
      if (v11 < 1)
      {
        v36 = v13;
LABEL_18:
        objc_msgSend(MEMORY[0x1E0CB37F0], "gk_formatInteger:withGrouping:", v9, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0CB3940];
        GKGameCenterUIFrameworkBundle();
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringWithFormat:", v38, v27);
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v26 = v9 - v11;
        while (1)
        {
          objc_msgSend(MEMORY[0x1E0CB37F0], "gk_formatInteger:withGrouping:", v26, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          GKGameCenterUIFrameworkBundle();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          GKGetLocalizedStringFromTableInBundle();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingFormat:](v13, "stringByAppendingFormat:", v29, v27);
          v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

          -[__CFString _gkAttributedStringByApplyingStyle:](v30, "_gkAttributedStringByApplyingStyle:", v41);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "size");
          v33 = v32;

          if (v33 <= v12)
            break;
          --v11;
          objc_msgSend(v40, "objectAtIndex:", v25);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "intValue");

          -[__CFString substringWithRange:](v13, "substringWithRange:", 0, v35);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v26;
          --v25;
          v13 = v36;
          if (!v11)
            goto LABEL_18;
        }
      }

      v13 = v30;
    }

  }
  else
  {
    v13 = &stru_1E59EB978;
  }

  return v13;
}

@end
