@implementation _NBAsYouTypeFormatter

- (_NBAsYouTypeFormatter)init
{
  _NBAsYouTypeFormatter *v2;
  _NBAsYouTypeFormatter *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)_NBAsYouTypeFormatter;
  v2 = -[_NBAsYouTypeFormatter init](&v26, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isSuccessfulFormatting = 0;
    -[_NBAsYouTypeFormatter setCurrentOutput_:](v2, "setCurrentOutput_:", &stru_24C39D888);
    v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    -[_NBAsYouTypeFormatter setFormattingTemplate_:](v3, "setFormattingTemplate_:", v4);

    v25 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR(" "), 0, &v25);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v25;
    -[_NBAsYouTypeFormatter setDIGIT_PATTERN_:](v3, "setDIGIT_PATTERN_:", v5);

    v24 = v6;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("[- ]"), 0, &v24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v24;

    -[_NBAsYouTypeFormatter setNATIONAL_PREFIX_SEPARATORS_PATTERN_:](v3, "setNATIONAL_PREFIX_SEPARATORS_PATTERN_:", v7);
    v23 = v8;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\[([^\\[\\]])*\\]"), 0, &v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v23;

    -[_NBAsYouTypeFormatter setCHARACTER_CLASS_PATTERN_:](v3, "setCHARACTER_CLASS_PATTERN_:", v9);
    v22 = v10;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\d(?=[^,}][^,}])"), 0, &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22;

    -[_NBAsYouTypeFormatter setSTANDALONE_DIGIT_PATTERN_:](v3, "setSTANDALONE_DIGIT_PATTERN_:", v11);
    v21 = v12;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^[-x‐-―−ー－-／ ­​⁠　()（）［］.\\[\\]/~⁓∼～]*(\\$\\d[-x‐-―−ー－-／ ­​⁠　()（）［］.\\[\\]/~⁓∼～]*)+$"), 0, &v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v21;

    -[_NBAsYouTypeFormatter setELIGIBLE_FORMAT_PATTERN_:](v3, "setELIGIBLE_FORMAT_PATTERN_:", v13);
    -[_NBAsYouTypeFormatter setCurrentFormattingPattern_:](v3, "setCurrentFormattingPattern_:", &stru_24C39D888);
    v15 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    -[_NBAsYouTypeFormatter setAccruedInput_:](v3, "setAccruedInput_:", v15);

    v16 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    -[_NBAsYouTypeFormatter setAccruedInputWithoutFormatting_:](v3, "setAccruedInputWithoutFormatting_:", v16);

    -[_NBAsYouTypeFormatter setAbleToFormat_:](v3, "setAbleToFormat_:", 1);
    -[_NBAsYouTypeFormatter setInputHasFormatting_:](v3, "setInputHasFormatting_:", 0);
    -[_NBAsYouTypeFormatter setIsCompleteNumber_:](v3, "setIsCompleteNumber_:", 0);
    -[_NBAsYouTypeFormatter setIsExpectingCountryCallingCode_:](v3, "setIsExpectingCountryCallingCode_:", 0);
    -[_NBAsYouTypeFormatter setLastMatchPosition_:](v3, "setLastMatchPosition_:", 0);
    -[_NBAsYouTypeFormatter setOriginalPosition_:](v3, "setOriginalPosition_:", 0);
    -[_NBAsYouTypeFormatter setPositionToRemember_:](v3, "setPositionToRemember_:", 0);
    v17 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    -[_NBAsYouTypeFormatter setPrefixBeforeNationalNumber_:](v3, "setPrefixBeforeNationalNumber_:", v17);

    -[_NBAsYouTypeFormatter setShouldAddSpaceAfterNationalPrefix_:](v3, "setShouldAddSpaceAfterNationalPrefix_:", 0);
    -[_NBAsYouTypeFormatter setNationalPrefixExtracted_:](v3, "setNationalPrefixExtracted_:", &stru_24C39D888);
    v18 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    -[_NBAsYouTypeFormatter setNationalNumber_:](v3, "setNationalNumber_:", v18);

    v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[_NBAsYouTypeFormatter setPossibleFormats_:](v3, "setPossibleFormats_:", v19);

  }
  return v3;
}

- (_NBAsYouTypeFormatter)initWithRegionCode:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _NBAsYouTypeFormatter *v7;

  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_NBAsYouTypeFormatter initWithRegionCode:bundle:](self, "initWithRegionCode:bundle:", v5, v6);

  return v7;
}

- (_NBAsYouTypeFormatter)initWithRegionCode:(id)a3 bundle:(id)a4
{
  id v5;
  _NBAsYouTypeFormatter *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = -[_NBAsYouTypeFormatter init](self, "init");
  if (v6)
  {
    +[_NBPhoneNumberUtil sharedInstance](_NBPhoneNumberUtil, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBAsYouTypeFormatter setPhoneUtil_:](v6, "setPhoneUtil_:", v7);

    -[_NBAsYouTypeFormatter setDefaultCountry_:](v6, "setDefaultCountry_:", v5);
    -[_NBAsYouTypeFormatter defaultCountry](v6, "defaultCountry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBAsYouTypeFormatter getMetadataForRegion_:](v6, "getMetadataForRegion_:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBAsYouTypeFormatter setCurrentMetaData_:](v6, "setCurrentMetaData_:", v9);

    -[_NBAsYouTypeFormatter currentMetaData](v6, "currentMetaData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBAsYouTypeFormatter setDefaultMetaData_:](v6, "setDefaultMetaData_:", v10);

  }
  return v6;
}

- (id)getMetadataForRegion_:(id)a3
{
  id v4;
  _NBMetadataHelper *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _NBPhoneMetaData *v12;
  _NBPhoneMetaData *v13;

  v4 = a3;
  v5 = objc_alloc_init(_NBMetadataHelper);
  -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getCountryCodeForRegion:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getRegionCodeForCountryCode:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_NBMetadataHelper getMetadataForRegion:](v5, "getMetadataForRegion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = objc_alloc_init(_NBPhoneMetaData);
  v13 = v12;

  return v13;
}

- (BOOL)maybeCreateNewTemplate_
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  -[_NBAsYouTypeFormatter possibleFormats](self, "possibleFormats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    while (1)
    {
      -[_NBAsYouTypeFormatter possibleFormats](self, "possibleFormats");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nb_safeObjectAtIndex:class:", v5, objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "pattern");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "length")
        || (-[_NBAsYouTypeFormatter currentFormattingPattern](self, "currentFormattingPattern"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "isEqualToString:", v8),
            v9,
            (v10 & 1) != 0))
      {
        v11 = 0;
        goto LABEL_13;
      }
      if (-[_NBAsYouTypeFormatter createFormattingTemplate_:](self, "createFormattingTemplate_:", v7))
        break;

      if (v4 == ++v5)
        goto LABEL_7;
    }
    -[_NBAsYouTypeFormatter setCurrentFormattingPattern_:](self, "setCurrentFormattingPattern_:", v8);
    objc_msgSend(v7, "nationalPrefixFormattingRule");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      -[_NBAsYouTypeFormatter NATIONAL_PREFIX_SEPARATORS_PATTERN](self, "NATIONAL_PREFIX_SEPARATORS_PATTERN");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "nationalPrefixFormattingRule");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstMatchInString:options:range:", v15, 0, 0, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[_NBAsYouTypeFormatter setShouldAddSpaceAfterNationalPrefix_:](self, "setShouldAddSpaceAfterNationalPrefix_:", v16 != 0);
    }
    else
    {
      -[_NBAsYouTypeFormatter setShouldAddSpaceAfterNationalPrefix_:](self, "setShouldAddSpaceAfterNationalPrefix_:", 0);
    }
    -[_NBAsYouTypeFormatter setLastMatchPosition_:](self, "setLastMatchPosition_:", 0);
    v11 = 1;
