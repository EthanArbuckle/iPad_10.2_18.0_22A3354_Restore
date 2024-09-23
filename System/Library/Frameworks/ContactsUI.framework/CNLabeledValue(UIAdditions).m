@implementation CNLabeledValue(UIAdditions)

+ (id)localizedDisplayStringForLabel:()UIAdditions propertyName:
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a4;
  objc_msgSend(a1, "localizedStringForLabel:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    CNUILocalizedStringForPropertyWithFormatKey(CFSTR("LOWERCASE_LABEL"), v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }

  return v7;
}

- (id)localizedLabel
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "label");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (uint64_t)addressBook
{
  if (addressBook_onceToken != -1)
    dispatch_once(&addressBook_onceToken, &__block_literal_global_16059);
  return addressBook_ab;
}

+ (id)defaultLabels
{
  if (defaultLabels_onceToken != -1)
    dispatch_once(&defaultLabels_onceToken, &__block_literal_global_2_16056);
  return (id)defaultLabels_labels;
}

+ (id)allLabels
{
  objc_msgSend(MEMORY[0x1E0C97338], "addressBook");
  return (id)ABAddressBookCopyAllLabels();
}

+ (id)allCustomLabels
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "defaultLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "allLabels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "minusSet:", v4);
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)deleteCustomLabel:()UIAdditions
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x1E0C97338];
  v4 = a3;
  objc_msgSend(v3, "addressBook");
  ABAddressBookDeleteLabel();

}

+ (id)builtinLabelsForProperty:()UIAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[3];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (builtinLabelsForProperty__onceToken != -1)
    dispatch_once(&builtinLabelsForProperty__onceToken, &__block_literal_global_6_16055);
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("birthdays")))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "calendarIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D3EFB0];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lunarCalendarsForLocaleID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend((id)builtinLabelsForProperty__labelsForProperty, "objectForKeyedSubscript:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_7:
      v12 = *MEMORY[0x1E0C97070];
      v14[0] = *MEMORY[0x1E0C96FF8];
      v14[1] = v12;
      v14[2] = *MEMORY[0x1E0C97000];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v11;
}

@end
