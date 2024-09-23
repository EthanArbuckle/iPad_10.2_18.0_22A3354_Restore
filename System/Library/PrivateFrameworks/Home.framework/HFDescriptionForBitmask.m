@implementation HFDescriptionForBitmask

void __HFDescriptionForBitmask_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v7 = (id)v4;
  if (v4)
  {
    objc_msgSend(v5, "addObject:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%lu)"), a2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

@end
