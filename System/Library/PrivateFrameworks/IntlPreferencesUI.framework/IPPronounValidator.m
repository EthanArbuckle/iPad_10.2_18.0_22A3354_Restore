@implementation IPPronounValidator

- (IPPronounValidator)initWithLocale:(id)a3
{
  id v4;
  IPPronounValidator *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)IPPronounValidator;
  v5 = -[IPPronounValidator init](&v50, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[IPPronounValidator preferredPronounLocalizationForLanguage:](IPPronounValidator, "preferredPronounLocalizationForLanguage:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("en");
      if (v8)
        v10 = (__CFString *)v8;
      v11 = v10;

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PronounInfo_%@"), v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDD1770];
      v14 = (void *)MEMORY[0x24BDBCE50];
      v44 = (void *)v12;
      v45 = v6;
      objc_msgSend(v6, "pathForResource:ofType:inDirectory:forLocalization:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dataWithContentsOfFile:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "propertyListWithData:options:format:error:", v16, 0, 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x24BDD1798];
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("LegalCharactersRegex"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "regularExpressionWithPattern:options:error:", v19, 0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPPronounValidator setValidationRegex:](v5, "setValidationRegex:", v20);

      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("MaxPronounLength"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPPronounValidator setMaxPronounLength:](v5, "setMaxPronounLength:", (int)objc_msgSend(v21, "intValue"));

      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("KnownPronouns"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPPronounValidator setKnownPronouns:](v5, "setKnownPronouns:", v22);

      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ExampleStrings"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPPronounValidator setExampleStrings:](v5, "setExampleStrings:", v23);

      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ExampleStringPlaceholders"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPPronounValidator setExamplePlaceholders:](v5, "setExamplePlaceholders:", v24);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RememberedPronouns_%@"), v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPPronounValidator setPropertyPreferenceName:](v5, "setPropertyPreferenceName:", v25);

      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPPronounValidator propertyPreferenceName](v5, "propertyPreferenceName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "arrayForKey:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "mutableCopy");
      -[IPPronounValidator setRememberedPronouns:](v5, "setRememberedPronouns:", v29);

      -[IPPronounValidator rememberedPronouns](v5, "rememberedPronouns");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[IPPronounValidator setRememberedPronouns:](v5, "setRememberedPronouns:", v31);

      }
      -[IPPronounValidator setLanguage:](v5, "setLanguage:", v11);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("DisplayedMorphologies"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v47;
        do
        {
          v37 = 0;
          do
          {
            if (*(_QWORD *)v47 != v36)
              objc_enumerationMutation(v33);
            -[IPPronounValidator morphologyFromString:](v5, "morphologyFromString:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v37));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addObject:", v38);

            ++v37;
          }
          while (v35 != v37);
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        }
        while (v35);
      }

      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v32);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPPronounValidator setDisplayedMorphologies:](v5, "setDisplayedMorphologies:", v39);

      v40 = v45;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", &stru_24F9E0D40, 0, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPPronounValidator setValidationRegex:](v5, "setValidationRegex:", v41);

      -[IPPronounValidator setMaxPronounLength:](v5, "setMaxPronounLength:", 0);
      v42 = MEMORY[0x24BDBD1A8];
      -[IPPronounValidator setExampleStrings:](v5, "setExampleStrings:", MEMORY[0x24BDBD1A8]);
      -[IPPronounValidator setExamplePlaceholders:](v5, "setExamplePlaceholders:", v42);
      -[IPPronounValidator setPropertyPreferenceName:](v5, "setPropertyPreferenceName:", &stru_24F9E0D40);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPPronounValidator setRememberedPronouns:](v5, "setRememberedPronouns:", v40);
    }

  }
  return v5;
}

- (id)morphologyFromString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setGrammaticalPerson:", 3);
  v15 = v3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("-"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(&unk_24F9E2C68, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
          objc_msgSend(v4, "setGrammaticalCase:", (int)objc_msgSend(v10, "intValue"));
        objc_msgSend(&unk_24F9E2C90, "objectForKeyedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v4, "setDetermination:", (int)objc_msgSend(v12, "intValue"));
        objc_msgSend(&unk_24F9E2CB8, "objectForKeyedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v4, "setGrammaticalPerson:", (int)objc_msgSend(v13, "intValue"));

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v4;
}

- (BOOL)pronounIsValidLength:(id)a3
{
  unint64_t v4;

  v4 = objc_msgSend(a3, "length");
  return v4 <= -[IPPronounValidator maxPronounLength](self, "maxPronounLength");
}

- (BOOL)pronounHasValidChars:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  -[IPPronounValidator validationRegex](self, "validationRegex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, v5);
  v9 = v8;

  return !v7 && v5 == v9;
}

- (id)autofillPronouns:(id)a3
{
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  id v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;
  _QWORD v36[4];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v5 = _os_feature_enabled_impl();
  -[IPPronounValidator rememberedPronouns](self, "rememberedPronouns");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if ((v5 & 1) != 0)
  {
    v36[0] = v6;
    -[IPPronounValidator knownPronouns](self, "knownPronouns");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v35 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    v24 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v26;
          while (2)
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v26 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
              if (-[IPPronounValidator userSuppliedPronouns:matchKnownPronouns:](self, "userSuppliedPronouns:matchKnownPronouns:", v4, v21))
              {
                -[IPPronounValidator fillInMissingEntriesInArray:fromArray:](self, "fillInMissingEntriesInArray:fromArray:", v4, v21);
                v22 = v4;

                goto LABEL_22;
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            if (v18)
              continue;
            break;
          }
        }

        v13 = v24;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      v22 = 0;
    }
    while (v12);
  }
  else
  {
    v22 = 0;
  }
LABEL_22:

  return v22;
}

- (void)rememberUserEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "pronouns", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "pronoun");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  -[IPPronounValidator rememberedPronouns](self, "rememberedPronouns");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "indexOfObject:", v5);

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[IPPronounValidator rememberedPronouns](self, "rememberedPronouns");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectAtIndex:", v13);

  }
  -[IPPronounValidator rememberedPronouns](self, "rememberedPronouns");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "insertObject:atIndex:", v5, 0);

  -[IPPronounValidator rememberedPronouns](self, "rememberedPronouns");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17 >= 9)
  {
    -[IPPronounValidator rememberedPronouns](self, "rememberedPronouns");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeLastObject");

  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPPronounValidator rememberedPronouns](self, "rememberedPronouns");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPPronounValidator propertyPreferenceName](self, "propertyPreferenceName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v20, v21);

}

