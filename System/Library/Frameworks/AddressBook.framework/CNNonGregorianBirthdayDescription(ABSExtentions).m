@implementation CNNonGregorianBirthdayDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3)
    *a3 = 49;
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 5;
}

- (id)convertABSValue:()ABSExtentions toCNValue:error:
{
  id result;
  CFErrorRef v10;
  objc_super v11;

  if (ABValidateAlternateBirthday(a3))
  {
    v11.receiver = a1;
    v11.super_class = (Class)&off_2545FDFA0;
    return objc_msgSendSuper2(&v11, sel_convertABSValue_toCNValue_error_, a3, a4, a5);
  }
  else if (a5)
  {
    v10 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("ABAddressBookErrorDomain"), 0, 0);
    result = 0;
    *a5 = v10;
  }
  else
  {
    return 0;
  }
  return result;
}

- (__CFDictionary)ABSValueFromCNValue:()ABSExtentions
{
  id v3;
  __CFDictionary *Mutable;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const void **v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  _QWORD v13[5];

  v3 = a3;
  if (v3)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    objc_msgSend(v3, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendarIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "calendar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "calendarIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionarySetValue(Mutable, CFSTR("calendarIdentifier"), v8);

    }
    v9 = objc_msgSend(v3, "isLeapMonth");
    v10 = (const void **)MEMORY[0x24BDBD270];
    if (!v9)
      v10 = (const void **)MEMORY[0x24BDBD268];
    CFDictionarySetValue(Mutable, CFSTR("isLeapMonth"), *v10);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __72__CNNonGregorianBirthdayDescription_ABSExtentions__ABSValueFromCNValue___block_invoke;
    v13[3] = &__block_descriptor_40_e24_v24__0q8____CFString__16l;
    v13[4] = Mutable;
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD234E4](v13);
    ((void (**)(_QWORD, uint64_t, const __CFString *))v11)[2](v11, objc_msgSend(v3, "era"), CFSTR("era"));
    ((void (**)(_QWORD, uint64_t, const __CFString *))v11)[2](v11, objc_msgSend(v3, "year"), CFSTR("year"));
    ((void (**)(_QWORD, uint64_t, const __CFString *))v11)[2](v11, objc_msgSend(v3, "month"), CFSTR("month"));
    ((void (**)(_QWORD, uint64_t, const __CFString *))v11)[2](v11, objc_msgSend(v3, "day"), CFSTR("day"));

    if (Mutable)
      Mutable = (__CFDictionary *)CFAutorelease(Mutable);
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

- (id)CNValueFromABSValue:()ABSExtentions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t (**v10)(_QWORD, _QWORD);
  _QWORD v11[5];

  if (!a3)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  CFDictionaryGetValue(a3, CFSTR("calendarIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE48]), "initWithCalendarIdentifier:", v5);
  if (v6)
  {
    v7 = v5;
LABEL_6:
    objc_msgSend(v4, "setCalendar:", v6);
    objc_msgSend(v4, "setLeapMonth:", CFDictionaryGetValue(a3, CFSTR("isLeapMonth")) == (const void *)*MEMORY[0x24BDBD270]);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __72__CNNonGregorianBirthdayDescription_ABSExtentions__CNValueFromABSValue___block_invoke;
    v11[3] = &__block_descriptor_40_e21_q16__0____CFString__8l;
    v11[4] = a3;
    v10 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x20BD234E4](v11);
    objc_msgSend(v4, "setEra:", ((uint64_t (**)(_QWORD, const __CFString *))v10)[2](v10, CFSTR("era")));
    objc_msgSend(v4, "setYear:", ((uint64_t (**)(_QWORD, const __CFString *))v10)[2](v10, CFSTR("year")));
    objc_msgSend(v4, "setMonth:", ((uint64_t (**)(_QWORD, const __CFString *))v10)[2](v10, CFSTR("month")));
    objc_msgSend(v4, "setDay:", ((uint64_t (**)(_QWORD, const __CFString *))v10)[2](v10, CFSTR("day")));
    v9 = v4;

    goto LABEL_7;
  }
  objc_msgSend(v5, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE48]), "initWithCalendarIdentifier:", v7);
  if (v9)
    goto LABEL_6;
LABEL_7:

  return v9;
}

@end
