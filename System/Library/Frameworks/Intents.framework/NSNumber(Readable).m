@implementation NSNumber(Readable)

- (id)_intents_readableTitleWithLocalizer:()Readable metadata:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "codableAttribute");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v20 = v9;

    objc_msgSend(v20, "valueForIndex:", objc_msgSend(a1, "integerValue"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "localizedDisplayNameWithLocalizer:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_19:
    v22.receiver = a1;
    v22.super_class = (Class)&off_1EE0A3A78;
    objc_msgSendSuper2(&v22, sel__intents_readableTitleWithLocalizer_metadata_, v6, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v10 = v7;
  v11 = (void *)objc_opt_new();
  v12 = objc_msgSend(v10, "minimumUnit");
  if (v12 > objc_msgSend(v10, "maximumUnit"))
    goto LABEL_18;
  v13 = 0;
  v14 = v12 - 1;
  do
  {
    if ((unint64_t)v14 > 2)
      v15 = 128;
    else
      v15 = qword_18C311BC8[v14];
    v13 |= v15;
    ++v14;
  }
  while (v14 < objc_msgSend(v10, "maximumUnit"));
  if (!v13)
  {
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(v11, "setAllowedUnits:", v13);
  v16 = (void *)MEMORY[0x1E0C99D48];
  objc_msgSend(v6, "languageCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "if_currentCalendarWithLanguageCode:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCalendar:", v18);

  objc_msgSend(v11, "setUnitsStyle:", 2);
  objc_msgSend(a1, "doubleValue");
  objc_msgSend(v11, "stringFromTimeInterval:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
LABEL_20:

  return v19;
}

@end
