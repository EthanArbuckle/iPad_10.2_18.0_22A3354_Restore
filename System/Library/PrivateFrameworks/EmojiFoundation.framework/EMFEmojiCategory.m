@implementation EMFEmojiCategory

+ (id)categoryIdentifierList
{
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("EMFEmojiCategoryRecents");
  v3[1] = CFSTR("EMFEmojiCategoryPeople");
  v3[2] = CFSTR("EMFEmojiCategoryNature");
  v3[3] = CFSTR("EMFEmojiCategoryFoodAndDrink");
  v3[4] = CFSTR("EMFEmojiCategoryActivity");
  v3[5] = CFSTR("EMFEmojiCategoryTravelAndPlaces");
  v3[6] = CFSTR("EMFEmojiCategoryObjects");
  v3[7] = CFSTR("EMFEmojiCategorySymbols");
  v3[8] = CFSTR("EMFEmojiCategoryFlags");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)categoryWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:", v4);

  return v5;
}

- (EMFEmojiCategory)initWithIdentifier:(id)a3
{
  id v5;
  EMFEmojiCategory *v6;
  EMFEmojiCategory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMFEmojiCategory;
  v6 = -[EMFEmojiCategory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (void)dealloc
{
  NSString *identifier;
  objc_super v4;

  identifier = self->_identifier;
  self->_identifier = 0;

  v4.receiver = self;
  v4.super_class = (Class)EMFEmojiCategory;
  -[EMFEmojiCategory dealloc](&v4, sel_dealloc);
}

+ (id)_baseLocalizationKeyForIdentifier:(id)a3
{
  if (a3 == CFSTR("EMFEmojiCategoryRecents"))
    return CFSTR("Frequently Used");
  if (a3 == CFSTR("EMFEmojiCategoryPeople"))
    return CFSTR("People");
  if (a3 == CFSTR("EMFEmojiCategoryNature"))
    return CFSTR("Nature");
  if (a3 == CFSTR("EMFEmojiCategoryFoodAndDrink"))
    return CFSTR("Food & Drink");
  if (a3 == CFSTR("EMFEmojiCategoryActivity"))
    return CFSTR("Activity");
  if (a3 == CFSTR("EMFEmojiCategoryTravelAndPlaces"))
    return CFSTR("Travel & Places");
  if (a3 == CFSTR("EMFEmojiCategoryObjects"))
    return CFSTR("Objects");
  if (a3 == CFSTR("EMFEmojiCategorySymbols"))
    return CFSTR("Symbols");
  if (a3 == CFSTR("EMFEmojiCategoryFlags"))
    return CFSTR("Flags");
  return 0;
}

+ (id)_emojiSetForIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];

  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == CFSTR("EMFEmojiCategoryPrepopulated"))
  {
    objc_msgSend(a1, "PrepopulatedEmoji");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v6 = (void *)v7;
    goto LABEL_23;
  }
  if (v4 == CFSTR("EMFEmojiCategoryPeople"))
  {
    objc_msgSend(a1, "PeopleEmoji");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v4 == CFSTR("EMFEmojiCategoryNature"))
  {
    objc_msgSend(a1, "NatureEmoji");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v4 == CFSTR("EMFEmojiCategoryFoodAndDrink"))
  {
    objc_msgSend(a1, "FoodAndDrinkEmoji");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v4 == CFSTR("EMFEmojiCategoryActivity"))
  {
    objc_msgSend(a1, "ActivityEmoji");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v4 == CFSTR("EMFEmojiCategoryTravelAndPlaces"))
  {
    objc_msgSend(a1, "TravelAndPlacesEmoji");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v4 == CFSTR("EMFEmojiCategoryObjects"))
  {
    objc_msgSend(a1, "ObjectsEmoji");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v4 == CFSTR("EMFEmojiCategorySymbols"))
  {
    objc_msgSend(a1, "SymbolsEmoji");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v4 == CFSTR("EMFEmojiCategoryFlags"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__EMFEmojiCategory__emojiSetForIdentifier___block_invoke;
    v9[3] = &__block_descriptor_40_e14___NSArray_8__0l;
    v9[4] = a1;
    +[EMFEmojiPreferences _cachedFlagCategoryEmoji:](EMFEmojiPreferences, "_cachedFlagCategoryEmoji:", v9);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v4 == CFSTR("EMFEmojiCategoryRecents"))
  {
    +[EMFEmojiPreferences _recentEmojiStrings](EMFEmojiPreferences, "_recentEmojiStrings");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v6 = 0;
LABEL_23:

  return v6;
}

uint64_t __43__EMFEmojiCategory__emojiSetForIdentifier___block_invoke()
{
  return objc_msgSend((id)objc_opt_class(), "computeEmojiFlagsSortedByLanguage");
}

+ (id)stringToRegionalIndicatorString:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v5 = 0;
    do
    {
      +[EMFStringUtilities _stringWithUnichar:](EMFStringUtilities, "_stringWithUnichar:", objc_msgSend(v3, "characterAtIndex:", v5) + 127397);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByAppendingString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      ++v5;
      v4 = v7;
    }
    while (v5 < objc_msgSend(v3, "length"));
  }
  else
  {
    v7 = v4;
  }

  return v7;
}

