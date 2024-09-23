@implementation CNNonGregorianBirthdayDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 28), CFSTR("_nonGregorianBirthday"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setNonGregorianBirthday:", a3);
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "nonGregorianBirthday");
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF5F18];
  return a3 != 0;
}

- (CNNonGregorianBirthdayDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("nonGregorianBirthday"), sel_nonGregorianBirthday, sel_setNonGregorianBirthday_);
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  _QWORD *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_nonGregorianBirthday"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v9, "copy");
  v8 = (void *)v5[28];
  v5[28] = v7;

}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "nonGregorianBirthday");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "nonGregorianBirthday");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "nonGregorianBirthday");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nonGregorianBirthday");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (!v8)
    goto LABEL_6;
LABEL_7:

  return v11;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  return +[CNDateComponentsEquivalence canUnifyComponents:withComponents:](CNDateComponentsEquivalence, "canUnifyComponents:withComponents:", a3, a4);
}

- (BOOL)isValue:(id)a3 preferredToUnifiedValue:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a4;
  v6 = objc_msgSend(a3, "year");
  v7 = objc_msgSend(v5, "year");

  return v6 != 0x7FFFFFFFFFFFFFFFLL && v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  id v6;
  unsigned int v7;
  BOOL v8;
  id v9;
  void *v10;
  id v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNNonGregorianBirthdayDescription;
  v7 = -[CNPropertyDescription isValidValue:error:](&v13, sel_isValidValue_error_, v6, a4);
  v8 = v7;
  if (v6 && v7)
  {
    v12 = 0;
    v8 = +[CN areValidNonGregorianDayComponents:error:](CN, "areValidNonGregorianDayComponents:error:", v6, &v12);
    v9 = v12;
    if (a4 && !v8)
    {
      -[CNPropertyDescription key](self, "key");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorByPrependingKeyPath:toKeyPathsInError:](CNErrorFactory, "errorByPrependingKeyPath:toKeyPathsInError:", v10, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (id)fromPlistTransform
{
  return +[CN dateComponentsFromDictionaryTransform](CN, "dateComponentsFromDictionaryTransform");
}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3, a4, 4);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (!v10)
      {
LABEL_10:
        objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        if (v17)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setLeapMonth:", objc_msgSend(v18, "BOOLValue"));

        }
        objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length");

        if (v20)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setEra:", objc_msgSend(v21, "integerValue"));

        }
        objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "length");

        if (v23)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setYear:", objc_msgSend(v24, "integerValue"));

        }
        objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "length");

        if (v26)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setMonth:", objc_msgSend(v27, "integerValue"));

        }
        objc_msgSend(v6, "objectAtIndexedSubscript:", 5);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "length");

        if (v29)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", 5);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setDay:", objc_msgSend(v30, "integerValue"));

        }
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "calendar");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setTimeZone:", v31);

        goto LABEL_21;
      }
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
LABEL_9:
        objc_msgSend(v5, "setCalendar:", v13);

        goto LABEL_10;
      }
      objc_msgSend(v11, "lowercaseString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v13 = (void *)v15;
        v11 = v14;
        goto LABEL_9;
      }

    }
    v33 = 0;
    goto LABEL_24;
  }
  v5 = 0;
LABEL_21:
  v5 = v5;
  v33 = v5;
LABEL_24:

  return v33;
}

- (void)ABValueFromCNValue:(id)a3
{
  id v3;
  __CFDictionary *Mutable;
  void *v5;
  void *v6;
  const void *v7;
  void *v8;
  void *v9;
  int v10;
  const void **v11;
  void (**v12)(void *, uint64_t, _QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD aBlock[5];

  v3 = a3;
  if (v3)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    objc_msgSend(v3, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendarIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (const void *)*MEMORY[0x1E0CF5EF0];
      objc_msgSend(v3, "calendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "calendarIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionarySetValue(Mutable, v7, v9);

    }
    v10 = objc_msgSend(v3, "isLeapMonth");
    v11 = (const void **)MEMORY[0x1E0C9AE50];
    if (!v10)
      v11 = (const void **)MEMORY[0x1E0C9AE40];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CF5F08], *v11);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__CNNonGregorianBirthdayDescription_iOSAB__ABValueFromCNValue___block_invoke;
    aBlock[3] = &__block_descriptor_40_e24_v24__0q8____CFString__16l;
    aBlock[4] = Mutable;
    v12 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
    v13 = objc_msgSend(v3, "era");
    v12[2](v12, v13, *MEMORY[0x1E0CF5F00]);
    v14 = objc_msgSend(v3, "year");
    v12[2](v12, v14, *MEMORY[0x1E0CF5F20]);
    v15 = objc_msgSend(v3, "month");
    v12[2](v12, v15, *MEMORY[0x1E0CF5F10]);
    v16 = objc_msgSend(v3, "day");
    v12[2](v12, v16, *MEMORY[0x1E0CF5EF8]);

    if (Mutable)
      Mutable = (__CFDictionary *)CFAutorelease(Mutable);
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

void __63__CNNonGregorianBirthdayDescription_iOSAB__ABValueFromCNValue___block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  __CFDictionary *v4;
  id v5;

  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = *(__CFDictionary **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(v4, a3, v5);

  }
}

- (id)CNValueFromABValue:(void *)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  void *v11;
  uint64_t (**v12)(void *, _QWORD);
  id v13;
  _QWORD aBlock[5];

  if (!a3)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  CFDictionaryGetValue((CFDictionaryRef)a3, (const void *)*MEMORY[0x1E0CF5EF0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = v5;
  }
  else
  {
    objc_msgSend(v5, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v13 = 0;
      goto LABEL_8;
    }
    v7 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v11);

  objc_msgSend(v4, "setCalendar:", v7);
  objc_msgSend(v4, "setLeapMonth:", CFDictionaryGetValue((CFDictionaryRef)a3, (const void *)*MEMORY[0x1E0CF5F08]) == (const void *)*MEMORY[0x1E0C9AE50]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__CNNonGregorianBirthdayDescription_iOSAB__CNValueFromABValue___block_invoke;
  aBlock[3] = &__block_descriptor_40_e21_q16__0____CFString__8l;
  aBlock[4] = a3;
  v12 = (uint64_t (**)(void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(v4, "setEra:", v12[2](v12, *MEMORY[0x1E0CF5F00]));
  objc_msgSend(v4, "setYear:", v12[2](v12, *MEMORY[0x1E0CF5F20]));
  objc_msgSend(v4, "setMonth:", v12[2](v12, *MEMORY[0x1E0CF5F10]));
  objc_msgSend(v4, "setDay:", v12[2](v12, *MEMORY[0x1E0CF5EF8]));
  v13 = v4;

LABEL_8:
  return v13;
}

uint64_t __63__CNNonGregorianBirthdayDescription_iOSAB__CNValueFromABValue___block_invoke(uint64_t a1, const void *a2)
{
  void *Value;

  Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
  if (Value)
    return objc_msgSend(Value, "integerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

@end
