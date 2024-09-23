@implementation EMSpecialMailboxScope

void __42___EMSpecialMailboxScope_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  objc_super v5;

  v2 = *(_QWORD *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)_EMSpecialMailboxScope;
  objc_msgSendSuper2(&v5, sel_encodeWithCoder_, v2);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_identifier"));

}

void __49___EMSpecialMailboxScope_EFCacheable__cachedSelf__block_invoke()
{
  uint64_t v0;
  void *v1;

  cachedSelf_sTableLock_49 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
  v1 = (void *)cachedSelf_sUniqueObjectIDs_50;
  cachedSelf_sUniqueObjectIDs_50 = v0;

}

id __40___EMSpecialMailboxScope_initWithCoder___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v9.receiver = v2;
  v9.super_class = (Class)_EMSpecialMailboxScope;
  v4 = objc_msgSendSuper2(&v9, sel_initWithCoder_, v3);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_identifier"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  return v4;
}

@end
