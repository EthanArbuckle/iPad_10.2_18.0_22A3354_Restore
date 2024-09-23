@implementation NSDictionary

void __39__NSDictionary_FMAdditions__fm_filter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

void __58__NSDictionary_FMAdditions__fm_dictionaryByMappingValues___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);

}

@end