LABEL_13:

  }
  else
  {
LABEL_7:
    -[_NBAsYouTypeFormatter setAbleToFormat_:](self, "setAbleToFormat_:", 0);
    return 0;
  }
  return v11;
}

- (void)getAvailableFormats_:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  id v26;

  v26 = a3;
  if (-[_NBAsYouTypeFormatter isCompleteNumber](self, "isCompleteNumber")
    && (-[_NBAsYouTypeFormatter currentMetaData](self, "currentMetaData"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "intlNumberFormats"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4,
        v6))
  {
    -[_NBAsYouTypeFormatter currentMetaData](self, "currentMetaData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intlNumberFormats");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_NBAsYouTypeFormatter currentMetaData](self, "currentMetaData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberFormats");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    while (1)
    {
      objc_msgSend(v9, "nb_safeObjectAtIndex:class:", v12, objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NBAsYouTypeFormatter currentMetaData](self, "currentMetaData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "nationalPrefix");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
        break;
      v16 = (void *)v15;
      -[_NBAsYouTypeFormatter currentMetaData](self, "currentMetaData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "nationalPrefix");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "length");

      if (!v19)
        goto LABEL_14;
      if ((-[_NBAsYouTypeFormatter isCompleteNumber](self, "isCompleteNumber") & 1) != 0)
        goto LABEL_14;
      if ((objc_msgSend(v13, "nationalPrefixOptionalWhenFormatting") & 1) != 0)
        goto LABEL_14;
      -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "nationalPrefixFormattingRule");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "formattingRuleHasFirstGroupOnly:", v21);

      if (v22)
        goto LABEL_14;
LABEL_16:

      if (v11 == ++v12)
        goto LABEL_17;
    }

LABEL_14:
    objc_msgSend(v13, "format");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[_NBAsYouTypeFormatter isFormatEligible_:](self, "isFormatEligible_:", v23);

    if (v24)
    {
      -[_NBAsYouTypeFormatter possibleFormats](self, "possibleFormats");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v13);

    }
    goto LABEL_16;
  }
LABEL_17:
  -[_NBAsYouTypeFormatter narrowDownPossibleFormats_:](self, "narrowDownPossibleFormats_:", v26);

}

- (BOOL)isFormatEligible_:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[_NBAsYouTypeFormatter ELIGIBLE_FORMAT_PATTERN](self, "ELIGIBLE_FORMAT_PATTERN");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6 != 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)narrowDownPossibleFormats_:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;

  v22 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_msgSend(v22, "length");
  -[_NBAsYouTypeFormatter possibleFormats](self, "possibleFormats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    v9 = v5 - 3;
    do
    {
      -[_NBAsYouTypeFormatter possibleFormats](self, "possibleFormats");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nb_safeObjectAtIndex:class:", v8, objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "leadingDigitsPatterns");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
        objc_msgSend(v11, "leadingDigitsPatterns");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "count");

        objc_msgSend(v11, "leadingDigitsPatterns");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (v9 >= v16 - 1)
          v17 = v16 - 1;
        else
          v17 = v9;
        objc_msgSend(v11, "leadingDigitsPatterns");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "nb_safeStringAtIndex:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "stringPositionByRegex:regex:", v22, v19);

        if (!v21)
          objc_msgSend(v4, "addObject:", v11);

      }
      else
      {
        objc_msgSend(v4, "addObject:", v11);
      }

      ++v8;
    }
    while (v7 != v8);
  }
  -[_NBAsYouTypeFormatter setPossibleFormats_:](self, "setPossibleFormats_:", v4);

}

- (BOOL)createFormattingTemplate_:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "pattern");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "rangeOfString:", CFSTR("|")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[_NBAsYouTypeFormatter CHARACTER_CLASS_PATTERN](self, "CHARACTER_CLASS_PATTERN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length"), CFSTR("\\\\d"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_NBAsYouTypeFormatter STANDALONE_DIGIT_PATTERN](self, "STANDALONE_DIGIT_PATTERN");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByReplacingMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), CFSTR("\\\\d"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[_NBAsYouTypeFormatter formattingTemplate](self, "formattingTemplate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setString:", &stru_24C39D888);

    objc_msgSend(v4, "format");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBAsYouTypeFormatter getFormattingTemplate_:numberFormat:](self, "getFormattingTemplate_:numberFormat:", v5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "length");
    v13 = v12 != 0;
    if (v12)
    {
      -[_NBAsYouTypeFormatter formattingTemplate](self, "formattingTemplate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appendString:", v11);

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)getFormattingTemplate_:(id)a3 numberFormat:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "matchedStringByRegex:regex:", CFSTR("999999999999999"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "nb_safeStringAtIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");
  -[_NBAsYouTypeFormatter nationalNumber](self, "nationalNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v11 >= v13)
  {
    -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "replaceStringByRegex:regex:withTemplate:", v10, v6, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "replaceStringByRegex:regex:withTemplate:", v16, CFSTR("9"), CFSTR(" "));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = &stru_24C39D888;
  }

  return v14;
}