+ (void)insertToSortedCountries:(id)a3 withAdditionalFlags:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22 = a4;
  objc_msgSend(v22, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reverseObjectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "integerValue");
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v17 = v16;
          if (v16 < objc_msgSend(v5, "count"))
          {
            objc_msgSend(v22, "objectForKey:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "count"))
            {
              v19 = 0;
              v20 = v17 + 1;
              do
              {
                objc_msgSend(v18, "objectAtIndex:", v19);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "insertObject:atIndex:", v21, v20 + v19);

                ++v19;
              }
              while (v19 < objc_msgSend(v18, "count"));
            }

          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

}

+ (id)extraFlagsForCountryCode:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JP")) & 1) != 0)
  {
    v4 = &unk_1E67291A8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GB")))
  {
    v4 = &unk_1E67291C0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)insertionFlagsForCountryCodes:(id)a3 inSortedCountryCodes:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    v10 = *MEMORY[0x1E0C997B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "displayNameForKey:value:", v10, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v6, "indexOfObject:", v14);

        +[EMFEmojiCategory extraFlagsForCountryCode:](EMFEmojiCategory, "extraFlagsForCountryCode:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKey:", v16, v17);

        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  return v20;
}

+ (id)computeEmojiFlagsSortedByLanguage
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
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
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  +[EMFEmojiCategory flagEmojiCountryCodesCommon](EMFEmojiCategory, "flagEmojiCountryCodesCommon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((EMFIsDeviceInGreaterChina() & 1) == 0)
    objc_msgSend(v5, "addObject:", CFSTR("TW"));
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    v12 = *MEMORY[0x1E0C997B0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v8, "displayNameForKey:value:", v12, v14);
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "displayNameForKey:value:", v12, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v17;
        }
        objc_msgSend(a1, "stringToRegionalIndicatorString:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setValue:forKey:", v18, v16);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[EMFEmojiCategory insertionFlagsForCountryCodes:inSortedCountryCodes:](EMFEmojiCategory, "insertionFlagsForCountryCodes:inSortedCountryCodes:", &unk_1E67291D8, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectsForKeys:notFoundMarker:", v20, &stru_1E670BD50);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");

  +[EMFEmojiCategory insertToSortedCountries:withAdditionalFlags:](EMFEmojiCategory, "insertToSortedCountries:withAdditionalFlags:", v23, v21);
  objc_msgSend((id)objc_opt_class(), "FlagsEmoji");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (NSString)localizedName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_class();
  -[EMFEmojiCategory identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_baseLocalizationKeyForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR(" Category"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringInDeviceLanguageForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)shortLocalizedName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_class();
  -[EMFEmojiCategory identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_baseLocalizationKeyForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR(" Category Fallback"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringInDeviceLanguageForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (id)localizedRecentsDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringInDeviceLanguageForKey:", CFSTR("Recents Description"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)localizedSkinToneEmojiDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringInDeviceLanguageForKey:", CFSTR("Skin Tone Emoji Help"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)emojiTokensForLocaleData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[EMFEmojiCategory identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_emojiSetForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        +[EMFEmojiToken emojiTokenWithString:localeData:](EMFEmojiToken, "emojiTokenWithString:localeData:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v4, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

+ (BOOL)_isDingbatsVariantEmoji:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "DingbatsVariantEmoji");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (BOOL)_isNoneVariantEmoji:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "NoneVariantEmoji");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (BOOL)_isSkinToneEmoji:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "SkinToneEmoji");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (BOOL)_isGenderEmoji:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "GenderEmoji");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (BOOL)_isProfessionEmoji:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "ProfessionEmoji");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (BOOL)_isFlagEmoji:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "FlagsEmoji");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (BOOL)_supportsCoupleSkinToneSelection:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend((id)objc_opt_class(), "_isHandholdingCoupleEmoji:", v3) & 1) != 0
    || (objc_msgSend((id)objc_opt_class(), "_isCoupleMultiSkinToneEmoji:", v3) & 1) != 0
    || objc_msgSend(v3, "rangeOfString:options:", CFSTR("‍❤️‍"), 2) != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

