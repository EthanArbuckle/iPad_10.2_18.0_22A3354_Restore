@implementation NPRemoveEmojis

void ___NPRemoveEmojis_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v11);

}

@end
