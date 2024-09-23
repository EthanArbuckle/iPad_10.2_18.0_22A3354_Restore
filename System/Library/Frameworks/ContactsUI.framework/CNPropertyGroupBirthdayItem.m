@implementation CNPropertyGroupBirthdayItem

- (id)displayLabel
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  -[CNPropertyGroupItem property](self, "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("birthdays"));

  if (v4)
  {
    -[CNPropertyGroupItem labeledValue](self, "labeledValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (-[CNPropertyGroupItem labeledValue](self, "labeledValue"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "label"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isEqual:", CFSTR("_systemCalendar")),
          v9,
          v8,
          !v10))
    {
      CNContactsUIBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "calendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "calendarIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("BIRTHDAY_LABEL_FORMAT-%@"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", v17, &stru_1E20507A8, CFSTR("Localized"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", *MEMORY[0x1E0C96670]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v11;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CNPropertyGroupBirthdayItem;
    -[CNPropertyGroupItem displayLabel](&v18, sel_displayLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)updateLabeledValueWithLabel:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNPropertyGroupBirthdayItem;
  -[CNPropertyGroupItem updateLabeledValueWithLabel:](&v15, sel_updateLabeledValueWithLabel_, v4);
  if (-[CNPropertyGroupItem modified](self, "modified"))
  {
    -[CNPropertyGroupItem property](self, "property");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("birthdays"));

    if (v6)
    {
      -[CNPropertyGroupItem labeledValue](self, "labeledValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "month") == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v8, "day") == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend((id)objc_opt_class(), "emptyValueForLabel:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "calendarForLabel:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTimeZone:", v12);

        if (+[CNUIDate isYearlessComponents:](CNUIDate, "isYearlessComponents:", v8))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNUIDate yearlessComponentsFromDate:calendar:](CNUIDate, "yearlessComponentsFromDate:calendar:", v13, v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "setCalendar:", v11);
        }
        else
        {
          +[CNUIDate dateFromComponents:destinationCalendar:](CNUIDate, "dateFromComponents:destinationCalendar:", v8, v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNUIDate componentsFromDate:sourceCalendar:destinationCalendar:](CNUIDate, "componentsFromDate:sourceCalendar:destinationCalendar:", v14, v11, v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v8 = v10;
      }

      -[CNPropertyGroupItem updateLabeledValueWithValue:](self, "updateLabeledValueWithValue:", v9);
    }
  }

}

- (id)labeledValueToCurateFromSuggestion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "calendarForLabel:", CFSTR("_systemCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCalendar:", v4);

  objc_msgSend(MEMORY[0x1E0C97338], "entryWithIdentifier:label:value:", CFSTR("_systemCalendar"), CFSTR("_systemCalendar"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)calendarForLabel:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C97200], "calendarForBirthdayLabel:", a3);
}

+ (id)initialValueForLabel:(id)a3 group:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a1, "calendarForLabel:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeZone:", v9);

  objc_msgSend(a1, "_dateForGroup:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[CNUIDate componentsFromDate:sourceCalendar:destinationCalendar:](CNUIDate, "componentsFromDate:sourceCalendar:destinationCalendar:", v10, v8, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIDate yearlessComponentsFromDate:calendar:](CNUIDate, "yearlessComponentsFromDate:calendar:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCalendar:", v8);
  }

  return v11;
}

+ (id)_dateForGroup:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "editingItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend(v6, "labeledValue"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "value"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          !v8))
    {
      objc_msgSend(v4, "propertyItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }
    objc_msgSend(v6, "labeledValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTimeZone:", v14);

    v15 = 0;
    if (!+[CNUIDate isYearlessComponents:](CNUIDate, "isYearlessComponents:", v13))
    {
      objc_msgSend(v13, "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
