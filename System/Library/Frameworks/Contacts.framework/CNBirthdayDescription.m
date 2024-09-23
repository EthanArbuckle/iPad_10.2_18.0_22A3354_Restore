@implementation CNBirthdayDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 27), CFSTR("_birthday"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setBirthday:", a3);
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "birthday");
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF5F38];
  return a3 != 0;
}

- (CNBirthdayDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("birthday"), sel_birthday, sel_setBirthday_);
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
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_birthday"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v9, "copy");
  v8 = (void *)v5[27];
  v5[27] = v7;

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
  objc_msgSend(v6, "birthday");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "birthday");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "birthday");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "birthday");
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
  v13.super_class = (Class)CNBirthdayDescription;
  v7 = -[CNPropertyDescription isValidValue:error:](&v13, sel_isValidValue_error_, v6, a4);
  v8 = v7;
  if (v6 && v7)
  {
    v12 = 0;
    v8 = +[CN areValidGregorianDayComponents:error:](CN, "areValidGregorianDayComponents:error:", v6, &v12);
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
  return -[CNBirthdayDescription CNValueFromABValue:](self, "CNValueFromABValue:", +[CNiOSABConversions dateFromABBytes:length:](CNiOSABConversions, "dateFromABBytes:length:", a3, a4));
}

- (void)ABValueFromCNValue:(id)a3
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

- (id)CNValueFromABValue:(void *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D139F0], "dayComponentsFromDate:", a3);
}

@end
