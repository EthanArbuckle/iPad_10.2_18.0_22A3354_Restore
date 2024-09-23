@implementation _NSPersonNameComponentsStyleFormatterAbbreviated

- (id)keysOfInterest
{
  id result;

  result = self->super._keysOfInterest;
  if (!result)
  {
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("givenName"), CFSTR("familyName"), 0);
    self->super._keysOfInterest = (NSSet *)result;
  }
  return result;
}

- (BOOL)shouldIgnoreComponentsContainingSpecialCharacters
{
  return 1;
}

- (id)_formattedStringFromOrderedKeys:(id)a3 components:(id)a4 attributesByRange:(id)a5
{
  int64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  char v14;
  char v15;
  void *v16;
  const __CFString **v17;
  void *v18;
  char v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  char v29;
  NSPersonNameComponents *v30;
  NSPersonNameComponents *v31;
  char v33;
  objc_super v36;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[2];
  const __CFString *v43;
  _QWORD v44[2];
  _BYTE v45[128];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = +[NSPersonNameComponentsFormatter __abbreviatedNameFormatForPersonNameComponents:](NSPersonNameComponentsFormatter, "__abbreviatedNameFormatForPersonNameComponents:", a4);
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v47 != v11)
          objc_enumerationMutation(a3);
        v13 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        if (+[NSPersonNameComponentsFormatter __inferredScriptIndexFromString:](NSPersonNameComponentsFormatter, "__inferredScriptIndexFromString:", objc_msgSend(a4, "valueForKey:", v13)) != 1)objc_msgSend(v8, "addObject:", v13);
      }
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
    }
    while (v10);
  }
  if ((unint64_t)(v7 - 1) < 4)
  {
    -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter");
    v14 = objc_msgSend((id)objc_opt_class(), "__shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly");
    v15 = v14;
    if ((v7 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      v44[0] = CFSTR("givenName");
      v44[1] = CFSTR("familyName");
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = (const __CFString **)v44;
    }
    else
    {
      if (v7 == 2)
        v19 = v14;
      else
        v19 = 1;
      if ((v19 & 1) == 0)
      {
        v43 = CFSTR("familyName");
        v16 = (void *)MEMORY[0x1E0C99D20];
        v17 = &v43;
        v20 = 1;
LABEL_23:
        v22 = (void *)objc_msgSend(v16, "arrayWithObjects:count:", v17, v20);
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
        if (v23)
        {
          v24 = v23;
          v33 = v15;
          v25 = *(_QWORD *)v39;
LABEL_25:
          v26 = 0;
          while (1)
          {
            if (*(_QWORD *)v39 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v26);
            if (objc_msgSend(v8, "containsObject:", v27))
            {
              v28 = (id)objc_msgSend(a4, "valueForKeyPath:", v27);
              if (objc_msgSend(v28, "length"))
                break;
            }
            if (v24 == ++v26)
            {
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
              if (v24)
                goto LABEL_25;
              v28 = 0;
              v27 = 0;
              break;
            }
          }
          v15 = v33;
        }
        else
        {
          v28 = 0;
          v27 = 0;
        }
        if (v7 == 2)
          v29 = v15;
        else
          v29 = 1;
        if ((v29 & 1) != 0)
        {
          if ((unint64_t)(v7 - 3) < 2)
            goto LABEL_44;
        }
        else if ((unint64_t)-[NSString __graphemeCount](v28) > 2)
        {
          v28 = 0;
          goto LABEL_45;
        }
        if ((unint64_t)-[NSString __graphemeCount](v28) >= 3)
LABEL_44:
          v28 = +[NSPersonNameComponentsFormatter __initialsForString:](NSPersonNameComponentsFormatter, "__initialsForString:", v28);
LABEL_45:
        v30 = objc_alloc_init(NSPersonNameComponents);
        v31 = v30;
        if (v27)
          -[NSPersonNameComponents setValue:forKey:](v30, "setValue:forKey:", v28, v27);
        v21 = -[_NSPersonNameComponentsStyleFormatter _formattedStringFromOrderedKeys:components:attributesByRange:](-[_NSPersonNameComponentsStyleFormatter initWithMasterFormatter:]([_NSPersonNameComponentsStyleFormatterLong alloc], "initWithMasterFormatter:", -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter")), "_formattedStringFromOrderedKeys:components:attributesByRange:", v8, v31, a5);
        goto LABEL_48;
      }
      v42[0] = CFSTR("familyName");
      v42[1] = CFSTR("givenName");
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = (const __CFString **)v42;
    }
    v20 = 2;
    goto LABEL_23;
  }
  if (v7 != 6)
  {
    v36.receiver = self;
    v36.super_class = (Class)_NSPersonNameComponentsStyleFormatterAbbreviated;
    v21 = -[_NSPersonNameComponentsStyleFormatter _formattedStringFromOrderedKeys:components:attributesByRange:](&v36, sel__formattedStringFromOrderedKeys_components_attributesByRange_, v8, a4, a5);
LABEL_48:
    v18 = v21;
    return (id)objc_msgSend(v18, "uppercaseStringWithLocale:", +[NSPersonNameComponentsFormatter __currentLocale](NSPersonNameComponentsFormatter, "__currentLocale"));
  }
  v18 = 0;
  return (id)objc_msgSend(v18, "uppercaseStringWithLocale:", +[NSPersonNameComponentsFormatter __currentLocale](NSPersonNameComponentsFormatter, "__currentLocale"));
}

- (id)abbreviatedKeys
{
  id result;
  id v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  result = self->super._abbreviatedKeys;
  if (!result)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E60]);
    v5[0] = CFSTR("givenName");
    v5[1] = CFSTR("familyName");
    result = (id)objc_msgSend(v4, "initWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2));
    self->super._abbreviatedKeys = (NSSet *)result;
  }
  return result;
}

- (id)_delimiterBetweenString:(id)a3 andString:(id)a4 isPhonetic:(BOOL)a5
{
  return 0;
}

- (id)fallbackStyleFormatter
{
  return -[_NSPersonNameComponentsStyleFormatterShort initWithMasterFormatter:]([_NSPersonNameComponentsStyleFormatterShort alloc], "initWithMasterFormatter:", -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
}

@end
