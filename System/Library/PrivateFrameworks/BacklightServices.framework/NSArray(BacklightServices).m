@implementation NSArray(BacklightServices)

- (uint64_t)bls_boundedDescription
{
  return objc_msgSend(a1, "bls_boundedDescriptionWithMax:transformer:", 4, &__block_literal_global_18);
}

- (uint64_t)bls_boundedDescriptionWithTransformer:()BacklightServices
{
  return objc_msgSend(a1, "bls_boundedDescriptionWithMax:transformer:", 4, a3);
}

- (uint64_t)bls_boundedDescriptionWithMax:()BacklightServices
{
  return objc_msgSend(a1, "bls_boundedDescriptionWithMax:transformer:", a3, &__block_literal_global_1_0);
}

- (id)bls_boundedDescriptionWithMax:()BacklightServices transformer:
{
  void (**v6)(id, void *);
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  unint64_t v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = objc_msgSend(a1, "count");
  v9 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __72__NSArray_BacklightServices__bls_boundedDescriptionWithMax_transformer___block_invoke;
  v26[3] = &unk_1E621B1A0;
  v10 = v7;
  v27 = v10;
  v28 = v8;
  objc_msgSend(v10, "appendProem:block:", 0, v26);
  v11 = a3 - 1;
  if (a3 >= 1)
  {
    if (v8 <= a3)
    {
      objc_msgSend(a1, "bs_mapNoNulls:", v6, v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "subarrayWithRange:", 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bs_mapNoNulls:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = CFSTR("...");
      objc_msgSend(a1, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = CFSTR("<NULL>");
      if (v15)
        v17 = (const __CFString *)v15;
      v29[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v23[0] = v9;
    v23[1] = 3221225472;
    v23[2] = __72__NSArray_BacklightServices__bls_boundedDescriptionWithMax_transformer___block_invoke_2;
    v23[3] = &unk_1E621A3B8;
    v24 = v19;
    v25 = v10;
    v20 = v19;
    objc_msgSend(v25, "appendBodySectionWithOpenDelimiter:closeDelimiter:block:", CFSTR(" {"), CFSTR("} "), v23);

  }
  objc_msgSend(v10, "description");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

@end