- (void)clear
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[_NBAsYouTypeFormatter setCurrentOutput_:](self, "setCurrentOutput_:", &stru_24C39D888);
  -[_NBAsYouTypeFormatter accruedInput](self, "accruedInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setString:", &stru_24C39D888);

  -[_NBAsYouTypeFormatter accruedInputWithoutFormatting](self, "accruedInputWithoutFormatting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setString:", &stru_24C39D888);

  -[_NBAsYouTypeFormatter formattingTemplate](self, "formattingTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:", &stru_24C39D888);

  -[_NBAsYouTypeFormatter setLastMatchPosition_:](self, "setLastMatchPosition_:", 0);
  -[_NBAsYouTypeFormatter setCurrentFormattingPattern_:](self, "setCurrentFormattingPattern_:", &stru_24C39D888);
  -[_NBAsYouTypeFormatter prefixBeforeNationalNumber](self, "prefixBeforeNationalNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setString:", &stru_24C39D888);

  -[_NBAsYouTypeFormatter setNationalPrefixExtracted_:](self, "setNationalPrefixExtracted_:", &stru_24C39D888);
  -[_NBAsYouTypeFormatter nationalNumber](self, "nationalNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setString:", &stru_24C39D888);

  -[_NBAsYouTypeFormatter setAbleToFormat_:](self, "setAbleToFormat_:", 1);
  -[_NBAsYouTypeFormatter setInputHasFormatting_:](self, "setInputHasFormatting_:", 0);
  -[_NBAsYouTypeFormatter setPositionToRemember_:](self, "setPositionToRemember_:", 0);
  -[_NBAsYouTypeFormatter setOriginalPosition_:](self, "setOriginalPosition_:", 0);
  -[_NBAsYouTypeFormatter setIsCompleteNumber_:](self, "setIsCompleteNumber_:", 0);
  -[_NBAsYouTypeFormatter setIsExpectingCountryCallingCode_:](self, "setIsExpectingCountryCallingCode_:", 0);
  -[_NBAsYouTypeFormatter possibleFormats](self, "possibleFormats");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[_NBAsYouTypeFormatter setShouldAddSpaceAfterNationalPrefix_:](self, "setShouldAddSpaceAfterNationalPrefix_:", 0);
  -[_NBAsYouTypeFormatter currentMetaData](self, "currentMetaData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBAsYouTypeFormatter defaultMetaData](self, "defaultMetaData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
  {
    -[_NBAsYouTypeFormatter defaultCountry](self, "defaultCountry");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[_NBAsYouTypeFormatter getMetadataForRegion_:](self, "getMetadataForRegion_:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBAsYouTypeFormatter setCurrentMetaData_:](self, "setCurrentMetaData_:", v11);

  }
}

- (id)removeLastDigitAndRememberPosition
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;

  -[_NBAsYouTypeFormatter accruedInput](self, "accruedInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[_NBAsYouTypeFormatter clear](self, "clear");
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = v5 - 1;
    if (v5 == 1)
    {
      v10 = &stru_24C39D888;
    }
    else
    {
      v7 = 0;
      v8 = &stru_24C39D888;
      do
      {
        objc_msgSend(v4, "substringWithRange:", v7, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NBAsYouTypeFormatter inputDigitAndRememberPosition:](self, "inputDigitAndRememberPosition:", v9);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v10;
      }
      while (v6 != v7);
    }
    v11 = v10;
  }
  else
  {
    v11 = &stru_24C39D888;
  }

  return v11;
}

- (id)removeLastDigit
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;

  -[_NBAsYouTypeFormatter accruedInput](self, "accruedInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[_NBAsYouTypeFormatter clear](self, "clear");
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = v5 - 1;
    if (v5 == 1)
    {
      v10 = &stru_24C39D888;
    }
    else
    {
      v7 = 0;
      v8 = &stru_24C39D888;
      do
      {
        objc_msgSend(v4, "substringWithRange:", v7, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NBAsYouTypeFormatter inputDigit:](self, "inputDigit:", v9);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v10;
      }
      while (v6 != v7);
    }
    v11 = v10;
  }
  else
  {
    v11 = &stru_24C39D888;
  }

  return v11;
}

- (id)inputStringAndRememberPosition:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;

  v4 = a3;
  -[_NBAsYouTypeFormatter clear](self, "clear");
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = &stru_24C39D888;
    do
    {
      objc_msgSend(v4, "substringWithRange:", v7, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NBAsYouTypeFormatter inputDigitAndRememberPosition:](self, "inputDigitAndRememberPosition:", v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v7;
      v8 = v10;
    }
    while (v6 != v7);
  }
  else
  {
    v10 = &stru_24C39D888;
  }

  return v10;
}

- (id)inputString:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;

  v4 = a3;
  -[_NBAsYouTypeFormatter clear](self, "clear");
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = &stru_24C39D888;
    do
    {
      objc_msgSend(v4, "substringWithRange:", v7, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NBAsYouTypeFormatter inputDigit:](self, "inputDigit:", v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v7;
      v8 = v10;
    }
    while (v6 != v7);
  }
  else
  {
    v10 = &stru_24C39D888;
  }

  return v10;
}

