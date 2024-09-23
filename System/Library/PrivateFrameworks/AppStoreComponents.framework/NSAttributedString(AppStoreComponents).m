@implementation NSAttributedString(AppStoreComponents)

+ (id)asc_attributedStringWithLockupHeading:()AppStoreComponents compatibleWithTraitCollection:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "length"))
  {
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(":::"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    if (v10 == 2)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v10 - 1;
      if (v10 == 1)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = 0;
      }
      else
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "subarrayWithRange:", 1, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR(":::"));
        v12 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  else
  {
    v13 = 0;
    v12 = 0;
  }

  v15 = v13;
  v16 = v12;
  if (v16)
  {
    ASCLockupImageStringForName(v15, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = objc_alloc_init(MEMORY[0x1E0CB3778]);
      objc_msgSend(v18, "appendAttributedString:", v17);
      objc_msgSend(v18, "addAttribute:value:range:", CFSTR("ASCLockupHeadingImageName"), v15, 0, objc_msgSend(v17, "length"));
      objc_msgSend(v18, "mutableString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ASCLocalizedString(CFSTR("LOCKUP_HEADING_JOINER"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "appendString:", v21);

      objc_msgSend(v18, "mutableString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "appendString:", v16);

      v23 = (void *)objc_msgSend(v18, "copy");
    }
    else
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v16);
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (id)asc_attributedStringWithLockupTextContainingSymbols:()AppStoreComponents compatibleWithTraitCollection:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    v16 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(":::"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  if (!objc_msgSend(v7, "count"))
  {
LABEL_9:
    v16 = (void *)objc_msgSend(v8, "copy");
    goto LABEL_12;
  }
  v9 = 0;
  while (1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((v9 & 1) != 0)
      break;
    objc_msgSend(v8, "mutableString");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:", v11);
LABEL_8:

    if (++v9 >= (unint64_t)objc_msgSend(v7, "count"))
      goto LABEL_9;
  }
  v12 = v10;
  ASCLockupImageStringForName(v12, v6);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ASCLockupTextImageName %ld "), v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendAttributedString:", v14);
    objc_msgSend(v8, "addAttribute:value:range:", v15, v12, 0, objc_msgSend(v14, "length"));

    goto LABEL_8;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v5);

LABEL_12:
LABEL_13:

  return v16;
}

@end
