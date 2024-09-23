@implementation NSAttributedString(MKAttributedFormat)

+ (id)_mapkit_attributedStringWithBindingFormat:()MKAttributedFormat replacements:attributes:error:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend([a1 alloc], "initWithString:attributes:", v12, v10);

  objc_msgSend(v13, "_mapkit_attributedStringByApplyingBindingFormatReplacements:defaultReplacementAttributes:error:", v11, v10, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (uint64_t)_mapkit_attributedStringByApplyingBindingFormatReplacements:()MKAttributedFormat error:
{
  return objc_msgSend(a1, "_mapkit_attributedStringByApplyingBindingFormatReplacements:defaultReplacementAttributes:error:", a3, 0, a4);
}

- (uint64_t)_mapkit_attributedStringByApplyingBindingFormatReplacements:()MKAttributedFormat defaultReplacementAttributes:error:
{
  return objc_msgSend(a1, "_mapkit_attributedStringByApplyingBindingFormatReplacements:defaultReplacementAttributes:startTokenDelimiter:endTokenDelimiter:error:", a3, a4, CFSTR("%{"), CFSTR("}@"), a5);
}

+ (id)_mapkit_attributedStringWithBindingFormat:()MKAttributedFormat replacements:defaultReplacementAttributes:startTokenDelimiter:endTokenDelimiter:error:
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend([a1 alloc], "initWithString:attributes:", v18, v16);

  objc_msgSend(v19, "_mapkit_attributedStringByApplyingBindingFormatReplacements:defaultReplacementAttributes:startTokenDelimiter:endTokenDelimiter:error:", v17, v16, v15, v14, a8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_mapkit_attributedStringByApplyingBindingFormatReplacements:()MKAttributedFormat defaultReplacementAttributes:startTokenDelimiter:endTokenDelimiter:error:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  int v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  id v37;
  const __CFString *v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (id)MEMORY[0x1E0C9AA70];
  if (v12)
    v15 = v12;
  v36 = v15;
  objc_msgSend(v13, "substringToIndex:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v13;
  objc_msgSend(v13, "substringFromIndex:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v19 = objc_alloc(MEMORY[0x1E0CB3900]);
  objc_msgSend(a1, "string");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithString:", v20);

  objc_msgSend(v21, "setCharactersToBeSkipped:", 0);
  if ((objc_msgSend(v21, "isAtEnd") & 1) != 0)
  {
LABEL_21:
    v30 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAttributedString:", v18);
    goto LABEL_22;
  }
  v22 = 0;
  while (1)
  {
    objc_msgSend(v21, "scanUpToString:intoString:", v16, 0);
    v23 = objc_msgSend(v21, "scanLocation");
    if (v23 != v22)
    {
      objc_msgSend(a1, "attributedSubstringFromRange:", v22, v23 - v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "appendAttributedString:", v24);

    }
    if (!objc_msgSend(v21, "scanString:intoString:", v16, 0))
      goto LABEL_20;
    if (!objc_msgSend(v21, "scanString:intoString:", v16, 0))
      break;
    objc_msgSend(a1, "attributedSubstringFromRange:", objc_msgSend(v21, "scanLocation") - 1, 1);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendAttributedString:", v25);
LABEL_19:

LABEL_20:
    v22 = objc_msgSend(v21, "scanLocation");
    if (objc_msgSend(v21, "isAtEnd"))
      goto LABEL_21;
  }
  if (objc_msgSend(v17, "length") && !objc_msgSend(v21, "scanString:intoString:", v17, 0))
    goto LABEL_20;
  v37 = 0;
  v26 = objc_msgSend(v21, "scanUpToString:intoString:", v14, &v37);
  v25 = v37;
  v27 = objc_msgSend(v21, "scanString:intoString:", v14, 0);
  if (v26 && v27)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "appendAttributedString:", v28);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a7)
        {
          v40[0] = CFSTR("MKStringAttributedFormatErrorReplacementTokensKey");
          v40[1] = CFSTR("MKStringAttributedFormatErrorReplacementTokensKey");
          v41[0] = v11;
          v41[1] = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MKStringAttributedFormatErrorDomain"), 0, v33);
          *a7 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_27;
      }
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v28, v36);
      objc_msgSend(v18, "appendAttributedString:", v29);

    }
    goto LABEL_19;
  }
  if (!a7)
    goto LABEL_28;
  v38 = CFSTR("MKStringAttributedFormatErrorReplacementTokensKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MKStringAttributedFormatErrorDomain"), 1, v28);
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

LABEL_28:
  v30 = 0;
LABEL_22:

  return v30;
}

+ (id)_mapkit_attributedStringWithBindingFormat:()MKAttributedFormat replacements:attributes:
{
  id v8;
  void *v9;
  id v10;
  id v12;

  v12 = 0;
  v8 = a3;
  objc_msgSend(a1, "_mapkit_attributedStringWithBindingFormat:replacements:attributes:error:", v8, a4, a5, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;
  objc_msgSend(a1, "_handleFormattingError:forString:", v10, v8);

  return v9;
}

- (id)_mapkit_attributedStringByApplyingBindingFormatReplacements:()MKAttributedFormat defaultReplacementAttributes:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v10 = 0;
  objc_msgSend(a1, "_mapkit_attributedStringByApplyingBindingFormatReplacements:defaultReplacementAttributes:error:", a3, a4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = (void *)objc_opt_class();
  objc_msgSend(a1, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_handleFormattingError:forString:", v6, v8);

  return v5;
}

- (id)_mapkit_attributedStringByApplyingBindingFormatReplacements:()MKAttributedFormat
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;

  v9 = 0;
  objc_msgSend(a1, "_mapkit_attributedStringByApplyingBindingFormatReplacements:error:", a3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = (void *)objc_opt_class();
  objc_msgSend(a1, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_handleFormattingError:forString:", v5, v7);

  return v4;
}

+ (void)_handleFormattingError:()MKAttributedFormat forString:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  if (v11)
  {
    if (!objc_msgSend(v11, "code"))
    {
      objc_msgSend(v11, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MKStringAttributedFormatErrorReplacementTokensKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MKStringAttributedFormatErrorReplacementTokensKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MapsBindingFormatArgumentException"), CFSTR("The format string '%@' has specified a key '%@', but that key is not present or not a string or attributed string in the replacements dictionary (value: %@)"), v5, v7, v10);
      goto LABEL_6;
    }
    if (objc_msgSend(v11, "code") == 1)
    {
      objc_msgSend(v11, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MKStringAttributedFormatErrorReplacementTokensKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MapsBindingFormatStringException"), CFSTR("The format string '%@' has an unterminated replacement marker starting at %@."), v5, v7);
LABEL_6:

    }
  }

}

@end
