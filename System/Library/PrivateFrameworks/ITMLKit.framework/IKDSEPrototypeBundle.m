@implementation IKDSEPrototypeBundle

uint64_t __49___IKDSEPrototypeBundle_prototypeForItemAtIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "range");
  v6 = objc_msgSend(v4, "range");

  if (v5 < v6)
    return -1;
  else
    return 1;
}

void __49___IKDSEPrototypeBundle_addPrototype_forIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;

  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "setRange:", a2, a3);
  objc_msgSend(v6, "setPrototypeIndex:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

@end
