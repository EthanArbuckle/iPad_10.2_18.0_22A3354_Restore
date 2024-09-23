@implementation AXMCachedDateFormatterForFormat

void ___AXMCachedDateFormatterForFormat_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("AXDateFormatter", 0);
  v1 = (void *)_AXMCachedDateFormatterForFormat_AXDateFormatterQueue;
  _AXMCachedDateFormatterForFormat_AXDateFormatterQueue = (uint64_t)v0;

}

void ___AXMCachedDateFormatterForFormat_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (AXMediaUtilitiesErrorDomain_block_invoke_onceToken != -1)
    dispatch_once(&AXMediaUtilitiesErrorDomain_block_invoke_onceToken, &__block_literal_global_59);
  objc_msgSend((id)AXMediaUtilitiesErrorDomain_block_invoke_DateFormatters, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3578]), "init");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = (void *)MEMORY[0x1E0CB3578];
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateFormatFromTemplate:options:locale:", v9, 0, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDateFormat:", v11);
    objc_msgSend((id)AXMediaUtilitiesErrorDomain_block_invoke_DateFormatters, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));

  }
}

void ___AXMCachedDateFormatterForFormat_block_invoke_3()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)AXMediaUtilitiesErrorDomain_block_invoke_DateFormatters;
  AXMediaUtilitiesErrorDomain_block_invoke_DateFormatters = (uint64_t)v0;

}

@end
