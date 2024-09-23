@implementation _NSAutoCalendar

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSAutoCalendar should not be encoded directly"), 0));
}

- (_NSAutoCalendar)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  const __CFString **v7;
  const __CFString **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSCalendars cannot be decoded by non-keyed archivers"), 0));
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.locale")))
  {
    v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.locale"));
    if (!v5)
    {

      v21 = CFSTR("NSLocalizedDescription");
      v22[0] = CFSTR("Locale has been corrupted!");
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = (const __CFString **)v22;
      v8 = &v21;
LABEL_14:
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v7, v8, 1)));
      return 0;
    }
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.timezone")))
  {
    v9 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.timezone"));
    if (!v9)
    {

      v19 = CFSTR("NSLocalizedDescription");
      v20 = CFSTR("Time zone has been corrupted!");
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = &v20;
      v8 = &v19;
      goto LABEL_14;
    }
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.gstartdate")))
  {
    v10 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.gstartdate"));
    if (!v10 || (v11 = v10, (_NSIsNSDate() & 1) == 0))
    {

      v17 = CFSTR("NSLocalizedDescription");
      v18 = CFSTR("Gregorian start date has been corrupted!");
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = &v18;
      v8 = &v17;
      goto LABEL_14;
    }
  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.firstwkdy")))
    v13 = (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("NS.firstwkdy"));
  else
    v13 = -1;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.mindays")))
    v14 = (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("NS.mindays"));
  else
    v14 = -1;

  if (v11 || v5 || v9 || v13 != -1 || v14 != -1)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v16 = v15;
    if (v5)
    {
      objc_msgSend(v15, "setLocale:", v5);
      v15 = v16;
    }
    if (v9)
    {
      objc_msgSend(v16, "setTimeZone:", v9);
      v15 = v16;
    }
    if (v13 != -1)
    {
      objc_msgSend(v16, "setFirstWeekday:", v13);
      v15 = v16;
    }
    if (v14)
    {
      objc_msgSend(v16, "setMinimumDaysInFirstWeek:", v14);
      v15 = v16;
    }
    if (v11)
    {
      objc_msgSend(v16, "setGregorianStartDate:", v11);
      v15 = v16;
    }
  }
  else
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  }
  return (_NSAutoCalendar *)v15;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

@end
