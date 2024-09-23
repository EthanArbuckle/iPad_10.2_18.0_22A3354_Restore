@implementation NSAttributedString(HFAdditions)

+ (id)hf_attributedStringWithInflectableAccessoryStatus:()HFAdditions accessoryName:forcePluralAgreement:
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (void *)MEMORY[0x1E0CB34D0];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)a5)
    v11 = CFSTR("HFAccessoryStatusInflectionWithNameFormat_PluralAgreement");
  else
    v11 = CFSTR("HFAccessoryStatusInflectionWithNameFormat");
  _HFLocalizedStringWithDefaultValue(v11, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedAttributedStringForKey:value:table:", v12, &stru_1EA741FF8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3498], "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:forcePluralAgreement:markdownFormat:", v9, v8, a5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)hf_attributedStringWithInflectableAccessoryStatus:()HFAdditions accessoryName:forcePluralAgreement:markdownFormat:
{
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  const __CFString *v30;
  __CFString *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  __CFString *v39;
  id obj;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  __CFString *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  int v58;
  id v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v42 = a4;
  v41 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !-[__CFString length](v11, "length"))
  {
    v29 = objc_alloc(MEMORY[0x1E0CB3498]);
    v30 = &stru_1EA741FF8;
LABEL_21:
    v28 = (void *)objc_msgSend(v29, "initWithString:", v30);
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !objc_msgSend(v42, "length")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_msgSend(v41, "string"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "length"),
        v12,
        !v13))
  {
    v29 = objc_alloc(MEMORY[0x1E0CB3498]);
    v30 = v11;
    goto LABEL_21;
  }
  if (-[__CFString containsString:](v11, "containsString:", CFSTR("%")))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v11;
    -[__CFString componentsSeparatedByCharactersInSet:](v11, "componentsSeparatedByCharactersInSet:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_opt_new();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v15;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v44;
      v20 = *MEMORY[0x1E0CB2C20];
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v44 != v19)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if ((objc_msgSend(v22, "containsString:", CFSTR("%")) & 1) != 0)
          {
            objc_msgSend(v16, "na_safeAddObject:", v22);
          }
          else
          {
            v23 = (void *)MEMORY[0x1E0CB3498];
            v62 = v42;
            v63 = v20;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = v24;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "localizedAttributedStringWithFormat:context:", v41, v25, v22);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "string");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "na_safeAddObject:", v27);
          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
      }
      while (v18);
    }

    objc_msgSend(v16, "componentsJoinedByString:", CFSTR(" "));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v11);
  }
  else
  {
    v32 = v11;
    v33 = (void *)MEMORY[0x1E0CB3498];
    v34 = *MEMORY[0x1E0CB2C20];
    v59 = v42;
    v60 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedAttributedStringWithFormat:context:", v41, v36, v32);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v48 = a1;
      v49 = 2112;
      v50 = v38;
      v51 = 2112;
      v52 = v42;
      v53 = 2112;
      v54 = v32;
      v55 = 2112;
      v56 = v28;
      v57 = 1024;
      v58 = a5;
      _os_log_debug_impl(&dword_1DD34E000, v37, OS_LOG_TYPE_DEBUG, "%@: %@ accessoryName: %@ | accessoryStatus: %@ | outputString: %@ | forcePluralAgreement:%{BOOL}d", buf, 0x3Au);

    }
    v11 = v32;
  }
LABEL_22:

  return v28;
}

+ (uint64_t)hf_attributedStringWithInflectableAccessoryStatus:()HFAdditions accessoryName:
{
  return objc_msgSend(MEMORY[0x1E0CB3498], "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:forcePluralAgreement:", a3, a4, 0);
}

- (double)hf_scaleFactorForBoundingSize:()HFAdditions minimumScaleFactor:maximumNumberOfLines:
{
  id v11;
  double v12;
  double v13;

  v11 = objc_alloc_init(MEMORY[0x1E0CEA248]);
  objc_msgSend(v11, "setMinimumScaleFactor:", a4);
  objc_msgSend(v11, "setMaximumNumberOfLines:", a6);
  objc_msgSend(a1, "boundingRectWithSize:options:context:", 1, v11, a2, a3);
  objc_msgSend(v11, "actualScaleFactor");
  v13 = v12;

  return v13;
}

- (uint64_t)hf_attributedStringScaledByFactor:()HFAdditions
{
  return objc_msgSend(a1, "_ui_attributedSubstringFromRange:scaledByScaleFactor:", 0, objc_msgSend(a1, "length"), a2);
}

- (id)hf_scaledAttributedStringWithBoundingSize:()HFAdditions minimumScaleFactor:maximumNumberOfLines:
{
  double v2;
  double v3;
  id v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "hf_scaleFactorForBoundingSize:minimumScaleFactor:maximumNumberOfLines:");
  v3 = v2;
  v4 = a1;
  v5 = v4;
  if (v3 < 1.0)
  {
    objc_msgSend(v4, "hf_attributedStringScaledByFactor:", v3);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

+ (id)hf_attributedStringForString:()HFAdditions withAppendedString:asURL:withAttributes:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  v11 = a4;
  objc_msgSend(a3, "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v12, v10);

  v14 = objc_msgSend(v12, "rangeOfString:options:", v11, 4);
  v16 = v15;

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = *MEMORY[0x1E0CEA0C0];
    v20[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAttributes:range:", v17, v14, v16);

  }
  return v13;
}

+ (id)hf_attributedString:()HFAdditions withAppendedLinkString:linkURL:
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hf_attributedLinkStringForString:linkString:linkURL:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)hf_attributedLinkStringForString:()HFAdditions linkString:linkURL:
{
  return objc_msgSend(MEMORY[0x1E0CB3498], "hf_attributedLinkStringForString:linkString:linkURL:attributes:additionalLinkAttributes:", a3, a4, a5, 0, 0);
}

