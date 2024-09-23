@implementation IXFilterDictionaryForClass

void __IXFilterDictionaryForClass_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
    v6 = objc_opt_isKindOfClass() ^ 1;
  else
    v6 = 0;
  if (*(_QWORD *)(a1 + 48))
    v7 = objc_opt_isKindOfClass() ^ 1;
  else
    v7 = 0;
  if (((v6 | v7) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v8);

}

@end
