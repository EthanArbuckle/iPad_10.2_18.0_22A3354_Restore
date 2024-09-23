@implementation DateMaskToCasedString

id __DateMaskToCasedString_block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*(_BYTE *)(a1 + 32))
    return a2;
  else
    return a3;
}

id __DateMaskToCasedString_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a4;
  v6 = v5;
  if (*(_BYTE *)(a1 + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

@end
