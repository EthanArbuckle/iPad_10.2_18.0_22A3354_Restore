@implementation CNCalendarURIsDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 56), CFSTR("_calendarURIs"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setCalendarURIs:", a3);
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "calendarURIs");
}

- (CNCalendarURIsDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("calendarURIs"), sel_calendarURIs, sel_setCalendarURIs_);
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

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("_calendarURIs"), v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)v6[56];
  v6[56] = v10;

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
  objc_msgSend(v6, "calendarURIs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "calendarURIs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "calendarURIs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarURIs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (!v8)
    goto LABEL_6;
LABEL_7:

  return v11;
}

- (void)ABValueFromCNValue:(id)a3
{
  return 0;
}

- (id)CNValueFromABValue:(void *)a3
{
  return 0;
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

- (void)ABValueForABPerson:(void *)a3
{
  return 0;
}

@end