- (void)_clearUserEntries
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IPPronounValidator propertyPreferenceName](self, "propertyPreferenceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v3);

}

- (BOOL)userSuppliedPronouns:(id)a3 matchKnownPronouns:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 != objc_msgSend(v6, "count") || !objc_msgSend(v5, "count"))
    goto LABEL_10;
  v8 = 0;
  v9 = 0;
  while (1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      break;
LABEL_7:

    if (++v8 >= (unint64_t)objc_msgSend(v5, "count"))
      goto LABEL_11;
  }
  if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
  {
    v9 = 1;
    goto LABEL_7;
  }

LABEL_10:
  v9 = 0;
LABEL_11:

  return v9 & 1;
}

- (void)fillInMissingEntriesInArray:(id)a3 fromArray:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  if (objc_msgSend(v10, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (!v8)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:atIndexedSubscript:", v9, v6);

      }
      ++v6;
    }
    while (v6 < objc_msgSend(v10, "count"));
  }

}

+ (BOOL)canDisplayPronounPicker
{
  return 1;
}

+ (BOOL)shouldDisplayPronounPickerByDefault
{
  return 1;
}

+ (id)preferredPronounLocalizationForLanguage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x24BDBCEA0];
  v4 = a3;
  +[IPPronounValidator supportedPronounLocalizations](IPPronounValidator, "supportedPronounLocalizations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)supportedPronounLocalizations
{
  return &unk_24F9E2CE0;
}

+ (BOOL)currentUILocaleSupportsPronounPicking
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[IPPronounValidator languageSupportsPronounPicking:](IPPronounValidator, "languageSupportsPronounPicking:", v3);

  return v4;
}

+ (id)initialPronounPickerLanguage
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(a1, "currentUILocaleSupportsPronounPicking"))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = CFSTR("en");
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (+[IPPronounValidator languageSupportsPronounPicking:](IPPronounValidator, "languageSupportsPronounPicking:", v8))
        {
          v6 = v8;
          goto LABEL_14;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v6 = CFSTR("en");
  }
LABEL_14:

  return v6;
}

+ (BOOL)languageSupportsPronounPicking:(id)a3
{
  void *v3;
  BOOL v4;

  +[IPPronounValidator preferredPronounLocalizationForLanguage:](IPPronounValidator, "preferredPronounLocalizationForLanguage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (NSRegularExpression)validationRegex
{
  return self->_validationRegex;
}

- (void)setValidationRegex:(id)a3
{
  objc_storeStrong((id *)&self->_validationRegex, a3);
}

- (int64_t)maxPronounLength
{
  return self->_maxPronounLength;
}

- (void)setMaxPronounLength:(int64_t)a3
{
  self->_maxPronounLength = a3;
}

- (NSArray)displayedMorphologies
{
  return self->_displayedMorphologies;
}

- (void)setDisplayedMorphologies:(id)a3
{
  objc_storeStrong((id *)&self->_displayedMorphologies, a3);
}

- (NSArray)exampleStrings
{
  return self->_exampleStrings;
}

- (void)setExampleStrings:(id)a3
{
  objc_storeStrong((id *)&self->_exampleStrings, a3);
}

- (NSArray)examplePlaceholders
{
  return self->_examplePlaceholders;
}

- (void)setExamplePlaceholders:(id)a3
{
  objc_storeStrong((id *)&self->_examplePlaceholders, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (NSMutableArray)rememberedPronouns
{
  return self->_rememberedPronouns;
}

- (void)setRememberedPronouns:(id)a3
{
  objc_storeStrong((id *)&self->_rememberedPronouns, a3);
}

- (NSArray)knownPronouns
{
  return self->_knownPronouns;
}

- (void)setKnownPronouns:(id)a3
{
  objc_storeStrong((id *)&self->_knownPronouns, a3);
}

- (NSString)propertyPreferenceName
{
  return self->_propertyPreferenceName;
}

- (void)setPropertyPreferenceName:(id)a3
{
  objc_storeStrong((id *)&self->_propertyPreferenceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyPreferenceName, 0);
  objc_storeStrong((id *)&self->_knownPronouns, 0);
  objc_storeStrong((id *)&self->_rememberedPronouns, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_examplePlaceholders, 0);
  objc_storeStrong((id *)&self->_exampleStrings, 0);
  objc_storeStrong((id *)&self->_displayedMorphologies, 0);
  objc_storeStrong((id *)&self->_validationRegex, 0);
}

@end
