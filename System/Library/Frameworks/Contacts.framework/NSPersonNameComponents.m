@implementation NSPersonNameComponents

void __64__NSPersonNameComponents_ContactsPrivate__componentsForContact___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSPersonNameComponents keyPathMapping]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v11, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v6, "isKeyAvailable:", v7);

    if ((_DWORD)v6)
    {
      objc_msgSend(v11, "CNValueForContact:", *(_QWORD *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
LABEL_9:

        goto LABEL_10;
      }
      +[CN allPhoneticNameComponentProperties](CN, "allPhoneticNameComponentProperties");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "containsObject:", v11))
      {
        objc_msgSend(*(id *)(a1 + 40), "phoneticRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
LABEL_8:
          objc_msgSend(*(id *)(a1 + 40), "setValue:forKeyPath:", v8, v5);
          goto LABEL_9;
        }
        v9 = objc_alloc_init(MEMORY[0x1E0CB3850]);
        objc_msgSend(*(id *)(a1 + 40), "setPhoneticRepresentation:", v9);
      }

      goto LABEL_8;
    }
  }
LABEL_10:

}

+ (id)keyPathMapping
{
  objc_opt_self();
  if (keyPathMapping_cn_once_token_1 != -1)
    dispatch_once(&keyPathMapping_cn_once_token_1, &__block_literal_global_148);
  return (id)keyPathMapping_cn_once_object_1;
}

void __57__NSPersonNameComponents_ContactsPrivate__keyPathMapping__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[9];
  _QWORD v12[10];

  v12[9] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB3018];
  v11[0] = CFSTR("namePrefix");
  v11[1] = CFSTR("givenName");
  v1 = *MEMORY[0x1E0CB3000];
  v12[0] = v0;
  v12[1] = v1;
  v2 = *MEMORY[0x1E0CB3008];
  v11[2] = CFSTR("middleName");
  v11[3] = CFSTR("familyName");
  v3 = *MEMORY[0x1E0CB2FF8];
  v12[2] = v2;
  v12[3] = v3;
  v4 = *MEMORY[0x1E0CB3020];
  v11[4] = CFSTR("nameSuffix");
  v11[5] = CFSTR("nickname");
  v5 = *MEMORY[0x1E0CB3010];
  v12[4] = v4;
  v12[5] = v5;
  v6 = *MEMORY[0x1E0CB3C50];
  v11[6] = CFSTR("phoneticGivenName");
  v11[7] = CFSTR("phoneticMiddleName");
  v7 = *MEMORY[0x1E0CB3C58];
  v12[6] = v6;
  v12[7] = v7;
  v11[8] = CFSTR("phoneticFamilyName");
  v12[8] = *MEMORY[0x1E0CB3C48];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)keyPathMapping_cn_once_object_1;
  keyPathMapping_cn_once_object_1 = v9;

}

void __64__NSPersonNameComponents_ContactsPrivate__descriptorForUsedKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[NSPersonNameComponents keyPathMapping]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAggregateKeyDescriptor keyDescriptorWithKeyDescriptors:description:](CNAggregateKeyDescriptor, "keyDescriptorWithKeyDescriptors:description:", v0, CFSTR("Person name components"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)descriptorForUsedKeys_cn_once_object_0;
  descriptorForUsedKeys_cn_once_object_0 = v2;

}

void __71__NSPersonNameComponents_ContactsPrivate__overrideComponentsInContact___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSPersonNameComponents keyPathMapping]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v9, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v6, "isKeyAvailable:", v7);

    if ((_DWORD)v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "valueForKeyPath:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCNValue:onContact:", v8, *(_QWORD *)(a1 + 32));

    }
  }

}

+ (id)keyVectorForUsedKeys
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__NSPersonNameComponents_ContactsInternal__keyVectorForUsedKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (keyVectorForUsedKeys_cn_once_token_2 != -1)
    dispatch_once(&keyVectorForUsedKeys_cn_once_token_2, block);
  return (id)keyVectorForUsedKeys_cn_once_object_2;
}

void __64__NSPersonNameComponents_ContactsInternal__keyVectorForUsedKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[NSPersonNameComponents keyPathMapping]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)keyVectorForUsedKeys_cn_once_object_2;
  keyVectorForUsedKeys_cn_once_object_2 = v2;

}

@end
