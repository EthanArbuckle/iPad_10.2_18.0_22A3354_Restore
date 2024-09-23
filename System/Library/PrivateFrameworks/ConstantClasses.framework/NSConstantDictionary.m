@implementation NSConstantDictionary

uint64_t __54___NSConstantDictionary_descriptionWithLocale_indent___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(a2, "descriptionWithLocale:indent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64) + 1);
  else
    v5 = objc_msgSend(a2, "description");
  v6 = v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v4, "descriptionWithLocale:indent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64) + 1);
  else
    v7 = objc_msgSend(v4, "description");
  return objc_msgSend(*(id *)(a1 + 48), "appendFormat:", CFSTR("%@%@ = %@,\n"), *(_QWORD *)(a1 + 56), v6, v7);
}

@end