- (id)inputDigit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[_NBAsYouTypeFormatter inputDigitWithOptionToRememberPosition_:rememberPosition:](self, "inputDigitWithOptionToRememberPosition_:rememberPosition:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBAsYouTypeFormatter setCurrentOutput_:](self, "setCurrentOutput_:", v6);

  }
  -[_NBAsYouTypeFormatter currentOutput](self, "currentOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)inputDigitAndRememberPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[_NBAsYouTypeFormatter inputDigitWithOptionToRememberPosition_:rememberPosition:](self, "inputDigitWithOptionToRememberPosition_:rememberPosition:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBAsYouTypeFormatter setCurrentOutput_:](self, "setCurrentOutput_:", v6);

  }
  -[_NBAsYouTypeFormatter currentOutput](self, "currentOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)inputDigitWithOptionToRememberPosition_:(id)a3 rememberPosition:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "length"))
  {
    self->_isSuccessfulFormatting = 0;
    -[_NBAsYouTypeFormatter currentOutput](self, "currentOutput");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  -[_NBAsYouTypeFormatter accruedInput](self, "accruedInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v7);

  if (v4)
  {
    -[_NBAsYouTypeFormatter accruedInput](self, "accruedInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBAsYouTypeFormatter setOriginalPosition_:](self, "setOriginalPosition_:", objc_msgSend(v9, "length"));

  }
  if (-[_NBAsYouTypeFormatter isDigitOrLeadingPlusSign_:](self, "isDigitOrLeadingPlusSign_:", v7))
  {
    -[_NBAsYouTypeFormatter normalizeAndAccrueDigitsAndPlusSign_:rememberPosition:](self, "normalizeAndAccrueDigitsAndPlusSign_:rememberPosition:", v7, v4);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  else
  {
    -[_NBAsYouTypeFormatter setAbleToFormat_:](self, "setAbleToFormat_:", 0);
    -[_NBAsYouTypeFormatter setInputHasFormatting_:](self, "setInputHasFormatting_:", 1);
  }
  if ((-[_NBAsYouTypeFormatter ableToFormat](self, "ableToFormat") & 1) == 0)
  {
    if (-[_NBAsYouTypeFormatter inputHasFormatting](self, "inputHasFormatting"))
    {
      self->_isSuccessfulFormatting = 1;
      v14 = (void *)MEMORY[0x24BDD17C8];
      -[_NBAsYouTypeFormatter accruedInput](self, "accruedInput");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

      goto LABEL_31;
    }
    if (-[_NBAsYouTypeFormatter attemptToExtractIdd](self, "attemptToExtractIdd"))
    {
      if (!-[_NBAsYouTypeFormatter attemptToExtractCountryCallingCode](self, "attemptToExtractCountryCallingCode"))goto LABEL_28;
    }
    else
    {
      if (!-[_NBAsYouTypeFormatter ableToExtractLongerNdd](self, "ableToExtractLongerNdd"))
      {
LABEL_28:
        self->_isSuccessfulFormatting = 0;
        goto LABEL_29;
      }
      -[_NBAsYouTypeFormatter prefixBeforeNationalNumber](self, "prefixBeforeNationalNumber");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "appendString:", CFSTR(" "));

    }
    self->_isSuccessfulFormatting = 1;
    -[_NBAsYouTypeFormatter attemptToChoosePatternWithPrefixExtracted](self, "attemptToChoosePatternWithPrefixExtracted");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_30:
    v16 = (void *)v11;
    goto LABEL_31;
  }
  -[_NBAsYouTypeFormatter accruedInputWithoutFormatting](self, "accruedInputWithoutFormatting");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13 < 3)
  {
    self->_isSuccessfulFormatting = 1;
LABEL_29:
    -[_NBAsYouTypeFormatter accruedInput](self, "accruedInput");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  if (v13 == 3)
  {
    if (!-[_NBAsYouTypeFormatter attemptToExtractIdd](self, "attemptToExtractIdd"))
    {
      -[_NBAsYouTypeFormatter removeNationalPrefixFromNationalNumber](self, "removeNationalPrefixFromNationalNumber");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NBAsYouTypeFormatter setNationalPrefixExtracted_:](self, "setNationalPrefixExtracted_:", v26);

      self->_isSuccessfulFormatting = 1;
LABEL_37:
      -[_NBAsYouTypeFormatter attemptToChooseFormattingPattern](self, "attemptToChooseFormattingPattern");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    -[_NBAsYouTypeFormatter setIsExpectingCountryCallingCode_:](self, "setIsExpectingCountryCallingCode_:", 1);
  }
  if (-[_NBAsYouTypeFormatter isExpectingCountryCallingCode](self, "isExpectingCountryCallingCode"))
  {
    if (-[_NBAsYouTypeFormatter attemptToExtractCountryCallingCode](self, "attemptToExtractCountryCallingCode"))-[_NBAsYouTypeFormatter setIsExpectingCountryCallingCode_:](self, "setIsExpectingCountryCallingCode_:", 0);
    self->_isSuccessfulFormatting = 1;
    v17 = (void *)MEMORY[0x24BDD17C8];
    -[_NBAsYouTypeFormatter prefixBeforeNationalNumber](self, "prefixBeforeNationalNumber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBAsYouTypeFormatter nationalNumber](self, "nationalNumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@%@"), v15, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_24;
  }
  -[_NBAsYouTypeFormatter possibleFormats](self, "possibleFormats");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (!v22)
  {
    self->_isSuccessfulFormatting = 0;
    goto LABEL_37;
  }
  -[_NBAsYouTypeFormatter inputDigitHelper_:](self, "inputDigitHelper_:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBAsYouTypeFormatter attemptToFormatAccruedDigits](self, "attemptToFormatAccruedDigits");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "length"))
  {
    self->_isSuccessfulFormatting = 1;
    v25 = v24;
  }
  else
  {
    -[_NBAsYouTypeFormatter nationalNumber](self, "nationalNumber");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBAsYouTypeFormatter narrowDownPossibleFormats_:](self, "narrowDownPossibleFormats_:", v27);

    if (-[_NBAsYouTypeFormatter maybeCreateNewTemplate](self, "maybeCreateNewTemplate"))
    {
      self->_isSuccessfulFormatting = 1;
      -[_NBAsYouTypeFormatter inputAccruedNationalNumber](self, "inputAccruedNationalNumber");
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[_NBAsYouTypeFormatter ableToFormat](self, "ableToFormat"))
      {
        self->_isSuccessfulFormatting = 1;
        -[_NBAsYouTypeFormatter appendNationalNumber_:](self, "appendNationalNumber_:", v23);
      }
      else
      {
        self->_isSuccessfulFormatting = 0;
        -[_NBAsYouTypeFormatter accruedInput](self, "accruedInput");
      }
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v16 = v25;

LABEL_31:
  return v16;
}

- (id)attemptToChoosePatternWithPrefixExtracted_
{
  void *v3;

  -[_NBAsYouTypeFormatter setAbleToFormat_:](self, "setAbleToFormat_:", 1);
  -[_NBAsYouTypeFormatter setIsExpectingCountryCallingCode_:](self, "setIsExpectingCountryCallingCode_:", 0);
  -[_NBAsYouTypeFormatter possibleFormats](self, "possibleFormats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  return (id)-[_NBAsYouTypeFormatter attemptToChooseFormattingPattern](self, "attemptToChooseFormattingPattern");
}

- (BOOL)ableToExtractLongerNdd_
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;

  -[_NBAsYouTypeFormatter nationalPrefixExtracted](self, "nationalPrefixExtracted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[_NBAsYouTypeFormatter nationalNumber](self, "nationalNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_NBAsYouTypeFormatter nationalPrefixExtracted](self, "nationalPrefixExtracted");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    -[_NBAsYouTypeFormatter setNationalNumber_:](self, "setNationalNumber_:", v9);

    -[_NBAsYouTypeFormatter nationalNumber](self, "nationalNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v7);

    -[_NBAsYouTypeFormatter prefixBeforeNationalNumber](self, "prefixBeforeNationalNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    -[_NBAsYouTypeFormatter nationalPrefixExtracted](self, "nationalPrefixExtracted");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "rangeOfString:options:", v13, 4);

    objc_msgSend(v12, "substringWithRange:", 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");
    -[_NBAsYouTypeFormatter setPrefixBeforeNationalNumber_:](self, "setPrefixBeforeNationalNumber_:", v16);

  }
  -[_NBAsYouTypeFormatter nationalPrefixExtracted](self, "nationalPrefixExtracted");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBAsYouTypeFormatter removeNationalPrefixFromNationalNumber](self, "removeNationalPrefixFromNationalNumber");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 != v18;

  return v19;
}

- (BOOL)isDigitOrLeadingPlusSign_:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("([%@])"), 0x24C39F268);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]+"), 0x24C39F248);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "matchesByRegex:regex:", v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "matchesByRegex:regex:", v5, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  if (v10)
  {
    v14 = 1;
  }
  else
  {
    -[_NBAsYouTypeFormatter accruedInput](self, "accruedInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "length") == 1 && v13 != 0;

  }
  return v14;
}

- (id)attemptToFormatAccruedDigits_
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_NBAsYouTypeFormatter nationalNumber](self, "nationalNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[_NBAsYouTypeFormatter possibleFormats](self, "possibleFormats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    while (1)
    {
      -[_NBAsYouTypeFormatter possibleFormats](self, "possibleFormats");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "pattern");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("^(?:%@)$"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "matchesByRegex:regex:", v26, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14)
        break;

      if (v6 == ++v7)
        goto LABEL_5;
    }
    objc_msgSend(v9, "nationalPrefixFormattingRule");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v17)
    {
      -[_NBAsYouTypeFormatter NATIONAL_PREFIX_SEPARATORS_PATTERN](self, "NATIONAL_PREFIX_SEPARATORS_PATTERN");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nationalPrefixFormattingRule");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nationalPrefixFormattingRule");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "matchesInString:options:range:", v19, 0, 0, objc_msgSend(v20, "length"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[_NBAsYouTypeFormatter setShouldAddSpaceAfterNationalPrefix_:](self, "setShouldAddSpaceAfterNationalPrefix_:", objc_msgSend(v21, "count") != 0);
    }
    else
    {
      -[_NBAsYouTypeFormatter setShouldAddSpaceAfterNationalPrefix_:](self, "setShouldAddSpaceAfterNationalPrefix_:", 0);
    }
    -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "format");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "replaceStringByRegex:regex:withTemplate:", v26, v10, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[_NBAsYouTypeFormatter appendNationalNumber_:](self, "appendNationalNumber_:", v24);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v15 = &stru_24C39D888;
  }

  return v15;
}

