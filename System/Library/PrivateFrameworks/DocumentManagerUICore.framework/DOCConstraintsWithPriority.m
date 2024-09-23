@implementation DOCConstraintsWithPriority

void __DOCConstraintsWithPriority_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  double v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_DWORD *)(a1 + 40);
  v5 = a2;
  LODWORD(v4) = v3;
  objc_msgSend(v5, "setPriority:", v4);
  objc_msgSend(v2, "addObject:", v5);

}

@end
