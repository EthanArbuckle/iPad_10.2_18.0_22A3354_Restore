@implementation NSAttributedString(NTKUtilities)

+ (uint64_t)NTKTimeWithDate:()NTKUtilities andDesignatorFont:options:
{
  return objc_msgSend(MEMORY[0x1E0CB3498], "NTKTimeWithDate:andDesignatorFont:timeZone:options:", a3, a4, 0, a5);
}

+ (id)NTKDesignatorAttributedTimeWithDate:()NTKUtilities
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0C940F8];
  v9[0] = MEMORY[0x1E0C9AAB0];
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "NTKTimeWithDate:andDesignatorAttributes:timeZone:options:", v4, v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)NTKTimeWithDate:()NTKUtilities andDesignatorFont:
{
  return objc_msgSend(MEMORY[0x1E0CB3498], "NTKTimeWithDate:andDesignatorFont:options:", a3, a4, 0);
}

+ (id)NTKTimeWithDate:()NTKUtilities andDesignatorFont:timeZone:options:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    v15 = *MEMORY[0x1E0DC1138];
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3498], "NTKTimeWithDate:andDesignatorAttributes:timeZone:options:", v9, v12, v11, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)NTKTimeWithDate:()NTKUtilities andDesignatorAttributes:timeZone:options:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (_TimeFormatterWithDate_onceToken != -1)
    dispatch_once(&_TimeFormatterWithDate_onceToken, &__block_literal_global_9);
  objc_msgSend((id)_TimeFormatterWithDate___formatter, "setOverrideDate:", v9);
  v12 = (id)_TimeFormatterWithDate___formatter;
  objc_msgSend(v12, "_setUseNarrowDesignatorTextForGerman:", (a6 >> 1) & 1);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "setTimeZone:", v11);
  if ((a6 & 1) != 0)
  {
    objc_msgSend(v12, "timeText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if ((a6 & 4) != 0)
    {
      objc_msgSend(v12, "timeAndDesignatorTextWithoutMinutesIfZero");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "designatorRangeInTimeAndDesignatorTextWithoutMinutesIfZero");
    }
    else
    {
      objc_msgSend(v12, "timeAndDesignatorText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "designatorRangeInTimeAndDesignatorText");
    }
    v17 = v14;
    v16 = v15;
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v13);
  v19 = v18;
  if (v10 && v16)
    objc_msgSend(v18, "setAttributes:range:", v10, v17, v16);

  return v19;
}

+ (id)NTKReplaceTimeDesignatorAttributesFrom:()NTKUtilities withDesignatorFont:
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;
  id v21;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3778];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithAttributedString:", v7);

  objc_msgSend(v8, "beginEditing");
  v9 = *MEMORY[0x1E0C940F8];
  v10 = objc_msgSend(v8, "length");
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __94__NSAttributedString_NTKUtilities__NTKReplaceTimeDesignatorAttributesFrom_withDesignatorFont___block_invoke;
  v19 = &unk_1E6BCE5C8;
  v11 = v8;
  v20 = v11;
  v21 = v5;
  v12 = v5;
  objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v10, 0x100000, &v16);
  objc_msgSend(v11, "endEditing", v16, v17, v18, v19);
  v13 = v21;
  v14 = v11;

  return v14;
}

