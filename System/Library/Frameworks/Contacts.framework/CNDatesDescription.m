@implementation CNDatesDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 51), CFSTR("_dates"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setDates:", a3);
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "dates");
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF5F58];
  return a3 != 0;
}

- (CNDatesDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("dates"), sel_dates, sel_setDates_);
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  id v5;
  _QWORD *v6;
  void *v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v12 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v13 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 16; i != -8; i -= 8)

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("_dates"), v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)v6[51];
  v6[51] = v10;

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
  objc_msgSend(v6, "dates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "dates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "dates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (!v8)
    goto LABEL_6;
LABEL_7:

  return v11;
}

- (BOOL)isNonnull
{
  return 1;
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  void *v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "day");
  v9 = objc_msgSend(v7, "day");
  v22 = objc_msgSend(v6, "month");
  v10 = objc_msgSend(v7, "month");
  objc_msgSend(v6, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v7, "calendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v14 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if (!v11)
    goto LABEL_6;
LABEL_7:

  v15 = objc_msgSend(v6, "year");
  v16 = objc_msgSend(v7, "year");
  v17 = objc_msgSend(v6, "year");
  v18 = objc_msgSend(v7, "year");
  v19 = 0;
  if (v8 == v9 && v22 == v10)
  {
    v20 = (v15 == 0x7FFFFFFFFFFFFFFFLL) ^ (v16 == 0x7FFFFFFFFFFFFFFFLL);
    if (v17 == v18)
      v20 = 1;
    v19 = v14 & v20;
  }

  return v19;
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

- (id)standardLabels
{
  if (standardLabels_cn_once_token_6 != -1)
    dispatch_once(&standardLabels_cn_once_token_6, &__block_literal_global_464);
  return (id)standardLabels_cn_once_object_6;
}

void __36__CNDatesDescription_standardLabels__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("_$!<Anniversary>!$_"), CFSTR("_$!<Other>!$_"), 0);
  v1 = (void *)standardLabels_cn_once_object_6;
  standardLabels_cn_once_object_6 = v0;

}

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isValidMultiValueValue:(id)a3 error:(id *)a4
{
  return +[CN areValidGregorianDayComponents:error:](CN, "areValidGregorianDayComponents:error:", a3, a4);
}

- (id)fromPlistTransform
{
  return +[CN dateComponentsFromDictionaryTransform](CN, "dateComponentsFromDictionaryTransform");
}

- (id)CNLabeledValueValueFromABMultiValueValueBytes:(char *)a3 length:(unint64_t)a4
{
  void *v5;
  void *v6;

  if (a4 == 8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDatesDescription CNLabeledValueValueFromABMultiValueValue:](self, "CNLabeledValueValueFromABMultiValueValue:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Date parameter was unexpectedly large during contact buffer decode."));
    v6 = 0;
  }
  return v6;
}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D139F0], "dayComponentsFromDate:", a3);
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3
{
  void *v3;
  void *v4;
  CFTypeRef v5;
  CFTypeRef v6;

  objc_msgSend(MEMORY[0x1E0D139F0], "dateFromDayComponents:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (v5 = CFRetain(v3)) != 0)
    v6 = CFAutorelease(v5);
  else
    v6 = 0;

  return (void *)v6;
}

@end
