@implementation GKDateAsWhenString

void __GKDateAsWhenString_block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)GKDateAsWhenString___shortFormatter;
  GKDateAsWhenString___shortFormatter = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)GKDateAsWhenString___shortDayNameFormatter;
  GKDateAsWhenString___shortDayNameFormatter = (uint64_t)v2;

  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v5 = (void *)GKDateAsWhenString___longFormatter;
  GKDateAsWhenString___longFormatter = (uint64_t)v4;

  __GKDateAsWhenString_block_invoke_2();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0C99720], 0, 0, &__block_literal_global_45);

}

void __GKDateAsWhenString_block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)GKDateAsWhenString___shortFormatter;
  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("EEEEjmm"), 0, v6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setDateFormat:", v1);

  v2 = (void *)GKDateAsWhenString___shortDayNameFormatter;
  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("EEEjmm"), 0, v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDateFormat:", v3);

  v4 = (void *)GKDateAsWhenString___longFormatter;
  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("MMMdy"), 0, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDateFormat:", v5);

}

@end
