@implementation CNAddressingGrammarsEncryptedDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setAddressingGrammarsEncrypted:", a3);
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "addressingGrammarsEncrypted");
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF5EE8];
  return a3 != 0;
}

- (CNAddressingGrammarsEncryptedDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("addressingGrammarsEncrypted"), sel_addressingGrammarsEncrypted, sel_setAddressingGrammarsEncrypted_);
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
  objc_msgSend(v6, "addressingGrammarsEncrypted");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "addressingGrammarsEncrypted");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "addressingGrammarsEncrypted");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addressingGrammarsEncrypted");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (!v8)
    goto LABEL_6;
LABEL_7:

  return v11;
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 19), CFSTR("_addressingGrammarsEncrypted"));
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

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("_addressingGrammarsEncrypted"), v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)v6[19];
  v6[19] = v10;

}

- (BOOL)isNonnull
{
  return 1;
}

- (id)equivalentLabelSets
{
  if (equivalentLabelSets_cn_once_token_0 != -1)
    dispatch_once(&equivalentLabelSets_cn_once_token_0, &__block_literal_global_24);
  return (id)equivalentLabelSets_cn_once_object_0;
}

void __63__CNAddressingGrammarsEncryptedDescription_equivalentLabelSets__block_invoke()
{
  void *v0;

  v0 = (void *)equivalentLabelSets_cn_once_object_0;
  equivalentLabelSets_cn_once_object_0 = MEMORY[0x1E0C9AA60];

}

- (id)standardLabels
{
  if (standardLabels_cn_once_token_1 != -1)
    dispatch_once(&standardLabels_cn_once_token_1, &__block_literal_global_219);
  return (id)standardLabels_cn_once_object_1;
}

void __58__CNAddressingGrammarsEncryptedDescription_standardLabels__block_invoke()
{
  void *v0;

  v0 = (void *)standardLabels_cn_once_object_1;
  standardLabels_cn_once_object_1 = MEMORY[0x1E0C9AA60];

}

- (id)stringForIndexingForContact:(id)a3
{
  return 0;
}

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

@end
