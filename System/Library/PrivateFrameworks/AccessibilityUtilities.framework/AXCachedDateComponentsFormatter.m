@implementation AXCachedDateComponentsFormatter

void ___AXCachedDateComponentsFormatter_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (_block_invoke_2_twiceToken != -1)
    dispatch_once(&_block_invoke_2_twiceToken, &__block_literal_global_45);
  v2 = (void *)_block_invoke_2_DateFormatters;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v7 = objc_opt_new();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setZeroFormattingBehavior:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setUnitsStyle:", 4);
    if (*(_BYTE *)(a1 + 40))
      v10 = 224;
    else
      v10 = 96;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setAllowedUnits:", v10);
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v12 = (void *)_block_invoke_2_DateFormatters;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  }
}

void ___AXCachedDateComponentsFormatter_block_invoke_3()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_block_invoke_2_DateFormatters;
  _block_invoke_2_DateFormatters = (uint64_t)v0;

}

void ___AXCachedDateComponentsFormatter_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("AXDateComponentsFormatter", 0);
  v1 = (void *)_AXCachedDateComponentsFormatter_AXDateComponentsFormatterQueue;
  _AXCachedDateComponentsFormatter_AXDateComponentsFormatterQueue = (uint64_t)v0;

}

@end