+ (BOOL)_isCoupleMultiSkinToneEmoji:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "CoupleMultiSkinToneEmoji");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(a1, "ExtendedCoupleMultiSkinToneEmoji");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v4) & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend(a1, "_isBaseHandshakeOrHandshakeWithSkintonesEmoji:", v4);

  }
  return v6;
}

+ (BOOL)_isHandholdingCoupleEmoji:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(a1, "CoupleMultiSkinToneEmoji");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMFStringUtilities _stringWithUnichar:](EMFStringUtilities, "_stringWithUnichar:", +[EMFStringUtilities _firstLongCharacterOfString:](EMFStringUtilities, "_firstLongCharacterOfString:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_msgSend(v5, "containsObject:", v6) & 1) != 0
    || objc_msgSend(v4, "rangeOfString:options:", CFSTR("‍🤝‍"), 2) != 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

+ (BOOL)_isComposedCoupleMultiSkinToneEmoji:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("‍🤝‍"), 2);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("‍❤️‍"), 2);
  v5 = v4 != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

+ (BOOL)_isBaseHandshakeOrHandshakeWithSkintonesEmoji:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v7;

  v3 = a3;
  if (objc_msgSend(v3, "rangeOfString:options:", CFSTR("🤝"), 2))
  {
    v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("🫱"), 2);
    v5 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("🫲"), 2);
    v7 = v4 != 0x7FFFFFFFFFFFFFFFLL && v5 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (BOOL)_isMultiPersonFamilySkinToneEmoji:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "MultiPersonFamilySkinToneEmoji");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (id)DingbatsVariantEmoji
{
  if (DingbatsVariantEmoji_onceToken != -1)
    dispatch_once(&DingbatsVariantEmoji_onceToken, &__block_literal_global_6);
  return (id)DingbatsVariantEmoji_DingbatsVariantEmojiSet;
}

void __40__EMFEmojiCategory_DingbatsVariantEmoji__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E67291F0);
  v1 = (void *)DingbatsVariantEmoji_DingbatsVariantEmojiSet;
  DingbatsVariantEmoji_DingbatsVariantEmojiSet = v0;

}

+ (id)NoneVariantEmoji
{
  if (NoneVariantEmoji_onceToken != -1)
    dispatch_once(&NoneVariantEmoji_onceToken, &__block_literal_global_528);
  return (id)NoneVariantEmoji_NoneVariantEmojiSet;
}

void __36__EMFEmojiCategory_NoneVariantEmoji__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6729208);
  v1 = (void *)NoneVariantEmoji_NoneVariantEmojiSet;
  NoneVariantEmoji_NoneVariantEmojiSet = v0;

}

+ (id)SkinToneEmoji
{
  if (SkinToneEmoji_onceToken != -1)
    dispatch_once(&SkinToneEmoji_onceToken, &__block_literal_global_581);
  return (id)SkinToneEmoji_SkinToneEmojiSet;
}

void __33__EMFEmojiCategory_SkinToneEmoji__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6729220);
  v1 = (void *)SkinToneEmoji_SkinToneEmojiSet;
  SkinToneEmoji_SkinToneEmojiSet = v0;

}

+ (id)GenderEmoji
{
  if (GenderEmoji_onceToken != -1)
    dispatch_once(&GenderEmoji_onceToken, &__block_literal_global_810);
  return (id)GenderEmoji_GenderEmojiSet;
}

void __31__EMFEmojiCategory_GenderEmoji__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6729238);
  v1 = (void *)GenderEmoji_GenderEmojiSet;
  GenderEmoji_GenderEmojiSet = v0;

}

+ (id)ProfessionEmoji
{
  if (ProfessionEmoji_onceToken != -1)
    dispatch_once(&ProfessionEmoji_onceToken, &__block_literal_global_819);
  return (id)ProfessionEmoji_ProfessionEmojiSet;
}

void __35__EMFEmojiCategory_ProfessionEmoji__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6729250);
  v1 = (void *)ProfessionEmoji_ProfessionEmojiSet;
  ProfessionEmoji_ProfessionEmojiSet = v0;

}

+ (id)ProfessionWithoutSkinToneEmoji
{
  if (ProfessionWithoutSkinToneEmoji_onceToken != -1)
    dispatch_once(&ProfessionWithoutSkinToneEmoji_onceToken, &__block_literal_global_992);
  return (id)ProfessionWithoutSkinToneEmoji_ProfessionWithoutSkinToneEmojiSet;
}

