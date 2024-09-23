@implementation CNContact(UIAdditions)

+ (uint64_t)suggestionsShownInEditMode
{
  if (suggestionsShownInEditMode_onceToken != -1)
    dispatch_once(&suggestionsShownInEditMode_onceToken, &__block_literal_global_6_29600);
  return suggestionsShownInEditMode_enabled;
}

- (BOOL)hasLowQualityImage
{
  double v1;
  double v2;

  objc_msgSend(a1, "cropRect");
  if (v1 == *MEMORY[0x1E0C9D820] && v2 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    return 0;
  if (v2 < 250.0)
    return 1;
  return v1 < 250.0;
}

- (id)birthdays
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "birthday");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C97338], "entryWithIdentifier:label:value:", CFSTR("_systemCalendar"), CFSTR("_systemCalendar"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  objc_msgSend(a1, "nonGregorianBirthday");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "calendarIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C97338], "entryWithIdentifier:label:value:", v8, v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v9);

  }
  if (!objc_msgSend(v2, "count"))
  {
    objc_msgSend(a1, "dates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_cn_firstObjectPassingTest:", &__block_literal_global_34_29581);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "_cn_addNonNilObject:", v11);
  }

  return v2;
}

+ (uint64_t)downtimeWhitelistUIEnabled
{
  if (downtimeWhitelistUIEnabled_onceToken != -1)
    dispatch_once(&downtimeWhitelistUIEnabled_onceToken, &__block_literal_global_18_29590);
  return downtimeWhitelistUIEnabled_enabled;
}

+ (uint64_t)quickActionsEnabled
{
  if (quickActionsEnabled_onceToken != -1)
    dispatch_once(&quickActionsEnabled_onceToken, &__block_literal_global_9);
  return quickActionsEnabled_enabled;
}

+ (uint64_t)suggestionsEnabled
{
  if (suggestionsEnabled_onceToken != -1)
    dispatch_once(&suggestionsEnabled_onceToken, &__block_literal_global_29603);
  return suggestionsEnabled_enabled;
}

- (uint64_t)isUnknown
{
  int v2;

  if ((objc_msgSend(a1, "isSuggested") & 1) != 0)
    return objc_msgSend(a1, "isSuggestedMe") ^ 1;
  v2 = objc_msgSend(a1, "iOSLegacyIdentifier");
  if (v2 == *MEMORY[0x1E0C966D8])
    return objc_msgSend(a1, "isSuggestedMe") ^ 1;
  else
    return 0;
}

- (id)personName
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C97218]);
  objc_msgSend(v2, "setIgnoresOrganization:", 1);
  objc_msgSend(v2, "stringFromContact:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)supportsInstantMessageService
{
  return 1;
}

- (BOOL)overrideSensitiveContent
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "sensitiveContentConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "override") == 1;

  return v2;
}

- (id)posterName
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C97218], "posterNameComponentsForContact:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "singleNameComponentIndex"))
    objc_msgSend(v2, "secondNameComponent");
  else
    objc_msgSend(v2, "firstNameComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    objc_msgSend(a1, "posterFallbackDisplayName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (__CFString)posterFallbackDisplayName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  objc_msgSend(a1, "phoneNumbers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formattedStringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x1E0D13848];
  if (((*(uint64_t (**)(_QWORD, void *))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v5) & 1) != 0)
  {
    objc_msgSend(a1, "emailAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (((*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v9) & 1) != 0)
    {
      objc_msgSend(a1, "organizationName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (((*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v10) & 1) != 0)
        v11 = &stru_1E20507A8;
      else
        v11 = v10;

    }
    else
    {
      v11 = v9;
    }

  }
  else
  {
    v11 = v5;
  }

  return v11;
}

- (id)contactImageBackgroundColors
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "backgroundColors");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)contactPosterBackgroundColors
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "backgroundColors");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactPoster");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)validPropertiesByEvaluatingPredicate:()UIAdditions onMultiValueProperties:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "multiValuePropertiesSupportingPredicateValidation");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v7)
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __86__CNContact_UIAdditions__validPropertiesByEvaluatingPredicate_onMultiValueProperties___block_invoke;
    v33[3] = &unk_1E204E1D8;
    v33[4] = a1;
    objc_msgSend(v7, "_cn_filter:", v33);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v9;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v7;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(obj);
        v23 = v10;
        v11 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v10);
        objc_msgSend(a1, "valueForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v26 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "identifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C97280], "contactPropertyWithContact:propertyKey:identifier:", a1, v11, v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v6, "evaluateWithObject:", v18))
                objc_msgSend(v24, "addObject:", v18);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
          }
          while (v14);
        }

        v10 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v22);
  }

  return v24;
}

