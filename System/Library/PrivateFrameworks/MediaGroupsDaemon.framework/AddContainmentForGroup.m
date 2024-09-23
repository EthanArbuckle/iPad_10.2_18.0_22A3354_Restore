@implementation AddContainmentForGroup

void ___AddContainmentForGroup_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  *a4 = v6;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayByAddingObject:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _AddContainmentForGroup(v8, v9, v12, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

    }
  }

}

@end
