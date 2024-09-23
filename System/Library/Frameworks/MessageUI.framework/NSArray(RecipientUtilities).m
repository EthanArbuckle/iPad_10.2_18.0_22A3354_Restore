@implementation NSArray(RecipientUtilities)

- (id)mf_commaSeparatedRecipientListWithWidth:()RecipientUtilities forFont:
{
  objc_msgSend(a1, "mf_commaSeparatedRecipientListWithWidth:forFont:usingBlock:", a3, &__block_literal_global_30);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mf_commaSeparatedRecipientListWithWidth:()RecipientUtilities forFont:usingBlock:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  double v19;
  _QWORD v20[5];
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = objc_msgSend(a1, "count");
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__NSArray_RecipientUtilities__mf_commaSeparatedRecipientListWithWidth_forFont_usingBlock___block_invoke;
  v20[3] = &unk_1E5A69AD0;
  v13 = v9;
  v20[4] = a1;
  v21 = v13;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __90__NSArray_RecipientUtilities__mf_commaSeparatedRecipientListWithWidth_forFont_usingBlock___block_invoke_2;
  v17[3] = &unk_1E5A66188;
  v14 = v8;
  v18 = v14;
  v19 = a2;
  objc_msgSend(v10, "mf_commaSeparatedRecipientListWithRecipientCount:prefixForRecipientAtIndex:stringForRecipientAtIndex:lengthValidationBlock:", v11, 0, v20, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (uint64_t)mf_indexOfRecipientWithEmailAddress:()RecipientUtilities
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__NSArray_RecipientUtilities__mf_indexOfRecipientWithEmailAddress___block_invoke;
  v8[3] = &unk_1E5A69AF8;
  v9 = v4;
  v10 = &v11;
  v5 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end
