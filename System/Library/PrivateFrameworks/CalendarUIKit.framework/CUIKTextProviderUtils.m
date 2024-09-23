@implementation CUIKTextProviderUtils

+ (id)timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:(id)a3 designatorRequiresWhitespace:(BOOL)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  uint64_t v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  id v34;
  BOOL v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3578], "_componentsFromFormatString:", v5);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v7)
  {
    v8 = v7;
    v36 = a4;
    v37 = v5;
    v9 = 0;
    v10 = *(_QWORD *)v41;
    v11 = *MEMORY[0x1E0C99730];
    v12 = *MEMORY[0x1E0C99740];
LABEL_3:
    v13 = 0;
    v38 = v9;
    v39 = v9 + v8;
    while (1)
    {
      if (*(_QWORD *)v41 != v10)
        objc_enumerationMutation(v6);
      v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v13);
      objc_msgSend(v14, "objectForKeyedSubscript:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "BOOLValue") & 1) == 0)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "hasPrefix:", CFSTR("a"));

        if ((v17 & 1) != 0)
          break;
      }

      if (v8 == ++v13)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        v9 = v39;
        if (v8)
          goto LABEL_3;
        v18 = v6;
        v5 = v37;
        goto LABEL_35;
      }
    }

    v19 = v38;
    if ((v38 ^ 0x7FFFFFFFFFFFFFFFLL) == v13)
      goto LABEL_29;
    if (v36)
    {
      v20 = 0;
    }
    else
    {
      if (v38 + v13)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v38 + v13 - 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "BOOLValue"))
        {
          objc_msgSend(v21, "objectForKeyedSubscript:", v12);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringByTrimmingCharactersInSet:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = objc_msgSend(v25, "length") == 0;
          v19 = v38;
        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        v20 = 0;
      }
      if (v38 + v13 < (unint64_t)(objc_msgSend(v6, "count") - 1))
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v19 + v13 + 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v11);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "BOOLValue"))
        {
          objc_msgSend(v26, "objectForKeyedSubscript:", v12);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringByTrimmingCharactersInSet:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = objc_msgSend(v30, "length") == 0;
          v19 = v38;
        }
        else
        {
          v31 = 0;
        }

        if (v20)
          goto LABEL_30;
        goto LABEL_28;
      }
    }
    v31 = 0;
    if (v20)
      goto LABEL_30;
LABEL_28:
    if (v31)
    {
LABEL_30:
      v32 = (void *)objc_msgSend(v6, "mutableCopy");
      v33 = v32;
      if (v31)
        objc_msgSend(v32, "removeObjectAtIndex:", v19 + v13 + 1);
      if (v20)
        objc_msgSend(v33, "removeObjectAtIndex:", v19 + v13 - 1);
      v18 = v33;

      objc_msgSend(MEMORY[0x1E0CB3578], "_formatStringFromComponents:", v18);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      v6 = v37;
      goto LABEL_35;
    }
LABEL_29:
    v5 = v37;
    goto LABEL_36;
  }
  v18 = v6;
LABEL_35:

  v6 = v18;
LABEL_36:
  v34 = v5;

  return v34;
}

+ (BOOL)designatorRequiresWhitespace
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DESIGNATOR_REQUIRES_WHITESPACE"), CFSTR("0"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("1"));
  return (char)v2;
}

+ (BOOL)smallCapsAllowed
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SMALL_CAPS_FONT_ALLOWED"), CFSTR("1"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("1"));
  return (char)v2;
}

+ (BOOL)dropLeftRedundantDesignator
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERVAL_DROP_LEFTMOST_REDUNDANT_DESIGNATOR"), CFSTR("1"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("1"));
  return (char)v2;
}

@end
