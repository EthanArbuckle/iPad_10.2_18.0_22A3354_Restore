@implementation CNContactFlagsDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v9 = v5;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v9;
    else
      v7 = 0;
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v6, "setFlags:", objc_msgSend(v8, "CNContactFlagsValue"));
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "flags"));
}

- (CNContactFlagsDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("iOSLegacyIdentifier"), sel_flags, sel_setFlags_);
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeInteger:forKey:", *((_QWORD *)a4 + 3), CFSTR("_flags"));
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  _QWORD *v5;

  v5 = a4;
  v5[3] = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_flags"));

}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return *((_QWORD *)a3 + 3) == *((_QWORD *)a4 + 3);
}

- (BOOL)isEqualIgnoringIdentifiersForContact:(id)a3 other:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a4;
  v6 = objc_msgSend(a3, "flags");
  v7 = objc_msgSend(v5, "flags");

  return v6 == v7;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end
