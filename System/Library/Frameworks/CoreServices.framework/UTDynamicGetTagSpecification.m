@implementation UTDynamicGetTagSpecification

void ___UTDynamicGetTagSpecification_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", *(_QWORD *)a3, *(unsigned int *)(a3 + 8), 4);
  if (v11)
  {
    v14 = v11;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v12, v14);
    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", *(_QWORD *)a5, *(unsigned int *)(a5 + 8), 4);
    if (v13)
      objc_msgSend(v12, "addObject:", v13);

    v11 = v14;
  }

}

@end