- (id)appendNationalNumber_:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v4 = a3;
  -[_NBAsYouTypeFormatter prefixBeforeNationalNumber](self, "prefixBeforeNationalNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  v7 = objc_msgSend(CFSTR(" "), "characterAtIndex:", 0);
  if (-[_NBAsYouTypeFormatter shouldAddSpaceAfterNationalPrefix](self, "shouldAddSpaceAfterNationalPrefix")&& v6&& (-[_NBAsYouTypeFormatter prefixBeforeNationalNumber](self, "prefixBeforeNationalNumber"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "characterAtIndex:", v6 - 1), v8, v9 != v7))
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    -[_NBAsYouTypeFormatter prefixBeforeNationalNumber](self, "prefixBeforeNationalNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@%@%@"), v11, CFSTR(" "), v4);
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    -[_NBAsYouTypeFormatter prefixBeforeNationalNumber](self, "prefixBeforeNationalNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@"), v11, v4, v15);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)getRememberedPosition
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  int v7;

  if ((-[_NBAsYouTypeFormatter ableToFormat](self, "ableToFormat") & 1) == 0)
    return -[_NBAsYouTypeFormatter originalPosition](self, "originalPosition");
  -[_NBAsYouTypeFormatter accruedInputWithoutFormatting](self, "accruedInputWithoutFormatting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBAsYouTypeFormatter currentOutput](self, "currentOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_NBAsYouTypeFormatter positionToRemember](self, "positionToRemember"))
  {
    v5 = 0;
    v6 = 0;
    do
    {
      if (v6 >= objc_msgSend(v4, "length"))
        break;
      v7 = objc_msgSend(v3, "characterAtIndex:", v5);
      if (v7 == objc_msgSend(v4, "characterAtIndex:", v6))
        ++v5;
      ++v6;
    }
    while (v5 < -[_NBAsYouTypeFormatter positionToRemember](self, "positionToRemember"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)attemptToChooseFormattingPattern_
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[_NBAsYouTypeFormatter nationalNumber](self, "nationalNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  if ((unint64_t)objc_msgSend(v4, "length") < 3)
  {
    -[_NBAsYouTypeFormatter appendNationalNumber_:](self, "appendNationalNumber_:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_NBAsYouTypeFormatter getAvailableFormats_:](self, "getAvailableFormats_:", v4);
    -[_NBAsYouTypeFormatter attemptToFormatAccruedDigits](self, "attemptToFormatAccruedDigits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v6 = v5;
    }
    else
    {
      if ((-[_NBAsYouTypeFormatter maybeCreateNewTemplate](self, "maybeCreateNewTemplate") & 1) != 0)
        -[_NBAsYouTypeFormatter inputAccruedNationalNumber](self, "inputAccruedNationalNumber");
      else
        -[_NBAsYouTypeFormatter accruedInput](self, "accruedInput");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

  }
  return v7;
}

- (id)inputAccruedNationalNumber_
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  -[_NBAsYouTypeFormatter nationalNumber](self, "nationalNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = &stru_24C39D888;
    do
    {
      v9 = v8;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), objc_msgSend(v4, "characterAtIndex:", v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NBAsYouTypeFormatter inputDigitHelper_:](self, "inputDigitHelper_:", v10);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v7;
    }
    while (v6 != v7);
    if ((-[_NBAsYouTypeFormatter ableToFormat](self, "ableToFormat") & 1) != 0)
      -[_NBAsYouTypeFormatter appendNationalNumber_:](self, "appendNationalNumber_:", v8);
    else
      -[_NBAsYouTypeFormatter accruedInput](self, "accruedInput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_NBAsYouTypeFormatter prefixBeforeNationalNumber](self, "prefixBeforeNationalNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)isNanpaNumberWithNationalPrefix_
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[_NBAsYouTypeFormatter currentMetaData](self, "currentMetaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", &unk_24C3B8448);

  if (!v5)
    return 0;
  -[_NBAsYouTypeFormatter nationalNumber](self, "nationalNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "characterAtIndex:", 0) == 49
    && objc_msgSend(v7, "characterAtIndex:", 1) != 48
    && objc_msgSend(v7, "characterAtIndex:", 1) != 49;

  return v8;
}

- (id)removeNationalPrefixFromNationalNumber_
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  -[_NBAsYouTypeFormatter nationalNumber](self, "nationalNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  if (!-[_NBAsYouTypeFormatter isNanpaNumberWithNationalPrefix](self, "isNanpaNumberWithNationalPrefix"))
  {
    -[_NBAsYouTypeFormatter currentMetaData](self, "currentMetaData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nationalPrefixForParsing");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[_NBAsYouTypeFormatter currentMetaData](self, "currentMetaData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nationalPrefixForParsing");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (!v10)
      {
        v6 = 0;
        goto LABEL_13;
      }
      v11 = (void *)MEMORY[0x24BDD17C8];
      -[_NBAsYouTypeFormatter currentMetaData](self, "currentMetaData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nationalPrefixForParsing");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("^(?:%@)"), v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "matchedStringByRegex:regex:", v4, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "nb_safeStringAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v6 = 0;
      if (v15 && v16)
      {
        if (objc_msgSend(v16, "length"))
        {
          -[_NBAsYouTypeFormatter setIsCompleteNumber_:](self, "setIsCompleteNumber_:", 1);
          v6 = objc_msgSend(v17, "length");
          -[_NBAsYouTypeFormatter prefixBeforeNationalNumber](self, "prefixBeforeNationalNumber");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "substringWithRange:", 0, v6);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "appendString:", v19);

        }
        else
        {
          v6 = 0;
        }
      }

    }
    goto LABEL_13;
  }
  -[_NBAsYouTypeFormatter prefixBeforeNationalNumber](self, "prefixBeforeNationalNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("1%@"), CFSTR(" "));

  v6 = 1;
  -[_NBAsYouTypeFormatter setIsCompleteNumber_:](self, "setIsCompleteNumber_:", 1);
LABEL_13:
  objc_msgSend(v4, "substringFromIndex:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");
  -[_NBAsYouTypeFormatter setNationalNumber_:](self, "setNationalNumber_:", v21);

  objc_msgSend(v4, "substringWithRange:", 0, v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (BOOL)attemptToExtractIdd_
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[_NBAsYouTypeFormatter accruedInputWithoutFormatting](self, "accruedInputWithoutFormatting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = (void *)MEMORY[0x24BDD17C8];
  -[_NBAsYouTypeFormatter currentMetaData](self, "currentMetaData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internationalPrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("^(?:\\+|%@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "matchedStringByRegex:regex:", v4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "nb_safeStringAtIndex:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = 0;
  if (v10 && v11)
  {
    if (objc_msgSend(v11, "length"))
    {
      v13 = 1;
      -[_NBAsYouTypeFormatter setIsCompleteNumber_:](self, "setIsCompleteNumber_:", 1);
      v14 = objc_msgSend(v12, "length");
      objc_msgSend(v4, "substringFromIndex:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");
      -[_NBAsYouTypeFormatter setNationalNumber_:](self, "setNationalNumber_:", v16);

      objc_msgSend(v4, "substringWithRange:", 0, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");
      -[_NBAsYouTypeFormatter setPrefixBeforeNationalNumber_:](self, "setPrefixBeforeNationalNumber_:", v18);

      if (objc_msgSend(v4, "characterAtIndex:", 0) != 43)
      {
        -[_NBAsYouTypeFormatter prefixBeforeNationalNumber](self, "prefixBeforeNationalNumber");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "appendString:", CFSTR(" "));

      }
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (BOOL)attemptToExtractCountryCallingCode_
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  _NBMetadataHelper *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  __CFString *v19;

  -[_NBAsYouTypeFormatter nationalNumber](self, "nationalNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBAsYouTypeFormatter nationalNumber](self, "nationalNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = &stru_24C39D888;
    objc_msgSend(v5, "extractCountryCode:nationalNumber:", v6, &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;

    v9 = objc_msgSend(v7, "isEqualToNumber:", &unk_24C3B8460);
    if ((v9 & 1) != 0)
    {
LABEL_10:
      v15 = v9 ^ 1;

      return v15;
    }
    v10 = (void *)-[__CFString mutableCopy](v8, "mutableCopy");
    -[_NBAsYouTypeFormatter setNationalNumber_:](self, "setNationalNumber_:", v10);

    -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getRegionCodeForCountryCode:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(CFSTR("001"), "isEqualToString:", v12))
    {
      v13 = objc_alloc_init(_NBMetadataHelper);
      -[_NBMetadataHelper getMetadataForNonGeographicalRegion:](v13, "getMetadataForNonGeographicalRegion:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NBAsYouTypeFormatter setCurrentMetaData_:](self, "setCurrentMetaData_:", v14);

    }
    else
    {
      -[_NBAsYouTypeFormatter defaultCountry](self, "defaultCountry");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v16)
      {
LABEL_9:
        -[_NBAsYouTypeFormatter prefixBeforeNationalNumber](self, "prefixBeforeNationalNumber");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "appendFormat:", CFSTR("%@%@"), v7, CFSTR(" "));

        goto LABEL_10;
      }
      -[_NBAsYouTypeFormatter getMetadataForRegion_:](self, "getMetadataForRegion_:", v12);
      v13 = (_NBMetadataHelper *)objc_claimAutoreleasedReturnValue();
      -[_NBAsYouTypeFormatter setCurrentMetaData_:](self, "setCurrentMetaData_:", v13);
    }

    goto LABEL_9;
  }
  return 0;
}

- (id)normalizeAndAccrueDigitsAndPlusSign_:(id)a3 rememberPosition:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("+")))
  {
    v7 = (__CFString *)v6;
    -[_NBAsYouTypeFormatter accruedInputWithoutFormatting](self, "accruedInputWithoutFormatting");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "DIGIT_MAPPINGS");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v7 = &stru_24C39D888;
      goto LABEL_8;
    }
    -[_NBAsYouTypeFormatter accruedInputWithoutFormatting](self, "accruedInputWithoutFormatting");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendString:", v7);

    -[_NBAsYouTypeFormatter nationalNumber](self, "nationalNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v8;
  objc_msgSend(v8, "appendString:", v7);

  if (v4)
  {
    -[_NBAsYouTypeFormatter accruedInputWithoutFormatting](self, "accruedInputWithoutFormatting");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NBAsYouTypeFormatter setPositionToRemember_:](self, "setPositionToRemember_:", objc_msgSend(v13, "length"));

  }
LABEL_8:

  return v7;
}

- (id)inputDigitHelper_:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v4 = a3;
  -[_NBAsYouTypeFormatter formattingTemplate](self, "formattingTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "length");
  if (v7 <= -[_NBAsYouTypeFormatter lastMatchPosition](self, "lastMatchPosition"))
  {
    v8 = &stru_24C39D888;
  }
  else
  {
    objc_msgSend(v6, "substringFromIndex:", -[_NBAsYouTypeFormatter lastMatchPosition](self, "lastMatchPosition"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "stringPositionByRegex:regex:", v8, CFSTR(" "));

  if (v10 < 0)
  {
    -[_NBAsYouTypeFormatter possibleFormats](self, "possibleFormats");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19 == 1)
      -[_NBAsYouTypeFormatter setAbleToFormat_:](self, "setAbleToFormat_:", 0);
    -[_NBAsYouTypeFormatter setCurrentFormattingPattern_:](self, "setCurrentFormattingPattern_:", &stru_24C39D888);
    -[_NBAsYouTypeFormatter accruedInput](self, "accruedInput");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_NBAsYouTypeFormatter phoneUtil](self, "phoneUtil");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "stringPositionByRegex:regex:", v6, CFSTR(" "));

    v13 = objc_msgSend(v6, "rangeOfString:", CFSTR(" "));
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR(" "), v4, 2, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");
    -[_NBAsYouTypeFormatter setFormattingTemplate_:](self, "setFormattingTemplate_:", v16);

    -[_NBAsYouTypeFormatter setLastMatchPosition_:](self, "setLastMatchPosition_:", v12);
    objc_msgSend(v15, "substringWithRange:", 0, -[_NBAsYouTypeFormatter lastMatchPosition](self, "lastMatchPosition") + 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (BOOL)isSuccessfulFormatting
{
  return self->_isSuccessfulFormatting;
}

- (NSString)currentOutput_
{
  return self->_currentOutput_;
}

- (void)setCurrentOutput_:(id)a3
{
  objc_storeStrong((id *)&self->_currentOutput_, a3);
}

- (NSString)currentFormattingPattern_
{
  return self->_currentFormattingPattern_;
}

- (void)setCurrentFormattingPattern_:(id)a3
{
  objc_storeStrong((id *)&self->_currentFormattingPattern_, a3);
}

- (NSString)defaultCountry_
{
  return self->_defaultCountry_;
}

- (void)setDefaultCountry_:(id)a3
{
  objc_storeStrong((id *)&self->_defaultCountry_, a3);
}

- (NSString)nationalPrefixExtracted_
{
  return self->_nationalPrefixExtracted_;
}

- (void)setNationalPrefixExtracted_:(id)a3
{
  objc_storeStrong((id *)&self->_nationalPrefixExtracted_, a3);
}

- (NSMutableString)formattingTemplate_
{
  return self->_formattingTemplate_;
}

- (void)setFormattingTemplate_:(id)a3
{
  objc_storeStrong((id *)&self->_formattingTemplate_, a3);
}

- (NSMutableString)accruedInput_
{
  return self->_accruedInput_;
}

- (void)setAccruedInput_:(id)a3
{
  objc_storeStrong((id *)&self->_accruedInput_, a3);
}

- (NSMutableString)prefixBeforeNationalNumber_
{
  return self->_prefixBeforeNationalNumber_;
}

- (void)setPrefixBeforeNationalNumber_:(id)a3
{
  objc_storeStrong((id *)&self->_prefixBeforeNationalNumber_, a3);
}

- (NSMutableString)accruedInputWithoutFormatting_
{
  return self->_accruedInputWithoutFormatting_;
}

- (void)setAccruedInputWithoutFormatting_:(id)a3
{
  objc_storeStrong((id *)&self->_accruedInputWithoutFormatting_, a3);
}

- (NSMutableString)nationalNumber_
{
  return self->_nationalNumber_;
}

- (void)setNationalNumber_:(id)a3
{
  objc_storeStrong((id *)&self->_nationalNumber_, a3);
}

- (NSRegularExpression)DIGIT_PATTERN_
{
  return self->_DIGIT_PATTERN_;
}

- (void)setDIGIT_PATTERN_:(id)a3
{
  objc_storeStrong((id *)&self->_DIGIT_PATTERN_, a3);
}

- (NSRegularExpression)NATIONAL_PREFIX_SEPARATORS_PATTERN_
{
  return self->_NATIONAL_PREFIX_SEPARATORS_PATTERN_;
}

- (void)setNATIONAL_PREFIX_SEPARATORS_PATTERN_:(id)a3
{
  objc_storeStrong((id *)&self->_NATIONAL_PREFIX_SEPARATORS_PATTERN_, a3);
}

- (NSRegularExpression)CHARACTER_CLASS_PATTERN_
{
  return self->_CHARACTER_CLASS_PATTERN_;
}

- (void)setCHARACTER_CLASS_PATTERN_:(id)a3
{
  objc_storeStrong((id *)&self->_CHARACTER_CLASS_PATTERN_, a3);
}

- (NSRegularExpression)STANDALONE_DIGIT_PATTERN_
{
  return self->_STANDALONE_DIGIT_PATTERN_;
}

- (void)setSTANDALONE_DIGIT_PATTERN_:(id)a3
{
  objc_storeStrong((id *)&self->_STANDALONE_DIGIT_PATTERN_, a3);
}

- (NSRegularExpression)ELIGIBLE_FORMAT_PATTERN_
{
  return self->_ELIGIBLE_FORMAT_PATTERN_;
}

- (void)setELIGIBLE_FORMAT_PATTERN_:(id)a3
{
  objc_storeStrong((id *)&self->_ELIGIBLE_FORMAT_PATTERN_, a3);
}

- (BOOL)ableToFormat_
{
  return self->_ableToFormat_;
}

- (void)setAbleToFormat_:(BOOL)a3
{
  self->_ableToFormat_ = a3;
}

- (BOOL)inputHasFormatting_
{
  return self->_inputHasFormatting_;
}

- (void)setInputHasFormatting_:(BOOL)a3
{
  self->_inputHasFormatting_ = a3;
}

- (BOOL)isCompleteNumber_
{
  return self->_isCompleteNumber_;
}

- (void)setIsCompleteNumber_:(BOOL)a3
{
  self->_isCompleteNumber_ = a3;
}

- (BOOL)isExpectingCountryCallingCode_
{
  return self->_isExpectingCountryCallingCode_;
}

- (void)setIsExpectingCountryCallingCode_:(BOOL)a3
{
  self->_isExpectingCountryCallingCode_ = a3;
}

- (BOOL)shouldAddSpaceAfterNationalPrefix_
{
  return self->_shouldAddSpaceAfterNationalPrefix_;
}

- (void)setShouldAddSpaceAfterNationalPrefix_:(BOOL)a3
{
  self->_shouldAddSpaceAfterNationalPrefix_ = a3;
}

- (_NBPhoneNumberUtil)phoneUtil_
{
  return self->_phoneUtil_;
}

- (void)setPhoneUtil_:(id)a3
{
  objc_storeStrong((id *)&self->_phoneUtil_, a3);
}

- (unint64_t)lastMatchPosition_
{
  return self->_lastMatchPosition_;
}

- (void)setLastMatchPosition_:(unint64_t)a3
{
  self->_lastMatchPosition_ = a3;
}

- (unint64_t)originalPosition_
{
  return self->_originalPosition_;
}

- (void)setOriginalPosition_:(unint64_t)a3
{
  self->_originalPosition_ = a3;
}

- (unint64_t)positionToRemember_
{
  return self->_positionToRemember_;
}

- (void)setPositionToRemember_:(unint64_t)a3
{
  self->_positionToRemember_ = a3;
}

- (NSMutableArray)possibleFormats_
{
  return self->_possibleFormats_;
}

- (void)setPossibleFormats_:(id)a3
{
  objc_storeStrong((id *)&self->_possibleFormats_, a3);
}

- (_NBPhoneMetaData)currentMetaData_
{
  return self->_currentMetaData_;
}

- (void)setCurrentMetaData_:(id)a3
{
  objc_storeStrong((id *)&self->_currentMetaData_, a3);
}

- (_NBPhoneMetaData)defaultMetaData_
{
  return self->_defaultMetaData_;
}

- (void)setDefaultMetaData_:(id)a3
{
  objc_storeStrong((id *)&self->_defaultMetaData_, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultMetaData_, 0);
  objc_storeStrong((id *)&self->_currentMetaData_, 0);
  objc_storeStrong((id *)&self->_possibleFormats_, 0);
  objc_storeStrong((id *)&self->_phoneUtil_, 0);
  objc_storeStrong((id *)&self->_ELIGIBLE_FORMAT_PATTERN_, 0);
  objc_storeStrong((id *)&self->_STANDALONE_DIGIT_PATTERN_, 0);
  objc_storeStrong((id *)&self->_CHARACTER_CLASS_PATTERN_, 0);
  objc_storeStrong((id *)&self->_NATIONAL_PREFIX_SEPARATORS_PATTERN_, 0);
  objc_storeStrong((id *)&self->_DIGIT_PATTERN_, 0);
  objc_storeStrong((id *)&self->_nationalNumber_, 0);
  objc_storeStrong((id *)&self->_accruedInputWithoutFormatting_, 0);
  objc_storeStrong((id *)&self->_prefixBeforeNationalNumber_, 0);
  objc_storeStrong((id *)&self->_accruedInput_, 0);
  objc_storeStrong((id *)&self->_formattingTemplate_, 0);
  objc_storeStrong((id *)&self->_nationalPrefixExtracted_, 0);
  objc_storeStrong((id *)&self->_defaultCountry_, 0);
  objc_storeStrong((id *)&self->_currentFormattingPattern_, 0);
  objc_storeStrong((id *)&self->_currentOutput_, 0);
}

@end
