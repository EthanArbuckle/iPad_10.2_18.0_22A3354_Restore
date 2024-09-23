@implementation NSMutableAttributedString

uint64_t __82__NSMutableAttributedString_CRTT__cr_replaceStorageInRange_withStorage_fromRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", a2, a3 - *(_QWORD *)(a1 + 40) + *(_QWORD *)(a1 + 56), a4);
}

void __83__NSMutableAttributedString_CRTT__cr_mergeAttributesInRange_withStorage_fromRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;

  v13 = a2;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("_ts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40) + a3;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83__NSMutableAttributedString_CRTT__cr_mergeAttributesInRange_withStorage_fromRange___block_invoke_2;
    v14[3] = &unk_1E775E378;
    v11 = v7;
    v12 = *(_QWORD *)(a1 + 32);
    v15 = v11;
    v16 = v12;
    v17 = v13;
    objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("_ts"), v10, a4, 0x100000, v14);

  }
}

void __83__NSMutableAttributedString_CRTT__cr_mergeAttributesInRange_withStorage_fromRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  v7 = a2;
  if (!v7 || objc_msgSend(*(id *)(a1 + 32), "isGreaterThanTimestamp:", v7))
    objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", *(_QWORD *)(a1 + 48), a3, a4);

}

@end
