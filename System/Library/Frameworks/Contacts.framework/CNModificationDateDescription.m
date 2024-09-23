@implementation CNModificationDateDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setModificationDate:", a3);
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "modificationDate");
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF6110];
  return a3 != 0;
}

- (CNModificationDateDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("modificationDate"), sel_modificationDate, sel_setModificationDate_);
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return 1;
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 30), CFSTR("_modificationDate"));
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
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_modificationDate"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v9, "copy");
  v8 = (void *)v5[30];
  v5[30] = v7;

}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return +[CNiOSABConversions dateFromABBytes:length:](CNiOSABConversions, "dateFromABBytes:length:", a3, a4);
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

@end
