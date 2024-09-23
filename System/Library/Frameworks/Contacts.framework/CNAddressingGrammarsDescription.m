@implementation CNAddressingGrammarsDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 18), CFSTR("_addressingGrammars"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setAddressingGrammars:", a3);
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "addressingGrammars");
}

- (CNAddressingGrammarsDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("addressingGrammars"), sel_addressingGrammars, sel_setAddressingGrammars_);
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

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("_addressingGrammars"), v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)v6[18];
  v6[18] = v10;

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
  objc_msgSend(v6, "addressingGrammars");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "addressingGrammars");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "addressingGrammars");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addressingGrammars");
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
  return objc_msgSend(a3, "isEqual:", a4);
}

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

- (id)plistTransform
{
  return +[CN addressingGrammarToStringTransform](CN, "addressingGrammarToStringTransform");
}

- (id)fromPlistTransform
{
  return +[CN addressingGrammarFromStringTransform](CN, "addressingGrammarFromStringTransform");
}

- (id)CNLabeledValueValueFromABMultiValueValueBytes:(char *)a3 length:(unint64_t)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3, a4, 4);
    objc_msgSend(MEMORY[0x1E0D13A28], "decryptAddressingGrammarString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)applyCNValue:(id)a3 toArray:(id)a4 identifier:(id)a5 legacyIdentifier:(int)a6 label:(id)a7
{
  objc_super v8;

  if (!a3)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)CNAddressingGrammarsDescription;
  return -[CNMultiValuePropertyDescription applyCNValue:toArray:identifier:legacyIdentifier:label:](&v8, sel_applyCNValue_toArray_identifier_legacyIdentifier_label_, a3, a4, a5, *(_QWORD *)&a6, a7);
}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3
{
  CFTypeID v4;
  void *v5;

  if (a3)
  {
    v4 = CFGetTypeID(a3);
    if (v4 == CFStringGetTypeID())
    {
      objc_msgSend(MEMORY[0x1E0D13A28], "decryptAddressingGrammarString:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0D13A28], "encryptAddressingGrammarAsString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
