@implementation NSSet

id __44__NSSet_CRKAdditions__crk_filterUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  unsigned int (*v3)(uint64_t, id);
  id v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned int (**)(uint64_t, id))(v2 + 16);
  v4 = a2;
  if (v3(v2, v4))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

@end
