@implementation MAensureExtension

uint64_t ___MAensureExtension_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void ___MAensureExtension_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
}

@end
