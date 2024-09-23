@implementation FMRelativeDateFormatter

- (FMRelativeDateFormatter)init
{
  FMRelativeDateFormatter *v2;
  FMRelativeDateFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMRelativeDateFormatter;
  v2 = -[FMRelativeDateFormatter init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FMRelativeDateFormatter setDoesRelativeDateFormatting:](v2, "setDoesRelativeDateFormatting:", 1);
    -[FMRelativeDateFormatter setDateStyle:](v3, "setDateStyle:", 3);
    -[FMRelativeDateFormatter setTimeStyle:](v3, "setTimeStyle:", 1);
  }
  return v3;
}

- (id)localizedStringForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)formattingContextKeyForKey:(id)a3
{
  id v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;

  v4 = a3;
  v5 = -[FMRelativeDateFormatter formattingContext](self, "formattingContext") - 3;
  if (v5 > 2)
    v6 = CFSTR("__STANDALONE");
  else
    v6 = off_1E82AA930[v5];
  objc_msgSend(v4, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  FMPastDateComponentsFormatter *v12;
  id v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v9 = v7 - v8;
  if (v9 >= 60.0)
  {
    if (v9 >= 3600.0)
    {
      v16.receiver = self;
      v16.super_class = (Class)FMRelativeDateFormatter;
      -[FMRelativeDateFormatter stringForObjectValue:](&v16, sel_stringForObjectValue_, v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(FMPastDateComponentsFormatter);
    v13 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    -[FMRelativeDateFormatter locale](self, "locale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLocale:", v14);

    -[NSDateComponentsFormatter setCalendar:](v12, "setCalendar:", v10);
    -[NSDateComponentsFormatter setAllowedUnits:](v12, "setAllowedUnits:", 64);
    -[NSDateComponentsFormatter setUnitsStyle:](v12, "setUnitsStyle:", 3);
    -[NSDateComponentsFormatter setIncludesTimeRemainingPhrase:](v12, "setIncludesTimeRemainingPhrase:", 1);
    objc_msgSend(v13, "setMinute:", -(uint64_t)(v9 / 60.0));
    -[NSDateComponentsFormatter stringFromDateComponents:](v12, "stringFromDateComponents:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FMRelativeDateFormatter formattingContextKeyForKey:](self, "formattingContextKeyForKey:", CFSTR("FMRELATIVEDATEFORMATTER__LESS_THAN_A_MINUTE_AGO"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMRelativeDateFormatter localizedStringForKey:](self, "localizedStringForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v11;
}

@end
