@implementation CNContactPolicyValidator

+ (BOOL)shouldIgnoreValidationCheckForProperty:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  char v7;

  v3 = shouldIgnoreValidationCheckForProperty__cn_once_token_0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&shouldIgnoreValidationCheckForProperty__cn_once_token_0, &__block_literal_global_130);
  v5 = (id)shouldIgnoreValidationCheckForProperty__cn_once_object_0;
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6);
  return v7;
}

void __67__CNContactPolicyValidator_shouldIgnoreValidationCheckForProperty___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x1E0C99E60];
  +[CN allImageDataProperties](CN, "allImageDataProperties");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_map:", &__block_literal_global_3_14);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)shouldIgnoreValidationCheckForProperty__cn_once_object_0;
  shouldIgnoreValidationCheckForProperty__cn_once_object_0 = v3;

}

uint64_t __67__CNContactPolicyValidator_shouldIgnoreValidationCheckForProperty___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

+ (id)contactFromContact:(id)a3 conformingToPolicy:(id)a4 options:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "contactFromContact:conformingToPolicy:options:valueToStringTransform:", a3, a4, a5, 0);
}

+ (id)contactFromContact:(id)a3 conformingToPolicy:(id)a4 options:(unint64_t)a5 valueToStringTransform:(id)a6
{
  char v7;
  id v10;
  id v11;
  id v12;
  CNMutableContact *v13;
  void *v14;
  void *v15;
  void *v16;
  CNMutableContact *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  int v23;
  uint64_t *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  id v37;
  char v38;
  BOOL v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if ((v7 & 8) != 0)
    objc_msgSend(v10, "identifier");
  else
    +[CNContact makeIdentifierString](CNContact, "makeIdentifierString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__32;
  v50 = __Block_byref_object_dispose__32;
  v51 = 0;
  if ((v7 & 4) != 0)
  {
    +[CNContactKeyVector keyVector](CNContactKeyVector, "keyVector");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keyVector");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "keyVectorByAddingKeysFromKeyVector:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = -[CNContact initWithIdentifier:availableKeyDescriptor:]([CNMutableContact alloc], "initWithIdentifier:availableKeyDescriptor:", v30, v14);
    v18 = (void *)v47[5];
    v47[5] = (uint64_t)v17;

  }
  else
  {
    v13 = -[CNContact initWithIdentifier:]([CNMutableContact alloc], "initWithIdentifier:", v30);
    v14 = (void *)v47[5];
    v47[5] = (uint64_t)v13;
  }

  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__32;
  v44 = __Block_byref_object_dispose__32;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v47[5], "keyVector");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __97__CNContactPolicyValidator_contactFromContact_conformingToPolicy_options_valueToStringTransform___block_invoke;
  v31[3] = &unk_1E29FDBC0;
  v20 = v10;
  v32 = v20;
  v37 = a1;
  v21 = v11;
  v33 = v21;
  v35 = &v46;
  v38 = v7 & 1;
  v39 = (v7 & 2) != 0;
  v22 = v12;
  v34 = v22;
  v36 = &v40;
  objc_msgSend(v19, "enumeratePropertiesUsingBlock:", v31);

  v23 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13850] + 16))();
  v24 = v47;
  if (v23 && v47[5])
  {
    objc_msgSend(v20, "valueForKey:", CFSTR("note"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_alloc(MEMORY[0x1E0CB3940]);
    v27 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("%@\n%@"), v25, v41[5]);
    objc_msgSend((id)v47[5], "setValue:forKey:", v27, CFSTR("note"));

    v24 = v47;
  }
  v28 = (id)v24[5];

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v28;
}

void __97__CNContactPolicyValidator_contactFromContact_conformingToPolicy_options_valueToStringTransform___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;

  v5 = a2;
  objc_msgSend(v5, "CNValueForContact:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(*(id *)(a1 + 72), "shouldIgnoreValidationCheckForProperty:", v5);
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v5, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v24 = 0;
    v11 = objc_msgSend(v8, "shouldSetValue:property:contact:replacementValue:", v6, v9, v10, &v24);
    v12 = v24;

    if ((v7 & 1) != 0 || v11)
    {
      v13 = v5;
      v14 = v6;
      goto LABEL_9;
    }
    if (v12 && *(_BYTE *)(a1 + 80))
    {
      v13 = v5;
      v14 = v12;
LABEL_9:
      objc_msgSend(v13, "valueWithResetIdentifiers:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCNValue:onContact:", v15, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(v5, "nilValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v16) & 1) != 0)
    {

    }
    else
    {
      v17 = *(unsigned __int8 *)(a1 + 81);

      if (v17)
      {
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v19 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = 0;

        *a3 = 1;
        goto LABEL_11;
      }
    }
    +[CN squashableContactCardPropertyKeys](CN, "squashableContactCardPropertyKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "key");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "containsKey:", v20))
    {

      goto LABEL_10;
    }
    v21 = *(_QWORD *)(a1 + 48);

    if (v21)
    {
      v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "appendString:", v23);

    }
  }
  else
  {
    v12 = 0;
  }
LABEL_11:

}

@end
