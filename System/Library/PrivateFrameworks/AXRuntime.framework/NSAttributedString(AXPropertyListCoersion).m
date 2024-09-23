@implementation NSAttributedString(AXPropertyListCoersion)

- (id)_axRecursivelyPropertyListCoercedRepresentationWithError:()AXPropertyListCoersion
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v6 = objc_msgSend(a1, "length");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __103__NSAttributedString_AXPropertyListCoersion___axRecursivelyPropertyListCoercedRepresentationWithError___block_invoke;
  v12[3] = &unk_1E691A120;
  v14 = &v15;
  v7 = v5;
  v13 = v7;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v12);
  v8 = (void *)v16[5];
  if (v8)
  {
    v9 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }
  else
  {
    v21[0] = CFSTR("String");
    objc_msgSend(a1, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    v22[1] = v7;
    v21[1] = CFSTR("Attrl");
    v21[2] = CFSTR("SmugType");
    v22[2] = AXSerializeSmuggledTypeAttributedString;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (uint64_t)_axRecursivelyReconstitutedRepresentationFromPropertyListWithError:()AXPropertyListCoersion
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 1, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

@end
