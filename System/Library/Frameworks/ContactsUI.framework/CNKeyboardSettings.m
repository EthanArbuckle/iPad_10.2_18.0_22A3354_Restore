@implementation CNKeyboardSettings

+ (id)newKeyboardSettingsForProperty:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  const __CFString *v13;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("phone"), CFSTR("none"), CFSTR("never"), &stru_1E20507A8, CFSTR("yes"), CFSTR("yes"), 0);
    goto LABEL_10;
  }
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967B0]))
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D20]);
    v13 = CFSTR(" ");
    v6 = CFSTR("context");
    v7 = CFSTR("sentence");
    goto LABEL_5;
  }
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C968A0]))
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("url"), CFSTR("none"), CFSTR("never"), &stru_1E20507A8, CFSTR("no"), CFSTR("no"), 0);
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C966A8]))
    {
      if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96740]))
      {
        v5 = objc_alloc(MEMORY[0x1E0C99D20]);
      }
      else
      {
        v12 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96868]);
        v5 = objc_alloc(MEMORY[0x1E0C99D20]);
        if (!v12)
        {
          v13 = &stru_1E20507A8;
          v6 = CFSTR("never");
          v7 = CFSTR("word");
          goto LABEL_5;
        }
      }
      v13 = &stru_1E20507A8;
      v6 = CFSTR("never");
      v7 = CFSTR("none");
LABEL_5:
      v4 = objc_msgSend(v5, "initWithObjects:", CFSTR("alpha"), v7, v6, v13, CFSTR("no"), CFSTR("no"), 0);
      goto LABEL_10;
    }
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("email"), CFSTR("none"), CFSTR("never"), &stru_1E20507A8, CFSTR("no"), CFSTR("no"), 0);
  }
LABEL_10:
  v8 = (void *)v4;
  if (v4)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("fmt"), CFSTR("caps"), CFSTR("suggest"), CFSTR("sep"), CFSTR("single"), CFSTR("suggest-delegate"), 0);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:", v8, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (int64_t)keyboardTypeFromDictionary:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "valueForKey:", CFSTR("fmt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("alpha")))
  {
    if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("num")))
    {
      if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("phone")))
      {
        if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("url")))
        {
          if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("email")))
            v5 = 0;
          else
            v5 = 7;
        }
        else
        {
          v5 = 3;
        }
      }
      else
      {
        v5 = 5;
      }
    }
    else
    {
      v5 = 2;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (int64_t)autocorrectionTypeFromDictionary:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "valueForKey:", CFSTR("suggest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("context")))
      v5 = 1;
    else
      v5 = 2;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

+ (int64_t)autocapitalizationTypeFromDictionary:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "valueForKey:", CFSTR("caps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_8;
  if (!objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("all")))
  {
    v5 = 3;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("word")))
  {
    if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("none")))
    {
      if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("sentence")))
        v5 = 1;
      else
        v5 = 2;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
LABEL_8:
    v5 = 1;
  }
LABEL_11:

  return v5;
}

+ (BOOL)contentsIsSingleValue:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "valueForKey:", CFSTR("single"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("yes")) == 0;
  else
    v5 = 0;

  return v5;
}

+ (BOOL)usesTextSuggestionDelegate:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "valueForKey:", CFSTR("suggest-delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("yes")) == 0;
  else
    v5 = 0;

  return v5;
}

@end