void __50__EMFEmojiCategory_ProfessionWithoutSkinToneEmoji__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6729268);
  v1 = (void *)ProfessionWithoutSkinToneEmoji_ProfessionWithoutSkinToneEmojiSet;
  ProfessionWithoutSkinToneEmoji_ProfessionWithoutSkinToneEmojiSet = v0;

}

+ (id)CoupleMultiSkinToneEmoji
{
  if (CoupleMultiSkinToneEmoji_onceToken != -1)
    dispatch_once(&CoupleMultiSkinToneEmoji_onceToken, &__block_literal_global_995);
  return (id)CoupleMultiSkinToneEmoji_CoupleMultiSkinToneEmoji;
}

void __44__EMFEmojiCategory_CoupleMultiSkinToneEmoji__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6729280);
  v1 = (void *)CoupleMultiSkinToneEmoji_CoupleMultiSkinToneEmoji;
  CoupleMultiSkinToneEmoji_CoupleMultiSkinToneEmoji = v0;

}

+ (id)ExtendedCoupleMultiSkinToneEmoji
{
  if (ExtendedCoupleMultiSkinToneEmoji_onceToken != -1)
    dispatch_once(&ExtendedCoupleMultiSkinToneEmoji_onceToken, &__block_literal_global_1004);
  return (id)ExtendedCoupleMultiSkinToneEmoji_ExtendedCoupleMultiSkinToneEmoji;
}

void __52__EMFEmojiCategory_ExtendedCoupleMultiSkinToneEmoji__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6729298);
  v1 = (void *)ExtendedCoupleMultiSkinToneEmoji_ExtendedCoupleMultiSkinToneEmoji;
  ExtendedCoupleMultiSkinToneEmoji_ExtendedCoupleMultiSkinToneEmoji = v0;

}

+ (id)MultiPersonFamilySkinToneEmoji
{
  if (MultiPersonFamilySkinToneEmoji_onceToken != -1)
    dispatch_once(&MultiPersonFamilySkinToneEmoji_onceToken, &__block_literal_global_1023);
  return (id)MultiPersonFamilySkinToneEmoji_MultiPersonFamilySkinToneEmoji;
}

void __50__EMFEmojiCategory_MultiPersonFamilySkinToneEmoji__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E67292B0);
  v1 = (void *)MultiPersonFamilySkinToneEmoji_MultiPersonFamilySkinToneEmoji;
  MultiPersonFamilySkinToneEmoji_MultiPersonFamilySkinToneEmoji = v0;

}

+ (id)NewlyAddedEmoji
{
  if (NewlyAddedEmoji_onceToken != -1)
    dispatch_once(&NewlyAddedEmoji_onceToken, &__block_literal_global_1038);
  return (id)NewlyAddedEmoji_newlyAddedEmojiSet;
}

void __35__EMFEmojiCategory_NewlyAddedEmoji__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_new();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = objc_msgSend(&unk_1E67292E0, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v10;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v10 != v3)
          objc_enumerationMutation(&unk_1E67292E0);
        +[EMFStringUtilities _skinToneVariantsForString:](EMFStringUtilities, "_skinToneVariantsForString:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v4));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "addObjectsFromArray:", v5);

        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(&unk_1E67292E0, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v2);
  }
  objc_msgSend(&unk_1E67292C8, "arrayByAddingObjectsFromArray:", v0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
  v8 = (void *)NewlyAddedEmoji_newlyAddedEmojiSet;
  NewlyAddedEmoji_newlyAddedEmojiSet = v7;

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)PrepopulatedEmoji
{
  return &unk_1E67292F8;
}

+ (id)PeopleEmoji
{
  return &unk_1E6729310;
}

+ (id)NatureEmoji
{
  return &unk_1E6729328;
}

+ (id)FoodAndDrinkEmoji
{
  return &unk_1E6729340;
}

+ (id)CelebrationEmoji
{
  return &unk_1E6729358;
}

+ (id)ActivityEmoji
{
  return &unk_1E6729370;
}

+ (id)TravelAndPlacesEmoji
{
  return &unk_1E6729388;
}

+ (id)ObjectsEmoji
{
  return &unk_1E67293A0;
}

+ (id)SymbolsEmoji
{
  return &unk_1E67293B8;
}

+ (id)FlagsEmoji
{
  return &unk_1E67293D0;
}

+ (id)flagEmojiCountryCodesCommon
{
  return &unk_1E67293E8;
}

@end
