@implementation EMSectionedObjectID

void __47___EMSectionedObjectID_EFCacheable__cachedSelf__block_invoke()
{
  uint64_t v0;
  void *v1;

  cachedSelf_sTableLock_42 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
  v1 = (void *)cachedSelf_sUniqueObjectIDs_43;
  cachedSelf_sUniqueObjectIDs_43 = v0;

}

id __38___EMSectionedObjectID_initWithCoder___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v16.receiver = v2;
  v16.super_class = (Class)_EMSectionedObjectID;
  v4 = objc_msgSendSuper2(&v16, sel_initWithCoder_, v3);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_sectionID"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(void **)(a1 + 32);
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v11, CFSTR("EFPropertyKey_underlyingObjectID"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(v13 + 48);
    *(_QWORD *)(v13 + 48) = v12;

  }
  return v4;
}

void __40___EMSectionedObjectID_encodeWithCoder___block_invoke(uint64_t a1)
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
  objc_msgSend(*(id *)(a1 + 40), "underlyingObjectID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodeObject:forKey:");

}

@end
