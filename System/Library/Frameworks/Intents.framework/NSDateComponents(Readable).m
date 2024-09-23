@implementation NSDateComponents(Readable)

- (id)_intents_readableTitleWithLocalizer:()Readable metadata:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99D48];
  objc_msgSend(v6, "languageCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_currentCalendarWithLanguageCode:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v7;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v11, "format") == 1)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0CB3570]);
      objc_msgSend(v12, "setCalendar:", v10);
      objc_msgSend(v12, "setUnitsStyle:", 2);
      v13 = objc_msgSend(v11, "type");
      if (v13 <= 2)
        objc_msgSend(v12, "setAllowedUnits:", qword_18C3111F8[v13]);
      objc_msgSend(v12, "stringFromDateComponents:", a1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dateFromComponents:", a1);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "timeZone");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_intents_readableTitleWithLocalizer:metadata:timeZone:", v6, v11, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0CB3570], "localizedStringFromDateComponents:unitsStyle:", a1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

@end
