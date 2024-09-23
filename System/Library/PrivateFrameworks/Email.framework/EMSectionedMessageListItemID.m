@implementation EMSectionedMessageListItemID

void __56___EMSectionedMessageListItemID_EFCacheable__cachedSelf__block_invoke()
{
  uint64_t v0;
  void *v1;

  cachedSelf_sTableLock_3 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
  v1 = (void *)cachedSelf_sUniqueObjectIDs_3;
  cachedSelf_sUniqueObjectIDs_3 = v0;

}

id __47___EMSectionedMessageListItemID_initWithCoder___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = *(id *)(a1 + 32);
  v14.super_class = (Class)_EMSectionedMessageListItemID;
  v2 = objc_msgSendSuper2(&v14, sel_init);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_sectionID"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v6 = *(void **)(a1 + 40);
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v9, CFSTR("EFPropertyKey_underlyingItemID"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 16);
    *(_QWORD *)(v11 + 16) = v10;

  }
  return v2;
}

void __49___EMSectionedMessageListItemID_encodeWithCoder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sectionID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "encodeObject:forKey:");

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "underlyingItemID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodeObject:forKey:");

}

@end