+ (id)NTKCountdownToDate:()NTKUtilities useShort:withDesignatorFont:
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  __CFString *v21;
  __CFString *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v40;
  char v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = (void *)MEMORY[0x1E0C99D48];
  v9 = a3;
  objc_msgSend(v8, "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94130], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:", 126, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:", 126, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "components:fromDateComponents:toDateComponents:options:", 96, v12, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hour");
  v16 = objc_msgSend(v14, "minute");
  if (v15 < 0 || (v17 = v16, v16 < 0))
  {
    v20 = objc_alloc_init(MEMORY[0x1E0CB3498]);
  }
  else
  {
    if (!(v15 | v16))
    {
      v18 = objc_alloc(MEMORY[0x1E0CB3498]);
      NTKClockFaceLocalizedString(CFSTR("COUNTDOWN_NOW"), CFSTR("now"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)objc_msgSend(v18, "initWithString:", v19);
LABEL_23:

      goto LABEL_24;
    }
    v20 = (id)objc_opt_new();
    if (v15)
    {
      v41 = a4;
      if ((a4 & 1) != 0)
      {
        v21 = CFSTR("COUNTDOWN_HOUR_SHORT");
      }
      else
      {
        v22 = CFSTR("COUNTDOWN_HOUR_MULTIPLE");
        if (v15 == 1)
          v22 = CFSTR("COUNTDOWN_HOUR_SINGLE");
        v21 = v22;
      }
      NTKClockFaceLocalizedString(v21, CFSTR("hrs"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%d"), v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithString:", v24);
      objc_msgSend(v20, "appendAttributedString:", v25);

      v26 = objc_alloc(MEMORY[0x1E0CB3778]);
      v44 = *MEMORY[0x1E0DC1138];
      v45[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithString:attributes:", v40, v27);

      objc_msgSend(v20, "appendAttributedString:", v28);
      a4 = v41;
    }
    if (v17)
    {
      if (objc_msgSend(v20, "length"))
      {
        v29 = a4;
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
        objc_msgSend(v20, "appendAttributedString:", v30);

        a4 = v29;
      }
      if ((a4 & 1) != 0)
      {
        v31 = CFSTR("COUNTDOWN_MINUTE_SHORT");
      }
      else
      {
        v32 = CFSTR("COUNTDOWN_MINUTE_MULTIPLE");
        if (v17 == 1)
          v32 = CFSTR("COUNTDOWN_MINUTE_SINGLE");
        v31 = v32;
      }
      NTKClockFaceLocalizedString(v31, CFSTR("mins"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld"), v17);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v33, "initWithString:", v34);
      objc_msgSend(v20, "appendAttributedString:", v35);

      v36 = objc_alloc(MEMORY[0x1E0CB3778]);
      v42 = *MEMORY[0x1E0DC1138];
      v43 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v36, "initWithString:attributes:", v19, v37);

      objc_msgSend(v20, "appendAttributedString:", v38);
      goto LABEL_23;
    }
  }
LABEL_24:

  return v20;
}

+ (uint64_t)NTKHyphenatableString:()NTKUtilities
{
  LODWORD(a3) = NTKHyphenationDefaultFactor;
  return objc_msgSend(a1, "NTKHyphenatableString:factor:", a3);
}

+ (id)NTKHyphenatableString:()NTKUtilities factor:
{
  void *v5;
  id v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v5 = (void *)MEMORY[0x1E0DC1288];
    v6 = a4;
    *(float *)&v7 = a1;
    objc_msgSend(v5, "NTKHyphenationParagraphStyleWithFactor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0CB3498]);
    v13 = *MEMORY[0x1E0DC1178];
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v6, v10);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (id)_attributedStringFromAttributesTable:()NTKUtilities defaultAttributes:format:arguments:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD aBlock[4];
  id v35;
  NSObject *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  id v42[2];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v11, a6);
  v13 = objc_alloc_init(MEMORY[0x1E0CB34A0]);
  objc_msgSend(v13, "setAllowsExtendedAttributes:", 1);
  v42[0] = 0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithMarkdownString:options:baseURL:error:", v12, v13, 0, v42);
  v15 = v42[0];
  v16 = v15;
  if (v14)
    v17 = v15 == 0;
  else
    v17 = 0;
  if (v17)
  {
    v20 = objc_msgSend(v14, "length");
    v21 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v14, "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithString:attributes:", v22, v10);

    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    v24 = v9;
    v25 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __108__NSAttributedString_NTKUtilities___attributedStringFromAttributesTable_defaultAttributes_format_arguments___block_invoke;
    aBlock[3] = &unk_1E6BCE5F0;
    v29 = v24;
    v35 = v24;
    v37 = &v38;
    v18 = v23;
    v36 = v18;
    v32[0] = v25;
    v32[1] = 3221225472;
    v32[2] = __108__NSAttributedString_NTKUtilities___attributedStringFromAttributesTable_defaultAttributes_format_arguments___block_invoke_2;
    v32[3] = &unk_1E6BCE618;
    v26 = _Block_copy(aBlock);
    v33 = v26;
    objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("attributes"), 0, v20, 0, v32);
    v39[3] = 0;
    v30[0] = v25;
    v30[1] = 3221225472;
    v30[2] = __108__NSAttributedString_NTKUtilities___attributedStringFromAttributesTable_defaultAttributes_format_arguments___block_invoke_3;
    v30[3] = &unk_1E6BCE640;
    v27 = v26;
    v31 = v27;
    objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", 0, v20, 0, v30);
    v19 = -[NSObject copy](v18, "copy");

    _Block_object_dispose(&v38, 8);
    v9 = v29;
  }
  else
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[NSAttributedString(NTKUtilities) _attributedStringFromAttributesTable:defaultAttributes:format:arguments:].cold.1((uint64_t)v16, v18);
    v19 = 0;
  }

  return v19;
}

+ (id)ntk_attributedStringFromAttributesTable:()NTKUtilities defaultAttributes:markdownFormat:
{
  objc_msgSend(a1, "ntk_attributedStringFromAttributesTable:defaultAttributes:markdownFormat:arguments:", a3, a4, a5, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ntk_attributedStringFromAttributesTable:()NTKUtilities markdownFormat:
{
  id v11;
  id v12;
  void *v13;
  void *v14;

  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("default"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ntk_attributedStringFromAttributesTable:defaultAttributes:markdownFormat:arguments:", v12, v13, v11, &a9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (void)_attributedStringFromAttributesTable:()NTKUtilities defaultAttributes:format:arguments:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "parsing markdown failed, error = %@", (uint8_t *)&v2, 0xCu);
}

@end