- (id)vCardRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DDCAF0], "optionsFromPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludePhotos:", 1);
  objc_msgSend(v2, "setIncludeNotes:", 1);
  v3 = (void *)MEMORY[0x1E0C972A8];
  v7[0] = a1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithContacts:options:error:", v4, v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)rawImageType
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "imageType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "rawImageTypeForIdentifier:", v3);

  return v4;
}

- (uint64_t)rawImageSource
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "imageType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "rawImageSourceForIdentifier:", v3);

  return v4;
}

- (uint64_t)hasImageOfType:()UIAdditions
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend((id)objc_opt_class(), "stringIdentifierForImageType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(a1, "imageType"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(a1, "imageType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v4);
  }
  else
  {
    objc_msgSend(a1, "imageType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4 == v6;
  }

  return v7;
}

- (uint64_t)copyWithCuratingAllSuggestionsAndBirthdaySuggestion
{
  void *v1;
  uint64_t v2;

  v1 = (void *)objc_msgSend(a1, "copyWithCuratingBirthdaySuggestion");
  v2 = objc_msgSend(v1, "copyWithCuratingAllSuggestions");

  return v2;
}

- (id)copyWithCuratingBirthdaySuggestion
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v1 = a1;
  objc_msgSend(v1, "dates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_firstObjectPassingTest:", &__block_literal_global_43);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v1, "birthday");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

    }
    else
    {
      objc_msgSend(v1, "nonGregorianBirthday");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        v8 = (void *)objc_msgSend(v1, "mutableCopy");
        objc_msgSend(v3, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "calendarForBirthdayLabel:", CFSTR("_systemCalendar"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setCalendar:", v10);

        objc_msgSend(v8, "setBirthday:", v9);
        objc_msgSend(v8, "dates");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __60__CNContact_UIAdditions__copyWithCuratingBirthdaySuggestion__block_invoke_2;
        v13[3] = &unk_1E204B890;
        v14 = v3;
        objc_msgSend(v11, "_cn_filter:", v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setDates:", v12);

        objc_msgSend(v8, "freezeWithSelfAsSnapshot");
        v6 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_6;
      }
    }
  }
  v6 = v1;
LABEL_6:

  return v6;
}

+ (uint64_t)geminiEnabled
{
  if (geminiEnabled_onceToken != -1)
    dispatch_once(&geminiEnabled_onceToken, &__block_literal_global_12);
  return geminiEnabled_enabled;
}

+ (uint64_t)settableMeCardEnabled
{
  if (settableMeCardEnabled_onceToken != -1)
    dispatch_once(&settableMeCardEnabled_onceToken, &__block_literal_global_15_29593);
  return settableMeCardEnabled_enabled;
}

+ (uint64_t)nameAndPhotoSharingDebugUIEnabled
{
  if (nameAndPhotoSharingDebugUIEnabled_onceToken != -1)
    dispatch_once(&nameAndPhotoSharingDebugUIEnabled_onceToken, &__block_literal_global_21_29587);
  return nameAndPhotoSharingDebugUIEnabled_enabled;
}

+ (id)descriptorForAllUIKeys
{
  if (descriptorForAllUIKeys_cn_once_token_1 != -1)
    dispatch_once(&descriptorForAllUIKeys_cn_once_token_1, &__block_literal_global_24);
  return (id)descriptorForAllUIKeys_cn_once_object_1;
}

+ (id)calendarForBirthdayLabel:()UIAdditions
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("_systemCalendar")))
    v4 = (id)*MEMORY[0x1E0C996C8];
  else
    v4 = v3;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)multiValuePropertiesSupportingPredicateValidation
{
  if (multiValuePropertiesSupportingPredicateValidation_cn_once_token_2 != -1)
    dispatch_once(&multiValuePropertiesSupportingPredicateValidation_cn_once_token_2, &__block_literal_global_36_29586);
  return (id)multiValuePropertiesSupportingPredicateValidation_cn_once_object_2;
}

+ (id)contactWithStateRestorationCoder:()UIAdditions store:keys:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "unifiedContactWithIdentifier:keysToFetch:error:", v10, v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)stringIdentifierForImageType:()UIAdditions
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  else
    return **((id **)&unk_1E204B8D0 + a3 - 1);
}

+ (uint64_t)imageTypeStringIdentifierForImageSource:()UIAdditions
{
  uint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "imageTypeForContactImageSource:", a3);
  return objc_msgSend((id)objc_opt_class(), "stringIdentifierForImageType:", v3);
}

+ (uint64_t)imageTypeForContactImageSource:()UIAdditions
{
  if (a3 > 3)
    return 4;
  else
    return qword_18AF8BA20[a3];
}

+ (uint64_t)rawImageTypeForIdentifier:()UIAdditions
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96738]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96718]) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96730]) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96720]))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (uint64_t)rawImageSourceForIdentifier:()UIAdditions
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96738]) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96718]) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96730]) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96720]))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
