@implementation UIMenu

uint64_t __72__UIMenu_ChatKit__ck_indexOfMenuWithMenuIdentifier_inMenuElementsArray___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

    *a4 = v8;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