+ (id)hf_attributedLinkStringForAttributedString:()HFAdditions linkString:linkURL:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v7);
  objc_msgSend(v7, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "rangeOfString:options:", v8, 4);
  v14 = v13;

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "string");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("linkString (%@) is expected to be a substring of fullString (%@)"), v8, v15);

  }
  else
  {
    v21[0] = *MEMORY[0x1E0CEA0A0];
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0CEA0C0];
    v22[0] = v16;
    v22[1] = v9;
    v18 = *MEMORY[0x1E0CEA180];
    v21[1] = v17;
    v21[2] = v18;
    v22[2] = &unk_1EA7CC418;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addAttributes:range:", v19, v12, v14);
  }

  return v10;
}

+ (id)hf_attributedLinkStringForString:()HFAdditions linkString:linkURL:attributes:additionalLinkAttributes:
{
  id v11;
  id v12;
  id v13;
  id v14;
  objc_class *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = (objc_class *)MEMORY[0x1E0CB3778];
  v16 = a6;
  v17 = (void *)objc_msgSend([v15 alloc], "initWithString:attributes:", v11, v16);

  v18 = objc_msgSend(v11, "rangeOfString:options:", v12, 4);
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSLog(CFSTR("linkString (%@) is expected to be a substring of fullString (%@)"), v12, v11);
  }
  else
  {
    v20 = v18;
    v21 = v19;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", &unk_1EA7CC418, *MEMORY[0x1E0CEA180]);
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v23, *MEMORY[0x1E0CEA0A0]);

    objc_msgSend(v22, "na_safeSetObject:forKey:", v13, *MEMORY[0x1E0CEA0C0]);
    if (v14)
      objc_msgSend(v22, "addEntriesFromDictionary:", v14);
    objc_msgSend(v17, "addAttributes:range:", v22, v20, v21);

  }
  return v17;
}

- (id)hf_attributedStringWithDefaultAttributes:()HFAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "hf_attributedStringWithDefaultAttributes:inRange:", v4, 0, objc_msgSend(a1, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hf_attributedStringWithDefaultAttributes:()HFAdditions inRange:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v8 = a3;
  v9 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(a1, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, v8);

  v12 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __84__NSAttributedString_HFAdditions__hf_attributedStringWithDefaultAttributes_inRange___block_invoke;
  v25[3] = &unk_1EA7358B0;
  v13 = v11;
  v26 = v13;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", a4, a5, 0, v25);
  v14 = *MEMORY[0x1E0CEA098];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(v8, "objectForKeyedSubscript:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configurationWithFont:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *MEMORY[0x1E0CEA050];
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __84__NSAttributedString_HFAdditions__hf_attributedStringWithDefaultAttributes_inRange___block_invoke_2;
    v22[3] = &unk_1EA7358D8;
    v23 = v18;
    v24 = v13;
    v20 = v18;
    objc_msgSend(v24, "enumerateAttribute:inRange:options:usingBlock:", v19, a4, a5, 0, v22);

  }
  return v13;
}

- (id)hf_attributedStringByTrimmingCharactersInCharacterSet:()HFAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  objc_msgSend(a1, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1EA741FF8);
  }
  else
  {
    v9 = v7;
    v10 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:", v6, 4);
    objc_msgSend(a1, "attributedSubstringFromRange:", v9, v11 - v9 + v10);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v8;

  return v12;
}

- (uint64_t)hf_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (!hf_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "mutableCopy");

    objc_msgSend(v3, "addCharactersInString:", CFSTR("\uFFFC"));
    v4 = objc_msgSend(v3, "copy");
    v5 = (void *)hf_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters;
    hf_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters = v4;

  }
  return objc_msgSend(a1, "hf_attributedStringByTrimmingCharactersInCharacterSet:");
}

+ (id)hf_loadFromHTMLWithString:()HFAdditions options:
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__NSAttributedString_HFAdditions__hf_loadFromHTMLWithString_options___block_invoke;
  v8[3] = &unk_1EA728A78;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hf_safeAttributedStringWithHTML:()HFAdditions attributes:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("</?\\s*i?frame[^>]*>"), &stru_1EA741FF8, 1025, 0, objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("</?\\s*img[^>]*>"), &stru_1EA741FF8, 1025, 0, objc_msgSend(v8, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hf_loadFromHTMLWithString:options:", v9, MEMORY[0x1E0C9AA70]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__NSAttributedString_HFAdditions__hf_safeAttributedStringWithHTML_attributes___block_invoke;
  v15[3] = &unk_1EA735950;
  v16 = v6;
  v11 = v6;
  objc_msgSend(v10, "flatMap:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "recover:", &__block_literal_global_116);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)hf_attributedStringWithString:()HFAdditions insertingSystemImageNamed:
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3778];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithString:", v7);
  v9 = objc_msgSend(v7, "rangeOfString:", CFSTR("%@"));
  v11 = v10;

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA258], "textAttachmentWithImage:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", v9, v11, v14);

  }
  v15 = (void *)objc_msgSend(v8, "copy");

  return v15;
}

+ (id)hf_attributedStringWithSystemImageNamed:()HFAdditions title:isRTL:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CEA258]);
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithRenderingMode:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v11);

    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if ((a5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ "), v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v14);
      objc_msgSend(v13, "insertAttributedString:atIndex:", v15, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v14);
      objc_msgSend(v13, "appendAttributedString:", v15);
    }

    v16 = (void *)objc_msgSend(v13, "copy");
  }
  else
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1EA741FF8);
  }

  return v16;
}

@end
