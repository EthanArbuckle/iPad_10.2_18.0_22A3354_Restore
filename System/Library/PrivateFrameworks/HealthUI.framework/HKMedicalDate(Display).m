@implementation HKMedicalDate(Display)

- (uint64_t)displayString
{
  return objc_msgSend(a1, "displayStringWithPreferredForm:includeTimeZone:", objc_msgSend(a1, "form"), 0);
}

- (uint64_t)displayStringWithTimeZone
{
  return objc_msgSend(a1, "displayStringWithPreferredForm:includeTimeZone:", objc_msgSend(a1, "form"), 1);
}

- (id)displayStringWithPreferredForm:()Display includeTimeZone:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (objc_msgSend(a1, "isCompatibleWithMedicalDateForm:"))
  {
    objc_msgSend(MEMORY[0x1E0CB6840], "referenceCalendarWithLocalTimezone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "adjustedDateForCalendar:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB6840];
    if ((a4 & 1) != 0)
    {
      objc_msgSend(a1, "originalTimeZoneString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayStringForDate:form:originalTimeZoneString:", v8, a3, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB6840], "displayStringForDate:form:originalTimeZoneString:", v8, a3, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (id)displayStringForDate:()Display form:originalTimeZoneString:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;

  v7 = a3;
  v8 = a5;
  switch((unint64_t)a4)
  {
    case 0uLL:
      HKLocalizedStringForDateAndTemplate(v7, 33);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v9, v8);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = v9;
      }
      a4 = v11;

      break;
    case 1uLL:
      v12 = v7;
      v13 = 10;
      goto LABEL_7;
    case 2uLL:
      v12 = v7;
      v13 = 6;
      goto LABEL_7;
    case 3uLL:
      v12 = v7;
      v13 = 1;
LABEL_7:
      HKLocalizedStringForDateAndTemplate(v12, v13);
      a4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return a4;
}

@end
