@implementation NSCalendar(NSCalendar)

- (uint64_t)encodeWithCoder:()NSCalendar
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSCalendars cannot be encoded by non-keyed archivers"), 0));
  v5 = objc_msgSend(a1, "calendarIdentifier");
  if (v5)
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("NS.identifier"));
  v6 = objc_msgSend(a1, "locale");
  if (v6)
    objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NS.locale"));
  v7 = objc_msgSend(a1, "timeZone");
  if (v7)
    objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("NS.timezone"));
  v8 = objc_msgSend(a1, "gregorianStartDate");
  if (v8)
    objc_msgSend(a3, "encodeObject:forKey:", v8, CFSTR("NS.gstartdate"));
  objc_msgSend(a3, "encodeInteger:forKey:", objc_msgSend(a1, "firstWeekday"), CFSTR("NS.firstwkdy"));
  return objc_msgSend(a3, "encodeInteger:forKey:", objc_msgSend(a1, "minimumDaysInFirstWeek"), CFSTR("NS.mindays"));
}

- (void)initWithCoder:()NSCalendar
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString **v10;
  const __CFString **v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSCalendars cannot be decoded by non-keyed archivers"), 0));
  }
  if (!objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.identifier"))
    || (v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.identifier"))) == 0)
  {

    v21 = CFSTR("NSLocalizedDescription");
    v22[0] = CFSTR("Time zone has been corrupted!");
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = (const __CFString **)v22;
    v11 = &v21;
    goto LABEL_9;
  }
  v6 = v5;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.locale")))
  {
    v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.locale"));
    if (!v7 || (v8 = v7, (objc_opt_isKindOfClass() & 1) == 0))
    {

      v19 = CFSTR("NSLocalizedDescription");
      v20 = CFSTR("Locale has been corrupted!");
      v9 = (void *)MEMORY[0x1E0C99D80];
      v10 = &v20;
      v11 = &v19;
LABEL_9:
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1)));
      return 0;
    }
  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.timezone")))
    v14 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.timezone"));
  else
    v14 = 0;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.gstartdate")))
    v15 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.gstartdate"));
  else
    v15 = 0;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.firstwkdy")))
    v16 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.firstwkdy"));
  else
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.mindays")))
    v17 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.mindays"));
  else
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "error"))
  {

    return 0;
  }
  v18 = (void *)objc_msgSend(a1, "initWithCalendarIdentifier:", v6);
  v12 = v18;
  if (v18)
  {
    objc_msgSend(v18, "setLocale:", v8);
    if (v14)
      objc_msgSend(v12, "setTimeZone:", v14);
    if (v15)
      objc_msgSend(v12, "setGregorianStartDate:", v15);
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v12, "setFirstWeekday:", v16);
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v12, "setMinimumDaysInFirstWeek:", v17);
  }
  return v12;
}

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

@end
