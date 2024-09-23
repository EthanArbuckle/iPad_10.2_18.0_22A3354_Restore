@implementation CNContactTypeDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setContactType:", objc_msgSend(a3, "integerValue"));

}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return -[CNContactTypeDescription CNValueFromABValue:](self, "CNValueFromABValue:", +[CNiOSABConversions numberFromIntegerABBytes:length:](CNiOSABConversions, "numberFromIntegerABBytes:length:", a3, a4));
}

- (id)CNValueFromABValue:(void *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CF60A8] == (_QWORD)a3);
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF60B8];
  return a3 != 0;
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeInteger:forKey:", *((_QWORD *)a4 + 44), CFSTR("_contactType"));
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "contactType"));
}

- (CNContactTypeDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("contactType"), sel_contactType, sel_setContactType_);
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  _QWORD *v5;

  v5 = a4;
  v5[44] = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_contactType"));

}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return *((_QWORD *)a3 + 44) == *((_QWORD *)a4 + 44);
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)nilValue
{
  return &unk_1E2A3FF78;
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNContactTypeDescription;
  if (!-[CNPropertyDescription isValidValue:error:](&v13, sel_isValidValue_error_, v6, a4))
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v7 = objc_msgSend(v6, "integerValue");
  v8 = 1;
  if (v6 && v7 >= 2)
  {
    if (a4)
    {
      v15 = CFSTR("CNKeyPaths");
      -[CNPropertyDescription key](self, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 302, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_6;
  }
LABEL_7:

  return v8;
}

- (void)ABValueFromCNValue:(id)a3
{
  uint64_t v3;
  void **v4;

  v3 = objc_msgSend(a3, "integerValue");
  v4 = (void **)MEMORY[0x1E0CF60A8];
  if (v3 != 1)
    v4 = (void **)MEMORY[0x1E0CF60B0];
  return *v4;
}

@end
